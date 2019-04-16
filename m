Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp3894399wrx;
        Tue, 16 Apr 2019 05:59:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzjyirZChf32zmaYWbpw3koyi0zOc7b+KX125d79VgKc1Tbcp1c+oQRY190RtyWlfUDqiLh
X-Received: by 2002:adf:afe1:: with SMTP id y33mr54283234wrd.288.1555419573987;
        Tue, 16 Apr 2019 05:59:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555419573; cv=none;
        d=google.com; s=arc-20160816;
        b=ny/COgs213ilRzhJ1YDD//Kr9GdZ4LxeBWivYx3Nc+wLX0H5uuoNH3YPji15SbDgy2
         tChxI948O/lk/YPoxkj/7rJsBAur630pvD566D++iRzT4JZW7GCAAoLrM2ndLsOmjesU
         CKvbOhdeMNN9P/eUGDYs+RsJrMNPaq/gWMLg2de38CzK7dFu2lXbeWkJ2l8oAPnU87/l
         DgRTjw3h4QKvsb04gfvn1O5aDbx31UwHa06KSgy1LappTH0OxiQj0pq/cieb2csK/CqW
         AuyTrK6zVY8o6VeLKbmZ5dBV14o4lu2Qj25B0/rjYvIVbtp7W0ZXFuGjFzzRpOcu5qdM
         o2Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=01ihWTYepPx72GUDfGATzFEgCIYunLwUx5AdBGmnpVM=;
        b=cSw24OU21Gox99qj2T/Z9yHdDqX2ldjbn9oc/qTsD7WEGl0kdc45dfiATBZT3CJL9i
         UW22EC+Ac3SWiMgJmG3YfM5cER5Zv65MqjujzLkuAs6YMM32sZUKVu8R9pxhOYuYA/fk
         hDW2pTy1hcqXHptiTg2zJLYQIDrWrYnGIg7AUKJpnGnj4DxjVLc0jhLwo67m7TCdacsQ
         UBHtyjCAB7yDWWYuUCERF6SuzBXzVZ1zeJBArtPOrIGWMkOuJTLOL/Q2bIxJ9LMaXfMu
         WbwIElIbjU04X5QAzs0NwKY2urqOV27f3Be0mV7wZykZDO4E83MxOMRVsHKNqe+7wr7F
         Dbxg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CrRywhlh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p1si35460673wrn.208.2019.04.16.05.59.33
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 05:59:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CrRywhlh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:36270 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGNgS-0005n1-VT
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 08:59:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:34342)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNf0-0004TY-Jq
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:04 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hGNex-000154-7z
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:58:00 -0400
Received: from mail-wr1-x443.google.com ([2a00:1450:4864:20::443]:37801)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hGNet-000126-DT
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 08:57:57 -0400
Received: by mail-wr1-x443.google.com with SMTP id w10so26976852wrm.4
	for <qemu-arm@nongnu.org>; Tue, 16 Apr 2019 05:57:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=01ihWTYepPx72GUDfGATzFEgCIYunLwUx5AdBGmnpVM=;
	b=CrRywhlhrwOhN22S3x+q9ZQ3G8UrTSgfdhFktdecNvXuEGLQqdhFLLxzbqZ6VzUTdu
	ksrm+y2tha6K/e38IIOILs+JxyRxIDvNvQ2pbAldW5Zv0N6FWrw16hacBF+4SOwXTNpo
	FT3YeCEo50JwWnX8IMSggdIdNnG85R11uK8OyfN8fkuBJte4ECc/kUBYiL/XDZqAlwxY
	9RaiSXZRpAihQwPU9S1e9uyAWZaC87j3AlOqFJWB5ZV7QXEsIilOZxip9vWetB/PkXem
	IIJeFUyCato6NQCxxIuyYWeuGF+NPf5RwZMiUjjX7W1mHDlx65WFSm9J61GEj31h+Of+
	PY0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=01ihWTYepPx72GUDfGATzFEgCIYunLwUx5AdBGmnpVM=;
	b=TDfIJnN94NLatRzqImFwryPPLwvz4XZaQz5AXhMQT5WbfMCZAZPTblRIPJTkHdyHrc
	0aPUE5ZoSvO9Ls256Ab5R/F9p0RDAwKuY+Rat2CUaH0qsxAIOfagxBGEDg0sO7qytDUB
	cqgcWZSDWRvHWNrPxsKUdFz6u5oUgSG9ODv7mVwFzpq4tanbTWd2iAz7NTF2RZityuBf
	YW134TFbNE7MgqApxatM+n2d/AEnoLVpGfWKwE4oS25Mi0/uLAOHxkdAhOGA7q8j8jax
	6XqTC/6SnoDnAjp5MKEwsqeHlGi/xiFRrLRf4xRa8dxBHf45/YjrR2a+92BKBLSda0Z5
	ME+Q==
