Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp3850252lfb;
        Mon, 16 Nov 2020 08:33:24 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwLOjc/o4cY0T+Olv2jgsk4krzmIo+G3nI0fR+J/oEVGcDPfUa9vRlh76+FlCto6+RGjDqo
X-Received: by 2002:a25:6903:: with SMTP id e3mr21695368ybc.295.1605544404808;
        Mon, 16 Nov 2020 08:33:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605544404; cv=none;
        d=google.com; s=arc-20160816;
        b=GGmiVW4j406iZowB6JKpM9S33IsaWAfpGIyp5ya+YsJr2VXAtktQycN4osaxf7HeUP
         +YKkYiMw/JXEOsG2+0jOWN9qxZdzGq2kz0V+x7pVATF5hwbprFsAT7Sl0qm3N7BrPGKM
         w7IPZsm58O9qZzUHpTGNn4KUe93tBkzG7LRhMKGRUGnQXmVT5AByinzFH42hS4maE1Sq
         nCj3dLl+Ak1VRcWzulxCTXWhHDX7hg2hZeDtyIe1Zt55eY/GcT8a51OpornH/1otJSQh
         mRoHyMHmzqs2sqxhtfREwrGN85CDYZu3vbKPNasgsz4IBM4rzooArUtbGxsA+87v41f7
         s9+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=dmUyi/R+ezwoa9Zookpa//dbcIevyh3Q24fEDsNNr4I=;
        b=b6Q76Xbvfio07qeDa4VfCh/lBxiUOUEl4Av+5DOzYlfBZnCpvV+5XDfKCMiUm337Ac
         lTHitwPwBx2AwTpvsjQq5prkrWpIJy/vUk0lIZycwVfMTj2lOtE74bSbaL//h6pNXb5N
         f2CQbrlcfeYyiLI+3eVfGZe3geiYFgD1XO+beCJKyUSaTwovyD+9aSwR4ziCoctlztxj
         ytLf1o8hFPS4mNHV7UqpfxGBPrbexqqfbjOb+g1CI+a1nlDRWmFVnJ96kEdGXAZfJd+B
         XeFkodNHKqlZMhJrQwkDvtj51PhLaf1RPlzxV6rv+QtJZG2zjcePvNCPZ48uae1YQoTF
         EiHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A9jKsO2j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u189si9868668yba.409.2020.11.16.08.33.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Nov 2020 08:33:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A9jKsO2j;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kehRU-0007yD-2r
	for alex.bennee@linaro.org; Mon, 16 Nov 2020 11:33:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58446)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3q-0000PW-SX
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:58 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:37006)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1keh3l-0007wF-F6
 for qemu-devel@nongnu.org; Mon, 16 Nov 2020 11:08:58 -0500
Received: by mail-wm1-x344.google.com with SMTP id h21so3329842wmb.2
 for <qemu-devel@nongnu.org>; Mon, 16 Nov 2020 08:08:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=dmUyi/R+ezwoa9Zookpa//dbcIevyh3Q24fEDsNNr4I=;
 b=A9jKsO2jS97925bKIIYt+DQKvxYSDL4kFF6fBU/HEBqINFi+xsxLycAeViy+gn84u2
 AGdB0iVOE+XT0Xe3bV/0DckXWrVJqmsXDiATdTs8HN5byG40vI8g7xM/KyxBL5j9+giR
 G3yAHtFQVHErtfUmTv84MGprIUMMdIMxSK4Jx/NQSes8P1SRVKBzqlIuD2bS/VU6/yw5
 +iE2Eptj48xR0qfFnboykh4jzU7wH1u3d/tgOld0UPKvIcP4NyBQIqBAlzwaw47TFx3i
 kmmEFck8c//1JPirt+1fp0RR57r8Tu+GYRWB4/VZWs/p8NjbT7g0/Rx4paneIrT/vggX
 MBCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dmUyi/R+ezwoa9Zookpa//dbcIevyh3Q24fEDsNNr4I=;
 b=NNCptngS4S0u/+9O7SojiYHpizhazREsAE6sLss+cWHr0JP9pNVuhbYi9TheDcsIGs
 +HW+hyFTNzP2Vkdtp+LJs8GNZn4TlRjJBkjuMH80u31O4yzyJlUmHxe0WCCeu4Xlzr69
 OBbhI4+EwCwx55ZR8SpLDKMbIK2ank3skFMTADYRcB2Z4mkVq+BsCII6C++6lpnTnJqa
 zITU4qp4AfRrmtiVPDKBCZv38i1MeHpUPeXWfo4OzKBrKqD6odvilU5v9VrO7iHXeZ+X
 jVM7dngwxgGbQouDuYjs7AJhdM/vkO7LmyGaKr6+c9smMu07zsag1LaHxyrNzkKI6w2N
 yQQQ==
