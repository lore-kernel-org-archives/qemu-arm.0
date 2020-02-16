Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4309736lfp;
        Sun, 16 Feb 2020 11:44:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqyQ6EJa0lh0N37fLnuSCCBRQaLC2XvEY7S9YWwZcnjxV2g6N96efpE1AQa5ZgWe2jQybLd3
X-Received: by 2002:a05:620a:535:: with SMTP id h21mr11984877qkh.184.1581882240137;
        Sun, 16 Feb 2020 11:44:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581882240; cv=none;
        d=google.com; s=arc-20160816;
        b=QSo7Lcq/xjuKPDIlmnBQnjmU6RtzYh/piHEoztwIeDiAIg7G5tk/teE5MOmYnUfp/x
         /qqVCJRPgSI90+7+EgG5dq8UA2EkVT1Ras9mucpdh3wvsMSnUOhDwSW1T+bNQib4VK6u
         DuXqQtBKSdzEH4vNKonmNLtEXEsjFes+EJrEBS08RjU1xq0rz+OosG/paEnKWIyTwY6j
         fq+k8JJp3i//26ZIpICoS4yEx3kaQo9gbRxZnoFQae4BqdG+PPWY2F4bDZWyoXkbsdne
         Kwt0jCXUjiXKT5oCG83byKsZlRNn2OA0XMBWnXSncPnme5goUtb0qwmu/dqCVE0Rwx4/
         dKfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=Qe8zug4Z0mtaHwBh2av/LIOpMaLY4DsO8Azuq2pRmxw=;
        b=VigFlTI6yhyD75oUoVYlNWm58jlASwHFMp9QEQ34ulVRUU+W+P1+IioO/Vyjd59jAB
         F2k8BQKjFAib7gm051f10FuAlug0rBtMe9GC/6xVZbN01l4uSPk18HIDTkCpsguWSJUY
         zAR+kQzoK4usap7ZUUbxsUBK48pqn1tPnneFCq4N4PWhOnLBJLt6y+7UPfQGi42N3qvr
         D8mt4UdMSt/K47Z13HWmQoAmbQWa44xpKJbm75Z2Ab/BgXVRer0NR+KbsTH4UeZTLGdV
         9QK0agl13kkat1SBVIj+YJmhyCo8zZGwc/eKlTAqc+ADRJXO/+GCKZ1EDm8TcxlackLr
         VpJw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qcYh2Upb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t18si5424653qvv.42.2020.02.16.11.43.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Feb 2020 11:44:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qcYh2Upb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35704 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3Ppf-0003i8-Hq
	for alex.bennee@linaro.org; Sun, 16 Feb 2020 14:43:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34708)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3PpW-0003eG-6w
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 14:43:51 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3PpV-0005YB-5v
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 14:43:50 -0500
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:44681)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3PpV-0005Wp-0b
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 14:43:49 -0500
Received: by mail-pf1-x444.google.com with SMTP id y5so7691061pfb.11
 for <qemu-arm@nongnu.org>; Sun, 16 Feb 2020 11:43:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Qe8zug4Z0mtaHwBh2av/LIOpMaLY4DsO8Azuq2pRmxw=;
 b=qcYh2Upbxze5Ns3eU6RcXNvldmM2IdObrKSayDRs42WJ4QhBY+tNoZzRnE0ShCA9au
 FuxvVT8L3GGw3BHXuH9MaPfYJkIRHApyxdtZrPaUXI95KDFDeDTd+zbepnxVZDewi7/6
 bqxEvwv64iz7jtJky+XhVEvq+xJijWMIF1tBvLGHjzT/Q6k4D5N/ZK86Wc2tlyOyACET
 zyFwBQdbPEhle0mWN/pbKCPEujmhLKgI85CX3vq6S0huDw4H8IEVLuroWqUXoz7zh5mr
 TDqAKxJX/4ksRhpVje4FNCtw7YFjlHwfe53u/zTyaucxd5wcQMhDCM5lQAUNt3cUluaQ
 CKeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Qe8zug4Z0mtaHwBh2av/LIOpMaLY4DsO8Azuq2pRmxw=;
 b=NuJPEsL+apfKb1Pf4tw2PA20gFElwdPVPOjy4AF85o3O99hGCMP9ahOUNi2IiyU41c
 cyXRiQNBpVtX9Be7GhgB3CdjDnlHETlzXobJNO2Ix5cMDBhWv52ODnND26YdCNLIBz4F
 YoFtGHqVzX/VgODJdMlwADziCEeapIST8n9wvEMxxL4NNmERxBWybJ898eW/7IPb75yX
 BM6/GlxJKd7C9eazKIDZT9Z4EvPsuh9D/xS91uW22x3WoOTUG35pFzvRembyafl/muGl
 p8mbE9oebM2PkOVs1M+2oTbEPvMNn6mFNsW5yWChcP6Iv6yk+Ez3NDD31euYRhf8KL/F
 594w==
