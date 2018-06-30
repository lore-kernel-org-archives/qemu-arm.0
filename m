Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp1611115wrq;
        Sat, 30 Jun 2018 02:20:37 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpfkDTnPrUA+jYrtRxv22H94HBxmLnlDiJIKX2a1KNkdxoQ3eMeJ9de5XVmV497OHE9G+RVz
X-Received: by 2002:a37:3106:: with SMTP id x6-v6mr16258912qkx.366.1530350437259;
        Sat, 30 Jun 2018 02:20:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530350437; cv=none;
        d=google.com; s=arc-20160816;
        b=1K9kvA4o8cGNQz1w2hwNducXoHSdD6IwHRT8ZESnV8/KwUk30Suc1k2hyAt+imTQ0i
         OA5c+815tWMErlnlpBMdPWUrPQUm7DsFZm6NoAoSWXhEiWCxFnoJUV6O+gR6ZXdnU1PF
         auPWm2+XgVSDGR7VWe74Vb/NRmjfwKkClEpfWYfWCQr4BoLKEXTm6p+WFa8p9AJ8F3Wa
         vN9LYyfZMwkEb92xWa2KJeHKvyb4G4WzPkEMCS7f/7hVKYOEub6gnIIQU3aFEscUipnZ
         49WeWWvtD6cRwnvGGYw0VhsKZkDC7f/9SnYAlePAzGvrO6HXnyyOCH8nnkFWlKrL3lsr
         uMGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=XIuY7l9WnVPIILZccNgcxHjfBYnDCvEr/OCl28KIAdk=;
        b=KoIQCoti8cV5aPI56m0JI2HRYNnZ7V7eHhVsdVH+ZXpCrwRJewYVbYSAGeHkVtMVCN
         iQEyMwpDxmXl8gymQ5+XYiRFYM3nT/5kZOiDahrM71yIxbm0u2CZBZSzDlnFbmbMd4DX
         8apCSuEb+G+Wk5G6wSuBeUb0U6d7qz0d4re/ffD+ysMTb33v6IZIwK78rohGMaXTuU4Z
         0FZC5Su2ISf6Ta9B60nzZSpe4wxJ+Ze+mmaBfPGw9458sxCG3C8q2WgPW1RD1b5cyU2Y
         6P8Y1P6/8HFTJtdDR/YTO+ON2l1hEifDbH7XXmDpeOInIh172iopIQjOIAbF/rCIOT57
         FsVg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 18-v6si3466154qks.375.2018.06.30.02.20.37
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 30 Jun 2018 02:20:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:46204 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fZC3Y-0008B5-Na
	for alex.bennee@linaro.org; Sat, 30 Jun 2018 05:20:36 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33538)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fZC3R-0008Ah-KZ
	for qemu-arm@nongnu.org; Sat, 30 Jun 2018 05:20:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <stefanha@redhat.com>) id 1fZC3O-0001cu-GC
	for qemu-arm@nongnu.org; Sat, 30 Jun 2018 05:20:29 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37592 helo=mx1.redhat.com)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <stefanha@redhat.com>)
	id 1fZC3O-0001c8-Ap; Sat, 30 Jun 2018 05:20:26 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
	[10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 49BB17DAC6;
	Sat, 30 Jun 2018 09:20:25 +0000 (UTC)
Received: from localhost (unknown [10.33.36.16])
	by smtp.corp.redhat.com (Postfix) with ESMTP id C89932026D67;
	Sat, 30 Jun 2018 09:20:23 +0000 (UTC)
From: Stefan Hajnoczi <stefanha@redhat.com>
To: <qemu-devel@nongnu.org>
Date: Sat, 30 Jun 2018 10:13:40 +0100
Message-Id: <20180630091343.14391-1-stefanha@redhat.com>
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.11.55.2]);
	Sat, 30 Jun 2018 09:20:25 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]);
	Sat, 30 Jun 2018 09:20:25 +0000 (UTC) for IP:'10.11.54.4'
	DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com'
	HELO:'smtp.corp.redhat.com' FROM:'stefanha@redhat.com' RCPT:''
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.187.233.73
Subject: [Qemu-arm] [PATCH v2 0/3] arm: add skeleton Cortex M0 CPU model
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, ilg@livius.net,
	Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>, qemu-arm@nongnu.org,
	joel@jms.id.au, Stefan Hajnoczi <stefanha@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WvMVRwUhjA5m

v2:
 * Share code between ARMv6-M and ARMv7-M [Peter]

This patch series adds a skeleton ARM Cortex M0 CPU model and an ARMv6M object
so that machine types can make use of it.

These patches cannot be merged until Julia Suvorova's Cortex M0 work is
complete, since the target/arm/ code does not implement ARMv6-M behavior
faithfully yet.

The micro:bit emulation will be the first machine type to make use of ARMv6-M.

Stefan Hajnoczi (3):
  hw/arm: extract ARM M Profile base class from ARMv7-M
  hw/arm: add ARMv6M object
  target/arm: add "cortex-m0" CPU model

 hw/arm/Makefile.objs            |   2 +
 include/hw/arm/arm-m-profile.h  |  65 +++++++++++
 include/hw/arm/arm.h            |  11 +-
 include/hw/arm/armv6m.h         |  24 ++++
 include/hw/arm/armv7m.h         |  22 +---
 hw/arm/arm-m-profile.c          | 192 ++++++++++++++++++++++++++++++++
 hw/arm/armv6m.c                 |  23 ++++
 hw/arm/armv7m.c                 | 166 ++++++---------------------
 hw/arm/mps2-tz.c                |   3 +-
 hw/arm/mps2.c                   |   4 +-
 hw/arm/msf2-soc.c               |   4 +-
 hw/arm/msf2-som.c               |   4 +-
 hw/arm/netduino2.c              |   4 +-
 hw/arm/stellaris.c              |   3 +-
 target/arm/cpu.c                |  11 ++
 default-configs/arm-softmmu.mak |   2 +
 16 files changed, 374 insertions(+), 166 deletions(-)
 create mode 100644 include/hw/arm/arm-m-profile.h
 create mode 100644 include/hw/arm/armv6m.h
 create mode 100644 hw/arm/arm-m-profile.c
 create mode 100644 hw/arm/armv6m.c

-- 
2.17.1

