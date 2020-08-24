Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2609799lfy;
        Mon, 24 Aug 2020 07:34:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAR1H9dU8mX7OkPxQf91i6/53bGJQeEIadMJ82gLr+tiBqviJIVjxlHcxz7BSyXq4H8QGG
X-Received: by 2002:ab0:d97:: with SMTP id i23mr2426171uak.99.1598279687273;
        Mon, 24 Aug 2020 07:34:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598279687; cv=none;
        d=google.com; s=arc-20160816;
        b=TVwektSInoqkj2F+VOzh08tmX6cSzI79cVWddiEmTwILZraOilIz+WQ5yMqjNcShVK
         2XpcTneKRziMaAz8MA35GBlD7mZA1rAdmBlKFFdtrHbG7s6/6c3i+CvoXhgIGvMpshAT
         xRAxKnFk6rlIGcvJN85p69tIV7NOWs9wWYEadKZL+YY2diftLnX35OctiyM1T0l03ujf
         bsTutUriXOZh8CY8CVQoPg9YR+TQoLh4JqQ4czFkPtG2Q/Me8/Bpzh39zWs12u8Hi+Pd
         t1tbkWFgkz6h/jLm2nbtKE0myz/8vrDd5+QE/96f9s7sKdtPXIQHK5QHSyuoEMkJkEE6
         6KBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=BJyA8j5EKOyFUBzVaSLgfRZIa7blQYjO8DxNxhSh+lw=;
        b=xyGnz60w/WlVL2KyzHkqPJu9xa69XO+3ErVPb8MrM64vkv7EEeXMfZpBn6ZHOYAEsh
         IV0y6b3sXki+DsXi153MtZGBjBYXmiEr2h6RWAhLcMU7sjv3IGeMZqL/f3gns9c6Nkh1
         uRBEWZk0OHRp0akiulHeEsHy6Ed6MacFUn6MfTjfBRzciFZkKwyxo2oe9FnTys7O2CyP
         P75xLFIhKua9ybp2iEshbFVO+OOfHg87UNZmCO70RHTdhUsRzxc9g5KcnWtothQt0XpN
         RyWL69oLxMN/1V/pLV7HyeuWOkKWod9Oxbqkv1KvdVSAQDyG48ocDSqKxuBMgtNUIzBb
         G87g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ORESqnCi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a192si1639264vsd.227.2020.08.24.07.34.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 07:34:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ORESqnCi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:58258 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kADYc-0007d1-Hf
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 10:34:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43338)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTu-00004v-7r
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:29:54 -0400
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:36657)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTs-0002j3-8N
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:29:53 -0400
Received: by mail-wm1-x341.google.com with SMTP id b66so6074701wmb.1
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 07:29:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=BJyA8j5EKOyFUBzVaSLgfRZIa7blQYjO8DxNxhSh+lw=;
 b=ORESqnCia1L4mALsROMyl9iyg0jzU0RNgjmbpw5Loi6zVVCrO3/Akr6hxMVtEwn3P1
 cIyw5S5i2tQtFbUoT2UoEQyoqlL5TCVmmdNhlJnicBEYC7FiVo/0JVmbTwy8imT7NnAU
 oTH4ODTCPigiNCsR+mz96T6/0P/ctUQgg6CAfb4vnZjCTxsPb265dsx6Q1gH5ocdy+f7
 pSWBqUqNGa6jh4JLMzGWZKEqXTtKPe9Mv6cm1mO0ame5q0kC8VHIaaqtW6mITadPqpZW
 RA6aVVyMqWER92mWC4dES4RLMGvzuRWPGpGu4hU8x2a6cCdbO7xyqoWj+A78fU7YyFnL
 3oAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=BJyA8j5EKOyFUBzVaSLgfRZIa7blQYjO8DxNxhSh+lw=;
 b=sca422G6uauIewKuPqRmF0v6mU/wlbLbm3qyLpAiq/lQzfp3F/umVPBNpoQwpMpF6g
 5nJAb9bHXGUcR2PuO3pL3cwXnEXIo5bv6Yk9po7EcP9d0cap1F1ItMbUu2gqMVJXs1ki
 BkIVPH7IvGvBhzQnfYEDJVNzA1fTBVtTviGMtiHwgSiEUBrUhtQUgQaDhkVVZCAE+6iJ
 3GntetP03YZiWkrbYW2bJx1kpNvrseDKWmEk/XlBez87Od2hHwI0N7ElVZtlceS7Dlzz
 oGkYg7neoQFRMDnCVgV4dK9kYqh+DK62fKD+M6hpABISKqyZSj2ObOn2fwLvbi2EZI0s
 Af8Q==
X-Gm-Message-State: AOAM531iHLdaLgvOIceIo/LaaYr2Zn+H8rqaiLVN8rbR8xgv/pX9rCHL
 adHXqGTVMSP+564utXhP7uEdW0QS9OJXT9QV
X-Received: by 2002:a1c:2e46:: with SMTP id u67mr1686020wmu.63.1598279390479; 
 Mon, 24 Aug 2020 07:29:50 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b14sm24499091wrj.93.2020.08.24.07.29.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 07:29:49 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 13/22] target/arm: Make VFP_CONV_FIX macros take separate
 float type and float size
Date: Mon, 24 Aug 2020 15:29:25 +0100
Message-Id: <20200824142934.20850-14-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200824142934.20850-1-peter.maydell@linaro.org>
References: <20200824142934.20850-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
X-TUID: tgm+gGXNngyl

Currently the VFP_CONV_FIX macros take a single fsz argument for the
size of the float type, which is used both to select the name of
the functions to call (eg float32_is_any_nan()) and also for the
type to use for the float inputs and outputs (eg float32).

