Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp8336912wrv;
        Thu, 8 Aug 2019 13:27:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx4JnGSxxjMqNRiFVjUqGooAnYRptFqUwHxp3IBdjiFjuO59IV9Idmhz97nINp3vYYibfhE
X-Received: by 2002:a17:906:d201:: with SMTP id w1mr7059501ejz.303.1565296041674;
        Thu, 08 Aug 2019 13:27:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565296041; cv=none;
        d=google.com; s=arc-20160816;
        b=q4J6AK2mEGvUeZ4PmiytXR8+87XE5Sf9wHM/KxZdATH55W3q/XBoxUb6//HjFjfG1I
         oJrJWqGCsDA176DeR2ssKtHh2yetQ++YdQ55daV6xSvyS1nyhA3QVxCE6FG11lH5Z9Fv
         d9Kb6e5Bp7EdU2FYVJdDKu1UbwQV6samTpFu/2GdVMKBPmYs/m5Bt9m0hETf6ggtspa9
         HUA20hALPYkDMRXX5M2sPpnpYeilpzhQSJrSKF4zczOj0FPpIMXIcYahwnSuGj348DOg
         2RvE/snrbOMUj5StFE7yt2KvEE8Rvr0PoZj60wy9vMQ8VtqBBaYV/3KlsOafD6Uulgn2
         +qYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=h5Yd6DdTtsmby24hx/qMc8uUeIQaxSevj10drk1jtIY=;
        b=s8JgMBgqtlFUPSgHCWbvI9sHlgjhufiO3cuuCryI+k4zNO8LKjLhr2mfSm7YKGfy/0
         aiVX8t1SqAOhXSLfSh0L4mZc9C3Itv52BFfJodduWVAYlkJGAWxkPOZCDqtYYH4Cx5gI
         0MJvizDnVXwjDDEraT/9xlN2o/h0iMZbtAGqadWp81k8tES9rE77nv/Hjap2qYGygIcJ
         u7MxqHVUTybjGelEbPZ3jRp6nI2UgxLdlvIVxxPSgyMaj3Z7LhlIZdQvYlLKTCzVczKr
         3COx1jIKIsjU0ZBQ9lOz7baUT1S1H95BWvjNTZndiyx/Eq4PJtfX/mRPyMSTVXKK6PC0
         UEOw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=li+g5mWa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z39si35755837edd.331.2019.08.08.13.27.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Aug 2019 13:27:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=li+g5mWa;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54952 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hvp0K-0000Hl-PB
	for alex.bennee@linaro.org; Thu, 08 Aug 2019 16:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59793)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <richard.henderson@linaro.org>) id 1hvozQ-0006yi-0c
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 16:26:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1hvozO-0001FS-V4
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 16:26:23 -0400
Received: from mail-pf1-x442.google.com ([2607:f8b0:4864:20::442]:40800)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1hvozO-0001F0-Pp
 for qemu-devel@nongnu.org; Thu, 08 Aug 2019 16:26:22 -0400
Received: by mail-pf1-x442.google.com with SMTP id p184so44721210pfp.7
 for <qemu-devel@nongnu.org>; Thu, 08 Aug 2019 13:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=h5Yd6DdTtsmby24hx/qMc8uUeIQaxSevj10drk1jtIY=;
 b=li+g5mWavems3tksgkMZq3hJ9EOkVKYmGHT+B/KsA1qEQ6FcVD/xNWJpaH/BKO7q/V
 4ze8IUbDi4v+DBlMLcNBT0I6s1P1F0DPMSGVKYujQaj+2spoJ8yApsRUfwTNtdFOisnW
 N+o5T8oXhAN9j2xKJ+2cz1Um3LlNkyWxkRrmeM4Smlx2iC2x/PKoGxUhXRV1Hi6lCS2J
 otjdKO8jyxQZjaYkPNwJqRCAFr6VRWn74uFVSHrE9v+8SeGwMQ3Mcwn1zNSRPTOLFGMR
 i+aVWsTAt9WlGVYsNuoKNVGeXACrhZcKUSvIFunRUR99CLl6UMag9uBcCg4x8lApj3Yf
 F1cQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=h5Yd6DdTtsmby24hx/qMc8uUeIQaxSevj10drk1jtIY=;
 b=GyWUMlE023zautPAiTLN3d+e22EypFaEiZQrN1QrjtRcHjTo0rE43O49/IEgccO8hb
 lR9TG0+sUcmmYy0ptyktUC6ZNP41C43jz2ROjlRGOlO0k72aBAjFrzLOuUN+Tf3wiI91
 jqGn+JH7jgGpezW5Tj1anRbHUPnu+GeeUpjW4VZltoG35WPBkGSSoNPIjidOtSPvodqi
 nNK1Q3JaoHt4fztk69eqkV3MB6XuBkUvzxGNZVK2zS0FDncVlivP8v5D/XtgZ86Ptvp9
 2p1N0LeOohPNtLGeWrqS0CsHU4Qo3gVUwSJZ1bLzccmTI+4wqX7lXLwI66IVlA9Fsb8i
 RMHQ==
