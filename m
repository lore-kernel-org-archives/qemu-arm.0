Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp894196lfp;
        Mon, 20 Jan 2020 17:33:41 -0800 (PST)
X-Google-Smtp-Source: APXvYqxUz4n8WIni1Y1HYCFT+so9TPdV1i3vb3fEq0YmCUza3ZNcy0PHb/MB7mhgWJXQdqHXH5NQ
X-Received: by 2002:a05:6402:1592:: with SMTP id c18mr1752067edv.333.1579570421650;
        Mon, 20 Jan 2020 17:33:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579570421; cv=none;
        d=google.com; s=arc-20160816;
        b=pBlXXjwA3TeTqWEhxSvoB1MGMBc2tMZES27tFCLWAubbFbqYt26cg0OVGDVFenHl4q
         JdRPvNB10b9kp8XhOZKmioam350lFYRKCcFV9tveyXi+y1cdPaNQC1j+LZyUibVP2vW4
         +lJq+UxCTNrXvfyVweLJ5NMMgW5aYUdo8Lx3gqxBqN1ZUrOpuye3XsrPc6TuDg/KQh8u
         Tj73q7kxPwi6thgmlq4D8noKDMkBlkA2zzRSoKnVqEtxd4ovGd5YtO1yKlOiEu7IPsg8
         40MZs5LrsYPQcPBULUySz7lHoD2l2IhHQZUFswe+272PqLe64xSZg9uKe80Svlnahxd4
         a3Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=hz3HUbbfMk3eAwn1j26oE45C8lSGBMv3GzNn4Rl2XPs=;
        b=vrmOU3B4GX9NYkDcvQQFFZZ4i0WNlov/4uSLFxqmETGW2rOf61GuHYPK+w7yI67EFM
         RiKcThTTrK5CD1AqXK4AuvGIvqzvnnPERqukg3R8nCN6w1UT3jzjB9zQ3fZ+xwyLXVKX
         RlrxDQ7wfvVjn9RXujOK8Vu5NNIR85RAucMESyCWVzE+UAgyIF3/xXTOVMe8ni3E3/2J
         SdaD9uTPRr81smzN6d6DIKUqMOoMPiXgrUHDs8ycHC6OLkKAcff1mmY66t4gwBzrCxW8
         6mG2+PQLSh42NZl86H/ZYnufuHf68V7kSYUCXKSbK8f9Q4ZLadMXSPAF+JM7YZnMMZ2Z
         gZnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KDo2PLRR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pj3si23760747ejb.432.2020.01.20.17.33.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 17:33:41 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=KDo2PLRR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46726 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itiQG-0007Sy-Gi
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 20:33:40 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:43684)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1itiPt-0007Qv-Fb
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 20:33:18 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1itiPs-0000ZV-5Q
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 20:33:17 -0500
Received: from mail-pj1-x1041.google.com ([2607:f8b0:4864:20::1041]:51575)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1itiPs-0000Z4-08; Mon, 20 Jan 2020 20:33:16 -0500
Received: by mail-pj1-x1041.google.com with SMTP id d15so557383pjw.1;
 Mon, 20 Jan 2020 17:33:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=sender:from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hz3HUbbfMk3eAwn1j26oE45C8lSGBMv3GzNn4Rl2XPs=;
 b=KDo2PLRR6CoHHZ7kQnMt3AOKVNFG1Urt4xg2A6HPzB0fAWiuG9ylMV9OyT5LtyzmFK
 ExaYiPTclsZj2mSkqGojyTiuta/PpE5Q5gIHYBKgSKUgJ1I42d+GPXNlwBnjWS/WSdpW
 1ZFnQ/pOD8a4p7i8OSbU2tIp0H6/3aFtWXYDsR5FGzi9yuQeS+tewDA+YV22HJ5fvCJ0
 5TbSEeagN1UEN9/EmmvcB297TLMRV2hoxLDSjzQ6GkN0qYt66x1U95mTHxq4ceBoqWmF
 fZAWfZhva6dbeY+ebF4iy4DD2EpH6YXmagpL7dktTBuk2ImG513l87R64k/VJZ1O2++r
 m0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
 :in-reply-to:references:mime-version:content-transfer-encoding;
 bh=hz3HUbbfMk3eAwn1j26oE45C8lSGBMv3GzNn4Rl2XPs=;
 b=KeIMgX4xe7I2oxHyeZKzr8FQ73EkYzLU2bs10i/ZKC9Wx2VHvkWbn3hQ8XDX3p7B/1
 PDFz398TbZR3Lp2J4cW8WfA0tbaFYylwtz7Mjo4a84KJwCWc0hdNnduL2j0Opev8XWiK
 snWpD3B2qlu9o1lGsi1UkohM34XC0kfWSiaRIm8WQP61hFSsj4G6gY6bMjEDW49DFTTk
 +HfTU7ag9BQymRfzWCjUEUbDGUrUrwrJCKZnyyXml+vkFd4mXFnGo6a3N4xX4PppmuGe
 iHmoSMC2+ARNauRKA0VvFNg3b7rtlSHp65z3zi+X9K3IzbFG9SNReg1smdbYsnbdfo7B
 Kq7g==
