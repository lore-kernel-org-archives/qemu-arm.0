Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp335057lft;
        Fri, 8 Jul 2022 08:23:46 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uYXl5P/1mmyZV8kb0ZD+3R8O/hPS7PmYMKbCj3JwVQjf0uwMpOkixZnARW1eIwD67/dv6i
X-Received: by 2002:ac8:5a88:0:b0:31e:a700:52ce with SMTP id c8-20020ac85a88000000b0031ea70052cemr2216329qtc.372.1657293826562;
        Fri, 08 Jul 2022 08:23:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1657293826; cv=none;
        d=google.com; s=arc-20160816;
        b=Puht5idldlRNzGidUhXprAXT4c5WlfC26Ihc7vh2patfdL8J5Eks2kzggrOfB14Mp+
         3/XsM28hsDVk3Puxyua0PyNJYG4sv8kaIZnBXpf50AEsb7MHo5LJB5otccHj9rtCBtEk
         wyGyOibE+5mFyldwdaboyBulklGwu1hYpxpanExbwOp1aA3KTwSM/VfhIlwagIZ4pW2M
         dpZaJxTyGjfoB+Io21407vZWRrclxWEHTGTdIRa2peTjtLRTG7/rU72V2cikb3U2hwP6
         PpVvXU47q6kQRWKHVjvUYf88Upss4mESOhyKjcm5LyhF4R4a2TXxu0QbnS8obpAW03zD
         SbfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0yTWCJ1DktZzYQTXntYaiEXNGmdccKtN6uvynpzt0IU=;
        b=pL+hCaZ/FkfIk24aOyw2VaZ63ab4ua0OE53XtKrUYRnvMq8s9NczXVcD7t5HUiu6ow
         VZKCG6Zy1gYty+xt4hdrjNETUqGUN+p1SGqfXP/xEbuDJP1XHIWRTRxwV+aqWa3CW4Hb
         wDAiR3Ty/yrIKjymweNiNOWCPrdk5TEueYZ5vSMiFTV2LwOFmvbQ61iWaLuGpYf4frv+
         9sK3lhFF5a1/Z8SsAwhwsXeVliJHJs8QX4pMkakutN0Fxs/XjzBC8Rg0RXT2yYJEQKXj
         rcT6VuYzV0tzZuY6tEqRuh3Vf0gH3+dEt0rgO+6X7qccsVBMz43OTd9KZELZ+3XjGBct
         34vw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ykcqy5iL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jr14-20020a0562142a8e00b0047068ebd850si25272529qvb.44.2022.07.08.08.23.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Jul 2022 08:23:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ykcqy5iL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38796 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o9ppZ-0000tL-QJ
	for alex.bennee@linaro.org; Fri, 08 Jul 2022 11:23:45 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37190)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pig-0002fP-Ne
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:39 -0400
Received: from mail-pl1-x632.google.com ([2607:f8b0:4864:20::632]:44884)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1o9pie-0002Jh-Ar
 for qemu-arm@nongnu.org; Fri, 08 Jul 2022 11:16:37 -0400
