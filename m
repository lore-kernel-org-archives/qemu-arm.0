Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp4309764lfp;
        Sun, 16 Feb 2020 11:44:02 -0800 (PST)
X-Google-Smtp-Source: APXvYqy9NGllTjYi/we2j4krM9VSRpL2uDqDsaKGbQB79SwS7q4MQobOjpp3N44RduNCdx10QAo0
X-Received: by 2002:a37:4fc3:: with SMTP id d186mr12070229qkb.100.1581882242487;
        Sun, 16 Feb 2020 11:44:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581882242; cv=none;
        d=google.com; s=arc-20160816;
        b=i6+jVebfZk7Val1lSe2FrBMgN7cjyPMl49XwdQ5F5jKL9KSgjf0ajSkk125vGdoz3R
         7IRoJ8BfRjLzF53CjD/d8DMguzTjQ5VGt9L5kw47tbveTgJaITdlrdUbEEjBQO3BLomS
         QGyNP3oPweCCuFzKhTgTzcF987UbDUHppTXFOiV609M0L2G3XsUwHhpmuhmoo68j3XfJ
         e9/43CF0sKWUNuP7F54Jyh4h+6I6clWWBDr8JRof4FvQ5l4MmR5s4u0wH0S0fMQeEaVZ
         OMcjeISbyDv52vvGGOM1+ukgeOrMBs8I2IoxtFCJeIHIikUXxJ67/cV5p4zkjyUrkyq/
         ODAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=kTU4kvjUvlD0h7Jj4NNpawxNwnsR3vNHE9107ezVFjs=;
        b=SLvD19yT+YmZM23+qnCd+JO5zCbFvtH+qtAVZbdxJhzGX6m4e9/fMb/9JEqP5PJNTo
         wv5KhBGpKMHJWlRP8i6j2sNGqG+CG9hoZnA8QtlQt6bmIrFf+pnuek2UBZLRqPeRw4Qg
         nQ1zGTpFAN+jGSl3HU7R+j6SL0ciJEGXk+CXjBMfbIQOhamI1FVHXyjNJ9+5lT9ZgtUQ
         jnigedjxL5pJavg3kIv2XFfRF3Tphysoz9Q5rOnbKbciKQeBlKxI7UrwhLjfkXGeIpfV
         rm/cV9tbs8pBm5o74yU1BJj22K0kiKEv3f4xQ0M66azGgQ1T3vADtyarcVD/FxNtjrHQ
         XW2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cmtxOL5k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a5si5647099qvm.185.2020.02.16.11.44.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 16 Feb 2020 11:44:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cmtxOL5k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35712 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j3Ppg-0003k9-VZ
	for alex.bennee@linaro.org; Sun, 16 Feb 2020 14:44:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:34727)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1j3PpX-0003f1-AM
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 14:43:52 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1j3PpW-0005aG-BS
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 14:43:51 -0500
Received: from mail-pl1-x644.google.com ([2607:f8b0:4864:20::644]:39388)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1j3PpW-0005Z1-5w
 for qemu-arm@nongnu.org; Sun, 16 Feb 2020 14:43:50 -0500
