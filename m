Received: by 2002:a05:6512:230d:0:0:0:0 with SMTP id o13csp367109lfu;
        Tue, 26 Apr 2022 09:48:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1a7gHa8pUYahz1eMigGWggsVlFVTsqnOmNCvG7l2Uu43q799sFQS+G4zurBXNG4LbQZFO
X-Received: by 2002:a81:dc4:0:b0:2f7:d7a0:a491 with SMTP id 187-20020a810dc4000000b002f7d7a0a491mr12620985ywn.466.1650991711961;
        Tue, 26 Apr 2022 09:48:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1650991711; cv=none;
        d=google.com; s=arc-20160816;
        b=KhEG5dTLM8iNYdEXViSBuXsXhPN5/RNk6JdhePybu7oAFv+NirrpnLwF8WfuIow7nr
         Ptmj6RTR6CBd9cyRdHJRs38cogBCq6GHwtmsG0P0DLlgLOwkxRiud+k30XzPpimtelLp
         kG8hnQ/Syvk558xkDuFENgGzC1sQI1iOGsfjBjCwMyIoSWnOQPH6Wbh3Q5VHl+P25FmD
         brg34U0o2vq+/sL11w+oizB+OitIdwp5cpg4BN29w9045ue+mU9kBPysNlfxhYFQNnrS
         OM7IYJnM6lYRX5XJ3dydxqzCTE378PM3GsC4adst6Qgu/0thcDs2LAC6p4UMVFLbcpWk
         o3Kw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=NixTeigeFj7bJFeJ3Xbq08CCTyPtA/jgmvHCQlEdtdo=;
        b=e0omZ2KkRo+EOkV3tXDU/h5FxocSCQcVoBlvDh79tEexpI49+tWEkz/vVyASPyg9MX
         MfPTMrOt0kLfUCYKl6q9rQyT0kf7lvhgDntecxzFTgcwIMsG4f15ud1pGNhlcXFU8DJN
         iQXYAPHC+sCi1PDDXT+lwPCoeT/dg+gB8QZceaaiGgg2kKuiHGMuyIxAjYXQAjQDRAeJ
         WhSDvCUe/C9fAxEOHsnW+11H0lAzpDAXy3BdhkxzR0ubjAVuk/7fbxbv8EjvgNmhKFDE
         9W1nDJpBPSRNUGm0XQSl1vxC0isrBIkY4h9IkRLm90BBmqhyApHs3QHvXwqx5MhwMf6P
         dIMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="r/5P5CWz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w186-20020a817bc3000000b002ef49b89dd8si14907509ywc.10.2022.04.26.09.48.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Apr 2022 09:48:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="r/5P5CWz";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1njOMZ-0005MK-8s
	for alex.bennee@linaro.org; Tue, 26 Apr 2022 12:48:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45256)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5g-0002xx-WC
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:11 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:38619)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1njO5e-0003pD-KU
 for qemu-arm@nongnu.org; Tue, 26 Apr 2022 12:31:04 -0400
Received: by mail-pf1-x435.google.com with SMTP id b15so18447370pfm.5
 for <qemu-arm@nongnu.org>; Tue, 26 Apr 2022 09:31:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NixTeigeFj7bJFeJ3Xbq08CCTyPtA/jgmvHCQlEdtdo=;
 b=r/5P5CWzZwYKWf3wMvr9iS47/MsgRE21A6uKmLg9SSOVIBMONJhB5eCTml9NrLMJ29
 1z2gVRqxjOxowXfIwYR0cUsc6dXTM6zD2EBxdj1UqAshtqeIEmEn1d8pT2OidcSiSNpL
 KhYljWMCa/XZoT25pAVQGbxt/2a2URiK/7vzJ/zJx7UYxoQR8SntAB/3aF7/frHq3WUP
 g1gvhMd2JE1TjMazgE5dAhxf2OKNdl+ppD4brh8jDkYJo8Cbz8tqGAtyJpYk/Bh5UAcd
 TUQ4lz5xnxxwUqM9FIigHFAX1hCDvmOKwcuSZt9RniCeqYIbHrHrroroEA7WWAbuM/bX
 JUlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NixTeigeFj7bJFeJ3Xbq08CCTyPtA/jgmvHCQlEdtdo=;
 b=ZPgKVRlVuwyxb93PpJCvGDCIVUQLrJ9JFTKspnns0w2mTV77s0Nk/EvcWLQamLi8Vv
 3Te0/6jLhMVl1VSTN2SvzarjGzqx7BgN8I8DmhWa3xy4+5JDZ9lHk3eImb/5IoFlM66B
 azcMXZazN2YB7T04TjSyD9lxSS+f50yG79V+pPKNmUbkTYgdMNTIIRcR9xPeycVx7bYd
 2siCWtc/jTcHHetJy5IIu6BhSniIyzD2FeGLys0CqwIihSIJDEhZj9xhfwO6WFOAImbY
 GqrMLv5PUQVj2FeZZ24SILGPR2cu/+KDzVBttdbv54GX++8j+A/eJ8Cc5hFFb/wGRT4g
 /+6w==
