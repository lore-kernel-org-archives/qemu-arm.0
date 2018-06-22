Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp653373wrq;
        Fri, 22 Jun 2018 03:19:35 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIpPsW/j4inaUnBO38YDYbtUlVH1MyXlpfcKE1931OLLWdEUTlZY420zX05v+dHxyFsqJoY
X-Received: by 2002:a37:8044:: with SMTP id b65-v6mr719617qkd.55.1529662775831;
        Fri, 22 Jun 2018 03:19:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1529662775; cv=none;
        d=google.com; s=arc-20160816;
        b=h9yuYzkx5j6WIE5kUrRkOyh5KTfnFm3ybl9IjWlAhD0HGv0RhD+IP4Wppt+LUGolkd
         vDDSC4C4h6WL1Snk61HGDztYhxCqJ5f77S7A5zwuFXB9Gem8McOEEpXkypI0rqLYInQC
         xiL7sdGtzSVqZ1l6mxt/6yQao8n9OaNiacFESbH43Dlz7iGj785X3LzSC4ouvr6RceVD
         Jr6jmt9o6rRKHrpebJvgklua8UNOIVfd7VTGOFFSbNYtboetQe8UxH01U8/+vcc4kFUe
         3taN9yCM+L+MtbZ85fWOkBvc1v1VW6U2eCTDYOWY/B5chpxllYZLQ6ppCBlwb3S3e18x
         A4qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=DsPamK3vBeordZcCUIAIIqvtXX6Tyiuv8ZXyHaUYqW4=;
        b=rsiinda5+UIPj+Kj5FgIphmKNSTMzLBh1Mi8K/Ol/myKaaoQyM+PbTBKqfuLKdxcTK
         fdPEGYpg7UKVOcBiwK2ZIk55mf1rCfOjnuqMlyLc5Dbb44bSqQ3eeqY41EKelDH7gNn3
         EcHXTXEBxgviJAKEo6FxiDWXwmXqWkkQzU1PLQLH9qSMhsbefZvmmANmVJ5IPaaOEpUu
         Z6FBR7pko5ludJLCZYr6PLmgrSNqckLUBD9siNf7siWpk/Id4Qc5OuvC3igzmIvu7iAE
         73O6yINEUE8dz8dUsj/zYHD0jGSBCd2oy/qlSK65tIB3vqBVSEqDXKU7Sq0ZWD4JaUs2
         jbcA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u11-v6si6636946qke.328.2018.06.22.03.19.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 22 Jun 2018 03:19:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60570 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fWJAF-0000JT-6H
	for alex.bennee@linaro.org; Fri, 22 Jun 2018 06:19:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41371)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWJA0-0000J7-Tk
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 06:19:22 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <eric.auger@redhat.com>) id 1fWJ9x-0005Xc-NP
	for qemu-arm@nongnu.org; Fri, 22 Jun 2018 06:19:20 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:45524 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <eric.auger@redhat.com>)
	id 1fWJ9x-0005XO-FE; Fri, 22 Jun 2018 06:19:17 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com
	[10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0969840711A9;
	Fri, 22 Jun 2018 10:19:16 +0000 (UTC)
Received: from localhost.localdomain.com (ovpn-117-106.ams2.redhat.com
	[10.36.117.106])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 91DEB11166E1;
	Fri, 22 Jun 2018 10:19:12 +0000 (UTC)
From: Eric Auger <eric.auger@redhat.com>
To: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, peter.maydell@linaro.org,
	shameerali.kolothum.thodi@huawei.com, kwangwoo.lee@sk.com,
	imammedo@redhat.com
Date: Fri, 22 Jun 2018 12:19:04 +0200
Message-Id: <1529662749-32069-1-git-send-email-eric.auger@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.7]);
	Fri, 22 Jun 2018 10:19:16 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]);
	Fri, 22 Jun 2018 10:19:16 +0000 (UTC) for IP:'10.11.54.3'
	DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'eric.auger@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [RFC 0/5] ARM virt: Support PC-DIMM at 2TB
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rE3dNwlh0sW3

This series aims at supporting PC-DIMM in machvirt. The device_memory
is set at 2TB. While its max capacity is currently limited to 2TB,
the actual size depends on the initial guest RAM size and maxmem
parameter. Using memory beyond 2TB is possible if KVM, the FW and the
guest supports up to 42 bit IPA/GPA.

Actual hot-plug and hot-unplug of PC-DIMM is not suported due to lack
of support of those features in baremetal.

This series reuses/rebases patches initially submitted by Shameer in [1]
and Kwangwoo in [2].

[1] [RFC v2 0/6] hw/arm: Add support for non-contiguous iova regions
http://patchwork.ozlabs.org/cover/914694/

[2] [RFC PATCH 0/3] add nvdimm support on AArch64 virt platform
https://lists.gnu.org/archive/html/qemu-devel/2016-07/msg04599.html

It has the following dependencies:

[3] [RFC 0/6] KVM/ARM: Dynamic and larger GPA size
https://lists.gnu.org/archive/html/qemu-devel/2018-06/msg05759.htm
which itself depends on the kernel series [4]

[4] [PATCH v2 00/17] kvm: arm64: Dynamic & 52bit IPA support
https://lkml.org/lkml/2018/3/27/437
For testing, use my kernel branch:
https://github.com/eauger/linux/tree/4.16.0-rc3-Suzuki-52b-IPA-v2

Best Regards

Eric

This QEMU series can be found at:
https://github.com/eauger/qemu/tree/v2.12.0-pcdimm-2tb-rfc

Tests:
- On Cavium Gigabyte, a 48b VM was created and PC-DIMM slots were successfully
  added and recognized by the guest. EDK2 has a fixed limit at 40b PA so this
  was tested without FW. NUMA config has not been tested yet.

Eric Auger (1):
  hw/arm/virt: Allocate device_memory

Shameer Kolothum (4):
  hw/arm/virt: Add pc-dimm mem hotplug framework
  hw/arm/boot: introduce fdt_add_memory_node helper
  hw/arm/boot: Expose the PC-DIMM nodes in the DT
  hw/arm/virt-acpi-build: Add PC-DIMM in SRAT

 default-configs/arm-softmmu.mak |   2 +
 hw/arm/boot.c                   | 110 ++++++++++++++++++++--------
 hw/arm/virt-acpi-build.c        |  34 +++++++++
 hw/arm/virt.c                   | 158 ++++++++++++++++++++++++++++++++--------
 include/hw/arm/arm.h            |   2 +
 include/hw/arm/virt.h           |   1 +
 6 files changed, 247 insertions(+), 60 deletions(-)

-- 
2.5.5

