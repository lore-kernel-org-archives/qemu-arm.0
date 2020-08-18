Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3457963lfy;
        Mon, 17 Aug 2020 20:34:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxv4jcg7dkI35+WkQWupF0NliAQn4BKIuTptrg3JGLRyqEiAP2O7R8WcjMp6jqvfM66asw4
X-Received: by 2002:a17:90a:eb09:: with SMTP id j9mr15820580pjz.192.1597721669067;
        Mon, 17 Aug 2020 20:34:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597721669; cv=none;
        d=google.com; s=arc-20160816;
        b=xxD6tuGl00t3ExtIh+vb/DREFb24CFWYX16WafuGN9upmAco3V6n65QhL7S0b9wu24
         cqGi54bA5BPl/8DHr3Rh74EV4XR2XuNgmhWTgZIOmab0/TTL1WMO1nn5P3BqvAQbfkyj
         GdAkP/pN/qeKAewfYlRcFNg7H8eNk6HstCfN3B0e4UTclOE4X56mHFUBZmeIxRrCy7fv
         rZIhq0s5lxzZCLfEQsKIJezXq8ZXZbU3dl8MQ5P2PM+jsxL8QsarK3jBRbopnlLXzLcy
         haTg8bMpTiwMss5Crh82U04maXhLjOXm7rUC/wOEXZFkYT6jYCuEGaQOQiwyCTsEDKwM
         +6eA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=fFeaEGbXsOXWMrwdRODXZ0MC5AEYl4TrQrgD5WqjGYA=;
        b=Rk8E12igI9yeTi4KwLqGsVUczZjCc/j93dCnBCIg8XLwsqBmx6BD7CPK5G/wYgJzXa
         HXrFbKvb8zRMpE9TnUc0YAjBeN4F5sNw2DHU2sI8OC1WNzQEVJPEfaU6TIpW8X27VZBg
         dkqJDCbZ0iKUSSfcYhHqPSJy7siHneq24kgVRJnOfH0iCpp//PnKWUaBWbQWDjFkow0F
         PH1ARCqNOKfBilya80MSEMeSMpSrTOc6JcF1055ffCctfo49/303BXPJip3IRapuTpUZ
         geHB9c4nlXFQ01vlnLxHW8wYkuvulMpPrTLcpY/ljA6lQmK4IV33VyNOCDE4g93z2FD+
         DRlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=GWJn1zaJ;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id z8si14549675plk.122.2020.08.17.20.34.28
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Aug 2020 20:34:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=GWJn1zaJ;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07I3Vpiq059308;
	Mon, 17 Aug 2020 23:33:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=fFeaEGbXsOXWMrwdRODXZ0MC5AEYl4TrQrgD5WqjGYA=;
 b=GWJn1zaJrKzd0tNvqqCFidZtmZlQL3chNNpMtZZ0dd4rkx6W8FQVXKLaadOfvnPPjCPB
 12zb+UhV6A+vlCdR+Pg9yOB+cpeX4RAJpn+pac2g8DqWLJqzZeGxpDCUIISpJLuBbsJ3
 dPmXqks7uSwyQWYp0BE9/4RFn0cYVCTjq1Q+VVWPsuO2pVDBpS5b7s6/kxLmREdPUCGG
 qPzUHBGN8jyNQVprZQgT5m+Xs6W0ZgJ9g6+HAeMDL2Set8reopsndxyUmIl306bppbc7
 69viKsdiRghAmrJjLDr89pG0SEOp3kNlO29mlxiCdUcVAt8FKVdKvAdkZt6VDihxEXxV yA== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304r6u7uy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2020 23:33:54 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07I3XW34063134;
	Mon, 17 Aug 2020 23:33:53 -0400
Received: from ppma02wdc.us.ibm.com (aa.5b.37a9.ip4.static.sl-reverse.com [169.55.91.170])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304r6u7ud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 17 Aug 2020 23:33:53 -0400
Received: from pps.filterd (ppma02wdc.us.ibm.com [127.0.0.1])
	by ppma02wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07I3UBaH027184;
	Tue, 18 Aug 2020 03:33:52 GMT
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com [9.57.198.27])
	by ppma02wdc.us.ibm.com with ESMTP id 3304scgsmb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 03:33:52 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07I3XpWd36438342
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 18 Aug 2020 03:33:51 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7B299AC059;
	Tue, 18 Aug 2020 03:33:51 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6F66DAC05E;
	Tue, 18 Aug 2020 03:33:44 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.211.138.167])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Tue, 18 Aug 2020 03:33:44 +0000 (GMT)
From: Thiago Jung Bauermann <bauerman@linux.ibm.com>
To: qemu-ppc@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-s390x@nongnu.org, qemu-devel@nongnu.org,
        David Gibson <david@gibson.dropbear.id.au>,
        Paolo Bonzini <pbonzini@redhat.com>,
        Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
        Eduardo Habkost <ehabkost@redhat.com>,
        Richard Henderson <rth@twiddle.net>,
        Peter Maydell <peter.maydell@linaro.org>,
        Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>,
        Aurelien Jarno <aurelien@aurel32.net>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
        Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
        Artyom Tarasenko <atar4qemu@gmail.com>,
        Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>,
        David Hildenbrand <david@redhat.com>,
        =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
        =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
        Greg Kurz <groug@kaod.org>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: [PATCH v4 0/8] Generalize start-powered-off property from ARM
Date: Tue, 18 Aug 2020 00:33:15 -0300
Message-Id: <20200818033323.336912-1-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-18_01:2020-08-17,2020-08-18 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 priorityscore=1501
 malwarescore=0 clxscore=1015 phishscore=0 suspectscore=1 bulkscore=0
 adultscore=0 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008180022
