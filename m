Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1157030wrs;
        Wed, 28 Aug 2019 12:13:45 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzx/ONAT0xF4fXcE35OB87H/Nd7aCM/sUZy3m4GQy3crRxiDFKb0lcZifgUWdaUn5noVnXo
X-Received: by 2002:aed:3745:: with SMTP id i63mr5935933qtb.20.1567019625521;
        Wed, 28 Aug 2019 12:13:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567019625; cv=none;
        d=google.com; s=arc-20160816;
        b=PX9+RdccWS+wMjE8shjZJACKU1nzz0cCJ5Fx+5cnIVJTsEj4Ydnk+Y1igH+WH0TJ44
         nVu5gFbO8nyWbMv0IHpiaKTYWnAkdwM+8grkdkfqmhU6EEPnGQDSzF9nDcOEY8SsrCHj
         Z/v+HKe9GsWaOhUznWsbfXfqNhhb58H84m8hoEr9jGgKGlrDD1DD1JWMGKFwy4dNe+Jk
         u8XTpFPgA0uK1ln+QLnZ3HOm5MEdeEsGc2+vrdmBOXoMHMRdDRkj2NWhLHYfne22Lspa
         3crHh4D6qDpH0Yuu32vJuXlROc9XHvkNmHSCi0b+3ioDKSaZAA5juvlTbAKi/qdb+SMz
         3H+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:references:in-reply-to
         :message-id:date:to:from:dkim-signature;
        bh=VO3W9DH8N43psEbK5DhPL38cP8IqwAsRisCTRHkRmo0=;
        b=0IIawDaMkF6XqEjtQrUwPQDupNz/oqRoyYvx+Bt0MDfSC4n94vTLmQDJXzNJ/3OVwX
         1XHwFyQdKoYiQevtwCJoYrCJiAqPjC8KY6Wqmf0N9Vdw48Lw0xM9K+4TLXx+Zq+yO2C1
         B7QEnWUFpX12qzhi921p0zfPNHSUgROjKIlC7ZpTk/EUhymjmhKSY43jP9NHV+ZKXbiz
         Lxm33Gf3g4frNAqThFhDVtmILQhLp+gUOesoRK9x0D4W1bXwELyanGxmIKA6ENuJ8Wf4
         RB+Ys44li2oDAa+KCmcPiTJkOMLdf9IlrjnUdTbBd4AFMrtbS7wHgZutIpjGBOgpe2Fe
         +CLg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KjA6QUR6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a2si137538qkk.305.2019.08.28.12.13.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Aug 2019 12:13:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KjA6QUR6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40976 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i33O4-0002qM-RH
	for alex.bennee@linaro.org; Wed, 28 Aug 2019 15:13:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37555)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Fr-000386-Iv
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1i33Fp-0008Iu-FW
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:15 -0400
Received: from mail-pf1-x444.google.com ([2607:f8b0:4864:20::444]:41812)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1i33Fo-0008H7-V0
 for qemu-arm@nongnu.org; Wed, 28 Aug 2019 15:05:13 -0400
