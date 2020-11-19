Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp759164lfb;
        Thu, 19 Nov 2020 14:10:14 -0800 (PST)
X-Google-Smtp-Source: ABdhPJydM8F/SPVS29b6ytFUa8nuO/RempS1eA+Q54B4UkUj3z660/DENmHDaBIC1/j0E+6KQXX3
X-Received: by 2002:a25:2495:: with SMTP id k143mr12317245ybk.396.1605823814697;
        Thu, 19 Nov 2020 14:10:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1605823814; cv=none;
        d=google.com; s=arc-20160816;
        b=P1BM3kPK+zIqjc6Rd0Nhkj2tuIlrox4LRV2KGEK4/PT1++WfUgiJU9NkcKHOvfS3kW
         eR2TWVgBA+6ckBwNRmxspWLophNn77BOUfVWMVYiyk30rf6/6O/4Hc1Tkk1ZoJ9TUUWd
         esFbPLPQZS1vjuTrD6lIO6yTAIG8L6ecTMSeqLS3PqjlUcZlDjh1de0PJcSGupJUX8ub
         r7Jv4NIcygT/NnCK2DZsoCIV+mxwtb9CsJzG5bCVrDPFBJbOGWNr1XJCa674m+yHhPEd
         qWYP7BpwyOqg+A2BPmmC+9q05kNddYXpI07uEMMB1i4zg3nyNPeRjFOaN53mbf/eSmLm
         1PgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hc3nzG7RWM4GF2g+cHgdNWNtIjr6cjy/0CNOT4ryRb8=;
        b=bwA4zoaLkOAFNbPxljWluuRryngwGXBdYZao6dqMpOJTmDMs5dVF5tpwZTfqm+NxSP
         H1OBwsg1BEoFP/xE8L5XTinJ6DFyeyUS1HtedI2BkX+EEpNf9jXh4Hnn/tN5IyHL5xPG
         4pQpuN9xtlf/Hrgm1GupuwGR4odL2dDHfjRhoWJJQKM4j7+w+0OUwRWflJrRG8mf9eP3
         z+6ml4sF/L0Xk3JyigPO9O+60SAgwGed1QYjVGELd+CdpSBlbEyis+pb4PO1LaeQah1y
         AFCufKWhz4y/Ov2gPAwX+QH2virGo0LYEYyljiO2u8gRf/SIUBYOaAdcURUOvHZYl3CY
         fl8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RQtwC5zI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g5si1056118ybq.162.2020.11.19.14.10.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Nov 2020 14:10:14 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RQtwC5zI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57164 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kfs86-0001ow-0G
	for alex.bennee@linaro.org; Thu, 19 Nov 2020 17:10:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:51796)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrvN-0001EW-9n
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:57:05 -0500
Received: from mail-wr1-x42b.google.com ([2a00:1450:4864:20::42b]:44046)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kfrv8-0004G4-Uq
 for qemu-arm@nongnu.org; Thu, 19 Nov 2020 16:57:04 -0500
Received: by mail-wr1-x42b.google.com with SMTP id c17so7955780wrc.11
 for <qemu-arm@nongnu.org>; Thu, 19 Nov 2020 13:56:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=hc3nzG7RWM4GF2g+cHgdNWNtIjr6cjy/0CNOT4ryRb8=;
 b=RQtwC5zInM3ITyRG2NIjSUH0Hu3QyUL7tLZMXcUmuR+TZeBRTj4LmVL/0LfLr1QX4L
 4ahWFWr9QLLLvi/ES4BZEFNgJwpVaDAOtWt2kTyoKLbOFrL9GuHuXTwszXR+4M4dR02V
 0dR6yb+HEHEbrBjqD6DoLUigEu61FnqtKzE+t74UMXNioSjfXl964TulEIthU6J1RcVw
 bb5YPS8Ye+znT1kEHjUR+1igRpZKybkG0JEhURgqKX1Pfd9zjnVxSg+bSM8Hr9Fekilz
 MsJYWwf6d++jHbl+ARCmMLSvQQYHPNOflfZSrMQ02ZkRO26bwLDN7I31iL7M+EgY3ecT
 FDvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hc3nzG7RWM4GF2g+cHgdNWNtIjr6cjy/0CNOT4ryRb8=;
 b=QFyEmwag0dsQ/mT+u+BPAyew77XFPqZQgxEivYBDqdu6jloccRhCzsptAJI7m0Bsa/
 tR4hEOEgSAMJhhQ6c+duiWJsKBPv7TAjmFhoAyM1N859WDSwuMCcfEI4C37tQINFFFUr
 z2p0yux3j1SFrIq1ZYGSKfQTZIu2n3IqTpo1sK4QM9xajHaFiYM0RTCYM20ZTsHbCybN
 kHyh76De52YcxHluAcXAIUagk9maCUznfkTs5pQQvhGOD/wAAtZxxPn0mp7hkkXnPOL6
 Ggalt9N5cxEDYngl6zEdQgUlXGjTO9LZmooN8EC0ajKOaOoCjoI3OcHhpg7jRzEMrTzZ
 HenA==
X-Gm-Message-State: AOAM5311qCDpQCmVj1obYHWamTTa7ZMXyIx9UgBofnDrm5pUwf0Pl+ze
 T+mpOhbFVdLwKwKywCEVCKq82JCDKPfBmw==
