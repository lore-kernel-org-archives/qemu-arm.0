Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp794069lff;
        Fri, 10 Jan 2020 06:54:28 -0800 (PST)
X-Google-Smtp-Source: APXvYqx+JuzFoS00vC7zSmbh4UGcruRUxeCZTgelUePgNnQJK7SCI4MJXY4DHkLIlrSS13RGrGFE
X-Received: by 2002:a9d:6f8f:: with SMTP id h15mr2766839otq.1.1578668068268;
        Fri, 10 Jan 2020 06:54:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1578668068; cv=none;
        d=google.com; s=arc-20160816;
        b=gEt99gJt+mlGQxyAQ8H9RG4UfAxsxGvpgVZGeaCBXQdPUU5rRwFsOmSFQ/NSUhMFqP
         0li+nBpsdovhLg3p4e3KzIHdhHYhi1N1ZNKCnPP4V8Ij6UzwNdQIYMVrrmgmfTHVjKwT
         jQ5zMR2r3CfbX7y8dZ55bcGFjq+l1chWGSSaSPsHurZ53hTAzizV3y4lcNmqAvJRd6TF
         FZl3cTDGI5ohIAW+R7xuaPCgkOPFBue9RSe5VbdouMUncHsuINiMNXALw4xLr3uM/of7
         g2fgdR+3A9rB44NJNWZF3lldXF6uwEsflq1/a8rctHvmi52VEBRy2qGvuKZ1eQ6gz8xm
         FJsg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=VexdPnxBGtP4m5sD088Fr2Z7oIrl6ON5vXnTAqxCkko=;
        b=bbXP88ETBHY2BB1U+N+QMWw/Pz4lR6HMsTcFCZTsODM+N8RR1iPPsiP7mSSuhXcTMf
         zr1SNLe2vCngQeYeQLKvmIrGxM0R50qPMhdV4tSUTYgkXW5zLesL28bqD/9i7mNDJGol
         zjvg2fSCYvm/L/ZZEnjy8NlmYt4Og/tEJfL4RbBbEaxryrrfhHw5p/ylsjweLuczTK8i
         6qnTm/iFPkyJi9wskeszgUzc2N7biI2f1kCj4xS0Oigz6jvoRMc9eojtttEScJAS9mQH
         dUUyy+rMekq8Eb4I+DjNPZ5nZ7azjcMugidArZhQT77Gil3nbusUlRyxTXF/8CCBHQ0q
         Lo6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bXT8FW7W;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id 11si1538069otu.301.2020.01.10.06.54.28;
        Fri, 10 Jan 2020 06:54:28 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bXT8FW7W;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728167AbgAJOy1 (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Fri, 10 Jan 2020 09:54:27 -0500
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:48743 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728137AbgAJOy1 (ORCPT
        <rfc822;kvm@vger.kernel.org>); Fri, 10 Jan 2020 09:54:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1578668065;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=VexdPnxBGtP4m5sD088Fr2Z7oIrl6ON5vXnTAqxCkko=;
        b=bXT8FW7W23colUYzK3Tk5jCRYh4JV1zdnZ+HhZb6aK0AlOczWAO2p4qJQKg0SJw5yJIsVi
        iiFMcbAOoRArQVfDLz1T00WAPxI1c/lq+8zS9shc01xiV4+rYI22wvWxtBk0q0ah8Zi/p8
        UnWTpvsVSAJGuEzClHeCLmMIFxvPeQs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-139-R0oieHwYPCy7edteuUVVHg-1; Fri, 10 Jan 2020 09:54:22 -0500
X-MC-Unique: R0oieHwYPCy7edteuUVVHg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5A7EA801B3A;
        Fri, 10 Jan 2020 14:54:20 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-117-108.ams2.redhat.com [10.36.117.108])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A869082475;
        Fri, 10 Jan 2020 14:54:14 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v2 00/16] arm/arm64: Add ITS tests