Received: by mail-pf1-x444.google.com with SMTP id 196so382145pfz.8
 for <qemu-arm@nongnu.org>; Wed, 28 Aug 2019 12:05:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VO3W9DH8N43psEbK5DhPL38cP8IqwAsRisCTRHkRmo0=;
 b=KjA6QUR6nHRZf6I+bVkPcfociKyMauAjE0flKOHl0ZsKmjwS76Ihi0WhkoTM4CYjYk
 3ahHSdxrIHvLVvuV+l/u17TJNj51OW6px917/Bt4bVz3WL6Ka5A9OQPBe4psgOahx6xW
 6yI3uhnq04Db+XW7ja/dqvpUias5pPPCn5hHK8p8e7qI1pwsLpBI/4h/HN+ECiYkMU7E
 RM7EzIrR4z6C0WHvB+vOy6kocsNgWCzMSNCgW/tYtMGIg7ltlx7/dS4vwef7YogVUdmJ
 SIxnka9OdTGl792W6/KEvKmHv5Z2hXPIDWK4gjLwE2j2tBj3bhsCPkPJg6WMg+rd2jd5
 pVbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VO3W9DH8N43psEbK5DhPL38cP8IqwAsRisCTRHkRmo0=;
 b=CfgU9sUVVumordkgR5v/1a/cR0Yj5zFjAtBiPGzTDlKudRFCLZFRZ2Ep9xoRljlv1j
 3cphaevsaQIKEqv5PheiIKthafFolj58lc6DEOFz3YN/U1k27VfIjgtuUpieITRQQKxC
 x4E6LXWQg9OvP8rNOxiHoeeKV8mtJ2W/XMzqsKQXr1j2r8tDKdgvXryicEmTZGzA+sY1
 ewCZW3vol4m0TsEOjMGFy3ADcy6J2Hdf/E2Hka7zy/FnDyAVZBZUAyF+cwaZ+XAu6xGZ
 CvraqNsSey5GANNHhFCcYMeVyv1iFR12eCIntnDSdQ5wu+WI/HkbzCyt8BtjZgGKg4Mk
 0pmw==
X-Gm-Message-State: APjAAAUIfzvA4oC2Kg1xSWfleKiXvMPbPOQM2xLsgAfHbVsGH1KU+noE
 ZN9c63gl6a4lp8IaNYi56saoSQ==
X-Received: by 2002:a65:5b09:: with SMTP id y9mr4889095pgq.345.1567019111704; 
 Wed, 28 Aug 2019 12:05:11 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id f27sm2967944pgm.60.2019.08.28.12.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Aug 2019 12:05:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Aug 2019 12:03:57 -0700
Message-Id: <20190828190456.30315-11-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190828190456.30315-1-richard.henderson@linaro.org>
References: <20190828190456.30315-1-richard.henderson@linaro.org>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::444
Subject: [Qemu-arm] [PATCH v3 10/69] target/arm: Simplify op_smlaxxx for
 SMLAL*
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
X-TUID: Gmbzo98J2Jo2

Since all of the inputs and outputs are i32, dispense with
the intermediate promotion to i64 and use tcg_gen_add2_i32.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/target/arm/translate.c b/target/arm/translate.c
index 58983ccf88..8813d40a2c 100644
--- a/target/arm/translate.c
+++ b/target/arm/translate.c
@@ -8151,8 +8151,7 @@ DO_QADDSUB(QDSUB, false, true)
 static bool op_smlaxxx(DisasContext *s, arg_rrrr *a,
                        int add_long, bool nt, bool mt)
 {
-    TCGv_i32 t0, t1;
-    TCGv_i64 t64;
+    TCGv_i32 t0, t1, tl, th;
 
     if (s->thumb
         ? !arm_dc_feature(s, ARM_FEATURE_THUMB_DSP)
@@ -8176,12 +8175,14 @@ static bool op_smlaxxx(DisasContext *s, arg_rrrr *a,
         store_reg(s, a->rd, t0);
         break;
     case 2:
-        t64 = tcg_temp_new_i64();
-        tcg_gen_ext_i32_i64(t64, t0);
+        tl = load_reg(s, a->ra);
+        th = load_reg(s, a->rd);
+        t1 = tcg_const_i32(0);
+        tcg_gen_add2_i32(tl, th, tl, th, t0, t1);
         tcg_temp_free_i32(t0);
-        gen_addq(s, t64, a->ra, a->rd);
-        gen_storeq_reg(s, a->ra, a->rd, t64);
-        tcg_temp_free_i64(t64);
+        tcg_temp_free_i32(t1);
+        store_reg(s, a->ra, tl);
+        store_reg(s, a->rd, th);
         break;
     default:
         g_assert_not_reached();
-- 
2.17.1

