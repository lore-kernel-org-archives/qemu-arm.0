Received: by 10.223.159.74 with SMTP id f10csp5605146wrg;
        Thu, 7 Dec 2017 10:18:44 -0800 (PST)
X-Google-Smtp-Source: AGs4zMY7v/a9Cjnav9oJrDVVHFG9hIoa+fMnnX/+wuCLakcgj66J7Y1WKCDFcthE7ZcXicf7aD3i
X-Received: by 10.129.155.140 with SMTP id s134mr18886791ywg.500.1512670724446;
        Thu, 07 Dec 2017 10:18:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512670724; cv=none;
        d=google.com; s=arc-20160816;
        b=FOF2bwNJZTXl4i8sAbPq0WdkDZ9oDjb8EUC/OkTA+Qn8aUEJ4RZuKS2y3F1JoEZEnw
         QVVovUuqTt3DujXjQLjR8W/jBEhkCEu/+utUJWeFcmcdXTNjEg2fZKqNe+LGcrALSneJ
         kK4CP0lzTlfHrW0xhcqoJgK5lN05FZg8wvQB07JK6cHtuYGKssPJBLLEkXeA7qTfjSKf
         G9/3wTRZMcGtQR/c9EUth2IwpkHLpfoDrZUNQcfswwM/3WvNWeJL7vSJfttW18QQxFkO
         HPE1mZJ7h20xDhvUvxFGYpWLpwYT21Ni9sv2NCc2tqbefFYNEaJN0oiuTfcF3x/SQx/7
         SzUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=TO0uMxklzq2hu20ccj9B4DtSp8aAGR+aqI6NxrYd83k=;
        b=JxAjZr5zQp48Ssef8hJS+oP5g+qiTpL+ndsB3MWoxV1htNuCK/PlNtJQOjhVpZH3jp
         dXAYy2UHCMTQNMHXEzBw4WZrCLe6QjXd4xegFj06UtYHlLe2pisGYGxMZGVdQievyiZj
         f2TyovPpGPzeHf+ZLeGCgVx2Gs0/7NvKCYpuTojqKk6R9evOuKjPpOsPsVzFBOcnZSoF
         ROC+O5LNYbMCbwGBL0fl6hizz7yxQTXgxsSyVX2vGjb19CFaao0TB70odm622WUGTzyz
         WE5uqRi2FrpQgGodeEK9GKz+bw+al3X+LFOJVprnXoVADf+O+kdIX2Idt435ids5HLUy
         h0dQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l12si1217765ywl.715.2017.12.07.10.18.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 07 Dec 2017 10:18:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33740 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eN0kt-0003G0-PP
	for alex.bennee@linaro.org; Thu, 07 Dec 2017 13:18:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38832)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eN0hK-0008Fc-0H
	for qemu-arm@nongnu.org; Thu, 07 Dec 2017 13:15:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1eN0hJ-0006mz-3W
	for qemu-arm@nongnu.org; Thu, 07 Dec 2017 13:15:01 -0500
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:38888)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1eN0hI-0006li-T7; Thu, 07 Dec 2017 13:15:01 -0500
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1eN0hC-000814-Ff; Thu, 07 Dec 2017 18:14:54 +0000
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Thu,  7 Dec 2017 18:14:47 +0000
Message-Id: <1512670493-18114-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 0/6] arm: support -cpu max (and gic-version=max)
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
Cc: "Richard W . M . Jones" <rjones@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KdS8KTtLc0ot

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


Patch 1 is a bugfix, needed because now "-cpu host" without
-enable-kvm will only be detected when the CPU object fails
realize, rather than because we don't register the 'host'
CPU type at all.

(This is something that I meant to do much earlier: see
https://lists.gnu.org/archive/html/qemu-devel/2017-02/msg06183.html
but at the time we were about to freeze for 2.9, so it fell
off my immediate todo list and then I never got back to it...)

thanks
-- PMM

Peter Maydell (6):
  hw/arm/virt: Check that the CPU realize method succeeded
  target/arm: Query host CPU features on-demand at instance init
  target/arm: Move definition of 'host' cpu type into cpu.c
  target/arm: Add "-cpu max" support
  hw/arm/virt: Add "max" to the list of CPU types "virt" supports
  hw/arm/virt: Support -machine gic-version=max

 target/arm/cpu-qom.h |  2 ++
 target/arm/cpu.h     |  5 +++++
 target/arm/kvm_arm.h | 35 ++++++++++++++++++++----------
 hw/arm/virt.c        | 32 +++++++++++++++++----------
 target/arm/cpu.c     | 61 ++++++++++++++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu64.c   | 21 ++++++++++++++++++
 target/arm/kvm.c     | 51 +++++++++++++++----------------------------
 target/arm/kvm32.c   |  8 +++----
 target/arm/kvm64.c   |  8 +++----
 9 files changed, 159 insertions(+), 64 deletions(-)

-- 
2.7.4

