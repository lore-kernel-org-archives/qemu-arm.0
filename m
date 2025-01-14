Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp2594515njn;
        Tue, 14 Jan 2025 10:08:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUqEAXpdjaiLjiWmu3t+PPKLkXow0vz8lyr7IKykxiasvPrtD6eKWQro88Q5l78t8dsTPGUjHzoCllrmg==@linaro.org
X-Google-Smtp-Source: AGHT+IFyD84qq8xif5FjLxcojMWAzCBT8ARZnSJ+Dt7IEjoG5dXHZUhsa0Ly/voTFrVD4f23TF7R
X-Received: by 2002:a05:6102:c09:b0:4b2:77df:4664 with SMTP id ada2fe7eead31-4b3d0f61168mr23394161137.1.1736878085795;
        Tue, 14 Jan 2025 10:08:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736878085; cv=none;
        d=google.com; s=arc-20240605;
        b=Bylu/NsWq4l1qgb85FsiH5NZQIoNf/wQYQ5hmJlI3S9sYVUPZafEW+SytA52/sIlbX
         I74yogksiXGorBJ8BymZ7G2r75mw6rUxpQVmUB6fFv+Shber1AmK06uitbWc8K1eF2ia
         3STx5Rqf1Wng5fsyvOJpQ5SRYIe9Z1yN575So9i617u2IG7mPCFT4OiR3K60h79QlN4V
         GMwCCEnksQSbNTnClG8v6LcUiS54FKTJPylbSXltEMj++FKRUvT0l/6MNJIHnj2rKEYS
         FXHuw1MRz7D5L9o3d0dZSdP26/VGEIki6Ufe5w9sMxvxEGlmVmMykc4iouJAfr9EjhYY
         kB5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=T7Eankj5oqHZZifInGArnkMVTz5eVNOe7xiVANfYbVI=;
        fh=Wf0GlacBGpCQs5iWSoQ3UH/vHFiXBQskvCF6xl6SVII=;
        b=NUVwvd7LYeaCFgzFDpdJ7un7jYFdMY4uqKTpjUsHRDt0D0HCXAOYR+sqgC/pyM8mqY
         ulyiHb277aXRP6YcV5aG6FbRUN4FA3llrOQ7fiYGmh/FVN+r72iEKEaKp07vfQ48PKJa
         JtVaaOasgc5+mvyj9KJukNKdlrznCqXV91MjVf14LhCY2TE5fKk8Ua8bKLFDqiGvFd99
         VlRHq3x2uoL+QvsUzTRBk1/v4Oq7B2tEJ021ZZukfv7DnGLHulrxqSKaVmD/teheQoFu
         uTpJGJsqrsX8jIdAioNezMqGB3V9T+XPIu1Lnqkq3DhxDPtQTZN0MTnt0VoZD8s6GdDI
         3ZQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b6092fb0c6si3726720137.372.2025.01.14.10.08.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2025 10:08:05 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tXlKX-0003nq-4A; Tue, 14 Jan 2025 13:07:58 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tXlKU-0003iB-JX; Tue, 14 Jan 2025 13:07:54 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tXlKR-0001YE-Cj; Tue, 14 Jan 2025 13:07:54 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YXcWf09xlz6L599;
 Wed, 15 Jan 2025 02:06:22 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id A6D4E14022E;
 Wed, 15 Jan 2025 02:07:49 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.72.65) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 14 Jan 2025 19:07:48 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <zhao1.liu@intel.com>, <dapeng1.mi@linux.intel.com>, <armbru@redhat.com>, 
 <farman@linux.ibm.com>, <peter.maydell@linaro.org>, <mst@redhat.com>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <linuxarm@huawei.com>, <shameerali.kolothum.thodi@huawei.com>,
 <Jonathan.Cameron@Huawei.com>, <jiangkunkun@huawei.com>,
 <yangyicong@hisilicon.com>, <sarsanaee@gmail.com>
Subject: [PATCH v6 3/6] bios-tables-test: prepare to change ARM ACPI virt PPTT
Date: Tue, 14 Jan 2025 18:06:08 +0000
Message-ID: <20250114180611.353-4-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250114180611.353-1-alireza.sanaee@huawei.com>
References: <20250114180611.353-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.72.65]
X-ClientProxiedBy: lhrpeml500010.china.huawei.com (7.191.174.240) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -59
X-Spam_score: -6.0
X-Spam_bar: ------
X-Spam_report: (-6.0 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=-1.794, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
Reply-to:  Alireza Sanaee <alireza.sanaee@huawei.com>
From:  Alireza Sanaee via <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: em02gcI96Yuw

Prepare to update `build_pptt` function to add cache description
functionalities, thus add binaries in this patch.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..ba2a8180e9 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/PPTT.topology",
-- 
2.34.1

