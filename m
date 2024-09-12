Received: by 2002:a17:504:928f:b0:1be9:327d:8ee3 with SMTP id d15csp368564nji;
        Wed, 11 Sep 2024 19:44:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXMBzGv270dNlUHE/mOqfckeo/8+qMGN6JMDL1BuUMmXo2l4etUO1biKRFS8E3INv1YmaEUQZ9r6WWcHQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHm9RIYfrxtBtK1Y7b5krWy+fBTklX4406LojDhtBSRznl9q4/JcT4WcYgxZcTuyPbudMnR
X-Received: by 2002:a05:6214:3906:b0:6c3:6799:dde3 with SMTP id 6a1803df08f44-6c573b35486mr23753526d6.23.1726109069444;
        Wed, 11 Sep 2024 19:44:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1726109069; cv=none;
        d=google.com; s=arc-20240605;
        b=BLRbrj+JDGWy32SoIbfvO08TZiBXqD8M6YsNGr/9VBFaw9KL3PiBMvs+08TE7MD/HQ
         XRImfDTWp/hC5sWyc/W+qYm0kwG06MYRWwKMAAuMHw2jP88YzroOZDZzbRKgLmFn6u7b
         Gh+vaY0SkUBV7cNHXocIKRoVgRTprd3COJX06DtxgSE+TUOOUx57lKvoH+goAtuWmipc
         wa5Gmx9ik0b5w9msm4qrTskh5elLqVgEK4IGBnLJihk4AI72RYcfnGaXgLBinJJHQUL3
         /65rjn5PxFVUAlwniPGHQWuFv0gJ1+ymbXHLugAiS+KXW8AkdiM837kQG7R/tAKHVjZU
         zCaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=YSOEdaLeZCfPJbRKNmK3UxW2mNrgDyxy1eu96FTDCng=;
        fh=ZhBia3nL9o1nuf7SbgdYn/0pDmAeja6gisyWXi2cqYE=;
        b=aK9UhUaFhmJ2GN5f5JknERSsu3ugRBXkDFgE+Ljr5CS4t0bQTZblwwz7ZYtCUzXcVw
         oWTUm/caUrZHV8UY51oTES/+NoS5UhEcRwSNHSnq/7XO/MaTBiVVeJbWIFED0iLlcbMR
         0NGg6RftDtgzfdidWKs1mg/7nsqUDjH2RCnL3W1+YBkZouHEyX7OT0Xe5tgLYjroV8kG
         YguaAPJRB47F6UMbzgIEAcJDAOBglG7ESelWd7BywGMvK5tTBq+i1Y6vkfBldquOVBq+
         BoyEE+N7Imw93CZ/j0qME4ohIV1fJoGqhxwuV7+HzE3OOCLYSoXoO1iJMF/iwvDuod0m
         ZSoQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qIjz3EFe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6c53476f954si117547756d6.245.2024.09.11.19.44.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2024 19:44:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=qIjz3EFe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=fail header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1soZmC-0003uq-4v; Wed, 11 Sep 2024 22:41:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZm3-0003HB-OO
 for qemu-arm@nongnu.org; Wed, 11 Sep 2024 22:41:35 -0400
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1soZm1-0004DF-OC
 for qemu-arm@nongnu.org; Wed, 11 Sep 2024 22:41:35 -0400
