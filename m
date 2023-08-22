Received: by 2002:a17:906:80c9:b0:9a1:ac8c:26bb with SMTP id a9csp633077ejx;
        Tue, 22 Aug 2023 04:03:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFT8DuK9fwqTRvkq4ZNeLsuPGEo2RPR9yxWBram+lsAVMiQP/8X1Dp6tMu3ZaNaCxl6Jt+J
X-Received: by 2002:ac8:5907:0:b0:403:eb5b:1f6 with SMTP id 7-20020ac85907000000b00403eb5b01f6mr11727532qty.63.1692702188407;
        Tue, 22 Aug 2023 04:03:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692702188; cv=none;
        d=google.com; s=arc-20160816;
        b=TA6oIYELUHurdj/qusBydPNOeiIiN+0z+fjgsPvMwNiRwlaFFRRrRKQ4YLoazar2Iu
         M+3HoiKUzJ4tohKv62cPOBoMffD+vMITp3VTaWdKm/1ACUbnBe9cniyI+Jqr4RjpBxJW
         H2V3P7sjksZVsGLq6MMIkXeyzRAbc/zQhZYN25AroxKg0SNiPvtsKt3c/ZuUT4FY6sx4
         4dgswlUSt46MYTGjoLSn+Zc6JDJwptlf8SwK4Sx19A+e18Ei48K7mEZawepdFgBuzQqU
         +W2jbb9I1HXq/liF8YFCTwNx5Xm6GS6pPiq1V+0ZXymSl/wfdu3hwuJTc7EeV6/VZphS
         QK4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=LEM3PfJxI/aPPc1i3tV/XEA6n73WFfBj06/t4sKpaao=;
        fh=nNMMnsLJfx+wwcL6Hpjyue2kO7c5wJkFUZ+p5f7qT8I=;
        b=B1toKDf4j7l+eQ99lq44cwkXuWrCwtapTjwzyztqKinzmxiKYM3dA3a5rp6cYlgWEX
         qPqLCLOWgHPMYjeIo3X6U9Rdl5LqFjGiToupoWRgldonaXn5WPYt4ymhOn7F+8TmdzMK
         59FknGczl/hIuA/x2espHcnQYYcDNQZpx9Zg+0K20+1CsK475TsBt4PQApSNS9OksTwv
         3IhP9z3xisUZ6aB/1RX63QyiV4KF2C5oyeXq/KvIMor1DVqyHjYM3HalQ0cQSDh9nWtA
         rhqiT4lHdyxE29JhMMZgYJwqcaYquN+54GewiZQ9Op+WrScGctJ8jjjXu8IqYNb/2+Hz
         DnCQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nBsXcbcv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u20-20020a05622a011400b0040358f265f7si6127029qtw.279.2023.08.22.04.03.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 22 Aug 2023 04:03:08 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nBsXcbcv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qYP9j-0006Sw-TR; Tue, 22 Aug 2023 07:02:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYP9T-0006N5-Ti
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 07:02:29 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1qYP9O-0003OU-Uc
 for qemu-arm@nongnu.org; Tue, 22 Aug 2023 07:02:22 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-3fe8242fc4dso42927145e9.1
 for <qemu-arm@nongnu.org>; Tue, 22 Aug 2023 04:02:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692702137; x=1693306937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LEM3PfJxI/aPPc1i3tV/XEA6n73WFfBj06/t4sKpaao=;
 b=nBsXcbcvOtoGhumKewU1elFD1KRIs/anotvQ08PGmWuTeqEJwCThrSWGBHVsmkHgBe
 /uEE/7TDC969ZHn3s1Gc21FVS7h/JtJGeQAWzGNJBcM18g52OoZueTz2urGBMVZ5nz4w
 aU0a1Fj+OyQXHD3Brej6Z+eo6RsTYC1dVzu2IZjkCfbp9opMEN+9GuTfoVFlAbeLkpQq
 73NWKWrADLFikStDJGdMmE4yO9AmIsnwAdPH24cl9+IG+/lLwrfK3RSPfo/NfGhp+anj
 E9FHVoXnimo8ZsXFG9o6NrLiKki+0NC7ZcPVl9PoKy5GSjJLQYiTwUDy1cpSIwWbeqM8
 YBmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692702137; x=1693306937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LEM3PfJxI/aPPc1i3tV/XEA6n73WFfBj06/t4sKpaao=;
 b=fxIyJehoXsImWGOI9pjHhFYVroM62EMr/BpesMukDmvA3B1/mI6KlrGrve8HTxesPr
 uMvDtBL/8bGbh1bdrNDKk7TAz5SKhHDOip8DjFFt1aNKfKkLdI6ZXuWBKgK9u+irJf5r
 MM2feCJsRczPqd//o1twZg7g7ZNwsQqbuYRrqA6NG7EIPQwaOwE8af4o6y6IE4GsuX+Z
 jndNKexWytA9dVcWj3TGLN+3frOrHd5KgaaSLFqWas+rpNDbGQC59mOtS2PONRLu2vqc
 21bkbuE8MhLDDlWMoIarD/JW1vdI/CpSJw0aqJJBQrbq/i7BvH4dlMSF1VxDFaj2CC/2
 p9uA==
