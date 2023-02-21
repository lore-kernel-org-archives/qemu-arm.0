Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2811716ejb;
        Mon, 20 Feb 2023 18:21:09 -0800 (PST)
X-Google-Smtp-Source: AK7set/Y3p/y6ZIxTvNFb1bDjDLFrkE3dexR6gyvR6Nv0S0Irt6VDWqsiQSL61u/Z5LP6jrLWMH/
X-Received: by 2002:ac8:59cc:0:b0:3b7:ed2c:fbb7 with SMTP id f12-20020ac859cc000000b003b7ed2cfbb7mr5874816qtf.0.1676946069097;
        Mon, 20 Feb 2023 18:21:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676946069; cv=none;
        d=google.com; s=arc-20160816;
        b=mwl1vcC91p6YR74HhFOQsu3alvgQ1LyPQLv9N5Utf0U+UpJsY3pwCKmQYDZw7EQ4Tr
         7UKjcSV7D1bKM9YqzEH479a2rS9qBSmyAzCk3xNoYCpLa/kYozbKbcCA+gnt4Acxfecz
         gjj8qHHAEN46kiSchDbmHTFmi+61Vnt/aBqUEoS7cj14b+uT/trzfP7RVgQchPmAuB3k
         +IJzHYXZJNJwzY9RQOoZnKaFG3TvZ/S0e6xxLCb/SyyfKHz0KHV5GsL8VKVaNBxtmTSh
         g9wlfLvWOcmQBxQwwcAt1cs8xuc1eOIAhyizUIVIzhDj7/GfDrjIwl9sjv4ql3luJliC
         U1KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=cGmftzbsAcVY0beQah1Rt/jBjqLnvx4GYi9E+DOFsUs=;
        b=FSU/81J2WwFURYL5uVWwYbrQHk3VQq2E6KSQ/4eCp1yObkJMHtiEZPHSSDcSdkCvJY
         N3u6AxiN7Zs/M+7AHnPkdFsKAhxnR084DIPbkRmfXyU5+jLzfvnHA1tFvR7sMSVWDva/
         0yAHqW6ThuNmqDjevzq8yj0J39QgwydSRfm6yyUDNaY5PoEWhn+iG99jFylxH1J2Gljm
         odo9qgZj6QB6Pb6bVW5ALwCsTSVxUGqsIMkTmsKQeZE+xXxHZ/muCQ5Vpntregq0b7Bf
         RzUrIX36M35OIAZ9VPAzSECvE1E0kQR3hGesCn8xKwJntjK/Xw2MLQ0OnuXfRxYhcPaM
         EKgw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fORRrxiz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y5-20020ac87045000000b003bf9fb87ad1si767963qtm.26.2023.02.20.18.21.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 18:21:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fORRrxiz;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pUIGQ-0001fT-VP; Mon, 20 Feb 2023 21:20:21 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGI-0001dZ-5w
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:10 -0500
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pUIGG-0008F6-8n
 for qemu-devel@nongnu.org; Mon, 20 Feb 2023 21:20:09 -0500
Received: by mail-pj1-x1031.google.com with SMTP id u10so3163971pjc.5
 for <qemu-devel@nongnu.org>; Mon, 20 Feb 2023 18:20:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cGmftzbsAcVY0beQah1Rt/jBjqLnvx4GYi9E+DOFsUs=;
 b=fORRrxizROdpHnr2N6gsnNz/Cyt+aY44j6fDqKepmMvmS0+YbfCeZKKXJ40r1ifH2o
 45mqtZJwfaaoGOYDaRM6j92h0zNixwMdqAurpkGqvzlT5x4R/ai9B7HI9P8thEKrKhdO
 JwCEe4fF6KOtoz/dIKJZP4zDuxT2ZlequQYdFD9t492dP7zTTc7fwIZEuvo6t9bydSRx
 oG8a6MO01q2CMG926dz5Pc3aA0OEXQCntUJ1ehOZXwjgtGTDhawccUUpJaRsssnilDgZ
 /941O797CMaOnnnhw1m4/5KgXXOEEYW1KJzk86/yAkNO+G1LrRF8Cex0iIv54dHGXRCI
 Hm5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cGmftzbsAcVY0beQah1Rt/jBjqLnvx4GYi9E+DOFsUs=;
 b=uX9V2hlHFFflueqiDf5EvYzQW7SyRgUj9+Sp0G7M+koLrDYlh6dI6Ew6dCwAU87rZW
 qVKNBRC0ty3HsG0X7PJ8B7I7zBTC9rAhmmZyE4nq5Bu5yoOx7WrQfV3LJYyrv7Kx9c2Z
 WuWW6uRaXkrGk8WwEhbhZ9DPQYBKd8Oqb1Rbm0xlm2DYqLOzCHVHlDrHE4u3kzxaXJlK
 YNOoCAnsJwiG9lEs2vFi9wITW8rK/6f6nIr7S/nsvt5KHnN2gcLJBIkKOM8bdPrSWfbF
 lYGMl0A4XZYESN2WPGkk89VUOCQzh9CukA8yfsJuw1dgEPxA6NHD+/nkUfkX7Tih2vql
 Pw5A==
