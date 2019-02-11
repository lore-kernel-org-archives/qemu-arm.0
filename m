Received: by 2002:a5d:4506:0:0:0:0:0 with SMTP id s6csp1947849wrq;
        Sun, 10 Feb 2019 17:18:29 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbUOd9hH0N3JBMcM6gCtG8JWaGoQ7vUSqbTaowLhYndJeUzPSen9Fab05iDNtCL7Gl6N6sJ
X-Received: by 2002:adf:e706:: with SMTP id c6mr11752391wrm.278.1549847909903;
        Sun, 10 Feb 2019 17:18:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549847909; cv=none;
        d=google.com; s=arc-20160816;
        b=FwaoaDkHnK3pgb1ktYDT8OMoiy2IBisqPU+CrjHfdm1ymwK1PzPfmeE/wEbwANqJ0D
         Aw6JAtSHE6IZZHaLPzy4HyPViYESx8/PuI+jcaHgwH6sj0ejx6xWVAVP/mD9t3H7YSgk
         zKf7WPX8PG5BKIUwFYu4Qps3kikJnVjtn6+B9/3ZK//yTKzNRaWoa57tR1u/1ZV4i5kq
         4qQMvO7i2xVx57QZ9I0yWh1xG0dbbltySP/kySPaFnO6+y1ZVcaYb2w5Qmty3xClKbvQ
         RRdJstKAWGF6VgAk/FhjYx4WpqymnaMcdyjrEQJb7R4EVVEa7ZYvuhlAs/vcNdm93Y7v
         /9Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=0B3omcAJPniMrgzOgR3FjeAcoYmr0yasFqZ8a7CEW3A=;
        b=RhHkzNweJpW7cSOUcTs6HSAZESWqxpv2jzYw//8JazZnu7+OdcXy31mnjLI8gk7t9P
         ukZ6rSIrNfIx7CZ+2Z8mNL3gNXlc33Gl4iuiR9Uw3C4TQQt6h4c/bBROxUO+2hAnMvyS
         DlOX9O0Kp/vwlD9sFqGWq7NAthLSKUMq4/yf69A6hwPYtdI1tFT8kk2vDtN8uI+43C/+
         oln5386C5OLBv71gCsBJAB5PHMnuHJ+hcH2mIvRIvmGOjlIqhng1Z/A1T/yf1OkwKOM5
         qs58iKNmFR75p5dginSY+ZOgQ0s1qDJs9FaoPrCC/f/RPLM2ElfDUHj3832h1u6voVQ7
         oezw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UyE5VRud;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4si6479949wrv.386.2019.02.10.17.18.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Feb 2019 17:18:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=UyE5VRud;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:42203 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gt0Eu-0004qa-Qz
	for alex.bennee@linaro.org; Sun, 10 Feb 2019 20:18:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37393)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05n-0005mc-R0
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:09:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gt05m-0008Rz-4F
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:09:03 -0500
Received: from mail-pg1-x543.google.com ([2607:f8b0:4864:20::543]:37994)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gt05l-0008Op-Aj
	for qemu-arm@nongnu.org; Sun, 10 Feb 2019 20:09:01 -0500
