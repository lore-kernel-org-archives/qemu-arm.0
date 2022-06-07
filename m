Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp2432070lfb;
        Tue, 7 Jun 2022 14:41:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyU3s1TDnKHPz+IwniteuKi4AwcA+fhdBRDBqwXWxmwyhh7mUaKndxRcksrqDjMYahuz+x2
X-Received: by 2002:a05:622a:118b:b0:2f9:2241:9a6a with SMTP id m11-20020a05622a118b00b002f922419a6amr24772022qtk.203.1654638074542;
        Tue, 07 Jun 2022 14:41:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654638074; cv=none;
        d=google.com; s=arc-20160816;
        b=X73r4zwmtAUeOD2BXik//ovDztMnbrKlC5JcOCf0oRrvZkKCtK9blyBlOAhtmw2PNL
         BHqIccXTQeg2YKxYSHQhNc/U50vUhOunD8hrqz4Qn0fLBwZ2dM9V2AQw45xstSgm7tyM
         TGw7+wVWhNz81TWd75q45nVfhW9PXbLhobej08Osy3gk0AVWG9Nio4zaElJDuqAJgTH3
         xAnBxCBCVoqAENdjQt+L1nquBySisdle7gM77a6ZgusZ/6kJ6x1LT0vRq98EVf5q3iwJ
         wRNoJV1jbS1puN3DJiQRA4nvzbPZUgfk2PjVNtUJzll6+7OEWLmpjQeyr2UM4az2th2B
         kDng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=peylD0MqTkY6Ni4gfiTgUpLQJeWJHjooqBzEUJMAaO0=;
        b=LCMzKMfFlsaUAn3HN+lPT3INvj15T4J1L3qf6yKgVmH3HWGsBj8qDVO7/xKZMFH3Gf
         4YkU2c7xd6yFVVWEpsO6L/ZDRt/uL2S5QhaXcKxvnWp8zivtqRAx638eFwsnQLG0jYnk
         J762PaTuiW2XJCNsxqU7yw47JCJS9+8BsXzCXGgtcdWSjz078HxwPYUgHUcyCxoEAZuj
         /qqzvBG9Pm+67D99lf7QtKPO+L4FxRRtaS6t9BgY44d0ItVqC75IEHwTL9lS16evxUFO
         xjqXGEyIV6KhAyBRG8HpCfIKDstOs29GKn4+OEeADzhOfqRvCiahtObkhtJGGjpE85KG
         zX6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gOAiS0rV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id kd11-20020a056214400b00b0046b233fd073si5037726qvb.63.2022.06.07.14.41.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 14:41:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gOAiS0rV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41570 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nygwr-0006OL-W2
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 17:41:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:36550)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfx1-0007ee-JE
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:37:19 -0400
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:42665)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nyfwu-0008N6-2Q
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 16:37:19 -0400
Received: by mail-pg1-x534.google.com with SMTP id d129so16946511pgc.9
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 13:37:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=peylD0MqTkY6Ni4gfiTgUpLQJeWJHjooqBzEUJMAaO0=;
 b=gOAiS0rVWkLDFTHVeBQJPQVlA2a66QQH93VP/ML0CbYCn8So8/2uYpQMM09PA3WaPj
 OXS2rhagBQWVdp5iUWYeWzRam9s5hPKpDJlM5TXzotAk3kNy5Q0sND16BL0iXbHVlx17
 +1q4on+V9ep0SVsr03rRAevS9ZS4DDTH2vjWd5qetOV45S7TBCUSonMUN7qER2FXuJPT
 IQ0d2S5ZgObeDVRV8WNXodnWbwiKV9xTStfEYXXf3XwbtpapgY+07NjdyHfCjUFVMO+H
 xfOKy1XlxxZhtQ5ihTnNv3gC0dXOWeX5F6yi/1eMi+Kme/OJnocW41Jd6K3jvH/8pyis
 oo3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=peylD0MqTkY6Ni4gfiTgUpLQJeWJHjooqBzEUJMAaO0=;
 b=h6kNw3T+Y/msUUFXVmWxnMfboUezJkkD6JAXzfCDHyxMtz62gm6/o/a0Ow5bmJ2aom
 NqW393WoGhxHsK6CNNnz3u7sGaigkvMjtZjmW/VSU01pOURfMT/nOJaVr1lX8DFPQ4e5
 iE4MS64YLZswsMc5mZe8oereqiOK7wX5qS7eIxYXIvMrALOKcAzv2FgQnw0kU3ySVtcD
 TqwxjIB2ihsZ/F/sMb1pxeCUEuONKys9lEynJ3uzE7QIM3G+fJZYRZvz16DGSIeacVvk
 Dquj/6eq1QUq/B4Ys4Nb7xhPuLtmHJfN7dHKIdom70CqraZGTkfrgKJbyS6StpHyTNjz
 ULAw==
X-Gm-Message-State: AOAM533EYH3mQjVtFWeNaNeNGtVWRRSybyronVQAIbvUULiPUcSzU8Ei
 AwcEaxeohuHZS48l8/m99YY3XQ==
X-Received: by 2002:a63:1f55:0:b0:3fd:41c5:b53a with SMTP id
 q21-20020a631f55000000b003fd41c5b53amr18274454pgm.441.1654634229656; 
 Tue, 07 Jun 2022 13:37:09 -0700 (PDT)
Received: from stoup.. ([2602:ae:1547:e101:3cf2:c634:5b19:25f6])
 by smtp.gmail.com with ESMTPSA id
 s18-20020aa78d52000000b0050dc76281fdsm13235645pfe.215.2022.06.07.13.37.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Jun 2022 13:37:09 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org,
	qemu-arm@nongnu.org
Subject: [PATCH v2 67/71] linux-user: Rename sve prctls
Date: Tue,  7 Jun 2022 13:33:02 -0700
Message-Id: <20220607203306.657998-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220607203306.657998-1-richard.henderson@linaro.org>
References: <20220607203306.657998-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
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
X-TUID: yYj6n10Z2LML

Add "sve" to the sve prctl functions, to distinguish
them from the coming "sme" prctls with similar names.

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
index f55cdebee5..a7f41ef0ac 100644
--- a/linux-user/syscall.c
+++ b/linux-user/syscall.c
@@ -6365,11 +6365,11 @@ static abi_long do_prctl_inval1(CPUArchState *env, abi_long arg2)
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
@@ -6434,9 +6434,9 @@ static abi_long do_prctl(CPUArchState *env, abi_long option, abi_long arg2,
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

