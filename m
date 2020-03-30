Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2955778lfi;
        Mon, 30 Mar 2020 09:50:42 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtxMdKoMe4Zd47FOHncCbn4alDet/G2KjEhPxffT4Ux7cuFA8+OtMJJjKAWM7rSMAzw0DQx
X-Received: by 2002:a05:6214:72f:: with SMTP id c15mr12251255qvz.3.1585587042488;
        Mon, 30 Mar 2020 09:50:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585587042; cv=none;
        d=google.com; s=arc-20160816;
        b=ol1ZFyJwlbadvDxsCMx7bW8dcAj/67Vg4GOZPxoCPcRssZbNq6ozJyBVnL3w//XJll
         kxsRn0nElwUUtBPumiVbJgZRtKJeFAXMjJeArZhQ8QgDTL0kmy4YGh78qgQ/ttp7SVyy
         WK7ZSe7mPrJOAqgl0bKpayGRdYdaumUvPzKP80/SmEELyOk1VnFBq6uZu/GjprLYB/BU
         8KP2LefaMpT5MfXSe0GTW2p5aGhxEIo5HTN+Fq3pSWMSPcxH/aCeMSVWhG7MGmpuWNhA
         RdxJsmDo0xNEAZQkXLYjILS/+HKRt+ZkAbsEefQF/fCf66ZlN30NPssv755KOE5EwHdj
         IAlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:message-id:date
         :subject:to:from;
        bh=u6ZJONyfcPz8KA+Ty+Np3cQbAU1C9oJeL1X5JBbl1Ck=;
        b=AN8GweJs/CWFedZX/WG5nhIuvVSQ5DhvkgDX1CWrCaU3DWwTyFwZmwHqK9143hFrez
         MFvYgTY6FhnS1LCIsaAT/52iwf/4rcReQyTVYXO3ZUlp8d4ouA94Ci1ourXFKZp63YDW
         brd02eOYuqdWcrD/6JmTDHRWQAtkBlE/VVB9N5E6hAHiJ3NQCsVR5iIa7q7adXB17zFS
         N5PSm99s50gZ7aLzVG+nTxCG3wKaUFutLElRBt52V8o9HEcCX7T18TzljYbCmYwqcLvf
         w1Slz4fCeXcV51P7SrytegCmWq3u1QvR4Go2LGxOG+mNmjgpBAUmYY+Jqy+Spu73OiwD
         6UQg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f19si9015031qtg.113.2020.03.30.09.50.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Mar 2020 09:50:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52960 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jIxcX-0001Yl-U2
	for alex.bennee@linaro.org; Mon, 30 Mar 2020 12:50:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53513)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jIxcC-000178-Q4
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 12:50:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jIxcB-0004pV-IV
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 12:50:20 -0400
Received: from szxga04-in.huawei.com ([45.249.212.190]:3219 helo=huawei.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <shameerali.kolothum.thodi@huawei.com>)
 id 1jIxcB-0004ih-5O; Mon, 30 Mar 2020 12:50:19 -0400
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id EDE6D49C3F22F7113B3E;
 Tue, 31 Mar 2020 00:50:12 +0800 (CST)
Received: from S00345302A-PC.china.huawei.com (10.47.27.100) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Tue, 31 Mar 2020 00:50:04 +0800
From: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
To: <qemu-devel@nongnu.org>, <qemu-arm@nongnu.org>, <eric.auger@redhat.com>,
 <imammedo@redhat.com>
Subject: [PATCH for-5.0 0/3] acpi: Fixes for inconsistency in ACPI MR size
 during migration 
Date: Mon, 30 Mar 2020 17:49:06 +0100
Message-ID: <20200330164909.28324-1-shameerali.kolothum.thodi@huawei.com>
X-Mailer: git-send-email 2.12.0.windows.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.47.27.100]
X-CFilter-Loop: Reflected
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 45.249.212.190
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, xiaoguangrong.eric@gmail.com, david@redhat.com,
 mst@redhat.com, linuxarm@huawei.com, xuwei5@hisilicon.com,
 shannon.zhaosl@gmail.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: J1uz9aRW9f/F

This is to fix few issues discovered while adding NVDIMM hot-add
support to arm/virt. These were previously part of [1] and since
the fixes are generic in nature and might be an issue in x86 as
well, they are being treated separately now.

1. https://patchwork.kernel.org/cover/11432383/

Updates:
 -Added R-by and A-by tags.
 -Edited commit log for patch#2
 -Updated patch#3 as per David's comment

David Hildenbrand (1):
  exec: Fix for qemu_ram_resize() callback

Shameer Kolothum (2):
  acpi: Use macro for table-loader file name
  fw_cfg: Migrate ACPI table mr sizes separately

 exec.c                      | 16 ++++++-
 hw/arm/virt-acpi-build.c    |  2 +-
 hw/core/machine.c           |  1 +
 hw/i386/acpi-build.c        |  2 +-
 hw/nvram/fw_cfg.c           | 86 ++++++++++++++++++++++++++++++++++++-
 include/hw/acpi/aml-build.h |  1 +
 include/hw/nvram/fw_cfg.h   |  6 +++
 7 files changed, 109 insertions(+), 5 deletions(-)

-- 
2.17.1


