Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp921067wrg;
        Mon, 20 May 2019 20:33:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxRu1J5lkclOm/XqHRyM3B7QBkPBbz4KVLXg5t+2sXjxGJXh0vXhMmUPWoSFdHadrq+SIEp
X-Received: by 2002:a17:906:670c:: with SMTP id a12mr5788764ejp.290.1558409636846;
        Mon, 20 May 2019 20:33:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558409636; cv=none;
        d=google.com; s=arc-20160816;
        b=jAmKGCLVcgOPkKhMuz45xJwBrmCnCVYmwXWAbVck4hFbDPWMCon3L3VfjdPVfvKZTt
         IVh/16I1FXkmEBfdbNtDvXSWxrICh2KWouqmrW5uEnNlWJ1h+i3nP0Y4Ns3lMKTKm0SF
         4VxBb64DOqYF6NMAxeryppSMW+aThGEJT7phORds6w1gkb/jWp/5o7eBLMgWK5krc2g7
         8NcMnYVAQYJ/Jq1Xl/d7u6/8nuHUs+DO8TwHMJNwwE0FTtW5TnHcZKEbullXspvUEG6J
         xrP29N4QdeAA4qY4xgvwtyo38wzFXkVtvTtqeimajq3hAGRZhMJctXIQ7dv4R5M8J4Jb
         DA2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=I9/PZr3sToap3g1rgHYIWYEFC7Hy67y/rymdvuFC5M4=;
        b=ujkF0KQLK3nRBXHyFgyHCRzM22VQ1g1jtuBSlz1q8c9BulsIfuxHRlCMv5AF8ewqzO
         Gta6tqDpleVsgmVwXitauNbYIg6AE3i4JEDe9iHsc3z8ScyfPT3UzJR5DdNOvSQtOr8k
         MQQVxONXynUjvWoG2Q1Q26dkM5eqDMx61XZSFuZYRC4fpN4ppKwDpXeX4XS1sJGFeGKR
         vORSnOu2lKxXd/+nA19FBe6VLCGF9HyOKe4aRKz3l2Irr+zAVCulkzCLDABIWNIC1Tfg
         5y2wyiAH4ZU/prXaBN/YxdX9OdOe59CUkmQhhu5+yWmXJStJnzuaUzvaPCPGgU+dhz4e
         AYWA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ot8si4105103ejb.275.2019.05.20.20.33.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 20:33:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:45796 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSvXH-0005qU-Ug
	for alex.bennee@linaro.org; Mon, 20 May 2019 23:33:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:55320)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSvX7-0005qH-9K
	for qemu-arm@nongnu.org; Mon, 20 May 2019 23:33:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSvX6-0004In-Dj
	for qemu-arm@nongnu.org; Mon, 20 May 2019 23:33:45 -0400
Received: from mga04.intel.com ([192.55.52.120]:10740)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hSvX6-0004IZ-6X; Mon, 20 May 2019 23:33:44 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 May 2019 20:33:42 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga005.fm.intel.com with ESMTP; 20 May 2019 20:33:40 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Tue, 21 May 2019 11:32:47 +0800
Message-Id: <20190521033249.1960-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.120
Subject: [Qemu-arm] [PATCH v5 0/2] Extract build_mcfg Part 2
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, thuth@redhat.com,
	mst@redhat.com, shannon.zhaosl@gmail.com,
	Wei Yang <richardw.yang@linux.intel.com>,
	marcel.apfelbaum@gmail.com, imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7OkotqguEhqh

This patch set tries to generalize MCFG table build process. Several patches
are already merged and these two are left for the following reasons:

  * conflict with latest upstream
  * ACPI_PCI dependency fix
  * missed reserved[8] in MCFG

v4->v5:
    * ACPI_PCI depends on both ACPI and PCI
    * rebase on latest master, adjust arm Kconfig
    * miss the reserved[8] of MCFG, add it back
    * make sure bios-tables-test all OK

Wei Yang (2):
  hw/acpi: Consolidate build_mcfg to pci.c
  acpi: pci: use build_append_foo() API to construct MCFG

 default-configs/i386-softmmu.mak |  1 +
 hw/acpi/Kconfig                  |  4 +++
 hw/acpi/Makefile.objs            |  1 +
 hw/acpi/pci.c                    | 57 ++++++++++++++++++++++++++++++++
 hw/arm/Kconfig                   |  1 +
 hw/arm/virt-acpi-build.c         | 17 ----------
 hw/i386/acpi-build.c             | 18 +---------
 include/hw/acpi/acpi-defs.h      | 18 ----------
 include/hw/acpi/pci.h            |  1 +
 9 files changed, 66 insertions(+), 52 deletions(-)
 create mode 100644 hw/acpi/pci.c

-- 
2.19.1

