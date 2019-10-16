Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp7234046wrm;
        Wed, 16 Oct 2019 07:34:48 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzgGSznolQhkYXtneRy4H//fmA/WEcNzpJD9gXx4bh16TGQTJ1/8iWdi0O/ignjAPEKUI+e
X-Received: by 2002:a05:620a:1328:: with SMTP id p8mr39808076qkj.481.1571236488648;
        Wed, 16 Oct 2019 07:34:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571236488; cv=none;
        d=google.com; s=arc-20160816;
        b=KdYupi/hckeF7hWIIYEHhn5LynmNpMywGlBmqlq+Ya+kguV7rQ2QqjddkAejz0d3HP
         i1SW3j0PIuyBhiB745ilTo5RddwgQNztp5ZM8i4OsTOPBHHHDTKcq4sLy21aoaoLDJ+Z
         LJ3q9jDYjX9FCmdDrXpbglCyTO0WMHVpEER9evdCbqIT7h0c5c25UWSlxlu3HHBagbki
         xeZhgmTCmZB8jerXTysZcMEEPnYRrr+U/ZTXq9ZmfPdV50Hf1vXRgru+Dn/B0RVIibFa
         GlNccBNIUxTI0fbIbt8E2PcPsBEKjqvPQSmbe4+tfemAAVQr2yf61MlQtYrXe7X+rdBD
         /ICg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:to:from;
        bh=k2+oj+bi01Oywd89eBmmtwOIQeGrTTTBJmGD/EZreX0=;
        b=eY1TvYwC9z2H4CA7P2QR4q3fYoKSHL4u2O5DfKwdt0L3QKp0z7OgsOOycniZZJvhHL
         wqYmQnLdFyE9qsZWERmgqYt/ubsp/htLHHPjXAmvghl2WWbkTDwV9iSjbIhSr8i1Ge9v
         Z+zXd3McpWIygXj8MIWu1mg68LKYq7x/Pqds2LM2AHKrtYR7Txj8yC9/eRWYC3YYYavl
         db39se1soIevLbKu3hDSOlr6mOxNtcTAguuBC9JUMh+WISceZc4jHbelEAjIuI0cyFdA
         vA8Dlt7U0nFvr4KzbeCN6jvQEGCqTIY1JEAXhUuAjUJ65EDCvPFDbTQJuEOBd9GH7ub7
         WbZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v5si23065117qki.210.2019.10.16.07.34.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 07:34:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:43388 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKkNz-000567-H4
	for alex.bennee@linaro.org; Wed, 16 Oct 2019 10:34:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41661)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <drjones@redhat.com>) id 1iKkNW-00053r-Bh
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 10:34:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <drjones@redhat.com>) id 1iKkNT-0000gS-HO
 for qemu-arm@nongnu.org; Wed, 16 Oct 2019 10:34:16 -0400
Received: from mx1.redhat.com ([209.132.183.28]:55842)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <drjones@redhat.com>)
 id 1iKkNT-0000g1-9J; Wed, 16 Oct 2019 10:34:15 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id DABCF3090FE0;
 Wed, 16 Oct 2019 14:34:13 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 90FB219C68;
 Wed, 16 Oct 2019 14:34:11 +0000 (UTC)
From: Andrew Jones <drjones@redhat.com>
To: qemu-devel@nongnu.org,
	qemu-arm@nongnu.org
Subject: [PATCH v1 0/5] target/arm/kvm: Provide an option to adjust virtual
 time
Date: Wed, 16 Oct 2019 16:34:05 +0200
Message-Id: <20191016143410.5023-1-drjones@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 16 Oct 2019 14:34:13 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
 bijan.mottahedeh@oracle.com, maz@kernel.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8VNcy83kBHX3

v2:
 - move from RFC status to v1
 - put kvm_arm_vm_state_change() in kvm.c to share among kvm32.c and kvm6=
4.c
 - add r-b's from Richard


This series is inspired by a series[1] posted by Bijan Mottahedeh about
a year ago.  The problem described in the cover letter of [1] is easily
reproducible and some users would like to have the option to avoid it.
However the solution, which is to adjust the virtual counter offset each
time the VM transitions to the running state, introduces a different
problem, which is that the virtual and physical counters diverge.  As
described in the cover letter of [1] this divergence is easily observed
when comparing the output of `date` and `hwclock` after suspending the
guest, waiting a while, and then resuming it.  Because this different
problem may actually be worse for some users, unlike [1], the series
posted here makes the virtual counter offset adjustment optional and not
even enabled by default.  Besides the adjustment being optional, this
series approaches the needed changes differently to apply them in more
appropriate locations.  Finally, unlike [1], this series doesn't attempt
to measure "pause time" itself.  Simply using QEMU_CLOCK_VIRTUAL, which
only ticks when the VM is not stopped, is sufficient.

I've based this series on the SVE series[2] because we're adding a new
CPU feature (kvm-adjvtime) and the SVE series introduces CPU feature
documentation, probing, and tests that we can then immediately apply
to kvm-adjvtime.

Additional notes
----------------

Note 1
------

As described above, when running a guest with kvm-adjtime enabled it
will be less likely the guest OS and guest applications get surprise
time jumps when they use the virtual counter.  However the counter will
no longer reflect real time.  It will lag behind.  If this is a problem
then the guest can resynchronize its time from an external source or
even from its physical counter.  If the suspend/resume is done with
libvirt's virsh, and the guest is running the guest agent, then it's
also possible to use a sequence like this

 $ virsh suspend $GUEST
 $ virsh resume $GUEST
 $ virsh domtime --sync $GUEST

in order to resynchronize a guest right after the resume.  Of course
there will still be time when the clock is not right, possibly creating
confusing timestamps in logs, for example, and the guest must still be
tolerant to the time synchronizations.

Note 2
------

Userspace that wants to set KVM_REG_ARM_TIMER_CNT should beware that
the KVM register ID is not correct.  This cannot be fixed because it's
UAPI and if the UAPI headers are used then it can't be a problem.
However, if a userspace attempts to create the ID themselves from the
register's specification, then they will get KVM_REG_ARM_TIMER_CVAL
instead, as the _CNT and _CVAL definitions have their register
parameters swapped.

Note 3
------

I didn't test this with a 32-bit KVM host, but the changes to kvm32.c
are the same as kvm64.c. So what could go wrong? Test results would be
appreciated.
=20

[1] https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg05713.html
[2] https://patchew.org/QEMU/20191001125845.8793-1-drjones@redhat.com/

Thanks,
drew


Andrew Jones (5):
  target/arm/kvm64: kvm64 cpus have timer registers
  timer: arm: Introduce functions to get the host cntfrq
  target/arm/kvm: Implement cpu feature kvm-adjvtime
  tests/arm-cpu-features: Check feature default values
  target/arm/cpu: Add the kvm-adjvtime CPU property

 docs/arm-cpu-features.rst | 27 +++++++++++++++++-
 include/qemu/timer.h      | 16 +++++++++++
 target/arm/cpu.c          |  2 ++
 target/arm/cpu.h          |  3 ++
 target/arm/cpu64.c        |  1 +
 target/arm/kvm.c          | 59 +++++++++++++++++++++++++++++++++++++++
 target/arm/kvm32.c        |  3 ++
 target/arm/kvm64.c        |  4 +++
 target/arm/kvm_arm.h      | 25 +++++++++++++++++
 target/arm/monitor.c      |  1 +
 tests/arm-cpu-features.c  | 48 +++++++++++++++++++++++++------
 11 files changed, 179 insertions(+), 10 deletions(-)

--=20
2.21.0

