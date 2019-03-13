Received: by 2002:adf:fd4f:0:0:0:0:0 with SMTP id h15csp1221827wrs;
        Tue, 12 Mar 2019 21:44:25 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx0aCEktsGq2K+wXQ4zIEZUT91nFFMNZt70PqhN/Pdm9dF9i+JuqcRR7bvPC7hH/ta8v/Ce
X-Received: by 2002:a81:594:: with SMTP id 142mr33675658ywf.294.1552452265545;
        Tue, 12 Mar 2019 21:44:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1552452265; cv=none;
        d=google.com; s=arc-20160816;
        b=uuZeZ/FsS2d4dz5DvgQGEt0Py3iGAlYzjY0p6zFwbK5ahab0wLqaGFKsa2k2Niciud
         Jz/uChWTH0DNoJnAwurO6vCgcKRkL+7Mh4TIPuJo5AfKWigsfgj5VSIc7rx1VueTJY9y
         p6ds/Uk5ZRw71nfZQVJYj+jaD/nvEpIZjinSn9jIZYrPiITqHFIFKpurQyCuEBuRdOKH
         KG1eZJkuGutHowpdiezgP3SY/zXoUK/+WaBYYBDrA2M8Ucg/H+J03nSwDLTuKLvPY7u1
         L3z2MTMWZCOjtxInTp90eeszjiYKiB1XiSLge7wgQ+2CprsBtmMkOlC8dcArBWhzolRX
         bfOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=CjGOyP2MVzIcnZA+/FVyMKvzdKPMUDoNWr6kVuAjOIk=;
        b=ol947wU+LtvJdoxSd3fSI7FaRjsxz9Udfk3RsAdyl1cvTDlroqr2+/cQ2QJ/dp4DBe
         /fBAFnPGvTpI+i4hUtPheWl2JYS7eXhdcynX6sxq9+ADOrS/dNmYQmKpUrxkRcfxgNec
         4CacQdTyq0+5qKEvxKonfu+zZ0y6PBrqNOJnzIJicAmbWTqpwpRSJg76SRJmbrN3f6Xj
         W9irjxGDNKIuVVN+9JG1tf/f8s7/+m3xE2tV1s/GiBTdbpscDNWrIPeTloCdFyLBeG84
         muJnZEOp6TOrxe1LSQXb82JVuu6UqVG30kGSnomkKCulaOWqHPOzR9EsiCLh0VfQdcs1
         M3Tw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k77si6159503ybk.468.2019.03.12.21.44.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Mar 2019 21:44:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:38197 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1h3vke-0003M3-Uh
	for alex.bennee@linaro.org; Wed, 13 Mar 2019 00:44:25 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40006)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h3vkB-0003JQ-5a
	for qemu-devel@nongnu.org; Wed, 13 Mar 2019 00:43:56 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1h3vk9-0003Wz-NK
	for qemu-devel@nongnu.org; Wed, 13 Mar 2019 00:43:55 -0400
Received: from mga04.intel.com ([192.55.52.120]:46971)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1h3vk9-0003VR-B4; Wed, 13 Mar 2019 00:43:53 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	12 Mar 2019 21:43:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.58,473,1544515200"; d="scan'208";a="133859725"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga007.fm.intel.com with ESMTP; 12 Mar 2019 21:43:49 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 13 Mar 2019 12:42:50 +0800
Message-Id: <20190313044253.31988-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.120
Subject: [Qemu-devel] [RFC PATCH 0/3] Extract build_mcfg
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, mst@redhat.com, shannon.zhaosl@gmail.com,
	Wei Yang <richardw.yang@linux.intel.com>, imammedo@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WdY0kyfQAyi0

This patch set tries to generalize MCFG table build process.

[1]: use acpi_get_mcfg() to get necessary information to build MCFG
[2]: remove an unnecessary variable mcfg_start
[3]: Extract build_mcfg to aml-build.c

Wei Yang (3):
  hw/arm/virt-acpi-build: use acpi_get_mcfg() to calculate bus number
  hw/arm/virt-acpi-build: remove unnecessary variable mcfg_start
  hw/acpi: Extract build_mcfg

 hw/acpi/aml-build.c         | 30 ++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    | 27 ++++++++++-----------------
 hw/i386/acpi-build.c        | 36 +-----------------------------------
 include/hw/acpi/aml-build.h |  6 ++++++
 4 files changed, 47 insertions(+), 52 deletions(-)

-- 
2.19.1

