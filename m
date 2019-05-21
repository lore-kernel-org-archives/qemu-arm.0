Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp1054646wrg;
        Mon, 20 May 2019 23:45:22 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzTgB4YIx2zCq2c0IV3ccoX7/pR22n18q6IQwOn5nWKGwWd/jvqOmW/WFA+1z6fWmGCBIkF
X-Received: by 2002:a50:97ed:: with SMTP id f42mr80924675edb.141.1558421122051;
        Mon, 20 May 2019 23:45:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558421122; cv=none;
        d=google.com; s=arc-20160816;
        b=fHw5iWMsKNHeiczcni8Lj6ywVJwR1dvLC+F9STvFaB/Xjx4GLA6yi6w2CGacy0NCpR
         Di5tBZRXHntoRBKcJuX7a4cPJaCZsrrNoj9l476eS04Wx18CiyLRUf83CRvXy5lRv19S
         daZikn+JY8gKugq/U/TPgGOOItwWXOiVm9WGaGhKlb2oNGL8JMrZdb9UHaMS9eaFZA9V
         D69NlD/EJuTrS4XOWF+jRQuam5cF7vnaWvVMgpUJNMiNsgUmlg5ZKr7UXMM8vwq4LjAp
         8QxB+BYDCmi7Nmo70txUisocNxePf/7IicOWRr+WrsMptDRrAlKNFj1cTt+HDap3bJjL
         trzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=qwTOBrf3GizMscPgfncPECcQA4aanS5Rok7A6qh7LJc=;
        b=Sb0LOzMH8MdzS4Op1TovydPoiEniZDgh8hAvaAKliNi16sguGGqMLlUp2tRrc+qvUp
         JRmqpSFWU1YxHBeYiw/2qzCWfTZqdtjQFoMtVNiGc0tPgctR0qprqibwagdEv3aDqLPp
         00f4GTcEJTh72Q2efrHiKErs8T27iDTtIiihyMtyQP+sy0jE0WNWaaRt+0Ib0IgEoCRf
         Bt7WY4Nfb7GCvQ9ePhbPf4EsvXCO1bhFr4EQht6t+ElV+s911wF5WZT2HXKLJr/vB3zh
         Kz4SAuwiwVVyTCWhub4QALxftQe9ELHC1Bn3Ab7soBSga8Gf/IyvRXjn8JzvWHmVki5G
         G2mg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f10si14434248edd.87.2019.05.20.23.45.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 23:45:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:47528 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSyWW-00024B-Uq
	for alex.bennee@linaro.org; Tue, 21 May 2019 02:45:20 -0400
Received: from eggs.gnu.org ([209.51.188.92]:49141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSyHi-00068N-9k
	for qemu-devel@nongnu.org; Tue, 21 May 2019 02:30:03 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSyHg-0008BW-Fb
	for qemu-devel@nongnu.org; Tue, 21 May 2019 02:30:01 -0400
Received: from mga04.intel.com ([192.55.52.120]:33253)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hSyHc-00083f-Cq; Tue, 21 May 2019 02:29:56 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga004.jf.intel.com ([10.7.209.38])
	by fmsmga104.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	20 May 2019 23:29:54 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga004.jf.intel.com with ESMTP; 20 May 2019 23:29:50 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Tue, 21 May 2019 14:28:34 +0800
Message-Id: <20190521062836.6541-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.120
Subject: [Qemu-devel] [PATCH v6 0/2] Extract build_mcfg Part 2
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, thuth@redhat.com,
	mst@redhat.com, shannon.zhaosl@gmail.com,
	Wei Yang <richardw.yang@linux.intel.com>, imammedo@redhat.com,
	philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DVxjvpzZI7oB

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
 hw/acpi/pci.c                    | 61 ++++++++++++++++++++++++++++++++
 hw/arm/Kconfig                   |  1 +
 hw/arm/virt-acpi-build.c         | 17 ---------
 hw/i386/acpi-build.c             | 18 +---------
 include/hw/acpi/acpi-defs.h      | 18 ----------
 include/hw/acpi/pci.h            |  1 +
 9 files changed, 70 insertions(+), 52 deletions(-)
 create mode 100644 hw/acpi/pci.c

-- 
2.19.1