X-Gm-Message-State: APjAAAXvr2K4OMbAo7hvxG8V8lKmbOD/IZuC51roruY2NHiLQVZTDhIP
	IEyUtKdVv9C0csRZ+7qy+Fy8Hfs26tU=
X-Received: by 2002:adf:e78e:: with SMTP id n14mr29629175wrm.14.1555419473612; 
	Tue, 16 Apr 2019 05:57:53 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
	by smtp.gmail.com with ESMTPSA id
	v184sm39476572wma.6.2019.04.16.05.57.51
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Apr 2019 05:57:52 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 16 Apr 2019 13:57:21 +0100
Message-Id: <20190416125744.27770-4-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190416125744.27770-1-peter.maydell@linaro.org>
References: <20190416125744.27770-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::443
Subject: [Qemu-arm] [PATCH 03/26] target/arm: Implement dummy versions of
 M-profile FP-related registers
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qJrjEDFcna0Y

The M-profile floating point support has three associated config
registers: FPCAR, FPCCR and FPDSCR. It also makes the registers
CPACR and NSACR have behaviour other than reads-as-zero.
Add support for all of these as simple reads-as-written registers.
We will hook up actual functionality later.

The main complexity here is handling the FPCCR register, which
has a mix of banked and unbanked bits.

Note that we don't share storage with the A-profile
cpu->cp15.nsacr and cpu->cp15.cpacr_el1, though the behaviour
is quite similar, for two reasons:
 * the M profile CPACR is banked between security states
 * it preserves the invariant that M profile uses no state
   inside the cp15 substruct

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu.h      |  34 ++++++++++++
 hw/intc/armv7m_nvic.c | 125 ++++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.c      |   5 ++
 target/arm/machine.c  |  16 ++++++
 4 files changed, 180 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index d4d2836923d..c8d78bd5b52 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -533,6 +533,11 @@ typedef struct CPUARMState {
         uint32_t scr[M_REG_NUM_BANKS];
         uint32_t msplim[M_REG_NUM_BANKS];
         uint32_t psplim[M_REG_NUM_BANKS];
+        uint32_t fpcar[M_REG_NUM_BANKS];
+        uint32_t fpccr[M_REG_NUM_BANKS];
+        uint32_t fpdscr[M_REG_NUM_BANKS];
+        uint32_t cpacr[M_REG_NUM_BANKS];
+        uint32_t nsacr;
     } v7m;
 
     /* Information associated with an exception about to be taken:
@@ -1577,6 +1582,35 @@ FIELD(V7M_CSSELR, LEVEL, 1, 3)
  */
 FIELD(V7M_CSSELR, INDEX, 0, 4)
 
