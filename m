Received: by 2002:a17:907:c9e:b0:a27:13b6:eed5 with SMTP id gi30csp1548141ejc;
        Thu, 28 Dec 2023 06:25:09 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEzIjCqjnvT8g9l8U4n/mdDh1b6berhzFwd6g3dQpJB19h7m1YWMRqfaUE9z722C2N6vALF
X-Received: by 2002:ad4:5b8b:0:b0:67f:6a10:aa1a with SMTP id 11-20020ad45b8b000000b0067f6a10aa1amr14174050qvp.86.1703773508478;
        Thu, 28 Dec 2023 06:25:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1703773508; cv=none;
        d=google.com; s=arc-20160816;
        b=jIRIuQMqfH1OO7paSLRflFaqMeAzUzRrgMF2QQXkzAfOREZwT8RHY+h/cTsOI1qQZx
         bROeJR/r1hvUVATK46QYBV9Qi2NDNtlGqo1cEj8UoOcLDTldxzWhuwwpmFc2t7W1Y1Jx
         26nS7c0kLlu3FkbqkHCETdUAErV+qi0xr80JTVO/irbWP39Iqnm1vw1crGjrydAy0VEW
         z2aW5Z/XI3nOXF7jbvWlr9fX9vY9qQjTrY9DpLi/1ZJazAnvoGZ9xU7+FU65A5l86iDV
         dIhOWfmhJM32EyKp94RFfOkX7l2rpbM4lQHNoLk6Fd1XwSO+cs1Le4POFmXPeN/CEcOG
         EZlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from;
        bh=6YeBpVUmWEVKIfmozkfv+ukIGSVTnm0w+5IheQ6AxuE=;
        fh=QbF/X0wJM1LtslEumBv3OBX7H1r/o++Lq4nWqCNLPUU=;
        b=VAqc964jYGHwgNJIUGWosavbx/cgGuf5azync4w2Jcb/+LXl/asY4SntEWWvRAzvFT
         rsixk8YxcaZ1ccLSl8DgMC8vXZd2Eyt9//cTkCSsfaR+P5D3NjgVjlxkga9wkEA/TRrf
         2SI3xYPP1HGtuioN+H1/bNhfmCNknihPVyrRd2/XkhZMr6HXbocFZWiLE1st+l9anbPf
         IuIZWSS+XAQnIw46+UUtGoPp1IZ++LFz12ylfe2n5WNPbJTKC64O4HtqgH4eWKjk8ko5
         4jnLUj7X29XJk5ROGK+zh2/buU5uKAD7qG5OEkCQnvB2bAmzWdvy+/JAof59aElwM+Ei
         2iDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10-20020a0cf14a000000b0067f9703900csi14050094qvl.375.2023.12.28.06.25.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Dec 2023 06:25:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rIrJI-00042P-H8; Thu, 28 Dec 2023 09:24:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1rIlPw-0004RD-FY; Thu, 28 Dec 2023 03:07:00 -0500
Received: from fd01.gateway.ufhost.com ([61.152.239.71])
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <jeeheng.sia@starfivetech.com>)
 id 1rIlPu-0002CC-Ox; Thu, 28 Dec 2023 03:07:00 -0500
Received: from EXMBX166.cuchost.com (unknown [175.102.18.54])
 (using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
 (Client CN "EXMBX166", Issuer "EXMBX166" (not verified))
 by fd01.gateway.ufhost.com (Postfix) with ESMTP id B34BE8008;
 Thu, 28 Dec 2023 16:06:24 +0800 (CST)
Received: from EXMBX066.cuchost.com (172.16.7.66) by EXMBX166.cuchost.com
 (172.16.6.76) with Microsoft SMTP Server (TLS) id 15.0.1497.42; Thu, 28 Dec
 2023 16:06:24 +0800
Received: from jsia-virtual-machine.localdomain (175.136.135.142) by
 EXMBX066.cuchost.com (172.16.6.66) with Microsoft SMTP Server (TLS) id
 15.0.1497.42; Thu, 28 Dec 2023 16:06:19 +0800
From: Sia Jee Heng <jeeheng.sia@starfivetech.com>
To: <qemu-arm@nongnu.org>, <qemu-devel@nongnu.org>, <qemu-riscv@nongnu.org>
CC: <mst@redhat.com>, <imammedo@redhat.com>, <anisinha@redhat.com>,
 <peter.maydell@linaro.org>, <jeeheng.sia@starfivetech.com>,
 <shannon.zhaosl@gmail.com>, <sunilvl@ventanamicro.com>, <palmer@dabbelt.com>, 
 <alistair.francis@wdc.com>, <bin.meng@windriver.com>, <liwei1518@gmail.com>,
 <dbarboza@ventanamicro.com>, <zhiwei_liu@linux.alibaba.com>
Subject: [RFC v1 0/2] RISC-V: ACPI: Enable SPCR
Date: Thu, 28 Dec 2023 16:06:14 +0800
Message-ID: <20231228080616.158822-1-jeeheng.sia@starfivetech.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [175.136.135.142]
X-ClientProxiedBy: EXCAS062.cuchost.com (172.16.6.22) To EXMBX066.cuchost.com
 (172.16.6.66)
X-YovoleRuleAgent: yovoleflag
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=61.152.239.71;
 envelope-from=jeeheng.sia@starfivetech.com; helo=fd01.gateway.ufhost.com
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_PASS=-0.001,
 SPF_PASS=-0.001, T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-Mailman-Approved-At: Thu, 28 Dec 2023 09:24:30 -0500
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: hxnulEc6kTCT

This series focuses on enabling the Serial Port Console Redirection (SPCR=
)
table for the RISC-V virt platform. Considering that ARM utilizes the sam=
e
function, the initial patch involves migrating the build_spcr function to
common code. This consolidation ensures that RISC-V avoids duplicating th=
e
function.

The patch set is built upon Alistair's riscv-to-apply.next branch and
relies on Sunil's patches at [1].

[1] https://lore.kernel.org/qemu-devel/20231218150247.466427-1-sunilvl@ve=
ntanamicro.com/

Sia Jee Heng (2):
  hw/arm/virt-acpi-build.c: Migrate SPCR creation to common location
  hw/riscv/virt-acpi-build.c: Generate SPCR table

 hw/acpi/aml-build.c         | 51 ++++++++++++++++++++++++++++
 hw/arm/virt-acpi-build.c    | 68 +++++++++++++++----------------------
 hw/riscv/virt-acpi-build.c  | 39 +++++++++++++++++++++
 include/hw/acpi/acpi-defs.h | 33 ++++++++++++++++++
 include/hw/acpi/aml-build.h |  4 +++
 5 files changed, 154 insertions(+), 41 deletions(-)

--=20
2.34.1