X-Gm-Message-State: APjAAAXAGhuUeYRg7TpWpyNMtF1lI18LFsPR6yYNVjACvlRi4Yk0JkBG
 DadqSPhRkTuGfBBaMUbLyI1okw==
X-Received: by 2002:a63:9143:: with SMTP id l64mr8829773pge.435.1581882227941; 
 Sun, 16 Feb 2020 11:43:47 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id y127sm13945188pfg.22.2020.02.16.11.43.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 11:43:47 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 2/4] target/arm: Fix select for aa64_va_parameters_both
Date: Sun, 16 Feb 2020 11:43:41 -0800
Message-Id: <20200216194343.21331-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200216194343.21331-1-richard.henderson@linaro.org>
References: <20200216194343.21331-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6EDLsz21gWKI

Select should always be 0 for a regime with one range.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 46 +++++++++++++++++++++++----------------------
 1 file changed, 24 insertions(+), 22 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index 366dbcf460..b09a501284 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10241,13 +10241,8 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
     bool tbi, tbid, epd, hpd, using16k, using64k;
     int select, tsz;
 
-    /*
-     * Bit 55 is always between the two regions, and is canonical for
-     * determining if address tagging is enabled.
-     */
-    select = extract64(va, 55, 1);
-
     if (!regime_has_2_ranges(mmu_idx)) {
+        select = 0;
         tsz = extract32(tcr, 0, 6);
         using64k = extract32(tcr, 14, 1);
         using16k = extract32(tcr, 15, 1);
@@ -10260,23 +10255,30 @@ ARMVAParameters aa64_va_parameters_both(CPUARMState *env, uint64_t va,
             tbid = extract32(tcr, 29, 1);
         }
         epd = false;
-    } else if (!select) {
-        tsz = extract32(tcr, 0, 6);
-        epd = extract32(tcr, 7, 1);
-        using64k = extract32(tcr, 14, 1);
-        using16k = extract32(tcr, 15, 1);
-        tbi = extract64(tcr, 37, 1);
-        hpd = extract64(tcr, 41, 1);
-        tbid = extract64(tcr, 51, 1);
     } else {
-        int tg = extract32(tcr, 30, 2);
-        using16k = tg == 1;
-        using64k = tg == 3;
-        tsz = extract32(tcr, 16, 6);
-        epd = extract32(tcr, 23, 1);
-        tbi = extract64(tcr, 38, 1);
-        hpd = extract64(tcr, 42, 1);
-        tbid = extract64(tcr, 52, 1);
+        /*
+         * Bit 55 is always between the two regions, and is canonical for
+         * determining if address tagging is enabled.
+         */
+        select = extract64(va, 55, 1);
+        if (!select) {
+            tsz = extract32(tcr, 0, 6);
+            epd = extract32(tcr, 7, 1);
+            using64k = extract32(tcr, 14, 1);
+            using16k = extract32(tcr, 15, 1);
+            tbi = extract64(tcr, 37, 1);
+            hpd = extract64(tcr, 41, 1);
+            tbid = extract64(tcr, 51, 1);
+        } else {
+            int tg = extract32(tcr, 30, 2);
+            using16k = tg == 1;
+            using64k = tg == 3;
+            tsz = extract32(tcr, 16, 6);
+            epd = extract32(tcr, 23, 1);
+            tbi = extract64(tcr, 38, 1);
+            hpd = extract64(tcr, 42, 1);
+            tbid = extract64(tcr, 52, 1);
+        }
     }
     tsz = MIN(tsz, 39);  /* TODO: ARMv8.4-TTST */
     tsz = MAX(tsz, 16);  /* TODO: ARMv8.2-LVA  */
-- 
2.20.1

