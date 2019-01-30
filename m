Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5092279wrt;
        Tue, 29 Jan 2019 17:25:50 -0800 (PST)
X-Google-Smtp-Source: ALg8bN66GTFLpMDvKAF5uRvtoA9uO+7dPd7CgyzzOiUihsE8DOrP4toCLV2ajGBkSwqDeSAeVbpT
X-Received: by 2002:a0d:dbc5:: with SMTP id d188mr26932809ywe.402.1548811550834;
        Tue, 29 Jan 2019 17:25:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548811550; cv=none;
        d=google.com; s=arc-20160816;
        b=dhTvUzLLQWTeGhBIhrv6iMrF9zRIHcV+0SsJwUtiUboelj96KsY0j2lN/2YA2ttCLf
         /7W8K6a1V5BNDYzqDUTzpMd4NrkOkiikDdiRNCMtbJZnllqZjJbxCUqV/+p8WEZE9lWZ
         k83EJlJr9dKs/CJ9hQz/nmRjjo9uUq0tVEsWMloTr6hpd9lXxKq0GXWL95Kb0dS72ogS
         iraj8XgAp2euOCt/AII0TPGoM7thn9qRbYusGBSuqnAR0x+3kAes9boZv+rHLLkNeJDb
         /+Udv+kVIzzFy18xTifKXQ8PH4KAv8hok2qhBUJDybjKapg9l6b4qqcsLQSs+em1w1P1
         bSZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:dkim-signature;
        bh=BIPeCzQVsMYSNvIxbzJifRntF0be4RwDJBecWpyNEec=;
        b=SomqwVlTaXN/dBe6in/5ak1iTH+SbKhrNQtN0tiYR9SM6J/X06NIqeg+PwkBo70qp7
         Y/K6YPh9R9khUUnjw8HbZRysBiHgUBfOLlPMyeK4VTPW9CHUrcGSWILsux/oDKSZYVIV
         X6jGDYziuJ6ZwbEY7+8mQRPGpsL8FPV/pmqImORG1OKvrQ7IC8rQ/qtfPH838FfRGq2J
         1BMuvWY23sPA4GF6q5T0xkC1Zu2N34PHan2oSbc3OWxp0sw53ZqtyaupzQtaZkuJz4uu
         lQmDBON2jLA3ovkQCw9+RxvXIDSAg9cWKbDYhnUkm/nBZq/rS42xjAFpmYzq7tjVIV3a
         PbcA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=g0uo+8+o;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=LAVScKj8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i185si28939ywf.325.2019.01.29.17.25.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 29 Jan 2019 17:25:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@braap.org header.s=mesmtp header.b=g0uo+8+o;
       dkim=fail header.i=@messagingengine.com header.s=fm1 header.b=LAVScKj8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:58328 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1goedS-0005NT-5b
	for alex.bennee@linaro.org; Tue, 29 Jan 2019 20:25:50 -0500
Received: from eggs.gnu.org ([209.51.188.92]:35741)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1goe40-0000C3-QU
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 19:49:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <cota@braap.org>) id 1goe3y-0001KZ-Lh
	for qemu-arm@nongnu.org; Tue, 29 Jan 2019 19:49:12 -0500
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:43061)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <cota@braap.org>)
	id 1goe3v-0000go-Uk; Tue, 29 Jan 2019 19:49:08 -0500
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 40F2A220DA;
	Tue, 29 Jan 2019 19:48:17 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
	by compute4.internal (MEProxy); Tue, 29 Jan 2019 19:48:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=
	from:to:cc:subject:date:message-id; s=mesmtp; bh=BIPeCzQVsMYSNvI
	xbzJifRntF0be4RwDJBecWpyNEec=; b=g0uo+8+oZWZf+kkUNY8RY99ATploxc2
	1Zi1wFJMe1YLOTbYH4WxBaLvMA8vyG+4RoiTHbPGe9WF94Hh4jAWy+9q3H9UMkoW
	bv2ezYwnuUy6dey97X7e6GrPqVqenYioFPIIjm8Fvj/z5WiKZY2gavvDXd/caGQv
	BV2Pd7dLqjJI=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm1; bh=BIPeCzQVsMYSNvIxbzJifRntF0be4RwDJBecWpyNEec=; b=LAVScKj8
	0cstKl0CO2sip8CyvLoiDaQjASwRTfWVIE1513xOSiiluM9xW43mt+DWPIxKa+J/
	Peo6KjDKqeaxJa/h0B6lARoydZztodgwGY85CPRphuaGkfowBf1o7KfHxF9LTPej
	cFOvWfuxICYT0Trug4G5LoJBCWQGyRPBk9v5Hjtd/HJplButIT4EHgPiXCoPJsSC
	opekrzoZXdT1PKvOsIHf+DlUwUlnEjybQqJJIsfiPKc8JQLQo5sPFDDshI0xrL1g
	+YNTwsrJOKOeye4oYBcGWH/DveN6u/iI/YJ4wEWS9q4glJ0Kx+chECw7d5dGJsmJ
	2PXoP3aOI60wEQ==
