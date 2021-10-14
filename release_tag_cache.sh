BRANCH="$(git rev-parse --abbrev-ref HEAD)"
VERSION="${BRANCH}"
RELEASE=""
CACHETO=""
CACHEFROM="cache-dev"
IFS=',' read -ra branch <<< "${LATEST_BRANCHES}"
for b in "${branch[@]}"; do
    echo "Is $b a match for ${BRANCH}"
    if [[ "${BRANCH}" == $b ]]
    then
        VERSION="$TAG"
        RELEASE='latest'
        CACHETO='cache'
        CACHEFROM='cache'
        break
    fi
done

IFS=',' read -ra devbranch <<< "${DEV_BRANCHES}"
for b in "${devbranch[@]}"; do
    echo "Is $b a match for ${BRANCH}"
    if [[ "${BRANCH}" == $b ]]
    then
        CACHETO='cache-dev'
        CACHEFROM='cache-dev'
    fi
done

echo "Version: ${VERSION}, Release: ${RELEASE}, CACHETO: ${CACHETO}, CACHEFROM: ${CACHEFROM}"
echo ::set-output name=release::"${RELEASE}"
echo ::set-output name=version::"${VERSION}"
echo ::set-output name=cacheto::"${CACHETO}"
echo ::set-output name=cachefrom::"${CACHEFROM}"
    