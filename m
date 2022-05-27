Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp1235396lfh;
        Fri, 27 May 2022 12:16:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyV27i09WIZg1KyezP0SdFA4MCE4wQkEwUcji8w2y1t9wWyyL7FJmyvVMo2yMCn30TbTxeN
X-Received: by 2002:a05:6214:528b:b0:462:1221:7f8c with SMTP id kj11-20020a056214528b00b0046212217f8cmr30554775qvb.61.1653679003950;
        Fri, 27 May 2022 12:16:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653679003; cv=none;
        d=google.com; s=arc-20160816;
        b=jPwRcTYKUVsnTaUxfysZeTq60rDKOW45/1DdjBj18mqo7w3dVibDiESShMqCnPGLg+
         ecKjmpf9xJ7FXFRHn4YaUsrilXt9QgKOYwYyGoQSa1dfhczhQj+slQFWcjXyfTxsnyZ1
         6FSBy290Vbf2yAh4FnpqC2FUPz9UH6kNAxf6VvzvAaKw4x3SpgqKqHhYHV2mAYNFauVl
         Dt+vjH6nFoPx67XHeBYcLjouOM2yIH2DmOwp9S3Xdmu1c/FLu9zO+f7elsNz7pAyItZL
         QazSTD4rXJIf3J4zwU9cx9Kjk5bge5hPBDAj934Kin3jywouLGOBkz6EjT32+f7iZXPV
         81AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=XnPwnaxt8ItPpT63VDm+PFdBUhpkDXzxZoPLqjotw+4=;
        b=XKVudC9SUTI2VCU2cuemRPzwXDxAxOHOkc4GB68MJ7Go/Q6jSDwo4ZWQZd+aqvPgFc
         CTBuGsbJaV+FC7czF3aLeTDwsQ6G82rhgRFTtA0uNfP9oj4LsdAhsbK4/eegoZ82SMlo
         S/SUE02u4LskaQVrmgveT7wvgLXPgAuQIh+N15fTZ5c6fmUDD6epWwxXupacHijY9r8Y
         PWAFVusNaDUfOU5mJ5gyIh2lcZ75P/rOKf3xlPv8Fa6aCndcH68yY8vpxZ/b8RMgWA68
         iMaWtte6GVoJmXEMT0zimp6R/w3vIgNrdPyH4a9FB/T6gY5NgRLZbpGA47NYbQt/8OBy
         fDEw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=swDkWjnf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bj18-20020a05620a191200b0069f805d8142si3537711qkb.718.2022.05.27.12.16.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 27 May 2022 12:16:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=swDkWjnf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33178 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nufRz-0003u1-GW
	for alex.bennee@linaro.org; Fri, 27 May 2022 15:16:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nuec4-0003J6-0A
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:04 -0400
Received: from mail-pf1-x42e.google.com ([2607:f8b0:4864:20::42e]:39699)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nueby-0004KC-1A
 for qemu-arm@nongnu.org; Fri, 27 May 2022 14:23:03 -0400
Received: by mail-pf1-x42e.google.com with SMTP id y1so4986863pfr.6
 for <qemu-arm@nongnu.org>; Fri, 27 May 2022 11:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=XnPwnaxt8ItPpT63VDm+PFdBUhpkDXzxZoPLqjotw+4=;
 b=swDkWjnfsUUdsEcoV6uR4QZE7gL5u4ikCUNNYQ0Fjf7xQ9wEdIYOQL+IL6ClVhuHYV
 gi5hg/zXlX8s7dq7Rbx70zkZGSnln10Z4vfyix88zNDCrE30uC9s5EAOBZEZq4h4T2ua
 eYFtgV2Z9zVVEtRHE9E/ooMklJiEHhMyrejFRNaBUGn31WeQS86Nub5LDwpKRxer+007
 s1q8i43HkrkQK3QsO5e1UMEKlJqQ+yB7M8Zm0c/EGpFoAzt6DkBGD0gaBb8Uh1ucUBcv
 I/NjJH5HTL6vnitnNteoi4tATIwMh6yYcrJdIlh81Po6ZsZYAwyNoOs2U+r0lTROnYv/
 AyUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=XnPwnaxt8ItPpT63VDm+PFdBUhpkDXzxZoPLqjotw+4=;
 b=bQTtwmDrn+CQQzLAzouiB2W8bvSMPpWm9FblmoNRgHXdv67LsTK4/L9ZafMJFGT3P0
 XbFq3Sgk2RzG7Z6JmSnEKuJ1cR9qtuYgo7ixX/UZK7EbubaAWsOezGVYkuZMhtvlQo0s
 wOTijgtECdT3RpdgiNOCMTZkrfP4fNY4b9OxC4VCul+TpmOVpoqPzBdJFmJvct0WuopX
 EhmnLiX32uNdqjAAMU2h72kRN7ivE/Uz5UL9CTkuCSbNUI1CeosQR4kIoWAcguCZaiX6
 a/JxWjuJ1GZi2sysnq75SxjYzTT1lVfK63lYsB3qjzo9PQcz5ANUpA9FeHYFcUcYLZe1
 3kdg==
