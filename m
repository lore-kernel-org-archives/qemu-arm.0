Received: by 10.28.91.67 with SMTP id p64csp3703392wmb;
        Tue, 6 Mar 2018 04:56:21 -0800 (PST)
X-Google-Smtp-Source: AG47ELvy3oOIzzWf5+I0lxWPJpXvZ/6IoqiFd5hM6JZdNbLAJm9Mb0eZJcsf8C/StW2RULRjz4CR
X-Received: by 10.129.81.22 with SMTP id f22mr11334425ywb.77.1520340981070;
        Tue, 06 Mar 2018 04:56:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520340981; cv=none;
        d=google.com; s=arc-20160816;
        b=CKV9djLb5QoQV53hBzZuBK3sTxs7OQRtiQtaNcMiHJVGPMdokuIL14/Z01xkTRDICc
         WK/tLEXmEkn1JjZ/2C/4EqKL8TuT6e6t4/6J/dGhhyy88pMZnIiI3OlLMFwgp4toX/Aa
         eXGsM3a+uIa/uUcm14GxWq8NJMB+vkL7KqBWV/9qgNZgPq1EnLbEo3VsTLbpgGNRf5gT
         XoSnS8BJ3kTH2FGHy597QeXWkKNj1l6/Epw4kO/wKW1dxnFdqj7WK2wMo58QM7weALrQ
         PTuM7sE0keQo/LeeGbG2v2oa+R8DGxhXi/2H48llKGpGJLT2XU8WQor/B1eQOBgHiMbt
         m7Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :arc-authentication-results;
        bh=IeNAqk3slAvK6FMBH0uSSjOyZsXpZO9fZ+tCrT4NtZk=;
        b=n0jSbRq5CYedcPWSV2f09l+KxW4/4UD5+WocTR/yG17RNwijeBh4GPBqtai0T5Nb9m
         cfzH5LZqX+HDgoVVl/KxWpuEPpQwMxJ2A8PSaJx13SJrqjB97vK3MhJv+xGQ0jsOCnSI
         U4qSNQ6KF8y2JIiU6HlMCFK/HRmcjsLlqNzHCz5O1sojFMwzYtOZER9IRNcvQ/aop+iN
         rT5z1/yBJDpK3/Ai4Ibs+CF9cUwX4ZftMLWMFoivvLwLCvwuVV5HhBH/Z5WyInKqI8cD
         lgABUzDK5kiRFEA5HxKJbAcZego9zl6YOMpe5QRH6+DM6oyztTmYGUo6U5GL8W0tX6vX
         Ygmg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j85-v6si354571ybg.518.2018.03.06.04.56.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Mar 2018 04:56:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55258 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1etC8i-0000K5-DP
	for alex.bennee@linaro.org; Tue, 06 Mar 2018 07:56:20 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41368)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1etC87-0008R8-HP
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 07:55:44 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1etC86-0004u9-IX
	for qemu-arm@nongnu.org; Tue, 06 Mar 2018 07:55:43 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:46810)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1etC86-0004jX-B8; Tue, 06 Mar 2018 07:55:42 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1etC7r-0004VA-KF; Tue, 06 Mar 2018 12:55:27 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue,  6 Mar 2018 12:55:20 +0000
Message-Id: <20180306125526.27838-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.16.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH v2 0/6] arm: support -cpu max (and
 gic-version=max)
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Igor Mammedov <imammedo@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9crEdlRHo/en

This patchset adds support for '-cpu max' to Arm, along the lines
of the existing support we have for x86 targets:

 * under KVM, -cpu max is the same as -cpu host
 * under TCG, -cpu max means "emulate with as many features as
   possible"

-cpu max is supported for both usermode and system emulation,
again following the x86 line.

NB that cross-QEMU-version migration is not supported for -cpu max:
in future the definition of "maximum set of features" will change
as we add more emulation features.

The patchset also adds support to the virt board for the "max"
option to -machine gic-version, requesting "best available
interrupt controller", with the same semantics as -cpu max.

Together these should assist users like libguestfs that just want
to be able to run code without having to figure out what the
right command line arguments for this particular host system are.

The patches make 'any' a synonym for 'max', using the approach
of putting a compat hack into arm_cpu_class_by_name() that
Igor suggested. For the moment, we don't enable any of the
CPU feature bits in 'max' that aren't in the a15/a57 if we're
doing system emulation mode. This is a combination of:
 * some of those bits are currently only implemented sufficiently
   for user-only mode, not for system emulation
 * we would also need to update ID register bits to advertise the
   extra features
We should certainly do that, but I'd like to get basic -cpu max
support into 2.12, and the softfreeze deadline is rapidly approaching,
so I've opted to postpone that to post 2.12. If people have the time
to review this series this week I'd really appreciate it.

Changes since v1:
 * the "check CPU realize succeeded in virt board" patch is in master
 * the "target/arm: Make 'any' CPU just an alias for 'max'" is new,
   and unifies 'any' with 'max' as suggested in review of v1
 * the other patches are essentially unchanged

thanks
-- PMM


Peter Maydell (6):
  target/arm: Query host CPU features on-demand at instance init
  target/arm: Move definition of 'host' cpu type into cpu.c
  target/arm: Add "-cpu max" support
  target/arm: Make 'any' CPU just an alias for 'max'
  hw/arm/virt: Add "max" to the list of CPU types "virt" supports
  hw/arm/virt: Support -machine gic-version=max

 target/arm/cpu-qom.h |  2 ++
 target/arm/cpu.h     |  5 +++
 target/arm/kvm_arm.h | 35 +++++++++++++------
 hw/arm/virt.c        | 30 +++++++++++------
 target/arm/cpu.c     | 95 +++++++++++++++++++++++++++++++++++++++++++---------
 target/arm/cpu64.c   | 66 +++++++++++++++++++++++-------------
 target/arm/kvm.c     | 53 ++++++++++-------------------
 target/arm/kvm32.c   |  8 ++---
 target/arm/kvm64.c   |  8 ++---
 9 files changed, 198 insertions(+), 104 deletions(-)

-- 
2.16.2

