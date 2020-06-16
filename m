Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp2802004lfm;
        Tue, 16 Jun 2020 10:12:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzySTG9E9bpCh+mZM55iri00Aa52MxBANtOUsf7rM5t8JpdgAiX6IjMdDrbbHNcMZaU2GWi
X-Received: by 2002:a25:3f87:: with SMTP id m129mr6231987yba.371.1592327559826;
        Tue, 16 Jun 2020 10:12:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1592327559; cv=none;
        d=google.com; s=arc-20160816;
        b=tPxHM6duTNM/5wOAQURgQHjbmgl494Z6KmXIn9bvPOeYfjCU6lbzQOGNatcgOZWa4w
         RdpqnXQOoRyh51NoKiHfxLnfRFkj4+RtV4JrLHhkgza9RwXIaltXrR8UY5b8L6fnT5l8
         qbSYx5iWMcLa68/IWmQshCX63WMQLzFgFRfm7TyhhaP4emCY6vE/WOqxs9LssvfZSsGT
         BQbiDi8lVZGNgWx13uiWmNWrxauf4P24He1+hIZ8CBtc9IAsZRYtX9YF55YoDAI/dw+s
         yyOwF/Sy3Rw2npzM7EfqTs7n9AvwKvra+Vi/rwB6u4dx/TVcGbu+ACsx1TeZREd97k9U
         H2rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=AhFkiGFNXdst6Xbi7nbMnw/kboTQarT4OU0u4/cvDkU=;
        b=nsI1NFToBjc1EGVxvViB54ODzRCLhEzDCNqnoOar3BCWUjIBqZNPOBFIv/tFrjlSwM
         538f8Y5mgFkXALC+nEHsMQJy5Mp8VdIi9QTeNombpjPXAD+t39W0YPgquzapQFRZvxdZ
         zO6QLjXhopUoSmMfVlNeLFNyUbHP0k+z2oU82x4/5wnILbGtMrZT7PU4uCeAHplDomey
         Kx4NQ/DRbe8DQ72krHIQj2h6nH2D/ksXCIKWEXjKRnBxrunBihVfu+9afX2jX62+p2hP
         Ezq40BtryJn4s/U2/VLl2FQAnY6HNa0Asa3cv2c1lxrwfDYcqnQdMwZf7WI3+ZBVckZy
         wszA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YX2/l1yY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i11si16995227ybq.138.2020.06.16.10.12.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Jun 2020 10:12:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="YX2/l1yY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48328 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jlF8Z-0001SF-1m
	for alex.bennee@linaro.org; Tue, 16 Jun 2020 13:12:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47010)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlF55-0001Nr-Qn
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 13:09:03 -0400
Received: from mail-wm1-x343.google.com ([2a00:1450:4864:20::343]:56190)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jlF53-0007Tz-HF
 for qemu-arm@nongnu.org; Tue, 16 Jun 2020 13:09:03 -0400
Received: by mail-wm1-x343.google.com with SMTP id c71so3576628wmd.5
 for <qemu-arm@nongnu.org>; Tue, 16 Jun 2020 10:09:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AhFkiGFNXdst6Xbi7nbMnw/kboTQarT4OU0u4/cvDkU=;
 b=YX2/l1yY+lY0w6SdYempW6wtkUJVCVhyvNDxltxec/OgDv83sra5Au5Y8+q3WJ728J
 sX7erYahfTsS8J1Gt5faQfL7dk9WH8YIlrHyMJNlR2rohySaQQgx8Ozodck8NRU55dn4
 XtfqASHTD5pnfagh8f2wkLu2V7F1jS2vJ8JLRKkAEUSi73QCOHD8xFhSzest6bi6suyQ
 yuXqp/sVeK03G2Cko+eJ5QS2+JUBOhXY6uDkVUgVH6vV01KU2kXVJFkgPNxMybvkdUW0
 82UU3W/f2a+TWXwo5nyfGaq2CLk3sRlrAq6IJj1qk7QEK6Zyvk3p8Lusw6MhY1ZFACcp
 isyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AhFkiGFNXdst6Xbi7nbMnw/kboTQarT4OU0u4/cvDkU=;
 b=PYWETcouVdyFrNtqNglzfBvMqPqfM5NBap0kn6gpY7h1D26Sw5Ar9yeSkPGRnylNQo
 PPEpaQJowzm6Qy+gsytDf1WtZMAw+NRwpZxx1tfxjixfvcqLKDiq4G94QobDuDl5tIKb
 Ni1sJEQ0qVbBcy+EBTITf6l2uC2Kk3cD6roHYAJnXX2K6KxixPafRZtTwjw8n3QrUs0R
 LB+iOpoHpoPaImx8qxCYFxKo7F7VhibFkIYBrr3HeaKrY8W7YIRjPUAJGlXjkyM1//ZY
 8lWDK4BmDU+pu5dJtVvn5k6FW1Goj72q+xg8jtGa3zHY21bAbSJsSNLr14BsqcM/CzE4
 KLOg==
