Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp2022851wre;
        Sat, 2 Jun 2018 13:55:47 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKKSu9aUnZvtSQwEAhwESd+6TLaggs89jm9i6oGkO06criw+pnITEtht8lChbFnTZitkC71J
X-Received: by 2002:ae9:f449:: with SMTP id z9-v6mr6452145qkl.241.1527972947563;
        Sat, 02 Jun 2018 13:55:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527972947; cv=none;
        d=google.com; s=arc-20160816;
        b=TcLEigomb7Vkzl41hxo6WTW6W2bu/7Sv3Ij+jP7nmeTE2PDfJp4xAbc1TP0B0lLjXJ
         ux3mdv6XTO0NlwsZYQD5L/ibdFgGeSPHVOeXhMY406dLGhhQfwNCdwSpQ40jRgn9crV8
         KVxI01LEGhdXwIkhsW4CzYapNVhHuQ47zi5XXlaCgsNxyf3hABp1vA4LMoC0QsSh3+fn
         wCox5eO+bIRMd8UlXTJfyqcpIc1/bQEr3Spxh0Z2JZLw1Rla3/pTwFmCB2WB2/q0GxyL
         kdyj80z9W5jkzoKazV4PsrojI96i/FbDE6xOWJZKFqCCHsMffpsuXsfNpOn+8K3pJwkZ
         EMiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=tbsZRzCEBpr8bRJLDMRDqDaMOoyT4vgHKL9jHD/ablE=;
        b=cBCOdzt1TbTwswIjeQtlCmEMVu9Bm0IU9aTRi4ZR2LJ7OfiBfb5xkhio7L0ZdrUS0L
         8uXvYtkisQ70RpyhtECjOG9lLe10rUwj9nx9f+Qx/mLA8j3V+ZDa34i630IOO4F772U1
         2YFh/UBc2G0kPwtQfXLmzG5MeMXmFuwnPaxfRL5mSW+BE61T7HcTz3k9b1ERfwBfE31E
         OQkK9BWueVYx6T2+rXBFHFyx4izpGEabvOfq3i+Q5TheR/p5S1vQkInhTPOfSuGN4eXi
         gt7LGmj5p98gd1OxpHTsINEzsl6GPBBCHFhkR+pVAacegqlmWNV0p7LypZCBPsGo49dl
         JAJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=obzbiX4c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o22-v6si13690183qvh.104.2018.06.02.13.55.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 02 Jun 2018 13:55:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=obzbiX4c;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:32776 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fPDYx-0003Nr-4M
	for alex.bennee@linaro.org; Sat, 02 Jun 2018 16:55:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39809)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPDYi-0003Le-30
	for qemu-arm@nongnu.org; Sat, 02 Jun 2018 16:55:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPDYg-00087c-30
	for qemu-arm@nongnu.org; Sat, 02 Jun 2018 16:55:32 -0400
Received: from mail-qk0-x243.google.com ([2607:f8b0:400d:c09::243]:39314)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fPDYa-00085K-D6; Sat, 02 Jun 2018 16:55:24 -0400
Received: by mail-qk0-x243.google.com with SMTP id g14-v6so10204908qkm.6;
	Sat, 02 Jun 2018 13:55:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=tbsZRzCEBpr8bRJLDMRDqDaMOoyT4vgHKL9jHD/ablE=;
	b=obzbiX4c+yI1Z25Ebh5F00ujs8sMdDzQczFdkwEWD2dxBB8eljZn9DKGGKKptqE5Ys
	xcsFs4otvD/IfcnXGs+Fp4NcgyTom5a11FMnHhnwHowghocikhSwK/4iZ1K91pYmuWIr
	TFRiauCNd6mS98/moVPf3IDwAzs6WYHNCLUvTw50aHiaGkM1uMyapWU4bjtK7EwfJ4g2
	VJfIzkz7FkbocAUCOohUjUYDeNSghog13RG5nEc5IKyHvkKvfreI1rchH/MmK3pUH2zE
	H2dWDVglyeZ3V0FLbFXQgfGqe52GJ6uwerPl3Z0ch/e1v4ngwR1bW2DB2dXsbn6qf4Tu
	X9og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=tbsZRzCEBpr8bRJLDMRDqDaMOoyT4vgHKL9jHD/ablE=;
	b=HzKZhvRJ1mLyEqoxn23c2r136Prur+4Z9Pp8pAYn8L+A6MCSrKWg/XnBABWofF0/+L
	D+T80qWnYIOJ526L/9cnqLycxv7Eq1G6EUKuMa+/aujucNMei2akqdt11ecHWArk57GQ
	1a5m/TaEyTzjrwV5fFYWRLqBhxAogQRoukgnSLAwPGLP1d4nRmuOPxQdnRDoLfSnsagx
	UJctz3y1hCWSKUP1Nl7EOQCPbTUzrel+gpB1unHWIW8yLYkH+i65WrlpebkxYgwUzxYk
	pCJwkPYf9tKhTv9zu+7xyCqyL0w2ONVKjSH/uu4DXCmMtF9bxL+w0XxY75sntCm961WO
	TWdA==
