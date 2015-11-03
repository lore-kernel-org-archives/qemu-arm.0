Received: by 10.182.105.169 with SMTP id gn9csp1646698obb;
        Mon, 2 Nov 2015 20:31:03 -0800 (PST)
X-Received: by 10.55.212.157 with SMTP id s29mr34079413qks.100.1446525063569;
        Mon, 02 Nov 2015 20:31:03 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 22si9557547qhz.5.2015.11.02.20.31.03
        for <alex.bennee@linaro.org>
        (version=TLSv1 cipher=RC4-SHA bits=128/128);
        Mon, 02 Nov 2015 20:31:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45580 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ZtTFP-0002Oc-5K
	for alex.bennee@linaro.org; Mon, 02 Nov 2015 23:31:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZtTFM-0002JJ-Bd
	for qemu-arm@nongnu.org; Mon, 02 Nov 2015 23:31:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>) id 1ZtTFL-0000Ga-De
	for qemu-arm@nongnu.org; Mon, 02 Nov 2015 23:31:00 -0500
Received: from mail-pa0-x236.google.com ([2607:f8b0:400e:c03::236]:33086)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <crosthwaitepeter@gmail.com>)
	id 1ZtTFF-0000F8-7Z; Mon, 02 Nov 2015 23:30:53 -0500
Received: by pabfh17 with SMTP id fh17so6857340pab.0;
	Mon, 02 Nov 2015 20:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=0kluKI4q2+Zc57MOPEhNJ36VL9WedP0gJ+N88UUFf8s=;
	b=lgFEileLnBDhDTifIp+W76PGs92/QFbtkQ0dJdZ/vteZ9sMGoOlG/DQnhJkrJ7pcjE
	m6VheJKcHqV7u33AZ1rZNIGPmgZyZy0NUABc+HKiKPE3oIeo9HUSXo1bnxVkWrr2kOpb
	n0jTVgdwJfcuAn10bc1KLjHn4/8K0fw+RUrvKI1+p5VPIL+sLW60RvnV8BaXvkXQQFdc
	/4uP/UZyj2jAxtz23tBflVWHkfkAPavXfCm9YCxz/XWyji7PGoX8njqzxgLPnaYzVXbP
	QxxmekGFeEQtURVe5nYwO/41wk16fsA87pKNWGcmqSwDKrgKxnMpP6DesuJKxlwZy5Nv
	1XBw==
X-Received: by 10.66.122.69 with SMTP id lq5mr31126483pab.125.1446525052742;
	Mon, 02 Nov 2015 20:30:52 -0800 (PST)
Received: from localhost.localdomain (mobile-166-171-251-070.mycingular.net.
	[166.171.251.70]) by smtp.gmail.com with ESMTPSA id
	ey2sm26830137pbd.77.2015.11.02.20.30.48
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 02 Nov 2015 20:30:51 -0800 (PST)
From: Peter Crosthwaite <crosthwaitepeter@gmail.com>
X-Google-Original-From: Peter Crosthwaite <crosthwaite.peter@gmail.com>
To: qemu-devel@nongnu.org
Date: Mon,  2 Nov 2015 20:30:34 -0800
Message-Id: <cover.1446428067.git.crosthwaite.peter@gmail.com>
X-Mailer: git-send-email 1.9.1
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:400e:c03::236
Cc: robh@kernel.org, qemu-arm@nongnu.org, linux@roeck-us.net
Subject: [Qemu-arm] [PATCH for-2.5 v3 0/3] ARM: Highbank: Add monitor support
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: i3zKvO0xfjiu

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

 hw/arm/boot.c        |  8 ++++-
 hw/arm/highbank.c    | 90 ++++++++++++++++++++++++++++++++++++++--------------
 include/hw/arm/arm.h |  6 ++++
 3 files changed, 79 insertions(+), 25 deletions(-)

-- 
1.9.1