Separate these into fsz and ftype arguments, so that we can use them
for fp16, which uses 'float16' in the function names but is still
passing inputs and outputs in a 32-bit sized type.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/vfp_helper.c | 46 ++++++++++++++++++++---------------------
 1 file changed, 23 insertions(+), 23 deletions(-)

diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 0297b102c24..7f7dbe4257f 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -394,13 +394,13 @@ float32 VFP_HELPER(fcvts, d)(float64 x, CPUARMState *env)
 }
 
 /* VFP3 fixed point conversion.  */
-#define VFP_CONV_FIX_FLOAT(name, p, fsz, isz, itype) \
-float##fsz HELPER(vfp_##name##to##p)(uint##isz##_t  x, uint32_t shift, \
+#define VFP_CONV_FIX_FLOAT(name, p, fsz, ftype, isz, itype)            \
+ftype HELPER(vfp_##name##to##p)(uint##isz##_t  x, uint32_t shift,      \
                                      void *fpstp) \
 { return itype##_to_##float##fsz##_scalbn(x, -shift, fpstp); }
 
-#define VFP_CONV_FLOAT_FIX_ROUND(name, p, fsz, isz, itype, ROUND, suff)   \
-uint##isz##_t HELPER(vfp_to##name##p##suff)(float##fsz x, uint32_t shift, \
+#define VFP_CONV_FLOAT_FIX_ROUND(name, p, fsz, ftype, isz, itype, ROUND, suff) \
+uint##isz##_t HELPER(vfp_to##name##p##suff)(ftype x, uint32_t shift,      \
                                             void *fpst)                   \
 {                                                                         \
     if (unlikely(float##fsz##_is_any_nan(x))) {                           \
@@ -410,30 +410,30 @@ uint##isz##_t HELPER(vfp_to##name##p##suff)(float##fsz x, uint32_t shift, \
     return float##fsz##_to_##itype##_scalbn(x, ROUND, shift, fpst);       \
 }
 
-#define VFP_CONV_FIX(name, p, fsz, isz, itype)                   \
-VFP_CONV_FIX_FLOAT(name, p, fsz, isz, itype)                     \
-VFP_CONV_FLOAT_FIX_ROUND(name, p, fsz, isz, itype,               \
+#define VFP_CONV_FIX(name, p, fsz, ftype, isz, itype)            \
+VFP_CONV_FIX_FLOAT(name, p, fsz, ftype, isz, itype)              \
+VFP_CONV_FLOAT_FIX_ROUND(name, p, fsz, ftype, isz, itype,        \
                          float_round_to_zero, _round_to_zero)    \
-VFP_CONV_FLOAT_FIX_ROUND(name, p, fsz, isz, itype,               \
+VFP_CONV_FLOAT_FIX_ROUND(name, p, fsz, ftype, isz, itype,        \
                          get_float_rounding_mode(fpst), )
 
-#define VFP_CONV_FIX_A64(name, p, fsz, isz, itype)               \
-VFP_CONV_FIX_FLOAT(name, p, fsz, isz, itype)                     \
-VFP_CONV_FLOAT_FIX_ROUND(name, p, fsz, isz, itype,               \
+#define VFP_CONV_FIX_A64(name, p, fsz, ftype, isz, itype)        \
+VFP_CONV_FIX_FLOAT(name, p, fsz, ftype, isz, itype)              \
+VFP_CONV_FLOAT_FIX_ROUND(name, p, fsz, ftype, isz, itype,        \
                          get_float_rounding_mode(fpst), )
 
-VFP_CONV_FIX(sh, d, 64, 64, int16)
-VFP_CONV_FIX(sl, d, 64, 64, int32)
-VFP_CONV_FIX_A64(sq, d, 64, 64, int64)
-VFP_CONV_FIX(uh, d, 64, 64, uint16)
-VFP_CONV_FIX(ul, d, 64, 64, uint32)
-VFP_CONV_FIX_A64(uq, d, 64, 64, uint64)
-VFP_CONV_FIX(sh, s, 32, 32, int16)
-VFP_CONV_FIX(sl, s, 32, 32, int32)
-VFP_CONV_FIX_A64(sq, s, 32, 64, int64)
-VFP_CONV_FIX(uh, s, 32, 32, uint16)
-VFP_CONV_FIX(ul, s, 32, 32, uint32)
-VFP_CONV_FIX_A64(uq, s, 32, 64, uint64)
+VFP_CONV_FIX(sh, d, 64, float64, 64, int16)
+VFP_CONV_FIX(sl, d, 64, float64, 64, int32)
+VFP_CONV_FIX_A64(sq, d, 64, float64, 64, int64)
+VFP_CONV_FIX(uh, d, 64, float64, 64, uint16)
+VFP_CONV_FIX(ul, d, 64, float64, 64, uint32)
+VFP_CONV_FIX_A64(uq, d, 64, float64, 64, uint64)
+VFP_CONV_FIX(sh, s, 32, float32, 32, int16)
+VFP_CONV_FIX(sl, s, 32, float32, 32, int32)
+VFP_CONV_FIX_A64(sq, s, 32, float32, 64, int64)
+VFP_CONV_FIX(uh, s, 32, float32, 32, uint16)
+VFP_CONV_FIX(ul, s, 32, float32, 32, uint32)
+VFP_CONV_FIX_A64(uq, s, 32, float32, 64, uint64)
 
 #undef VFP_CONV_FIX
 #undef VFP_CONV_FIX_FLOAT
-- 
2.20.1