X-Gm-Message-State: APt69E3Y03mepNkRwOc6KayBKodaVu0y0FXF31dMww65Ewi8kn1mliL4
	/3naN/p0G5T1t8FNQDBqtuM=
X-Received: by 2002:a37:4946:: with SMTP id
	w67-v6mr1781113qka.394.1527972923447; 
	Sat, 02 Jun 2018 13:55:23 -0700 (PDT)
Received: from x1.local ([138.117.48.222]) by smtp.gmail.com with ESMTPSA id
	b12-v6sm34679400qtb.57.2018.06.02.13.55.19
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 02 Jun 2018 13:55:22 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: Alistair Francis <alistair@alistair23.me>, Eric Blake <eblake@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Date: Sat,  2 Jun 2018 17:55:11 -0300
Message-Id: <20180602205511.6077-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::243
Subject: [Qemu-arm] [RFC PATCH] hw/registerfields: Deposit fields "in place"
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
Cc: Eric Auger <eric.auger@redhat.com>, qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QRQybbRVcgh8

These macros are always used to deposit a field in place.
Update them to take the pointer argument.

As these macros are constructed using compound statements,
it is easy to not use the return value, and the compiler
doesn't warn. Thus this change makes these macros safer.

This also helps having a simpler/shorter code to review.

Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
---
 hw/arm/smmuv3-internal.h    |  2 +-
 include/hw/registerfields.h | 14 +++++-----
 hw/arm/smmuv3.c             | 28 +++++++++----------
 hw/dma/xlnx-zdma.c          |  6 ++--
 hw/sd/sd.c                  |  4 +--
 hw/sd/sdhci.c               | 56 ++++++++++++++++++-------------------
 6 files changed, 53 insertions(+), 57 deletions(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index a9d714b56e..2f020e2e90 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -203,7 +203,7 @@ static inline bool smmuv3_eventq_enabled(SMMUv3State *s)
 
 static inline void smmu_write_cmdq_err(SMMUv3State *s, uint32_t err_type)
 {
-    s->cmdq.cons = FIELD_DP32(s->cmdq.cons, CMDQ_CONS, ERR, err_type);
+    FIELD_DP32(&s->cmdq.cons, CMDQ_CONS, ERR, err_type);
 }
 
 /* Commands */
diff --git a/include/hw/registerfields.h b/include/hw/registerfields.h
index 2659a58737..14a12f6a48 100644
--- a/include/hw/registerfields.h
+++ b/include/hw/registerfields.h
@@ -45,7 +45,7 @@
 #define ARRAY_FIELD_EX32(regs, reg, field)                                \
     FIELD_EX32((regs)[R_ ## reg], reg, field)
 
-/* Deposit a register field.
+/* Deposit a register field (in place).
  * Assigning values larger then the target field will result in
  * compilation warnings.
  */
@@ -54,20 +54,20 @@
         unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;                \
     } v = { .v = val };                                                   \
     uint32_t d;                                                           \
-    d = deposit32((storage), R_ ## reg ## _ ## field ## _SHIFT,           \
-                  R_ ## reg ## _ ## field ## _LENGTH, v.v);               \
-    d; })
+    d = deposit32(*(storage), R_ ## reg ## _ ## field ## _SHIFT,          \
+                  R_ ## reg ## _ ## field ## _LENGTH, v.v);                \
+    *(storage) = d; })
 #define FIELD_DP64(storage, reg, field, val) ({                           \
     struct {                                                              \
         unsigned int v:R_ ## reg ## _ ## field ## _LENGTH;                \
     } v = { .v = val };                                                   \
     uint64_t d;                                                           \
