Received: by 10.25.21.156 with SMTP id 28csp21893lfv;
        Thu, 11 Aug 2016 02:06:42 -0700 (PDT)
X-Received: by 10.55.21.105 with SMTP id f102mr9918740qkh.269.1470906401488;
        Thu, 11 Aug 2016 02:06:41 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [208.118.235.17])
        by mx.google.com with ESMTPS id h64si999240qkf.64.2016.08.11.02.06.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 Aug 2016 02:06:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) client-ip=208.118.235.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 208.118.235.17 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:46985 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bXlwm-0006aC-Vg
	for alex.bennee@linaro.org; Thu, 11 Aug 2016 05:06:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49632)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bXlwj-0006YZ-Io
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 05:06:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>) id 1bXlwh-00059h-NJ
	for qemu-arm@nongnu.org; Thu, 11 Aug 2016 05:06:36 -0400
Received: from mga04.intel.com ([192.55.52.120]:3810)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lv.zheng@intel.com>)
	id 1bXlwd-00058s-Dh; Thu, 11 Aug 2016 05:06:31 -0400
Received: from orsmga003.jf.intel.com ([10.7.209.27])
	by fmsmga104.fm.intel.com with ESMTP; 11 Aug 2016 02:06:29 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.28,504,1464678000"; d="scan'208";a="863587087"
Received: from unknown (HELO lvzheng-z530.sh.intel.com) ([10.239.159.146])
	by orsmga003.jf.intel.com with ESMTP; 11 Aug 2016 02:06:27 -0700
From: Lv Zheng <lv.zheng@intel.com>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>, "Michael S. Tsirkin" <mst@redhat.com>,
	Igor Mammedov <imammedo@redhat.com>, Shannon Zhao <shannon.zhao@linaro.org>
Date: Thu, 11 Aug 2016 17:06:03 +0800
Message-Id: <cover.1470905888.git.lv.zheng@intel.com>
X-Mailer: git-send-email 1.7.10
In-Reply-To: <409b2bbd046a53987a71e64d855e5761d441bbaf.1470641265.git.lv.zheng@intel.com>
References: <409b2bbd046a53987a71e64d855e5761d441bbaf.1470641265.git.lv.zheng@intel.com>
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 192.55.52.120
Subject: [Qemu-arm] [PATCH v3 0/2] ACPI: Add FADT revision support
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
X-TUID: m3DKH4TRhKpL

This patchset adds revision support for FADT.

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