Date:   Fri, 10 Jan 2020 15:53:56 +0100
Message-Id: <20200110145412.14937-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: mte5HQN7hogj

This series is a revival of an RFC series sent in Dec 2016 [1].
Given the amount of code and the lack of traction at that time,
I haven't respinned until now. However a recent bug found related
to the ITS migration convinced me that this work may deserve to be
respinned and enhanced.

Tests exercise main ITS commands and also test migration.
With the migration framework, we are able to trigger the
migration from guest and that is very practical actually.

What is particular with the ITS programming is that most of
the commands are passed through queues and there is real error
handling. Invalid commands are just ignored and that is not
really tester friendly.

This series includes Andre's patch: "arm: gic: Provide
per-IRQ helper functions" [2]

test_migrate_unmapped_collection is currently failing with
upstream kernel. See [3].

The series can be fount at:
https://github.com/eauger/kut/tree/its-v2

Best Regards

Eric

History:
v1 -> v2:
- took into account Zenghui's comments
- collect R-b's from Thomas

References:
[1] [kvm-unit-tests RFC 00/15] arm/arm64: add ITS framework
    https://lists.gnu.org/archive/html/qemu-devel/2016-12/msg00575.html

[2] [kvm-unit-tests PATCH 00/17] arm: gic: Test SPIs and interrupt groups
    https://patchwork.kernel.org/cover/11234975/

[3] [PATCH] KVM: arm/arm64: vgic-its: Fix restoration of unmappedxi
    collections (https://lkml.org/lkml/2019/12/13/205)

Execution:
x For ITS migration testing use:
  ./run_tests.sh -g migration (blocks on TCG)

x For other ITS tests:
  ./run_tests.sh -g its

x non migration tests can be launched invidually. For instance:
  ./arm-run arm/gic.flat -smp 8 -append 'its-trigger'

Andre Przywara (1):
  arm: gic: Provide per-IRQ helper functions

Eric Auger (15):
  libcflat: Add other size defines
  arm/arm64: gic: Introduce setup_irq() helper
  arm/arm64: gicv3: Add some re-distributor defines
  arm/arm64: ITS: Introspection tests
  arm/arm64: ITS: Test BASER
  arm/arm64: ITS: Set the LPI config and pending tables
  arm/arm64: ITS: Init the command queue
  arm/arm64: ITS: Enable/Disable LPIs at re-distributor level
  arm/arm64: ITS: its_enable_defaults
  arm/arm64: ITS: Device and collection Initialization
  arm/arm64: ITS: commands
  arm/arm64: ITS: INT functional tests
  arm/run: Allow Migration tests
  arm/arm64: ITS: migration tests
  arm/arm64: ITS: pending table migration test

 arm/Makefile.common        |   3 +-
 arm/gic.c                  | 446 ++++++++++++++++++++++++++++++++++--
 arm/run                    |   2 +-
 arm/unittests.cfg          |  39 ++++
 lib/arm/asm/gic-v3-its.h   | 177 +++++++++++++++
 lib/arm/asm/gic-v3.h       |  20 ++
 lib/arm/asm/gic.h          |  12 +
 lib/arm/gic-v3-its-cmd.c   | 453 +++++++++++++++++++++++++++++++++++++
 lib/arm/gic-v3-its.c       | 327 ++++++++++++++++++++++++++
 lib/arm/gic.c              | 132 ++++++++++-
 lib/arm/io.c               |  13 ++
 lib/arm64/asm/gic-v3-its.h |   1 +
 lib/libcflat.h             |   3 +
 13 files changed, 1600 insertions(+), 28 deletions(-)
 create mode 100644 lib/arm/asm/gic-v3-its.h
 create mode 100644 lib/arm/gic-v3-its-cmd.c
 create mode 100644 lib/arm/gic-v3-its.c
 create mode 100644 lib/arm64/asm/gic-v3-its.h

--=20
2.20.1
