Received: by 2002:a17:906:568b:b0:a2e:1324:ea5c with SMTP id am11csp411426ejc;
        Tue, 23 Jan 2024 08:04:16 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGoq+nLZs1mipjzpMpnzaLuwRZghAIUq8FxGaGAz8eNyTbeVs6QyZ/88Yuue52FgD/h2Ekd
X-Received: by 2002:a05:622a:1888:b0:42a:2e6e:6b2c with SMTP id v8-20020a05622a188800b0042a2e6e6b2cmr1098507qtc.20.1706025856062;
        Tue, 23 Jan 2024 08:04:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1706025856; cv=none;
        d=google.com; s=arc-20160816;
        b=Ay8X6klAcbGyU7QsSOrZGmYf8BzAcp2vi9Kf2HRyATmuCq1URgo8jhS8HWhqQzcR/p
         2cSRUKZDh3A9A8iVUjVYknAApG0dcUsXugpqMiiHLQTHL+kKS0eo8G3oyP2nwDHGjzMz
         WPSNEZ65Ek4KpXygKGR8YrN9Nb/ayJSJWtlSsT5/clNl4jBXA/hvJUa1JNFOb1yGHvn9
         M86tC6UzeKFXk2o1aAHqQ9hXrac/88Bt4qYG3Zk4q86F10eiOtj52MkWkQyh1HHCujLJ
         RJrQ1fDVhbLrGqV5fTuFjuMS8w3+CmJIuUanok21t3LXHcbpzi0lRVbl/sI25g1X7fWp
         Uliw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=jTUUEUja40WbQS6wzJYDPCgMUCiS6GJwtB6HGzHkSGs=;
        fh=spbD1uAOw2hCQBb83uSlqZAKTOl6wvNX+k1rxl9UBCg=;
        b=Tx/N01ljLZoWHksr1ZIhi+4AZwkQf93Hk7PuUzv0oGplYZSL0rj7KrKMVJC+aItF5I
         CTb9PivtiwDpQ/pB9tw3Qs03Eexxq+L1YBGJsB9zIMwCPP1ZmAhYsmsQRuMCznXdFir0
         D5S3igTNb1wxaI9rLOSRu4IBoMdlyHyL67+3HpXY8ya6Y4vBOGeeuI5xFOKhRHDaecBI
         xtAMahjJhY3YADvYcUhgeTCml/NtMrbAB3J1kzApCnXS1J2yN8Quw6YwWBAkgqXLonPw
         F12HJ3FHKHWwHlLElKMzi6/ZCqAq+YHgOLuK16N6BhXJfFECPhw3FoQdjdjcDcf1Az9r
         9ILg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c9RPmTpG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e9-20020a05622a110900b0042a3cdaec5bsi4970128qty.401.2024.01.23.08.04.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 23 Jan 2024 08:04:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c9RPmTpG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rSJFW-0008H3-AD; Tue, 23 Jan 2024 11:03:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rSJFU-0008GO-FB
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 11:03:40 -0500
Received: from mail-wr1-x42e.google.com ([2a00:1450:4864:20::42e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rSJFQ-0004ch-46
 for qemu-arm@nongnu.org; Tue, 23 Jan 2024 11:03:39 -0500
Received: by mail-wr1-x42e.google.com with SMTP id
 ffacd0b85a97d-33921b95dddso2218254f8f.1
 for <qemu-arm@nongnu.org>; Tue, 23 Jan 2024 08:03:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1706025814; x=1706630614; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=jTUUEUja40WbQS6wzJYDPCgMUCiS6GJwtB6HGzHkSGs=;
 b=c9RPmTpGldE8JL3AfanR+bxNnaEcRwp0X/T16FJsCPBOwO9t5TBiqz7xNMmHKcaa6T
 aa7npVhae417GYeJMxD8JWBMjQfPW4YREIu+AH+HkXctArsPyE4JhSeI0b1zY02kccoa
 VMhGAnkOa7suCYCzL4QUCLRpzt10saVWiC7zJz78zzzAk/GsbhZ+egDBT1mrGqMFtmB6
 flyZYPsQ1sv8pmxjaYuwUGZS3Hj+tumzsYlSR4jGDWZtMykxAYJcoDA90Byxa7n5aA8Y
 fxjkA1uPH5sANnmSijG9mf9GVCrST0C1Zsab0okEiNoGimezD88owSN7JoWvM6DDnzPK
 SA2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706025814; x=1706630614;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=jTUUEUja40WbQS6wzJYDPCgMUCiS6GJwtB6HGzHkSGs=;
 b=Tu30ivrscOjj1/NaY+sEb0eJw3/i0vGJM902p2WTD+5Mtb8imKn2jVIoYxN8tWbniY
 3zTVkyZX2daLZJZ9u/FT1speoBy1vojs8uxoJNnGr4lCHT8QgjRJw+RBQ77wMyDqqPiS
 bID1ClPDfw6BwY2L5ZmUqf5lU29vjGevQK43kJhlOjF82sZKPt66dRbAedk+7An4WFRo
 yfUYfhReIb4129jDSVtVIV5DcJ+V29HNa8zrWx8vHTua/sRDj3W2TA4Pno1lRFZN3Qh/
 /ER/ju5mURVOiJTwz5nRm+r37VCKuTJWGVzoLiHDmr4ZduZPqYE7mUx3vvv4yJYp+eLc
 UBlQ==
X-Gm-Message-State: AOJu0YySAjLmuPTo/BX8cslutk7sV2w6TD/IRjJp9zQMqrg/YdhLc1xX
 NbXVD5cNN8FWx9pOmWE2j0msf+Z/NpCjflCJZ9WPjckxlcxTx8qJpIXqePBUHccncAF/iot15yd
 i
X-Received: by 2002:a05:600c:1c23:b0:40e:4832:9fc3 with SMTP id
 j35-20020a05600c1c2300b0040e48329fc3mr299253wms.7.1706025814148; 
 Tue, 23 Jan 2024 08:03:34 -0800 (PST)
Received: from orth.archaic.org.uk (orth.archaic.org.uk. [2001:8b0:1d0::2])
 by smtp.gmail.com with ESMTPSA id
 f13-20020a05600c4e8d00b0040eb6ce137asm2651539wmq.39.2024.01.23.08.03.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Jan 2024 08:03:33 -0800 (PST)
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org
Subject: [PATCH] target/arm: Fix incorrect aa64_tidcp1 feature check
Date: Tue, 23 Jan 2024 16:03:33 +0000
Message-Id: <20240123160333.958841-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42e;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: DB+Rqxz8As5Z

A typo in the implementation of isar_feature_aa64_tidcp1() means we
were checking the field in the wrong ID register, so we might have
provided the feature on CPUs that don't have it and not provided
it on CPUs that should have it. Correct this bug.

Cc: qemu-stable@nongnu.org
Fixes: 9cd0c0dec97be9 "target/arm: Implement FEAT_TIDCP1"
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2120
Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
---
 target/arm/cpu-features.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/cpu-features.h b/target/arm/cpu-features.h
index 7a590c824cf..24525e36349 100644
--- a/target/arm/cpu-features.h
+++ b/target/arm/cpu-features.h
@@ -771,7 +771,7 @@ static inline bool isar_feature_aa64_hcx(const ARMISARegisters *id)
 
 static inline bool isar_feature_aa64_tidcp1(const ARMISARegisters *id)
 {
-    return FIELD_EX64(id->id_aa64mmfr2, ID_AA64MMFR1, TIDCP1) != 0;
+    return FIELD_EX64(id->id_aa64mmfr1, ID_AA64MMFR1, TIDCP1) != 0;
 }
 
 static inline bool isar_feature_aa64_hafs(const ARMISARegisters *id)
-- 
2.34.1

