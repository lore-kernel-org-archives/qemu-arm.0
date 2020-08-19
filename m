Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp54225lfy;
        Tue, 18 Aug 2020 19:43:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy9ORGTIpv4NjGqkHPqWS+V8IAWK3m7fJDK0U+GQSk1maQY7ZC3fAmEVGqXyll5avR9IWU3
X-Received: by 2002:a17:90a:2170:: with SMTP id a103mr2393634pje.198.1597804998019;
        Tue, 18 Aug 2020 19:43:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597804998; cv=none;
        d=google.com; s=arc-20160816;
        b=Tl7np2KQTCIyRgjsH93RaDbLatUqItfc2tM/X3LK8TEkoaDUK7YSu8blDAYMzMOcE9
         Ktu8BPJN2CFMNuoaOYxtolFSXCkUPDCpDMDJiIUvjfRsUHwI/BNooucbKe25l4pBWrI9
         sJCqEGOM61aIK5LXp+pFppFDy9MPk4Jyvs+U52GaqG7GcnMNBp9n681nPbX0j9Yjyxty
         I6VQVvr/woCqki55K2FX+fBzbWPDd3wQf+s9mn0vUOQdrzFYmYJ7zLP1qrW0DuK2QdS7
         lXj352UTm4A5M6Mxi1pfxkaTW1lwJ+MMv339BetVlNoVvNJOTz5ObICAiXM/HCWEm78+
         uZkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=bIGK7fuoG2DjEvLbJ445Zrv21g4yWHOjXrTxJnhIPbc=;
        b=JLoL7FMpDKfG5d2YtCpNvowe0OLTl2q5jeyNhHghcWq1P9So3wLdEuqXN2fLJSqcit
         YHSrGHoCahl8dYtBp0ySA2i2jYMIIy4uY4WCAwL9q+je1RWjtezY4W4ULT2oW/gUd18j
         YuXWYansCrqBU/SI3bpAFLTc3LSQo+ZjmgcpD6Fb6SuK/D18uWL8Cd6JW7fd8TgbvVSZ
         +44HP7XC6uD/B3LERkkqwjFcADzJi3+7NXgV3mhzp1vLnwPHoW0Opyn8FGocSifH8P/W
         HR4ZLSyxNBOV0paYfs2niB0//FZXZSozf9pZguc/aKXRlgW4Y7lV03DrxFC696y3W3KZ
         rqkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=buFWtwXS;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id f20si9074837pgf.238.2020.08.18.19.43.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 18 Aug 2020 19:43:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=buFWtwXS;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098394.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07J2c7Lc100020;
	Tue, 18 Aug 2020 22:42:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=bIGK7fuoG2DjEvLbJ445Zrv21g4yWHOjXrTxJnhIPbc=;
 b=buFWtwXS0DhgXS84m1Yd7fDYlUns9CAm2Ap1+3b7I51eGbFQLbiLGe8ulrxK1LdMUMOA
 l9POKId5T1eozW2X7LhN6Cm31m5bNGTatptLTGtYjbrlOVZZwOhFGBjMy/CZkYmoJGmZ
 vYUigkSZOrX/WASHAT4etpxwBWxRaoW2h0BZXGL6ONZUQZDKSGAG2l8xgEcdCXC6q3pH
 67sXXyyWYuHlfOVQ7PY9oZ2ExFVvum3GBmEDXb4D+8Au4Jg87Vh6XH9LeEc2Y1H1nFtY
 1WKuHqN4r5UWjjVl5HRe+wYnwCb9n3xqL3+trbfSxX2SAoJbAvUwUcFtQNX3TkcngU+W Dw== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304scvmfk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 22:42:41 -0400
Received: from m0098394.ppops.net (m0098394.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07J2cv0l107536;
	Tue, 18 Aug 2020 22:42:40 -0400
Received: from ppma04wdc.us.ibm.com (1a.90.2fa9.ip4.static.sl-reverse.com [169.47.144.26])
	by mx0a-001b2d01.pphosted.com with ESMTP id 3304scvmes-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 18 Aug 2020 22:42:40 -0400
Received: from pps.filterd (ppma04wdc.us.ibm.com [127.0.0.1])
	by ppma04wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07J2cohC002265;
	Wed, 19 Aug 2020 02:42:39 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma04wdc.us.ibm.com with ESMTP id 3304uegjej-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 02:42:39 +0000
Received: from b03ledav005.gho.boulder.ibm.com (b03ledav005.gho.boulder.ibm.com [9.17.130.236])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07J2gcrH655988
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Aug 2020 02:42:38 GMT
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F1B16BE053;
	Wed, 19 Aug 2020 02:42:37 +0000 (GMT)
Received: from b03ledav005.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0E85DBE04F;
	Wed, 19 Aug 2020 02:42:32 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.163.41.251])
	by b03ledav005.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 19 Aug 2020 02:42:32 +0000 (GMT)
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
Subject: [PATCH v5 0/8] Generalize start-powered-off property from ARM
Date: Tue, 18 Aug 2020 23:42:12 -0300
Message-Id: <20200819024220.587612-1-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-19_02:2020-08-18,2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=1 malwarescore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 mlxlogscore=999
 impostorscore=0 phishscore=0 mlxscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190022
X-TUID: b8UBXFG18aYN

This version, like the previous one, tries to fix an issue found by
David Gibson when running the Travis CI:

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

Applies cleanly on dgibson/ppc-for-5.2.

Original cover letter below, followed by changelog:


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

Changes since v4:

Patch "ppc/e500: Use start-powered-off CPUState property"
Patch "sparc/sun4m: Use start-powered-off CPUState property"
- Use qdev_realize_and_unref() instead of qdev_realize(), as suggested
  by Igor.
- Pass &error_fatal to qdev_realize_and_unref() instead of manually
  reporting the error and exiting QEMU, as suggested by Philippe.
- Changed object_property_set_bool() to use &error_fatal instead of
  &error_abort.

Patch "mips/cps: Use start-powered-off CPUState property"
- Use qdev_realize_and_unref() instead of qdev_realize(), as suggested
  by Igor.
- Use existing errp argument to propagate error back to the caller, as
  suggested by Philippe.
- Changed object_property_set_bool() to use existing errp argument to
  propagate error back to the caller instead of using &error_abort.

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
 hw/mips/cps.c           | 14 ++++++++++----
 hw/ppc/e500.c           | 14 ++++++++++----
 hw/ppc/spapr_cpu_core.c | 10 +++++-----
 hw/sparc/sun4m.c        | 32 +++++---------------------------
 include/hw/core/cpu.h   |  4 ++++
 target/arm/cpu.c        |  4 +---
 target/arm/cpu.h        |  3 ---
 target/arm/kvm32.c      |  2 +-
 target/arm/kvm64.c      |  2 +-
 target/s390x/cpu.c      |  2 +-
 12 files changed, 40 insertions(+), 50 deletions(-)
