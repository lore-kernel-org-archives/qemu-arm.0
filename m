Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A653C83F0F
	for <qemu-arm@archiver.kernel.org>; Tue,  8 Jul 2025 21:19:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uZFGt-0001Sw-9V; Tue, 08 Jul 2025 16:50:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZE0B-0000wi-6P
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:29:29 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uZE02-0002fl-As
 for qemu-arm@nongnu.org; Tue, 08 Jul 2025 15:29:08 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-32f1aaf0d60so40115581fa.1
 for <qemu-arm@nongnu.org>; Tue, 08 Jul 2025 12:29:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752002942; x=1752607742; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GHvIfEToA34AUrJx/MLc8GOT8YL8A2v7KBo+787ye5o=;
 b=FrY3fTZy0dUSoU6EqOovvsfWhR1J9c3ifL67THjc0OIuLW3N7XWp58F10WI8DsAc+a
 EG5QIpWRQaSgsm9Fgr+Qj0kwAQSu20y7X/tvryRnTO0lzK0nf9Wdu5UKeLdjJ9HQ3UYB
 vLV1qFtDEs2Q2Sa0LtZgnqPBKN9Ki2v360lzVnjHCrbFa+S3Oi/BaCJRGo/ZHdsHFHkr
 3OuOSD04nY2b4m/4xrphCCrW5ddUxuO7cCKigXMQAn6kU2bu+ORcx5r9yT+zkr9JFNg/
 3cN4MT97VBt3MF9duVeU92GQ7DsH5fm6pxqqeJtsxdbtBkD5bRQ63lzfe4OSQOBWITrG
 VUnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752002942; x=1752607742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GHvIfEToA34AUrJx/MLc8GOT8YL8A2v7KBo+787ye5o=;
 b=VjeOcfuROHp917NswUCZ8gkgeQnYfu5jixpXNYHJHsg0aDyKPYasF9dDa+Bgzn//3M
 yFhZ8X+B2Cq59mg7E33WIUrjrskwVXDYgkSIwlZkl5mQGyLDpbe8eBu5h+GH7Fgi5Br3
 PZXgrh7/KjvAs6A1Gq8czGbyNMoDW1M2E3P6BewDSIAnKW4HO7KtxHOUfSBi28DhvL4H
 jDV3Gxb9rO4m9Ysb8E8V1ST2qcse7mC6RcOT3kx4W1iHpJIxj6Wk8iRWJwn9NNoIpWGr
 OVISG1pMelN31TbVx8Eu0m6ypeWSLSl1egvJjD2a9aFTS/adNpQ6E0zYAE+WWU0Yq004
 v8JA==
X-Gm-Message-State: AOJu0YwF8V15Op09VtbHq3YTqeo+QjLk/pkPIznk3jNpbDZfCn4Xtb69
 JTfGCoIPRq7pu4yiXPoWkmHWVVyZb+gGDCR6X3JLVoa60FnH0qqNxT0ECMl671Q4rSVfNjWnEyO
 XKS99
X-Gm-Gg: ASbGncsQsNoMhcJE3m7dxM6OhqK/QDv1ijLlteEbo8OxAhLwD+x0QS+oBmANS5EJje5
 y+GONvAV2KEwZhXmcoXXtXKhDwJOB9c9GOYTyviUw/NnyMqTTmTcAXLTr9Wk4YqjU69jwi0GL8O
 Lv15AjBs10h/TTfaPSVvbHWQVrfJ1n2Xj/D5TIXLNpK/4K1srk9NSLTRCJAu5ZfESje//tSGv4w
 8o07ihP4CcWiUOfL+0KOTU34vM3iioeLs1Zem0TXGTdCHz5LG4nUPPBlDkFesObzvwapfDabDpZ
 5zr3M8DHRmNWLYoH/HAPTqiRwwOWpVnKJDxfrHM2n8Bpyh1bRheRvw4W5o6ExnEYm77U
X-Google-Smtp-Source: AGHT+IG+A4X0nnNLJ5sc21KLUiKDswTMHI3fl5bj3zzRZZnPwB57X4e5Jvn63jQmNfRazRUKGQKb1Q==
X-Received: by 2002:a05:6000:400b:b0:3a4:e8c4:7a78 with SMTP id
 ffacd0b85a97d-3b5ddf02cc6mr1893228f8f.52.1751975562263; 
 Tue, 08 Jul 2025 04:52:42 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-454cd4a68ebsm19731255e9.39.2025.07.08.04.52.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Jul 2025 04:52:41 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>
Subject: [PATCH v2 1/3] hw/intc/arm_gicv3_dist: Implement GICD_TYPER2 as 0
Date: Tue,  8 Jul 2025 12:52:36 +0100
Message-ID: <20250708115238.667050-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250708115238.667050-1-peter.maydell@linaro.org>
References: <20250708115238.667050-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x229.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

The GIC distributor registers GICD_TYPER2 is present when the
GICv4.1 is implemented, and RES0 otherwise. QEMU's TCG implementation
is only GICv4.0, so this register is RES0. However, since it's
reasonable for GICv4.1-aware software to read the register, expecting
the zero for GICv3 and GICv4.0, implement the case to avoid it being
logged as an invalid guest read.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
Reviewed-by: Eric Auger <eric.auger@redhat.com>
---
 hw/intc/gicv3_internal.h | 1 +
 hw/intc/arm_gicv3_dist.c | 9 +++++++++
 2 files changed, 10 insertions(+)

diff --git a/hw/intc/gicv3_internal.h b/hw/intc/gicv3_internal.h
index bc9f518fe86..fc586524f56 100644
--- a/hw/intc/gicv3_internal.h
+++ b/hw/intc/gicv3_internal.h
@@ -31,6 +31,7 @@
 #define GICD_CTLR            0x0000
 #define GICD_TYPER           0x0004
 #define GICD_IIDR            0x0008
+#define GICD_TYPER2          0x000C
 #define GICD_STATUSR         0x0010
 #define GICD_SETSPI_NSR      0x0040
 #define GICD_CLRSPI_NSR      0x0048
diff --git a/hw/intc/arm_gicv3_dist.c b/hw/intc/arm_gicv3_dist.c
index d8207acb22c..a7d10ed9493 100644
--- a/hw/intc/arm_gicv3_dist.c
+++ b/hw/intc/arm_gicv3_dist.c
@@ -431,6 +431,15 @@ static bool gicd_readl(GICv3State *s, hwaddr offset,
             (0xf << 19) | itlinesnumber;
         return true;
     }
+    case GICD_TYPER2:
+        /*
+         * This register only exists for GICv4.1, which QEMU doesn't
+         * currently emulate. On GICv3 and GICv4 it's defined to be RES0.
+         * We implement as read-zero here to avoid tracing a bad-register-read
+         * if GICv4.1-aware software reads this ID register.
+         */
+        *data = 0;
+        return true;
     case GICD_IIDR:
         /* We claim to be an ARM r0p0 with a zero ProductID.
          * This is the same as an r0p0 GIC-500.
-- 
2.43.0


