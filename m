Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id k130sm2748806wmg.9.2018.02.23.07.46.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Feb 2018 07:46:16 -0800 (PST)
Received: from zen.linaroharston (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTP id 2AB873E0427;
	Fri, 23 Feb 2018 15:46:14 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org,
	richard.henderson@linaro.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [PATCH v1 4/8] new contrib/generate_all.sh: batch risugen script
Date: Fri, 23 Feb 2018 15:46:09 +0000
Message-Id: <20180223154613.2096-5-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.15.1
In-Reply-To: <20180223154613.2096-1-alex.bennee@linaro.org>
References: <20180223154613.2096-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: djNPNSMaKOB/

This is a simple script for generating all instructions in a given
RISU file. You can split up the batch size by passing a -n N command
line options. For example:

  ./contrib/generate_all.sh -n 2 hp.risu testcases.armv8.2_hp

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 contrib/generate_all.sh | 96 +++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 96 insertions(+)
 create mode 100755 contrib/generate_all.sh

diff --git a/contrib/generate_all.sh b/contrib/generate_all.sh
new file mode 100755
index 0000000..1e6b847
--- /dev/null
+++ b/contrib/generate_all.sh
@@ -0,0 +1,96 @@
+#!/bin/bash
+#
+# Generate all patterns in a given RISU file
+#
+# Copyright (c) 2017 Linaro Limited
+# All rights reserved. This program and the accompanying materials
+# are made available under the terms of the Eclipse Public License v1.0
+# which accompanies this distribution, and is available at
+# http://www.eclipse.org/legal/epl-v10.html
+#
+# Contributors:
+#     Alex Bennée <alex.bennee@linaro.org> - initial implementation
+#
+# Usage:
+#   ./contrib/generate_all.sh <arch.risu> <target directory>
+
+set -e
+
+USAGE="Usage: `basename $0` [-h] [-n x] <risufile> <target dir>"
+SPLIT=4
+RISUGEN=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd -P)/risugen
+
+# Parse command line options.
+while getopts hn: OPT; do
+    case "$OPT" in
+        h)
+            echo $USAGE
+            exit 0
+            ;;
+        n)
+            SPLIT=$OPTARG
+            ;;
+        \?)
+            # getopts issues an error message
+            echo $USAGE >&2
+            exit 1
+            ;;
+    esac
+done
+
+# Remove the switches we parsed above.
+shift `expr $OPTIND - 1`
+
+while [ $# -ne 0 ]; do
+
+    if [ -f $1 ]; then
+        RISU_FILE=$1;
+    elif [ -d $1 ]; then
+        TARGET_DIR=$1;
+    elif [ ! -e $1 ]; then
+        TARGET_DIR=$1
+    fi
+
+    shift
+done
+
+if test -z "${RISUGEN}" || test ! -x "${RISUGEN}";  then
+    echo "Couldn't find risugen (${RISUGEN})"
+    exit 1
+fi
+
+if [ -z "$RISU_FILE" ]; then
+    echo "Need to set a .risu file for patterns"
+    exit 1
+fi
+
+if [ -z "${TARGET_DIR}" ]; then
+    echo "Need to set a TARGET_DIR"
+    exit 1
+fi
+
+
+mkdir -p ${TARGET_DIR}
+
+ALL_INSNS=$(cat ${RISU_FILE} | ag "^\w" | cut -f 1 -d " " | sort)
+COUNT=$(cat ${RISU_FILE=} | ag "^\w" | cut -f 1 -d " " | wc -l)
+set -- $ALL_INSNS
+
+GROUP=$((COUNT / ${SPLIT}))
+
+while test $# -gt 0 ; do
+    INSN_PATTERNS=""
+    I_FILE="${TARGET_DIR}/insn_"
+    for i in `seq 1 ${SPLIT}`; do
+        I=$1
+        if test -n "${I}"; then
+            shift
+            INSN_PATTERNS="${INSN_PATTERNS} --pattern ${I}"
+            I_FILE="${I_FILE}${I}_"
+        fi
+    done
+    I_FILE="${I_FILE}_INC.risu.bin"
+    CMD="${RISUGEN} ${INSN_PATTERNS} ${RISU_FILE} ${I_FILE}"
+    echo "Running: $CMD"
+    $CMD
+done
-- 
2.15.1
