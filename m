Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp1544854ejb;
        Fri, 2 Jun 2023 19:36:37 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4oOk6N9Jqa9chUWabIZln+lJKVE7nd+PBtsJ/vf7Z543C+zsqn8wX3SCWldeFMZm2KeeL2
X-Received: by 2002:ad4:5748:0:b0:623:855a:9226 with SMTP id q8-20020ad45748000000b00623855a9226mr500793qvx.23.1685759796906;
        Fri, 02 Jun 2023 19:36:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685759796; cv=none;
        d=google.com; s=arc-20160816;
        b=QGXVtnGsScULE4SSryPlRYfa61dsRiOgPLmodJ3Ah+S0vo6Zc7ZpOpf6LWLeNYP086
         lfXtI4xQWZ4W18AWMMF61YlhCBcVujvk55oM3MR6haNr1/UJ2oRBG88xsGJfsqr/2Hib
         LeUvaKinIOV1MFtJB4rvg3w6fJe4lV6jWjvlr6bx7tyRAcQz+F7QNRcSCdQ9gynJ1L7Z
         JOXLlJCkTGO+6bM3JkO3UkJKA2Z3mC5rhaEztzNGihjJi+CHpVDi7Oei0zQQ8EdfFVMN
         /J4162+aSbPl8Hvs24xL/7UeBK0P+7TXOrdq/KYmKJQaYuym6PJ4u7+dXTdPsp8Pt+3k
         Mk3w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=st6PzalavgCIfa1mLbkYdK6syTJLzgLb0TShIkAxcYc=;
        b=Uv8udTXtT3DrvF4sSt0TTEaQbsBAwx0+zS1p8X/e0NyRwg4b9pRXz6GU2uCDvFYHTP
         br/4OquQUMZ2pzkMuhl+nb7pTTh+OpvL4zWtBpaRwBUGF9gghF5vqFH2MgskSxDeyOEJ
         mSSoBpSndPoTF0M+V1r6tuVHe8T2BZgQyHm6ZBOiy5Xee7nyV58o5rYdG8GmnqadNHdu
         kHA5JJFPuTwHLrOj6XI0TCdtPR7H1RxBbm9MrOLKaP7khTmkywdagaAc/Le33WNz/zfq
         GcGFG/aZpTinu6S4vl5J/d+VnQm7Mdy+3OAUMrbvlf6pzjFvOjL0/pTqyVhU+NSYJP1Q
         r/Lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eu57VacC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u7-20020a0562141c0700b00627a7a1f388si1727313qvc.472.2023.06.02.19.36.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 02 Jun 2023 19:36:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eu57VacC;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1q5H7A-0001Iw-Tn; Fri, 02 Jun 2023 22:35:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6O-0000Ql-6d
 for qemu-devel@nongnu.org; Fri, 02 Jun 2023 22:34:49 -0400
Received: from mail-pj1-x1030.google.com ([2607:f8b0:4864:20::1030])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1q5H6E-0004kc-68
 for qemu-devel@nongnu.org; Fri, 02 Jun 2023 22:34:46 -0400