X-Gm-Message-State: APjAAAVcagwZ/cbVT1h64oEdd6nOOELOhw9KUeq1yxf9fqkHHSDmub5u
 u2aonBMBig4zBioERJ8LdfT8EFgX
X-Received: by 2002:a17:902:6ac7:: with SMTP id
 i7mr2761421plt.66.1579570393890; 
 Mon, 20 Jan 2020 17:33:13 -0800 (PST)
Received: from voyager.ibm.com ([36.255.48.244])
 by smtp.gmail.com with ESMTPSA id x132sm40628397pfc.148.2020.01.20.17.33.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Jan 2020 17:33:13 -0800 (PST)
From: Joel Stanley <joel@jms.id.au>
To: =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH 1/2] aspeed/scu: Create separate write callbacks
Date: Tue, 21 Jan 2020 12:03:01 +1030
Message-Id: <20200121013302.43839-2-joel@jms.id.au>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200121013302.43839-1-joel@jms.id.au>
References: <20200121013302.43839-1-joel@jms.id.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::1041
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LvrkJHm6j/FG

This splits the common write callback into separate ast2400 and ast2500
implementations. This makes it clearer when implementing differing
behaviour.

Signed-off-by: Joel Stanley <joel@jms.id.au>
---
 hw/misc/aspeed_scu.c | 80 +++++++++++++++++++++++++++++++-------------
 1 file changed, 57 insertions(+), 23 deletions(-)

diff --git a/hw/misc/aspeed_scu.c b/hw/misc/aspeed_scu.c
index f62fa25e3474..7108cad8c6a7 100644
--- a/hw/misc/aspeed_scu.c
+++ b/hw/misc/aspeed_scu.c
@@ -232,8 +232,47 @@ static uint64_t aspeed_scu_read(void *opaque, hwaddr offset, unsigned size)
     return s->regs[reg];
 }
 