+/* v7M FPCCR bits */
+FIELD(V7M_FPCCR, LSPACT, 0, 1)
+FIELD(V7M_FPCCR, USER, 1, 1)
+FIELD(V7M_FPCCR, S, 2, 1)
+FIELD(V7M_FPCCR, THREAD, 3, 1)
+FIELD(V7M_FPCCR, HFRDY, 4, 1)
+FIELD(V7M_FPCCR, MMRDY, 5, 1)
+FIELD(V7M_FPCCR, BFRDY, 6, 1)
+FIELD(V7M_FPCCR, SFRDY, 7, 1)
+FIELD(V7M_FPCCR, MONRDY, 8, 1)
+FIELD(V7M_FPCCR, SPLIMVIOL, 9, 1)
+FIELD(V7M_FPCCR, UFRDY, 10, 1)
+FIELD(V7M_FPCCR, RES0, 11, 15)
+FIELD(V7M_FPCCR, TS, 26, 1)
+FIELD(V7M_FPCCR, CLRONRETS, 27, 1)
+FIELD(V7M_FPCCR, CLRONRET, 28, 1)
+FIELD(V7M_FPCCR, LSPENS, 29, 1)
+FIELD(V7M_FPCCR, LSPEN, 30, 1)
+FIELD(V7M_FPCCR, ASPEN, 31, 1)
+/* These bits are banked. Others are non-banked and live in the M_REG_S bank */
+#define R_V7M_FPCCR_BANKED_MASK                 \
+    (R_V7M_FPCCR_LSPACT_MASK |                  \
+     R_V7M_FPCCR_USER_MASK |                    \
+     R_V7M_FPCCR_THREAD_MASK |                  \
+     R_V7M_FPCCR_MMRDY_MASK |                   \
+     R_V7M_FPCCR_SPLIMVIOL_MASK |               \
+     R_V7M_FPCCR_UFRDY_MASK |                   \
+     R_V7M_FPCCR_ASPEN_MASK)
+
 /*
  * System register ID fields.
  */
diff --git a/hw/intc/armv7m_nvic.c b/hw/intc/armv7m_nvic.c
index 45d72f86bdf..5eb438f5409 100644
--- a/hw/intc/armv7m_nvic.c
+++ b/hw/intc/armv7m_nvic.c
@@ -1077,6 +1077,16 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
     }
     case 0xd84: /* CSSELR */
         return cpu->env.v7m.csselr[attrs.secure];
+    case 0xd88: /* CPACR */
+        if (!arm_feature(&cpu->env, ARM_FEATURE_VFP)) {
+            return 0;
+        }
+        return cpu->env.v7m.cpacr[attrs.secure];
+    case 0xd8c: /* NSACR */
+        if (!attrs.secure || !arm_feature(&cpu->env, ARM_FEATURE_VFP)) {
+            return 0;
+        }
+        return cpu->env.v7m.nsacr;
     /* TODO: Implement debug registers.  */
     case 0xd90: /* MPU_TYPE */
         /* Unified MPU; if the MPU is not present this value is zero */
@@ -1222,6 +1232,43 @@ static uint32_t nvic_readl(NVICState *s, uint32_t offset, MemTxAttrs attrs)
             return 0;
         }
         return cpu->env.v7m.sfar;
+    case 0xf34: /* FPCCR */
+        if (!arm_feature(&cpu->env, ARM_FEATURE_VFP)) {
+            return 0;
+        }
+        if (attrs.secure) {
+            return cpu->env.v7m.fpccr[M_REG_S];
+        } else {
+            /*
+             * NS can read LSPEN, CLRONRET and MONRDY. It can read
+             * BFRDY and HFRDY if AIRCR.BFHFNMINS != 0;
+             * other non-banked bits RAZ.
+             * TODO: MONRDY should RAZ/WI if DEMCR.SDME is set.
+             */
+            uint32_t value = cpu->env.v7m.fpccr[M_REG_S];
+            uint32_t mask = R_V7M_FPCCR_LSPEN_MASK |
+                R_V7M_FPCCR_CLRONRET_MASK |
+                R_V7M_FPCCR_MONRDY_MASK;
+
+            if (s->cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK) {
+                mask |= R_V7M_FPCCR_BFRDY_MASK | R_V7M_FPCCR_HFRDY_MASK;
+            }
+
+            value &= mask;
+
+            value |= cpu->env.v7m.fpccr[M_REG_NS];
+            return value;
+        }
+    case 0xf38: /* FPCAR */
+        if (!arm_feature(&cpu->env, ARM_FEATURE_VFP)) {
+            return 0;
+        }
+        return cpu->env.v7m.fpcar[attrs.secure];
+    case 0xf3c: /* FPDSCR */
+        if (!arm_feature(&cpu->env, ARM_FEATURE_VFP)) {
+            return 0;
+        }
+        return cpu->env.v7m.fpdscr[attrs.secure];
     case 0xf40: /* MVFR0 */
         return cpu->isar.mvfr0;
     case 0xf44: /* MVFR1 */
