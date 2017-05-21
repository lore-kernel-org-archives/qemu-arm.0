Received: by 10.103.124.15 with SMTP id x15csp1047422vsc;
        Sun, 21 May 2017 08:30:12 -0700 (PDT)
X-Received: by 10.55.106.7 with SMTP id f7mr19037272qkc.189.1495380612225;
        Sun, 21 May 2017 08:30:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1495380612; cv=none;
        d=google.com; s=arc-20160816;
        b=HM1eoNluE+G+67wW8MA+qlfKH2s+04DwSJiKHD6+OIiwkg/xPf4ac1jMmtBGB0h6cs
         dWicjMq5zkDEIbK2EDYLcH1Rt/vgZlVmPEb2SnbD8j1DYhVshBc+ifas1bsWKvlGWeP/
         CGiMq/RQjx5ytlU02fXk1KDglNwdcxJJFkwksJhv8rGxEdsBiIUsub+Zv8IPwuEDcvi5
         wTiPa2sdxyQm5REonL2kYz2NsETyIfEbiiiS7ZwBSMzlDFhVFZ7tGX0nQyMQJwkDqduq
         TzCV1GxKpqB6Odk13HqssFeZY69gVZAaCxTMeTw5mGjHjFJeQDHEcjfXXG0WQOh6oXph
         POSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dmarc-filter:arc-authentication-results;
        bh=ZNyAsvLYGwtfEAZPEZzXL2KNgn5Sq0JzTQYN0sgQvbY=;
        b=DTxIncr6fGEvjAEpRQgY8/USGUmbwJiFRGUXfvbkd37XLh5Hw8vNv4AesL/EE0ygTy
         YFOqai78HxSCv+qtE8GyBhaVqFOyaGz9L/y+Eq3WEc5SoU6O0V2hQafquII5vTwWtjQP
         q6JcOSpOCeBPukbtD18d/3QQi/24esxAelG4ovmGn2kl9zgqqmGanBezm/7/EtSULEer
         aQDXO6JNJw2FWG+QV3bWyYUtOfPHAD5YEktKqtDO/d2HWrPPl/nHcIorTocK4gFY/3Bz
         yEtLSkfGr+UZod7RTG/4suAPSo7jJwvlfvYsACyXdWjI6fMgRtVJbGCwAIvUHDLlNVPz
         twoQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y56si15409553qth.55.2017.05.21.08.30.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 21 May 2017 08:30:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:38368 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dCSo7-0002Hy-O2
	for alex.bennee@linaro.org; Sun, 21 May 2017 11:30:11 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53454)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dCSo0-0002F8-Pj
	for qemu-arm@nongnu.org; Sun, 21 May 2017 11:30:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <krzk@kernel.org>) id 1dCSnx-00076u-Lr
	for qemu-arm@nongnu.org; Sun, 21 May 2017 11:30:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:49492)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <krzk@kernel.org>)
	id 1dCSnx-000764-Gg; Sun, 21 May 2017 11:30:01 -0400
Received: from kozik-lap.dzcmts001-cpe-001.datazug.ch
	(pub082136089155.dh-hfc.datazug.ch [82.136.89.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BBF912395E;
	Sun, 21 May 2017 15:29:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BBF912395E
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=krzk@kernel.org
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Sun, 21 May 2017 17:29:38 +0200
Message-Id: <20170521152949.15338-1-krzk@kernel.org>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: [Qemu-arm] [PATCH v3 00/11] hw: arm: exynos: Bring up secondary CPU,
 QOM-ify Soc, other improvements
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
Cc: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 0ywKS30exITn


Hi,

This is a collection of three already sent patchsets [1] [2] [3].


Changes since previous versions (v2):
1. Patch 11/11: set BIT(8) in PS_HOLD to fix power off on Linux v4.12-rc1=
.
2. Add reviewed-by tags.


The first patch in set is a bugfix which also exposes problem of cpuidle.
Kernel compiled with disabled CPU_IDLE works fine (two CPUs, coming SGIs,
poweroff working) but with CPU_IDLE it behaves bad due to low-power
mode (AFTR). This was discussed at [1].

There are no external dependencies.

Patchset is also available here:
https://github.com/krzk/qemu/tree/for-next/exynos4210-gic-qom-soc-powerof=
f-v3


Best regards,
Krzysztof

[1] https://www.mail-archive.com/qemu-devel@nongnu.org/msg436902.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2017-05/msg01562.html
[3] https://lists.gnu.org/archive/html/qemu-devel/2017-05/msg01553.html


Krzysztof Kozlowski (11):
  hw/intc/exynos4210_gic: Fix GIC memory mappings for secondary CPU
  hw/intc/exynos4210_gic: Use more meaningful name for local variable
  hw/timer/exynos4210_mct: Fix checkpatch style errors
  hw/timer/exynos4210_mct: Cleanup indentation and empty new lines
  hw/timer/exynos4210_mct: Remove unused defines
  hw/arm/exynos: Move DRAM initialization next boards
  hw/arm/exynos: Declare local variables in some order
  hw/arm/exynos: QOM-ify the SoC
  hw/arm/exynos: Use type define instead of hard-coded a9mpcore_priv
    string
  hw/intc/exynos4210_gic: Constify array of combiner interrupts
  hw/misc/exynos4210_pmu: Add support for system poweroff

 hw/arm/exynos4210.c         | 43 ++++++++++++++++--------------------
 hw/arm/exynos4_boards.c     | 53 +++++++++++++++++++++++++++++++++++++++=
------
 hw/intc/exynos4210_gic.c    | 35 ++++++++++++++++++------------
 hw/misc/exynos4210_pmu.c    | 20 ++++++++++++++++-
 hw/timer/exynos4210_mct.c   | 50 ++++++++++++++++++---------------------=
---
 include/hw/arm/exynos4210.h | 11 +++++-----
 6 files changed, 132 insertions(+), 80 deletions(-)

--=20
2.9.3

