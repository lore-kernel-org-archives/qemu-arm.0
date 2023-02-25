Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2636200ejc;
        Sat, 25 Feb 2023 01:18:44 -0800 (PST)
X-Google-Smtp-Source: AK7set938UQ9QJjWz6jGV0jxqRUimifI8/yVbDzpswXOYwG2NtTK1HQHQYyAviv1++WpyP8gDO+e
X-Received: by 2002:ac8:5790:0:b0:3bf:bafa:a208 with SMTP id v16-20020ac85790000000b003bfbafaa208mr8866034qta.16.1677316724320;
        Sat, 25 Feb 2023 01:18:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677316724; cv=none;
        d=google.com; s=arc-20160816;
        b=n9xfGdjRK1/k3j/XOxlU9bym1/jmGjIaF/IwNbbX8VTDjivhWSZ4JPsA36bAFv4Erp
         Gaa7DQR8+t8Wa7bJIQHuRHYZ8FTrKZc4dNWjvZyKY6p8LTQayj31ZA6wiGbV7xgM+SFW
         u6YSMO6nxjBje4fSItFpO6m3nFxBMcm6BnXk9A3EaDJuf6pwL8+Y0sLoiA4j0xzw23sC
         CQVolYIoejawHlV59uQZU6Wv9ayoNz8MCxxtw0m7wfjK/9kv3zhFj/Alv3p4cdbnh+Gb
         4wA3UW5VdQZa9rBpH5CHSEeFSqxJClzelSnoSptbOIv89xEYTX58GHCn0nOdczuXwy+A
         4vAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sDmUkw3rhG8oPNlT9S5tPo3W1aQ6y0j58Lj/IZXgOuc=;
        b=e+Yby/jibhN5DvfdNUJ3/Mhyd/nVHAq3gbhspmMivlx1l2Vjv9Ln9pHPow76vPRabt
         7YuwdurDktMTA5qBzchqma0f/NtUCujOlkyJw0adClTAussJFURHTJJd+PLOGiArmPEm
         99ZBd3q6itRbYIzmuVNyS5jcBBiFLrQMPy7C0OnKOqioDohjre9WiLnMg+Td3W1scUp5
         Ob+FA46TQKkORokFDH0d/r2mC+kXO7PSk4yvSDnLfjMIO2CwHGVHk8PXMEQ+fhTKf8iT
         RzwO8OJoGsKcmuhrc+g10ShJ/VoT1wfb6QAZdkbcx/RF7TJEGqMetl4d2cyQpktbTWAo
         jrPw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WaArnU1E;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c16-20020a05622a025000b003b8672a9e64si1723014qtx.10.2023.02.25.01.18.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 25 Feb 2023 01:18:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WaArnU1E;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVqeM-0005Xf-EV; Sat, 25 Feb 2023 04:15:26 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeK-0005U9-NX
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:15:24 -0500
Received: from mail-pj1-x102a.google.com ([2607:f8b0:4864:20::102a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pVqeJ-0001c3-3Y
 for qemu-devel@nongnu.org; Sat, 25 Feb 2023 04:15:24 -0500
Received: by mail-pj1-x102a.google.com with SMTP id l1so1434783pjt.2
 for <qemu-devel@nongnu.org>; Sat, 25 Feb 2023 01:15:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sDmUkw3rhG8oPNlT9S5tPo3W1aQ6y0j58Lj/IZXgOuc=;
 b=WaArnU1E7ZOhWIojKcRpPs4AK8dgp3ZqQAhObrBosPuDLj736WXHo0gQWGp6e8Ye/X
 HlbqXqSqNJf54J0UeqIc13WmgxQtm+EblEcEgb3BSDvbQgUGr2i9mBIGXqIkXYf49XLi
 aU+tdBVkKaPTRILkrD/5u04M590nS6MbHf8ko0UR2U5S8PpJJ+kQjU3+MgPGBqg+rbZl
 OeA53/hBmDiSKMh7NlC+savyPbVfbats7A4r3yKDF1qqM3jrR8xuuHLd3uuynCPoFGyS
 RP1G6MQC5KsQI+ilkDHamLJ3E60OX7zV1kPk+lGTly4P2EGoW2AyJmpOw7bmr9DKZ/h/
 qUQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sDmUkw3rhG8oPNlT9S5tPo3W1aQ6y0j58Lj/IZXgOuc=;
 b=XdxixjMpSDd6uQVgXdyDVcsdnnEoP924c4sm4rSx8Kfj4kgVIcPZYtPGg8ochFd1Dg
 d2Hi86nswl02/ouoJDv6jT3ahza4BN20qFYUo5t5tkRDGCDRAmPIQFt41sKDgSMFvghP
 G4PISE3Uf+i5pP1IqFVZJn3Lu9iKBs66Dz9+L0i1bhLaRyIovp9gpLE6uk3P9u25WmRQ
 UoC5ggTTKQfSc8C+cc/iKElOuZTFi0iNaMViK1I4z/2oO1ihCEedZ5hiIZrHBj+kJQTh
 f8/pKY6FSr+V4N3/14/cYCiWK+yady2iATlfMFOvd6LOwGkez6G+zexa/JW8jo8brSaS
 Hagg==
X-Gm-Message-State: AO0yUKW0E9pblIIavILtNeGvXV6X1Pbip3NKYwsSSrkinu9SYGslxkjl
 /t/nyyfDky8VSTje0NTsH3HqsooV1Ng55Rm9f0g=
X-Received: by 2002:a17:902:ec86:b0:19a:e453:752b with SMTP id
 x6-20020a170902ec8600b0019ae453752bmr22130573plg.9.1677316522235; 
 Sat, 25 Feb 2023 01:15:22 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 je12-20020a170903264c00b0019607aeda8bsm831101plb.73.2023.02.25.01.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Feb 2023 01:15:21 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH 19/76] target/avr: Drop R from trans_COM
Date: Fri, 24 Feb 2023 23:13:30 -1000
Message-Id: <20230225091427.1817156-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230225091427.1817156-1-richard.henderson@linaro.org>
References: <20230225091427.1817156-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102a;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: WVMc3JdqcIGn

This variable is not used, only allocated and freed.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/avr/translate.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/target/avr/translate.c b/target/avr/translate.c
index e7f0e2bbe3..4f8112c3e6 100644
--- a/target/avr/translate.c
+++ b/target/avr/translate.c
@@ -670,7 +670,6 @@ static bool trans_EOR(DisasContext *ctx, arg_EOR *a)
 static bool trans_COM(DisasContext *ctx, arg_COM *a)
 {
     TCGv Rd = cpu_r[a->rd];
-    TCGv R = tcg_temp_new_i32();
 
     tcg_gen_xori_tl(Rd, Rd, 0xff);
 
@@ -678,9 +677,6 @@ static bool trans_COM(DisasContext *ctx, arg_COM *a)
     tcg_gen_movi_tl(cpu_Cf, 1); /* Cf = 1 */
     tcg_gen_movi_tl(cpu_Vf, 0); /* Vf = 0 */
     gen_ZNSf(Rd);
-
-    tcg_temp_free_i32(R);
-
     return true;
 }
 
-- 
2.34.1