X-Gm-Message-State: APjAAAXIpYwIkaPI345abLcw/iObTf96hJAYVSzP5ddCzZJQV+uMzN5q
 c1b7E184RpUAYqQyNKdaSvOsivD8oa4=
X-Received: by 2002:a62:cd45:: with SMTP id o66mr17681624pfg.112.1565295981490; 
 Thu, 08 Aug 2019 13:26:21 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id v12sm2850146pjk.13.2019.08.08.13.26.20
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 08 Aug 2019 13:26:20 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Thu,  8 Aug 2019 13:26:11 -0700
Message-Id: <20190808202616.13782-3-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190808202616.13782-1-richard.henderson@linaro.org>
References: <20190808202616.13782-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::442
Subject: [Qemu-devel] [PATCH 2/7] target/arm: Use tcg_gen_deposit_i32 for
 PKHBT, PKHTB
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: q92j5xN/IhfT

Use deposit as the composit operation to merge the
bits from the two inputs.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 26 ++++++++++----------------
 1 file changed, 10 insertions(+), 16 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 43e005d191..94170af134 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8769,19 +8769,16 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
                         shift = (insn >> 7) & 0x1f;
                         if (insn & (1 << 6)) {
                             /* pkhtb */
-                            if (shift == 0)
+                            if (shift == 0) {
                                 shift = 31;
+                            }
                             tcg_gen_sari_i32(tmp2, tmp2, shift);
-                            tcg_gen_andi_i32(tmp, tmp, 0xffff0000);
-                            tcg_gen_ext16u_i32(tmp2, tmp2);
+                            tcg_gen_deposit_i32(tmp, tmp, tmp2, 0, 16);
                         } else {
                             /* pkhbt */
-                            if (shift)
-                                tcg_gen_shli_i32(tmp2, tmp2, shift);
-                            tcg_gen_ext16u_i32(tmp, tmp);
-                            tcg_gen_andi_i32(tmp2, tmp2, 0xffff0000);
+                            tcg_gen_shli_i32(tmp2, tmp2, shift);
+                            tcg_gen_deposit_i32(tmp, tmp2, tmp, 0, 16);
                         }
-                        tcg_gen_or_i32(tmp, tmp, tmp2);
                         tcg_temp_free_i32(tmp2);
                         store_reg(s, rd, tmp);
                     } else if ((insn & 0x00200020) == 0x00200000) {
@@ -9817,19 +9814,16 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
             shift = ((insn >> 10) & 0x1c) | ((insn >> 6) & 0x3);
             if (insn & (1 << 5)) {
                 /* pkhtb */
-                if (shift == 0)
+                if (shift == 0) {
                     shift = 31;
+                }
                 tcg_gen_sari_i32(tmp2, tmp2, shift);
-                tcg_gen_andi_i32(tmp, tmp, 0xffff0000);
-                tcg_gen_ext16u_i32(tmp2, tmp2);
+                tcg_gen_deposit_i32(tmp, tmp, tmp2, 0, 16);
             } else {
                 /* pkhbt */
-                if (shift)
-                    tcg_gen_shli_i32(tmp2, tmp2, shift);
-                tcg_gen_ext16u_i32(tmp, tmp);
-                tcg_gen_andi_i32(tmp2, tmp2, 0xffff0000);
+                tcg_gen_shli_i32(tmp2, tmp2, shift);
+                tcg_gen_deposit_i32(tmp, tmp2, tmp, 0, 16);
             }
-            tcg_gen_or_i32(tmp, tmp, tmp2);
             tcg_temp_free_i32(tmp2);
             store_reg(s, rd, tmp);
         } else {
-- 
2.17.1