-    d = deposit64((storage), R_ ## reg ## _ ## field ## _SHIFT,           \
+    d = deposit64(*(storage), R_ ## reg ## _ ## field ## _SHIFT,          \
                   R_ ## reg ## _ ## field ## _LENGTH, v.v);               \
-    d; })
+    *(storage) = d; })
 
 /* Deposit a field to array of registers.  */
 #define ARRAY_FIELD_DP32(regs, reg, field, val)                           \
-    (regs)[R_ ## reg] = FIELD_DP32((regs)[R_ ## reg], reg, field, val);
+    FIELD_DP32(&(regs)[R_ ## reg], reg, field, val);
 
 #endif
diff --git a/hw/arm/smmuv3.c b/hw/arm/smmuv3.c
index 42dc521c13..6406b69d68 100644
--- a/hw/arm/smmuv3.c
+++ b/hw/arm/smmuv3.c
@@ -238,25 +238,25 @@ static void smmuv3_init_regs(SMMUv3State *s)
      * IDR0: stage1 only, AArch64 only, coherent access, 16b ASID,
      *       multi-level stream table
      */
-    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, S1P, 1); /* stage 1 supported */
-    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, TTF, 2); /* AArch64 PTW only */
-    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, COHACC, 1); /* IO coherent */
-    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, ASID16, 1); /* 16-bit ASID */
-    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, TTENDIAN, 2); /* little endian */
-    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, STALL_MODEL, 1); /* No stall */
+    FIELD_DP32(&s->idr[0], IDR0, S1P, 1); /* stage 1 supported */
+    FIELD_DP32(&s->idr[0], IDR0, TTF, 2); /* AArch64 PTW only */
+    FIELD_DP32(&s->idr[0], IDR0, COHACC, 1); /* IO coherent */
+    FIELD_DP32(&s->idr[0], IDR0, ASID16, 1); /* 16-bit ASID */
+    FIELD_DP32(&s->idr[0], IDR0, TTENDIAN, 2); /* little endian */
+    FIELD_DP32(&s->idr[0], IDR0, STALL_MODEL, 1); /* No stall */
     /* terminated transaction will always be aborted/error returned */
-    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, TERM_MODEL, 1);
+    FIELD_DP32(&s->idr[0], IDR0, TERM_MODEL, 1);
     /* 2-level stream table supported */
-    s->idr[0] = FIELD_DP32(s->idr[0], IDR0, STLEVEL, 1);
+    FIELD_DP32(&s->idr[0], IDR0, STLEVEL, 1);
 
-    s->idr[1] = FIELD_DP32(s->idr[1], IDR1, SIDSIZE, SMMU_IDR1_SIDSIZE);
-    s->idr[1] = FIELD_DP32(s->idr[1], IDR1, EVENTQS, SMMU_EVENTQS);
-    s->idr[1] = FIELD_DP32(s->idr[1], IDR1, CMDQS,   SMMU_CMDQS);
+    FIELD_DP32(&s->idr[1], IDR1, SIDSIZE, SMMU_IDR1_SIDSIZE);
+    FIELD_DP32(&s->idr[1], IDR1, EVENTQS, SMMU_EVENTQS);
+    FIELD_DP32(&s->idr[1], IDR1, CMDQS,   SMMU_CMDQS);
 
    /* 4K and 64K granule support */
-    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN4K, 1);
-    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, GRAN64K, 1);
-    s->idr[5] = FIELD_DP32(s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
+    FIELD_DP32(&s->idr[5], IDR5, GRAN4K, 1);
+    FIELD_DP32(&s->idr[5], IDR5, GRAN64K, 1);
+    FIELD_DP32(&s->idr[5], IDR5, OAS, SMMU_IDR5_OAS); /* 44 bits */
 
     s->cmdq.base = deposit64(s->cmdq.base, 0, 5, SMMU_CMDQS);
     s->cmdq.prod = 0;
diff --git a/hw/dma/xlnx-zdma.c b/hw/dma/xlnx-zdma.c
index 8eea757aff..82fa3ea672 100644
--- a/hw/dma/xlnx-zdma.c
+++ b/hw/dma/xlnx-zdma.c
@@ -426,10 +426,8 @@ static void zdma_write_dst(XlnxZDMA *s, uint8_t *buf, uint32_t len)
         }
 
         /* Write back to buffered descriptor.  */
