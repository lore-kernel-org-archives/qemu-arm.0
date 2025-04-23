Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp2985481njd;
        Wed, 23 Apr 2025 05:07:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWx+D9e0dKiD314K03ikGIARU54VPRKFdmnt+VePY55IaFkiaq273AcEaCFjZmQRDPv7F0NXRqA9aOB6A==@linaro.org
X-Google-Smtp-Source: AGHT+IENf/FEdqINxeSiGYZhBwmEOPpM1aXBoCSADlWXIb5rFAY3v/SQHyDqlge5XIN+e3NDKYqW
X-Received: by 2002:ad4:5fcc:0:b0:6f2:d25e:8f60 with SMTP id 6a1803df08f44-6f2d25e95f8mr249583776d6.22.1745410057772;
        Wed, 23 Apr 2025 05:07:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745410057; cv=none;
        d=google.com; s=arc-20240605;
        b=gZzkfNWh5YyOPiRyzzVs5Fh2ybJiyxDma2ns5MWrAWpWs2nSyJihVuVq9e3ZXFybgl
         n5i7k8tg3aHszis/slkJry/f9SMvpSTumm23qOvaH2v/E03n433RlRi23elXk0vDs+LY
         S5wIzstHBjYMLIHlDIBBOF1vxnZcZaXKorVsiNFmBcmN382/kOQADUbBjUxPktgP0VMc
         dJ4/p+uBWpG342RGf6gBoBEjLMJHhbJE0NcrbV/bnj64Krwpffo41wJFCWxOKe+ma/GE
         N7Q3LpWrDTfEK96aDsridiaHQGPvYytfJ5gBv9ul3xIJxVyB9C6ZRIugoAhkGuzz+Ev7
         71rQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:from:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to;
        bh=la0XY0I94bDIZRS3aeaMhJ2QI5hHySO5Fb1NzbC43F0=;
        fh=iB51S8I7QmchTsaekNVL8oqE3kB8JUH5eJccl5sOqHU=;
        b=HKijI1DRySGS1aThgJSgMb2w9i4ymicR/VPAdjJm39KSRX0V2NPHSW6odTKPAc1Atf
         fZalBRKveOwczB16QU/KaP79Tsy7FiMHddYDTjaf0zw2Ka5qE4avX/MipisSb3T6tMU6
         fUZKTWadG7UnHMZEfWkDxlepwIs0RL055lELJ7MaQ89OuiAItmrbXRtGDYHJczAsXihC
         werkYnB2zx1YGGG/Eru3lWgjKat2q5HFBFx9ksNynTBv6Hr3ez23B1sK7VCoIsq2h/1p
         4Fs5wnaoTGk13mNPS9yikND3CQmfX42vbIc8G9y65iRb6K0r55h7VdV0etDxxeCJbUTj
         LbdA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-47ae9cd447fsi139929831cf.550.2025.04.23.05.07.37
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Apr 2025 05:07:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1u7Ysz-0007Y2-1w; Wed, 23 Apr 2025 08:07:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1u7YsD-0006js-Bd; Wed, 23 Apr 2025 08:06:46 -0400
Received: from frasgout.his.huawei.com ([185.176.79.56])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <alireza.sanaee@huawei.com>)
 id 1u7YsB-0000bu-O8; Wed, 23 Apr 2025 08:06:41 -0400
Received: from mail.maildlp.com (unknown [172.18.186.231])
 by frasgout.his.huawei.com (SkyGuard) with ESMTP id 4ZjHm32L4Jz6M4WY;
 Wed, 23 Apr 2025 20:02:27 +0800 (CST)
Received: from frapeml500003.china.huawei.com (unknown [7.182.85.28])
 by mail.maildlp.com (Postfix) with ESMTPS id B4F9F1404FA;
 Wed, 23 Apr 2025 20:06:36 +0800 (CST)
Received: from a2303103017.china.huawei.com (10.47.28.126) by
 frapeml500003.china.huawei.com (7.182.85.28) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Wed, 23 Apr 2025 14:06:35 +0200
To: <qemu-devel@nongnu.org>
CC: <anisinha@redhat.com>, <armbru@redhat.com>, <berrange@redhat.com>,
 <dapeng1.mi@linux.intel.com>, <eric.auger@redhat.com>,
 <farman@linux.ibm.com>, <imammedo@redhat.com>, <jiangkunkun@huawei.com>,
 <jonathan.cameron@huawei.com>, <linuxarm@huawei.com>, <mst@redhat.com>,
 <mtosatti@redhat.com>, <peter.maydell@linaro.org>, <qemu-arm@nongnu.org>,
 <richard.henderson@linaro.org>, <shameerali.kolothum.thodi@huawei.com>,
 <shannon.zhaosl@gmail.com>, <yangyicong@hisilicon.com>, <zhao1.liu@intel.com>
Subject: [PATCH v9 3/6] bios-tables-test: prepare to change ARM ACPI virt PPTT
Date: Wed, 23 Apr 2025 13:04:54 +0100
Message-ID: <20250423120457.1042-4-alireza.sanaee@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250423120457.1042-1-alireza.sanaee@huawei.com>
References: <20250423120457.1042-1-alireza.sanaee@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.47.28.126]
X-ClientProxiedBy: lhrpeml500012.china.huawei.com (7.191.174.4) To
 frapeml500003.china.huawei.com (7.182.85.28)
Received-SPF: pass client-ip=185.176.79.56;
 envelope-from=alireza.sanaee@huawei.com; helo=frasgout.his.huawei.com
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 RCVD_IN_MSPIKE_H2=0.001, RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, SPF_HELO_NONE=0.001,
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
X-TUID: nfJhL5KaSDJy

Prepare to update `build_pptt` function to add cache description
functionalities, thus add binaries in this patch.

Signed-off-by: Alireza Sanaee <alireza.sanaee@huawei.com>
---
 tests/qtest/bios-tables-test-allowed-diff.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/tests/qtest/bios-tables-test-allowed-diff.h b/tests/qtest/bios-tables-test-allowed-diff.h
index dfb8523c8bf4..ba2a8180e931 100644
--- a/tests/qtest/bios-tables-test-allowed-diff.h
+++ b/tests/qtest/bios-tables-test-allowed-diff.h
@@ -1 +1,2 @@
 /* List of comma-separated changed AML files to ignore */
+"tests/data/acpi/aarch64/virt/PPTT.topology",
-- 
2.34.1

