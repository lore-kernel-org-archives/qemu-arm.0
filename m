Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3787479dye;
        Wed, 2 Jul 2025 05:51:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXjZuMqKCq1S9wTwQBDn300QYvwXOokcCilRZOUhuun5b6nlRQ6NSeNAvd+Zs0tf0+kJsoCyKpONRaIaw==@linaro.org
X-Google-Smtp-Source: AGHT+IGlqyST+4FdXfASoxNq9KS3rZ6dh49CqaQhNaVcsMyNsH5l4eR936kJUMnmyUWcfSqR3eXo
X-Received: by 2002:a05:6214:f2b:b0:6fa:b03f:8a39 with SMTP id 6a1803df08f44-702b1c1121bmr36459616d6.35.1751460700761;
        Wed, 02 Jul 2025 05:51:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751460700; cv=none;
        d=google.com; s=arc-20240605;
        b=FQZr5GJWNVBZgCuC+XGakFlzHuzx/fRkNYokwWRlig6/xxKhp/bN9xI/K6WsnX8K/h
         MSr1xyx2xGmBhbFYo7FqSmeTqp47lE8Jxwl8+NG9sdpNcvq3KeMFKQ28jmCMCs9+XmVS
         kKDiC9XTpj0qXv7J7wkK+fhBVfla6Kxxez2aFPzAHzpzb8JfGPq2N+83F1YKXyC53OJa
         738dKu4ru9WTa2/aFMdSwTkk+1TjutfRb/cMH2Wti8WuQ1q4SW5EuYYRb1Lu+b5/VPiI
         RnprI/NHRLj0GrvnT4x2Hsk7b3Wb++KATTcc747n5NiA00/Q+X1afyOSstIe3+Spr3uH
         wSWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=6v/8hNQy8fFPp5bDwpch38EpRvO2SIx0CPU+DT6r9Io=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=CLPICeU7fJpT4dMcggzXV/OOS8JCGqMRzbSsiw+xNlIu6UL47yWRKtdmFrObFsIYlW
         h23Gz5ebs81MDAa/Eovulmawwf9vbFkuw0gD1ukyGMF4yje7dJMtpFYZ4Q4YDEJlusne
         UeLZ2ylm4W9GGhHLqn1SA1q1B+iIDghiQTd7baqO3l1eZrNrYB73WdeIPNGDPgOUnD7o
         b3L8JHcGJDNPpIzV1i/MuCPwQSh5Db49G1z0nuYbZbiqjstu684bLGDrOuhHiMulAbM9
         IFyJEG5VV1URBWYJkJp6OfiD/syEiaZyj+P7LAdmUXtqs62ugD87RjLgkJLOxCaqTQni
         hVGw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bXq0ZAa8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6fd7736986fsi147673846d6.258.2025.07.02.05.51.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:51:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bXq0ZAa8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwp2-0002up-3A; Wed, 02 Jul 2025 08:44:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjh-0004WW-0Y
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:50 -0400
Received: from mail-oa1-x30.google.com ([2001:4860:4864:20::30])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwjY-0002B9-9r
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:38:48 -0400
Received: by mail-oa1-x30.google.com with SMTP id
 586e51a60fabf-2ef8dfb3742so1094429fac.3
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751459915; x=1752064715; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6v/8hNQy8fFPp5bDwpch38EpRvO2SIx0CPU+DT6r9Io=;
 b=bXq0ZAa8oCZz3vbZtPDhbk8ektzu/8givoHpRpv/SFGMWK85CyhduOPF/4FLF7btwd
 hMvfgma65+30tx0yuDu4WpvNpkc5m1eJBhv+hEj9QR1NRj4y6pwRURtBIN9HYL3dMwo4
 B/3aZ+anJhWZP2l1DZ/1nEEXGEMNGzTHrRiXdXGY05c3/a8pac9z5Nk38no+MCI6kgUX
 zuxtUffqPMHi0uLcqb1DqhCcIEWLD6+jz2Oe7QR44wadS00WyhutyJXO17O9SWZamt4M
 3UFuO8/KKAG85H0oOj6Ibr5syZXziyhlyfsfEH+5tF4UKOkEXYTeUit7cpAxru2lm7p9
 5Vow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751459915; x=1752064715;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6v/8hNQy8fFPp5bDwpch38EpRvO2SIx0CPU+DT6r9Io=;
 b=mB8dP7fuiyKTVq+wdQ8alJ6pR/pZSzbt9P4bWAn7oiaJfo1oqNXB+xoKo5Ajn6w1LK
 d0SH+JSTcysb/WN3T1o0L5EWamwQAO+bk1co6eKeXa6DMv1YV4/BGpYw8pSWLviIU/hO
 LV4ExuHfYhSM+1XFOzYGDtKlTZmnlNLgQIYH+K7TPmODTecOPpnOhOCxs8UCdmKun0Ly
 g/NsgESUSCyhJflHz8YiItehYHDR/wOxlBerw8HDbSRt/HjtWvUEEMcIEwbcwvnHpBN7
 2eeHNTWuVbrtGK5IgnL/NyJH7J3HfjDy0KGSps7AM5fgNIaS0GDyrpA2MOcZK+CHaoY/
 4JeA==
X-Gm-Message-State: AOJu0Yz4LczW+MMPFkFkY+BprHmJU7PAK0YecS5eAc++CjAsg3EZIArz
 FW1VDHTZ6LXY7B8NaiDSD2aO3XCoUO+UwFGyRiYmGibNw2IMy0HcVO4pu3WWcuAELrI=