Received: by mail-pg1-x543.google.com with SMTP id g189so4206804pgc.5
	for <qemu-arm@nongnu.org>; Sun, 10 Feb 2019 17:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0B3omcAJPniMrgzOgR3FjeAcoYmr0yasFqZ8a7CEW3A=;
	b=UyE5VRudvKIG2bXgcH7310tdsMfST6huQexl0rC0sTLQVDqqNd77C/99AfxsXNiTds
	7X5sR72QFwV6W3+oL76OeED16EnUQPLSb/gbW9UtdTUTmNndV1H4TF3hYxrEwpc3ge5Y
	4PPULoZLuRYu67GMmZlYDw1At9aihrbz94g73KIpb4QU8VT99euQo0Q/n4fcvRrXDLVY
	2pebnuxWFabtRN1hT+xHE1iEIzNDHVCVH1qos922YjEcTu2qNrRNf3VIn1n9BIg8jZY6
	gPr5KnG7KoybxiC6NPArTogbplVCINbtcjjAcS3jznPdk+HDBdpdv7yP1AFxVLExPOmn
	eujQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0B3omcAJPniMrgzOgR3FjeAcoYmr0yasFqZ8a7CEW3A=;
	b=qmWc9wOieOi2/F0tZhCTCdDSHkqt74/PP5INz20gzBedP502h/8qT1Uym7Ja9wZhDC
	SgMxmbnqnNj33yNha7qs4xHUjwiuTU4OJWHXGQgAJeI6qVVBoUPmn7wNfw4MNY4Bf9/s
	zIOgQZ1D6M9C3cq3Bfn2D2bPjaKv6dF52DbR+84cJaDuxy30+SYAuuEpRRkrcyhWQn9u
	X8mEVeY8cC/m7G3mf91yq3myBe013f/gA5U/POxSHcDuqOjYl9FelKgmZeIPtC/0SCpM
	gCOhh2nwBPh4mjG6ty0h4Xl3c9Zjgm9qd12W0xCJPbxSHE6tH7GCBVVCY/ZE/2+WNadU
	63Ag==
X-Gm-Message-State: AHQUAuZemtDRo8rnsfgjq/ASTh/ckWl4G2IOvEfKH1tTaDl8n/g7tmki
	splmDQlUX1MiTzcecJwBuT8S/A==
X-Received: by 2002:aa7:838b:: with SMTP id u11mr27011617pfm.254.1549847338944;
	Sun, 10 Feb 2019 17:08:58 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	g14sm17177630pfg.27.2019.02.10.17.08.57
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 10 Feb 2019 17:08:58 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 10 Feb 2019 17:08:24 -0800
Message-Id: <20190211010829.29869-22-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211010829.29869-1-richard.henderson@linaro.org>
References: <20190211010829.29869-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::543
Subject: [Qemu-arm] [PATCH v2 21/26] target/arm: Cache the Tagged bit for a
 page in MemTxAttrs
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OfuC41O5Swvo

This "bit" is a particular value of the page's MemAttr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index a3ad5bc54e..3d7a51f8a2 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10719,6 +10719,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
     bool guarded = false;
+    uint8_t memattr;
 
     /* TODO:
      * This code does not handle the different format TCR for VTCR_EL2.
@@ -10949,17 +10950,21 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         txattrs->target_tlb_bit0 = true;
     }
 
+    if (mmu_idx == ARMMMUIdx_S2NS) {
+        memattr = convert_stage2_attrs(env, extract32(attrs, 0, 4));
+    } else {
+        /* Index into MAIR registers for cache attributes */
+        uint64_t mair = env->cp15.mair_el[el];
+        memattr = extract64(mair, extract32(attrs, 0, 3) * 8, 8);
+    }
+
+    /* When in aarch64 mode, and MTE is enabled, remember Tagged in IOTLB.  */
+    if (aarch64 && memattr == 0xf0 && cpu_isar_feature(aa64_mte, cpu)) {
+        txattrs->target_tlb_bit1 = true;
+    }
+
     if (cacheattrs != NULL) {
-        if (mmu_idx == ARMMMUIdx_S2NS) {
-            cacheattrs->attrs = convert_stage2_attrs(env,
-                                                     extract32(attrs, 0, 4));
-        } else {
-            /* Index into MAIR registers for cache attributes */
-            uint8_t attrindx = extract32(attrs, 0, 3);
-            uint64_t mair = env->cp15.mair_el[regime_el(env, mmu_idx)];
-            assert(attrindx <= 7);
-            cacheattrs->attrs = extract64(mair, attrindx * 8, 8);
-        }
+        cacheattrs->attrs = memattr;
         cacheattrs->shareability = extract32(attrs, 6, 2);
     }
 
-- 
2.17.2

