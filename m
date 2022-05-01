Received: by 2002:a05:6512:2248:0:0:0:0 with SMTP id i8csp474050lfu;
        Sat, 30 Apr 2022 23:18:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy6Gonaf7EafJ+omrQv4WuQIRfZZHIlsLrQO/vn4QMcYO0KGRuvN90L9OMc3r6T6jTL7Gqx
X-Received: by 2002:a05:6214:f01:b0:443:a990:4ea4 with SMTP id gw1-20020a0562140f0100b00443a9904ea4mr5435597qvb.42.1651385934098;
        Sat, 30 Apr 2022 23:18:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651385934; cv=none;
        d=google.com; s=arc-20160816;
        b=b7aeHWE1UcefZJjQPZP3rGrZteV+ixMHR91MkqVCCErkhiIzsyn0s4P5V07/EG4/ZO
         1Lo5zEU7f6UcDqMMBdEsz1NJv67fd4EWo8PrElubPRRnaPJbhMJpzHMDa5z2CXqKNyOk
         /+pxRDMBrSd1IOrcA19yav1uSRAE1AdOikT4tISehCc7vPRBLTcl4qnw89sj7VLoS7rw
         MDZR4W1hcG8MCoAItguz5Ibe34+MhiD8O1KZxRmojyNp2xL/TMJdeUgRYULYNYwnBMaX
         FGAq96XqRCBKTj4h6KkqVKTa7VQTRI1TTYL5ep2gwFve6C30bHRGjR8mtWrbpNXQUjdd
         XO/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:to:from
         :dkim-signature;
        bh=3plBYXX6SApkM+t7ZXN6wJ18Jh8soXA/Q1mctbH/v48=;
        b=ArYcgU2+OlGibRslPF+rOuC0x0UgNoRd5uVjYPCtxAAuN21VVGIZ1oT/BKd5xmCVCk
         NA4P/zRSE6zyeit+NzUf6NVJ1brUJVlO4/xg50mGSmrSiQPBX8BdgXtWGoc2VEnEk7Xo
         kMAJMcOgAzxEzE6sR+DTHiUUx+jLyP9RoXbvyw0wtxiACjRkodS/s5v+Fz7beVQKdNX5
         e4FoJRrswSos6pBFLhYA5mbbSNQvX5GU3e7BW2smsfTre5kIJo49ZO308++mh4g18z69
         6G+YrLaJgg9xzs3BIJna1ASn4yVyfFMDclbhYrv9AB/D1MLhq2PNo+8cbWIhvO9lA0Kg
         DZeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pc1fUI6F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi33-20020a05620a31a100b0069fbdbf6d99si2414071qkb.3.2022.04.30.23.18.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 30 Apr 2022 23:18:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Pc1fUI6F;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51426 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nl2uz-00087S-J5
	for alex.bennee@linaro.org; Sun, 01 May 2022 02:18:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43582)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Ts-0006tQ-7Y
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:50:58 -0400
Received: from mail-pj1-x1035.google.com ([2607:f8b0:4864:20::1035]:34441)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1nl2Tp-0001It-3c
 for qemu-arm@nongnu.org; Sun, 01 May 2022 01:50:51 -0400
Received: by mail-pj1-x1035.google.com with SMTP id
 qe3-20020a17090b4f8300b001dc24e4da73so1999221pjb.1
 for <qemu-arm@nongnu.org>; Sat, 30 Apr 2022 22:50:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3plBYXX6SApkM+t7ZXN6wJ18Jh8soXA/Q1mctbH/v48=;
 b=Pc1fUI6F2kZ7VZF6EA7yj+Gt6lolPr80CN5Smrz5vWwO5nmQGuFEKPQVwrRQ2DmV/E
 a6DOJuLL9LbuuA7z73cYZooxhJq+nHtW4cbzXXHyYTJlcmh0px/zN1w1FlOHE91eSDo+
 VcEDpgIBszlxeMhpX1r2TzkZJuVUnf98pfOYkzvquh3lQKmI/59GRh/kx+J4oInRke1e
 lVqZR0gnA1TgYPhcyT2EM9YzUsbexmB7sa3g5TJCRw542d12fO/CPPobGxY/ItPOxpGo
 iuNm/xwWSqZEE8hPZCWF2LgZYcPFeny+/6Bbj8Ud5VeanWP8y7Tgm1w/rbCQUTwnQqQS
 srOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3plBYXX6SApkM+t7ZXN6wJ18Jh8soXA/Q1mctbH/v48=;
 b=aA7SH6/TByUnKxfvlCjLwaNvFZ+bhIKuQ2W0KcxGMSVFADHGJlAwKSKMUds5MEg9Hi
 bv+RnfJRDlSLDq7PmdD1VMUEgr2+YCo0z4c6v5IZtXQZEHaJqQ8kMlMo6CES8qgXjO1G
 evcLq5+aU0ly8ViNoVl0RBUrlHBb8aV45/996rztbUut9t409qYTsUkIQFgZqy3ZeFZM
 Xuc81L6LAN8uQizs9EMwPiaev2rpZG/U5QmoKexhKza9ZN/TDYqBzrfqAAzEee0RN3Er
 BFkNo797yAVGFd2ll4fHG1POvT92zC7V2KsQ/IIoL7WjgiK5jI0PCO1UHDnee34UoweN
 bE1g==
X-Gm-Message-State: AOAM533t6b2h5oPRvK89Of4QEdV9WxfTWaFsZyVfljC5XIQCvI3pwpVh
 rxm1x4cmApPb1Nw8Ut21nMROFHOyhos3dA==
X-Received: by 2002:a17:90b:4a02:b0:1dc:4710:c1fe with SMTP id
 kk2-20020a17090b4a0200b001dc4710c1femr2252865pjb.208.1651384247795; 
 Sat, 30 Apr 2022 22:50:47 -0700 (PDT)
Received: from stoup.. ([71.212.142.129]) by smtp.gmail.com with ESMTPSA id
 cm18-20020a17090afa1200b001cd8e9ea22asm17310342pjb.52.2022.04.30.22.50.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 22:50:47 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 19/45] target/arm: Remove HOST_BIG_ENDIAN ifdef in
 add_cpreg_to_hashtable
Date: Sat, 30 Apr 2022 22:50:01 -0700
Message-Id: <20220501055028.646596-20-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220501055028.646596-1-richard.henderson@linaro.org>
References: <20220501055028.646596-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1035;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1035.google.com
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: M2XnO8RO5WDi

Since ee3eb3a7ce72, our host endian indicator is unconditionally
set, which means that we can use a normal C condition.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/helper.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/target/arm/helper.c b/target/arm/helper.c
index b690346469..4359739081 100644
--- a/target/arm/helper.c
+++ b/target/arm/helper.c
@@ -8602,12 +8602,9 @@ static void add_cpreg_to_hashtable(ARMCPU *cpu, const ARMCPRegInfo *r,
             r2->type |= ARM_CP_ALIAS;
         }
 
-        if (r->state == ARM_CP_STATE_BOTH) {
-#if HOST_BIG_ENDIAN
-            if (r2->fieldoffset) {
-                r2->fieldoffset += sizeof(uint32_t);
-            }
-#endif
+        if (HOST_BIG_ENDIAN &&
+            r->state == ARM_CP_STATE_BOTH && r2->fieldoffset) {
+            r2->fieldoffset += sizeof(uint32_t);
         }
     }
 
-- 
2.34.1