X-Gm-Message-State: AO0yUKUcObBC/gTd0s2t+3qnMtSDNFkunVmyeoMrO/V6ZXOR6hHkgPho
 9hUQ1BEpbN+JkEcJt6XyVjaFqlNgUIGvaDYbz64=
X-Received: by 2002:a17:903:283:b0:199:2e77:fe16 with SMTP id
 j3-20020a170903028300b001992e77fe16mr5572084plr.58.1676946006909; 
 Mon, 20 Feb 2023 18:20:06 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 f3-20020a170902e98300b0019141c79b1dsm8559328plb.254.2023.02.20.18.20.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Feb 2023 18:20:06 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v2 08/14] target/arm: Add name argument to
 output_vector_union_type
Date: Mon, 20 Feb 2023 16:19:45 -1000
Message-Id: <20230221021951.453601-9-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230221021951.453601-1-richard.henderson@linaro.org>
References: <20230221021951.453601-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ZPuZV2f+M/YR

This will make the function usable between SVE and SME.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/gdbstub64.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/target/arm/gdbstub64.c b/target/arm/gdbstub64.c
index d0e1305f6f..36166bf81e 100644
--- a/target/arm/gdbstub64.c
+++ b/target/arm/gdbstub64.c
@@ -210,7 +210,8 @@ int aarch64_gdb_set_sve_reg(CPUARMState *env, uint8_t *buf, int reg)
     return 0;
 }
 
-static void output_vector_union_type(GString *s, int reg_width)
+static void output_vector_union_type(GString *s, int reg_width,
+                                     const char *name)
 {
     struct TypeSize {
         const char *gdb_type;
@@ -240,39 +241,38 @@ static void output_vector_union_type(GString *s, int reg_width)
     };
 
     static const char suf[] = { 'q', 'd', 's', 'h', 'b' };
-
-    g_autoptr(GString) ts = g_string_new("");
     int i, j, bits;
 
     /* First define types and totals in a whole VL */
     for (i = 0; i < ARRAY_SIZE(vec_lanes); i++) {
-        int count = reg_width / vec_lanes[i].size;
-        g_string_printf(ts, "svev%c%c", vec_lanes[i].sz, vec_lanes[i].suffix);
         g_string_append_printf(s,
-                               "<vector id=\"%s\" type=\"%s\" count=\"%d\"/>",
-                               ts->str, vec_lanes[i].gdb_type, count);
+                               "<vector id=\"%s%c%c\" type=\"%s\" count=\"%d\"/>",
+                               name, vec_lanes[i].sz, vec_lanes[i].suffix,
+                               vec_lanes[i].gdb_type, reg_width / vec_lanes[i].size);
     }
+
     /*
      * Now define a union for each size group containing unsigned and
      * signed and potentially float versions of each size from 128 to
      * 8 bits.
      */
     for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
-        g_string_append_printf(s, "<union id=\"svevn%c\">", suf[i]);
+        g_string_append_printf(s, "<union id=\"%sn%c\">", name, suf[i]);
         for (j = 0; j < ARRAY_SIZE(vec_lanes); j++) {
             if (vec_lanes[j].size == bits) {
-                g_string_append_printf(s, "<field name=\"%c\" type=\"svev%c%c\"/>",
-                                       vec_lanes[j].suffix,
+                g_string_append_printf(s, "<field name=\"%c\" type=\"%s%c%c\"/>",
+                                       vec_lanes[j].suffix, name,
                                        vec_lanes[j].sz, vec_lanes[j].suffix);
             }
         }
         g_string_append(s, "</union>");
     }
+
     /* And now the final union of unions */
-    g_string_append(s, "<union id=\"svev\">");
+    g_string_append_printf(s, "<union id=\"%s\">", name);
     for (bits = 128, i = 0; bits >= 8; bits /= 2, i++) {
-        g_string_append_printf(s, "<field name=\"%c\" type=\"svevn%c\"/>",
-                               suf[i], suf[i]);
+        g_string_append_printf(s, "<field name=\"%c\" type=\"%sn%c\"/>",
+                               suf[i], name, suf[i]);
     }
     g_string_append(s, "</union>");
 }
@@ -292,7 +292,7 @@ int arm_gen_dynamic_svereg_xml(CPUState *cs, int orig_base_reg)
     g_string_append_printf(s, "<feature name=\"org.gnu.gdb.aarch64.sve\">");
 
     /* Create the vector union type. */
-    output_vector_union_type(s, reg_width);
+    output_vector_union_type(s, reg_width, "svev");
 
     /* Create the predicate vector type. */
     g_string_append_printf(s,
-- 
2.34.1

