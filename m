Received: by 10.25.21.156 with SMTP id 28csp32374lfv;
        Thu, 11 Aug 2016 02:36:55 -0700 (PDT)
X-Received: by 10.55.126.195 with SMTP id z186mr3562155qkc.76.1470908214979;
        Thu, 11 Aug 2016 02:36:54 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w10si1039631qta.121.2016.08.11.02.36.54
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Aug 2016 02:36:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47136 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bXmQ2-0004AE-FF
	for alex.bennee@linaro.org; Thu, 11 Aug 2016 05:36:54 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55998)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bXmPy-000490-6H
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 05:36:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bXmPx-0003Tp-9h
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 05:36:50 -0400
Received: from mga03.intel.com ([134.134.136.65]:50882)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>)
	id 1bXmPp-0003Pj-WB; Thu, 11 Aug 2016 05:36:42 -0400
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
	by orsmga103.jf.intel.com with ESMTP; 11 Aug 2016 02:36:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,504,1464678000"; d="scan'208";a="747262295"
Received: from lvzheng-z530.sh.intel.com ([10.239.159.146])
	by FMSMGA003.fm.intel.com with ESMTP; 11 Aug 2016 02:36:38 -0700
From: Lv Zheng <lv.zheng@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>, "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Shannon Zhao <shannon.zhao@linaro.org>
Date: Thu, 11 Aug 2016 17:36:29 +0800
Message-Id: <cover.1470907810.git.lv.zheng@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <409b2bbd046a53987a71e64d855e5761d441bbaf.1470641265.git.lv.zheng@intel.com>
References: <409b2bbd046a53987a71e64d855e5761d441bbaf.1470641265.git.lv.zheng@intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 134.134.136.65
Subject: [Qemu-arm] [PATCH v5 0/2] ACPI: Add FADT revision support
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
Cc: qemu-arm@nongnu.org, Lv Zheng <lv.zheng@intel.com>,
	Lv Zheng <zetalog@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: v1VBvBaIKcsf

This patchset adds revision support for FADT.

History:
v1:
  Initial support
v2:
  Coding style cleanup
v3:
  Cleanup -acpitable code (remove useless hdrs->data/file)
  Change -acpifadt to -acpitable fadt=
  Shrink v1 FADT table length
v4:
  Coding style cleanup
v5:
  Correct change block residency

Lv Zheng (2):
  ACPI: Cleanup -acpitable option code
  ACPI: Add -acpitable fadt= to allow FADT revision changes

 hw/acpi/core.c         |   50 +++++++++++++++++++++++++------
 hw/i386/acpi-build.c   |   76 ++++++++++++++++++++++++++++++++++++++++++------
 include/hw/acpi/acpi.h |    1 +
 qapi-schema.json       |   26 +++++------------
 qemu-options.hx        |   15 ++++++++--
 5 files changed, 128 insertions(+), 40 deletions(-)

-- 
1.7.10

