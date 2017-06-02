Received: by 10.25.0.23 with SMTP id 23csp19786lfa;
        Fri, 2 Jun 2017 09:29:15 -0700 (PDT)
X-Received: by 10.55.147.3 with SMTP id v3mr8705161qkd.165.1496420955341;
        Fri, 02 Jun 2017 09:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1496420955; cv=none;
        d=google.com; s=arc-20160816;
        b=e1b0ke/3EqSRe1M/lpSlLpON+Ff+LeWo0Czpln15l4TQa5tcNkwSKsV4jSFWgFeq9z
         nndrgDkHuKJylm1sj3Qm1JQhgjsRT6GkNPVBrBMZafq0ijxX4xyqV0W1LLisSsfAglLV
         /z3hmE4MWQFI1rEJW105FSDqmaodfnPqslNYKDSASQOleZyPwAwpJuw7EdD/WWsVWKfX
         uNBdDnkMU0iyGNwji0S0z9N8Y6SK0FRtWK2sWkJlV+9HOeN1my+lS5ddynluN1MO+f2j
         LKZXe4itaqj0xjuLnTCs1s6C9AeAvoRleUWGrVlt6j1XpYYb9lD0ydJfdURbHaLBT22J
         fFDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=JD9tw+Zd2GI7GL9+P7mgq6kCMNBQgfGmlEQgShWinWE=;
        b=GuJi94bq8yUH5QpHttI5zm+z+DqEJFkjGesdhqc8kTBUsrpjtTZFoOxiEQl53Ce3ag
         or8Me8qLxfqiQiHR7Cx8lv4ja49rM5pAjHrhNGv8Kg8M/diTemSqh0QiZ70m96LnPClW
         YUZ1vfx3qlrtOJPwRvgYU5AsvVlyKAVlyNj8oWHe7uZPUEoW7shl5Jm6DJS/7k2aphRQ
         aptlHUGc8dPXKPt4cJ0Jn/ZB9MF2aGatHzZiAscGHOt6EUelnrfxmZaUO5elrvfqi5gj
         7CuyeiNNt0I2DFh+32jYQhDz90NupzqAghcVULvLp4jnvcYUtkA7qYFKfgaA1wX3LU9n
         sa3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j123si23696049qkc.268.2017.06.02.09.29.14
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 02 Jun 2017 09:29:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:50682 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dGpRo-0005YX-LA
	for alex.bennee@linaro.org; Fri, 02 Jun 2017 12:29:12 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60944)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dGpRl-0005YP-BE
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 12:29:10 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dGpRi-0002IQ-Np
	for qemu-arm@nongnu.org; Fri, 02 Jun 2017 12:29:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:53234)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1dGpRi-0002I1-HU; Fri, 02 Jun 2017 12:29:06 -0400
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id 8D5CA23A02;
	Fri,  2 Jun 2017 16:29:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8D5CA23A02
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Fri,  2 Jun 2017 18:28:48 +0200
Message-Id: <20170602162857.6065-1-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-arm] [PATCH v4 0/9] hw: arm: exynos: Improvements and cleanups
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
Cc: Eric Blake <eblake@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: i6T61/i+cjAv

Hi,

I split non-intrusive changes from my previous attempts [1].

This patchset contains only cleanups, minor improvements and support for
power off. Power off itself will not happen because kernel will hang
before trying it, on syncing IRQ works (fix for this is [2], but this wil=
l
be separate).

Changes since v3:
1. Rebase on current master (API for shutdown changed).
2. Apply Peter's reviewed-by tag.


Best regards,
Krzysztof


[1] https://lists.gnu.org/archive/html/qemu-devel/2017-05/msg04821.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2017-05/msg04818.html

Krzysztof Kozlowski (9):
  hw/intc/exynos4210_gic: Use more meaningful name for local variable
  hw/timer/exynos4210_mct: Fix checkpatch style errors
  hw/timer/exynos4210_mct: Cleanup indentation and empty new lines
  hw/timer/exynos4210_mct: Remove unused defines
  hw/arm/exynos: Move DRAM initialization next boards
  hw/arm/exynos: Declare local variables in some order
  hw/arm/exynos: Use type define instead of hard-coded a9mpcore_priv
    string
  hw/intc/exynos4210_gic: Constify array of combiner interrupts
  hw/misc/exynos4210_pmu: Add support for system poweroff

 hw/arm/exynos4210.c         | 27 +++++-------------------
 hw/arm/exynos4_boards.c     | 50 ++++++++++++++++++++++++++++++++++++++-=
------
 hw/intc/exynos4210_gic.c    | 14 ++++++-------
 hw/misc/exynos4210_pmu.c    | 20 +++++++++++++++++-
 hw/timer/exynos4210_mct.c   | 50 +++++++++++++++++++--------------------=
------
 include/hw/arm/exynos4210.h |  5 +----
 6 files changed, 96 insertions(+), 70 deletions(-)

--=20
2.9.3

