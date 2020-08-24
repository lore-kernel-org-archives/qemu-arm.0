Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2609980lfy;
        Mon, 24 Aug 2020 07:35:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyMrNB5IlFgTOKTBZUqq6ucgwKa5fANnkhfkqnFp9oHJFtKnzHXSWWHV8OHBp4eMXhN/wfu
X-Received: by 2002:a05:6102:1c3:: with SMTP id s3mr2667122vsq.90.1598279701882;
        Mon, 24 Aug 2020 07:35:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598279701; cv=none;
        d=google.com; s=arc-20160816;
        b=NSOdpFGyc/eb/OvCHbrXzLkQl+JMAU4vjMsc2HGzq6OBm/JvkuoxzEtMgpQB/P65bs
         wL/BVGT3QkQjS46BYH5BJq9kwLylk/w7BIF1kwZVRecd8IFcjZmRfF505JrVGxdUt7PN
         ltqbUXAdW/sC87dIbBbOX14w2qIgPN++5pgHtFSwzoOHdusp6QPzNSbL6dGKPnam8YHl
         BpgG0ErCm6wnMzrOb1inna2dk0n16Rels2i2vxRiRvQhwBLCZBhNTmE0sgss2x1XAk3c
         SktOTvxVr66OWXzLPwF2TAgpIKV2HWb2RVQAzb2o2M7Tme8UEYJT6IHNhJNKYALB5u2+
         jz8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6lKoVS6w1NCGfCNGEILkzyyeD2MIZFL+MD3lJ0uI0KM=;
        b=E8KdQ9meNRkDt93MDW+UF6jb/TNL7Rt5d5U1ficZ6Ho89Uay/0kZ8npQjuMxEpw7OU
         PVEt9obnzyXj51HQYF1sVWzw9BueX9POqVY/KPJ+/0sOxpMSAE9PbNxOcG6ZE3OTpSwm
         gYv5vBXEVF69T6n4whV9zlER7gaVqLXvLcVBYC4JidlCavAyuZuj3/sXMm08exObGYce
         JBXOxWSRKpynkK3CCD/2e6kN34RNyyT1U3dzia2sFWyoq2HB01VFw3BcAq2nOD8cSKRo
         be6vdSnMsqNZ9C3SZ/vl4E6TW9SY2wtezAN9QubvVakeFdIxMilrq9ZqPFmGuVKKxl7X
         emtA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eMqxQHMp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 65si1681095vsi.67.2020.08.24.07.35.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Aug 2020 07:35:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eMqxQHMp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59326 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kADYr-00084n-4q
	for alex.bennee@linaro.org; Mon, 24 Aug 2020 10:35:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43376)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTv-000081-GH
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:29:55 -0400
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:55794)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kADTt-0002jO-Ic
 for qemu-arm@nongnu.org; Mon, 24 Aug 2020 10:29:55 -0400
Received: by mail-wm1-x344.google.com with SMTP id a65so4948982wme.5
 for <qemu-arm@nongnu.org>; Mon, 24 Aug 2020 07:29:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:subject:date:message-id:in-reply-to:references:mime-version
 :content-transfer-encoding;
 bh=6lKoVS6w1NCGfCNGEILkzyyeD2MIZFL+MD3lJ0uI0KM=;
 b=eMqxQHMp6wl1AnKvC5hLmE85048n2ghdrMvZ6jbt3vNrCUTaSXOU+PzykGvr0hIL/A
 kLAFojvL+hGVkSEQmPqKmz4Zu3jFqjxTTrtFShvJYAoBBfxCIvZB3LJsfOpr2q/WBknU
 eAkh2/yDSrzA/IrsvjNYma7AjTVqhqCtxpxCqqX+GxV4AwDojieO+Gz1as55WOdHOhLa
 /Buvcqa7heR1k2m8uyZWh5r3wcA8YeJ09xeatB3O7NONr4wHN/wqKb9wmrnLaE9tOsUt
 pJS8mhxmLvWkzuzL63faHKPwSk74YmvCihNwRnHaFbyyhbhZkORvexcUwPJBJmTAx46g
 7nQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6lKoVS6w1NCGfCNGEILkzyyeD2MIZFL+MD3lJ0uI0KM=;
 b=nkhSOV2Pj/uj7cy8Z1Y1pkcX7fMNOErZNG5cuILhSxrqbYIP+7wi/AJuJLzBoRvIIL
 WjTQ9AsECATpI4rG8NYJzwT5TjbknuqMalRCcLqVmNiroLQgLFsqFLz9xf7dNgyQbcYX
 QQe3C9aKbw1VQhMwJ9WLKBiZo1WtPpZ5tekVuMHe03dleVoyNcNuHAjTQLJdMz1KbK3d
 f4RZYWv5zAjpzTZ9hFGO1DsfnT/RYF5TVfUjWZWgr5dPZpW5Tis8hrHlUOV/iztsFANV
 0VqNAqos1ZMXOGAwa+FF527xhP9UUCTwp+rUFmxGY0vCtClJOuD8OQrzMIvJlxOA6WY+
 ieZw==
