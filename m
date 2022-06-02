Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5227206lfh;
        Thu, 2 Jun 2022 15:59:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxooUmxymsheikzLSl9accx/Snv0tN09D5Es6bYKvah+4q+HyxUzsSZ5MgY3rA+7TdrT6d4
X-Received: by 2002:a05:622a:181:b0:304:ddfd:a0bb with SMTP id s1-20020a05622a018100b00304ddfda0bbmr1340389qtw.425.1654210771679;
        Thu, 02 Jun 2022 15:59:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654210771; cv=none;
        d=google.com; s=arc-20160816;
        b=AkyZZqwZ9GOGtpCNO9/+CK8k8qgc155Nhi4eTZ0Lp6Q2WgWQ9Gm8TfwDgO+NJsywjb
         f8yu6AtYgXw0Ygoh2qhlhdlRgBDhIbDWxDyZeCVIEWiKY6pBoX1QovaeaA1B9aHoND5q
         uorOaGnY2ai9cozVDYGd6AO+aCmMtvftcTJhT3LDK2HtfPt5npKeaZvvEkh4L1U3r9UH
         7ssUlGiVt9EstsXPZCTJgyV8qXaj9hhcayD7es2kkGo3YZwDIJSSgUjND+oWtrFGqCkX
         wLkP8YmD1mNEFxR7Ut4Fj7D4gRaZNh5K77rpdggMR4PDldesxgeiYyIW8O6VsmtGn/qs
         TKRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=HgDKwyzczRHeCVUcDPOzrXt54ML/m2izvxlxKvoxXd8=;
        b=jIRRdDeoQYorxr4D+M3madsU5CU4EfwZlj0I904C1jwk9xeM4ZNQNNS7r15Ra8A1R8
         Xi6k6546n9WfWxt55TxuC7LSoU06KEKOmLAYuLAaEKzV8Ay5RrzA8EjuOIU90K262Bb8
         wY2UykQILp86Kd8ziH0HTk7ndJsR6ijsKL665d+FB8YrbqtykfQ/JrVVv2/M6NB/cGFh
         8GiKFpSRh/E5B7TIibMy7+FIt0CZEGds/9nbE7J3otQ8AcnvNSbNwjSqyjGRUDeKtWX/
         rDcuL6wsoyYEhNZZF2eZBU48HX7DIuarT7PyKqNgrIZmSzruyiZrMgdl/odQTx9ghpdJ
         oOWQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gjFtRYE1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e21-20020ac84e55000000b002f9158436d5si2884962qtw.78.2022.06.02.15.59.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:59:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gjFtRYE1;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44468 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwtmt-0002rc-70
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:59:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39002)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskT-0001iw-Hm
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:59 -0400
Received: from mail-pf1-x42a.google.com ([2607:f8b0:4864:20::42a]:41935)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwskQ-0000zh-Mc
 for qemu-arm@nongnu.org; Thu, 02 Jun 2022 17:52:57 -0400
Received: by mail-pf1-x42a.google.com with SMTP id p8so5801420pfh.8
 for <qemu-arm@nongnu.org>; Thu, 02 Jun 2022 14:52:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=HgDKwyzczRHeCVUcDPOzrXt54ML/m2izvxlxKvoxXd8=;
 b=gjFtRYE1m15O1niQwGJn/daT9cU04KxZLDP03iGS6Xxrtu7RXCl1NDNHVe+btGwc3X
 ljLXZR/nMraSCnTswRwYCwH9hKlHZfCVcLV2MxRd4a+1ybZVI8zyzvUauB7kMl5N4BZJ
 OXUY/cw/LLnZQ1Bn0gzIkwcQ46Bm4xWMp4X6WpKErSaWfT6oCQVZrz5QHkZW4zjOXhbG
 OmPGB47x5uvVjChJz5+jg4prNVljhWyzEXvGuxEX2COD8QQe6na1iS0+JYs4aUrA4mD5
 Ea0JxaIOyudykE3mAZYKDegp54dXYz0sVK8dCAOjn62UjufeTkJ+SQgMzfOIj0LCB3uU
 f+9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=HgDKwyzczRHeCVUcDPOzrXt54ML/m2izvxlxKvoxXd8=;
 b=sr9IZbmFoR4UmrM4OnJnFk7oSG3pc3kHXD1yXAdhucnuwDyhLeq8114H8uYRuW2Mig
 4eFnI7JJ3XHwHtNLQOtKeasrA8X5f+EJ5/UrV89OK7Qez53ARWs+dG2GWBVacC3prtFQ
 ilzyjR+j0n5RHDxmQXK/1Sbh6p188n10KMDc3EOxOZ/s5TJwo90RZZ0FrNEzQ7obX4Ob
 Zzd1nbt9EBIweNJr2N9m36o715dEZ64tk467FyWrkuzfQmu0/D/TTHzq4x5LtUelqJ8N
 Pk84VKG4j2WA6w2Fxvtv5ytHD58DifiaVsUaAodF1FwWPist/aeJPTg5yOKK8jxmRqWE
 sByQ==
X-Gm-Message-State: AOAM532DhRSZ+IW2Sp6ewybyM8cr9xyis5tsh1DaDgbsa4lW5jPFHAQB
 gOprghTynFcOl4JFYke450TTsw==
X-Received: by 2002:a62:3646:0:b0:51b:91c7:fd4a with SMTP id
 d67-20020a623646000000b0051b91c7fd4amr15589319pfa.78.1654206773232; 
 Thu, 02 Jun 2022 14:52:53 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 e14-20020a170902ed8e00b0015edfccfdb5sm4039605plj.50.2022.06.02.14.52.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:52:52 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 67/71] linux-user: Rename sve prctls
Date: Thu,  2 Jun 2022 14:48:49 -0700
Message-Id: <20220602214853.496211-68-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Yjw+3LAA4dzB

Add "sve" to the sve prctl functions, to distinguish
them from the coming "sme" prctls with similar names.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 linux-user/aarch64/target_prctl.h |  8 ++++----
 linux-user/syscall.c              | 12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/linux-user/aarch64/target_prctl.h b/linux-user/aarch64/target_prctl.h
index fdd973e07d..3c2ef734fe 100644
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

