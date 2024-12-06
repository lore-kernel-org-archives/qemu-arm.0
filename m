Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp1014355njb;
        Fri, 6 Dec 2024 09:23:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVDWSW04jSQFN36bwqTR5tM5M6vMLZRyufE3XuXGB04LUtUR0uGpKD28D15wan5eWoawc7yhNYIniVARQ==@linaro.org
X-Google-Smtp-Source: AGHT+IEyMQLGrl+dixgKGdizQIzflXcuOD4YUBHg9+wxmawjgCqCsh+jNWQs0PFvl9Nwy1ovr1S6
X-Received: by 2002:a05:622a:181c:b0:466:adbc:f1e2 with SMTP id d75a77b69052e-46734cbf17bmr58846021cf.18.1733505795758;
        Fri, 06 Dec 2024 09:23:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733505795; cv=none;
        d=google.com; s=arc-20240605;
        b=fZ+J0Lg6//BSUsNPSUjYrS7ccAQAxSO1FCX7WzCh4gcPOTjZThRSevXH4w5YVKG45M
         3eOW6mzDdk6LGBrxq4Cb0hHmk8R3K32qTEKZ8yzmezufd96Ffa9qj5W6ve69dLFpfL+0
         dJbAG56QbI+OZMUAu425zv2yRFSNbQQoh1sjnf6GIZmPtjKo4/1kEyitddjLSnZvFc5W
         AHyCPtkjuxYib7LefuSkosug8n0u1jt9Otjp8mI/gHadxqdv/oN9nIjXtPpcK/FAEy5j
         N/PdNdThFKBmiTdwm+neufC1aec2lDFp1MtkwrBOvrS41WCdtsT7cvZdru3PjSUr8j4D
         Dt9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=jZOBoJX+4aqmZ9kPA7j4WdtZJxt1E/3bTRqOQQA09Tw=;
        fh=iUMV9EEFXu4MlKxCNfodurzM1E/+GIYNLUanQFJhC2M=;
        b=PNg/zBK+NIAtNsKxop++X1HbX8E5TviH/QJwCYFT3kB69U5vaW81terPsfST1vDB1g
         WX/U54ttNrI3mO/3PxqwwpAc2FBMLAfhCe9W0Xn+YRq8k5MqqhVwLM5NmQktT4YfYDoZ
         31phtp2tjx5HWgF4dD+C/9UQ5S2oLkgmU7M23EQ1epSqDgb3P+Jkah51YSGYXRW6z03s
         L21B449UXj/UFjSZVrjDCIeBLFsEP41nkY1ferowfxaje4g9PZSZXgh1IRC56ZT3dCAf
         6K5QNsP0YNx9l3VqpoAn1FcQRPfZCgyDcjfRsBzHan+UIf9cZdtsYF5axOwSr9uU7tyt
         7EHw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=KMbMu3HU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-467296e7446si42337721cf.168.2024.12.06.09.23.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 09:23:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=KMbMu3HU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=kernel.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJc1m-0004aQ-Nr; Fri, 06 Dec 2024 12:22:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJc1O-00047S-DK; Fri, 06 Dec 2024 12:21:42 -0500
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJc1L-0000xY-Lw; Fri, 06 Dec 2024 12:21:42 -0500
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id CACFE5C6668;
 Fri,  6 Dec 2024 17:20:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A0CC4AF0E;
 Fri,  6 Dec 2024 17:21:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733505688;
 bh=gH9yBConPFlFAtM5yFnFIpjEGK22gESF+5Hl3wqFIsM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KMbMu3HUDRY4XARuHPlMa3Y35tEDU7FqK84deiaamMnlDr9eY4bU9Pp+QxVG1cxts
 91QoUvh3qgrHPiLUpxTBcY995K2vIm83brX7fkbzni+e2Eg7l3cJtdmW4b4171I7Im
 S8wPr0FB1YMHko+pZBRQyCfXg4ohQFOzTTWuha2OXQtV5YlmDJM+mQqQWF004acFgp
 6cMJZMuyKFXnD7RJS5XOSorifnbCKWC3GkehwUmLLWgBDbqTZPjXgX9FvPgrpokGFZ
 HsaXXl9+pYxaLT64nRiC26LWEoTMYNaPaP21RKmVFvt83RKxHyKgN/C+/ElmPNuhdH
 iiCS8Gp0g+8RA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tJc18-00000005RLG-0ui3; Fri, 06 Dec 2024 18:21:26 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: "Michael S . Tsirkin" <mst@redhat.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>,
 Shiju Jose <shiju.jose@huawei.com>,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Ani Sinha <anisinha@redhat.com>, Dongjiu Geng <gengdongjiu1@gmail.com>,
 Igor Mammedov <imammedo@redhat.com>, linux-kernel@vger.kernel.org,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Subject: [PATCH 27/31] DEBUG
Date: Fri,  6 Dec 2024 18:12:49 +0100
Message-ID: <6f427a02c2c20512d5da178b47c64d553851a60e.1733504943.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <cover.1733504943.git.mchehab+huawei@kernel.org>
References: <cover.1733504943.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2604:1380:4641:c500::1;
 envelope-from=mchehab+huawei@kernel.org; helo=dfw.source.kernel.org
X-Spam_score_int: -68
X-Spam_score: -6.9
X-Spam_bar: ------
X-Spam_report: (-6.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.996,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_MED=-2.3, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 SUBJ_ALL_CAPS=0.5 autolearn=ham autolearn_force=no
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
X-TUID: KUzP2bOJHUn8

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 hw/acpi/ghes.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/hw/acpi/ghes.c b/hw/acpi/ghes.c
index abca351b18de..1fe4c536611a 100644
--- a/hw/acpi/ghes.c
+++ b/hw/acpi/ghes.c
@@ -534,9 +534,11 @@ void ghes_record_cper_errors(const void *cper, size_t len,
     ags = &acpi_ged_state->ghes_state;
 
     if (!ags->hest_lookup) {
+        fprintf(stderr,"Using old GHES lookup\n");
         get_hw_error_offsets(le64_to_cpu(ags->hw_error_le),
                              &cper_addr, &read_ack_register_addr);
     } else {
+        fprintf(stderr,"Using new HEST lookup\n");
         get_ghes_source_offsets(source_id, le64_to_cpu(ags->hest_addr_le),
                                 &cper_addr, &read_ack_register_addr, errp);
     }
-- 
2.47.1