X-Gm-Message-State: AOAM532lLS4XcjcO9A/UikeWXE1badQGrOkBadSSOmSugNpEOjXOoUXX
 qDp3C9xn8KgsR9Dx2LcXTGn/FmLhP+t4HNJJ
X-Received: by 2002:a1c:2cd7:: with SMTP id s206mr6114840wms.165.1598279391540; 
 Mon, 24 Aug 2020 07:29:51 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b14sm24499091wrj.93.2020.08.24.07.29.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Aug 2020 07:29:50 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 14/22] target/arm: Use macros instead of open-coding fp16
 conversion helpers
Date: Mon, 24 Aug 2020 15:29:26 +0100
Message-Id: <20200824142934.20850-15-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200824142934.20850-1-peter.maydell@linaro.org>
References: <20200824142934.20850-1-peter.maydell@linaro.org>
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
X-TUID: shIrxSSvEm5F

Now the VFP_CONV_FIX macros can handle fp16's distinction between the
width of the operation and the width of the type used to pass operands,
use the macros rather than the open-coded functions.

This creates an extra six helper functions, all of which we are going
to need for the AArch32 VFP fp16 instructions.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/helper.h     |  6 +++
 target/arm/vfp_helper.c | 86 +++--------------------------------------
 2 files changed, 12 insertions(+), 80 deletions(-)

diff --git a/target/arm/helper.h b/target/arm/helper.h
index 278b4e47fd2..eefd1ac2a72 100644
--- a/target/arm/helper.h
+++ b/target/arm/helper.h
@@ -164,6 +164,10 @@ DEF_HELPER_2(vfp_tosizh, s32, f16, ptr)
 DEF_HELPER_2(vfp_tosizs, s32, f32, ptr)
 DEF_HELPER_2(vfp_tosizd, s32, f64, ptr)
 
+DEF_HELPER_3(vfp_toshh_round_to_zero, i32, f32, i32, ptr)
+DEF_HELPER_3(vfp_toslh_round_to_zero, i32, f32, i32, ptr)
+DEF_HELPER_3(vfp_touhh_round_to_zero, i32, f32, i32, ptr)
+DEF_HELPER_3(vfp_toulh_round_to_zero, i32, f32, i32, ptr)
 DEF_HELPER_3(vfp_toshs_round_to_zero, i32, f32, i32, ptr)
 DEF_HELPER_3(vfp_tosls_round_to_zero, i32, f32, i32, ptr)
 DEF_HELPER_3(vfp_touhs_round_to_zero, i32, f32, i32, ptr)
@@ -202,6 +206,8 @@ DEF_HELPER_3(vfp_sqtod, f64, i64, i32, ptr)
 DEF_HELPER_3(vfp_uhtod, f64, i64, i32, ptr)
 DEF_HELPER_3(vfp_ultod, f64, i64, i32, ptr)
 DEF_HELPER_3(vfp_uqtod, f64, i64, i32, ptr)
+DEF_HELPER_3(vfp_shtoh, f32, i32, i32, ptr)
+DEF_HELPER_3(vfp_uhtoh, f32, i32, i32, ptr)
 DEF_HELPER_3(vfp_sltoh, f16, i32, i32, ptr)
 DEF_HELPER_3(vfp_ultoh, f16, i32, i32, ptr)
 DEF_HELPER_3(vfp_sqtoh, f16, i64, i32, ptr)
