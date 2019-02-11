Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp111507wrp;
        Mon, 11 Feb 2019 16:04:27 -0800 (PST)
X-Google-Smtp-Source: AHgI3IZPncf0oWUHfvE26lvLeJCBHa7Ym2VhlhS2VP+STZI7fFU+FzgznJqQT1qhYOjdK9hZB7X3
X-Received: by 2002:a25:3885:: with SMTP id f127mr720218yba.10.1549929867252;
        Mon, 11 Feb 2019 16:04:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549929867; cv=none;
        d=google.com; s=arc-20160816;
        b=D9T2fohfT3KTejGmk1AsUOWMo8A+UZ3vUSbOaVDa4/XupKxg8c80/GTciis6abYlLe
         Iv1YE+SHhVubSsFrlQEYFieQH/P4g/Fx/6BtjO1TAdBGCqY8E0yGJZllD52ZAqhf+HM7
         aEOnxqVKrLyfkofhXs181XeNFlmwvjPoG6WnxM+RG+CdRH2u6tajuQPnC2RlnFKEkGWS
         5OKeadeNqM47VLxYnTMJJcdd+C4bRoNhIzVKdW9Qsm0ByfwaAg5G7wtJGow5obwsB2bl
         chjg9bQjGWzGzrwal1EH4Bcj0Kv83Ca2uaO8rBRXCEwbJVOghCDgfHEvt0tfnAW9bCVX
         Xniw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=+Gn6j+ksJBWpAxFZK52yAjwPBXTbbLVYAigRV7FM7Ok=;
        b=Sk1BCPfZ5Mt9g7nB1fWs/Zpzg9BY77cO8O+RhaT0D59SBV0jt+zOBB9H8vHY5Kn+o9
         EG9pK8BzmPpXYV/ngkQ+iUUiQwBo11gjvDAawc2sE5epPZ0SPzNC90hjJzQR76ecGc42
         7Y6q6yAm8QDrUiEkYCGQS7sC9mA/aM/fsadKBirAB9B+tcRB8uby6pqI4tCDJubzxbjd
         b1jeaVB0GxiyCrSlnbCWtZjGL8zLuDtOv4ER5VRgIYWXGiw2yz8eBXR1+HHQ1EbPBq4m
         XHugyeH0yt7toNYkMpF3LxTB7YkzTyaiAx57z8UjGW/RGF4vzqZPm9s8Lu/XNtsI2Cg2
         VZQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ac8DMoMC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k190si6203713ybk.288.2019.02.11.16.04.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 11 Feb 2019 16:04:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ac8DMoMC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:58299 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtLYo-0004yZ-JF
	for alex.bennee@linaro.org; Mon, 11 Feb 2019 19:04:26 -0500
Received: from eggs.gnu.org ([209.51.188.92]:38384)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOT-0005e5-TE
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:46 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gtLOJ-0004hy-LX
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:36 -0500
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:46746)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gtLOG-0004cQ-Vr
	for qemu-devel@nongnu.org; Mon, 11 Feb 2019 18:53:35 -0500
Received: by mail-pf1-x441.google.com with SMTP id g6so313819pfh.13
	for <qemu-devel@nongnu.org>; Mon, 11 Feb 2019 15:53:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=+Gn6j+ksJBWpAxFZK52yAjwPBXTbbLVYAigRV7FM7Ok=;
	b=ac8DMoMC77Du0UKl8t/I/Or5G9ZV/w/5o8DiKWO0cNB/qY+9ygG8u71YkPR+bXPQBN
	dye7vBgeRijzbfGCq3puWqRfEF9rE5BhaJO6GlJH9a4YSuQDyMte4+FYPMYBn7RihCq/
	Wrj02sTQCYohJHHiwo5uaQwV25dFElnAnnnf2gv3w6BurBOyTzsJ1oDRwadQ5xnilma3
	QXMr6/hbCWeWFrH31AVUH7+N4IT81jkmsKAUBT4/hls7iIHRsrOQ4NaaDsEte4hjfM0P
	N6kzwC63h97XB1k+f3gY+941Rs52jwzSxcK78P+US+5wrlXhQ7rnXJNHd9GgZ6qpgIpe
	JCpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=+Gn6j+ksJBWpAxFZK52yAjwPBXTbbLVYAigRV7FM7Ok=;
	b=cnyaFD1gRqhYiAVTfOFRkyW6Po3+Vv2W0qGzzidNGpKzqTbJLTr2Ay30AD6eV50lw5
	Z81IF5LPVEHhs0+/uxO7yi1BMXKZ+5uH8OHruV8Dek9LZ1x1PVG9NnURvD/h4CTLRMdo
	D5D3g13nLI5I3x71Js+fSva5F1gMZaOqsCWcSkl1mHkmmIlGm9IQVOe+84Af/u/FemJ2
	A1Wskft2pa+kRf14cKEVp5CfxpkpDry40hnKZLK0e1bNAyHivGE/p9ZsnO7bsEajka32
	NRSHXFUv0pt+90aPe2NvcNZXjz+Ef0e+2F/M8aSQwWofh7fHcZoFf0WFLYWWOERNZgCc
	Y4jg==
X-Gm-Message-State: AHQUAubbev5EwBj17f6tWpjPeigXZ7Q3jluUno/ISKE6vXZqmWUu1rYs
	YTq4WA4/4Agj1fOtFUorVfYb4L1VyO4=
X-Received: by 2002:a63:4105:: with SMTP id o5mr843304pga.396.1549929211123;
	Mon, 11 Feb 2019 15:53:31 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-188-82.tukw.qwest.net.
	[97.113.188.82]) by smtp.gmail.com with ESMTPSA id
	c4sm11861031pgq.85.2019.02.11.15.53.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 11 Feb 2019 15:53:30 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 11 Feb 2019 15:52:53 -0800
Message-Id: <20190211235258.542-24-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
In-Reply-To: <20190211235258.542-1-richard.henderson@linaro.org>
References: <20190211235258.542-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::441
Subject: [Qemu-devel] [PATCH v3 23/28] target/arm: Cache the Tagged bit for
 a page in MemTxAttrs
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xE7imt/sdtNA

This "bit" is a particular value of the page's MemAttr.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 25 +++++++++++++++----------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b979ca0255..e312d62140 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10740,6 +10740,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
     bool guarded = false;
+    uint8_t memattr;
 
     /* TODO:
      * This code does not handle the different format TCR for VTCR_EL2.
@@ -10970,17 +10971,21 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
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