X-Gm-Gg: ASbGncvFCDQXTJxV4tJ2ieap94M58ZrRNDYouzhZIRxoj/pCQO+mVTWL6V8eNL+DDUC
 DqCxHNLTRgF1m3m0G3E7RcH6T2QlC1ERMEHClN87+Y68gS/ZZ/pK78c6ULf0FiFQVYI49gKUt6a
 1KQWql0Fr9C5opFdpX4d4yz6jDbtxwQbNfXODEeBOu+558Q2nGh/Y5u0r9OEvD5T4VoUx+kY/qd
 Orjd1RBA+LrqwTN4AMnV93tA0DxMSANMHT9v4FWkJalKMIPMNV1YvVVaB9fo6AIXbWNNDnYLtjn
 12fJ3qJC012eyndnD0fMFGTEFZ/FO5ETHtTHNUDtzClWnExvwZjpQl65un/ERp86OwpVYA==
X-Received: by 2002:a05:6871:2881:b0:2ef:9aa7:becb with SMTP id
 586e51a60fabf-2f5a8c97853mr2030240fac.18.1751459915006; 
 Wed, 02 Jul 2025 05:38:35 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd4ea5d9fsm3843451fac.10.2025.07.02.05.38.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:38:34 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 64/97] target/arm: Move scale by esz into helper_sve_while*
Date: Wed,  2 Jul 2025 06:33:37 -0600
Message-ID: <20250702123410.761208-65-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702123410.761208-1-richard.henderson@linaro.org>
References: <20250702123410.761208-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2001:4860:4864:20::30;
 envelope-from=richard.henderson@linaro.org; helo=mail-oa1-x30.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MfKbruiiQC24

Change the API to pass element count rather than bit count.
This will be helpful later for predicate as counter.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/sve_helper.c    |  2 ++
 target/arm/tcg/translate-sve.c | 13 +++++--------
 2 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/target/arm/tcg/sve_helper.c b/target/arm/tcg/sve_helper.c
index ba5ab6b513..dbade6ece0 100644
--- a/target/arm/tcg/sve_helper.c
+++ b/target/arm/tcg/sve_helper.c
@@ -4135,6 +4135,7 @@ uint32_t HELPER(sve_whilel)(void *vd, uint32_t count, uint32_t pred_desc)
     uint32_t oprbits = oprsz * 8;
     uint64_t esz_mask = pred_esz_masks[esz];
 
+    count <<= esz;
     do_zero(vd, oprsz);
     do_whilel(vd, esz_mask, count, oprbits);
 
@@ -4166,6 +4167,7 @@ uint32_t HELPER(sve_whileg)(void *vd, uint32_t count, uint32_t pred_desc)
     uint32_t oprbits = oprsz * 8;
     uint64_t esz_mask = pred_esz_masks[esz];
 
+    count <<= esz;
     do_zero(vd, oprsz);
     do_whileg(vd, esz_mask, count, oprbits);
 
diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 210a029ab8..f74f2bb1b3 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -3198,9 +3198,6 @@ static bool trans_WHILE(DisasContext *s, arg_WHILE *a)
     t2 = tcg_temp_new_i32();
     tcg_gen_extrl_i64_i32(t2, t0);
 
-    /* Scale elements to bits.  */
-    tcg_gen_shli_i32(t2, t2, a->esz);
-
     desc = FIELD_DP32(desc, PREDDESC, OPRSZ, vsz / 8);
     desc = FIELD_DP32(desc, PREDDESC, ESZ, a->esz);
 
@@ -3234,7 +3231,7 @@ static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
     op0 = read_cpu_reg(s, a->rn, 1);
     op1 = read_cpu_reg(s, a->rm, 1);
 
-    tmax = tcg_constant_i64(vsz);
+    tmax = tcg_constant_i64(vsz >> a->esz);
     diff = tcg_temp_new_i64();
 
     if (a->rw) {
@@ -3244,15 +3241,15 @@ static bool trans_WHILE_ptr(DisasContext *s, arg_WHILE_ptr *a)
         tcg_gen_sub_i64(diff, op0, op1);
         tcg_gen_sub_i64(t1, op1, op0);
         tcg_gen_movcond_i64(TCG_COND_GEU, diff, op0, op1, diff, t1);
-        /* Round down to a multiple of ESIZE.  */
-        tcg_gen_andi_i64(diff, diff, -1 << a->esz);
+        /* Divide, rounding down, by ESIZE.  */
+        tcg_gen_shri_i64(diff, diff, a->esz);
         /* If op1 == op0, diff == 0, and the condition is always true. */
         tcg_gen_movcond_i64(TCG_COND_EQ, diff, op0, op1, tmax, diff);
     } else {
         /* WHILEWR */
         tcg_gen_sub_i64(diff, op1, op0);
-        /* Round down to a multiple of ESIZE.  */
-        tcg_gen_andi_i64(diff, diff, -1 << a->esz);
+        /* Divide, rounding down, by ESIZE.  */
+        tcg_gen_shri_i64(diff, diff, a->esz);
         /* If op0 >= op1, diff <= 0, the condition is always true. */
         tcg_gen_movcond_i64(TCG_COND_GEU, diff, op0, op1, tmax, diff);
     }
-- 
2.43.0

