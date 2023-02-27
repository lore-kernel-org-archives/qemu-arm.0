Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4291196ejc;
        Sun, 26 Feb 2023 21:32:27 -0800 (PST)
X-Google-Smtp-Source: AK7set9nOCEPPx9nGyUXE4k2OG3mCcRwkx07f7PGwX95Av9q/HV1mtYKPf5RRc/qXK/vzVfKZfZ0
X-Received: by 2002:ac8:5bd5:0:b0:3bf:ca04:3bc6 with SMTP id b21-20020ac85bd5000000b003bfca043bc6mr11113094qtb.9.1677475946952;
        Sun, 26 Feb 2023 21:32:26 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677475946; cv=none;
        d=google.com; s=arc-20160816;
        b=o7h6di3HrTSHN+I88poDyNGjECGln7w+9dQvL4vn8tXmPbAejH94nAQa9mpSmZsTaP
         QOLulIE2oHZ8osG8ZWjbm5Zj/Y3oCrgtiNM7zGyxpiEC5uZlIJ/ytqNrZsbbs6XBblR7
         6sm69K1TUExkETHGZjujSNS3frlmxWyOqHGeOr1gMjywi9LK+gMVGpXidD/mZtG5R44B
         r9d1XKuhXhmA7KAVuQwClXrejKarpugQ5D9AEdxMIxJL8W7e+LBx+KZlO2hSftXO5HD1
         sr6U4hNMSQmaUjFPPisGxbpFKkKRsoPWTMRAzf7MbDZtW2x6aeRVuGWKcmQjS1XEEDQK
         VzJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=sDmUkw3rhG8oPNlT9S5tPo3W1aQ6y0j58Lj/IZXgOuc=;
        b=zBWBALxsdh79zh6VcfAh+4s6U5ZnXwv7BnyHqbToC6DPRfBZJanWYVXTbgayTGSv8h
         GlRfaHNtv73vwnJBjwQui9hKJNRxfM7QkG/WWmSW1BMHkCS8aaDwyegLJXzmaoXzpNPq
         AnegK+7FOfZTgDFhZnO/4K/tQ09vqlbmmAKGI4oulGl6NkOeE4IlQojEddOMkhXgWHAd
         OLvDEre436Ew+s5vI6LprcH0Sy8MP7pqNaE2oQsc/OVS4R7Va4qUkfavt7sV5jWM+kF4
         NYawZzY0jLbcnbUZQClwC7+NJPzNIWm/QHxweCbe2DYB0UKg2vvggL62RufzCzovgwc/
         i8Mg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=haYDju3O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j7-20020ac84047000000b003b9a4c0a497si5017384qtl.397.2023.02.26.21.32.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 26 Feb 2023 21:32:26 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=haYDju3O;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pWW1r-00088h-RF; Mon, 27 Feb 2023 00:26:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1V-0007KP-3o
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:26:05 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1pWW1T-0007Ro-BS
 for qemu-arm@nongnu.org; Mon, 27 Feb 2023 00:26:04 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 6-20020a17090a190600b00237c5b6ecd7so4361754pjg.4
 for <qemu-arm@nongnu.org>; Sun, 26 Feb 2023 21:26:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sDmUkw3rhG8oPNlT9S5tPo3W1aQ6y0j58Lj/IZXgOuc=;
 b=haYDju3Oq0TFDt054lTRvhpdyhG8zQrYLQgWvStwosYWTF7DfYk1IxrgEN56G8Ay3w
 YUW2gID5JRO1+LtFd5OVvVUjd0UqENyltlH8lLIEfOplJccS5zqyLaP1LhVpF5dUNDoY
 j5SRjKrK3z0+yP0BmVioTx3RNjwNU8aC5WTkmYp6VXdOXcyndO0yDRm4NzbxP/tRqrkl
 1r0Jo/KJ0IcahaTmeQtwD4x3ALtjXryAboDgthVJLy7eWtPFRUniWYaBgNaF0yQJ/ceT
 glgsE/HfF2HdhbHCCgV5TZOq0OfgDDMv81QpEvGg8HCEE/bImdlOeCn07NwiFjxE+3Ui
 /KZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sDmUkw3rhG8oPNlT9S5tPo3W1aQ6y0j58Lj/IZXgOuc=;
 b=6ddipoX3fX/JQmimXKMXwDOf8NGN/XeJkbnPAuDRYzd4WoYBY8FlDUqoIlg3bj8kOZ
 qi/6HIWJxRFPAfZ/V+H0UC7pCunw4O6IhE71rVY96rel62tZJFb7hWvlgi74UerRFB/q
 f2sVXu5RMTCBgi0jz+KT1vN0nbWZ0TWZ+pm0rmwggiA+tuL+e4o2qkZpRVnN8VVjgej4
 I1PrZUNGv2ePX4lQPHmTSXWSC7PM8MzK5RhVip1PuO24sU33csflsHTCS4jsFRFjLU64
 WJgQZJtou2NpNQaXEFqWxl8b0busCD7xp3RUXtQIa1dLEKLLeS63T7AfZnBLkPTp4VLb
 1beQ==
X-Gm-Message-State: AO0yUKWCtZHGV7abJ7E//GC7z92M3Xem1Ef7FxkHRNT6bI50H/rJPADI
 fBBhcw+aKvOCFHmcO6uqlgtpeg==
X-Received: by 2002:a17:902:d4c4:b0:19d:6f7:70d2 with SMTP id
 o4-20020a170902d4c400b0019d06f770d2mr2969392plg.50.1677475562632; 
 Sun, 26 Feb 2023 21:26:02 -0800 (PST)
Received: from stoup.. (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a170902ecce00b0019a837be977sm3513341plh.271.2023.02.26.21.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Feb 2023 21:26:02 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, kbastian@mail.uni-paderborn.de,
 ysato@users.sourceforge.jp, gaosong@loongson.cn, jiaxun.yang@flygoat.com,
 tsimpson@quicinc.com, ale@rev.ng, mrolnik@gmail.com,
 edgar.iglesias@gmail.com
Subject: [PATCH v2 19/76] target/avr: Drop R from trans_COM
Date: Sun, 26 Feb 2023 19:24:08 -1000
Message-Id: <20230227052505.352889-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230227052505.352889-1-richard.henderson@linaro.org>
References: <20230227052505.352889-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x102c.google.com
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
X-TUID: XXL2n2xgnnSa

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