X-Gm-Message-State: AOAM532q2Qe27hsSHhc7YiTTwzBBKu1tASMWY4Er4LvV/2ahu1u+A4Wr
 Y0HyBmZMm+doAhNqLRwmaBanIy1jTr8mIQ==
X-Received: by 2002:a63:9502:0:b0:386:3916:ca8e with SMTP id
 p2-20020a639502000000b003863916ca8emr19922253pgd.357.1650990660941; 
 Tue, 26 Apr 2022 09:31:00 -0700 (PDT)
Received: from stoup.. (174-21-142-130.tukw.qwest.net. [174.21.142.130])
 by smtp.gmail.com with ESMTPSA id
 y131-20020a626489000000b00505a8f36965sm15655813pfb.184.2022.04.26.09.31.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Apr 2022 09:31:00 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 15/47] target/arm: Use tcg_constant in handle_{rev16,crc32}
Date: Tue, 26 Apr 2022 09:30:11 -0700
Message-Id: <20220426163043.100432-16-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220426163043.100432-1-richard.henderson@linaro.org>
References: <20220426163043.100432-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::435;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x435.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 32TOF17vd+v3

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/translate-a64.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
index 9b678cc5af..ff08306d2b 100644
--- a/target/arm/translate-a64.c
+++ b/target/arm/translate-a64.c
@@ -5372,7 +5372,7 @@ static void handle_rev16(DisasContext *s, unsigned int sf,
     TCGv_i64 tcg_rd = cpu_reg(s, rd);
     TCGv_i64 tcg_tmp = tcg_temp_new_i64();
     TCGv_i64 tcg_rn = read_cpu_reg(s, rn, sf);
-    TCGv_i64 mask = tcg_const_i64(sf ? 0x00ff00ff00ff00ffull : 0x00ff00ff);
+    TCGv_i64 mask = tcg_constant_i64(sf ? 0x00ff00ff00ff00ffull : 0x00ff00ff);
 
     tcg_gen_shri_i64(tcg_tmp, tcg_rn, 8);
     tcg_gen_and_i64(tcg_rd, tcg_rn, mask);
@@ -5380,7 +5380,6 @@ static void handle_rev16(DisasContext *s, unsigned int sf,
     tcg_gen_shli_i64(tcg_rd, tcg_rd, 8);
     tcg_gen_or_i64(tcg_rd, tcg_rd, tcg_tmp);
 
-    tcg_temp_free_i64(mask);
     tcg_temp_free_i64(tcg_tmp);
 }
 
@@ -5663,15 +5662,13 @@ static void handle_crc32(DisasContext *s,
     }
 
     tcg_acc = cpu_reg(s, rn);
-    tcg_bytes = tcg_const_i32(1 << sz);
+    tcg_bytes = tcg_constant_i32(1 << sz);
 
     if (crc32c) {
         gen_helper_crc32c_64(cpu_reg(s, rd), tcg_acc, tcg_val, tcg_bytes);
     } else {
         gen_helper_crc32_64(cpu_reg(s, rd), tcg_acc, tcg_val, tcg_bytes);
     }
-
-    tcg_temp_free_i32(tcg_bytes);
 }
 
 /* Data-processing (2 source)
-- 
2.34.1

