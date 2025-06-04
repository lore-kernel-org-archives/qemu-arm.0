Received: by 2002:a17:504:1b46:b0:1be9:327d:8ee3 with SMTP id t6csp4099050njh;
        Wed, 4 Jun 2025 06:36:30 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWe4UnJ65ybO1METQdUGTqHrxQo87Vc/Y7pTS5iAg5NVGk+nuolnFSG4Fi6sDxuL7gJF2mrVpsNsiGHZQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHHFedwSVa1g6iTK6dpmvyvzQMPC1pWdib1mp1Tfk/DSHPcTD8XEmiwNRxwHOh+Z6sjS5Lf
X-Received: by 2002:a05:620a:4594:b0:7d2:18a1:ce0 with SMTP id af79cd13be357-7d219900beemr506506885a.49.1749044190424;
        Wed, 04 Jun 2025 06:36:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749044190; cv=none;
        d=google.com; s=arc-20240605;
        b=YJCLHFGA32wO+Y7kmcKV56SoehRVfcEM0I9ZHJXEJAv5yLX08J5QKoVCmOOwfqLSko
         sn5Bwkn3dF4MFXYy3DSeqy8GTd9pYEsUG26Um8f5y6ITshL/UEcy9bE75ojX5bEAy3dp
         PgDaqoW71G/oZr832vuVycDynhQIB8ZINUHvi0fQQDnBGzFUkT/hXHs1viBwyb1GaF4t
         +q8UxMK0f089rQXbGcTUoKssHYZNhNTdQ+a0iWh2BvhPvK7IMd4cSUy67zhPMQuQ8aFC
         RMqVqsrS0JnxacRtEZ6L1GTv9tfw884o2esWWru9aMGJqpyfKQsv6wuBvZDw+epEHAcc
         eNbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=8qwGMFtjmXrVMRcvw8SLuctMODMhy9hwt7hEr6XD6dA=;
        fh=C0Dub1YbqewaCU0k9sFoVramrVk8aBVFkwelzXGVRHg=;
        b=dURSTPku+oHTanj4zlESG/8Jb8G8OZ/bsCg8paJJF08xY2RBKxtnLLCHahUPG6TmyR
         EjstribT+dwxxea8c+YcazKi9btQFsY3xpcTUsJVdQiMgfGcBSEV+fkm144YPD40w09N
         id19hzRV/KeFzSRMa5nX6kpJTGsJEvcrsDh9jspMrLPJ+xqNH+H5Gw6pbX0P7bjejrgM
         3kgS3glTe+DSTXLstX5ROTPXZSNvjxr3tJ+GZ8KMiGBOfkIgS2pA5xFYubDCLPZOCKv/
         5pS91cicUVGwZ1tdbK7ZwFqB6rWl/xIuuk0ayFJswLTRc9375X7ewrDZL816UYPjgUgd
         kdRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7d09a1fcd92si1514365185a.421.2025.06.04.06.36.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Jun 2025 06:36:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uMoI7-0007OW-OM; Wed, 04 Jun 2025 09:36:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uMoI5-0007K4-Bj; Wed, 04 Jun 2025 09:36:25 -0400
Received: from [185.176.79.56] (helo=frasgout.his.huawei.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1uMoI3-00067j-O6; Wed, 04 Jun 2025 09:36:25 -0400
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4bC7mP5cf5z6K5wP;
 Wed,  4 Jun 2025 21:32:21 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 7D51B1400DB;
 Wed,  4 Jun 2025 21:36:17 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.203.177.99) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 4 Jun 2025 15:36:16 +0200
To: <mst@redhat.com>
CC: <anisinha@redhat.com>, <armbru@redhat.com>, <berrange@redhat.com>,
 <dapeng1.mi@linux.intel.com>, <eric.auger@redhat.com>,
 <farman@linux.ibm.com>, <gustavo.romero@linaro.org>, <imammedo@redhat.com>,
 <jiangkunkun@huawei.com>, <jonathan.cameron@huawei.com>,
 <linuxarm@huawei.com>, <mtosatti@redhat.com>, <peter.maydell@linaro.org>,
 <philmd@linaro.org>, <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>,
 <richard.henderson@linaro.org>, <shameerali.kolothum.thodi@huawei.com>,
 <shannon.zhaosl@gmail.com>, <yangyicong@hisilicon.com>,
 <zhao1.liu@intel.com>, <maobibo@loongson.cn>
Subject: [PATCH v12 3/6] bios-tables-test: prepare to change ARM ACPI virt PPTT
Date: Wed, 4 Jun 2025 14:34:36 +0100
Message-ID: <20250604133439.1592-4-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250604133439.1592-1-alireza.sanaee@huawei.com>
References: <20250604133439.1592-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.203.177.99]
X-ClientProxiedBy: lhrpeml500002.china.huawei.com (7.191.160.78) To
 frapeml500003.china.huawei.com (7.182.85.28)
X-Host-Lookup-Failed: Reverse DNS lookup failed for 185.176.79.56 (deferred)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 RDNS_NONE=0.793, SPF_HELO_NONE=0.001,
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
X-TUID: ywsfEaWuiOXe

Prepare to update `build_pptt` function to add cache description
functionalities, thus add binaries in this patch.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8b..e84d6c6955 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,4 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/PPTT",
+"tests/data/acpi/aarch64/virt/PPTT.acpihmatvirt",
+"tests/data/acpi/aarch64/virt/PPTT.topology",
-- 
2.43.0