Received: by mail-pl1-x632.google.com with SMTP id q5so962004plr.11
 for <qemu-arm@nongnu.org>; Fri, 08 Jul 2022 08:16:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=0yTWCJ1DktZzYQTXntYaiEXNGmdccKtN6uvynpzt0IU=;
 b=ykcqy5iL8i8pOvOURorfK4XajYxKOyu/nILzzejoGJJTomorraf8K0UoY66N4a03Ho
 EraPgnG9p4j39gAKdGJIb6cx3pOQoXGsYSyqE0Bxo6uuTYepuUYOJclouaOBUDio4Nby
 4mto7YjrmTJelbSupIdr/D8rvrJ3XqIZbGhlVhzkDD3hHfuZDtceJEQfaVPzXxUZCpBT
 IHpotTu/1b75bzRuYAWDegrm5Fifay3T/+DC1OFCU6ZgW9Bw0RvUSX/Vhulp8DoDXNuu
 D/OaTvGfgTTGHvhbEeh3eFWkTOwRB060RnFAPoISBBNHCeyfRKxwjvpE+9F4wUpGl73r
 2ZHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=0yTWCJ1DktZzYQTXntYaiEXNGmdccKtN6uvynpzt0IU=;
 b=knjT+8w66HnDfglR2JdSB2697HRWNq8o7RlVyDjVnSfKJveCZAKYH3gW6+rTCI13ap
 VjqBxSrZEjZVFDdT2BwoRwc2lr6xyyZiAguTVQ7L0MxYeJTJ6QkjsO6kzntgKQLyyEgZ
 UhdpEU2ITqIN3pZpl5/8ZbpwRsHIVpw6i4NScguQ0FfyVOTJ83LXue5s8/FcDBQhKX/5
 V2HHciaG/MsN1ehb5h20XHlBdXFgGncGKuPk8JSi4MX41HkNeljQvN4e88ue4FgBaDA8
 XjU+9WZc5xYemqVdTNEDTZ4ZoIBEEW8Ni20hBN5KvdDki56V/sK+Egg5oU6uBY2whVO8
 7vHA==
X-Gm-Message-State: AJIora8lCcMygPWlZ3IP9HVJY2Bu/lt7jE6Wq51oUtFP9zYFeaT7RB6N
 VcD0IjLGz50+SgB/kI0Y7uQBeQ==
X-Received: by 2002:a17:90b:2c4a:b0:1ef:8f70:e125 with SMTP id
 rw10-20020a17090b2c4a00b001ef8f70e125mr401199pjb.50.1657293395076; 
 Fri, 08 Jul 2022 08:16:35 -0700 (PDT)
Received: from stoup.. ([122.255.60.245]) by smtp.gmail.com with ESMTPSA id
 n17-20020a056a0007d100b0051bada81bc7sm29085774pfu.161.2022.07.08.08.16.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Jul 2022 08:16:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 16/45] target/arm: Handle SME in sve_access_check
Date: Fri,  8 Jul 2022 20:45:11 +0530
Message-Id: <20220708151540.18136-17-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220708151540.18136-1-richard.henderson@linaro.org>
References: <20220708151540.18136-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::632;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x632.google.com
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
X-TUID: MVsNm8qTYsW8

The pseudocode for CheckSVEEnabled gains a check for Streaming
SVE mode, and for SME present but SVE absent.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 22 ++++++++++++++++------
 1 file changed, 16 insertions(+), 6 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index b16d81bf19..b7b64f7358 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -1183,21 +1183,31 @@ static bool fp_access_check(DisasContext *s)
     return true;
 }
 
-/* Check that SVE access is enabled.  If it is, return true.
+/*
+ * Check that SVE access is enabled.  If it is, return true.
  * If not, emit code to generate an appropriate exception and return false.
+ * This function corresponds to CheckSVEEnabled().
  */
 bool sve_access_check(DisasContext *s)
 {
-    if (s->sve_excp_el) {
-        assert(!s->sve_access_checked);
-        s->sve_access_checked = true;
-
+    if (s->pstate_sm || !dc_isar_feature(aa64_sve, s)) {
+        assert(dc_isar_feature(aa64_sme, s));
+        if (!sme_sm_enabled_check(s)) {
+            goto fail_exit;
+        }
+    } else if (s->sve_excp_el) {
         gen_exception_insn_el(s, s->pc_curr, EXCP_UDEF,
                               syn_sve_access_trap(), s->sve_excp_el);
-        return false;
+        goto fail_exit;
     }
     s->sve_access_checked = true;
     return fp_access_check(s);
+
+ fail_exit:
+    /* Assert that we only raise one exception per instruction. */
+    assert(!s->sve_access_checked);
+    s->sve_access_checked = true;
+    return false;
 }
 
 /*
-- 
2.34.1