X-Gm-Message-State: AOJu0Yx26odBSkwRrz9eoOTSKq3kfaOLcOKjU9ioh6XQFMTsS9OCNcpT
 gwx1YeD/F9mAYuVdsUZpBlCR5g==
X-Received: by 2002:a1c:770b:0:b0:3fe:2109:b9ff with SMTP id
 t11-20020a1c770b000000b003fe2109b9ffmr6993689wmi.0.1692702137029; 
 Tue, 22 Aug 2023 04:02:17 -0700 (PDT)
Received: from localhost.localdomain ([37.19.214.4])
 by smtp.gmail.com with ESMTPSA id
 z26-20020a1c4c1a000000b003fed1ba0b8esm14604106wmf.8.2023.08.22.04.02.14
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 22 Aug 2023 04:02:16 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Aurelien Jarno <aurelien@aurel32.net>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>, Song Gao <gaosong@loongson.cn>
Subject: [PATCH 6/6] target/loongarch: Use hswap_i64() in REVH.D opcode
Date: Tue, 22 Aug 2023 13:01:29 +0200
Message-ID: <20230822110129.41022-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230822110129.41022-1-philmd@linaro.org>
References: <20230822110129.41022-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: pwjVYQ0/SDvA

Commit 46be8425ff ("tcg: Implement tcg_gen_{h,w}swap_{i32,i64}")
introduced the generic hswap_i32(). Use it instead of open-coding
it as gen_revh_d().

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 target/loongarch/insn_trans/trans_bit.c.inc | 16 +---------------
 1 file changed, 1 insertion(+), 15 deletions(-)

diff --git a/target/loongarch/insn_trans/trans_bit.c.inc b/target/loongarch/insn_trans/trans_bit.c.inc
index 25b4d7858b..95b4ee5bc8 100644
--- a/target/loongarch/insn_trans/trans_bit.c.inc
+++ b/target/loongarch/insn_trans/trans_bit.c.inc
@@ -150,20 +150,6 @@ static void gen_revh_2w(TCGv dest, TCGv src1)
     tcg_gen_or_i64(dest, t1, t0);
 }
 
-static void gen_revh_d(TCGv dest, TCGv src1)
-{
-    TCGv t0 = tcg_temp_new();
-    TCGv t1 = tcg_temp_new();
-    TCGv mask = tcg_constant_tl(0x0000FFFF0000FFFFULL);
-
-    tcg_gen_shri_tl(t1, src1, 16);
-    tcg_gen_and_tl(t1, t1, mask);
-    tcg_gen_and_tl(t0, src1, mask);
-    tcg_gen_shli_tl(t0, t0, 16);
-    tcg_gen_or_tl(t0, t0, t1);
-    tcg_gen_rotri_tl(dest, t0, 32);
-}
-
 static void gen_maskeqz(TCGv dest, TCGv src1, TCGv src2)
 {
     TCGv zero = tcg_constant_tl(0);
@@ -193,7 +179,7 @@ TRANS(revb_4h, gen_rr, EXT_NONE, EXT_NONE, gen_revb_4h)
 TRANS(revb_2w, gen_rr, EXT_NONE, EXT_NONE, gen_revb_2w)
 TRANS(revb_d, gen_rr, EXT_NONE, EXT_NONE, tcg_gen_bswap64_i64)
 TRANS(revh_2w, gen_rr, EXT_NONE, EXT_NONE, gen_revh_2w)
-TRANS(revh_d, gen_rr, EXT_NONE, EXT_NONE, gen_revh_d)
+TRANS(revh_d, gen_rr, EXT_NONE, EXT_NONE, tcg_gen_hswap_i64)
 TRANS(bitrev_4b, gen_rr, EXT_ZERO, EXT_SIGN, gen_helper_bitswap)
 TRANS(bitrev_8b, gen_rr, EXT_NONE, EXT_NONE, gen_helper_bitswap)
 TRANS(bitrev_w, gen_rr, EXT_NONE, EXT_SIGN, gen_helper_bitrev_w)
-- 
2.41.0