X-ME-Sender: <xms:TPRQXGk7YxFHC4GDuBtbNTgBd4NzZpJLtA62l1aDxrP90ToCGgHhpw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedtledrjeefgddvkecutefuodetggdotefrodftvf
	curfhrohhfihhlvgemucfhrghsthforghilhdpqfhuthenuceurghilhhouhhtmecufedt
	tdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffose
	dttdertdertddtnecuhfhrohhmpedfgfhmihhlihhoucfirdcuvehothgrfdcuoegtohht
	rgessghrrggrphdrohhrgheqnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpghhnuh
	drohhrghenucfkphepuddvkedrheelrddvtddrvdduieenucfrrghrrghmpehmrghilhhf
	rhhomheptghothgrsegsrhgrrghprdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
X-ME-Proxy: <xmx:TPRQXNZfBC8YS42odFl6EkoS9w-ZfJ0DN-0HTU3fbJpvaoTrIKfvhg>
	<xmx:TPRQXIuz8j3i0ii4gupFWO5ctm--jwp0Y90irFIKSpFRvps2neGg1Q>
	<xmx:TPRQXKXjOy_z10VmMXaMvpQCLTKEi5qlkRdDorYWaU28hZ6DQxl-XA>
	<xmx:UfRQXPgNQ5fKq9hnWUGC1y7FDobfDiHWuRs9vwfda5IGeuo5c8kg6w>
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 3872A10310;
	Tue, 29 Jan 2019 19:48:12 -0500 (EST)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Date: Tue, 29 Jan 2019 19:46:58 -0500
Message-Id: <20190130004811.27372-1-cota@braap.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 66.111.4.25
Subject: [Qemu-arm] [PATCH v6 00/73] per-CPU locks
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
	Max Filippov <jcmvbkbc@gmail.com>,
	Guan Xuetao <gxt@mprc.pku.edu.cn>, Marek Vasut <marex@denx.de>,
	Christian Borntraeger <borntraeger@de.ibm.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
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
X-TUID: 4USsXNzLOGS5

v5: https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg02979.html

For context, the goal of this series is to substitute the BQL for the
per-CPU locks in many places, notably the execution loop in cpus.c.
This leads to better scalability for MTTCG, since CPUs don't have
to acquire a contended global lock (the BQL) every time they
stop executing code.

See the last commit for some performance numbers.

After this series, the remaining obstacles to achieving KVM-like
scalability in MTTCG are: (1) interrupt handling, which
in some targets requires the BQL, and (2) frequent execution of
"async safe" work.
That said, some targets scale great on MTTCG even before this
series -- for instance, when running a parallel compilation job
in an x86_64 guest, scalability is comparable to what we get with
KVM.

This series is very long. If you only have time to look at a few patches,
I suggest the following, which do most of the heavy lifting and
have not yet been reviewed:

- Patch 7: cpu: make per-CPU locks an alias of the BQL in TCG rr mode
- Patch 70: cpu: protect CPU state with cpu->lock instead of the BQL

I've tested all patches with `make check-qtest -j' for all targets.
The series is checkpatch-clean (just some warnings about __COVERITY__).

You can fetch the series from:
  https://github.com/cota/qemu/tree/cpu-lock-v6

---
Changes since v5:

- Rebase on current master
  + Fixed a few conflicts, and converted the references to cpu->halted and
    cpu->interrupt_request that had been added since v5.

- Add R-b's and Ack's -- thanks everyone!

Thanks,

		Emilio