Received: by mail-pj1-x1030.google.com with SMTP id
 98e67ed59e1d1-2566ed9328eso2313037a91.2
 for <qemu-devel@nongnu.org>; Fri, 02 Jun 2023 19:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685759676; x=1688351676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=st6PzalavgCIfa1mLbkYdK6syTJLzgLb0TShIkAxcYc=;
 b=eu57VacCrY1/LMwxdklfi1K3qcDmiRRgDW4YLIXYJiTLPMUFmdQk1IEV+iVMLJ6LpH
 g3oI9TwkWdClsmO37RubzYx+xcFgWwXSTx3k3MFTziJbifrvfd9UODr7iOh4mdxcI7aY
 yxYSRsgs8vfQTaULFHKAzpRmVHvJCs6Hw9XWLMpbqh1fLO2P6cfz7PgDULlQ+h+z8RPA
 UrApLgdv905ooZ+4mK9xSu0SDjkaO1MZkxFaQtdLql79IJJ0SfyFoUNDoUqeoDSWlYVi
 e2yRKYKJpHH8VYM32CtZqK2ThU4aJCRwsmfLz2x6/AMHP6em6fFmDfTVco1EUd+RJPIm
 QR4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685759676; x=1688351676;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=st6PzalavgCIfa1mLbkYdK6syTJLzgLb0TShIkAxcYc=;
 b=M6eH2jY0AOYMBXh2IZWGq6yE0C/wVJems5TR2kS3ClGocWnArsHg4V6jDunUEp6E6G
 +r0NXkRc6PrRJZI9e2V+0ncDnzrcAqknso3EgDAWI6qfjHOZopa9a/L5AF7UNkoyLiwi
 jdbHDUeS4pYYaJXuLU+fT/IFsrbcSPwCCp84nhiwivHdrPQIE/OUCdDha0T13O+06UIB
 BNiX+YRxSD71HWxLvn1SUDRrgsHn0JONiGV8u7H0jJh0nw3TGHBTWd0e9+dz5xipOmGE
 cpBSgpCJiSdtCdLTOS8ZwOrN7jbL3eeqdV5B/RRd8i/OuDzJ41PMHyMpxd9G8uFp3j3h
 0WGw==
X-Gm-Message-State: AC+VfDyUECD0dUUVpi/2zBNbeTAlsPHok+pdrlho+6UHOQge857+ByLE
 t4hNOaN8ykvhYiH//8C5pzOgfyTWNl6kjIS2x60=
X-Received: by 2002:a17:90b:b0d:b0:256:8fae:4d50 with SMTP id
 bf13-20020a17090b0b0d00b002568fae4d50mr1644839pjb.21.1685759675928; 
 Fri, 02 Jun 2023 19:34:35 -0700 (PDT)
Received: from stoup.. ([2602:ae:1598:4c01:66a6:82c2:d794:68f6])
 by smtp.gmail.com with ESMTPSA id
 e91-20020a17090a6fe400b002508d73f4e8sm3914289pjk.57.2023.06.02.19.34.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Jun 2023 19:34:35 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: ardb@kernel.org, berrange@redhat.com, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, qemu-riscv@nongnu.org, pbonzini@redhat.com
Subject: [PATCH 09/35] target/riscv: Use aesenc_SB_SR
Date: Fri,  2 Jun 2023 19:34:00 -0700
Message-Id: <20230603023426.1064431-10-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230603023426.1064431-1-richard.henderson@linaro.org>
References: <20230603023426.1064431-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1030;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1030.google.com
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dcox9Osec+N1

This implements the AES64ES instruction.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/riscv/crypto_helper.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/target/riscv/crypto_helper.c b/target/riscv/crypto_helper.c
index 2ef30281b1..82d7f3a060 100644
--- a/target/riscv/crypto_helper.c
+++ b/target/riscv/crypto_helper.c
@@ -22,6 +22,7 @@
 #include "exec/exec-all.h"
 #include "exec/helper-proto.h"
 #include "crypto/aes.h"
+#include "crypto/aes-round.h"
 #include "crypto/sm4.h"
 
 #define AES_XTIME(a) \
@@ -200,7 +201,12 @@ target_ulong HELPER(aes64esm)(target_ulong rs1, target_ulong rs2)
 
 target_ulong HELPER(aes64es)(target_ulong rs1, target_ulong rs2)
 {
-    return aes64_operation(rs1, rs2, true, false);
+    AESState t;
+
+    t.d[HOST_BIG_ENDIAN] = rs1;
+    t.d[!HOST_BIG_ENDIAN] = rs2;
+    aesenc_SB_SR(&t, &t, false);
+    return t.d[HOST_BIG_ENDIAN];
 }
 
 target_ulong HELPER(aes64ds)(target_ulong rs1, target_ulong rs2)
-- 
2.34.1

