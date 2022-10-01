Received: by 2002:a8a:1193:0:0:0:0:0 with SMTP id m19csp464961ocs;
        Sat, 1 Oct 2022 09:39:05 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4XIcpxL4xAoul7shD/jCJyMKgEO6APcx1y+vv2mj5QjUWjxMUowVf6vt6QitnkREAe1j/D
X-Received: by 2002:ac8:5b06:0:b0:35c:e066:b967 with SMTP id m6-20020ac85b06000000b0035ce066b967mr11141224qtw.233.1664642345745;
        Sat, 01 Oct 2022 09:39:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664642345; cv=none;
        d=google.com; s=arc-20160816;
        b=n51ZLXWfD92jdHDwSI74fKUmdnYuotxh8DOSaE+gh0AiREHL3QodUUtg7LGUZFi6wT
         WU5FglHZqz6RMxbX+AwD8vgoutEuy04u6Ntyp0NGjXdImb/poWxjwTe6cAbbbMNaBK7a
         QiPHhBtxWgsqq7uq7HGUtX9Mm5jEAcMpQ5M+STT+4UYBcFFi1xE7H28/OMPWCQjb9mQb
         6a6olNvNjhlLq37poqJGgRBjzPOSOkUbkJyNjVKXQ+xKkIsJDUBk0c0jY1js3njeNj3W
         J/tBjbscZR2/Vj2+6bLaE9GbsYAhZ2c5nwUgToSj7Z0902jci0iCnUk9TspVmGj5IeNo
         A12Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=P8opVlBK6qS9SIIhCXO8x07deEen8LaeMoy6ZbnmA70=;
        b=JuBAhYOQz4qTRQkJF9XenRafi5/4aoTpdnrOwx7XArfeHuyRs7aATesMXwBwMvjKxK
         zFNfJE66TyBdJyYbZ+1CFa78RSQ/TW0Rl/LgrSwX44hrbiFCWyT5B1rMMkD5m6UIG+7j
         oYmbvbCwtlwdnBlFbAm0WJzO0ed5fwxV0WmJQ4OHJriG0Fc8NwdQs9sCC4lfFY4OzV+e
         BEb0Cd6XcTzqr2Lw/eH7hd0RnODb/QQnPRyk5EEq14XRpPiF1rPBMQz6/ZB1XenRSLqh
         +FZE8YiUEbb229DXtmha5P+WGoQKECn0waGQiDjXpfpTOLA6+bYrRZYa4wIMTsWhQADU
         jPpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XAdRu//v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m20-20020a05622a119400b0035d610ab300si2815590qtk.715.2022.10.01.09.39.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Oct 2022 09:39:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="XAdRu//v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42204 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oefW5-0002iS-An
	for alex.bennee@linaro.org; Sat, 01 Oct 2022 12:39:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41556)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHa-0006l5-3t
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:07 -0400
Received: from mail-qt1-x82e.google.com ([2607:f8b0:4864:20::82e]:42726)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oefHW-0006DO-0w
 for qemu-arm@nongnu.org; Sat, 01 Oct 2022 12:24:04 -0400
