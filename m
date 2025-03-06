Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1282982njm;
        Wed, 5 Mar 2025 22:06:28 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVkHRA8vHUyz/88qgUx7XYqodVa2TkPqAmMf3fKmcdokIyBZeKqjptcVUuCuhwxkpehSu6tB8zztBwVeA==@linaro.org
X-Google-Smtp-Source: AGHT+IEkePZ336WfqDvgT6XMVuCVjDcaDI9NBGlLJG1aLpJ/C5WVs4wKsVy0sbIsQeYeOL3kMJWZ
X-Received: by 2002:a05:620a:688e:b0:7c3:9d4c:9ee with SMTP id af79cd13be357-7c3d8e79950mr943273285a.37.1741241188045;
        Wed, 05 Mar 2025 22:06:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741241188; cv=none;
        d=google.com; s=arc-20240605;
        b=IzRct5KQpUsRaL9MBgLSZVpNDo2b2a/E/HdCwR/VhIiTmBtDFn7+3EnUF2ho8Ghtis
         CVPZXsUIczJF2MosEf+ET1zD/P+5J/u1XPbk+TuicKtFK+6FtWHnz2cYIJ43uA6tNO+t
         qE7bPaAMbjVeXJ5xR/sQK7z3dAFSSZpSTaM0xGgaschQzqGUrOoCsIOD3eDcvxL3uSNw
         JxZ9KQU1egA/9d9w/GHv1hb/p8/3126+ZvYjHax/hSjMv4o27AV1kGqseQWmHAety6jj
         PUXSzDNlgjWlrJM4IgZdNqzKG50ml1BuagBMjvSjKUIHt+oYinBxEdEhwldZV9jdSwuO
         4kOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=F3dkC3htdB6o/GV9Afe3xtTKqKDDlXfaLaXPN/CcVCQ=;
        fh=0fAOdSjQv2x0RtOeWxHNS2tjJ6G6B4ms5PFLA9mBK/Y=;
        b=Y01AUP2mL6Bi/CReGZ+SNliY+bESnQW7BS0cCAwiSZ74VvqnUJcnNTmtt4keJvOQGJ
         NuuoF+vhGbZKA5x4ox0kOO9ugdWBZCyZ6gUMcVPXRSBFTmePq58DSw/zceU1jE3WNJ2b
         JdgusgMPGFW6F/3jPP4U2TJkwMYBoe8e4eTvA5gkQ/KdN1BTh6ZBkNVzWWfVhJt4FQAg
         psgU7Mz/ttjmRydoEIsKD0toZL1OZ1uVMBvyh/E26ljwOuTCDU2BB0E9sVwZfLjCF3j9
         Kq02s6giqG/0Q0yaUGdg7sgGOyiWdMQw8ZuOjrNX3b4q1EbMp5f7DMcdvn2mGDAfuSUi
         Y4ng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e54fca29si66150385a.277.2025.03.05.22.06.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 05 Mar 2025 22:06:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tq4N2-0003Tv-0A; Thu, 06 Mar 2025 01:06:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tq4Mr-0003DX-Bo; Thu, 06 Mar 2025 01:06:01 -0500
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1tq4Mi-0001zR-T0; Thu, 06 Mar 2025 01:06:01 -0500
Received: from mail.maildlp.com (unknown [172.18.186.31])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4Z7f3J6CMxz6M4g4;
 Thu,  6 Mar 2025 14:02:52 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id 25AA51403A2;
 Thu,  6 Mar 2025 14:05:51 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.96.233.98) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 6 Mar 2025 07:05:46 +0100
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>
CC: <mst@redhat.com>, <zhao1.liu@intel.com>, <dapeng1.mi@linux.intel.com>,
 <armbru@redhat.com>, <farman@linux.ibm.com>, <peter.maydell@linaro.org>,
 <anisinha@redhat.com>, <shannon.zhaosl@gmail.com>, <imammedo@redhat.com>,
 <mtosatti@redhat.com>, <berrange@redhat.com>, <richard.henderson@linaro.org>, 
 <shameerali.kolothum.thodi@huawei.com>, <jonathan.cameron@huawei.com>,
 <jiangkunkun@huawei.com>, <yangyicong@hisilicon.com>, <linuxarm@huawei.com>
Subject: [PATCH v7 3/6] bios-tables-test: prepare to change ARM ACPI virt PPTT
Date: Thu, 6 Mar 2025 06:03:49 +0000
Message-ID: <20250306060352.907-4-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250306060352.907-1-alireza.sanaee@huawei.com>
References: <20250306060352.907-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.96.233.98]
X-ClientProxiedBy: lhrpeml500009.china.huawei.com (7.191.174.84) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: wQufBKFglddu

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
2.43.0

