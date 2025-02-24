Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp2005173njc;
        Mon, 24 Feb 2025 08:58:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVRs6m/4giS3QnlXA8BvRVi7Kq5YfeNIH0R3eJoF/CVZSkHLUMlQb+9Mbk65R32oblHAd585oQjJPqhKA==@linaro.org
X-Google-Smtp-Source: AGHT+IEPUFN/Onknmg8zstBJT4CgzD+TcSbH5P6UfA7ju7lbmcvO2HB7fbK2K3j+IgKsuo0P+x2x
X-Received: by 2002:a05:622a:178a:b0:472:5f8:4a59 with SMTP id d75a77b69052e-472248d8e8emr149825101cf.40.1740416283697;
        Mon, 24 Feb 2025 08:58:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740416283; cv=none;
        d=google.com; s=arc-20240605;
        b=DwMOoTFa2wxjScIJO/nab/XaWEjf2UOchtwCejzxOQnX+eGgaj/43u5aXl7NrYNGFt
         z3GVdgwR5RqnTqjlcjDbdARh76WddaflA9LQY3LPYjVRHaXlg1tgheduW6GZlmyP4hWV
         u3Xjrjk2QNCBUlJqGCTYqVZfvCg5zRQfieZEvSqZdnA4MW+F4xLPm1qJUhjAIIK28w3R
         MXur5zVS+cfBGpgvnzgfHL0TNPcygozrWo3JnV0xxxfmT4TDaGL/MEncEajMlJrTmDmm
         6h+4VfPANVuOOe48OJcOTIlcb/ZIwEu1CV/8d66GvA8VdiAFfsRtF1uhd1uM9y85UgwJ
         LqaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=3dWlk7xDgb1CUcA/8KFyJ9yfBRx9gna7Q3yZXDSfHSo=;
        fh=1MQqO2tnmjk4TcG7an9MyGuL7RPdXG60IQugdKPLR5s=;
        b=XSZ7MEIuXVXHQCcpj2vyE9OtmF8Q+SoUHrrpTHLUHvM9EXLT/O9aSudbrGmBI0i5+2
         cq8KY6Ga+mODkdZ6grj8U0HIeUJHOYT3Te3rU3awai65rwLgMtjIfSGESUbqy3KoSBl8
         rP/3YdjdCWoYonB4RQ8RdfJyviu7HMgrWgTgII8KIBir9Pj8LT3rJBT36njqtwoXHENN
         WZSP1wzuk/4B3z5Wbmt1x2dhvocJOaitPzIAGiaWx6Jn8X+NZQRYlWeyx+8Q9bMkibHQ
         ngE0oTnDe0nebR9KNn/LjJe+jDP9nQpumVjWmJ1gipsYbosVSmmAsNkB7YKEoDdSQ0xN
         FFjA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=getutm.app
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-471ea93df7esi152645051cf.106.2025.02.24.08.58.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 24 Feb 2025 08:58:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=getutm.app
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmbmK-0007Tt-T6; Mon, 24 Feb 2025 11:58:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1tmbmI-0007TO-Tr; Mon, 24 Feb 2025 11:57:59 -0500
Received: from mail-pl1-f170.google.com ([209.85.214.170])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <osy86dev@gmail.com>)
 id 1tmbmH-0002pA-Dn; Mon, 24 Feb 2025 11:57:58 -0500
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-221057b6ac4so89076025ad.2; 
 Mon, 24 Feb 2025 08:57:56 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740416275; x=1741021075;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3dWlk7xDgb1CUcA/8KFyJ9yfBRx9gna7Q3yZXDSfHSo=;
 b=kyq9evOtOwIbCrJS3A3sQnJZINc/YanY4WuXcmA2YTkAofFMGOShl547XwmkTvqsG1
 iWLjYFF+kgXhPApAFI6q9R78rDlSMywDAU3xz0psPYzu7jXeXMPZvYSbznJ8SjACUc5W
 zgaZ3jcNyDSNwyTuPGtf/PL/1yhcpfsU33oIHcSqtRCMYew25T61r1NjdSUJbn7ukasT
 ptzwx9BaNjlo27m7pTxziNeRKf4Sk0xNff5AW2Cc8+XlX/gCaDaVfsi93gGKTDS3TKWK
 Gl4j9B+uoynQCmcX4bx/oF+2v/X9uDO8KpgCxJJfN0UbB3XReCsxRtd4r4JU28qMKYEt
 KFYQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXXgiALWhAZdjCfIbyyCaiete1wJNOc8phZDeNbLCEFWqkvMejLqM8uYfu2Ht1ImUp/6/gil6j4Uw==@nongnu.org
