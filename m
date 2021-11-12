Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id z7sm11185426wmi.33.2021.11.12.03.47.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Nov 2021 03:47:36 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8615C1FF9A;
	Fri, 12 Nov 2021 11:47:34 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: kvm@vger.kernel.org
Cc: shashi.mallela@linaro.org,
	alexandru.elisei@arm.com,
	eric.auger@redhat.com,
	qemu-arm@nongnu.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu,
	christoffer.dall@arm.com,
	maz@kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [kvm-unit-tests PATCH v3 3/3] arch-run: do not process ERRATA when running under TCG
Date: Fri, 12 Nov 2021 11:47:34 +0000
Message-Id: <20211112114734.3058678-4-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211112114734.3058678-1-alex.bennee@linaro.org>
References: <20211112114734.3058678-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: Nq00K0RdeqTS

All the errata checking looks at the current host kernel version. For
TCG runs this is entirely irrelevant as the host kernel has no impact
on the behaviour of the guest. In fact we should set ERRATA_FORCE to
ensure we run those tests as QEMU doesn't attempt to model
non-confirming architectures.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 scripts/arch-run.bash | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/scripts/arch-run.bash b/scripts/arch-run.bash
index 43da998..f1f4456 100644
--- a/scripts/arch-run.bash
+++ b/scripts/arch-run.bash
@@ -267,7 +267,9 @@ env_file ()
 
 env_errata ()
 {
-	if [ "$ERRATATXT" ] && [ ! -f "$ERRATATXT" ]; then
+	if [ "$ACCEL" = "tcg" ]; then
+		eval export "ERRATA_FORCE=y"
+	elif [ "$ERRATATXT" ] && [ ! -f "$ERRATATXT" ]; then
 		echo "$ERRATATXT not found. (ERRATATXT=$ERRATATXT)" >&2
 		return 2
 	elif [ "$ERRATATXT" ]; then
-- 
2.30.2