-        s->dsc_dst.words[2] = FIELD_DP32(s->dsc_dst.words[2],
-                                         ZDMA_CH_DST_DSCR_WORD2,
-                                         SIZE,
-                                         dst_size);
+        FIELD_DP32(&s->dsc_dst.words[2],
+                   ZDMA_CH_DST_DSCR_WORD2, SIZE, dst_size);
     }
 }
 
diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 7af19fa06c..0f41028e91 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -301,10 +301,10 @@ static void sd_ocr_powerup(void *opaque)
     assert(!FIELD_EX32(sd->ocr, OCR, CARD_POWER_UP));
 
     /* card power-up OK */
-    sd->ocr = FIELD_DP32(sd->ocr, OCR, CARD_POWER_UP, 1);
+    FIELD_DP32(&sd->ocr, OCR, CARD_POWER_UP, 1);
 
     if (sd->size > 1 * G_BYTE) {
-        sd->ocr = FIELD_DP32(sd->ocr, OCR, CARD_CAPACITY, 1);
+        FIELD_DP32(&sd->ocr, OCR, CARD_CAPACITY, 1);
     }
 }
 
diff --git a/hw/sd/sdhci.c b/hw/sd/sdhci.c
index 63c44a4ee8..d42492f60a 100644
--- a/hw/sd/sdhci.c
+++ b/hw/sd/sdhci.c
@@ -94,21 +94,21 @@ static void sdhci_check_capareg(SDHCIState *s, Error **errp)
     case 4:
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, BUS64BIT_V4);
         trace_sdhci_capareg("64-bit system bus (v4)", val);
-        msk = FIELD_DP64(msk, SDHC_CAPAB, BUS64BIT_V4, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, BUS64BIT_V4, 0);
 
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, UHS_II);
         trace_sdhci_capareg("UHS-II", val);
-        msk = FIELD_DP64(msk, SDHC_CAPAB, UHS_II, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, UHS_II, 0);
 
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, ADMA3);
         trace_sdhci_capareg("ADMA3", val);
-        msk = FIELD_DP64(msk, SDHC_CAPAB, ADMA3, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, ADMA3, 0);
 
     /* fallthrough */
     case 3:
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, ASYNC_INT);
         trace_sdhci_capareg("async interrupt", val);
-        msk = FIELD_DP64(msk, SDHC_CAPAB, ASYNC_INT, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, ASYNC_INT, 0);
 
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, SLOT_TYPE);
         if (val) {
@@ -116,70 +116,70 @@ static void sdhci_check_capareg(SDHCIState *s, Error **errp)
             return;
         }
         trace_sdhci_capareg("slot type", val);
-        msk = FIELD_DP64(msk, SDHC_CAPAB, SLOT_TYPE, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, SLOT_TYPE, 0);
 
         if (val != 2) {
             val = FIELD_EX64(s->capareg, SDHC_CAPAB, EMBEDDED_8BIT);
             trace_sdhci_capareg("8-bit bus", val);
         }
-        msk = FIELD_DP64(msk, SDHC_CAPAB, EMBEDDED_8BIT, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, EMBEDDED_8BIT, 0);
 
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, BUS_SPEED);
         trace_sdhci_capareg("bus speed mask", val);
-        msk = FIELD_DP64(msk, SDHC_CAPAB, BUS_SPEED, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, BUS_SPEED, 0);
 
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, DRIVER_STRENGTH);
         trace_sdhci_capareg("driver strength mask", val);
-        msk = FIELD_DP64(msk, SDHC_CAPAB, DRIVER_STRENGTH, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, DRIVER_STRENGTH, 0);
 
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, TIMER_RETUNING);
         trace_sdhci_capareg("timer re-tuning", val);
-        msk = FIELD_DP64(msk, SDHC_CAPAB, TIMER_RETUNING, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, TIMER_RETUNING, 0);
 
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, SDR50_TUNING);
         trace_sdhci_capareg("use SDR50 tuning", val);
-        msk = FIELD_DP64(msk, SDHC_CAPAB, SDR50_TUNING, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, SDR50_TUNING, 0);
 
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, RETUNING_MODE);
         trace_sdhci_capareg("re-tuning mode", val);
-        msk = FIELD_DP64(msk, SDHC_CAPAB, RETUNING_MODE, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, RETUNING_MODE, 0);
 
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, CLOCK_MULT);
         trace_sdhci_capareg("clock multiplier", val);
-        msk = FIELD_DP64(msk, SDHC_CAPAB, CLOCK_MULT, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, CLOCK_MULT, 0);
 
     /* fallthrough */
     case 2: /* default version */
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, ADMA2);
         trace_sdhci_capareg("ADMA2", val);
