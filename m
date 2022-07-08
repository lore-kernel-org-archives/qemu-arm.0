Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp341121lft;
        Fri, 8 Jul 2022 08:32:53 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uQpuQgK3OYvcaSDAMDbA7Z8lHpIGrmqYJMPAX1oxe7AQ6OfxwnjIwH0BYKuHeVd22rvkCx
X-Received: by 2002:ac8:58c6:0:b0:31d:347a:ae11 with SMTP id u6-20020ac858c6000000b0031d347aae11mr3449493qta.371.1657294373440;
        Fri, 08 Jul 2022 08:32:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657294373; cv=none;
        d=google.com; s=arc-20160816;
        b=hTZH3aI4klhiU9Mgjz4mKd0/eYgl4cD90s9R5fnnVKGUCmOyFisgXCSdde3shgGczJ
         9NMmS7dBiKH3uZrT2dmcziY/UCQFY/eJJi9zSK9fC4D/X4wWCCYIjLKj9WV894G1Lbld
         hKHX9F+MpQbn9YA6KCwqPWSdMEC1zmEFmcoVw0W0BTfIOubKCdjGUc8U8/nIT79vwY5G
         IgpOPLXjTZs5sYB5FOIuhQZ3yTUyq2EC74Weqr09dCX/WRxh91GRmjh9GhQ1XCrlnYow
         BfHsFM/69Ie/6LWTp62VSs9Q7ve/t0qgqGK6ezMbOWMFw+JgdAZy1UvYMt1igGoje4zZ
         fvKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=V2fLCOd7w5RVaZMEE/2yClzk5I5RfuvEjcRKKU0Ql6A=;
        b=SrA1XqIWyDQ1RCZvMqsXFeHijtl0OEJnm8TWOIczel5BVDZMVt8GJO7wGxxpEvKuSC
         plopoqjPm7x7G1nsvazvGzvaf87xmy2HMH6EwwsKz0YrHJKrxxBHCJsLNOcYWtzoa5wC
         zZWZEC615cJ4f0yrtAA3nOgTDm400bR7CAtbAlCRPh3SV5UqsNI4ae5jDvmMeEUXqCpi
         DxgwH826eYI6kZYUlPnep+aIISaJiI8ogDEnf9EVou5PKGPAkTtDBkY+N6h1Ub/uPA1/
         1JC83OkhX52SBsrU9DbMaS7UWppykcGmCAjUeaxN8FAuJ9coHq1jde0Pc3eR4E2A8SvX
         Xr9A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dytHw4yH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11-20020a05620a454b00b006af189e3e8bsi11939990qkp.365.2022.07.08.08.32.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:32:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dytHw4yH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37838 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9pyO-0002nh-V8
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:32:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38902)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pmq-0003Mk-LX
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:20:56 -0400
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536]:40692)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pmp-0003F4-1z
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:20:56 -0400
Received: by mail-pg1-x536.google.com with SMTP id i190so10013751pge.7
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:20:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=V2fLCOd7w5RVaZMEE/2yClzk5I5RfuvEjcRKKU0Ql6A=;
 b=dytHw4yHn9aQZiiETbPqvNBq7y0fHoTgmVXEA9wNgNhw7/wa5b4S8S/vO4hv11wdi3
 8TxSlDY2MXKDKNSxyaYf7jMszGmUVtU3zmM9NXy4Sz+s2ym9yfJli7Kdt5ciRFkeC1Bi
 Tx8dA+9YaZTTxVaS3riauBtUxI4mSVh1oZaniW4renTeJn0vcFTCy/d9ceezLUIoCVIz
 WYzAq9v7U0upxK5f2an5o3P+PiLg1Ll/S72XwcyB+ZWcbQUEUd557+GuWen1zCVHqt/W
 RAhNMNk0TpAqdQGEE3uVxh1tzVuUXiLzkeSnDqrcMyePuIJTWcy4DtacOxQJeIyqjw//
 3ISg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=V2fLCOd7w5RVaZMEE/2yClzk5I5RfuvEjcRKKU0Ql6A=;
 b=QPgXa30Vydq7ZccmuHSYhKYrVOduV3GFnkPDd2Id7NCGgIYxs5i2wtEQrK49MIdqsi
 BcEzix9cO39BoeAlrR1x2r8zpMoXte1pJFJzfB32k+VSbEMueuc4lJrn2Hsn7UXsSRLV
 IgWh3DSSQKD/R0DQSAsoquWeN5jtRTdutBa1/wlM5TiiTKTaAIT84/MwgjLScOHScm0M
 KhxNyMacRBF9C/qNVawOG45enZA/OTVrJImN/sLQ0xFNiFJprcc0q0kw4RAC5Stzz6XG
 t/+c8UJ4nJHHXdziFKMpundMl1QPEDGtFDHzHQP7RMYWn5fUlTGUE9qyjzO72idI4QAX
 9k1w==