X-TUID: v7Ooc+xp05Jd

This version tries to fix an issue found by David Gibson when running
the Travis CI:

Unexpected error in qdev_prop_set_after_realize() at /home/travis/build/dgibson/qemu/hw/core/qdev-properties.c:30:
qemu-system-mips64el: Attempt to set property 'start-powered-off' on anonymous device (type 'I6400-mips64-cpu') after it was realized
Broken pipe
/home/travis/build/dgibson/qemu/tests/qtest/libqtest.c:175: kill_qemu() detected QEMU death from signal 6 (Aborted) (core dumped)
Aborted (core dumped)
ERROR qom-test - too few tests run (expected 8, got 0)
/home/travis/build/dgibson/qemu/tests/Makefile.include:650: recipe for target 'check-qtest-mips64el' failed

Philippe Mathieu-Daudé spotted the problem:

> Good catch. hw/mips/cps.c, hw/ppc/e500.c and hw/sparc/sun4m.c are
> incorrectly setting the property after the cpu is realized because
> the cpu is created with cpu_create(). We need to create them with
> object_initialize_child() and realize them manually with qdev_realize().

But I found very few examples of CPUs initialized with
object_initialize_child() (e.g., atmega.c, rx62n.c, nrf51_soc.c)
so instead of using object_initialize_child(), I replaced the call to
cpu_create() with object_new() and a call to qdev_realize() shortly after
the  start-powered-off property is set. I thought this would be the more
prudent change, keeping the code as close to the previous one as possible.

I tried reproducing the Travis CI problem with
`make docker-test-misc@debian-mips64el-cross` but I didn't succeed, so
I'm not sure if this version solves the issue.


Original cover letter bellow, followed by changelog:

The ARM code has a start-powered-off property in ARMCPU, which is a
subclass of CPUState. This property causes arm_cpu_reset() to set
CPUState::halted to 1, signalling that the CPU should start in a halted
state. Other architectures also have code which aim to achieve the same
effect, but without using a property.

The ppc/spapr version has a bug where QEMU does a KVM_RUN on the vcpu
before cs->halted is set to 1, causing the vcpu to run while it's still in
an unitialized state (more details in patch 3).

Peter Maydell mentioned the ARM start-powered-off property and
Eduardo Habkost suggested making it generic, so this patch series does
that, for all cases which I was able to find via grep in the code.

The only problem is that I was only able to test these changes on a ppc64le
pseries KVM guest, so except for patches 2 and 3, all others are only
build-tested. Also, my grasp of QOM lifecycle is basically non-existant so
please be aware of that when reviewing this series.

The last patch may be wrong, as pointed out by Eduardo, so I marked it as
RFC. It may make sense to drop it.

Applies cleanly on yesterday's master.

Changes since v3:

General:
- Added David's, Greg's and Cornelia's Reviewed-by and Acked-by to some
  of the patches.
- Rebased on top of dgibson/ppc-for-5.2.

Patch "ppc/e500: Use start-powered-off CPUState property"
Patch "mips/cps: Use start-powered-off CPUState property"
Patch "sparc/sun4m: Use start-powered-off CPUState property"
- Initialize CPU object with object_new() and qdev_realize() instead
  of cpu_create().
- Removed Reviewed-by's and Acked-by's from these patches because of
  these changes.

Changes since v2:

General:
- Added Philippe's Reviewed-by to some of the patches.

Patch "ppc/spapr: Use start-powered-off CPUState property"
- Set the CPUState::start_powered_off variable directly rather than using
  object_property_set_bool(). Suggested by Philippe.

Patch "sparc/sun4m: Remove main_cpu_reset()"
- New patch. Suggested by Philippe.

Patch "sparc/sun4m: Use start-powered-off CPUState property"
- Remove secondary_cpu_reset(). Suggested by Philippe.
- Remove setting of `cs->halted = 1` from cpu_devinit(). Suggested by Philippe.

Patch "Don't set CPUState::halted in cpu_devinit()"
- Squashed into previous patch. Suggested by Philippe.

Patch "sparc/sun4m: Use one cpu_reset() function for main and secondary CPUs"
- Dropped.

Patch "target/s390x: Use start-powered-off CPUState property"
- Set the CPUState::start_powered_off variable directly rather than using
  object_property_set_bool(). Suggested by Philippe.
- Mention in the commit message Eduardo's observation that before this
  patch, the code didn't set cs->halted on reset.

Thiago Jung Bauermann (8):
  target/arm: Move start-powered-off property to generic CPUState
  target/arm: Move setting of CPU halted state to generic code
  ppc/spapr: Use start-powered-off CPUState property
  ppc/e500: Use start-powered-off CPUState property
  mips/cps: Use start-powered-off CPUState property
  sparc/sun4m: Remove main_cpu_reset()
  sparc/sun4m: Use start-powered-off CPUState property
  target/s390x: Use start-powered-off CPUState property

 exec.c                  |  1 +
 hw/core/cpu.c           |  2 +-
 hw/mips/cps.c           | 16 ++++++++++++----
 hw/ppc/e500.c           | 19 +++++++++++++++----
 hw/ppc/spapr_cpu_core.c | 10 +++++-----
 hw/sparc/sun4m.c        | 37 ++++++++++---------------------------
 include/hw/core/cpu.h   |  4 ++++
 target/arm/cpu.c        |  4 +---
 target/arm/cpu.h        |  3 ---
 target/arm/kvm32.c      |  2 +-
 target/arm/kvm64.c      |  2 +-
 target/s390x/cpu.c      |  2 +-
 12 files changed, 52 insertions(+), 50 deletions(-)
