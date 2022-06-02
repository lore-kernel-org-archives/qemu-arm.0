Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp5202754lfh;
        Thu, 2 Jun 2022 15:04:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzJLmDRmb+Z1Of0E+VqtaqwdblkV8GZs0y1N2BQGD38FX140k8qJV8sMzjWAWmUm5jQ0STn
X-Received: by 2002:ac8:7f8a:0:b0:304:ce5:6a2f with SMTP id z10-20020ac87f8a000000b003040ce56a2fmr5290856qtj.563.1654207455756;
        Thu, 02 Jun 2022 15:04:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654207455; cv=none;
        d=google.com; s=arc-20160816;
        b=fT2wDFNyQKyK52sYoIZKQ32zYqXBmtub5obwrhTIBitV431Z4H3o+jXP/U8Pht2fvl
         KSo4j1Aw2+D95Lto5CR6UAX1Bsp8oVHEKqH4JaoAHblSFo1fxNXJIcyR6kHUH/SA4CgJ
         w8pzVDkI1zz2Bjd55r4wJT7Lzx9s65hNFSPGGjdjkoU4gIQTnxOc6Er1NxnaXtLcvr5P
         etx5LOZCvNWqBc8XlnokIYIr1wY6A+u23nkUfwUe+hV5jogAbUFLWEGLC7vEk5eX2tdU
         KHuOwUhjpWbeDZ9dlUhu0AJMnJ+lWef9eXH7MEoHkkipqyGJe1kpmqw8puun71qiphbP
         Jc1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=vL9SSDiS59z0r3Skz7kY+nA3z0bl4IpSAevgPDF0S/k=;
        b=OHzYpplPgxBbY5jNCwyCPh0zJjq+csR0yCBwQLNVOIbQ9qiIpZtXoDgsM+IxP4cdKN
         O09YBojb4gADbgPt29TeC12aU3M+D1pnnPnKZ0SoURA8sDBcSpbSu5wwLpWLNOqJF9Iq
         iIYZ86VisFKWtxJpKr34+JdxOkDsfquuQ2VNYSgiDEC8x/uDLNffHyRf/cBof9iZ2yjZ
         xrFlwqMyUWUFOaqQ/YaeezS7UNCBjVOsOXv4ATBbMT+6adfDjaqc7CIL6+gHm0piNa0G
         Dcpugvz8TPRSpndjWc31gTXZ9cus2NJhvEJtqlahNZXJKeVFAYc1D5q0OSgsdiOJj/G0
         RmIg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FeyuXHtT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 8-20020ad45ba8000000b0044a13c1317asi2746604qvq.122.2022.06.02.15.04.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 02 Jun 2022 15:04:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FeyuXHtT;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47494 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nwsvP-00016n-8S
	for alex.bennee@linaro.org; Thu, 02 Jun 2022 18:04:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37038)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgu-0004ml-8i
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:16 -0400
Received: from mail-pj1-x1031.google.com ([2607:f8b0:4864:20::1031]:45770)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nwsgr-00008t-QQ
 for qemu-devel@nongnu.org; Thu, 02 Jun 2022 17:49:15 -0400
Received: by mail-pj1-x1031.google.com with SMTP id
 w2-20020a17090ac98200b001e0519fe5a8so5868523pjt.4
 for <qemu-devel@nongnu.org>; Thu, 02 Jun 2022 14:49:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=vL9SSDiS59z0r3Skz7kY+nA3z0bl4IpSAevgPDF0S/k=;
 b=FeyuXHtTx+uWD07S5A0RQUT322tzQkEeATVNcn8UGx5BOcAkz6wdqUphYdt4GHVEX1
 1JUH6eiDZx/2+s1NfhTRIhRIpRYhnUWbFZHDCvXOBz3Y3LPhkOm/iAxjCo3CA9n1oR3p
 d6rW3Kd9f1PeoGflJM9wqZ/4OOJSEMsDeaqu99OAQPeuMKshUN0pd+7xTc3duQ0hRROP
 qZ3OFfBkcBt04aFtUlPxOeeg/uEHUeYE67RYWNv7sCrID2XqRJQO2FqHdpzy9z4bwDKx
 MUQeBAQScZP7s1fIlVesaFTt6iocSRwksmkOe60kbKxBJrrblXCyG64I0Qozy3Hica7x
 Qm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=vL9SSDiS59z0r3Skz7kY+nA3z0bl4IpSAevgPDF0S/k=;
 b=skdQIbAc1l8UzsOLcQCtW3ql+wE3UIcFlt1lVKV1CVBUX63Gppr8TQG0ZBfbk9KJE7
 r+cZW/5j/qQgpQXHOR+1yJLHcNtxeqSvzoIORY5g7pu3xwX1BbJaFVs9CdYfvK/SAPUV
 460G89zdkumA9gD/NCvNzuS6wEvRB2KymmV9rY+NFxbWkFXa3YzLOrYsxQ6LX9EEnaqE
 rvYyQLFta30vEI86P6jym5mW6CNxx39UdQwH/dxBFtxNJz6FqxfGHSNYdm98VU9X2x5H
 uEjjmbRSKFT+WLtHAVCkMRtFk4oYYMf6eAl1dUUVEXlnXvkbRLaDXimtQGFx0XOxcPI7
 Tecw==
X-Gm-Message-State: AOAM533IVAjAExTcf80VRZm4lnTHSGXsa41HYY0g4ypl0+yMl1zvMTfK
 MbL/MeJkb/uenika3RDMQDT/C/2kZgZtQQ==
X-Received: by 2002:a17:902:d502:b0:161:bc5f:7b2d with SMTP id
 b2-20020a170902d50200b00161bc5f7b2dmr6834665plg.140.1654206551245; 
 Thu, 02 Jun 2022 14:49:11 -0700 (PDT)
Received: from stoup.. (174-21-71-225.tukw.qwest.net. [174.21.71.225])
 by smtp.gmail.com with ESMTPSA id
 bf7-20020a170902b90700b00163c6ac211fsm3988760plb.111.2022.06.02.14.49.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 14:49:10 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
Subject: [PATCH 19/71] target/arm: Add isar_feature_aa64_sme
Date: Thu,  2 Jun 2022 14:48:01 -0700
Message-Id: <20220602214853.496211-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220602214853.496211-1-richard.henderson@linaro.org>
References: <20220602214853.496211-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1031;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1031.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +fuK4U2DFfYK

This will be used for implementing FEAT_SME.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/cpu.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/cpu.h b/target/arm/cpu.h
index cb37787c35..f6d114aad7 100644
--- a/target/arm/cpu.h
+++ b/target/arm/cpu.h
@@ -4043,6 +4043,11 @@ static inline bool isar_feature_aa64_mte(const ARMISARegisters *id)
     return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, MTE) >= 2;
 }
 
+static inline bool isar_feature_aa64_sme(const ARMISARegisters *id)
+{
+    return FIELD_EX64(id->id_aa64pfr1, ID_AA64PFR1, SME) != 0;
+}
+
 static inline bool isar_feature_aa64_pmu_8_1(const ARMISARegisters *id)
 {
     return FIELD_EX64(id->id_aa64dfr0, ID_AA64DFR0, PMUVER) >= 4 &&
-- 
2.34.1

