Received: by 10.223.150.237 with SMTP id u100csp4139666wrb;
        Fri, 10 Nov 2017 11:54:15 -0800 (PST)
X-Google-Smtp-Source: AGs4zMa6ZcD8oUPy1vbjJOouspIpSFtH+tD3jR2EsFJjCA3KDKokWMTH2Rsk6t/jePgaHyrl+JB9
X-Received: by 10.37.132.136 with SMTP id v8mr1037744ybk.140.1510343655555;
        Fri, 10 Nov 2017 11:54:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510343655; cv=none;
        d=google.com; s=arc-20160816;
        b=umcv1BjUSvO+9sriCbm/sj1kiflP+fbaCXsd+iUWV62yEn2HpEendk9wmw8IyikaqI
         j/7VKPDXdJBsPJLcyCb4vntcG5DI2de4ARSdBzVgd9CNMDWYpy5uEztt/4c3vm2Lc1kJ
         SBeLweTr6Ot9xVV2BXxvfoizVk/Lawyjur/5wYxqKMWvhKnKfNmu1DUAeUDy4xyreiH7
         p4myKeLRM2wzXxTOUbGcQTTVybyb6eAAfx+gNAuMipuI3xSr3NXjO79syeDH7/Cn1+Li
         oVg1ukgcXIR39iZmx8+uWG7sCr1lN2Pt0VwxhIbqaGU+04TY38rzZxo4rQqA4XBmhuKz
         hsng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:dkim-signature:arc-authentication-results;
        bh=C6vZknLSLLEC5cVJfgWXgIo+GTBXihLqO4658C+7NEE=;
        b=KiDHfIoldQPQDSJDZ6h21lwAQLJp3FHyjmpX9q93FgcUV7eTZHQBmCPQYK5B7cOdw5
         3kY4mDe9hmwNjxFSTNzJy0kELdbOzmKwX/77SN93FxlQnuqKBPbIyXIPglOuEZcXBHh4
         NnY0kLDDakQQDAzYnjaKSJSRItHI9L1FQtYxaKpbIbkdIzhavPgTK7oHhK7AcfJ8XClP
         1UsDIq5SBXAQDY1E5aLrFN9m9tCTkwMeCnsB0AhLWOOQY6nDv5VUAOPHS/rVvx5xgMgY
         tqwWacZvIn/VwffKSpL8co0NqB8eJFz6CepTwerNaXGy2Z7zW3kMB72/vIdw2QVW4vGk
         JZVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=tIMWXJTC;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=TKf4Gef6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 203si2315858ywg.542.2017.11.10.11.54.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 10 Nov 2017 11:54:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=tIMWXJTC;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=TKf4Gef6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:43241 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eDFNW-0005Z9-U2
	for alex.bennee@linaro.org; Fri, 10 Nov 2017 14:54:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47278)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eDFNA-0005Lf-3z
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 14:53:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1eDFN5-0006Av-B6
	for qemu-arm@nongnu.org; Fri, 10 Nov 2017 14:53:50 -0500
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:55303)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1eDFN5-0006AV-2k; Fri, 10 Nov 2017 14:53:47 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 5C6FB212B5;
	Fri, 10 Nov 2017 14:53:46 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
	by compute4.internal (MEProxy); Fri, 10 Nov 2017 14:53:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc; s=mesmtp; bh=C6vZknLSLLEC5cVJfgWXgIo+GTBXihLqO4658C
	+7NEE=; b=tIMWXJTCuLoHt6SmkT4xYB0e1EDo2QRmKKOfNVz5IuZjPeAuVQ6V5m
	bTDTBL590E9PECsQbEBT8VSUmOJtbxI3OBenJpiJ4H34J71m6ng8piG7RFgqwyEx
	unmURWBNCvxDZivEfPNK16WoD3UmfSyNRq4cTIlmvzcYf0OaH+L6Y=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; bh=C6vZknLSLLEC5cVJf
	gWXgIo+GTBXihLqO4658C+7NEE=; b=TKf4Gef6jpAZQ7uMxCpIPmzS6j2IfpeAu
	2691Mi2vqYAb9hi83bWc6Rr0dfZ4V/L8UHhlOLNTCZGrkMH2X+lhZAgVQWgeNwNE
	wyWTbCxfOOw6Y9RQNgLUeEr4vRqNIjROMYp1R2lcvkLz93piSWRjdKzJa2+nL2Ks
	+27LsYwV1SbsAm1UlqJvEqvF4VAzMAEEpIta9jDkzPVvD+9ePAZsDCYy4oNivjvh
	hgTcL4R8I34b1E5b/hiR6tfMylr9nufKjjW0ZemwVuba5Id8v3OIsW+SH9HRMCMh
	UIg34DcFYbCq6Rl6qsE+6+Pms5ASmFdazc0MAO58hC4Z5DWPgOhlg==
X-ME-Sender: <xms:ygMGWpRWbfGMRTbC-Y9lllFdFrj_px0t_WhIqGzub8NEZpjw7tVPkg>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 216ED7E804;
	Fri, 10 Nov 2017 14:53:46 -0500 (EST)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Fri, 10 Nov 2017 14:53:41 -0500
Message-Id: <1510343626-25861-1-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 66.111.4.28
Subject: [Qemu-arm] [PATCH for 2.11 0/5] TCG/ARM fixes for 2.11
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm@nongnu.org, Marcel Apfelbaum <marcel@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SNcI26o5TeeF

Some MachineClass changes to fix TCG initialization of some
ARM boards for 2.11. This was originally reported by Thomas Huth in [1],
where Peter suggested a way to fix it. Further discussion in
another thread [2] followed up on this.

As a result of that follow-up discussion we also got some Zynq changes from
Alistair [3], which I'm including here since in order to test them
we need the first patch in this series.

Thanks,

		Emilio

[1] https://lists.gnu.org/archive/html/qemu-devel/2017-11/msg00078.html
[2] https://lists.gnu.org/archive/html/qemu-devel/2017-11/msg00502.html
[3] https://lists.gnu.org/archive/html/qemu-devel/2017-11/msg01842.html

Alistair Francis (2):
  xlnx-zynqmp: Properly support the smp command line option
  xlnx-zcu102: Add an info message deprecating the EP108

Emilio G. Cota (3):
  qom: move CPUClass.tcg_initialize to a global
  xlnx-zcu102: Specify the max number of CPUs for the EP108
  hw: add .min_cpus and .default_cpus fields to machine_class

 qemu-doc.texi           |  7 +++++++
 include/hw/boards.h     |  5 +++++
 include/qom/cpu.h       |  1 -
 exec.c                  |  5 +++--
 hw/arm/exynos4_boards.c | 12 ++++--------
 hw/arm/raspi.c          |  2 ++
 hw/arm/xlnx-zcu102.c    |  9 ++++++++-
 hw/arm/xlnx-zynqmp.c    | 26 ++++++++++++++++----------
 vl.c                    | 21 ++++++++++++++++++---
 9 files changed, 63 insertions(+), 25 deletions(-)

-- 
2.7.4