X-Gm-Message-State: AOAM530ZDx/TrrC5SHFaL8MuACKIxhyOP8RQ5sQfhPYo0qWHlh91YzFs
 4781dgRIhOmq9yzxbSDksFvEWCZoA3ieOA==
X-Received: by 2002:aa7:82d9:0:b0:4fa:2c7f:41e with SMTP id
 f25-20020aa782d9000000b004fa2c7f041emr45663220pfn.1.1653675768122; 
 Fri, 27 May 2022 11:22:48 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 b15-20020a170903228f00b00163552a0953sm4033534plh.159.2022.05.27.11.22.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 May 2022 11:22:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 042/114] target/arm: Use TRANS_FEAT for do_sve2_fn2i
Date: Fri, 27 May 2022 11:17:55 -0700
Message-Id: <20220527181907.189259-43-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220527181907.189259-1-richard.henderson@linaro.org>
References: <20220527181907.189259-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42e;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42e.google.com
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
X-TUID: su3kLNsFOyeF

Convert SVE translation functions using do_sve2_fn2i
to use TRANS_FEAT and gen_gvec_fn_arg_zzi.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-sve.c | 43 ++++++--------------------------------
 1 file changed, 6 insertions(+), 37 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 7a3b5f137a..911d2e28bf 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -6828,43 +6828,12 @@ static bool do_adcl(DisasContext *s, arg_rrrr_esz *a, bool sel)
 TRANS_FEAT(ADCLB, aa64_sve2, do_adcl, a, false)
 TRANS_FEAT(ADCLT, aa64_sve2, do_adcl, a, true)
 
-static bool do_sve2_fn2i(DisasContext *s, arg_rri_esz *a, GVecGen2iFn *fn)
-{
-    if (!dc_isar_feature(aa64_sve2, s)) {
-        return false;
-    }
-    return gen_gvec_fn_arg_zzi(s, fn, a);
-}
-
-static bool trans_SSRA(DisasContext *s, arg_rri_esz *a)
-{
-    return do_sve2_fn2i(s, a, gen_gvec_ssra);
-}
-
-static bool trans_USRA(DisasContext *s, arg_rri_esz *a)
-{
-    return do_sve2_fn2i(s, a, gen_gvec_usra);
-}
-
-static bool trans_SRSRA(DisasContext *s, arg_rri_esz *a)
-{
-    return do_sve2_fn2i(s, a, gen_gvec_srsra);
-}
-
-static bool trans_URSRA(DisasContext *s, arg_rri_esz *a)
-{
-    return do_sve2_fn2i(s, a, gen_gvec_ursra);
-}
-
-static bool trans_SRI(DisasContext *s, arg_rri_esz *a)
-{
-    return do_sve2_fn2i(s, a, gen_gvec_sri);
-}
-
-static bool trans_SLI(DisasContext *s, arg_rri_esz *a)
-{
-    return do_sve2_fn2i(s, a, gen_gvec_sli);
-}
+TRANS_FEAT(SSRA, aa64_sve2, gen_gvec_fn_arg_zzi, gen_gvec_ssra, a)
+TRANS_FEAT(USRA, aa64_sve2, gen_gvec_fn_arg_zzi, gen_gvec_usra, a)
+TRANS_FEAT(SRSRA, aa64_sve2, gen_gvec_fn_arg_zzi, gen_gvec_srsra, a)
+TRANS_FEAT(URSRA, aa64_sve2, gen_gvec_fn_arg_zzi, gen_gvec_ursra, a)
+TRANS_FEAT(SRI, aa64_sve2, gen_gvec_fn_arg_zzi, gen_gvec_sri, a)
+TRANS_FEAT(SLI, aa64_sve2, gen_gvec_fn_arg_zzi, gen_gvec_sli, a)
 
 TRANS_FEAT(SABA, aa64_sve2, gen_gvec_fn_arg_zzz, gen_gvec_saba, a)
 TRANS_FEAT(UABA, aa64_sve2, gen_gvec_fn_arg_zzz, gen_gvec_uaba, a)
-- 
2.34.1

