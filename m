Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp796082lfc;
        Wed, 11 Mar 2020 06:51:35 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vs1TX63PqH680SUfIi//RIh1J51atM4ugXaS0NbLdl/EZZCEIGpY10q8MxJJw40pZtYMxQ7
X-Received: by 2002:a9d:372:: with SMTP id 105mr2361537otv.15.1583934695744;
        Wed, 11 Mar 2020 06:51:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1583934695; cv=none;
        d=google.com; s=arc-20160816;
        b=DDt2eaD0uvEyF/qcCuhx1AGZhCPRVHCnSuZxyKgG+RhzWNu83e1tkMZ9h2tJnR7JAw
         RGLadyKQKhdqLHwOkOxDjABh9gHL4NrKWrMEd+h48UjQ5PGlcTVLmqTxjZ751mkbu7Uz
         ZFQDFY8FtKGpeRyZdjyOaOerJjm2dlaAVgm4o6ZYydG1cmdWJMNrih6BzthsSNzsauca
         C0ACU+FRrgdUaZq031Y94wQSWxqrthHv+3FD0YpyudbhEgoWy9fiPauosxfFs0ur42Op
         kTRYWHDq22iLoy2uJgs2K3mRIAsOTL53iHjj9yckjJ2zwRsf2H4A9FB/lh2z7TsVn5Bx
         TTpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=83Q3TmDO8jStqyv9dZqc6/YGFhze/CwItPNxto5n22I=;
        b=GuFvlipmsyPWbCxHlaGvIgjLG4zuUVYE9x2zIBdIP6SVSUt2KBZgWPaiit/y7RnEE8
         nUnO3mf92SiO9Og0rBcOg0ZznjvXrOh+y+xxS2PsAdXrCXwGiYielXEqXu5BwrDHDspX
         t1cRpkTqUusDquLGF9YqUf9EgBM+ljFdCN9Eq81SPy3J1I24yAPKqFAjeqXae61gDUw0
         mGX37irv3IBmuPl9rGetbe47vD2/7cjNlr//W8CWGtAmuRZCgJG/ffE98sv3SYlFSIhU
         NpdvEfqUH3mz+G6G7kiqy57UIFFQddWS4G0DjVaTUeqpih3mi+X4Os3UwZJc3XZWOL+8
         +6VQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cI991D0m;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id z20si1079844oib.26.2020.03.11.06.51.35;
        Wed, 11 Mar 2020 06:51:35 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cI991D0m;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729584AbgCKNve (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Wed, 11 Mar 2020 09:51:34 -0400
Received: from us-smtp-2.mimecast.com ([207.211.31.81]:51559 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1729473AbgCKNve (ORCPT
        <rfc822;kvm@vger.kernel.org>); Wed, 11 Mar 2020 09:51:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1583934693;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=83Q3TmDO8jStqyv9dZqc6/YGFhze/CwItPNxto5n22I=;
        b=cI991D0mNr2iSkOZTQq5aN8KzXxgHYjPkQWABPjgESFhZetfGCLIZb34CzpRk3v+4l7Kk8
        4FPdtxfZofvlvNvU+z6h9xSP9xjRCYLeLtVbCMx403lXZ7QFxME74YeKUnCZ+2oBUtAFFy
        JDz4PhM9WejVMJf0YwolSNDAPUL0DO0=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-415-qw9_DzRtOgStNf1O5sk2wA-1; Wed, 11 Mar 2020 09:51:29 -0400
X-MC-Unique: qw9_DzRtOgStNf1O5sk2wA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 2D1B88017CC;
        Wed, 11 Mar 2020 13:51:27 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.36.118.12])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 3E1E592983;
        Wed, 11 Mar 2020 13:51:20 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH v6 00/13] arm/arm64: Add ITS tests
Date:   Wed, 11 Mar 2020 14:51:04 +0100
Message-Id: <20200311135117.9366-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: Tj4/pdRl3KOR

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

The series can be fount at:
https://github.com/eauger/kut/tree/its-v6

Applies on top of arm/queue.

Best Regards

Eric

History:
v5 -> v6:
- Took into account Zenghui's comments, mostly functional: see invidual
  history logs
- fix wrong assert!

v4 -> v5:
- 32b stubs moved back to arm/gic.c
- some changes reordering
- minor style issues

v3 -> v4:
- addressed comments from Drew and Zenghui
- added "page_alloc: Introduce get_order()"
- removed "arm: gic: Provide per-IRQ helper functions"
- ITS files moved to lib64
- and many more, see individual logs

v2 -> v3:
- fix 32b compilation
- take into account Drew's comments (see individual diff logs)

v1 -> v2:
- took into account Zenghui's comments
- collect R-b's from Thomas

References:
[1] [kvm-unit-tests RFC 00/15] arm/arm64: add ITS framework
    https://lists.gnu.org/archive/html/qemu-devel/2016-12/msg00575.html

Execution:
x For other ITS tests:
  ./run_tests.sh -g its

x non migration tests can be launched invidually. For instance:
  ./arm-run arm/gic.flat -smp 8 -append 'its-trigger'

Eric Auger (13):
  libcflat: Add other size defines
  page_alloc: Introduce get_order()
  arm/arm64: gic: Introduce setup_irq() helper
  arm/arm64: gicv3: Add some re-distributor defines
  arm/arm64: gicv3: Set the LPI config and pending tables
  arm/arm64: ITS: Introspection tests
  arm/arm64: ITS: its_enable_defaults
  arm/arm64: ITS: Device and collection Initialization
  arm/arm64: ITS: Commands
  arm/arm64: ITS: INT functional tests
  arm/run: Allow Migration tests
  arm/arm64: ITS: migration tests
  arm/arm64: ITS: pending table migration test

 arm/Makefile.arm64         |   1 +
 arm/Makefile.common        |   2 +-
 arm/gic.c                  | 460 ++++++++++++++++++++++++++++++++++--
 arm/run                    |   2 +-
 arm/unittests.cfg          |  38 +++
 lib/alloc_page.c           |   7 +-
 lib/alloc_page.h           |   1 +
 lib/arm/asm/gic-v3-its.h   |  22 ++
 lib/arm/asm/gic-v3.h       |  29 +++
 lib/arm/asm/processor.h    |   2 +
 lib/arm/gic-v3.c           |  78 +++++++
 lib/arm/gic.c              |  34 ++-
 lib/arm/io.c               |  28 +++
 lib/arm64/asm/gic-v3-its.h | 170 ++++++++++++++
 lib/arm64/gic-v3-its-cmd.c | 464 +++++++++++++++++++++++++++++++++++++
 lib/arm64/gic-v3-its.c     | 172 ++++++++++++++
 lib/libcflat.h             |   3 +
 17 files changed, 1484 insertions(+), 29 deletions(-)
 create mode 100644 lib/arm/asm/gic-v3-its.h
 create mode 100644 lib/arm64/asm/gic-v3-its.h
 create mode 100644 lib/arm64/gic-v3-its-cmd.c
 create mode 100644 lib/arm64/gic-v3-its.c

--=20
2.20.1
