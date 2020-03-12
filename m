Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp798447lfc;
        Thu, 12 Mar 2020 08:43:19 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtXNzmtj4IrhulIOIL4hBZXFLQau9baiCyqnEPvqdK+uUgBeUK70xM7QHSIXZTSYDisrEkZ
X-Received: by 2002:a05:6830:150f:: with SMTP id k15mr6360687otp.251.1584027799664;
        Thu, 12 Mar 2020 08:43:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584027799; cv=none;
        d=google.com; s=arc-20160816;
        b=dh3wbp82C/7kFiVGiU2PZjaN3/0+w/oN0By+aOeSk55bzBOVVu6axG04yCVFt8oCbN
         silnjwhNZrwD8dAz7yHFjM0w9aOB8ZOeArVCSaNZ7nrIRxsbl3Nc4u453+9o+/Fu0fQ6
         VXovmt1LVuDbLDQa0TbU63ZKZ0l4REwIZIhMruMbi3LI6tNlehPDrMFfibC76lNe5JR1
         6QtlrXw+ORIZ/dlhaKSOg0/uojlCcBA127EgAJyOvasGFfp1cToj72j8wu2cacAhM0FU
         HAB+2WRcXmDTHCZQv14RWTVG/j43Q3su0U0CzzNZDQWQVhwiakgPvgnYgDV+OMPDXiz8
         RzMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :message-id:date:subject:cc:to:from:dkim-signature;
        bh=k8jp38U+HDvwVpi2WnHkpfG6zGk4onx+M144s/vtKiI=;
        b=ic7+w0HqFR2Y9TV72uhNuM1L3bvfbA50hTcWYuOY7uW/OJZEzaK/tOWkF4kjD3AI00
         OEk0XCYoYfi11MUHYM8id+WlAxrLHGbYVKVeWV2Smp1bcZ0HjMbCzfCTm+YCdFr4iIfB
         ovkUCzSRJGkvKqffTcmHDsnG6dx/Kq8fF0MI9kejU9qeTLgd4l4xONU7WeO6BuO1jofl
         lvWiKa46rSqM/DYZ7O5UVCZu+YuUj68HdrbJn7wS/ivAfu1NhnSpILa5nq744wEKzeXJ
         7Oacf3BnO2/bSkKmtw1id/5G8EX3T/q6HfqQCI23+I2Gqdvg213x7FuyEfMFXAf9lXN9
         QCSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iirH38Jh;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [209.132.180.67])
        by mx.google.com with ESMTP id c21si2835424oto.137.2020.03.12.08.43.19;
        Thu, 12 Mar 2020 08:43:19 -0700 (PDT)
Received-SPF: pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) client-ip=209.132.180.67;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=iirH38Jh;
       spf=pass (google.com: best guess record for domain of kvm-owner@vger.kernel.org designates 209.132.180.67 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727572AbgCLPnS (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Thu, 12 Mar 2020 11:43:18 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:37101 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727240AbgCLPnS (ORCPT
        <rfc822;kvm@vger.kernel.org>); Thu, 12 Mar 2020 11:43:18 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1584027797;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=k8jp38U+HDvwVpi2WnHkpfG6zGk4onx+M144s/vtKiI=;
        b=iirH38JhnNzhZ8WP5D8RSNJG4qLiA6B2kFWCcqq1DZMg4U1YqfU+f7Fbij0Ani09wd7zOD
        jOePZRszJf3nBZsyhjfXywWvn81YOaKwPhGYnHkXVpq9eJP05j3bedUUZbTvxkjclSN0H2
        zbJfMdl2H2jK/6o6bs+XhKPvjfXAyGU=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-132-AgtgHoGHMx-x1j5WkGYSMg-1; Thu, 12 Mar 2020 11:43:13 -0400
X-MC-Unique: AgtgHoGHMx-x1j5WkGYSMg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 0F68A1005509;
        Thu, 12 Mar 2020 15:43:12 +0000 (UTC)
Received: from laptop.redhat.com (unknown [10.36.118.12])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 264325C1B5;
        Thu, 12 Mar 2020 15:43:03 +0000 (UTC)
From:   Eric Auger <eric.auger@redhat.com>
To:     eric.auger.pro@gmail.com, eric.auger@redhat.com, maz@kernel.org,
        kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
        qemu-devel@nongnu.org, qemu-arm@nongnu.org
Cc:     drjones@redhat.com, andrew.murray@arm.com, andre.przywara@arm.com,
        peter.maydell@linaro.org, alexandru.elisei@arm.com
Subject: [kvm-unit-tests PATCH v3 00/12] KVM: arm64: PMUv3 Event Counter Tests
Date:   Thu, 12 Mar 2020 16:42:49 +0100
Message-Id: <20200312154301.9130-1-eric.auger@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: vQM996pMaA0p

This series implements tests exercising the PMUv3 event counters.
It tests both the 32-bit and 64-bit versions. Overflow interrupts
also are checked. Those tests only are written for arm64.

It allowed to reveal some issues related to SW_INCR implementation
(esp. related to 64-bit implementation), some problems related to
32-bit <-> 64-bit transitions and consistency of enabled states
of odd and event counters. Fixes now are upstream.

Drew kindly provided "arm64: Provide read/write_sysreg_s".

All PMU tests can be launched with:
./run_tests.sh -g pmu
Tests also can be launched individually. For example:
./arm-run arm/pmu.flat -append 'pmu-chained-sw-incr'

With KVM:
- On TX2, I have some random failures due to MEM_ACCESS event
  measured with a great disparity. This is not observed on
  other machines I have access to.

The series can be found at:
https://github.com/eauger/kut/tree/pmu_event_counters_v3

History:

v2 -> v3:
- Took into account numerous comments from Drew
- Applied Andre's R-b when code has not changed too much
- Don't check PMCR.IMP anymore
- better handling of version
- put simple SW_INCR tests for easier TCG testing

v1 -> v2:
- Took into account Andre's comments except I did not
  use cnbz in the mem_access_loop() and I did not use
  @loop directly. Those changes had side effects I
  cannot explain on the tests. Anyway I think this can
  be improved later on.
- removed [kvm-unit-tests PATCH 09/10] arm/arm64: gic:
  Introduce setup_irq() helper

RFC -> v1:
- Use new report() proto
- Style cleanup
- do not warn about ARM spec recommendations
- add a comment about PMCEID0/1 splits

Andrew Jones (1):
  arm64: Provide read/write_sysreg_s

Eric Auger (11):
  arm: pmu: Let pmu tests take a sub-test parameter
  arm: pmu: Don't check PMCR.IMP anymore
  arm: pmu: Add a pmu struct
  arm: pmu: Introduce defines for PMU versions
  arm: pmu: Check Required Event Support
  arm: pmu: Basic event counter Tests
  arm: pmu: Test SW_INCR event count
  arm: pmu: Test chained counters
  arm: pmu: test 32-bit <-> 64-bit transitions
  arm: gic: Introduce gic_irq_set_clr_enable() helper
  arm: pmu: Test overflow interrupts

 arm/pmu.c              | 839 +++++++++++++++++++++++++++++++++++++++--
 arm/unittests.cfg      |  61 ++-
 lib/arm/asm/gic.h      |   4 +
 lib/arm/gic.c          |  31 ++
 lib/arm64/asm/sysreg.h |  17 +
 lib/bitops.h           |   3 +
 6 files changed, 918 insertions(+), 37 deletions(-)

--=20
2.20.1
