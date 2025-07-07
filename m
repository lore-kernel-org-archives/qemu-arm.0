Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA9EAC8303C
	for <qemu-arm@archiver.kernel.org>; Mon,  7 Jul 2025 16:12:35 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uYoRf-0002yi-Lg; Mon, 07 Jul 2025 12:11:55 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uYoQF-00018W-CO
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 12:10:30 -0400
Received: from mail-wr1-x42f.google.com ([2a00:1450:4864:20::42f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uYoQB-00012L-GS
 for qemu-arm@nongnu.org; Mon, 07 Jul 2025 12:10:26 -0400
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-3a582e09144so2124670f8f.1
 for <qemu-arm@nongnu.org>; Mon, 07 Jul 2025 09:10:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751904621; x=1752509421; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z7zVf5YnOCPvcqn6yKrlfucDJ6AlSHJertRqzvoA/ik=;
 b=pZjyGFpoEiFrMHtggamgtglNLMOWJjyqvbrmA2SuiAckdCdBcprsmveHecPRzbgcLC
 9q8ufMLT97K5Icrplan7YEwSeNMJgxXQgNsspmX65kOZ1lVfpBT2+Mvr+7khfsrCtWG/
 rPQUnofCYGQx7uuYXUOoUGJnI53pNrwHoQic3xBe61/4o3iI4bIFcVCNalthLtpgSG8n
 anqezBA7R1hzKoPyGcDz/Clf9Vxu15WmXc4sujQBwLOIsjQ1qEsOARDT/opRL5G9W/0q
 dyaNyGnFzu/Yb/LffuYNy+X8LQ5RBxNkz0xLe+54adIKYoggmjLsNyjAi5JK6qzkLq9M
 OIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751904621; x=1752509421;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Z7zVf5YnOCPvcqn6yKrlfucDJ6AlSHJertRqzvoA/ik=;
 b=Cjk2iPezAcJ0yzabZ6/p9vwTZguD3C3lfbmxGMNOIaI1GTB0QaXxh8KlyWnkdB739s
 3aibGeOshhtQ/s42YLcnd0aXpJbbMA/XRGpB5EpXFH4wMrwgHBtumkFoAS31wocoVBgy
 UJiM+MAuFQqjD/ZsxczXCqMqv9BNh2zIlcUVk57KNXXRikA08RVpmd/YiA+MRDds8ssb
 G81DccBey10/7XbPXFNITiTQNyexwQY2AJrWauGuxHYy5YeimT0xOFDHnj9Qx/NtzijT
 wswKI+bLUIYtp2PfZzivvuwdOV0GpU73HV6ZMNcQ8rll1BFxngUKTpTe/pKfxSStuZEJ
 Sw3w==
X-Gm-Message-State: AOJu0YyHpyel5PciPP72i0vsq4BTfH80EfZyECMX1b/uWbO896S3D10f
 TH8aXpZmXXnHoX63CsVrZmUdzeeLtXL5XRLzTlIaSgFkhOx225VJx3/Vx7tLhIrnenpL6r3rXVI
 JhXG8
X-Gm-Gg: ASbGncvlBEACkmxkDn9rgZNZUpZ1sr+/EQ8G+gyHGW6SHamOCAZTwVP85g7JwzUj9Cr
 qxNcGuc6VT3s5fyqrCQh2Tm+EvoiVumnORemTQDu0SnKD2v0Tbq9xXVTL+CEBphxdOLtzvTYa3h
 eUBAhfFMHBIKgKSc9+UGvd/vfWX5qptS/zkot4h3vAzKT+/SyoTW55FQmwYydnhKThPTFGG0gt2
 Thck6vTnokqUKVILu1iV8G1jFMgJZbxb2M7abf5cnciqHTlCBg312Hk1jMvlwwXxcW28SJon67d
 Dk6UmY1N69vF9LGM+gd08kUDD73yIFb0/6L7fdVnzk/Ibn+AjiWxm4Tut7ZIFw38rvjK
X-Google-Smtp-Source: AGHT+IF1y2QHWZ7mWm0fAvG5oshsyyQuVbEtfuZYCs96qBi0u8b31frpw4Z0yXCXMFmMt3CZos4PeQ==
X-Received: by 2002:a05:6000:25c3:b0:3a4:f975:30f7 with SMTP id
 ffacd0b85a97d-3b497045024mr10321482f8f.56.1751904621330; 
 Mon, 07 Jul 2025 09:10:21 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3b4708d0aebsm10842820f8f.37.2025.07.07.09.10.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Jul 2025 09:10:20 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: Eric Auger <eric.auger@redhat.com>,
	Marc Zyngier <maz@kernel.org>
Subject: [PATCH 1/2] hw/intc/arm_gicv3_dist: Implement GICD_TYPER2 as 0
Date: Mon,  7 Jul 2025 17:10:16 +0100
Message-ID: <20250707161018.585469-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250707161018.585469-1-peter.maydell@linaro.org>
References: <20250707161018.585469-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42f;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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


