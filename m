Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp3970151lfg;
        Mon, 22 Mar 2021 14:56:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyFztteHoiB0Rli2PMfa4/ymHB/PIECv0GVK67im37cxDjqQpLx/ukMQglbyLWeF394p1MB
X-Received: by 2002:a92:d6d2:: with SMTP id z18mr1961167ilp.30.1616450179903;
        Mon, 22 Mar 2021 14:56:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616450179; cv=none;
        d=google.com; s=arc-20160816;
        b=hzGRK+kVvRtbOyPW3GswaNw3JqT6KNeoEpYXAryb7QPlOo9LRmFxIkKNXiCx2uPC/r
         9hJAY6pD2kx6u3ySIai56qoleJy46l+CCsHSzb1oKpZsLcYOqk3kVjObos6rL4CdFsPp
         vFNp6eQCi1iG3p72SPVbJSFrIwro8Ksv9iXdVKwmmuKN2pdavXeRW1vaZLlIrcqgU4xF
         OFEDIhK6OZj7h6cgRLLgxFtUx3Z5n+XNceX8olKWi+Oc4cvwkhTQJAG46fL+8l3vFTn/
         DgozGrDZSA9ccI3iOw/gOO0PTa6D4sSgynh2jeIRn1MZfLq/Z+zifwbGQq8KB0MyN1hp
         7jvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from:dkim-signature;
        bh=4qGj1w/nhoROvJ5m6ERYb7kgZs3mgPQDuwoOcV0knog=;
        b=z29lO0YN+lUUUlO3dUhLyOdUwzc1jhzc1mcgf/8QBnlTsl4Y4RIjpdS9LjfPsdeQeI
         5/Ne1g67a5Cw2oifd3XiRWfc/Mp9wUQImJIKUqIf3f3eXc/AwgJVXdSysL8HVC1XLZWF
         sZjgeanXnZIAD5A45scFu4g1uzoIGAcQDOdHDYWoTFvUaQBngv16nE6YH+uYOffG52eB
         03nu1yks0sLhHRqaOtJGymwCvGUEU31cwJNrtRLzHtpNmR28//iOJvY4kJcpOT1Bs9i7
         L2eVYNjJmpwWL0TGCfdMalGxJbBhjGHIiQ0RffLOm8qg2v2RoMTVV4mB6WXTpu3g+Z2+
         3Xkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mutex.one header.s=default header.b=Fo7Wp4F2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si10404104ilv.137.2021.03.22.14.56.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 22 Mar 2021 14:56:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mutex.one header.s=default header.b=Fo7Wp4F2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:57396 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lOSX5-0003Im-7O
	for alex.bennee@linaro.org; Mon, 22 Mar 2021 17:56:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52774)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marian@mutex.one>)
 id 1lOSWr-0003IM-Cy; Mon, 22 Mar 2021 17:56:05 -0400
Received: from mail.mutex.one ([62.77.152.124]:56044)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <marian@mutex.one>)
 id 1lOSWo-0005xk-KQ; Mon, 22 Mar 2021 17:56:05 -0400
Received: from localhost (localhost.localdomain [127.0.0.1])
 by mail.mutex.one (Postfix) with ESMTP id 74FB4BF426A2;
 Mon, 22 Mar 2021 23:55:58 +0200 (EET)
