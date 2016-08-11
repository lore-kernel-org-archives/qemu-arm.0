Received: by 10.25.21.156 with SMTP id 28csp25688lfv;
        Thu, 11 Aug 2016 02:17:02 -0700 (PDT)
X-Received: by 10.55.204.151 with SMTP id n23mr10050503qkl.210.1470907022858;
        Thu, 11 Aug 2016 02:17:02 -0700 (PDT)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v3si1015833qkh.77.2016.08.11.02.17.02
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Aug 2016 02:17:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:47045 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bXm6o-0007sv-BY
	for alex.bennee@linaro.org; Thu, 11 Aug 2016 05:17:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50694)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bXm2f-0004BL-Av
	for qemu-devel@nongnu.org; Thu, 11 Aug 2016 05:12:46 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bXm2a-0006Nq-Uo
	for qemu-devel@nongnu.org; Thu, 11 Aug 2016 05:12:44 -0400
Received: from mga01.intel.com ([192.55.52.88]:22817)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>)
	id 1bXm2a-0006NW-M3; Thu, 11 Aug 2016 05:12:40 -0400
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by fmsmga101.fm.intel.com with ESMTP; 11 Aug 2016 02:12:40 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,504,1464678000"; d="scan'208";a="1033695946"
Received: from unknown (HELO lvzheng-z530.sh.intel.com) ([10.239.159.146])
	by orsmga002.jf.intel.com with ESMTP; 11 Aug 2016 02:12:38 -0700
From: Lv Zheng <lv.zheng@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>, "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Shannon Zhao <shannon.zhao@linaro.org>
Date: Thu, 11 Aug 2016 17:12:28 +0800
Message-Id: <cover.1470906564.git.lv.zheng@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <409b2bbd046a53987a71e64d855e5761d441bbaf.1470641265.git.lv.zheng@intel.com>
References: <409b2bbd046a53987a71e64d855e5761d441bbaf.1470641265.git.lv.zheng@intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.88
Subject: [Qemu-devel] [PATCH v4 0/2] ACPI: Add FADT revision support
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
Cc: qemu-arm@nongnu.org, Lv Zheng <lv.zheng@intel.com>,
	Lv Zheng <zetalog@gmail.com>, qemu-devel@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: pmoYw2JoHAVR

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

Lv Zheng (2):
  ACPI: Cleanup -acpitable option code
  ACPI: Add -acpitable fadt= to allow FADT revision changes

 hw/acpi/core.c         |   50 +++++++++++++++++++++++++------
 hw/i386/acpi-build.c   |   76 ++++++++++++++++++++++++++++++++++++++++++------
 include/hw/acpi/acpi.h |    1 +
 qapi-schema.json       |   27 +++++------------
 qemu-options.hx        |   15 ++++++++--
 5 files changed, 129 insertions(+), 40 deletions(-)

-- 
1.7.10

