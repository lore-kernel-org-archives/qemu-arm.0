Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp1272710lfg;
        Mon, 25 Jul 2022 22:01:21 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1sS3grBrVJuqCS7CBJx89h13yHLd8BcYDZRAEc5vVs1cTE+1YD1CwyffSOk3QIPh2i/LTCP
X-Received: by 2002:a05:620a:40c2:b0:6b5:e45f:eb2c with SMTP id g2-20020a05620a40c200b006b5e45feb2cmr11551865qko.1.1658811681484;
        Mon, 25 Jul 2022 22:01:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658811681; cv=none;
        d=google.com; s=arc-20160816;
        b=Yy6uKq1upYmcDuR35U3UQQQ/RmNkf4oLm6VrEiY3s2KdnaqD+OiWjirTnDJ+2OpVLX
         RlZGRmH0CI0Yot9qcO19E3/4aL1RfoQxNbjd4St/l1kFBMMHk8eg8uttCNweWUBJo962
         fuToKb7fIpPq/v0qitdbJ+C77gX3PFo1ZgH8/aIjM391vRgzWGwf5WqJ9oPmbjd+WPHL
         +0QzSF30zlslWYMZVSmjjfZLbcnZwn8Ys/Bf6WZFHpITs8CmEnKUNlIoMEJc0JzTZ/+n
         hhacPM0GpvzxUNLUAgViCvb0UZCFoOg4fD9bDeb4zkHdbE/QEOQSINkdJTD9vCZaqVBt
         IzwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=Lpuu9FS+6IljQuvO2lx2PvlYEAAtS4M2JdBO3J1d0h0=;
        b=a+R5HKf6PNLP3Vr2wT/e5+1Ds8vKryr4gYidZX8/zPRqf0t+/YGknwBZJWq7DYjH/Y
         OOgpAS+ti2Tmq37pKktk60be7NKfwf4808S8ZtA8CTK6eiz10esUNp9wq7UxVSQtRkcE
         A8xLpuMxKqWJZYNJO8YHP6A/Ym8WA99ixm66BXZal63BK8nOFLe0vpiZSzq5K3Z4joZ/
         0IM/F0feYg7u14ODl0DwG39ABU6yPptXgXVWK+e7MD4j+nNheudz/MXfjY88JHSSdRHm
         w39aV+6SPePZ6Q1z9oVt8xB2zVC3eygB5ZQcqlyFT86mHOUHcIuNCIqhJekQrObTZv+I
         poCw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bMdhktFc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jr7-20020a0562142a8700b0047301ca2bd0si8981248qvb.197.2022.07.25.22.01.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Jul 2022 22:01:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=bMdhktFc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42756 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oGCh7-000855-0J
	for alex.bennee@linaro.org; Tue, 26 Jul 2022 01:01:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49374)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGCeS-0006FR-Hc
 for qemu-arm@nongnu.org; Tue, 26 Jul 2022 00:58:38 -0400
Received: from mail-pf1-x435.google.com ([2607:f8b0:4864:20::435]:39505)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1oGCeQ-0002bP-RR
 for qemu-arm@nongnu.org; Tue, 26 Jul 2022 00:58:36 -0400
Received: by mail-pf1-x435.google.com with SMTP id b133so12282119pfb.6
 for <qemu-arm@nongnu.org>; Mon, 25 Jul 2022 21:58:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Lpuu9FS+6IljQuvO2lx2PvlYEAAtS4M2JdBO3J1d0h0=;
 b=bMdhktFcD4mTOm8qxcc2SXtLVWbgFmlGpOt9S3xk2QBhzUvau42KHXYQY9XmlmbBqs
 pZfXVpVi+tabk6UqhSBBvEFgB2GtTkaauTlCgPE82ZGesCASNC5xroWo/CI9CvbIuYkZ
 z5+ipaqv6TpUYISPjY1voD8CkDsZSeEnNWCqDtJ5CPOnIrkS+0XwhwBjPukKSLq36+jf
 zr3rnxer2SbA8WShlzIXFnL5IW7nJfMfjEQwX+VQYcbvXxae1a4Cg9WpyIkMMsADj5Px
 Ywy31W9SBEWzKmNn+3P2N90mbe00LHLEXnz8OrFZuQBwCWAj8LaX/OsvbOCnn0lp8E1U
 negA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Lpuu9FS+6IljQuvO2lx2PvlYEAAtS4M2JdBO3J1d0h0=;
 b=m5lA+dGELMeB9gnHlC911SBwVtY4/T12KCBrMl2q9xyzXZzAPDpEiHCswVUhHGNJqe
 ucXgLzqGWubGnhKPAZtKuS7adE50D4UTmxV16l9ZyeR7YdZxu24feF//BpFENIdSvlNd
 pbC3mW4sY+3xQpEBNTiYg+nhHuyqn1DH6O91UtoODhmwWgs83amFpXVvHXcDibuS8gbL
 wjN1lYdwb2aDbT2uCUS0r35zsnCHGS6rLZaChxQLlG820R5RiyzpAC7mX6tLrkB2eHTR
 x2erEwg3+eJDiHpIrUIjpsmyMz0by1pfpWCtDW5+bIJr3WMIww2O3yKa+3kbT3GnzLvg
 zBBQ==
X-Gm-Message-State: AJIora+w3Yr9LTZB81dyCXAQFhdqZiyyH+3kxgI/yMsKcCFF14rbfKJ5
 PYa6O+RWPiRbkjnupR8nUi1J5A==
X-Received: by 2002:a63:1220:0:b0:411:f661:f819 with SMTP id
 h32-20020a631220000000b00411f661f819mr13945541pgl.250.1658811511713; 
 Mon, 25 Jul 2022 21:58:31 -0700 (PDT)
Received: from stoup.. ([2602:ae:1549:801:673b:b40:a955:bc1b])
 by smtp.gmail.com with ESMTPSA id
 o19-20020aa79793000000b00525343b5047sm10550460pfp.76.2022.07.25.21.58.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Jul 2022 21:58:31 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: yuzenghui@huawei.com,
	qemu-arm@nongnu.org
Subject: [PATCH v2 1/3] target/arm: Use kvm_arm_sve_supported in
 kvm_arm_get_host_cpu_features
Date: Mon, 25 Jul 2022 21:58:26 -0700
Message-Id: <20220726045828.53697-2-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220726045828.53697-1-richard.henderson@linaro.org>
References: <20220726045828.53697-1-richard.henderson@linaro.org>
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ao5EHSgH/5Dz

Indication for support for SVE will not depend on whether we
perform the query on the main kvm_state or the temp vcpu.

Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/arm/kvm64.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/arm/kvm64.c b/target/arm/kvm64.c
index d16d4ea250..bb1516b3d5 100644
--- a/target/arm/kvm64.c
+++ b/target/arm/kvm64.c
@@ -675,7 +675,7 @@ bool kvm_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
         }
     }
 
-    sve_supported = ioctl(fdarray[0], KVM_CHECK_EXTENSION, KVM_CAP_ARM_SVE) > 0;
+    sve_supported = kvm_arm_sve_supported();
 
     /* Add feature bits that can't appear until after VCPU init. */
     if (sve_supported) {
-- 
2.34.1

