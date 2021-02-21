Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp663383lfc;
        Sat, 20 Feb 2021 16:19:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwv6GV4xmKhQwRwzNq5O5YcmGOcBweqFbURirF3ksejvbufuZC1ks7mvSU33ra/PdHIpTix
X-Received: by 2002:a25:40d8:: with SMTP id n207mr23313226yba.3.1613866751245;
        Sat, 20 Feb 2021 16:19:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613866751; cv=none;
        d=google.com; s=arc-20160816;
        b=sLIEqTQPn/azkwUE64dE94Y0bhwAofodFD1Gj42UJt2wPo8NYGxiBeWkB/5LhEfOzZ
         z7NCsErU6DUanJ6YePunq/70M8vbKxvirNz2NyIrSvLxIEdtZKO1gtfKr/OWjM++BK0Z
         jUtV/87qXHis2CwCy2sqwy5yufR43BZcdwVmrzxbPVOzpBEyCA8wShECsRVTryl2Cs6I
         3TlMFBRxItqGthCXUr0W9dpMrDlO9ktUehvRVxvZV32Lj19DMZabT5zx1yeJDHWHpHH/
         5m8y9krRekzS8+sLs5H01gSt8RCFUm151/Hlk1sVT/VwW1ldKgSReegVe03nPDiaY45L
         P3aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=P+zyz8xUQUfDfdgSd20/FDMTIEE71ZnOnAK2JF7iF6Q=;
        b=QOlgnphcsMCeC22v12WV2mPFQXP9FS8DmW0wybwqCOHM0ULjstZreznvY2ghO0bBLL
         ie5e9zXyJyytPiXQvn7r/2JYPMseH6EHeTGdlwRSNgD8f0EqMrYtmAOqg9zclNB7IIDx
         FJE3sVA0AuZdk78jEBO3dKsYyi2ZndYCdFY4pX3oYn6j3JUGgZlcqBXqziLZnTB3dHTZ
         4Njh6u6G0XrL2rWOjosu3X3QBl1bsAwV/8vGZueBQlBGNT8pBmeEXtU499NSn6bYHQGa
         rVp3TlvZGgA7VhB/Ah5yQ14jPVjS3C8FwyXdV2xehk4MzlxWq5i6ML5r+LF7Pmcj7BBR
         6T/Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mutex.one header.s=default header.b=grtqjDgG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t6si15507690ybl.360.2021.02.20.16.19.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 20 Feb 2021 16:19:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mutex.one header.s=default header.b=grtqjDgG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lDcSs-0001jc-Ls
	for alex.bennee@linaro.org; Sat, 20 Feb 2021 19:19:10 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:60744)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marian@mutex.one>)
 id 1lDcSl-0001j4-OF; Sat, 20 Feb 2021 19:19:03 -0500
Received: from mail.mutex.one ([62.77.152.124]:51100)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marian@mutex.one>)
 id 1lDcSj-0004mh-1Y; Sat, 20 Feb 2021 19:19:03 -0500
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.mutex.one (Postfix) with ESMTP id 29A1DBF4418C;
 Sun, 21 Feb 2021 02:18:56 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9IX3g2YofLiI; Sun, 21 Feb 2021 02:18:54 +0200 (EET)
Received: [127.0.0.1] (localhost [127.0.0.1])nknown [109.103.89.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mutex.one (Postfix) with ESMTPSA id 047DDBF4417C;
 Sun, 21 Feb 2021 02:18:53 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
 t=1613866734; bh=3WPWotBqLZCn+wFHpFjW8Z1e/+ZITf1YaWpg/LRKpgw=;
 h=From:To:Cc:Subject:Date:From;
 b=grtqjDgGsJl2ZmmPo6KcntCjf01arCovRyWO6gHDYR9Y4uzBGSchm4mqEsglNa5X9
 zhaweBphQmj2bCNJ+8XBKsRzZnX2wUAfigEjBzqE589NJK9dy7BNikoF8ToCgCKGQ4
 hXsKoyX8jWpkNoCyHvNbI7zeXV4Ndj+S1iXndDhM=
From: Marian Postevca <posteuca@mutex.one>
To: qemu-devel@nongnu.org
Subject: [PATCH v2 0/2] Rework ACPI OEM fields handling to simplify code (was:
 acpi: Remove duplicated code handling OEM ID and OEM table ID fields)
Date: Sun, 21 Feb 2021 02:17:35 +0200
Message-Id: <20210221001737.24499-1-posteuca@mutex.one>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=62.77.152.124; envelope-from=marian@mutex.one;
 helo=mail.mutex.one
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>, Sergio Lopez <slp@redhat.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>,
 "open list : ACPI/HEST/GHES" <qemu-arm@nongnu.org>,
 Marian Postevca <posteuca@mutex.one>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TPegKMnexYpK

This patch series consolidates ACPI OEM fields handling
by:
- Moving common code in PC and MICROVM to X86.
- Changes unnecessary dynamic memory allocation to static allocation
- Uses dedicated structure to keep values of fields instead of two
  separate strings
- Adds helper macros to initialize the structure

v2:
- Move the setters/getters of OEM fields to X86MachineState to
  remove duplication
- Change commit message to make it clear the second commit is 
  a re-factor

Marian Postevca (2):
  acpi: Move setters/getters of oem fields to X86MachineState
  acpi: Consolidate the handling of OEM ID and OEM Table ID fields

 hw/acpi/hmat.h                   |  2 +-
 hw/i386/acpi-common.h            |  2 +-
 include/hw/acpi/acpi-build-oem.h | 55 ++++++++++++++++++++++
 include/hw/acpi/aml-build.h      | 16 +++----
 include/hw/acpi/ghes.h           |  2 +-
 include/hw/acpi/pci.h            |  2 +-
 include/hw/acpi/vmgenid.h        |  2 +-
 include/hw/arm/virt.h            |  4 +-
 include/hw/i386/microvm.h        |  4 --
 include/hw/i386/pc.h             |  4 --
 include/hw/i386/x86.h            |  4 ++
 include/hw/mem/nvdimm.h          |  4 +-
 hw/acpi/aml-build.c              | 27 ++++++-----
 hw/acpi/ghes.c                   |  5 +-
 hw/acpi/hmat.c                   |  4 +-
 hw/acpi/nvdimm.c                 | 22 +++++----
 hw/acpi/pci.c                    |  4 +-
 hw/acpi/vmgenid.c                |  6 ++-
 hw/arm/virt-acpi-build.c         | 40 ++++++----------
 hw/arm/virt.c                    | 16 +++----
 hw/i386/acpi-build.c             | 78 +++++++++++++++-----------------
 hw/i386/acpi-common.c            |  4 +-
 hw/i386/acpi-microvm.c           | 13 ++----
 hw/i386/microvm.c                | 66 ---------------------------
 hw/i386/pc.c                     | 63 --------------------------
 hw/i386/x86.c                    | 61 +++++++++++++++++++++++++
 26 files changed, 237 insertions(+), 273 deletions(-)
 create mode 100644 include/hw/acpi/acpi-build-oem.h

-- 
2.26.2