Received: by mail-pl1-x62c.google.com with SMTP id
 d9443c01a7336-206b9455460so3734185ad.0
 for <qemu-arm@nongnu.org>; Wed, 11 Sep 2024 19:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1726108892; x=1726713692; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=YSOEdaLeZCfPJbRKNmK3UxW2mNrgDyxy1eu96FTDCng=;
 b=qIjz3EFeOJleaipmATgNyYxcU5wx6Ce3hm5OoAyc/2TeWM80E536nH2il1I0XiQgpu
 EOQBbhvs7MnUmH5fOkEVg0JXmXaOpkYvF9soavuZJwLC0rCv3BKhW43tMIV3rQDgoJop
 MDt/sGmOows6SblQ4puKSbJB1g9C1JNTW2yz465E9fMVlthekEwCXjjaoP88E/DofBAm
 8vc5++Rq8fqqoiY7/7TLG01O436vBXK1Czur3y2jmdRoGynlSJJvaRn3tS7jTcBJvMUS
 8Bq8iKFCXvgqKDoVu2zCZbw2O/JG6kQYnTvkWH3wtbxpmQSRm3fSdyZaInZP2z+6mhb2
 e2hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726108892; x=1726713692;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=YSOEdaLeZCfPJbRKNmK3UxW2mNrgDyxy1eu96FTDCng=;
 b=X88G1TblLVVT/n93JhHTEhm31PhWEU81EUJKKhRTwvVDiTB/LkLp3f22w6vM54hRs+
 nuywMXLyNhqrxXuOnEjCTzSX0xC0MZzVvCP4uhfhENxYglfyl9KtxyHcpVWqONcHsZb8
 olH+StPHm5tSEhzEPEg3s2GTlohG7gm71WlH+Osw0gxfF0e8nBA3gC9sRhfMOgLi1/5q
 SDQS9S1GaJeuKPY623JELU6IXfi/8RR4MhVdjvPyeC7x8v6nOvlpece65ieSMX09vjEH
 Zqj3UVQut0KvopMN67vESylwjojHG6RnjJS1Egr7HGTkooqs4HKc+XRAfpMndbvOYAvj
 PYXA==
X-Gm-Message-State: AOJu0YwEkZ7K4ft9aizWFsN2PxCoeSKF/vqDyGnOoOPWmhCknWd9qf8X
 5k2nEjpA5h3B/e2WnPyPYRDah51pnkfBq3XZUZ1paRJ0n/0dIzihHIt+AVR9zIE=
X-Received: by 2002:a17:902:d4ce:b0:1fd:96c7:24f5 with SMTP id
 d9443c01a7336-2074c5d2351mr91016755ad.5.1726108892444; 
 Wed, 11 Sep 2024 19:41:32 -0700 (PDT)
Received: from stoup.. (174-21-81-121.tukw.qwest.net. [174.21.81.121])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2076afe9c61sm5635915ad.231.2024.09.11.19.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 19:41:32 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v3 18/29] target/arm: Use {, s}extract in handle_vec_simd_wshli
Date: Wed, 11 Sep 2024 19:41:03 -0700
Message-ID: <20240912024114.1097832-19-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20240912024114.1097832-1-richard.henderson@linaro.org>
References: <20240912024114.1097832-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::62c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x62c.google.com
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
X-TUID: 4gJSseozgywS

Combine the right shift with the extension via
the tcg extract operations.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/tcg/translate-a64.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/target/arm/tcg/translate-a64.c b/target/arm/tcg/translate-a64.c
index 1225aac665..740620074a 100644
--- a/target/arm/tcg/translate-a64.c
+++ b/target/arm/tcg/translate-a64.c
@@ -10477,8 +10477,11 @@ static void handle_vec_simd_wshli(DisasContext *s, bool is_q, bool is_u,
     read_vec_element(s, tcg_rn, rn, is_q ? 1 : 0, MO_64);
 
     for (i = 0; i < elements; i++) {
-        tcg_gen_shri_i64(tcg_rd, tcg_rn, i * esize);
-        ext_and_shift_reg(tcg_rd, tcg_rd, size | (!is_u << 2), 0);
+        if (is_u) {
+            tcg_gen_extract_i64(tcg_rd, tcg_rn, i * esize, esize);
+        } else {
+            tcg_gen_sextract_i64(tcg_rd, tcg_rn, i * esize, esize);
+        }
         tcg_gen_shli_i64(tcg_rd, tcg_rd, shift);
         write_vec_element(s, tcg_rd, rd, i, size + 1);
     }
-- 
2.43.0