Received: by mail-pl1-x644.google.com with SMTP id g6so5846845plp.6
 for <qemu-arm@nongnu.org>; Sun, 16 Feb 2020 11:43:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kTU4kvjUvlD0h7Jj4NNpawxNwnsR3vNHE9107ezVFjs=;
 b=cmtxOL5kHvvK3TYlt2ehi6SDl2PmQyf35h8xvMYpWmeBDAwDFczD9b+Qtyd/L807w1
 iFr5z/scXDrOHbq00htBTB3OZ0wslkXwSM0NkiGgB8nZCP4dY6xPT+RfTaPcS54bwZfI
 vudXMK0I23AQJ04DHuexcua8630IZ/JT8p6w7SuqHEolb3lZlrIFbE09VuQTCAZqqkBR
 JyqwXkhvqUsMv2V5AVAOy+8uGgxz3h2IVL52mQORrWwOA7TWAsHsHxnKLp/YpmryO72m
 nYLOZofZbScqGcT9xsRjX2Tv6dnhZBH0GPulR0tOshnSD1E3CMMKhGA88OjZpsdPdGbr
 Ieyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kTU4kvjUvlD0h7Jj4NNpawxNwnsR3vNHE9107ezVFjs=;
 b=GCylFe9l7a4LiDzMfr8ngSitNMMmaggVrr1Ev/xAEAxD9WCYl0+gJk3GizAH0d/wj4
 j/fgWeKs767hr28ST4L588bFlcFv0TsO1Jj0376KsN2rRbPGPhvUbmmScstMRL6oM81W
 4rQe0Xu8y7pZCiU1F4qD4h1bdrqBkKZQqeVERO7Um/KTr1DjE5iT9X0zMIYHFnrgNzus
 bvlTOPLiE/HwBNGb/Dkdbo4OkthKJjSuuUNr5qKEJLnArMHcLkHf2T5RnpVNc+gX01Em
 CJ42HLjijbVkVUlQaZsB9GQ88ianIZE3BMoVKHPPl8MoXEuYPjIvh9hjy5LaSsdH0Cuj
 K7DQ==
X-Gm-Message-State: APjAAAV88IZ6/xC9DGryZZWePj8HiurZChbA36melFPv9dfsuCK9kZde
 waHfv4g21nM4lDD33rU/zrBwJQ==
X-Received: by 2002:a17:90a:b30b:: with SMTP id
 d11mr15832011pjr.22.1581882229133; 
 Sun, 16 Feb 2020 11:43:49 -0800 (PST)
Received: from localhost.localdomain (97-126-123-70.tukw.qwest.net.
 [97.126.123.70])
 by smtp.gmail.com with ESMTPSA id y127sm13945188pfg.22.2020.02.16.11.43.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Feb 2020 11:43:48 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 3/4] target/arm: Remove ttbr1_valid check from
 get_phys_addr_lpae
Date: Sun, 16 Feb 2020 11:43:42 -0800
Message-Id: <20200216194343.21331-4-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200216194343.21331-1-richard.henderson@linaro.org>
References: <20200216194343.21331-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::644
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
X-TUID: 2rWkv5wgINak

Now that aa64_va_parameters_both sets select based on the number
of ranges in the regime, the ttbr1_valid check is redundant.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b09a501284..eec7b01ab3 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -10390,7 +10390,6 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     TCR *tcr = regime_tcr(env, mmu_idx);
     int ap, ns, xn, pxn;
     uint32_t el = regime_el(env, mmu_idx);
-    bool ttbr1_valid;
     uint64_t descaddrmask;
     bool aarch64 = arm_el_is_aa64(env, el);
     bool guarded = false;
@@ -10405,14 +10404,11 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
         param = aa64_va_parameters(env, address, mmu_idx,
                                    access_type != MMU_INST_FETCH);
         level = 0;
-        ttbr1_valid = regime_has_2_ranges(mmu_idx);
         addrsize = 64 - 8 * param.tbi;
         inputsize = 64 - param.tsz;
     } else {
         param = aa32_va_parameters(env, address, mmu_idx);
         level = 1;
-        /* There is no TTBR1 for EL2 */
-        ttbr1_valid = (el != 2);
         addrsize = (mmu_idx == ARMMMUIdx_Stage2 ? 40 : 32);
         inputsize = addrsize - param.tsz;
     }
@@ -10429,7 +10425,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, target_ulong address,
     if (inputsize < addrsize) {
         target_ulong top_bits = sextract64(address, inputsize,
                                            addrsize - inputsize);
-        if (-top_bits != param.select || (param.select && !ttbr1_valid)) {
+        if (-top_bits != param.select) {
             /* The gap between the two regions is a Translation fault */
             fault_type = ARMFault_Translation;
             goto do_fault;
-- 
2.20.1