X-Gm-Message-State: AOAM531IlwKtH7ji72a0hOORppOw4+y+RKwVUJcdbVUm+hm6HOxtF4QW
 /UzyoTAy6qSdC+NHWJDvNbr6sB80b/kRVw==
X-Received: by 2002:a1c:60d6:: with SMTP id u205mr4462949wmb.163.1592327339742; 
 Tue, 16 Jun 2020 10:08:59 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id y80sm5263216wmc.34.2020.06.16.10.08.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Jun 2020 10:08:59 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 09/21] target/arm: Rename NeonGenOneOpFn to NeonGenOne64OpFn
Date: Tue, 16 Jun 2020 18:08:32 +0100
Message-Id: <20200616170844.13318-10-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200616170844.13318-1-peter.maydell@linaro.org>
References: <20200616170844.13318-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::343;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x343.google.com
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e92z1BYxCnRW

The NeonGenOneOpFn typedef breaks with the pattern of the other
NeonGen*Fn typedefs, because it is a TCGv_i64 -> TCGv_i64 operation
but it does not have '64' in its name. Rename it to NeonGenOne64OpFn,
so that the old name is available for a TCGv_i32 -> TCGv_i32 operation
(which we will need in a subsequent commit).

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate.h     | 2 +-
 target/arm/translate-a64.c | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/target/arm/translate.h b/target/arm/translate.h
index 62ed5c4780c..35218b3fdf1 100644
--- a/target/arm/translate.h
+++ b/target/arm/translate.h
@@ -374,7 +374,7 @@ typedef void NeonGenWidenFn(TCGv_i64, TCGv_i32);
 typedef void NeonGenTwoOpWidenFn(TCGv_i64, TCGv_i32, TCGv_i32);
 typedef void NeonGenTwoSingleOPFn(TCGv_i32, TCGv_i32, TCGv_i32, TCGv_ptr);
 typedef void NeonGenTwoDoubleOPFn(TCGv_i64, TCGv_i64, TCGv_i64, TCGv_ptr);
-typedef void NeonGenOneOpFn(TCGv_i64, TCGv_i64);
+typedef void NeonGenOne64OpFn(TCGv_i64, TCGv_i64);
 typedef void CryptoTwoOpFn(TCGv_ptr, TCGv_ptr);
 typedef void CryptoThreeOpIntFn(TCGv_ptr, TCGv_ptr, TCGv_i32);
 typedef void CryptoThreeOpFn(TCGv_ptr, TCGv_ptr, TCGv_ptr);
diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index a0e72ad6942..7cb5fbfba80 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -11917,8 +11917,8 @@ static void handle_2misc_pairwise(DisasContext *s, int opcode, bool u,
     } else {
         for (pass = 0; pass < maxpass; pass++) {
             TCGv_i64 tcg_op = tcg_temp_new_i64();
-            NeonGenOneOpFn *genfn;
-            static NeonGenOneOpFn * const fns[2][2] = {
+            NeonGenOne64OpFn *genfn;
+            static NeonGenOne64OpFn * const fns[2][2] = {
                 { gen_helper_neon_addlp_s8,  gen_helper_neon_addlp_u8 },
                 { gen_helper_neon_addlp_s16,  gen_helper_neon_addlp_u16 },
             };
-- 
2.20.1

