Received: by 2002:a05:622a:6187:b0:4a7:49b6:ba6e with SMTP id hh7csp3698487qtb;
        Wed, 2 Jul 2025 05:25:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVy1HBE42GNzq3MpYhLlBhCy7U+EQC9GonKaNoQgg3wwZF7zqmlWZwoxMP0f0l5jMbN31B8EJUqLS6hBA==@linaro.org
X-Google-Smtp-Source: AGHT+IHL91gkGVC1rD63PWtt4xCszFe7BJElzAPrg7rvfK0gmz8niR6qgvgIgHYmALIz+dYGxCen
X-Received: by 2002:a05:622a:a6c5:b0:4a7:7326:71be with SMTP id d75a77b69052e-4a977bcfe7emr30936131cf.5.1751459104340;
        Wed, 02 Jul 2025 05:25:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751459104; cv=none;
        d=google.com; s=arc-20240605;
        b=Q7jcfgm43wghxbqMZnXvWhkWN4iz6yK79y6WRfb90YLVAWprNZW35olSkkL5OPmZji
         G8YjncH+bHxBQitGL5XKaUth/eNfeF26raAXFl5tCDgD5B323u7wB5jwyRN9ApXiQbwy
         zY6GaoiRdWCJpYlNohqua/MWIkCCU1pPhs8PPrblo3ZJo1nyjLRF9U70zMDTzbnBlzkG
         ddna9CBgBc3VZUDoMT6ZU966Jfym1ehdpPx4iBf15Z+ncHaQzKNzHXq+ojVw6J9197xm
         Yl96Rqcuu/JXm/DWy4Ars79+lWpywoUikAwvvIpYrUwl10sMErhGtnW7+6x3JREh5OZe
         tttw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=baCvuXNefMQymQ80qbfxmxR0glq7SPYFcTPfnY9zD18=;
        fh=vZxkDpCwvhENXlY8qSqryGKuN7qdzoFpPjxnavaSuNI=;
        b=VQT0blU8hIsafWlRHffLFyJ8GGXvPmhcbYOTly4kQB4g/ua5apjx3RrtZn9hmXAGmu
         3jC0q9HQZVcqCPCkPhYKiCXyThlQfLev/zp12qxCbQeFXACI6fMQaPUYAna86x1nBV+l
         5/wIsQ84cS9q5Og8qoIKbzvzE+NX2CMSTpkLxJhN5ntIX8zAyoWc78H1lvsY3WzNks3k
         biG7UwriPZIoAfzaV/2F2ZiQXACuUFqc99MnfE850v81LnlIUCmVYwfegG8sIiztFyz6
         g1K0clUQRyjzr5VXxa5b7kCadgQD32hWcT4QVI08sXIsus73KzxVuaAYiwO9kwUOqjsa
         fKVQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uYalkl9E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4a7fc1e6dd9si130360771cf.279.2025.07.02.05.25.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Jul 2025 05:25:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uYalkl9E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uWwTx-0004sO-Bs; Wed, 02 Jul 2025 08:22:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwTv-0004rb-Lf
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:22:31 -0400
Received: from mail-oo1-xc35.google.com ([2607:f8b0:4864:20::c35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1uWwTn-0007DM-Tr
 for qemu-arm@nongnu.org; Wed, 02 Jul 2025 08:22:31 -0400
Received: by mail-oo1-xc35.google.com with SMTP id
 006d021491bc7-60d666804ebso3948024eaf.1
 for <qemu-arm@nongnu.org>; Wed, 02 Jul 2025 05:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751458942; x=1752063742; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=baCvuXNefMQymQ80qbfxmxR0glq7SPYFcTPfnY9zD18=;
 b=uYalkl9ETx8HTCo4bDXkxCfFmjpfWPsplJd2PZDZBVVBHbVww0o8QSn2xxbyVzFWuB
 gfUMe4f2LIvkrvTqhER4nN8qHlhUEzsK6i30XDmO39cxZK59+znt7OWml1KoiG1jGTvT
 f9GoLebRXPAxSCjFzpQLyE14UxlXMoMsgfdnMNNzPqPCB+sE1U4Rn8Ts05BMT7BnU4st
 sHobEe3TW53vTAh25026VlZ38jTa1OVgOMJSD/Ei+AztqfKpN+lcuF9gj21Whg/emecg
 BZ8o405+v1OHgzyk4UCIM7zlvdqeSooEXqhN2vFRzDeFCNCB2Z81NMZdW1lCEIP2gSCI
 G88Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751458942; x=1752063742;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=baCvuXNefMQymQ80qbfxmxR0glq7SPYFcTPfnY9zD18=;
 b=pc6bMbdaSUqkRHTwfkxm5pvDCmB5wbcvfZbIN7aiII+1ViVj63h7z+fuGtLnf4Fa4R
 B6QLwC+g/95Bo3Kk5OMlmalRfqMUc8cYRvwqWjTVqbPin+F0M7is9zNmmNNF0LCVj4cd
 0pM+2M2G3hvENgDrb91IWDFiq59Sdx7UDrIjJis3hysG0E0x6EvVeKQm0uFL3mSyeZ7S
 GIiaPdjVvPnDFm0hRVi3WjZqUb0vhYOEX3qzGmgBgK8M20PtCSQKJujCLlT6V+ggPaLB
 eDmhEX0euFxTWAPKt2hVMSwYN7Uqgl8MCjZvZawkX06KXj5nw9U9liEz+1KFJz7xdo17
 5rzw==
X-Gm-Message-State: AOJu0YxUINqgqiiCbR8n8F0L/y8ulhMQ+I7vlyH1N80aBKNgbTfmBWjm
 CksX3UwagDPFAgeCzatnKEm6psu4KWZHQ2/RkFR66LglFPsHvT2MQuWQWESsp5d+nfsMzMaC0dx
 WhTljACo=
X-Gm-Gg: ASbGncv+RSFaXJokqXphZcm1+1SHMWss6Uh/zt2HFfbig16s4f+OroRiUppQkt9aFzP
 AJAWq5fJBRO4hx3K6G0p3oVJR5mAc7rSDoNsI4lg8QQnl3msKrmb78USOV5w/YF1Az0Ma1mOMb4
 z97yy3iNosh5g8SSgBypERzfSf9rtskxG/ttHXtnY9q2JnBWFR2grF7TjmiSqAYkxcdKev1Lo+v
 EN2Lt1OCL5iRKAefbM5FWrG0MLDfn8VUQTn//SGgbeRDkL+OP1TPMkbOgBgdyNKV/wkNxfc3F/3
 roZ+7WaWUUpX/fnhVcIRwJ0blINZZbt2huC+APNUIK57senrGs0slSvMNc6xFusZZ3TZMQ==
X-Received: by 2002:a05:6871:4409:b0:2e9:925b:206f with SMTP id
 586e51a60fabf-2f6649c53cemr1615173fac.17.1751458942123; 
 Wed, 02 Jul 2025 05:22:22 -0700 (PDT)
Received: from stoup.. ([187.210.107.185]) by smtp.gmail.com with ESMTPSA id
 586e51a60fabf-2efd50b1bd3sm3785013fac.28.2025.07.02.05.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Jul 2025 05:22:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org
Subject: [PATCH v3 05/10] target/arm: Fix FMMLA (64-bit element) for 128-bit VL
Date: Wed,  2 Jul 2025 06:22:08 -0600
Message-ID: <20250702122213.758588-6-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250702122213.758588-1-richard.henderson@linaro.org>
References: <20250702122213.758588-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::c35;
 envelope-from=richard.henderson@linaro.org; helo=mail-oo1-xc35.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: 5OG4M2uLkgCq

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-sve.c | 23 ++++++++++++++++-------
 1 file changed, 16 insertions(+), 7 deletions(-)

diff --git a/target/arm/tcg/translate-sve.c b/target/arm/tcg/translate-sve.c
index 588a5b006b..a0de5b488d 100644
--- a/target/arm/tcg/translate-sve.c
+++ b/target/arm/tcg/translate-sve.c
@@ -7025,17 +7025,26 @@ DO_ZPZZ_FP(FMINNMP, aa64_sve2, sve2_fminnmp_zpzz)
 DO_ZPZZ_FP(FMAXP, aa64_sve2, sve2_fmaxp_zpzz)
 DO_ZPZZ_FP(FMINP, aa64_sve2, sve2_fminp_zpzz)
 
+static bool do_fmmla(DisasContext *s, arg_rrrr_esz *a,
+                     gen_helper_gvec_4_ptr *fn)
+{
+    if (sve_access_check(s)) {
+        if (vec_full_reg_size(s) < 4 * memop_size(a->esz)) {
+            unallocated_encoding(s);
+        } else {
+            gen_gvec_fpst_zzzz(s, fn, a->rd, a->rn, a->rm, a->ra, 0, FPST_A64);
+        }
+    }
+    return true;
+}
+
+TRANS_FEAT_NONSTREAMING(FMMLA_s, aa64_sve_f32mm, do_fmmla, a, gen_helper_fmmla_s)
+TRANS_FEAT_NONSTREAMING(FMMLA_d, aa64_sve_f64mm, do_fmmla, a, gen_helper_fmmla_d)
+
 /*
  * SVE Integer Multiply-Add (unpredicated)
  */
 
-TRANS_FEAT_NONSTREAMING(FMMLA_s, aa64_sve_f32mm, gen_gvec_fpst_zzzz,
-                        gen_helper_fmmla_s, a->rd, a->rn, a->rm, a->ra,
-                        0, FPST_A64)
-TRANS_FEAT_NONSTREAMING(FMMLA_d, aa64_sve_f64mm, gen_gvec_fpst_zzzz,
-                        gen_helper_fmmla_d, a->rd, a->rn, a->rm, a->ra,
-                        0, FPST_A64)
-
 static gen_helper_gvec_4 * const sqdmlal_zzzw_fns[] = {
     NULL,                           gen_helper_sve2_sqdmlal_zzzw_h,
     gen_helper_sve2_sqdmlal_zzzw_s, gen_helper_sve2_sqdmlal_zzzw_d,
-- 
2.43.0

