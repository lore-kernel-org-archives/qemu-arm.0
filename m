Received: by 2002:a17:505:8d87:b0:1be9:327d:8ee3 with SMTP id ri7csp1825599njc;
        Mon, 22 Jul 2024 03:36:03 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXD8Ij3ZgOLtE8FKAZejNZ1JqzquWjmBTx3xiC2fNrzwRruFYFRYf3nlNwDj/+15Sxkm7wDSuvoW5lm3lIEy3VdzId9cbq2
X-Google-Smtp-Source: AGHT+IGCkEGapoh15EsO5hNKmvt/FGuPzay8M0diwzPZEV1mZWErPq15ALHut6oKSL3Q7B+BST4s
X-Received: by 2002:a05:6902:228d:b0:e08:899e:e926 with SMTP id 3f1490d57ef6-e08899ef67amr5308358276.15.1721644563252;
        Mon, 22 Jul 2024 03:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721644563; cv=none;
        d=google.com; s=arc-20160816;
        b=Lhyu3r9jQK0gDYu8f7nBcIhD0ks1Wq0wtqMjl+IJLRpiaCuBSH9cSn84pp3GCkqQEO
         DPXrc7lWnjBwF0j0vk3y/JAEhFRoIvi7o9mVgspzQpRGIb6S3lflz0F73hH39dQwe9S+
         4jJ8c1TdvwcyiIDkhcb+YvDV/JuHO4u5mgErhsI1+pulqf053vEMjSneLu67UoIRcwsX
         q2Q30/HalqRFVNmXLbbZOUzU4VDJtQeJyjbV2wA7PajW86U7HJ6BeDJKGipJ4WtVMRuf
         2HBrEuqcIw+ftkcg2qzuqkgB8X7t2J/CyRyEd9BZAs3s9RoOUaV3aapED6dzM97i/0+j
         jrkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:from:subject:message-id
         :mime-version:date:dkim-signature;
        bh=FaQCOP+IWpEVPIVvBuJpa+7D6aB2VEzvLHq1vpTRfXs=;
        fh=XMENupKldtkierl5LsuHGulRsRmvU3e3CB/+bVXJ0bQ=;
        b=AtqzeOdZZzJnf54lFyARVSUJzlRj7unJQ8DscHQ7qgi7Nj/P3M43FCL0cUwsl3nNNn
         fPIXBTkRy4wh+ACsuMSm9Av6MSpFoyrOJmqM0EpcbHVW0Jouw51r4rUCqWVIB/jdiVA7
         OQHOtgMKEFps2txBsf9dOXwYLyOkR9GfMNWgV1XGfL7DVZXIp98Ip+D8uNY+pPxL6LP/
         YwcuifRgolimqA/mIJgNwmVYBBkr+JUjRMYAMbmvTnObm11bzGomAQGDqUdMwYvoquoX
         TgEUphZtUYlVnuCTKt9zZcfIBfq8vAA5SI2sTp/g+j1Hi8JKO4bMy0PdC4vNNnE0Rimh
         eonw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=qvav7wZB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b7acaf01b9si71397416d6.428.2024.07.22.03.36.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Jul 2024 03:36:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20230601 header.b=qvav7wZB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sVqOU-00042F-RT; Mon, 22 Jul 2024 06:35:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from
 <3ADaeZggKCCEPJLPQ7C7DLLDIB.9LJNBJR-7OJKLKDKR.LOD@flex--smostafa.bounces.google.com>)
 id 1sVqOT-00040v-Dx
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 06:35:49 -0400
Received: from mail-ej1-x649.google.com ([2a00:1450:4864:20::649])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from
 <3ADaeZggKCCEPJLPQ7C7DLLDIB.9LJNBJR-7OJKLKDKR.LOD@flex--smostafa.bounces.google.com>)
 id 1sVqOR-0005AT-Pc
 for qemu-arm@nongnu.org; Mon, 22 Jul 2024 06:35:49 -0400
