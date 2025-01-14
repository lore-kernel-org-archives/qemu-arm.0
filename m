Received: by 2002:a17:504:998a:b0:1be9:327d:8ee3 with SMTP id i10csp2581739njn;
        Tue, 14 Jan 2025 09:48:43 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW8svqdQhVwKj4ljL9E7EvJQ8cIFUOTQAcBtvDPGru3U0YuVJeML28xfF2ZUQlUBZKS+yiV+iBN8lGeXQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFeyY1j/pibeMlU6xjiS5ko7SOfMWQT7leELyC3uikN9Uw9S+c9mKMa4XEp/l71/sPsqGBH
X-Received: by 2002:a05:620a:24c8:b0:7b6:e20d:2b4f with SMTP id af79cd13be357-7bcd97c4f88mr4501505585a.49.1736876923606;
        Tue, 14 Jan 2025 09:48:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1736876923; cv=none;
        d=google.com; s=arc-20240605;
        b=BrWn1MAD6wgg5JLyGmG5oOFDV8CLnCAcLh5nyfLDJ+K/Q4B+V/ZbYxIOh0UVTPhGHL
         2PKl1eayW9mh77ZBUhKmT8J2axdDxe22pU98c5deT7bcARr9va+FrNsu5Ou2iIHCi8vE
         ihCQKqQiBYfYZG4HaoJjX8PeMmKuX514ScToSECu6KRZdUSmFCn5lMYmZRlY0ASm5/mN
         GyluNnNlh0uyFtWgE2LDFXracD0nHxRlR5FJg0G2axydlB/ls/ONnMHh87jFvIsRL2dT
         hFEGjIYEoPpO3b7NGlHucDgz4XgATTdeufn6No+1Ej08AONHqCL+V2/a7qgj8p6dSPmp
         GWNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=T7Eankj5oqHZZifInGArnkMVTz5eVNOe7xiVANfYbVI=;
        fh=u35wjCyBUalnTisuY87AvAhLybom2PQyiZZ8ckjJPsw=;
        b=ADob2B5o3i5KIC38HTyM86IhWLt/8b4oI0JYiud9quynLpau2dUJWPld2Y16BGVsrM
         3Jq39PlRgPRo6k1E7TdoGRUHtFb2OYDrchayJ29E02JUmDyNBL+oJpkPIhBJAQU6cslh
         Sa5wVHDlAiDR3lUuFEtEl9dn6DKaaIlvFXJTCPLVh95itU0IqY4ZnZze80dKo8iG3JXr
         JkmAJfy4MRIevZh8DIFXIom+G3SNDLJWQZxHYKC03lgbOGGdqg+apvb8wq+rIxLkR9zU
         dxqmFkk0waUQpyaNZirjyYept7iEftxm5GnJt3YbXpM5ewj0mUt6oJIhHbE04CqxFgF3
         iUIg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46c8735055asi129332591cf.191.2025.01.14.09.48.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Jan 2025 09:48:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tXl1f-0003S9-3n; Tue, 14 Jan 2025 12:48:27 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tXl1Z-0003FZ-Ah; Tue, 14 Jan 2025 12:48:22 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tXl1Y-0005GY-0h; Tue, 14 Jan 2025 12:48:21 -0500
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4YXc190njGz6K5X3;
 Wed, 15 Jan 2025 01:43:25 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 080CE140680;
 Wed, 15 Jan 2025 01:48:18 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.72.65) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Tue, 14 Jan 2025 18:48:17 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <zhao1.liu@intel.com>, <zhenyu.z.wang@intel.com>,
 <dapeng1.mi@linux.intel.com>, <armbru@redhat.com>, <farman@linux.ibm.com>,
 <peter.maydell@linaro.org>, <mst@redhat.com>, <anisinha@redhat.com>,
 <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>, <mtosatti@redhat.com>,
 <berrange@redhat.com>, <richard.henderson@linaro.org>, <linuxarm@huawei.com>, 
 <shameerali.kolothum.thodi@huawei.com>, <Jonathan.Cameron@Huawei.com>,
 <jiangkunkun@huawei.com>, <yangyicong@hisilicon.com>, <sarsanaee@gmail.com>
Subject: [PATCH v6 4/7] bios-tables-test: prepare to change ARM ACPI virt PPTT
Date: Tue, 14 Jan 2025 17:45:58 +0000
Message-ID: <20250114174601.23-5-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250114174601.23-1-alireza.sanaee@huawei.com>
References: <20250114174601.23-1-alireza.sanaee@huawei.com>
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
Reply-to:  Alireza Sanaee <alireza.sanaee@huawei.com>
From:  Alireza Sanaee via <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: z8IWrB/4MXpO

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