X-Virus-Scanned: Debian amavisd-new at mail.mutex.one
Received: from mail.mutex.one ([127.0.0.1])
 by localhost (mail.mutex.one [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6CvHQ_3wAryT; Mon, 22 Mar 2021 23:55:57 +0200 (EET)
Received: [127.0.0.1] (localhost [127.0.0.1])nknown [79.112.115.168])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.mutex.one (Postfix) with ESMTPSA id BA2AEBF42692;
 Mon, 22 Mar 2021 23:55:56 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mutex.one; s=default;
 t=1616450156; bh=56gKa/9K+bohAh0JX6G0ndA+B07XW+dnsNawaoFpzO4=;
 h=From:To:Cc:Subject:Date:From;
 b=Fo7Wp4F2jxxjm4ZN1nAV0uPVEXTEjU1IzSivIX68sWVIJPh11Z6CSx4jE2RoMZj8D
 fLMOdmJamH7mk76AVqyyCtI8wTJ7heua+mIATBDyAxhvkkobln1N2wRRgn73gsqawp
 pZRehoQkhaSIylJd53gXa1g2xzXyitY0kGkNimyc=
From: Marian Postevca <posteuca@mutex.one>
To: qemu-devel@nongnu.org
Subject: [PATCH v3 0/1] Rework ACPI OEM fields handling to simplify code (was:
 acpi: Remove duplicated code handling OEM ID and OEM table ID fields)
Date: Mon, 22 Mar 2021 23:55:53 +0200
Message-Id: <20210322215554.24875-1-posteuca@mutex.one>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Dongjiu Geng <gengdongjiu@huawei.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 Xiang Zheng <zhengxiang9@huawei.com>, qemu-arm@nongnu.org,
 Marian Postevca <posteuca@mutex.one>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9lfQcWnxtFJx

This patch consolidates ACPI OEM fields handling=0D
by:=0D
- Moving common code in PC and MICROVM to X86.=0D
- Changes unnecessary dynamic memory allocation to static allocation=0D
- Uses dedicated structure to keep values of fields instead of two=0D
  separate strings=0D
- Adds helper macros to initialize the structure=0D
=0D
v2:=0D
- Move the setters/getters of OEM fields to X86MachineState to=0D
  remove duplication=0D
- Change commit message to make it clear the second commit is=0D
  a re-factor=0D
=0D
v3:=0D
- Rebase "acpi: Consolidate the handling of OEM ID and OEM=0D
          Table ID fields to latest" to latest HEAD=0D
- Dropped "acpi: Move setters/getters of oem fields to=0D
           X86MachineState" since it was accepted already=0D
=0D
Marian Postevca (1):=0D
  acpi: Consolidate the handling of OEM ID and OEM Table ID fields=0D
=0D
 hw/acpi/hmat.h                   |  2 +-=0D
 hw/i386/acpi-common.h            |  2 +-=0D
 include/hw/acpi/acpi-build-oem.h | 55 ++++++++++++++++++++++=0D
 include/hw/acpi/aml-build.h      | 15 +++---=0D
 include/hw/acpi/ghes.h           |  2 +-=0D
 include/hw/acpi/pci.h            |  2 +-=0D
 include/hw/acpi/vmgenid.h        |  2 +-=0D
 include/hw/arm/virt.h            |  4 +-=0D
 include/hw/i386/x86.h            |  4 +-=0D
 include/hw/mem/nvdimm.h          |  4 +-=0D
 hw/acpi/aml-build.c              | 27 ++++++-----=0D
 hw/acpi/ghes.c                   |  5 +-=0D
 hw/acpi/hmat.c                   |  4 +-=0D
 hw/acpi/nvdimm.c                 | 22 +++++----=0D
 hw/acpi/pci.c                    |  4 +-=0D
 hw/acpi/vmgenid.c                |  6 ++-=0D
 hw/arm/virt-acpi-build.c         | 40 ++++++----------=0D
 hw/arm/virt.c                    | 16 +++----=0D
 hw/i386/acpi-build.c             | 78 +++++++++++++++-----------------=0D
 hw/i386/acpi-common.c            |  4 +-=0D
 hw/i386/acpi-microvm.c           | 13 ++----=0D
 hw/i386/x86.c                    | 19 ++++----=0D
 22 files changed, 182 insertions(+), 148 deletions(-)=0D
 create mode 100644 include/hw/acpi/acpi-build-oem.h=0D
=0D
-- =0D
2.26.2=0D
=0D
