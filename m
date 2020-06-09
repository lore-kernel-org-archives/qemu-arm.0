Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp636662lfc;
        Tue, 9 Jun 2020 09:08:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtuKADN+djCURTggof5mcTokfrcIW0iGus8/pTYM6fi37yqHjZ5BZOY679HB8qT1+0mtqR
X-Received: by 2002:a25:8107:: with SMTP id o7mr7765856ybk.507.1591718910380;
        Tue, 09 Jun 2020 09:08:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591718910; cv=none;
        d=google.com; s=arc-20160816;
        b=hcEg3zFlbHWwAAh8aF2cepKup6PvOnboGdC0ODJ9lNYglZ4TkHsAchyJ+qDXu3h6mS
         kQ8J7iZtPI0UlK2UJ5jYsUz7B7fZFcgBgguwgig1wVVHdotFEcXIbbxPe0RRHa8g+lk6
         R+xXg7KZdPHUCGttriB8Dndo6FYzzAVBuwcgxycrLCdz+gUiwhMNm4p63DAEZg4WtpY/
         6fVYLA0B7JWcqTI8TISZ8xNpp3JNMkXUXevmhKx4ZsRefqzvKzlyzF0AQbKoIvUumvKG
         t8MPSY0yIrZDZwS/mZ/HSaldD2FFlatsZMJ8GdjjcnaH6OgQYsOaUUQEXQLjmds46SvN
         RN1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=6Po3TGUgc62Sm+OROEr5qzIKDQbHx7K4FmJnkx1dhO0=;
        b=Rkn/A/a9EvhZFR0t75n6swo1N80RfihOnCqcUFbjlLXkJOMTV5rxNuuHWdOEKKhOxM
         9F+ClP4h4aELKZKCC29h5ujp6bRXI4k9nwK3IDui5GZRskbSJ7nz5o4HhvBEJGGTLSAh
         d/mGmcC0bQcphzftTPU5iFq5HBOIaaQpN3MW939Irm40g+b5ZN71ShquA4IzEbivCWRi
         A7aWA7va7Z7gX/SU+n/BxTM/tcJBauedn0pYavQogrVFy2H0Lo8S2MittCtBuA4mCgD7
         2j98txCg0PxTePHuhd05qigXzqiDsu+2UOTT1zBv8MZPkIlXX5TNFqJgKmfXlQuyjVfa
         HgFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TMdPaoOV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f5si2776632ybk.395.2020.06.09.09.08.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jun 2020 09:08:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TMdPaoOV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jignd-0002Op-Nn
	for alex.bennee@linaro.org; Tue, 09 Jun 2020 12:08:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jighf-0003KN-QM
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 12:02:21 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:55823)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jighd-0003QH-Ay
 for qemu-arm@nongnu.org; Tue, 09 Jun 2020 12:02:19 -0400
Received: by mail-wm1-x342.google.com with SMTP id c71so3341693wmd.5
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2020 09:02:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6Po3TGUgc62Sm+OROEr5qzIKDQbHx7K4FmJnkx1dhO0=;
 b=TMdPaoOVc06Hcuvb444JBkpYSOXZoYIIgGmcsB6k8J70qDFAdYz4I+YnsfdBeQQcWu
 7kWoGGbjxbeJKuWdHXfYU4h5sMgkCjSePRUDQ8MgSdRbWkeI5nFZQ7yI6degLsH/FTSo
 2qpRYYWS5ifcx9t4R2fUrTvEkepWOO4M4jyS72ie6uN/8i8HtH+wU25XtXHpVn5TGu5p
 dVJjChSxteORd+VkuVaDNIZGSWcvFnoqI3kRW+YWxhApP7vlqbLzxu69EC1ZdB1hEguA
 /bmuJTaZkOh09zXF09vrgov/e53ucycEM4zi8/VfiphMXnvvSpxFP3YL534PV47VZY6Z
 pePQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6Po3TGUgc62Sm+OROEr5qzIKDQbHx7K4FmJnkx1dhO0=;
 b=Mytg8PzhCFRG1CLyaidno17Yi3nkcWx2I0F3w3axKQlgkhXmohsOU337jDofn/B76V
 kV/ujp68rZNpe5YJprtjo8fl9EcmJoAZ+PyMoCHj5oujbmb4ZvkuLGlMi0UIk2JYReuh
 44v/B34uezAZU6BQhSZYNQpYYKv3jnEWUCwJ4fpmBTe3K/tkdH0prBlI0vrLpjbqnuva
 BZWrrngBt+B9WDwzW9D6S0ZWwO+em+Im4rCPK2mMdwgbA73YVumrs30KL46P9h/r1oWp
 ofLVAHCjt20Y/fou8/FyQCLzTSUHheNFLL4I6+xZ6bupYdfNxz9PnEVaZdDjiQ8gCG99
 UZ0g==
X-Gm-Message-State: AOAM531YQjxIL+Ayr1yunw++l7QvKmPDknPLfmf0UIxngoPYiJSslR88
 RzYkjuPHDodNFDVx93Xky5yk6nou+UqDEQ==
X-Received: by 2002:a1c:3bc2:: with SMTP id i185mr4887468wma.33.1591718533812; 
 Tue, 09 Jun 2020 09:02:13 -0700 (PDT)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [81.2.115.148])
 by smtp.gmail.com with ESMTPSA id b81sm3699867wmc.5.2020.06.09.09.02.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jun 2020 09:02:13 -0700 (PDT)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: [PATCH 1/7] target/arm: Fix missing temp frees in do_vshll_2sh
Date: Tue,  9 Jun 2020 17:02:03 +0100
Message-Id: <20200609160209.29960-2-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200609160209.29960-1-peter.maydell@linaro.org>
References: <20200609160209.29960-1-peter.maydell@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-wm1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
X-TUID: lkmmvn25RvSE

The widenfn() in do_vshll_2sh() does not free the input 32-bit
TCGv, so we need to do this in the calling code.

Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/translate-neon.inc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
index 664d3612607..299a61f067b 100644
--- a/target/arm/translate-neon.inc.c
+++ b/target/arm/translate-neon.inc.c
@@ -1624,6 +1624,7 @@ static bool do_vshll_2sh(DisasContext *s, arg_2reg_shift *a,
     tmp = tcg_temp_new_i64();
 
     widenfn(tmp, rm0);
+    tcg_temp_free_i32(rm0);
     if (a->shift != 0) {
         tcg_gen_shli_i64(tmp, tmp, a->shift);
         tcg_gen_andi_i64(tmp, tmp, ~widen_mask);
@@ -1631,6 +1632,7 @@ static bool do_vshll_2sh(DisasContext *s, arg_2reg_shift *a,
     neon_store_reg64(tmp, a->vd);
 
     widenfn(tmp, rm1);
+    tcg_temp_free_i32(rm1);
     if (a->shift != 0) {
         tcg_gen_shli_i64(tmp, tmp, a->shift);
         tcg_gen_andi_i64(tmp, tmp, ~widen_mask);
-- 
2.20.1