@@ -1475,6 +1522,18 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
             cpu->env.v7m.csselr[attrs.secure] = value & R_V7M_CSSELR_INDEX_MASK;
         }
         break;
+    case 0xd88: /* CPACR */
+        if (arm_feature(&cpu->env, ARM_FEATURE_VFP)) {
+            /* We implement only the Floating Point extension's CP10/CP11 */
+            cpu->env.v7m.cpacr[attrs.secure] = value & (0xf << 20);
+        }
+        break;
+    case 0xd8c: /* NSACR */
+        if (attrs.secure && arm_feature(&cpu->env, ARM_FEATURE_VFP)) {
+            /* We implement only the Floating Point extension's CP10/CP11 */
+            cpu->env.v7m.nsacr = value & (3 << 10);
+        }
+        break;
     case 0xd90: /* MPU_TYPE */
         return; /* RO */
     case 0xd94: /* MPU_CTRL */
@@ -1703,6 +1762,72 @@ static void nvic_writel(NVICState *s, uint32_t offset, uint32_t value,
         }
         break;
     }
+    case 0xf34: /* FPCCR */
+        if (arm_feature(&cpu->env, ARM_FEATURE_VFP)) {
+            /* Not all bits here are banked. */
+            uint32_t fpccr_s;
+
+            if (!arm_feature(&cpu->env, ARM_FEATURE_V8)) {
+                /* Don't allow setting of bits not present in v7M */
+                value &= (R_V7M_FPCCR_LSPACT_MASK |
+                          R_V7M_FPCCR_USER_MASK |
+                          R_V7M_FPCCR_THREAD_MASK |
+                          R_V7M_FPCCR_HFRDY_MASK |
+                          R_V7M_FPCCR_MMRDY_MASK |
+                          R_V7M_FPCCR_BFRDY_MASK |
+                          R_V7M_FPCCR_MONRDY_MASK |
+                          R_V7M_FPCCR_LSPEN_MASK |
+                          R_V7M_FPCCR_ASPEN_MASK);
+            }
+            value &= ~R_V7M_FPCCR_RES0_MASK;
+
+            if (!attrs.secure) {
+                /* Some non-banked bits are configurably writable by NS */
+                fpccr_s = cpu->env.v7m.fpccr[M_REG_S];
+                if (!(fpccr_s & R_V7M_FPCCR_LSPENS_MASK)) {
+                    uint32_t lspen = FIELD_EX32(value, V7M_FPCCR, LSPEN);
+                    fpccr_s = FIELD_DP32(fpccr_s, V7M_FPCCR, LSPEN, lspen);
+                }
+                if (!(fpccr_s & R_V7M_FPCCR_CLRONRETS_MASK)) {
+                    uint32_t cor = FIELD_EX32(value, V7M_FPCCR, CLRONRET);
+                    fpccr_s = FIELD_DP32(fpccr_s, V7M_FPCCR, CLRONRET, cor);
+                }
+                if ((s->cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK)) {
+                    uint32_t hfrdy = FIELD_EX32(value, V7M_FPCCR, HFRDY);
+                    uint32_t bfrdy = FIELD_EX32(value, V7M_FPCCR, BFRDY);
+                    fpccr_s = FIELD_DP32(fpccr_s, V7M_FPCCR, HFRDY, hfrdy);
+                    fpccr_s = FIELD_DP32(fpccr_s, V7M_FPCCR, BFRDY, bfrdy);
+                }
+                /* TODO MONRDY should RAZ/WI if DEMCR.SDME is set */
+                {
+                    uint32_t monrdy = FIELD_EX32(value, V7M_FPCCR, MONRDY);
+                    fpccr_s = FIELD_DP32(fpccr_s, V7M_FPCCR, MONRDY, monrdy);
+                }
+
+                /*
+                 * All other non-banked bits are RAZ/WI from NS; write
+                 * just the banked bits to fpccr[M_REG_NS].
+                 */
+                value &= R_V7M_FPCCR_BANKED_MASK;
+                cpu->env.v7m.fpccr[M_REG_NS] = value;
+            } else {
+                fpccr_s = value;
+            }
+            cpu->env.v7m.fpccr[M_REG_S] = fpccr_s;
+        }
+        break;
+    case 0xf38: /* FPCAR */
+        if (arm_feature(&cpu->env, ARM_FEATURE_VFP)) {
+            value &= ~7;
+            cpu->env.v7m.fpcar[attrs.secure] = value;
+        }
+        break;
+    case 0xf3c: /* FPDSCR */
+        if (arm_feature(&cpu->env, ARM_FEATURE_VFP)) {
+            value &= 0x07c00000;
+            cpu->env.v7m.fpdscr[attrs.secure] = value;
+        }
+        break;
     case 0xf50: /* ICIALLU */
     case 0xf58: /* ICIMVAU */
     case 0xf5c: /* DCIMVAC */
