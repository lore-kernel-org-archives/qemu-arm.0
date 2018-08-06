Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3009055wru;
        Mon, 6 Aug 2018 05:35:15 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpd1tS/H8AYm3BO4ze2462r72kJ1And5hEKkhHofn8p3OBqfkKZcHnJWiAEWMc4CaVFNTlvr
X-Received: by 2002:ac8:c86:: with SMTP id n6-v6mr12690128qti.324.1533558915207;
        Mon, 06 Aug 2018 05:35:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533558915; cv=none;
        d=google.com; s=arc-20160816;
        b=rKYG4gFHtQr6uR5xImtlo9aTKKBPUPqpMKMa0ePMnuwo6iiEMX5MTyMjuHVDOTM04M
         l7juQkufFP/ZsASk/icQNiBKZ1qJmq4HF+QWy1Oc5xMilQUNqoAOf/irTtR5aMrn8ulZ
         oMNJ/nLvnkZNeXLwoJYJ9yE7xxIYQKU7rQImxNrgh0WsKLYT2IRnDlunL43DI+rxfLHC
         5H22A72xh47x69SuMtTXaRAl7FO3FZcPJ7q0Gugaww+14Apb5dlrrWm3YpqVGibZCzsZ
         W1CmTB0aU5JIaEAotvwTSh4FpdgHqC7juVi90xfBLeq6fLSjK8VPfJKfNnjR2xY+bkxv
         RmIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :arc-authentication-results;
        bh=mhH4dc7LCKszQKswdEh73gWD2Wt1rnnNmYNtHYQkMo0=;
        b=sH3VBIdN4GMVShddTkSr5hgD6x/xQACdAU/GHCy41OQyScbBT9v+bog4bARgRdFjao
         oVVwFm2b0XyoVV1ndKh4me5hDAPfPQOQaCg1CrBDpY6Ox7c8IHggegPb45aOX+07JrM0
         IVTdT7tXn3sQoug2oP2aWg27eAzArnx1FP5rs5F1VUSKwBebXY30AaNh0uc6Hp1c7uiK
         UJRv9dM+dKZLuLSjMTpnuQ03ZevBp7q6dW6U1SMNbV5Onz2dM9afyw0ZkMitEqINGUkd
         d7cPl2XYxnG9YMp3eR1UzrpA6DSpHUh3TH1Vwi93BAkwqP3/EaZFhluOclxQLHIp1NQD
         hIZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n68-v6si2316870qkc.163.2018.08.06.05.35.15
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Aug 2018 05:35:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33888 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fmejC-00032X-Kb
	for alex.bennee@linaro.org; Mon, 06 Aug 2018 08:35:14 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38347)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fmeiy-00031l-Fw
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 08:35:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <pm215@archaic.org.uk>) id 1fmeix-0006cU-IG
	for qemu-arm@nongnu.org; Mon, 06 Aug 2018 08:35:00 -0400
Received: from orth.archaic.org.uk ([2001:8b0:1d0::2]:44086)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <pm215@archaic.org.uk>)
	id 1fmeix-0006ZZ-At; Mon, 06 Aug 2018 08:34:59 -0400
Received: from pm215 by orth.archaic.org.uk with local (Exim 4.89)
	(envelope-from <pm215@archaic.org.uk>)
	id 1fmein-0000wP-RU; Mon, 06 Aug 2018 13:34:49 +0100
From: Peter Maydell <peter.maydell@linaro.org>
To: qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Date: Mon,  6 Aug 2018 13:34:40 +0100
Message-Id: <20180806123445.1459-1-peter.maydell@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2001:8b0:1d0::2
Subject: [Qemu-arm] [PATCH for-3.0 v2 0/5] Arm migration fixes for 3.0
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
Cc: Shannon Zhao <zhaoshenglong@huawei.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Juan Quintela <quintela@redhat.com>,
	"Dr . David Alan Gilbert" <dgilbert@redhat.com>, patches@linaro.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4RKaIv+Da7bJ

This patchset primarily fixes problems with Arm migration
induced by a bug in the core vmstate handling of subsections:
currently the migration code incorrectly treats a subsection with
no .needed function pointer as if it was the subsection list
terminator -- it is ignored and so is everything after it.

I did an audit of all uses of subsections in QEMU, and found
that we had four which didn't define a .needed function (assuming
that this meant "always needed", same as the semantics for
not providing a .needed function for a toplevel vmsd).
This patchset fixes them all up by providing a dummy needed
function.

It also fixes an error in vmstate_gicv3_cpu which was accidentally
initializing .subsections twice and so ignoring one of the subsections.

Patches 1..3 are the same as for v1 and have been reviewed.
Patches 4 and 5 fix a further bug which I discovered during
testing of 1..3: the GICv3 migration structs had several
uses of the pre_load and post_load hooks which assumed that the
hooks were run whether the subsection was present or not. In
fact the migration code only runs the hooks when the subsection
is present in the incoming migration stream, and so for correct
behaviour we need to move the code we were running in the hooks
up to the parent VMSDs.

I've now tested this by doing a save/load of:
 2.12.0 QEMU -> new QEMU
 new QEMU -> new QEMU

An on-trunk QEMU prior to these bugfixes won't migrate
to a QEMU with the bugfixes, but we never released any
final QEMU version with the bugs in.

thanks
-- PMM

Peter Maydell (5):
  hw/intc/arm_gicv3_common: Give no-migration-shift-bug subsection a
    needed function
  hw/intc/arm_gicv3_common: Combine duplicate .subsections in
    vmstate_gicv3_cpu
  target/arm: Add dummy needed functions to M profile vmstate
    subsections
  hw/intc/arm_gicv3_common: Move post_load hooks to top-level VMSD
  hw/intc/arm_gicv3_common: Move gicd shift bug handling to
    gicv3_post_load

 hw/intc/arm_gicv3_common.c | 284 ++++++++++++++++++-------------------
 target/arm/machine.c       |   3 +
 2 files changed, 145 insertions(+), 142 deletions(-)

-- 
2.17.1

