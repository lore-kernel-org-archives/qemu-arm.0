Received: by 2002:a17:906:43c7:b0:78d:9f02:16a1 with SMTP id j7csp3054774ejn;
        Sun, 23 Oct 2022 22:56:44 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM6tbkVxTEL23BWSPcsQKr7bPsHzNfMNiaZtIIRmqa3SI8LONTTMqLTuXSSf4samQlZYaZpR
X-Received: by 2002:a05:620a:22cc:b0:6ee:3e43:ac40 with SMTP id o12-20020a05620a22cc00b006ee3e43ac40mr21987923qki.454.1666591004720;
        Sun, 23 Oct 2022 22:56:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1666591004; cv=none;
        d=google.com; s=arc-20160816;
        b=QI0SPJRE3fFRufRZ6Jv9lTpKIQxdRY9DO5zJhEGqvrbHLTAswYaEP7q3ipNIF9Tw3u
         sh8eL59ah58YaAZwbS4pE4CcFpe0Ryn6PX7gVfEpBMDQ/kasHSihaRC5xz/kmpNhBzy2
         hnAi8ZNpoZjln1hqhib7HfpwtYXdqawJlDmHpOxdItPj7lwDKBehqaa73GXqTeGZ426i
         PXdc+PoLeV1cmfhtlqvecZMbVuDZtZB8ecwzLCTr70G7YX/ko0BYYIwZ1CNAKCep8vi2
         iqwYLZ1O7RmINjTLQq7yyEGnbZc6Du5novi9/TLShbvK5A2Xw64qYX6rW2CKP4nGssGA
         TDLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=GPM9sD1J7LDvJDVQg9T/5F8YfP6ZpygL4aiMX7D6XJM=;
        b=Wg2WyJ0ykidnLQ4xVhAq1qY09qVjIp7mJwaj1BbASDGME0x8kmr8oOte8bW5frQp9B
         BQtaq6dagcJDriWT3UG5WcW17FOYmOjjWnDcvyziHSSmO4tVTylrkJMG6GWNT7cFzdBT
         04joIXIPf9hUaVKrny6C5Z2wD56254rq7ctfhSg4bAeoBAl+EVL0NeKiYIH6wAoIWfVA
         pTMOLo9qTOamXABGqX1BX4SzUboYvMzIt68o5rt0uJs3d/VAiPpegYYB2qB4XZyeR+yh
         voM8JB36HYCRqM4eKhLVdkY9h3et+ZQIAd/zMVQii2zl7JAVtdcgSabNvFtrbZo3Eko7
         KW4Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gc+bfP7h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19-20020ac85753000000b003a234cadc22si1520318qtx.494.2022.10.23.22.56.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 23 Oct 2022 22:56:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gc+bfP7h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1ompss-0007Vn-37; Mon, 24 Oct 2022 01:20:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1omprq-0006aq-5e
 for qemu-arm@nongnu.org; Mon, 24 Oct 2022 01:19:20 -0400
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1ompro-0002Lw-JQ
 for qemu-arm@nongnu.org; Mon, 24 Oct 2022 01:19:17 -0400
Received: by mail-pl1-x631.google.com with SMTP id p3so6634674pld.10
 for <qemu-arm@nongnu.org>; Sun, 23 Oct 2022 22:19:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=GPM9sD1J7LDvJDVQg9T/5F8YfP6ZpygL4aiMX7D6XJM=;
 b=Gc+bfP7hYkUTJ+yugL1DD4jgWGnArJcfNgDWIyBKeRJYwe7nJHPumH5qiawiX7vXQo
 IG+lACOkU8vEFz5ec/mVIRTTeWE6cugAMrokbkm3QZr0nxr/VfavawXmSZZtSmd6BOJV
 gXD8prEZxBob2u/Ad7P9XDSs8cohdlnq3KrgLS8oZdEw2LfU+odkLCeNX4rmqcT+hSA6
 eK1GJb2DftzMUaK1N0QyYynkqDwSL04CWXmH/M3VoxZqOO+YRO6EgxtK8hZZAhwYklf5
 2UnD4uFVI9XGxJim/WWvth8fM7QiX1mnb1dW9p8fXYL0SzUiFtB3HmWWZWg4akI/ydUQ
 cawQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GPM9sD1J7LDvJDVQg9T/5F8YfP6ZpygL4aiMX7D6XJM=;
 b=MPmlXm6sdoHorhadV8KL/ZOJt0wGpvdl2xbram1up7nC+A0pRnSDe/TKhrgGTi1cgA
 QVu9zu7ZbA8MPKhyuity29AINg4AiqDC4FEnsrQY2w2bFJt8zL9LECzpXMwK1ihoj001
 p5+ce2ZnPZ+FDAeUcXHNNuGGENOB3j+z1VONaFvk0A+ucw/hg/vpKqW/kvKu3QjUOM3b
 uY97kYAHgmixw9ZFhYmj3PuWNR89n7NfFjsscx5Ey8yuNMcfCp7ZbMlJ7wFwLDXDIApl
 LU96confHCeWUraO7yBLzP/b+H5mn4C9jB/Er+Y7Lo/20244IUkC8MywUsGUj3dF+VTv
 7WjA==
X-Gm-Message-State: ACrzQf2g+dj8E+UKHhsS+HgDeKvt9JXZLWRpu+iQ5PGilKwDb2WkgMcG
 TbF//epRr/ay9I6vxiR8qMcG3Q==
X-Received: by 2002:a17:90a:29e4:b0:20a:f9d5:c10e with SMTP id
 h91-20020a17090a29e400b0020af9d5c10emr73461562pjd.132.1666588754644; 
 Sun, 23 Oct 2022 22:19:14 -0700 (PDT)
Received: from stoup.. ([103.100.225.182]) by smtp.gmail.com with ESMTPSA id
 q12-20020a170902f34c00b00172951ddb12sm1895231ple.42.2022.10.23.22.19.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 22:19:13 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	Peter Maydell <peter.maydell@linaro.org>
Subject: [PATCH v6 06/14] target/arm: Add ARMFault_UnsuppAtomicUpdate
Date: Mon, 24 Oct 2022 15:18:43 +1000
Message-Id: <20221024051851.3074715-7-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221024051851.3074715-1-richard.henderson@linaro.org>
References: <20221024051851.3074715-1-richard.henderson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::631;
 envelope-from=richard.henderson@linaro.org; helo=mail-pl1-x631.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ujLDgqCD+Q2P

This fault type is to be used with FEAT_HAFDBS when
the guest enables hw updates, but places the tables
in memory where atomic updates are unsupported.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/internals.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/target/arm/internals.h b/target/arm/internals.h
index 16d7989604..a5ef5f6054 100644
--- a/target/arm/internals.h
+++ b/target/arm/internals.h
@@ -338,6 +338,7 @@ typedef enum ARMFaultType {
     ARMFault_AsyncExternal,
     ARMFault_Debug,
     ARMFault_TLBConflict,
+    ARMFault_UnsuppAtomicUpdate,
     ARMFault_Lockdown,
     ARMFault_Exclusive,
     ARMFault_ICacheMaint,
@@ -524,6 +525,9 @@ static inline uint32_t arm_fi_to_lfsc(ARMMMUFaultInfo *fi)
     case ARMFault_TLBConflict:
         fsc = 0x30;
         break;
+    case ARMFault_UnsuppAtomicUpdate:
+        fsc = 0x31;
+        break;
     case ARMFault_Lockdown:
         fsc = 0x34;
         break;
-- 
2.34.1