Received: by mail-ej1-x649.google.com with SMTP id
 a640c23a62f3a-a77e59a53c4so334048466b.1
 for <qemu-arm@nongnu.org>; Mon, 22 Jul 2024 03:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1721644545; x=1722249345; darn=nongnu.org;
 h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=FaQCOP+IWpEVPIVvBuJpa+7D6aB2VEzvLHq1vpTRfXs=;
 b=qvav7wZBaNGuq4YvPij8WHlQh3r5k4FsWJi4vRvWUcIo7fdhCIgjdpGldqgmD9Avjg
 SJuGOZGirxBqxxRVfP3idW73sflN6roSMLwq7c4m8PwAaFqGwvcHjTPVNurEn548UVes
 d0ZCEj82nnl8YDRrLQXr54bnkRqRXxRcNRyRr3kO1X9upOpZoxzH3Kn2zdpWAkujnCk6
 q0rIBYcLo1lmT7mVvn3fCWpjJ+FXjrvP5JtTnkaGY39uJEN9p2oHuCdh8qaF20mCdzt6
 NqcrmrACAxbdNCMcscWCys+RKh7a9uDB82a64GPOYoyHxj7xA6soHnEsWO/+cI/rDsuH
 kAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721644545; x=1722249345;
 h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FaQCOP+IWpEVPIVvBuJpa+7D6aB2VEzvLHq1vpTRfXs=;
 b=huZs10SyIeCvf9VsxdnPeGF9A8s8rSmf3A4R3bK1iTtW/NXVWeunxcBALC/j1FndZB
 2zrsZHNCN6Up3wCrmzTwBMPrne9BXiBIuO/JUPNu4unin04M5C8PB7/0g764am1JjlFy
 a2UdrQ8jQai0iE0Wwh8wxQqenB9F9PHhV/PTTXBbxmycJXOYkZgOrQjX/yhhCHj6TP6u
 6idvXOn7Kbs6Ek38zqwBzy2AsokN9nBygLPgKw5w6Lmdrit9/2+GTYRwxKWp6KfHepIs
 d0qtiPUxr7wrDW1hYS3/RmT8VSZzB5E6pErg6FyepKKlz1hGefEum8yQHgHff7VdeNT2
 vi2Q==
X-Gm-Message-State: AOJu0YyGZU0URWj/FoldCgsI57OtrVvtDt2BbLQtFGA9vQV71dodTbK9
 UYNH7y4ydJZp8rdIstlxDUqW8s3OsvRrK4GxBUbQBqvOWTWuLgcYs2F7yHwlZ+Unjn4wG6D5JP4
 dGJx6Ccuux+oIWFFbFZOmENgy7cOwQkwm3TW2ghmq76hkgp3lw5rzhIRnBKJcgPGXzmW49QjM8J
 KZFxanx1D93JzSmUXwxpWWR4VORb0oISdH1W4JOkI=
X-Received: from mostafa.c.googlers.com
 ([fda3:e722:ac3:cc00:28:9cb1:c0a8:333c])
 (user=smostafa job=sendgmr) by 2002:a17:906:5fc6:b0:a77:fadc:6815 with SMTP
 id a640c23a62f3a-a7a41c1d96emr484366b.0.1721644544900; Mon, 22 Jul 2024
 03:35:44 -0700 (PDT)
Date: Mon, 22 Jul 2024 10:35:30 +0000
Mime-Version: 1.0
X-Mailer: git-send-email 2.45.2.1089.g2a221341d9-goog
Message-ID: <20240722103531.2377348-1-smostafa@google.com>
Subject: [PATCH] hw/arm/smmuv3: Assert input to oas2bits() is valid
From: Mostafa Saleh <smostafa@google.com>
To: qemu-arm@nongnu.org, eric.auger@redhat.com, peter.maydell@linaro.org, 
 qemu-devel@nongnu.org
Cc: jean-philippe@linaro.org, Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::649;
 envelope-from=3ADaeZggKCCEPJLPQ7C7DLLDIB.9LJNBJR-7OJKLKDKR.LOD@flex--smostafa.bounces.google.com;
 helo=mail-ej1-x649.google.com
X-Spam_score_int: -95
X-Spam_score: -9.6
X-Spam_bar: ---------
X-Spam_report: (-9.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 USER_IN_DEF_DKIM_WL=-7.5 autolearn=ham autolearn_force=no
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
X-TUID: i1g6DhKidWOE

Coverity has spotted a possible problem with the OAS handling
(CID 1558464), where the error return of oas2bits() -1 is not
checked, which can cause an overflow in oas value.

oas2bits() is only called with valid inputs, harden the function
to assert that.

Reported-By: Peter Maydell <peter.maydell@linaro.org>
Link: https://lore.kernel.org/qemu-devel/CAFEAcA-H=n-3mHC+eL6YjfL1m+x+b+Fk3mkgZbN74WNxifFVow@mail.gmail.com/
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 hw/arm/smmuv3-internal.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/hw/arm/smmuv3-internal.h b/hw/arm/smmuv3-internal.h
index 0ebf2eebcf..b6b7399347 100644
--- a/hw/arm/smmuv3-internal.h
+++ b/hw/arm/smmuv3-internal.h
@@ -599,7 +599,8 @@ static inline int oas2bits(int oas_field)
     case 5:
         return 48;
     }
-    return -1;
+
+    g_assert_not_reached();
 }
 
 /* CD fields */
-- 
2.45.2.1089.g2a221341d9-goog

