Received: by 10.223.172.38 with SMTP id v35csp7463713wrc;
        Tue, 12 Sep 2017 11:14:00 -0700 (PDT)
X-Google-Smtp-Source: AOwi7QBgHoTp2z18gIF0vuOSk6VIuq3t8D0+pu1bqh79vC50aQ5YIiQhKWRqqiAVvF3RP4HM8UDh
X-Received: by 10.55.72.215 with SMTP id v206mr20715418qka.92.1505240039363;
        Tue, 12 Sep 2017 11:13:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1505240039; cv=none;
        d=google.com; s=arc-20160816;
        b=Ur7L4aDDQt5f5ZvRI2lx1jqTT4r8sY7p4G/hnOSOKczDLE6az+WY3yC6xYfk64i0Vb
         Zc4BIi9b/5AxgHlg730AlPVLpz+ZWeUiyAJi5uUG00xTdwhXRZzly4iClRBHs6/nVIy0
         ZspS4T3AamRp5LtCrhslygcYCG8LGY4TsqHgF9HVlb04k4SunTgKq7opYQMAOow7ZkXd
         /MjsWcCbAVPj2EtXeYXcAhhad1u7osIDi2A75xeK/oIG92efiWH5DKOKeAhbVdUdDgiZ
         iJwYmuIfNZZVeQIahORFEjXuOjioAf6KqBwzwhyvTW/oW8yRGOKoyDGBp0AjqtkJFDMZ
         8reA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=zbso0yjuKiep3ESZFqiQIRKradVMLbiGGy80T+wTX6o=;
        b=VRHF82+j19uM0wvSwM25r8GTPvGtrddCnBWpgK0gut7Up6ohzBSAyzjJy7J997nn78
         bh9PFl92XS2fKh8NXHhPXbTGPYnizEzzqoyLTEAcpbzl9lw80DxFY9LGRTC6EENyvDdo
         dB5hf/08Elq2EDgo/wPjQ8xpjFGp/DCX9aQbEIuIvNy0n/5BfhbuYm74qWsMFCcZPtv9
         cLsC9HPei2xjQCSkDVJO/KHL8agqeeX1yqAcjgcI5nNTExKixaNvoXEICEQK69bA4o6z
         qGJpyy6W34dAEPUmHBrlWvU6v5vbbBTABLtvHWvF6koXN+XOyPAcy3DHlLRyTaa6kur2
         SjiA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d50si12977814qtk.314.2017.09.12.11.13.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Sep 2017 11:13:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37933 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1drph6-0003KJ-W6
	for alex.bennee@linaro.org; Tue, 12 Sep 2017 14:13:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43111)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drpgs-0003JI-V7
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1drpgs-0006J9-0X
	for qemu-arm@nongnu.org; Tue, 12 Sep 2017 14:13:42 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:37276)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1drpgr-0006IX-Pu; Tue, 12 Sep 2017 14:13:41 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1drpgp-00012m-JJ; Tue, 12 Sep 2017 19:13:39 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Tue, 12 Sep 2017 19:13:47 +0100
Message-Id: <1505240046-11454-1-git-send-email-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.7.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH 00/19] ARMv8M: support security extn in the NVIC
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
Cc: patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: TR5DahydhWCU

This patchset is another lump of v8M support. It mostly
covers the NVIC, which has extensive changes to handle the
fact that some exceptions are now banked. It sits on top of
the set of minor fixes that I sent out the other day.

(I have a chunk of patches that follow on from this to add
the security extension support to exception entry and exit
code, thus using the API changes made for the acknowledge
and complete functions in the last patch. They need a little
bit more baking, though, and 19 patches is enough as it is.)

Testing status: I'm pretty happy that these patches are the
right shape, but they might have minor bugs in the details.
(My uvisor test case won't currently run very far because
it wants the SG instruction.)
They shouldn't break v7M code, though, and it seems better to
me to move things into master and bugfix them later if necessary
rather than hold onto an enormous stack of patches that's
unreviewably large.

thanks
-- PMM

Peter Maydell (19):
  target/arm: Implement MSR/MRS access to NS banked registers
  nvic: Add banked exception states
  nvic: Add cached vectpending_is_s_banked state
  nvic: Add cached vectpending_prio state
  nvic: Implement AIRCR changes for v8M
  nvic: Make ICSR.RETTOBASE handle banked exceptions
  nvic: Implement NVIC_ITNS<n> registers
  nvic: Handle banked exceptions in nvic_recompute_state()
  nvic: Make set_pending and clear_pending take a secure parameter
  nvic: Make SHPR registers banked
  nvic: Compare group priority for escalation to HF
  nvic: In escalation to HardFault, support HF not being priority -1
  nvic: Implement v8M changes to fixed priority exceptions
  nvic: Disable the non-secure HardFault if AIRCR.BFHFNMINS is clear
  nvic: Handle v8M changes in nvic_exec_prio()
  target/arm: Handle banking in negative-execution-priority check in
    cpu_mmu_index()
  nvic: Make ICSR banked for v8M
  nvic: Make SHCSR banked for v8M
  nvic: Support banked exceptions in acknowledge and complete

 include/hw/intc/armv7m_nvic.h |  33 +-
 target/arm/cpu.h              |  62 ++-
 hw/intc/armv7m_nvic.c         | 909 +++++++++++++++++++++++++++++++++++-------
 target/arm/cpu.c              |   7 +
 target/arm/helper.c           | 142 ++++++-
 hw/intc/trace-events          |  13 +-
 6 files changed, 996 insertions(+), 170 deletions(-)

-- 
2.7.4