X-Received: by 2002:adf:f881:: with SMTP id u1mr13311461wrp.103.1605823008351; 
 Thu, 19 Nov 2020 13:56:48 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id j15sm1934851wrm.62.2020.11.19.13.56.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Nov 2020 13:56:47 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH v2 25/28] target/arm: Implement M-profile "minimal RAS
 implementation"
Date: Thu, 19 Nov 2020 21:56:14 +0000
Message-Id: <20201119215617.29887-26-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20201119215617.29887-1-peter.maydell@linaro.org>
References: <20201119215617.29887-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NOWNGQKaeNg+

For v8.1M the architecture mandates that CPUs must provide at
least the "minimal RAS implementation" from the Reliability,
Availability and Serviceability extension. This consists of:
 * an ESB instruction which is a NOP
   -- since it is in the HINT space we need only add a comment
 * an RFSR register which will RAZ/WI
 * a RAZ/WI AIRCR.IESB bit
   -- the code which handles writes to AIRCR does not allow setting
      of RES0 bits, so we already treat this as RAZ/WI; add a comment
      noting that this is deliberate
 * minimal implementation of the RAS register block at 0xe0005000
   -- this will be in a subsequent commit
 * setting the ID_PFR0.RAS field to 0b0010
   -- we will do this when we add the Cortex-M55 CPU model

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      | 14 ++++++++++++++
 target/arm/t32.decode |  4 ++++
 hw/intc/armv7m_nvic.c | 13 +++++++++++++
 3 files changed, 31 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index 22c55c81933..7e6c881a7e2 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -1827,6 +1827,15 @@ FIELD(ID_MMFR4, LSM, 20, 4)
 FIELD(ID_MMFR4, CCIDX, 24, 4)
 FIELD(ID_MMFR4, EVT, 28, 4)
 
+FIELD(ID_PFR0, STATE0, 0, 4)
+FIELD(ID_PFR0, STATE1, 4, 4)
+FIELD(ID_PFR0, STATE2, 8, 4)
+FIELD(ID_PFR0, STATE3, 12, 4)
+FIELD(ID_PFR0, CSV2, 16, 4)
+FIELD(ID_PFR0, AMU, 20, 4)
+FIELD(ID_PFR0, DIT, 24, 4)
+FIELD(ID_PFR0, RAS, 28, 4)
+
 FIELD(ID_PFR1, PROGMOD, 0, 4)
 FIELD(ID_PFR1, SECURITY, 4, 4)
 FIELD(ID_PFR1, MPROGMOD, 8, 4)
@@ -3573,6 +3582,11 @@ static inline bool isar_feature_aa32_predinv(const ARMISARegisters *id)
     return FIELD_EX32(id->id_isar6, ID_ISAR6, SPECRES) != 0;
 }
 
+static inline bool isar_feature_aa32_ras(const ARMISARegisters *id)
+{
+    return FIELD_EX32(id->id_pfr0, ID_PFR0, RAS) != 0;
+}
+
 static inline bool isar_feature_aa32_mprofile(const ARMISARegisters *id)
 {
     return FIELD_EX32(id->id_pfr1, ID_PFR1, MPROGMOD) != 0;
diff --git a/target/arm/t32.decode b/target/arm/t32.decode
index f045eb62c84..8b2c487fa7a 100644
--- a/target/arm/t32.decode
+++ b/target/arm/t32.decode
@@ -307,6 +307,10 @@ CLZ              1111 1010 1011 ---- 1111 .... 1000 ....      @rdm
       # SEV      1111 0011 1010 1111 1000 0000 0000 0100
       # SEVL     1111 0011 1010 1111 1000 0000 0000 0101
 
+      # For M-profile minimal-RAS ESB can be a NOP, which is the
+      # default behaviour since it is in the hint space.
+      # ESB      1111 0011 1010 1111 1000 0000 0001 0000
+
       # The canonical nop ends in 0000 0000, but the whole rest
       # of the space is "reserved hint, behaves as nop".
       NOP        1111 0011 1010 1111 1000 0000 ---- ----
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index fa8aeca82ec..c42b291f881 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1489,6 +1489,12 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
             return 0;
         }
         return cpu->env.v7m.sfar;
+    case 0xf04: /* RFSR */
+        if (!cpu_isar_feature(aa32_ras, cpu)) {
+            goto bad_offset;
+        }
+        /* We provide minimal-RAS only: RFSR is RAZ/WI */
+        return 0;
     case 0xf34: /* FPCCR */
         if (!cpu_isar_feature(aa32_vfp_simd, cpu)) {
             return 0;
@@ -1617,6 +1623,7 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
                               R_V7M_AIRCR_PRIGROUP_SHIFT,
                               R_V7M_AIRCR_PRIGROUP_LENGTH);
             }
+            /* AIRCR.IESB is RAZ/WI because we implement only minimal RAS */
             if (attrs.secure) {
                 /* These bits are only writable by secure */
                 cpu->env.v7m.aircr = value &
@@ -2037,6 +2044,12 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
         }
         break;
     }
+    case 0xf04: /* RFSR */
+        if (!cpu_isar_feature(aa32_ras, cpu)) {
+            goto bad_offset;
+        }
+        /* We provide minimal-RAS only: RFSR is RAZ/WI */
+        break;
     case 0xf34: /* FPCCR */
         if (cpu_isar_feature(aa32_vfp_simd, cpu)) {
             /* Not all bits here are banked. */
-- 
2.20.1

