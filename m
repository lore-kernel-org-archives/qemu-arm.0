Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp1263901wrx;
        Thu, 18 Apr 2019 17:45:55 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwyKZhwlkGymmRnRGp+wdn2ODHxr34b7KrY9J902fHL2dPH9S+x+Aw2MPizHS+DOOFLDaxf
X-Received: by 2002:adf:cf0c:: with SMTP id o12mr734268wrj.16.1555634755786;
        Thu, 18 Apr 2019 17:45:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1555634755; cv=none;
        d=google.com; s=arc-20160816;
        b=hVtRRlbjUqUSkkd/VhsIMW4ly2NBVyMswptUjRM7j4xRMHn1Q9sk8gSg2bYNR8pT98
         sOU4oMtREykbAum5q2iv+sdM09L7sa5W5e2U0SEHXRaBRocQpofP+6cAwbd/VsEz3Vvt
         3v+qVVSud1F5q2RthUlNAKnXPe/GeVMBzVbm5OqK7VJrzw/mixJAaSvUYco5FcxQ2Ubo
         WcO/BHUtTGl4JUvQTwTIuK+uCiujCHlwBGnyje1HhyaedJGNipKfSiSAfkwTOmn1mIM0
         wGdaOgMajQcaJ31NDD/TEqXp7NLe5OxnNqs5dqnOGWk5R8bZh9s24yPpRTZHWQ4iC0ZY
         v/EA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=SJ7ll0SHxPyop8yAHfaszMgd/2wRxPtQIMWNyc8rPxo=;
        b=AYOC3qWwv/Vt3AEubLRNidMzhAt2rnm11UBT3OA1dx2EPR2YVOMD8K2x1UEgzGNHAa
         esShSVyEpW2AaUgl/2kJyUGKD2aJMg9opC+gVRs7+ay6cP8i+huE92IyHRmnBW4TSftu
         YAVBa1y29Zrwpk37slMwD+wz7gk59Xqf79IKrzpr2qgC2P5pPidCjKeiz5a/DSVRxgKU
         jTtq7puxizLawz4JQ+IO38F7iUitp2iOT7fXUFiWW4IYwUTnW/v80mPWXR0fD4Xyd5hs
         /YvkYhtQEhbjud9sp8cwCIlq7aNVZkPZPeIrcJwK19vp923ZTcdj/9/3B7cU0hVNf2QJ
         zxgg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n4si2619974wme.146.2019.04.18.17.45.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Apr 2019 17:45:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=intel.com
Received: from localhost ([127.0.0.1]:49281 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hHHf8-0001X2-Tc
	for alex.bennee@linaro.org; Thu, 18 Apr 2019 20:45:54 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35712)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hHHc9-0007cN-FL
	for qemu-devel@nongnu.org; Thu, 18 Apr 2019 20:42:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richardw.yang@linux.intel.com>) id 1hHHRC-0005oF-Dq
	for qemu-devel@nongnu.org; Thu, 18 Apr 2019 20:31:31 -0400
Received: from mga02.intel.com ([134.134.136.20]:10347)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <richardw.yang@linux.intel.com>)
	id 1hHHRA-0005jO-EJ; Thu, 18 Apr 2019 20:31:28 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
	by orsmga101.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384;
	18 Apr 2019 17:31:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,367,1549958400"; d="scan'208";a="165987511"
Received: from richard.sh.intel.com (HELO localhost) ([10.239.159.54])
	by fmsmga001.fm.intel.com with ESMTP; 18 Apr 2019 17:31:22 -0700
From: Wei Yang <richardw.yang@linux.intel.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Date: Fri, 19 Apr 2019 08:30:47 +0800
Message-Id: <20190419003053.8260-1-richardw.yang@linux.intel.com>
X-Mailer: git-send-email 2.19.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.20
Subject: [Qemu-devel] [PATCH v4 0/6] Extract build_mcfg
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
Cc: yang.zhong@intel.com, peter.maydell@linaro.org, mst@redhat.com,
	shannon.zhaosl@gmail.com,
	Wei Yang <richardw.yang@linux.intel.com>, imammedo@redhat.com,
	philmd@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ig5Fnffwn/NY

This patch set tries to generalize MCFG table build process. And it is
based on one un-merged patch from Igor, which is included in this serials.

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

 default-configs/arm-softmmu.mak  |  1 +
 default-configs/i386-softmmu.mak |  1 +
 hw/acpi/Kconfig                  |  4 +++
 hw/acpi/Makefile.objs            |  1 +
 hw/acpi/pci.c                    | 55 ++++++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c         | 31 +++++-------------
 hw/i386/acpi-build.c             | 44 ++++---------------------
 include/hw/acpi/acpi-defs.h      | 18 -----------
 include/hw/acpi/pci.h            | 34 ++++++++++++++++++++
 9 files changed, 111 insertions(+), 78 deletions(-)
 create mode 100644 hw/acpi/pci.c
 create mode 100644 include/hw/acpi/pci.h

-- 
2.19.1

