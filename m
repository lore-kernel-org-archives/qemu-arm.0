Received: by 2002:adf:a111:0:0:0:0:0 with SMTP id o17-v6csp4842964wro;
        Mon, 29 Oct 2018 16:21:24 -0700 (PDT)
X-Google-Smtp-Source: AJdET5dz+2odGEHDumxK80bKWi3xIdfzOyM5evdPDJmzrse64gBR7QeUhlsbsbCPofyZlacZntLs
X-Received: by 2002:a0c:d646:: with SMTP id e6-v6mr14559118qvj.209.1540855284181;
        Mon, 29 Oct 2018 16:21:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1540855284; cv=none;
        d=google.com; s=arc-20160816;
        b=BTFHrCIdSsPi48TJ47rZEwK7Q1E3ARxliPpzkL2sWwCYtD6KhK2uuFGsdzPFRGOTcq
         xv4rJF6yr8PsHdLzwRkAWPi39BvPZ5gOp6+vs5d1nSqZDrwNJtxu284nS+VSWInju9XQ
         2zTjaaT9S6/iXKh2GaeqGG/8scbzZjw9f0tRMLGpQ5GjgU0Azg538MJhuhLN4ENzWjdY
         2kDRPSf4t5SjuABY7vWhW1/OqDK3nNhVmM7J8BQjsxQIeq6zEPn4Mv3SVCRQmZCjEBFe
         LmStM+qTKzQQhyP0i5htR9sDYVptKrkRlzPVF8XupgQyQivADRwIB0JpKQveUZT0Sosk
         Sqmw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from;
        bh=ib4mR/k/wlDfpWwgDcaUoTOLf9d1U9mnQ7S8n8b0lso=;
        b=r+1DAJ6iDuAHbvRDBy+kx1lYv7+rXgQuixw+GZPhMe+9OLw1KKI98K7dYtHW7tYqmY
         YWQdawLeJm1MxSkuUc11rgXB9XtcT7ZzWE2PWHB3m/ZqzzTfBVOhEhy9D8iVHRBagrnY
         DJdL3od2quuhrKK0ZB7i0cuSk41x4QVovwUSEV+SGrqlxy1V4ixRfI1efbLlW6qURGj0
         kO8I713EpR+73vX1Ny5Ez3/D2ec4hict2MNJTdv/R9Lm0/qM/+cUgnSnAN1hu35I8Q+z
         BfPopSZ3drCL5n4m5wPAwLfFT1k6E+s0nFls4BoeGsxnOjI40xQAur8Dg17CAjLlsXzt
         UDMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c24-v6si5627397qtd.358.2018.10.29.16.21.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 29 Oct 2018 16:21:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49534 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gHGqZ-0001Dx-O2
	for alex.bennee@linaro.org; Mon, 29 Oct 2018 19:21:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47410)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHGqS-0001Db-GU
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 19:21:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1gHGqP-0008HY-5R
	for qemu-arm@nongnu.org; Mon, 29 Oct 2018 19:21:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51328)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <philmd@redhat.com>)
	id 1gHGqO-0008Fd-T9; Mon, 29 Oct 2018 19:21:13 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
	[10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 616E981DE9;
	Mon, 29 Oct 2018 23:21:11 +0000 (UTC)
Received: from x1w.redhat.com (ovpn-204-38.brq.redhat.com [10.40.204.38])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB43C16C1F;
	Mon, 29 Oct 2018 23:21:04 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>,
	Guenter Roeck <linux@roeck-us.net>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>
Date: Tue, 30 Oct 2018 00:20:57 +0100
Message-Id: <20181029232100.8454-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.25]);
	Mon, 29 Oct 2018 23:21:11 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: [Qemu-arm] [PATCH 0/3] hw/arm/exynos4: Add DMA support for SMDKC210
 board
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
Cc: qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7EAa3lIsH7hp

Hi, this series is another intent to salvage previous work from Guenter R=
oeck:
https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg06302.html

Instead of duplicate the pl330_init() from the xilinx_zynq, I factored it=
 out.

Regards,

Phil.

Guenter Roeck (1):
  arm: exynos4: Add dma support for smdkc210

Philippe Mathieu-Daud=C3=A9 (2):
  hw/arm/xilinx_zynq: Use the ARRAY_SIZE macro
  hw/dma/pl330: Factor out pl330_init() from hw/arm/xilinx_zynq.c

 MAINTAINERS             |  1 +
 hw/arm/exynos4_boards.c | 12 ++++++++++++
 hw/arm/xilinx_zynq.c    | 20 +++-----------------
 hw/dma/pl330.c          |  2 +-
 include/hw/dma/pl330.h  | 41 +++++++++++++++++++++++++++++++++++++++++
 5 files changed, 58 insertions(+), 18 deletions(-)
 create mode 100644 include/hw/dma/pl330.h

--=20
2.17.2

