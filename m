Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id f133-v6sm3354572wme.42.2018.06.13.06.04.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Jun 2018 06:04:49 -0700 (PDT)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id C41C83E1270;
	Wed, 13 Jun 2018 13:56:01 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [RISU PATCH v3 12/22] contrib/generate_all.sh: allow passing of arguments to risugen
Date: Wed, 13 Jun 2018 13:55:51 +0100
Message-Id: <20180613125601.14371-13-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180613125601.14371-1-alex.bennee@linaro.org>
References: <20180613125601.14371-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: ZweL7MQtGBJC

This allows us to use any new risugen options when generating all our
test patterns.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/generate_all.sh | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/contrib/generate_all.sh b/contrib/generate_all.sh
index 1e6b847..651cb23 100755
--- a/contrib/generate_all.sh
+++ b/contrib/generate_all.sh
@@ -12,11 +12,11 @@
 #     Alex Bennée <alex.bennee@linaro.org> - initial implementation
 #
 # Usage:
-#   ./contrib/generate_all.sh <arch.risu> <target directory>
+#   ./contrib/generate_all.sh <arch.risu> <target directory> -- risugen args
 
 set -e
 
-USAGE="Usage: `basename $0` [-h] [-n x] <risufile> <target dir>"
+USAGE="Usage: `basename $0` [-h] [-n x] <risufile> <target dir> -- [risugen args]"
 SPLIT=4
 RISUGEN=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd -P)/risugen
 
@@ -41,18 +41,24 @@ done
 # Remove the switches we parsed above.
 shift `expr $OPTIND - 1`
 
-while [ $# -ne 0 ]; do
+# Parse up to and including any --
+RISUGEN_ARGS=""
+while [ $# -ne 0 ] && [ -z "$RISUGEN_ARGS" ]; do
 
     if [ -f $1 ]; then
         RISU_FILE=$1;
     elif [ -d $1 ]; then
         TARGET_DIR=$1;
+    elif [ "$1" = "--" ]; then
+        RISUGEN_ARGS=$1
     elif [ ! -e $1 ]; then
         TARGET_DIR=$1
     fi
 
     shift
 done
+# anything left is for RISUGEN
+RISUGEN_ARGS=$@
 
 if test -z "${RISUGEN}" || test ! -x "${RISUGEN}";  then
     echo "Couldn't find risugen (${RISUGEN})"
@@ -90,7 +96,7 @@ while test $# -gt 0 ; do
         fi
     done
     I_FILE="${I_FILE}_INC.risu.bin"
-    CMD="${RISUGEN} ${INSN_PATTERNS} ${RISU_FILE} ${I_FILE}"
+    CMD="${RISUGEN} ${RISUGEN_ARGS} ${INSN_PATTERNS} ${RISU_FILE} ${I_FILE}"
     echo "Running: $CMD"
     $CMD
 done
-- 
2.17.1