-static void aspeed_scu_write(void *opaque, hwaddr offset, uint64_t data,
-                             unsigned size)
+static void aspeed_ast2400_scu_write(void *opaque, hwaddr offset,
+                                     uint64_t data, unsigned size)
+{
+    AspeedSCUState *s = ASPEED_SCU(opaque);
+    int reg = TO_REG(offset);
+
+    if (reg >= ASPEED_SCU_NR_REGS) {
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Out-of-bounds write at offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        return;
+    }
+
+    if (reg > PROT_KEY && reg < CPU2_BASE_SEG1 &&
+            !s->regs[PROT_KEY]) {
+        qemu_log_mask(LOG_GUEST_ERROR, "%s: SCU is locked!\n", __func__);
+    }
+
+    trace_aspeed_scu_write(offset, size, data);
+
+    switch (reg) {
+    case PROT_KEY:
+        s->regs[reg] = (data == ASPEED_SCU_PROT_KEY) ? 1 : 0;
+        return;
+    case SILICON_REV:
+    case FREQ_CNTR_EVAL:
+    case VGA_SCRATCH1 ... VGA_SCRATCH8:
+    case RNG_DATA:
+    case FREE_CNTR4:
+    case FREE_CNTR4_EXT:
+        qemu_log_mask(LOG_GUEST_ERROR,
+                      "%s: Write to read-only offset 0x%" HWADDR_PRIx "\n",
+                      __func__, offset);
+        return;
+    }
+
+    s->regs[reg] = data;
+}
+
+static void aspeed_ast2500_scu_write(void *opaque, hwaddr offset,
+                                     uint64_t data, unsigned size)
 {
     AspeedSCUState *s = ASPEED_SCU(opaque);
     int reg = TO_REG(offset);
@@ -257,25 +296,11 @@ static void aspeed_scu_write(void *opaque, hwaddr offset, uint64_t data,
     case PROT_KEY:
         s->regs[reg] = (data == ASPEED_SCU_PROT_KEY) ? 1 : 0;
         return;
-    case CLK_SEL:
-        s->regs[reg] = data;
-        break;
     case HW_STRAP1:
-        if (ASPEED_IS_AST2500(s->regs[SILICON_REV])) {
-            s->regs[HW_STRAP1] |= data;
-            return;
-        }
-        /* Jump to assignment below */
-        break;
+        s->regs[HW_STRAP1] |= data;
+        return;
     case SILICON_REV:
-        if (ASPEED_IS_AST2500(s->regs[SILICON_REV])) {
-            s->regs[HW_STRAP1] &= ~data;
-        } else {
-            qemu_log_mask(LOG_GUEST_ERROR,
-                          "%s: Write to read-only offset 0x%" HWADDR_PRIx "\n",
-                          __func__, offset);
-        }
-        /* Avoid assignment below, we've handled everything */
+        s->regs[HW_STRAP1] &= ~data;
         return;
     case FREQ_CNTR_EVAL:
     case VGA_SCRATCH1 ... VGA_SCRATCH8:
@@ -291,9 +316,18 @@ static void aspeed_scu_write(void *opaque, hwaddr offset, uint64_t data,
     s->regs[reg] = data;
 }
 
-static const MemoryRegionOps aspeed_scu_ops = {
+static const MemoryRegionOps aspeed_ast2400_scu_ops = {
+    .read = aspeed_scu_read,
+    .write = aspeed_ast2400_scu_write,
+    .endianness = DEVICE_LITTLE_ENDIAN,
+    .valid.min_access_size = 4,
+    .valid.max_access_size = 4,
+    .valid.unaligned = false,
+};
+
+static const MemoryRegionOps aspeed_ast2500_scu_ops = {
     .read = aspeed_scu_read,
-    .write = aspeed_scu_write,
+    .write = aspeed_ast2500_scu_write,
     .endianness = DEVICE_LITTLE_ENDIAN,
     .valid.min_access_size = 4,
     .valid.max_access_size = 4,
@@ -469,7 +503,7 @@ static void aspeed_2400_scu_class_init(ObjectClass *klass, void *data)
     asc->calc_hpll = aspeed_2400_scu_calc_hpll;
     asc->apb_divider = 2;
     asc->nr_regs = ASPEED_SCU_NR_REGS;
-    asc->ops = &aspeed_scu_ops;
+    asc->ops = &aspeed_ast2400_scu_ops;
 }
 
 static const TypeInfo aspeed_2400_scu_info = {
@@ -489,7 +523,7 @@ static void aspeed_2500_scu_class_init(ObjectClass *klass, void *data)
     asc->calc_hpll = aspeed_2500_scu_calc_hpll;
     asc->apb_divider = 4;
     asc->nr_regs = ASPEED_SCU_NR_REGS;
-    asc->ops = &aspeed_scu_ops;
+    asc->ops = &aspeed_ast2500_scu_ops;
 }
 
 static const TypeInfo aspeed_2500_scu_info = {
-- 
2.24.1

