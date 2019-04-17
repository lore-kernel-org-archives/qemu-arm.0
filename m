Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp4590403wrx;
        Tue, 16 Apr 2019 18:46:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxxGxVzCXkoQIEzZwnHAGpbz84UaLtYJXF9MEWzkqShjvv/OH7ma6XlJsRAFCVPCbilWU8X
X-Received: by 2002:adf:f803:: with SMTP id s3mr34734194wrp.54.1555465618080;
        Tue, 16 Apr 2019 18:46:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555465618; cv=none;
        d=google.com; s=arc-20160816;
        b=KTmZNrdvcGZ15dkWdyj75TjByTXzi/3FMgunP/MF2msmemwjQKtXiycWbSuhPh2Dfz
         A0m+MIZAj+AFNCTZbIjp5kVeN+Sk0b8K/p15Q+HuLPZ0xrPdemcqQbaH1OOcPppitoYs
         S9eSx3JBae7ndon+MIJKRp0L8rl8GGXAmeQTzjKW70PwnggiqNktF4c+47XUUid8AYBJ
         0z7qbdX1tLCkGtljZvBtbWA/7Fi4W4ETDThBRH+eJI3TJ2v5PO/jnkOhy+UMtyWsyF3V
         NfgC/vXwoCwKyhBdEv6adnKAD+Yo3EMR09XGkZ7OoHFUuARDHdeAJrrHEPp8YTbZGs89
         zrdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=AhvVFsR6l3JfgzzUDuB+8e2fmTwENMIoMfyFzWvFRQc=;
        b=T+jNdAX3o2N9RFMaeSpPW2DF9Svak2m6LyC7W1dzywsdY79jCkW+C9W5rb9jnp8v/H
         0Dk7YmHOBsnrjlcPlRZ4lsDwYSs++CjtKTta5MjBAwtE3Xc/oPk9nbDu+6haLhOVzWuL
         MalIRMo73Ma0PEzaHyzh6Kj9zisRmAghFF240+Up8Se1twhcExcM22VSN+e+6M/AOeyX
         8JFU20fzmZgviFOJWRkmijLGoeIiAaMmbXG8EAIOzXP7Hd8HCcn5+Qwo0FvoipxtwyKo
         kmAXcVUJvdknmdXMZRSvAFVRKin3VCAU9BOkFK/7KIYpafJV72P7tEowaPeb/HWeaqHk
         Cz8g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t2si36697756wrp.368.2019.04.16.18.46.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Apr 2019 18:46:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:45328 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hGZf7-000201-7Y
	for alex.bennee@linaro.org; Tue, 16 Apr 2019 21:46:57 -0400
Received: from eggs.gnu.org ([209.51.188.92]:47984)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hGZab-00076D-8v
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 21:42:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hGZaa-0006Zw-FO
	for qemu-arm@nongnu.org; Tue, 16 Apr 2019 21:42:17 -0400
Received: from mga14.intel.com ([192.55.52.115]:15517)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hGZaa-0006FQ-5a; Tue, 16 Apr 2019 21:42:16 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
	by fmsmga103.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	16 Apr 2019 18:41:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,360,1549958400"; d="scan'208";a="338295302"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga005.fm.intel.com with ESMTP; 16 Apr 2019 18:41:12 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Wed, 17 Apr 2019 09:40:32 +0800
Message-Id: <20190417014038.26018-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.115
Subject: [Qemu-arm] [PATCH v3 0/6] Extract build_mcfg
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	shannon.zhaosl@gmail.com, Wei Yang <richardw.yang@linux.intel.com>,
	marcel.apfelbaum@gmail.com, imammedo@redhat.com, philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wl3zm8mtYdXa

This patch set tries to generalize MCFG table build process. And it is
based on one un-merged patch from Igor, which is included in this serials.

v2->v3:
    * Includes the un-merged patch from Igor
    * use build_append_foo() API to construct MCFG

Igor Mammedov (1):
  q35: acpi: do not create dummy MCFG table

Wei Yang (5):
  hw/arm/virt-acpi-build: remove unnecessary variable mcfg_start
  i386, acpi: remove mcfg_ prefix in AcpiMcfgInfo members
  hw/arm/virt-acpi-build: pass AcpiMcfgInfo to build_mcfg()
  hw/acpi: Extract build_mcfg to pci.c
  acpi: pci: use build_append_foo() API to construct MCFG

 default-configs/arm-softmmu.mak  |  1 +
 default-configs/i386-softmmu.mak |  1 +
 hw/acpi/Kconfig                  |  4 +++
 hw/acpi/Makefile.objs            |  1 +
 hw/acpi/pci.c                    | 52 ++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c         | 31 +++++--------------
 hw/i386/acpi-build.c             | 44 +++++----------------------
 include/hw/acpi/acpi-defs.h      | 18 -----------
 include/hw/acpi/pci.h            | 34 +++++++++++++++++++++
 9 files changed, 108 insertions(+), 78 deletions(-)
 create mode 100644 hw/acpi/pci.c
 create mode 100644 include/hw/acpi/pci.h

-- 
2.19.1

