Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp3956608lfc;
        Thu, 14 Oct 2021 04:57:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwnql61N5CduacYwzXBQDfPUQO8M5qP5M8qiXqbrXiK53LmY6H8MlB8luNKL0xSMtU0/gEY
X-Received: by 2002:ab0:7a50:: with SMTP id a16mr5822205uat.92.1634212647770;
        Thu, 14 Oct 2021 04:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1634212647; cv=none;
        d=google.com; s=arc-20160816;
        b=Z5d3HhtrH36hYiuB4ufazjiPxEJsmPLHwi5AKydtngpHBR1P4txG1jFQvdDKh8NW5Q
         7vmguL1846gCoJRQwLsImKhRKrS1VwjKVwNM8yfkiUCwV56xOmJvISiu5x/WOgDcJsEK
         5ocMY8QojfYL+ssr7jE5bHxinIO8dT43gpfyPOYX1RpBUKcZYuojiJ9hiJk6PiRzaSjD
         PE3ItGQ3o6EnbPsrda/a9vZFQXeRCRhIRt45jXMz69AzR+POz79Vwy4dowlueQCOR56m
         sVByKFWqIP+BDfO0fJS+Mpuowj3tPZd1wl2gOfeyZBP9uojcy9K9SRIU2OCTwNq2ode9
         FFjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=C90szjEARYflrfu7w6zxg+WGmeF8RWf6RP/CIlc2kxQ=;
        b=08GslnPC+7h1GvLMMIrOt2ejTC+I3anoBiQ286VDRnpSWofQ11W4eQaEUZA1BuTY0w
         XdItKx2R0PG/higfDodOHNwdHomMQIWJKaFR7MRogw2H5IEXvPCcun7hskFiL2Lel7Di
         Ixz9Hf5xKkx7xk5NcRwBP0n3K3VP54lhr7NsCavGyhDqvVXe02UH8LjJloNeA2zsOMJI
         pysY9QfDnq79ddkNWIahF5/KqKcf9rDcHuOSNWI/1XPgoe0x5bgL0qnmtupKW8nic0hf
         L3q9LtqrBQI7Nivue4reQ+bnQQbJ23mg2atd0hYIniXI9//n7uOnZr68oYhgkOpF54Ik
         WtGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DmpwQD7u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w12si3966648vsa.281.2021.10.14.04.57.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Oct 2021 04:57:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DmpwQD7u;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mazMV-0000ec-2o
	for alex.bennee@linaro.org; Thu, 14 Oct 2021 07:57:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:40460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mazME-0000b3-VW
 for qemu-arm@nongnu.org; Thu, 14 Oct 2021 07:57:10 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:34574)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1mazMB-0005y6-3K
 for qemu-arm@nongnu.org; Thu, 14 Oct 2021 07:57:10 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1634212625;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=C90szjEARYflrfu7w6zxg+WGmeF8RWf6RP/CIlc2kxQ=;
 b=DmpwQD7uU+af5DfPeV+tihk4fJRYD1/QOQqnOqKpDRuvLmLkpR+MDNzB0A0WxDqD31EfGj
 sodWbHzF6Zg8dQayeQEImXLa2lvEWBRQ7QYWSeAxntr7cfGlzHTVQs8Z6ikdSDUL1opCnV
 256gsuba2PaVyUw0hHdl3Ymzj1e2XsM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-291-nz8irxD-OOWAsfvoF1385Q-1; Thu, 14 Oct 2021 07:57:02 -0400
X-MC-Unique: nz8irxD-OOWAsfvoF1385Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5C00C9126B;
 Thu, 14 Oct 2021 11:57:00 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.39.193.154])
 by smtp.corp.redhat.com (Postfix) with ESMTP id C63D319D9F;
 Thu, 14 Oct 2021 11:56:45 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, imammedo@redhat.com,
 mst@redhat.com, philmd@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, shameerali.kolothum.thodi@huawei.com,
 ardb@kernel.org, jean-philippe@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, drjones@redhat.com
Subject: [PATCH v3 0/3] hw/arm/virt_acpi_build: Upgrate the IORT table up to
 revision E.b
Date: Thu, 14 Oct 2021 13:56:40 +0200
Message-Id: <20211014115643.756977-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eric.auger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Received-SPF: pass client-ip=216.205.24.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: gshan@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: O221rFGmZNbu

This series upgrades the ACPI IORT table up to the E.b
specification revision. One of the goal of this upgrade
is to allow the addition of RMR nodes along with the SMMUv3.

The latest IORT specification (ARM DEN 0049E.b) can be found at
IO Remapping Table - Platform Design Document
https://developer.arm.com/documentation/den0049/latest/

This series can be found at
https://github.com/eauger/qemu.git
branch: iort_Eb_v3

History:
v2 -> v3:
- comment on IORT node ID (Igor)
- single mapping disabled comment
- Added Jean and Igor's R-b
- added diff to patvch 3/3

v1 -> v2:
- fix Revision value in ITS and SMMUv3 nodes (Phil)
- Increment an identifier (Phil)

Eric Auger (3):
  tests/acpi: Get prepared for IORT E.b revision upgrade
  hw/arm/virt-acpi-build: IORT upgrade up to revision E.b
  tests/acpi: Generate reference blob for IORT rev E.b

 hw/arm/virt-acpi-build.c          |  48 ++++++++++++++++++------------
 tests/data/acpi/virt/IORT         | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.memhp   | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.numamem | Bin 124 -> 128 bytes
 tests/data/acpi/virt/IORT.pxb     | Bin 124 -> 128 bytes
 5 files changed, 29 insertions(+), 19 deletions(-)

-- 
2.26.3

