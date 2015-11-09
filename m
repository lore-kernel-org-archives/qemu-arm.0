Received: by 10.182.105.169 with SMTP id gn9csp1007490obb;
        Sun, 8 Nov 2015 23:11:42 -0800 (PST)
X-Received: by 10.55.42.27 with SMTP id q27mr28028029qkh.33.1447053102263;
        Sun, 08 Nov 2015 23:11:42 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v86si10124569qkv.59.2015.11.08.23.11.42
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Sun, 08 Nov 2015 23:11:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:50537 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZvgcA-0008Nx-2k
	for alex.bennee@linaro.org; Mon, 09 Nov 2015 02:11:42 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42272)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZvgbT-0007QM-Ci
	for qemu-devel@nongnu.org; Mon, 09 Nov 2015 02:11:03 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZvgbO-0008Cn-EB
	for qemu-devel@nongnu.org; Mon, 09 Nov 2015 02:10:59 -0500
Received: from mail-pa0-x231.google.com ([2607:f8b0:400e:c03::231]:35937)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ZvgbO-0008CN-8O; Mon, 09 Nov 2015 02:10:54 -0500
Received: by pacdm15 with SMTP id dm15so165853280pac.3;
	Sun, 08 Nov 2015 23:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=s6uJIhYdXon++cfYjQPEQjt76AcXX6/FvRzq8oZNywE=;
	b=wTHRj6HfOqXpkaC7hkCesWXtaSWim5xhS9qrscLqoDcCrGMlrDgiIaGmWsIpi7+5dv
	/jMD8b5ujPOpBi954P215ne/wCoBKu69M7lj7G2AjgY7xXt5yuFWDyO6pwhuHiuTm0Qj
	eBRG043HRBt29X1WW5SFw9QA/DVdgtouAj5VmWVsPGvASLdSLKy3B33egO8SpMTdzFWf
	VOjbzL2LaqO2zwu/sngv8ClbuGsZObIHnaLtdbYJsmJIpf+ZIOb9zLADCmC+HEDGPVGT
	XWOA3uCm/zsuGeznIj0N4eSIkOreMavtugVkTYRPDcKKeR78w1Aw8CpUIaUb24gPYPe3
	PhsQ==
X-Received: by 10.68.65.74 with SMTP id v10mr5758887pbs.67.1447053053269;
	Sun, 08 Nov 2015 23:10:53 -0800 (PST)
Received: from localhost.localdomain (mobile-166-171-248-219.mycingular.net.
	[166.171.248.219]) by smtp.gmail.com with ESMTPSA id
	vl1sm14294818pbc.31.2015.11.08.23.10.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 08 Nov 2015 23:10:52 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Sun,  8 Nov 2015 23:10:31 -0800
Message-Id: <cover.1447007690.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::231
Cc: peter.maydell@linaro.org, Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	qemu-arm@nongnu.org, linux@roeck-us.net, robh@kernel.org
Subject: [Qemu-devel] [PATCH for-2.5 v4 0/3] ARM: Highbank: Highbank: Add
	monitor support
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: h8t7qcbEDH2R

Hi,

This adds dummy monitor support to the Highbank board. It is needed by
the Highbank kernel which expects a monitor to be present.

A feature is added to arm/boot's board_setup feature, that allows the
board_setup entry point to be entered in secure mode (which is needed
to configure a monitor).

This feature does not play nice with -cpu override, but cpu override
is not valid for well-defined ARM SoCs. So defeature -cpu for Highbank.

Regards,
Peter

See indiv. patches for detailed change logs.

Changed since v3:
Addressed PMM v2 review
Changed tcg_enabled() checks to kvm_enabled()
Changed since v2:
Defeature -cpu for Highbank (new patch)
Rework board_setup blob implementation (PMM review)
Conditionalise feature on TCG
Dropped initial board_setup and Zynq patches (Merged)
Changed since v1:
Addressed PMM review.
Added secure_board_setup flag (P4)
Added Zynq patch first, then Highbank


Peter Crosthwaite (3):
  arm: boot: Add secure_board_setup flag
  arm: highbank: Defeature CPU override
  arm: highbank: Implement PSCI and dummy monitor

 hw/arm/boot.c        | 10 +++++-
 hw/arm/highbank.c    | 91 ++++++++++++++++++++++++++++++++++++++--------------
 include/hw/arm/arm.h |  6 ++++
 3 files changed, 82 insertions(+), 25 deletions(-)

-- 
1.9.1