-        msk = FIELD_DP64(msk, SDHC_CAPAB, ADMA2, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, ADMA2, 0);
 
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, ADMA1);
         trace_sdhci_capareg("ADMA1", val);
-        msk = FIELD_DP64(msk, SDHC_CAPAB, ADMA1, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, ADMA1, 0);
 
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, BUS64BIT);
         trace_sdhci_capareg("64-bit system bus (v3)", val);
-        msk = FIELD_DP64(msk, SDHC_CAPAB, BUS64BIT, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, BUS64BIT, 0);
 
     /* fallthrough */
     case 1:
         y = FIELD_EX64(s->capareg, SDHC_CAPAB, TOUNIT);
-        msk = FIELD_DP64(msk, SDHC_CAPAB, TOUNIT, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, TOUNIT, 0);
 
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, TOCLKFREQ);
         trace_sdhci_capareg(y ? "timeout (MHz)" : "Timeout (KHz)", val);
         if (sdhci_check_capab_freq_range(s, "timeout", val, errp)) {
             return;
         }
-        msk = FIELD_DP64(msk, SDHC_CAPAB, TOCLKFREQ, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, TOCLKFREQ, 0);
 
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, BASECLKFREQ);
         trace_sdhci_capareg(y ? "base (MHz)" : "Base (KHz)", val);
         if (sdhci_check_capab_freq_range(s, "base", val, errp)) {
             return;
         }
-        msk = FIELD_DP64(msk, SDHC_CAPAB, BASECLKFREQ, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, BASECLKFREQ, 0);
 
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, MAXBLOCKLENGTH);
         if (val >= 3) {
@@ -187,31 +187,31 @@ static void sdhci_check_capareg(SDHCIState *s, Error **errp)
             return;
         }
         trace_sdhci_capareg("max block length", sdhci_get_fifolen(s));
-        msk = FIELD_DP64(msk, SDHC_CAPAB, MAXBLOCKLENGTH, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, MAXBLOCKLENGTH, 0);
 
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, HIGHSPEED);
         trace_sdhci_capareg("high speed", val);
-        msk = FIELD_DP64(msk, SDHC_CAPAB, HIGHSPEED, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, HIGHSPEED, 0);
 
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, SDMA);
         trace_sdhci_capareg("SDMA", val);
-        msk = FIELD_DP64(msk, SDHC_CAPAB, SDMA, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, SDMA, 0);
 
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, SUSPRESUME);
         trace_sdhci_capareg("suspend/resume", val);
-        msk = FIELD_DP64(msk, SDHC_CAPAB, SUSPRESUME, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, SUSPRESUME, 0);
 
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, V33);
         trace_sdhci_capareg("3.3v", val);
-        msk = FIELD_DP64(msk, SDHC_CAPAB, V33, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, V33, 0);
 
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, V30);
         trace_sdhci_capareg("3.0v", val);
-        msk = FIELD_DP64(msk, SDHC_CAPAB, V30, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, V30, 0);
 
         val = FIELD_EX64(s->capareg, SDHC_CAPAB, V18);
         trace_sdhci_capareg("1.8v", val);
-        msk = FIELD_DP64(msk, SDHC_CAPAB, V18, 0);
+        FIELD_DP64(&msk, SDHC_CAPAB, V18, 0);
         break;
 
     default:
@@ -1017,10 +1017,8 @@ static uint64_t sdhci_read(void *opaque, hwaddr offset, unsigned size)
         break;
     case SDHC_PRNSTS:
         ret = s->prnsts;
-        ret = FIELD_DP32(ret, SDHC_PRNSTS, DAT_LVL,
-                         sdbus_get_dat_lines(&s->sdbus));
-        ret = FIELD_DP32(ret, SDHC_PRNSTS, CMD_LVL,
-                         sdbus_get_cmd_line(&s->sdbus));
+        FIELD_DP32(&ret, SDHC_PRNSTS, DAT_LVL, sdbus_get_dat_lines(&s->sdbus));
+        FIELD_DP32(&ret, SDHC_PRNSTS, CMD_LVL, sdbus_get_cmd_line(&s->sdbus));
         break;
     case SDHC_HOSTCTL:
         ret = s->hostctl1 | (s->pwrcon << 8) | (s->blkgap << 16) |
-- 
2.17.1