diff --git a/target/arm/cpu.c b/target/arm/cpu.c
index 41557821974..3f9c81e7e9e 100644
--- a/target/arm/cpu.c
+++ b/target/arm/cpu.c
@@ -282,6 +282,11 @@ static void arm_cpu_reset(CPUState *s)
             env->v7m.ccr[M_REG_S] |= R_V7M_CCR_UNALIGN_TRP_MASK;
         }
 
+        if (arm_feature(env, ARM_FEATURE_VFP)) {
+            env->v7m.fpccr[M_REG_NS] = R_V7M_FPCCR_ASPEN_MASK;
+            env->v7m.fpccr[M_REG_S] = R_V7M_FPCCR_ASPEN_MASK |
+                R_V7M_FPCCR_LSPEN_MASK | R_V7M_FPCCR_S_MASK;
+        }
         /* Unlike A/R profile, M profile defines the reset LR value */
         env->regs[14] = 0xffffffff;
 
diff --git a/target/arm/machine.c b/target/arm/machine.c
index b2925496148..09567d4fc66 100644
--- a/target/arm/machine.c
+++ b/target/arm/machine.c
@@ -305,6 +305,21 @@ static const VMStateDescription vmstate_m_v8m = {
     }
 };
 
+static const VMStateDescription vmstate_m_fp = {
+    .name = "cpu/m/fp",
+    .version_id = 1,
+    .minimum_version_id = 1,
+    .needed = vfp_needed,
+    .fields = (VMStateField[]) {
+        VMSTATE_UINT32_ARRAY(env.v7m.fpcar, ARMCPU, M_REG_NUM_BANKS),
+        VMSTATE_UINT32_ARRAY(env.v7m.fpccr, ARMCPU, M_REG_NUM_BANKS),
+        VMSTATE_UINT32_ARRAY(env.v7m.fpdscr, ARMCPU, M_REG_NUM_BANKS),
+        VMSTATE_UINT32_ARRAY(env.v7m.cpacr, ARMCPU, M_REG_NUM_BANKS),
+        VMSTATE_UINT32(env.v7m.nsacr, ARMCPU),
+        VMSTATE_END_OF_LIST()
+    }
+};
+
 static const VMStateDescription vmstate_m = {
     .name = "cpu/m",
     .version_id = 4,
@@ -330,6 +345,7 @@ static const VMStateDescription vmstate_m = {
         &vmstate_m_scr,
         &vmstate_m_other_sp,
         &vmstate_m_v8m,
+        &vmstate_m_fp,
         NULL
     }
 };
-- 
2.20.1

