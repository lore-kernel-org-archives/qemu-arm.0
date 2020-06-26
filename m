Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp58532lfm;
        Thu, 25 Jun 2020 20:54:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7syT+5M9yPj3tUxWikCknU1azq1xn7aOAJ1QmveKdFq2/8l0+/d5oymPOjIGuJoOWiD2X
X-Received: by 2002:a25:c445:: with SMTP id u66mr1819976ybf.4.1593143649340;
        Thu, 25 Jun 2020 20:54:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1593143649; cv=none;
        d=google.com; s=arc-20160816;
        b=L4dRHIllB8dYQ3MbhsIE3ZIc+4qtPpldxosyTcFHUYvrXE70I8Dwpd0jKUq2/wGLoe
         sTmWbKagzSa1oU0hD91P3T/F+k5tkzulh5qd3SSErIhE4LPATI3ZNisSvknSNAUDO6s5
         sohZ9bw7kd6NqRBAXKzPpMjUHLbR3wxlArDkRpBqCu0sx7fW9+fssJ6RMPe2oVMVXpHa
         jObWfmYU1wj+GzUhccSrCWpvWT4g0XRFKjoshhKZeqFqS07Dg9c7aqDsyYXb56+OePIo
         SyWpgCUJkGxMTij2YAl08Uu8+zok3WC/gZinkeQbEAb37Y5lYQ4nOOZ2hINhpk203LCm
         Rvxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=9LzeT+j4mcl6UlyhLk8GVYAGtKomNKvCxMaED/b1Hos=;
        b=siFO/TzOetoW6vXMKQRftMn98nawNwjOyJTFHjeFjEO23VbL71UjC9p/po5B2zK+F8
         RBlbiH3kJvHKtSZ5fYT2m5ZZDmqpl5TYwGM5wpqbs0kihmGrR4FwFl6WXYxWT9KtBktS
         804/2fPTIagn7yUMO/3TjZto6kCMrDvF6hD4yPpsz0/L19hvLK6tFj4dlS1CudEBVLer
         H2t7NIsiM/BYGR0StiRDXpFFtjOOdZJnBouJna73hx9+TfvGTf6yKxADCMOEqxo+fmoV
         Jx2t4KEcm8kSaCaj7pDlzaB1HiwXDgO49EjM7UZ2J0eLEmP2mM+bvKhgGR/GD5GdLedn
         uL4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J7YtAW7q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d9si15649464ybe.405.2020.06.25.20.54.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 25 Jun 2020 20:54:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=J7YtAW7q;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34674 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jofRI-0004sH-Oi
	for alex.bennee@linaro.org; Thu, 25 Jun 2020 23:54:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42628)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6N-0000lV-0y
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:31 -0400
Received: from mail-pj1-x1044.google.com ([2607:f8b0:4864:20::1044]:51074)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1jof6L-00021J-Cv
 for qemu-arm@nongnu.org; Thu, 25 Jun 2020 23:32:30 -0400
Received: by mail-pj1-x1044.google.com with SMTP id k71so912646pje.0
 for <qemu-arm@nongnu.org>; Thu, 25 Jun 2020 20:32:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9LzeT+j4mcl6UlyhLk8GVYAGtKomNKvCxMaED/b1Hos=;
 b=J7YtAW7qF1VsEZExvvp5jN4ZlYHBPiPrxFQ+gaFm+Q2HhsfAL7+wZwigQJNwUTMYcm
 mjiokOTpyq4Sj7FOtl74sj899oPzQkpvy2RyvO8UPr+1f8X0+9hRelggShosBFYMIzHu
 fzKi3aPDpCTARVWIzhGQUloxQOlQIuVN1CLdoblJRyGkK5I/VEVmo0qrMSkTcWeF8crm
 HiJ0w+vfI1s47JCFCx9pvYGGbULimZwQqj0c9+66H/FgJg5Te/+raV3WoTK0Lv+3eQra
 82A56vtKW/68GO5LEwy8Q+ZFPtvDn4FHp9FAvYdQgkn7aEIXbrdqKamhWS0z3/qWo0nS
 ylXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9LzeT+j4mcl6UlyhLk8GVYAGtKomNKvCxMaED/b1Hos=;
 b=WY/Vv9yLSdaxanIDS0epvJUYEkELy2T1tf1W4TBE2yE3CQq8I98GqfWfyVRgbVmIQE
 PtD2GHsRJwt4pVLv4KsfxcdtdwWF/kwYMMoyofLto3C9m3EFVjfessfItPMo8aE4I3YM
 X2cFRWxQSWw588ieCm6looBRfGS0zaKM7M6r6ZOVYTX0jpkkKqOESWgXqGJJsez/A+cr
 C/UjGvRPbWEfx9qRTfRoDg99zWWpY3OoW7Co+0/zYmoFyCKLCQlOcERKPr/esxoGhGIC
 yeTTvYbwVa23q81IE0U0VBKw8lcy00RF0r0BTBF2fyJIM9zLOLJyB7zazug1Fl2jNFIK
 AHVg==
X-Gm-Message-State: AOAM533jyQc7WeHzOrZ9Nl0HUJN8mDrYxOICVWEsRRdHBeTVksEWJF0k
 uy7iUjsIUh0woFD7n0ygAs59Aw==
X-Received: by 2002:a17:902:7208:: with SMTP id
 ba8mr876083plb.217.1593142348217; 
 Thu, 25 Jun 2020 20:32:28 -0700 (PDT)
Received: from localhost.localdomain (174-21-143-238.tukw.qwest.net.
 [174.21.143.238])
 by smtp.gmail.com with ESMTPSA id y27sm1605256pgc.56.2020.06.25.20.32.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jun 2020 20:32:27 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v9 31/46] target/arm: Tidy trans_LD1R_zpri
Date: Thu, 25 Jun 2020 20:31:29 -0700
Message-Id: <20200626033144.790098-32-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200626033144.790098-1-richard.henderson@linaro.org>
References: <20200626033144.790098-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1044;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1044.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, david.spickett@linaro.org,
 steplong@quicinc.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 3vNr21UoMeCt

Move the variable declarations to the top of the function,
but do not create a new label before sve_access_check.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
v8: Split out from previous patch (pmm).
---
 target/arm/translate-sve.c | 12 +++++++-----
 1 file changed, 7 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-sve.c b/target/arm/translate-sve.c
index 4fa521989d..a3a0b98fbc 100644
--- a/target/arm/translate-sve.c
+++ b/target/arm/translate-sve.c
@@ -4883,17 +4883,19 @@ static bool trans_LD1RQ_zpri(DisasContext *s, arg_rpri_load *a)
 /* Load and broadcast element.  */
 static bool trans_LD1R_zpri(DisasContext *s, arg_rpri_load *a)
 {
-    if (!sve_access_check(s)) {
-        return true;
-    }
-
     unsigned vsz = vec_full_reg_size(s);
     unsigned psz = pred_full_reg_size(s);
     unsigned esz = dtype_esz[a->dtype];
     unsigned msz = dtype_msz(a->dtype);
-    TCGLabel *over = gen_new_label();
+    TCGLabel *over;
     TCGv_i64 temp, clean_addr;
 
+    if (!sve_access_check(s)) {
+        return true;
+    }
+
+    over = gen_new_label();
+
     /* If the guarding predicate has no bits set, no load occurs.  */
     if (psz <= 8) {
         /* Reduce the pred_esz_masks value simply to reduce the
-- 
2.25.1

