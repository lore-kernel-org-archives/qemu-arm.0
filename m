Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp4359020wrg;
        Sun, 19 May 2019 18:01:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyjYhUWcWNknTdR4gq2yj8xj8lHC1tOeaSPTwWTpnYr9ytQ+iYE1qyPJSM4OtkweHMBkS9I
X-Received: by 2002:a17:906:5a08:: with SMTP id p8mr39525826ejq.276.1558314064599;
        Sun, 19 May 2019 18:01:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558314064; cv=none;
        d=google.com; s=arc-20160816;
        b=RPkOIKPV9hSpAhFgaNxw1RtNn9aBV0TnfaxN4D2WFje3jkSeIiP2EfmWVbYgdPzufO
         fOdeC0b9hBfYITV+JTN9gBJ8864XlJ/Lv9aH9vjlO6qS+cgQUChW6v9XorEs2Bi+ZEs2
         9kbSxCKhW1tiBHml8YNAWpZSho5ITv0B4ctSvmjrSt0+y3oNqbfpW0uomEweVIx6TZyT
         0dXLWo1LS4BdmvBh2hQpzJiel5rhHHJA86nz+uxhyjgqiWA9lV+9skeK/OvPzXL8qeRa
         pLZnsjWVqZ4iSFDMqTg4tVX28XdLAlwpF0wOw7l8SwN/AOFpHjNGInkpPbTzi0Dfcb3z
         LP5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=PiVI3iPCShxLHwHXqwrT7rSHv8mLhrVDC4OPBTLzsX0=;
        b=bpFI4GymuP6O6Cdv6TWlfsp1FD1kZXW776P1VbL1GxZX7720ty5AeJlTR+L6ReEq4b
         2OstzPkohlepfbI6Xxhu2s0GNxUWa/2NknAaMHEgrC63lSjiJluiRi5KAM9bA1MFAR6t
         NrFFCfE6f8M16cPQ4b09QopeSpRgyriyjsljEcR75dx88gY2zd9iZH9E7q1hHq/eOrsG
         Ga9CERwVefbWMsUX/0G7uWLnCqKoNxISVD2N6GSQ3xNk5bLhgxYycXIqMxrdyR0oyQte
         6vAvBddY6Q8ySG51dX4NZbpArLG7ISnBJeSE6Woa6HDk8JRiHL7lW2MbRMZWhxQKQDoG
         rbOA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x18si9158884ejd.195.2019.05.19.18.01.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 19 May 2019 18:01:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:55695 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSWfn-0000cA-KG
	for alex.bennee@linaro.org; Sun, 19 May 2019 21:01:03 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59488)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSWfZ-0000aa-Qp
	for qemu-arm@nongnu.org; Sun, 19 May 2019 21:00:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hSWfY-0006aN-Ik
	for qemu-arm@nongnu.org; Sun, 19 May 2019 21:00:49 -0400
Received: from mga17.intel.com ([192.55.52.151]:52449)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hSWfY-0006Zf-AQ; Sun, 19 May 2019 21:00:48 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
	by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	19 May 2019 18:00:45 -0700
X-ExtLoop1: 1
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by orsmga007.jf.intel.com with ESMTP; 19 May 2019 18:00:43 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Mon, 20 May 2019 08:59:51 +0800
Message-Id: <20190520005957.6953-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.151
Subject: [Qemu-arm] [PATCH v5 0/6] Extract build_mcfg
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
X-TUID: 3l7pG/ACb0Fi

This patch set tries to generalize MCFG table build process. And it is
based on one un-merged patch from Igor, which is included in this serials.

v4->v5:
    * ACPI_PCI depends on both ACPI and PCI
    * rebase on latest master, adjust arm Kconfig
    * miss the reserved[8] of MCFG, add it back
    * make sure bios-tables-test all OK

v3->v4:
    * adjust comment to give more information about MCFG table

v2->v3:
    * Includes the un-merged patch from Igor
    * use build_append_foo() API to construct MCFG

Igor Mammedov (1):
  q35: acpi: do not create dummy MCFG table

Wei Yang (5):
  hw/arm/virt-acpi-build: remove unnecessary variable mcfg_start
  i386, acpi: remove mcfg_ prefix in AcpiMcfgInfo members
  hw/arm/virt-acpi-build: pass AcpiMcfgInfo to build_mcfg()
  hw/acpi: Consolidate build_mcfg to pci.c
  acpi: pci: use build_append_foo() API to construct MCFG

 default-configs/i386-softmmu.mak |  1 +
 hw/acpi/Kconfig                  |  4 +++
 hw/acpi/Makefile.objs            |  1 +
 hw/acpi/pci.c                    | 57 ++++++++++++++++++++++++++++++++
 hw/arm/Kconfig                   |  1 +
 hw/arm/virt-acpi-build.c         | 31 +++++------------
 hw/i386/acpi-build.c             | 44 ++++--------------------
 include/hw/acpi/acpi-defs.h      | 18 ----------
 include/hw/acpi/pci.h            | 34 +++++++++++++++++++
 9 files changed, 113 insertions(+), 78 deletions(-)
 create mode 100644 hw/acpi/pci.c
 create mode 100644 include/hw/acpi/pci.h

-- 
2.19.1

