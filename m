Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3130523wrt;
        Thu, 18 Oct 2018 18:44:30 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60XrtXo4AWOZ+zDj8oiEavUBuTsVG5vA9m7agg8Vg9Cn3x5vqf+wPMSZN4q3bhc+4DH9rBV
X-Received: by 2002:a37:e114:: with SMTP id c20-v6mr30852336qkm.75.1539913470492;
        Thu, 18 Oct 2018 18:44:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539913470; cv=none;
        d=google.com; s=arc-20160816;
        b=vF3zdxxYWdSVif+vQuuHShPT7nzrHUEIRBOrBg7LNQ+//f6X/Xhs5PnGZXiiY9gmKK
         cX0iTQxlBxaLHiZxti0fmCcA+TrH3G1JwOiVmZJUQ9e4bZFWzdln5hZYGb9iUlAZzazM
         6pj8nxn/ijv1+fuONdsTwK5B6NBLZleSBrVr/OU3FDIFrJjw5IHeOaMtz7fPVAmg2Qmy
         Jn0Ejo1xNb7c329LPsDtGR02JCeItdXmrfVR3D9P1R8KzbykYugbLtjSaNgBDz9JJwPe
         wtYi9otEEr5OzcYqUxiaIr8+jw3GAS+GuJ9Erdsks++9SphXabEaht0Zk3tCDhAmpPOB
         rYpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:dkim-signature;
        bh=HbKb0pJ76rCWLu1WB1iyeYXI3ROCCC4O1l+taoQSHVo=;
        b=kZWmzJNeh7i1EGtveZtptIDoASfEICfT7Ea++CXwsWejJ/V05inh85TKhiYCNN5qQO
         DoBeq82WS2/B49IXRWZ7sKobQYRNXAwOiQaczl2BJESt9lKatY7RhriZmTmtTpXORnwv
         oCiQhow2O9A+Kud92/2tZ65UU9h7GgiZsY2dp6RKAnHtf1Ep61CXxzi2MIUEzOKJXNNU
         4I+fnytQbBf58mPae28FenGjwJibygsY9cSWQfG3/04+b73RW7cXjlzLqeRW3nXi53p8
         qs49rDj6BcIuHn6kP1visg965UByplHn3i/lW2TX4znbQ4RNNsx2LIg4CdxaYfYMNANP
         xuhA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=AsUM6q0m;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=P8deeZIa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f12-v6si9380911qth.324.2018.10.18.18.44.30
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 18 Oct 2018 18:44:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=AsUM6q0m;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=P8deeZIa;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:46104 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDJq1-0004pg-VE
	for alex.bennee@linaro.org; Thu, 18 Oct 2018 21:44:29 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59639)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gDJGJ-0005MY-1L
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 21:07:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1gDJG4-0003fW-8V
	for qemu-arm@nongnu.org; Thu, 18 Oct 2018 21:07:27 -0400
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:56941)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1gDJG0-0002lS-R5; Thu, 18 Oct 2018 21:07:18 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 71FD022959;
	Thu, 18 Oct 2018 21:06:29 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
	by compute4.internal (MEProxy); Thu, 18 Oct 2018 21:06:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	from:to:cc:subject:date:message-id; s=mesmtp; bh=HbKb0pJ76rCWLu1
	WB1iyeYXI3ROCCC4O1l+taoQSHVo=; b=AsUM6q0mVYPNG8ZG5W2s/natuplmMRJ
	+FCwl0ksgG4EzDiwa/M/7AMrpBvD5Iv8yxz2qkmp5PQbmk/NOXMR0quVJ7s3RMs6
	nA+UzNSUNx332ox6ety2fhczgAKAY6bEjIdejJep/Nh7g0OvI+xaMjBAa6OwXnGH
	l+5XhJhpIaNI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=HbKb0pJ76rCWLu1WB1iyeYXI3ROCCC4O1l+taoQSHVo=; b=P8deeZIa
	HeULIRXNKlMUi9h92XS1C5IUf0Hqn2TIz64F6Dw0sHvkKu0s0JG1LkyQM13oip9y
	46+uABy9sfzxg6OMKpkO96K0QUzlcuEfkzo8NKVfA0FgR4aowaYEWh0CnwoRPfDK
	ZHmImxq/DTuLMi+AyWI8Qg0ysOZb3VrszVkLp/VCKoG3byEq/stuKora3UutmaRU
	W/iGHpv/FLI8iymGfT9aYdQ3QLzFCZtCCoWZPHAhx9t2yRR7QxIKFFEWWBru6CoT
	hJowZ5WLHd7PG96jOq/YwF4Og7U8S0orpM77ZLLPSR8OGN6FPgNWGAuLDAzvOvdf
	J2StFsHOY3h0mw==
X-ME-Sender: <xms:Ei7JW6lovua_0KuUtbTdIFwmUVeIgmYtvOo26xAIhAZpGz-vlFRPFg>
X-ME-Proxy: <xmx:Ei7JW4K-lN307J5-llU2RvJKDVKkg08_OuA11E_PzotrXJlz90AIEA>
	<xmx:Ei7JW7BL4UUGPa74euw4B_j9dwY-UBIjzC6RvL4C0n9p0oLhHmySqQ>
	<xmx:Ei7JW5j5oHIdTV98Bl_Mfw7I56T3MHQkLj4ow9_tyjEldsmq0UiaNw>
	<xmx:Ei7JW3OrpYh5cc1y6XeKACD9fjUsBHNu4bKL1aHnR9UHT_MkrEZEug>
	<xmx:Ei7JW9WEhGu2aP0sJjVql4kWmdZwAQcbDXaSTJB92djlLTcFrCi-Zw>
	<xmx:FS7JWwfSSpTzGVPWNupa9Uc0ExYhGuZn7WP9bh_ddSpCWOOXeE-_Lw>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 7B51D102E9;
	Thu, 18 Oct 2018 21:06:26 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Thu, 18 Oct 2018 21:05:29 -0400