X-Gm-Message-State: AOJu0YxhRnkeg03uA1SDoFIMo75Rtd5ywOpgzCy9G+V0empGApcMr321
 7nj49R/nAPr52OZ33mnhQ5bNap0y6bqU83MjptdYh28BhZsoo77ZAVD6ZQ==
X-Gm-Gg: ASbGnctvbb/j+HMJPLsc4N786VREUK/gecEPQRHa4uuD0aJAI7lepakFD5CsKKupCKB
 Fl1yE94O0NQ6pAUvkahljmRu1Pez/1MIa5WLgYvsTGvR5U2r7JaJyTPTOLy9Isvd0sETdZhLbC2
 i3i1BBkY27DWWAEKhq6ViUK5mUmVcT4vBsFSiDpkonEWm4ECvpW8w+9y3MHEREzYU4LOlIce7Xi
 AZteAuAQAROllTbp6a+r92/fyjzKt7zgEntaYHloMkSvTK/ztYEJtTVEtSidDHFvvirqtuCxtEi
 g5bXdJWCzthCB3ui0gyAfTJgWWk6OOAwhunVK6hC/c90uPUnTTQqSMrBaw==
X-Received: by 2002:a05:6a20:8407:b0:1ee:e785:a082 with SMTP id
 adf61e73a8af0-1eef52c926bmr25147289637.1.1740416274861; 
 Mon, 24 Feb 2025 08:57:54 -0800 (PST)
Received: from localhost.localdomain
 ([2607:fb90:370f:48e2:5d68:7347:53fe:9673])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-ae07fec1f8esm12845795a12.28.2025.02.24.08.57.53
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 24 Feb 2025 08:57:54 -0800 (PST)
From: Joelle van Dyne <j@getutm.app>
To: qemu-devel@nongnu.org
Cc: Joelle van Dyne <j@getutm.app>, Alexander Graf <agraf@csgraf.de>,
 Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org (open list:ARM TCG CPUs)
Subject: [PATCH] hvf: arm: disable SME feature
Date: Mon, 24 Feb 2025 08:57:34 -0800
Message-ID: <20250224165735.36792-1-j@getutm.app>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=209.85.214.170; envelope-from=osy86dev@gmail.com;
 helo=mail-pl1-f170.google.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 FREEMAIL_FORGED_FROMDOMAIN=0.001, FREEMAIL_FROM=0.001,
 HEADER_FROM_DIFFERENT_DOMAINS=0.001, RCVD_IN_DNSWL_NONE=-0.0001,
 RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: bz71oZouGsKx

macOS 15.2's Hypervisor.framework exposes SME feature on M4 Macs.
However, HVF does not properly support it yet causing QEMU to
fail to start when HVF accelerator is used on these systems.

Signed-off-by: Joelle van Dyne <j@getutm.app>
---
 target/arm/hvf/hvf.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
index 0afd96018e..261db2d227 100644
--- a/target/arm/hvf/hvf.c
+++ b/target/arm/hvf/hvf.c
@@ -899,6 +899,11 @@ static bool hvf_arm_get_host_cpu_features(ARMHostCPUFeatures *ahcf)
 
     clamp_id_aa64mmfr0_parange_to_ipa_size(&host_isar.id_aa64mmfr0);
 
+    /*
+     * Disable SME which is not properly handled by QEMU yet
+     */
+    host_isar.id_aa64pfr1 &= ~R_ID_AA64PFR1_SME_MASK;
+
     ahcf->isar = host_isar;
 
     /*
-- 
2.41.0

