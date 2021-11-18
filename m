Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id y142sm458082wmc.40.2021.11.18.10.46.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Nov 2021 10:47:04 -0800 (PST)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 8504A1FFA5;
	Thu, 18 Nov 2021 18:46:50 +0000 (GMT)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: kvm@vger.kernel.org
Cc: idan.horowitz@gmail.com,
	qemu-arm@nongnu.org,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.cs.columbia.edu,
	christoffer.dall@arm.com,
	maz@kernel.org,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
Subject: [kvm-unit-tests PATCH v8 09/10] arm/run: use separate --accel form
Date: Thu, 18 Nov 2021 18:46:49 +0000
Message-Id: <20211118184650.661575-10-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211118184650.661575-1-alex.bennee@linaro.org>
References: <20211118184650.661575-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: CPSO6gwmLita

This will allow TCG tests to alter things such as tb-size.

Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
---
 arm/run | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arm/run b/arm/run
index a390ca5..73c6c83 100755
--- a/arm/run
+++ b/arm/run
@@ -58,8 +58,8 @@ if $qemu $M -device '?' 2>&1 | grep pci-testdev > /dev/null; then
 	pci_testdev="-device pci-testdev"
 fi
 
-M+=",accel=$ACCEL"
-command="$qemu -nodefaults $M -cpu $processor $chr_testdev $pci_testdev"
+A="-accel $ACCEL"
+command="$qemu -nodefaults $M $A -cpu $processor $chr_testdev $pci_testdev"
 command+=" -display none -serial stdio -kernel"
 command="$(migration_cmd) $(timeout_cmd) $command"
 
-- 
2.30.2