X-Gm-Message-State: AOAM531zUYdTZo0vVBQVPKnRrjnauOl27oh5PezAJgGgWArzcCWsJ3Yv
 YRktUwXUFd3M7A08C7JfosUHsw==
X-Received: by 2002:a1c:7413:: with SMTP id p19mr4270639wmc.44.1605542932228; 
 Mon, 16 Nov 2020 08:08:52 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id g20sm20116975wmh.20.2020.11.16.08.08.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Nov 2020 08:08:51 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 15/15] hw/intc/armv7m_nvic: Update FPDSCR masking for v8.1M
Date: Mon, 16 Nov 2020 16:08:31 +0000
Message-Id: <20201116160831.31000-16-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201116160831.31000-1-peter.maydell@linaro.org>
References: <20201116160831.31000-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::344;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x344.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LwAWm4F/qYur

The FPDSCR register has a similar layout to the FPSCR.  In v8.1M it
gains new fields FZ16 (if half-precision floating point is supported)
and LTPSIZE (always reads as 4).  Update the reset value and the code
that handles writes to this register accordingly.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      | 5 +++++
 hw/intc/armv7m_nvic.c | 9 ++++++++-
 target/arm/cpu.c      | 3 +++
 3 files changed, 16 insertions(+), 1 deletion(-)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 34f8f4afe18..2bc25b65ab0 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1521,14 +1521,19 @@ void vfp_set_fpscr(CPUARMState *env, uint32_t val);
 #define FPCR_IXE    (1 << 12)   /* Inexact exception trap enable */
 #define FPCR_IDE    (1 << 15)   /* Input Denormal exception trap enable */
 #define FPCR_FZ16   (1 << 19)   /* ARMv8.2+, FP16 flush-to-zero */
+#define FPCR_RMODE_MASK (3 << 22) /* Rounding mode */
 #define FPCR_FZ     (1 << 24)   /* Flush-to-zero enable bit */
 #define FPCR_DN     (1 << 25)   /* Default NaN enable bit */
+#define FPCR_AHP    (1 << 26)   /* Alternative half-precision */
 #define FPCR_QC     (1 << 27)   /* Cumulative saturation bit */
 #define FPCR_V      (1 << 28)   /* FP overflow flag */
 #define FPCR_C      (1 << 29)   /* FP carry flag */
 #define FPCR_Z      (1 << 30)   /* FP zero flag */
 #define FPCR_N      (1 << 31)   /* FP negative flag */
 
+#define FPCR_LTPSIZE_SHIFT 16   /* LTPSIZE, M-profile only */
+#define FPCR_LTPSIZE_MASK (7 << FPCR_LTPSIZE_SHIFT)
+
 #define FPCR_NZCV_MASK (FPCR_N | FPCR_Z | FPCR_C | FPCR_V)
 #define FPCR_NZCVQC_MASK (FPCR_NZCV_MASK | FPCR_QC)
 
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 9628ce876e0..be3bc1f1f45 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -2068,7 +2068,14 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
         break;
     case 0xf3c: /* FPDSCR */
         if (cpu_isar_feature(aa32_vfp_simd, cpu)) {
-            value &= 0x07c00000;
+            uint32_t mask = FPCR_AHP | FPCR_DN | FPCR_FZ | FPCR_RMODE_MASK;
+            if (cpu_isar_feature(any_fp16, cpu)) {
+                mask |= FPCR_FZ16;
+            }
+            value &= mask;
+            if (cpu_isar_feature(aa32_lob, cpu)) {
+                value |= 4 << FPCR_LTPSIZE_SHIFT;
+            }
             cpu->env.v7m.fpdscr[attrs.secure] = value;
         }
         break;
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 40f3f798b2b..d6188f6566a 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -262,6 +262,9 @@ static void arm_cpu_reset(DeviceState *dev)
              * always reset to 4.
              */
             env->v7m.ltpsize = 4;
+            /* The LTPSIZE field in FPDSCR is constant and reads as 4. */
+            env->v7m.fpdscr[M_REG_NS] = 4 << FPCR_LTPSIZE_SHIFT;
+            env->v7m.fpdscr[M_REG_S] = 4 << FPCR_LTPSIZE_SHIFT;
         }
 
         if (arm_feature(env, ARM_FEATURE_M_SECURITY)) {
-- 
2.20.1

