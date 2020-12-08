Received: by 2002:a19:ee0a:0:0:0:0:0 with SMTP id g10csp4249249lfb;
        Tue, 8 Dec 2020 10:23:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwwukgvkAOOq7RLAnu3ED872GvjnseCha4j/GERdicKbST30PqM86f+XQlcKmqY3qyRic9R
X-Received: by 2002:a05:6902:530:: with SMTP id y16mr17498512ybs.89.1607451820522;
        Tue, 08 Dec 2020 10:23:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1607451820; cv=none;
        d=google.com; s=arc-20160816;
        b=wTrvCDB23wpua4t3Dqglhgq8PhuvIVQ4IQujI9ZunHYhRJF87vzSHiO9vY+WdDtrSL
         vzXcLo1th2E2U7jDAyu7zCH4SUtxrkmi3miXyUoYXFJfo/1B6G9pmFQf4KnpXwo/ewUr
         7hcng9+gc/YCMAmjjPClXqt3r7sa3GGleDsS6YEPrh98O65AfnUTs6FacJOSZ3JZGcmL
         DzHiVTVIWX8iRGDzh9XatXTYUL0/HmALjMf4xXiIsWL8W3dpPo8ol+/pLe4hn9Ov6mfq
         kb011MVAVzcmA4Ovl86jZuVUlxIhD+zB2O+tlaYIKw4aWL2V0bzrHUcNDMeybXXkHD3G
         Q3/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6YevB6XxUr3y7N2xo8cdsW/ofLzNXY3bTUOzdECTRRM=;
        b=YsPm7GSBPPoL0yiDLHL/tcH0WaijjP68ulz0jE8Mz3oSju6W++aEeCXR5/uAsurNCA
         nH03rgjEM7d46UHlEr9rxgwaIWzNg6uAjVes/IIs0hWffFS+24z3Ce2p8JMXY9tBbcGy
         Q+SfR/e7oGy/zF0amrih8CH1RHyBD2pOTYmXVOG5Q7hv5cyHlKlzBRZrdkO2Mj8X+5mY
         CV8W0sw3EXePRHOgQXQmaJYyKEU0dwXgbSZg1BzoFwlnIcrNE4P8eDVDab75UEDnkWqa
         +HtyF7MPVDL8Cs24qGomXZnspJEx1dLxXIFcj6IbhkuvAI2EmGeA3it/vwcgaMTnY3QP
         MnaQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="gZVBL7U/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8si11486819ybp.242.2020.12.08.10.23.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Dec 2020 10:23:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="gZVBL7U/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49828 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kmheF-00031M-UN
	for alex.bennee@linaro.org; Tue, 08 Dec 2020 13:23:39 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:57306)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJM-0008Fb-FN
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:02:04 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46629)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1kmhJK-0006Qj-0s
 for qemu-arm@nongnu.org; Tue, 08 Dec 2020 13:02:04 -0500
Received: by mail-ot1-x343.google.com with SMTP id w3so15990787otp.13
 for <qemu-arm@nongnu.org>; Tue, 08 Dec 2020 10:02:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6YevB6XxUr3y7N2xo8cdsW/ofLzNXY3bTUOzdECTRRM=;
 b=gZVBL7U/2m3jSDxR/JkjzdQi3og/2NIfsy0zIKm6sMqIGSNZ3gUhro9lzEVMWsDFPi
 uH8WvYFstBErhzmhgGkRJSm5pwhEcYgVmBCk/7KuW6NMekje6+J8nW7qoxrjOsYASve8
 QR6KRCY3FT7Cuo/0xIlVaBpg5GM5ev4D/7IhagkehgChXB0xG+HbJ1NltZh2KJF6uDGX
 LpZg6VCqxW5ZO2ZfaqJ6clUpZzYrlg75qrMhBIyMv5OgmKBKr58Sh31um1NKCQY1tQkX
 eGcRXM3YnHOXgfLPwPyCkktkZC8hAGHZ0wVYYE6zuETuxvQMrNV1WYI0RWM1lqsA92r9
 rr+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6YevB6XxUr3y7N2xo8cdsW/ofLzNXY3bTUOzdECTRRM=;
 b=rDyi0FYoLq6eXZ/LEVckPMyjYjKXm1cmwa6WcNMKGji3fhCQe+t5xoRRbkY/89Zxvt
 qBjWB1jxnyaK29h/pprrzNtT7/rWlVr94c0CunkKZlfbyJaKAB9XaUEy8J2JL2Eiczuz
 xJL1RvIpl2mi9tGSkyzI/XkEF77aitFollGDMXvHZrFuQqEsrTXrm72o3XCabL0Owkeo
 hwOiIAiVgviXvZF+V6XRNKD7T9AinhD+9KNXrRw860T/SiTRbJ8OamrWv4x4objsPvVT
 cNVxbXLKAJ23q4bFxCuK8tJcQTKYvoJ96EuzuXo5W3kNR2jOZ97WhlqbGCBHUUtDQAis
 qAlA==