---
 accel/tcg/cpu-exec.c            |  40 ++--
 accel/tcg/cputlb.c              |  10 +-
 accel/tcg/tcg-all.c             |  12 +-
 accel/tcg/tcg-runtime.c         |   7 +
 accel/tcg/tcg-runtime.h         |   2 +
 accel/tcg/translate-all.c       |   2 +-
 cpus-common.c                   | 129 ++++++++----
 cpus.c                          | 421 ++++++++++++++++++++++++++++++++--------
 exec.c                          |   2 +-
 gdbstub.c                       |   4 +-
 hw/arm/omap1.c                  |   4 +-
 hw/arm/pxa2xx_gpio.c            |   2 +-
 hw/arm/pxa2xx_pic.c             |   2 +-
 hw/intc/s390_flic.c             |   4 +-
 hw/mips/cps.c                   |   2 +-
 hw/misc/mips_itu.c              |   4 +-
 hw/openrisc/cputimer.c          |   2 +-
 hw/ppc/e500.c                   |   4 +-
 hw/ppc/ppc.c                    |  12 +-
 hw/ppc/ppce500_spin.c           |   6 +-
 hw/ppc/spapr_cpu_core.c         |   4 +-
 hw/ppc/spapr_hcall.c            |   4 +-
 hw/ppc/spapr_rtas.c             |   6 +-
 hw/sparc/leon3.c                |   2 +-
 hw/sparc/sun4m.c                |   8 +-
 hw/sparc64/sparc64.c            |   8 +-
 include/qom/cpu.h               | 189 +++++++++++++++---
 qom/cpu.c                       |  27 ++-
 stubs/Makefile.objs             |   1 +
 stubs/cpu-lock.c                |  28 +++
 target/alpha/cpu.c              |   8 +-
 target/alpha/translate.c        |   6 +-
 target/arm/arm-powerctl.c       |   4 +-
 target/arm/cpu.c                |   8 +-
 target/arm/helper.c             |  16 +-
 target/arm/machine.c            |   2 +-
 target/arm/op_helper.c          |   2 +-
 target/cris/cpu.c               |   2 +-
 target/cris/helper.c            |   6 +-
 target/cris/translate.c         |   5 +-
 target/hppa/cpu.c               |   2 +-
 target/hppa/translate.c         |   3 +-
 target/i386/cpu.c               |   4 +-
 target/i386/cpu.h               |   2 +-
 target/i386/hax-all.c           |  36 ++--
 target/i386/helper.c            |   8 +-
 target/i386/hvf/hvf.c           |  16 +-
 target/i386/hvf/x86hvf.c        |  38 ++--
 target/i386/kvm.c               |  78 ++++----
 target/i386/misc_helper.c       |   2 +-
 target/i386/seg_helper.c        |  13 +-
 target/i386/svm_helper.c        |   6 +-
 target/i386/whpx-all.c          |  57 +++---
 target/lm32/cpu.c               |   2 +-
 target/lm32/op_helper.c         |   4 +-
 target/m68k/cpu.c               |   2 +-
 target/m68k/op_helper.c         |   2 +-
 target/m68k/translate.c         |   9 +-
 target/microblaze/cpu.c         |   2 +-
 target/microblaze/translate.c   |   4 +-
 target/mips/cpu.c               |  11 +-
 target/mips/kvm.c               |   4 +-
 target/mips/op_helper.c         |   8 +-
 target/mips/translate.c         |   4 +-
 target/moxie/cpu.c              |   2 +-
 target/nios2/cpu.c              |   2 +-
 target/openrisc/cpu.c           |   4 +-
 target/openrisc/sys_helper.c    |   4 +-
 target/ppc/excp_helper.c        |   8 +-
 target/ppc/helper_regs.h        |   2 +-
 target/ppc/kvm.c                |   8 +-
 target/ppc/translate.c          |   6 +-
 target/ppc/translate_init.inc.c |  36 ++--
 target/riscv/cpu.c              |   5 +-
 target/riscv/op_helper.c        |   2 +-
 target/s390x/cpu.c              |  28 ++-
 target/s390x/excp_helper.c      |   4 +-
 target/s390x/kvm.c              |   2 +-
 target/s390x/sigp.c             |   8 +-
 target/sh4/cpu.c                |   2 +-
 target/sh4/helper.c             |   2 +-
 target/sh4/op_helper.c          |   2 +-
 target/sparc/cpu.c              |   6 +-
 target/sparc/helper.c           |   2 +-
 target/unicore32/cpu.c          |   2 +-
 target/unicore32/softmmu.c      |   2 +-
 target/xtensa/cpu.c             |   6 +-
 target/xtensa/exc_helper.c      |   2 +-
 target/xtensa/helper.c          |   2 +-
 89 files changed, 1018 insertions(+), 455 deletions(-)
