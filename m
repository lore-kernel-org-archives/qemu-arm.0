Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2349592wrx;
        Mon, 15 Apr 2019 00:04:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxMNpSo2xmJ265N3aQY95fv5Q77QdCJlhyzd8yC/E6ZyPepbnlpuKAc0l5kZSriN1586el9
X-Received: by 2002:a5d:464f:: with SMTP id j15mr17638952wrs.265.1555311863203;
        Mon, 15 Apr 2019 00:04:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555311863; cv=none;
        d=google.com; s=arc-20160816;
        b=uBVyC5txMorHEC0Ox3CSSR9kK1sXG0CnAUJuA+75HTAknhnEOR2n8C3Mf7cIlWiOoR
         aje89fdLUMNupcUcVuW9Fq9dZlAY+REma4QCj1sezrPIbLaIdMi0mrEyjwkq6U1uzAvg
         b2/WJGhHIMZGA6iQY1ccdHjU1C5yv+1gOcg753WtLN2xYsMaH4/9ZoWIBCZSUfto7UBy
         ygiDBb4feOqdDvN1wksOK2oJ5zpe+hQT3NS9T9zj5wJnpgOLYIlQR/sLXU45tVoHFUJq
         bwG1jUsaE32LpB+rM60oGdxRzDwUmW1u+kFA1WE5DxpaHab7yyFjYOj/LXRhCS4Ih5sx
         159g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=6eSje4hq3BMqQhha0GI5qdeeYu4d+m7Sdc0iN3tYs+k=;
        b=EM5QhnC4uluffQrxpf9dUHp2TF7wqbeHPikJSRmLf1cc9wWMwOmvkdHyS0RwWuDLrg
         fc/8onpD9kxr1byoMcMR8dzmOe+12QOkHcj0vTHWu92VQVP/qogAycQZxczsO7sZDtKE
         iH+plQnQjaK14kM+4zTwF8fC45Dtya3XOiyIrdpVIbd+MGeGIgJG4xCrar0smev41ZYC
         BBLlARQ9YCwO+S9p7hQ3pIrngK/rENexqG8L1RX/8xki/SQ02onv/tB1LChi2dtC2n+A
         DT27idFD8lLl17QY6d4jYsQgIYJbS8KC5tCnERE9YE6cYQLm796bnEYXtFn2ZDQS+F0S
         HTMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d10si31941358wru.323.2019.04.15.00.04.23
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Apr 2019 00:04:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:45816 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hFvfC-0008Do-8v
	for alex.bennee@linaro.org; Mon, 15 Apr 2019 03:04:22 -0400
Received: from eggs.gnu.org ([209.51.188.92]:53430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hFvep-0008D6-W4
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 03:04:00 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hFveo-0004F9-19
	for qemu-arm@nongnu.org; Mon, 15 Apr 2019 03:03:59 -0400
Received: from mga03.intel.com ([134.134.136.65]:63671)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hFvek-00047Z-6D; Mon, 15 Apr 2019 03:03:56 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	15 Apr 2019 00:03:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,352,1549958400"; d="scan'208";a="149478502"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by FMSMGA003.fm.intel.com with ESMTP; 15 Apr 2019 00:03:41 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon, 15 Apr 2019 15:03:03 +0800
Message-Id: <20190415070307.13668-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
Subject: [Qemu-arm] [PATCH v2 0/4] Extract build_mcfg
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
	marcel.apfelbaum@gmail.com, imammedo@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IqMdla/41iUx

This patch set tries to generalize MCFG table build process.

Wei Yang (4):
  hw/arm/virt-acpi-build: remove unnecessary variable mcfg_start
  i386, acpi: remove mcfg_ prefix in AcpiMcfgInfo members
  hw/arm/virt-acpi-build: pass AcpiMcfgInfo to build_mcfg()
  hw/acpi: Extract build_mcfg to pci.c

 default-configs/arm-softmmu.mak  |  1 +
 default-configs/i386-softmmu.mak |  1 +
 hw/acpi/Kconfig                  |  4 +++
 hw/acpi/Makefile.objs            |  1 +
 hw/acpi/pci.c                    | 46 ++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c         | 31 ++++++---------------
 hw/i386/acpi-build.c             | 30 ++++-----------------
 include/hw/acpi/aml-build.h      |  5 ++++
 include/hw/acpi/pci.h            |  5 ++++
 9 files changed, 76 insertions(+), 48 deletions(-)
 create mode 100644 hw/acpi/pci.c
 create mode 100644 include/hw/acpi/pci.h

-- 
2.19.1