X-Gm-Message-State: AOAM531zhnkSCjeRpGMoFFl3rkTyCA60/En+4Xb6VLQRL45fMX2AqtzU
 tyHe0ckfVGnPMzxRFMaRbFXfEHFe/e1V+Jqi
X-Received: by 2002:a05:6830:1253:: with SMTP id
 s19mr4193933otp.270.1607450520661; 
 Tue, 08 Dec 2020 10:02:00 -0800 (PST)
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net.
 [187.189.51.144])
 by smtp.gmail.com with ESMTPSA id k20sm3886805oig.35.2020.12.08.10.01.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Dec 2020 10:02:00 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 22/24] target/arm: Enforce alignment for aa64 vector
 LDn/STn (single)
Date: Tue,  8 Dec 2020 12:01:16 -0600
Message-Id: <20201208180118.157911-23-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201208180118.157911-1-richard.henderson@linaro.org>
References: <20201208180118.157911-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::343;
 envelope-from=richard.henderson@linaro.org; helo=mail-ot1-x343.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QlSjkC7dQUg1

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 93065242cc..57042b8bb7 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -3786,6 +3786,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
     int index = is_q << 3 | S << 2 | size;
     int xs, total;
     TCGv_i64 clean_addr, tcg_rn, tcg_ebytes;
+    MemOp mop;
 
     if (extract32(insn, 31, 1)) {
         unallocated_encoding(s);
@@ -3847,6 +3848,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
 
     clean_addr = gen_mte_checkN(s, tcg_rn, !is_load, is_postidx || rn != 31,
                                 scale, total);
+    mop = finalize_memop(s, scale);
 
     tcg_ebytes = tcg_const_i64(1 << scale);
     for (xs = 0; xs < selem; xs++) {
@@ -3854,8 +3856,7 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
             /* Load and replicate to all elements */
             TCGv_i64 tcg_tmp = tcg_temp_new_i64();
 
-            tcg_gen_qemu_ld_i64(tcg_tmp, clean_addr,
-                                get_mem_index(s), s->be_data + scale);
+            tcg_gen_qemu_ld_i64(tcg_tmp, clean_addr, get_mem_index(s), mop);
             tcg_gen_gvec_dup_i64(scale, vec_full_reg_offset(s, rt),
                                  (is_q + 1) * 8, vec_full_reg_size(s),
                                  tcg_tmp);
@@ -3863,9 +3864,9 @@ static void disas_ldst_single_struct(DisasContext *s, uint32_t insn)
         } else {
             /* Load/store one element per register */
             if (is_load) {
-                do_vec_ld(s, rt, index, clean_addr, scale | s->be_data);
+                do_vec_ld(s, rt, index, clean_addr, mop);
             } else {
-                do_vec_st(s, rt, index, clean_addr, scale | s->be_data);
+                do_vec_st(s, rt, index, clean_addr, mop);
             }
         }
         tcg_gen_add_i64(clean_addr, clean_addr, tcg_ebytes);
-- 
2.25.1