X-Gm-Message-State: AJIora9/ZMiVTppdxjHSOJfx5eKf7vNQysw2BtYZf+LL2FUQWdq8yIhr
 kx4hVl2b1R6c2FgOOW8cRmjNcGX056jz7nPf
X-Received: by 2002:a63:460f:0:b0:412:7a8b:128c with SMTP id
 t15-20020a63460f000000b004127a8b128cmr3968354pga.270.1657293653809; 
 Fri, 08 Jul 2022 08:20:53 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 cp2-20020a170902e78200b0015e8d4eb1d7sm30067741plb.33.2022.07.08.08.20.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:20:53 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 41/45] linux-user: Rename sve prctls
Date: Fri,  8 Jul 2022 20:45:36 +0530
Message-Id: <20220708151540.18136-42-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
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
X-TUID: bmjMHJBQwpRv

Add "sve" to the sve prctl functions, to distinguish
them from the coming "sme" prctls with similar names.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_prctl.h |  8 ++++----
 linux-user/syscall.c              | 12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index 1d440ffbea..40481e6663 100644
--- a/linux-user/aarch64/target_prctl.h
+++ b/linux-user/aarch64/target_prctl.h
@@ -6,7 +6,7 @@
 #ifndef AARCH64_TARGET_PRCTL_H
 #define AARCH64_TARGET_PRCTL_H
 
-static abi_long do_prctl_get_vl(CPUArchState *env)
+static abi_long do_prctl_sve_get_vl(CPUArchState *env)
 {
     ARMCPU *cpu = env_archcpu(env);
     if (cpu_isar_feature(aa64_sve, cpu)) {
@@ -14,9 +14,9 @@ static abi_long do_prctl_get_vl(CPUArchState *env)
     }
     return -TARGET_EINVAL;
 }
-#define do_prctl_get_vl do_prctl_get_vl
+#define do_prctl_sve_get_vl do_prctl_sve_get_vl
 
-static abi_long do_prctl_set_vl(CPUArchState *env, abi_long arg2)
+static abi_long do_prctl_sve_set_vl(CPUArchState *env, abi_long arg2)
 {
     /*
      * We cannot support either PR_SVE_SET_VL_ONEXEC or PR_SVE_VL_INHERIT.
@@ -47,7 +47,7 @@ static abi_long do_prctl_set_vl(CPUArchState *env, abi_long arg2)
     }
     return -TARGET_EINVAL;
 }
-#define do_prctl_set_vl do_prctl_set_vl
+#define do_prctl_sve_set_vl do_prctl_sve_set_vl
 
 static abi_long do_prctl_reset_keys(CPUArchState *env, abi_long arg2)
 {
diff --git a/linux-user/syscall.c b/linux-user/syscall.c
index 669add74c1..cbde82c907 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6362,11 +6362,11 @@ static abi_long do_prctl_inval1(CPUArchState *env, abi_long arg2)
 #ifndef do_prctl_set_fp_mode
 #define do_prctl_set_fp_mode do_prctl_inval1
 #endif
-#ifndef do_prctl_get_vl
-#define do_prctl_get_vl do_prctl_inval0
+#ifndef do_prctl_sve_get_vl
+#define do_prctl_sve_get_vl do_prctl_inval0
 #endif
-#ifndef do_prctl_set_vl
-#define do_prctl_set_vl do_prctl_inval1
+#ifndef do_prctl_sve_set_vl
+#define do_prctl_sve_set_vl do_prctl_inval1
 #endif
 #ifndef do_prctl_reset_keys
 #define do_prctl_reset_keys do_prctl_inval1
@@ -6431,9 +6431,9 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
     case PR_SET_FP_MODE:
         return do_prctl_set_fp_mode(env, arg2);
     case PR_SVE_GET_VL:
-        return do_prctl_get_vl(env);
+        return do_prctl_sve_get_vl(env);
     case PR_SVE_SET_VL:
-        return do_prctl_set_vl(env, arg2);
+        return do_prctl_sve_set_vl(env, arg2);
     case PR_PAC_RESET_KEYS:
         if (arg3 || arg4 || arg5) {
             return -TARGET_EINVAL;
-- 
2.34.1

