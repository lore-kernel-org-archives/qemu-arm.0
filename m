Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id p9sm18679352wmm.17.2021.07.07.06.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jul 2021 06:17:47 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id A92FC1FF8C;
	Wed,  7 Jul 2021 14:17:44 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org,
	pbonzini@redhat.com
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	"Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Thomas Huth <thuth@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v2 2/5] hw/arm: add dependency on OR_IRQ for XLNX_VERSAL
Date: Wed,  7 Jul 2021 14:17:41 +0100
Message-Id: <20210707131744.26027-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210707131744.26027-1-alex.bennee@linaro.org>
References: <20210707131744.26027-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: g4BJAvDp8tqW

We need this functionality due to:

    /* XRAM IRQs get ORed into a single line.  */
    object_initialize_child(OBJECT(s), "xram-irq-orgate",
                            &s->lpd.xram.irq_orgate, TYPE_OR_IRQ);

Fixes: a55b441b2ca ("hw/arm: versal: Add support for the XRAMs")
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
Reviewed-by: Thomas Huth <thuth@redhat.com>
Message-Id: <20210621152120.4465-3-alex.bennee@linaro.org>
---
 hw/arm/Kconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
index 647b5c8b43..528f71bb9d 100644
--- a/hw/arm/Kconfig
+++ b/hw/arm/Kconfig
@@ -368,6 +368,7 @@ config XLNX_VERSAL
     select UNIMP
     select XLNX_ZDMA
     select XLNX_ZYNQMP
+    select OR_IRQ
 
 config NPCM7XX
     bool
-- 
2.20.1