Message-Id: <20181019010625.25294-1-cota@braap.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.29
Subject: [Qemu-arm] [RFC v3 0/56] per-CPU locks
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
	Sagar Karandikar <sagark@eecs.berkeley.edu>,
	David Hildenbrand <david@redhat.com>, James Hogan <jhogan@kernel.org>,
	Anthony Green <green@moxielogic.com>, Palmer Dabbelt <palmer@sifive.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Max Filippov <jcmvbkbc@gmail.com>, Michael Clark <mjc@sifive.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
	Alexander Graf <agraf@suse.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Pavel Dovgalyuk <dovgaluk@ispras.ru>, Richard Henderson <rth@twiddle.net>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Fabien Chouteau <chouteau@adacore.com>, qemu-s390x@nongnu.org,
	qemu-arm@nongnu.org, Alistair Francis <alistair23@gmail.com>,
	Stafford Horne <shorne@gmail.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Aleksandar Markovic <amarkovic@wavecomp.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4GccnV6ehrxH

Cc: Aleksandar Markovic <amarkovic@wavecomp.com>
Cc: Alexander Graf <agraf@suse.de>
Cc: Alistair Francis <alistair23@gmail.com>
Cc: Andrzej Zaborowski <balrogg@gmail.com>
Cc: Anthony Green <green@moxielogic.com>
Cc: Artyom Tarasenko <atar4qemu@gmail.com>
Cc: Aurelien Jarno <aurelien@aurel32.net>
Cc: Bastian Koppelmann <kbastian@mail.uni-paderborn.de>
Cc: Christian Borntraeger <borntraeger@de.ibm.com>
Cc: Chris Wulff <crwulff@gmail.com>
Cc: Cornelia Huck <cohuck@redhat.com>
Cc: David Gibson <david@gibson.dropbear.id.au>
Cc: David Hildenbrand <david@redhat.com>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Cc: Eduardo Habkost <ehabkost@redhat.com>
Cc: Fabien Chouteau <chouteau@adacore.com>
Cc: Guan Xuetao <gxt@mprc.pku.edu.cn>
Cc: James Hogan <jhogan@kernel.org>
Cc: Laurent Vivier <laurent@vivier.eu>
Cc: Marek Vasut <marex@denx.de>
Cc: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: Max Filippov <jcmvbkbc@gmail.com>
Cc: Michael Clark <mjc@sifive.com>
Cc: Michael Walle <michael@walle.cc>
Cc: Palmer Dabbelt <palmer@sifive.com>
Cc: Pavel Dovgalyuk <dovgaluk@ispras.ru>
Cc: Peter Crosthwaite <crosthwaite.peter@gmail.com>
Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: qemu-arm@nongnu.org
Cc: qemu-ppc@nongnu.org
Cc: qemu-s390x@nongnu.org
Cc: Richard Henderson <rth@twiddle.net>
Cc: Sagar Karandikar <sagark@eecs.berkeley.edu>
Cc: Stafford Horne <shorne@gmail.com>

I'm calling this series a v3 because it supersedes the two series
I previously sent about using atomics for interrupt_request:
  https://lists.gnu.org/archive/html/qemu-devel/2018-09/msg02013.html
The approach in that series cannot work reliably; using (locked) atomics
to set interrupt_request but not using (locked) atomics to read it
can lead to missed updates.

This series takes a different approach: it serializes access to many
CPUState fields, including .interrupt_request, with a per-CPU lock.

Protecting more fields of CPUState with the lock then allows us to
substitute the BQL for the per-CPU lock in many places, notably
the execution loop in cpus.c. This leads to better scalability
for MTTCG, since CPUs don't have to acquire a contended lock
(the BQL) every time they stop executing code.

Some hurdles that remain:

1. I am not happy with the shutdown path via pause_all_vcpus.
   What happens if
   (a) A CPU is added while we're calling pause_all_vcpus?
   (b) Some CPUs are trying to run exclusive work while we
       call pause_all_vcpus?
   Am I being overly paranoid here?

2. I have done very light testing with x86_64 KVM, and no
   testing with other accels (hvf, hax, whpx). check-qtest
   works, except for an s390x test that to me is broken
   in master -- I reported the problem here:
     https://lists.gnu.org/archive/html/qemu-devel/2018-10/msg03728.html

3. This might break record-replay. Furthermore, a quick test with icount
   on aarch64 seems to work, but I haven't tested icount extensively.

4. Some architectures still need the BQL in cpu_has_work.
   This leads to some contortions to avoid deadlock, since
   in this series cpu_has_work is called with the CPU lock held.

5. The interrupt handling path remains with the BQL held, mostly
   because the ISAs I routinely work with need the BQL anyway
   when handling the interrupt. We can complete the pushdown
   of the BQL to .do_interrupt/.exec_interrupt later on; this
   series is already way too long.

Points (1)-(3) makes this series an RFC and not a proper patch series.
I'd appreciate feedback on this approach and/or testing.

Note that this series fixes a bug by which cpu_has_work is
called without the BQL (from cpu_handle_halt). After
this series, cpu_has_work is called with the CPU lock,
and only the targets that need the BQL in cpu_has_work
acquire it.

For some performance numbers, see the last patch.

The series is checkpatch-clean; only one warning due to the
use of __COVERITY__ in cpus.c.

You can fetch this series from:

  https://github.com/cota/qemu/tree/cpu-lock-v3

Note that it applies on top of tcg-next + my dynamic TLB series,
which I'm using in the faint hope that the ubuntu experiments might
run a bit faster.

Thanks!

		Emilio
