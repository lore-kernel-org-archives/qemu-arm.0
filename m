Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp4582290lff;
        Mon, 16 Dec 2019 06:03:36 -0800 (PST)
X-Google-Smtp-Source: APXvYqziPRAKV7t2XJ3FGYiSl/be70qcz3g2cxY2pAEkP+jIRgH5vNzL8/8ugGB7ebtyfLoRX7uK
X-Received: by 2002:aca:b844:: with SMTP id i65mr10018448oif.56.1576505016570;
        Mon, 16 Dec 2019 06:03:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576505016; cv=none;
        d=google.com; s=arc-20160816;
        b=oggMU2jyKpK4g9CFvIMGfPBngTGdz0Jt8WWi1Z6lsjjpyCjAMj5CjaqSgoBa2qjSCL
         NsZQ49ejEqbnatKbgTvHPc6XFr1MluqLoDh3dJyQsaSalOrNYQ4/m1NhDZOD1v32PSNS
         xxXrM5HgZa6qJl7QluPu/ZF2gBCfBQJ1Gp9s5XwNVYKZtcAz/GpDWQKT9RoVViHzVY/a
         0Zj1J7TXZ+NSkm5K9o245q+1/gyWiCfNXdDfL7JcM3muG5MTSC+PS8z4ZLnAcD66XnCy
         DooL5nu4BvVPTp3M0YKkpdwBzjXCDygNo/28gxkZeDdJUMkE4zPrSHs1JkaykX0lfh53
         bU8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=A9SY0krHFjydIQmqzREy9ABCAZgjAKMUQ2ClrNvBGYM=;
        b=H276LMkvUHhuTqf9hLIcAIDLiNHTEPIVS24K9pwke2VoAdWOMxqLClmG3t8uEfXz56
         EIn5oH4gp5i7UJDCArVFt6Y1FzvTNQnvq+aZ+RPEAuwmAQ5BiPE2xm297w2XFwUHiODa
         9YViI3DcFLEfTY0ktT3VCQj1vKubVkwBMNiCzKyNNd2NxxpDHEf8/Gwmt6go9qwl6vQg
         d1lttKN2jK1NFmGupjd6d8bmU9X8k7EvDIHm24DPw8s7ksIu9ZMVT+Hku1ShZB6EpQaQ
         7+dswq6HySmuJDmWjOpB4tiGqt6uhdplr33l9DskgS1Z/qgqCHKP89/by/nI7wddeNWj
         uPtg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Bwdnvnv/";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id t18si10467446oij.133.2019.12.16.06.03.36;
        Mon, 16 Dec 2019 06:03:36 -0800 (PST)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="Bwdnvnv/";
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728070AbfLPODf (ORCPT <rfc822;daniel.diaz@linaro.org>
        + 4 others); Mon, 16 Dec 2019 09:03:35 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:43262 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727906AbfLPODf (ORCPT <rfc822;kvm@vger.kernel.org>);
        Mon, 16 Dec 2019 09:03:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1576505014;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=A9SY0krHFjydIQmqzREy9ABCAZgjAKMUQ2ClrNvBGYM=;
        b=Bwdnvnv/tMRPue3PDfNYWJSBBNnoBsnYqXmgvVCpeGjmYlH5aiaZojBJAkIJuLGHBtD6zr
        x/ZCsekgESdwVLG8VAUoL7GfmcWhEwBrYb6yFHSwW6TIa7G9NIA4gz1nbrQhpQ+4XPtLJP
        l2JJSrgmgok3x7yp/zRx3fzxHaNEV3I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-5-KZ0hcHf3OsqMUOdqJHz5Tw-1; Mon, 16 Dec 2019 09:03:25 -0500
X-MC-Unique: KZ0hcHf3OsqMUOdqJHz5Tw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B81C9100550E;
        Mon, 16 Dec 2019 14:03:22 +0000 (UTC)
Received: from laptop.redhat.com (ovpn-116-117.ams2.redhat.com [10.36.116.117])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 60B4268860;
        Mon, 16 Dec 2019 14:03:16 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, yuzenghui@huawei.com,
        alexandru.elisei@arm.com, thuth@redhat.com
Subject: [kvm-unit-tests PATCH 00/16] arm/arm64: Add ITS tests
Date:   Mon, 16 Dec 2019 15:02:19 +0100
Message-Id: <20191216140235.10751-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: rgS3gT+tYJCa

This series is a revival of an RFC series sent in Dec 2016 [1].
Given the amount of code and the lack of traction at that time,
I haven't respinned until now. However a recent bug found around
the ITS migration convinced me that this work may deserve to be
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

The series can be fount at:
https://github.com/eauger/kut/tree/its-v1

Best Regards

Eric

[1] [kvm-unit-tests RFC 00/15] arm/arm64: add ITS framework
    https://lists.gnu.org/archive/html/qemu-devel/2016-12/msg00575.html

[2] [kvm-unit-tests PATCH 00/17] arm: gic: Test SPIs and interrupt groups
    https://patchwork.kernel.org/cover/11234975/

For ITS migration testing use:
./run_tests.sh -g migration (blocks on TCG but I think it is beyond the
scope of that series)

For other ITS tests:
./run_tests.sh -g its

non migration tests can be launched invidually. For instance:
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
 arm/gic.c                  | 447 +++++++++++++++++++++++++++++++++--
 arm/run                    |   2 +-
 arm/unittests.cfg          |  39 ++++
 lib/arm/asm/gic-v3-its.h   | 217 +++++++++++++++++
 lib/arm/asm/gic-v3.h       |  87 +++++++
 lib/arm/asm/gic.h          |  13 ++
 lib/arm/gic-v3-its-cmd.c   | 462 +++++++++++++++++++++++++++++++++++++
 lib/arm/gic-v3-its.c       | 354 ++++++++++++++++++++++++++++
 lib/arm/gic.c              | 132 ++++++++++-
 lib/arm/io.c               |  13 ++
 lib/arm64/asm/gic-v3-its.h |   1 +
 lib/libcflat.h             |   3 +
 13 files changed, 1745 insertions(+), 28 deletions(-)
 create mode 100644 lib/arm/asm/gic-v3-its.h
 create mode 100644 lib/arm/gic-v3-its-cmd.c
 create mode 100644 lib/arm/gic-v3-its.c
 create mode 100644 lib/arm64/asm/gic-v3-its.h

--=20
2.20.1
