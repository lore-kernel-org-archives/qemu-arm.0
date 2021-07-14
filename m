Received: by 2002:a19:7b1b:0:0:0:0:0 with SMTP id w27csp1070906lfc;
        Wed, 14 Jul 2021 15:14:47 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzAEwDNZWt7qT34s5pKMfIFolcbWG8ND/UvTYlgmAllmq/xVa+Bb5q9ABqwlTwDRhaN1bmZ
X-Received: by 2002:ab0:492f:: with SMTP id z44mr516284uac.32.1626300887312;
        Wed, 14 Jul 2021 15:14:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1626300887; cv=none;
        d=google.com; s=arc-20160816;
        b=LToVy7z6tNV/eJ47PtUhs+MZPUrS41l8X8cTEWuouTtihYAeD1+dH0ZBfGBnfNdKFR
         6305Z1oGaf9gK/TIWrkgk9c+PM456o1SYzjP0pSvXMVSPShvIheyDPAGofuGDuLHjmWE
         xUwnVRUU5apz3V2VOEZ0IjnrhoaAzf325IaKBbrcG492aE/OazthXXKkORQdp97Mr5gW
         m3rhFPu7+5KogktJphICDnAGqNWZ7VKjxSuiiIz5HLmXOahIYqVKCJ2D/ZmfZCI2OvLc
         hceZAK6osXOxk7RH0NjdsgV/4L64IHHWAfUFT5SUmHpGMRvV6kmtgTSZ+EAiFOQdNJFc
         TNBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=9XrsnROBgBch/QEpteutRS/MNFsCr+vLMj7Shpw+t9c=;
        b=WWa+DubgyoHYZChMt1oJM+7vaTIlccDfXt8zKOuJA2j9pzewW8v/YF4FRju8MwUvFC
         ELCq15Kz32a34KyBVpPo/lgo8dFFt2h8h4SVFbBFS8mGI8rGdR8+oen0PAATMyFgSMEt
         gfpzrcfoe1cdLf5dVjlsPqSpSLFgUICAf+cpdfUVVa4lm8k1tY9Q3aAAmdTsaqqSfZyJ
         bSXhE0eFXRLmWHlPgz38ZeDSQ/HSGnANAhkSOEwAUtqvJGT9OD4DwQiadr20pj1xcGYB
         14Fx1PrQAd1trxCrkKDV8UftcXDHuo7KUZY3JUH97z4zD2H8zrkuTARzeQCLcV6oIeOX
         1IqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mutex.one header.s=default header.b=YdJcttpe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o16si4992609vss.29.2021.07.14.15.14.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 14 Jul 2021 15:14:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mutex.one header.s=default header.b=YdJcttpe;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39964 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m3n9S-0002o6-Hr
	for alex.bennee@linaro.org; Wed, 14 Jul 2021 18:14:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50460)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marian@mutex.one>)
 id 1m3n9H-0002mJ-RI; Wed, 14 Jul 2021 18:14:35 -0400
Received: from mail.mutex.one ([62.77.152.124]:35544)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marian@mutex.one>)
 id 1m3n9G-0000iI-9a; Wed, 14 Jul 2021 18:14:35 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.mutex.one (Postfix) with ESMTP id 18611BF4216D;
 Thu, 15 Jul 2021 01:14:29 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f8hvkND-OxxO; Thu, 15 Jul 2021 01:14:27 +0300 (EEST)
Received: [127.0.0.1] (localhost [127.0.0.1])nknown [79.112.1.41])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mutex.one (Postfix) with ESMTPSA id 76AE8BF40B11;
 Thu, 15 Jul 2021 01:14:27 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
 t=1626300867; bh=4khwtCY85z5PnsXMINW7nByqwNBFE9opPqtHI1TWIFU=;
 h=From:To:Cc:Subject:Date:From;
 b=YdJcttpew3/YeXiu5O06xMAU6X6e0j6uWUiY5bKozHC6FHSEz2Ya4WB9cUgIXcPOH
 kgWcJ8l2xTOqJZXkOtIzgfbtvrrpErU/ZT2aL3KTXVnY4NghWMKlf2n7G7MFvaOaFe
 LxQ4UiKSnvGjSWqWjZ2k1IkxmogBhTn//ivvYyTc=
From: Marian Postevca <posteuca@mutex.one>
To: qemu-devel@nongnu.org
Subject: [PATCH v6 0/1] Rework ACPI OEM fields handling to simplify code (was:
 acpi: Remove duplicated code handling OEM ID and OEM table ID fields)
Date: Thu, 15 Jul 2021 01:14:08 +0300
Message-Id: <20210714221409.32630-1-posteuca@mutex.one>
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
 Dongjiu Geng <gengdongjiu1@gmail.com>,
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>,
 "open list : ACPI/HEST/GHES" <qemu-arm@nongnu.org>,
 Marian Postevca <posteuca@mutex.one>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: kGcQBB2AEHsu

This patch consolidates ACPI OEM fields handling
by:
- Moving common code in PC and MICROVM to X86.
- Changes unnecessary dynamic memory allocation to static allocation
- Uses dedicated structure to keep values of fields instead of two
  separate strings
- Adds helper functions to initialize the structure

v2:
- Move the setters/getters of OEM fields to X86MachineState to
  remove duplication
- Change commit message to make it clear the second commit is
  a re-factor

v3:
- Rebase "acpi: Consolidate the handling of OEM ID and OEM
          Table ID fields to latest" to latest HEAD
- Dropped "acpi: Move setters/getters of oem fields to
           X86MachineState" since it was accepted already

v4:
- Drop helper macros and use static inline functions instead
- Removed variables starting with __
- Used consistent naming for helper functions that start with ACPI_BUILD_OEM_*
- Didn't drop the defines ACPI_BUILD_APPNAME6 and ACPI_BUILD_APPNAME8 since
  ACPI_BUILD_APPNAME8 is still used in build_header() in aml-build.c and it
  feels better to keep them defined together. But if others prefer to drop the
  ACPI_BUILD_APPNAME6 define, will resend the patch.

v5:
- Rebase on mst tree latest HEAD

v6:
- Rebase on mst tree latest HEAD
- Fixed compilation error in hw/acpi/ghes-stub.c
- Fixed coding style error by typedefing struct AcpiBuildOem

Marian Postevca (1):
  acpi: Consolidate the handling of OEM ID and OEM Table ID fields

 hw/acpi/hmat.h                   |  2 +-
 hw/i386/acpi-common.h            |  2 +-
 include/hw/acpi/acpi-build-oem.h | 61 +++++++++++++++++++++++++
 include/hw/acpi/aml-build.h      | 15 +++---
 include/hw/acpi/ghes.h           |  2 +-
 include/hw/acpi/pci.h            |  2 +-
 include/hw/acpi/vmgenid.h        |  2 +-
 include/hw/arm/virt.h            |  4 +-
 include/hw/i386/x86.h            |  4 +-
 include/hw/mem/nvdimm.h          |  4 +-
 hw/acpi/aml-build.c              | 26 +++++------
 hw/acpi/ghes-stub.c              |  1 +
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
 hw/i386/x86.c                    | 19 ++++----
 23 files changed, 189 insertions(+), 147 deletions(-)
 create mode 100644 include/hw/acpi/acpi-build-oem.h

-- 
2.31.1

