Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id p13sm17072753wrt.89.2021.06.21.08.21.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Jun 2021 08:21:23 -0700 (PDT)
Received: from zen.lan (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id AE3A71FF8C;
	Mon, 21 Jun 2021 16:21:20 +0100 (BST)
From: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel@nongnu.org
Cc: thuth@redhat.com,
	pbonzini@redhat.com,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH  v1 2/5] hw/arm: add dependency on OR_IRQ for XLNX_VERSAL
Date: Mon, 21 Jun 2021 16:21:17 +0100
Message-Id: <20210621152120.4465-3-alex.bennee@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20210621152120.4465-1-alex.bennee@linaro.org>
References: <20210621152120.4465-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 9IXU4aVKxAUH

We need this functionality due to:

    /* XRAM IRQs get ORed into a single line.  */
    object_initialize_child(OBJECT(s), "xram-irq-orgate",
                            &s->lpd.xram.irq_orgate, TYPE_OR_IRQ);

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
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