diff --git a/target/arm/vfp_helper.c b/target/arm/vfp_helper.c
index 7f7dbe4257f..c88ace3c566 100644
--- a/target/arm/vfp_helper.c
+++ b/target/arm/vfp_helper.c
@@ -434,92 +434,18 @@ VFP_CONV_FIX_A64(sq, s, 32, float32, 64, int64)
 VFP_CONV_FIX(uh, s, 32, float32, 32, uint16)
 VFP_CONV_FIX(ul, s, 32, float32, 32, uint32)
 VFP_CONV_FIX_A64(uq, s, 32, float32, 64, uint64)
+VFP_CONV_FIX(sh, h, 16, float32, 32, int16)
+VFP_CONV_FIX(sl, h, 16, float32, 32, int32)
+VFP_CONV_FIX_A64(sq, h, 16, float32, 64, int64)
+VFP_CONV_FIX(uh, h, 16, float32, 32, uint16)
+VFP_CONV_FIX(ul, h, 16, float32, 32, uint32)
+VFP_CONV_FIX_A64(uq, h, 16, float32, 64, uint64)
 
 #undef VFP_CONV_FIX
 #undef VFP_CONV_FIX_FLOAT
 #undef VFP_CONV_FLOAT_FIX_ROUND
 #undef VFP_CONV_FIX_A64
 
-uint32_t HELPER(vfp_sltoh)(uint32_t x, uint32_t shift, void *fpst)
-{
-    return int32_to_float16_scalbn(x, -shift, fpst);
-}
-
-uint32_t HELPER(vfp_ultoh)(uint32_t x, uint32_t shift, void *fpst)
-{
-    return uint32_to_float16_scalbn(x, -shift, fpst);
-}
-
-uint32_t HELPER(vfp_sqtoh)(uint64_t x, uint32_t shift, void *fpst)
-{
-    return int64_to_float16_scalbn(x, -shift, fpst);
-}
-
-uint32_t HELPER(vfp_uqtoh)(uint64_t x, uint32_t shift, void *fpst)
-{
-    return uint64_to_float16_scalbn(x, -shift, fpst);
-}
-
-uint32_t HELPER(vfp_toshh)(uint32_t x, uint32_t shift, void *fpst)
-{
-    if (unlikely(float16_is_any_nan(x))) {
-        float_raise(float_flag_invalid, fpst);
-        return 0;
-    }
-    return float16_to_int16_scalbn(x, get_float_rounding_mode(fpst),
-                                   shift, fpst);
-}
-
-uint32_t HELPER(vfp_touhh)(uint32_t x, uint32_t shift, void *fpst)
-{
-    if (unlikely(float16_is_any_nan(x))) {
-        float_raise(float_flag_invalid, fpst);
-        return 0;
-    }
-    return float16_to_uint16_scalbn(x, get_float_rounding_mode(fpst),
-                                    shift, fpst);
-}
-
-uint32_t HELPER(vfp_toslh)(uint32_t x, uint32_t shift, void *fpst)
-{
-    if (unlikely(float16_is_any_nan(x))) {
-        float_raise(float_flag_invalid, fpst);
-        return 0;
-    }
-    return float16_to_int32_scalbn(x, get_float_rounding_mode(fpst),
-                                   shift, fpst);
-}
-
-uint32_t HELPER(vfp_toulh)(uint32_t x, uint32_t shift, void *fpst)
-{
-    if (unlikely(float16_is_any_nan(x))) {
-        float_raise(float_flag_invalid, fpst);
-        return 0;
-    }
-    return float16_to_uint32_scalbn(x, get_float_rounding_mode(fpst),
-                                    shift, fpst);
-}
-
-uint64_t HELPER(vfp_tosqh)(uint32_t x, uint32_t shift, void *fpst)
-{
-    if (unlikely(float16_is_any_nan(x))) {
-        float_raise(float_flag_invalid, fpst);
-        return 0;
-    }
-    return float16_to_int64_scalbn(x, get_float_rounding_mode(fpst),
-                                   shift, fpst);
-}
-
-uint64_t HELPER(vfp_touqh)(uint32_t x, uint32_t shift, void *fpst)
-{
-    if (unlikely(float16_is_any_nan(x))) {
-        float_raise(float_flag_invalid, fpst);
-        return 0;
-    }
-    return float16_to_uint64_scalbn(x, get_float_rounding_mode(fpst),
-                                    shift, fpst);
-}
-
 /* Set the current fp rounding mode and return the old one.
  * The argument is a softfloat float_round_ value.
  */
-- 
2.20.1