Received: by mail-qt1-x82e.google.com with SMTP id w2so4335278qtv.9
 for <qemu-arm@nongnu.org>; Sat, 01 Oct 2022 09:24:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=P8opVlBK6qS9SIIhCXO8x07deEen8LaeMoy6ZbnmA70=;
 b=XAdRu//vQrtm6MSyDktvSrC/IqCmY012tqjZz2Xrsz/bOM3CXp0EpydwCu/meiwmDX
 RT/71PsrNX2vJbfW5/Jiw5Fm3UpTRadqPl4trnWoBfxwWt4UZqn0bpVS0KKm4fcnoeRw
 Z31LUjfBRwCQCiBn56kJSQBYbtx/eid8dynmBXrdAyIqINOzOhj+StKzPXNi5mmE4Sx+
 pBbc/4bp+Z6gi2mKUjv4kQ5PpgGj8mLR76ILvFg7cxBiJ6e4o5grJJfNG20sYCW9PMsu
 J3p5JiRO1yzPaqMkfM26Fbj+kVL9WN4IuB2CZibuz3o9bwysa85m/n7ebDeKJVI1HY9k
 Io4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=P8opVlBK6qS9SIIhCXO8x07deEen8LaeMoy6ZbnmA70=;
 b=km9xALy4xPTzKKqT3LWQXDauJd14m+b5LdpcbIChf0wtA2m5yJEPRhTe/fNEWEJoBo
 s5ARkQ9bSNLQLV5SN2Dauy/LbQw79Oxpjj/STxdichlfhnNYX7+qHf1ZKX37KkYdfGVf
 AXf9goiLR2IaC2OyIGpRfXr2TO5Z0GB18jtbbvV17KVoW6Xu6pfVk+8/oxLcaqkLbeFr
 l71QXTSvrO+XiIxtW2uN5vNVMs/HSXPcYBr8mASkyELk1STsxA/g5hEiXKWd17Kn0Q4i
 0h2bF5q96vQHB/6B0SIvHKWPjlW0RslgPenALMwx8BogNnFeZJ5h7SKzBE7722R9lUbH
 pjoQ==
X-Gm-Message-State: ACrzQf0Qajl3XWE82cHg5rTprHXaCuU9u5IxKlrPsINSF0o9JHRbH15d
 PYgHq/sYXssEcam7cvafUJ6sM+lKPRFjcA==
X-Received: by 2002:ac8:57cc:0:b0:35c:b5d1:9024 with SMTP id
 w12-20020ac857cc000000b0035cb5d19024mr11070281qta.214.1664641439948; 
 Sat, 01 Oct 2022 09:23:59 -0700 (PDT)
Received: from stoup.. ([2605:ef80:8084:91a4:f7cb:db31:c505:b931])
 by smtp.gmail.com with ESMTPSA id
 t4-20020a37ea04000000b006d1d8fdea8asm4387445qkj.85.2022.10.01.09.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Oct 2022 09:23:59 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH v3 15/42] target/arm: Remove env argument from
 combined_attrs_fwb
Date: Sat,  1 Oct 2022 09:22:51 -0700
Message-Id: <20221001162318.153420-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221001162318.153420-1-richard.henderson@linaro.org>
References: <20221001162318.153420-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::82e;
 envelope-from=richard.henderson@linaro.org; helo=mail-qt1-x82e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: jkg5+rD6GfZm

This value is unused.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/ptw.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/target/arm/ptw.c b/target/arm/ptw.c
index cb072792a2..2f0eeee161 100644
--- a/target/arm/ptw.c
+++ b/target/arm/ptw.c
@@ -2172,8 +2172,7 @@ static uint8_t force_cacheattr_nibble_wb(uint8_t attr)
  * s1 and s2 for the HCR_EL2.FWB == 1 case, returning the
  * combined attributes in MAIR_EL1 format.
  */
-static uint8_t combined_attrs_fwb(CPUARMState *env,
-                                  ARMCacheAttrs s1, ARMCacheAttrs s2)
+static uint8_t combined_attrs_fwb(ARMCacheAttrs s1, ARMCacheAttrs s2)
 {
     switch (s2.attrs) {
     case 7:
@@ -2246,7 +2245,7 @@ static ARMCacheAttrs combine_cacheattrs(CPUARMState *env,
 
     /* Combine memory type and cacheability attributes */
     if (arm_hcr_el2_eff(env) & HCR_FWB) {
-        ret.attrs = combined_attrs_fwb(env, s1, s2);
+        ret.attrs = combined_attrs_fwb(s1, s2);
     } else {
         ret.attrs = combined_attrs_nofwb(env, s1, s2);
     }
-- 
2.34.1

