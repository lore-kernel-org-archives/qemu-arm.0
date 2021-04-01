Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp825314lfg;
        Thu, 1 Apr 2021 13:30:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy7QVHOKmIj2Z5WSM5avXdZKnWW2+f2U+ry8QiPe5ON8ewwRyZzFndS//O/whdAIfxqM6nc
X-Received: by 2002:a05:6e02:5ab:: with SMTP id k11mr8439892ils.236.1617309004865;
        Thu, 01 Apr 2021 13:30:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1617309004; cv=none;
        d=google.com; s=arc-20160816;
        b=sko0LeCiKktKU8fLEpFluEly3PZKFAR4jDQtSrK4kK0nuwtLHLUH21HET4rezSXpaU
         NYH2KzBl2Pru7bzlBK2AQHJZYu7hj0J4+u371TqqX/75hlevxF6yvEFrGxRCzAUR6ZjV
         WbDnf8M3jQV4EqfG/buJsbwMlk8cBPTScSd8d4esus/xU51gr02bhZGP6pJjYPutigvw
         SyOs9sZ8R+++sBtgEED4k6us6tLlVIifb86o345rxYwSs9ho7fAkgjtywWGsjShbLkIX
         SEqmE42PvkeO9QrlQHi5R4vZR7mWRPrJzTX7Plq+ub5aVH8MX2MHordtNwl59iNmEv6W
         uqjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=9JcjLFS68nY7nsJBwcM9etKUAxkJcmOJVxT50ldH0TM=;
        b=YakYPrjycu1xktzqJVVxPMpB2n2EiSkcITfnOht3tSjiP5v10rLOzGYMYRwtCDUIE3
         /960tr9OcFnSjsxy/b/mNHop/NK2E2oiEKlQI/9krT47H3mNF7bIL+Kx3O9+y9vO5kNo
         9A8UJ7+Nwee6deZFzIITxtPC4RnaisSP4/COi6HP7CRScVt4KuzaH9uXHJIRq6M+uvx3
         LPHkgeJVFY6Yy3Uj+lvyC2556YI5WRIjmQ9D4FJ1C5ZfEHk5r18KxwV15QeVRqrprdOz
         rqhZWuHpkBLVm3UzKJ4yKSdn5qXJ2aHD46u8ZNfumn8Ps4+jZTqgeohCZLiD4Xr/Ddri
         tV0g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mutex.one header.s=default header.b=JEso691m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o4si5675894ilf.144.2021.04.01.13.30.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 01 Apr 2021 13:30:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mutex.one header.s=default header.b=JEso691m;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:52634 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lS3x6-0000af-4C
	for alex.bennee@linaro.org; Thu, 01 Apr 2021 16:30:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60652)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marian@mutex.one>)
 id 1lS3wu-0000Zz-Ih; Thu, 01 Apr 2021 16:29:52 -0400
Received: from mail.mutex.one ([62.77.152.124]:59956)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marian@mutex.one>)
 id 1lS3ws-0005fo-HF; Thu, 01 Apr 2021 16:29:52 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.mutex.one (Postfix) with ESMTP id 8BE88BF4059C;
 Thu,  1 Apr 2021 23:29:46 +0300 (EEST)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yr3EOOYWDrWt; Thu,  1 Apr 2021 23:29:45 +0300 (EEST)
Received: [127.0.0.1] (localhost [127.0.0.1])nknown [109.103.89.101])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mutex.one (Postfix) with ESMTPSA id 5594ABF404E3;
 Thu,  1 Apr 2021 23:29:45 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
 t=1617308985; bh=+gA+9ZBo1HGb7T9YAPVuaEzDSqI1KeS7DY0mJHuWT84=;
 h=From:To:Cc:Subject:Date:From;
 b=JEso691mQuaRGLgzfAW8pnZjjyjPzthMNmSATsgDQz4h8aUBJOG2o3jGO9mQrYFbC
 0EZL1ezNdn5W89BOXu/HK+RbBMqRTVy31QuGUHfTpbS1qiqqH/UDX62ZLuybLsdpAF
 9siQuobuIZj3rISL5SA2XdgRddOKBZf/9iiyYARA=
From: Marian Postevca <posteuca@mutex.one>
To: qemu-devel@nongnu.org
Subject: [PATCH v4 0/1] Rework ACPI OEM fields handling to simplify code (was:
 acpi: Remove duplicated code handling OEM ID and OEM table ID fields)
Date: Thu,  1 Apr 2021 23:29:27 +0300
Message-Id: <20210401202928.16082-1-posteuca@mutex.one>
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
 Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
 "Michael S . Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 Marian Postevca <posteuca@mutex.one>, Igor Mammedov <imammedo@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: fr+0+FO8yayl

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
 hw/i386/x86.c                    | 19 ++++----
 22 files changed, 188 insertions(+), 148 deletions(-)
 create mode 100644 include/hw/acpi/acpi-build-oem.h

-- 
2.26.2

