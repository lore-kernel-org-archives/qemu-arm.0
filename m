Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp606135lfy;
        Wed, 19 Aug 2020 09:44:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJylaLFcElGXVkgclhM205oJYvdtWkpliaYXIrWt6PFl0E9BUxGlLjXBBNOrOSkE1zKK2P0F
X-Received: by 2002:a25:aa86:: with SMTP id t6mr35890957ybi.213.1597855443533;
        Wed, 19 Aug 2020 09:44:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597855443; cv=none;
        d=google.com; s=arc-20160816;
        b=c8s+EfC0yZywvWlmyRzFuX6v/tk8HpCmzvwIQR0HGw0a8qTFlirEC+aNZ10f7G1asT
         IdMgXNcZwj+0YRQSI8Rt/y7mbJDROImLYC1vBVoCCJuwywXXH++uooV4nu/JnsDJZGVC
         KAGj0QxvVGgl6lFh6uta6cACaD6qhNCOEWEZI6MW+HayUeBOi6efUpPAU9e65iZgpxmx
         DCm9hyAYSOFkgxpjbpT0Va1kx917lybuGS9o/z2omt8ANwHnzAuB4NgGNpjjrVkDqn68
         tyOuB14JIahCEy3ChUgNShXz0HFEGd9Cyo3U2drCEaNc+PO1DWBzlUnn3jp2Hk6kimcU
         azfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=sRB95hWJe5GJQa+znfNM8skqmQzdo7Ihu6s12UxG6zc=;
        b=VJGKEAhamasEGGlB2XkSh7hqFCIVgkZa4mWmIc8UQUwBYj6EQ9hNxDqneY+NeFvoMf
         MlhCK6+hJ7vfYVSpM1IRItqnlLbuA9LdHDYzwzU+576aw0I/rl0n3WQaAU56r2qmaXjz
         gcrTCVQUlD+1HKl5KVSu9MfX7JrVnkOiPdeqJp35cHexV8GYKyp1q9OM8BZSkqVxqLh6
         9Mcm0B7lEMEdkNh2dmWbrAOOmGBJ4goMfbuusZdOyXZuXpzXWmrfY9S4xyfagjjwVToG
         m+Ha7K3RzMSaOk9V0g79PO4zalhHJZbidL09aZtN6+1zADggqAK3CsSWKUjhLeEdoWWm
         Y23Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=E0dG5s5R;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com. [148.163.158.5])
        by mx.google.com with ESMTPS id 62si23313938ybe.220.2020.08.19.09.44.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Aug 2020 09:44:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) client-ip=148.163.158.5;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@ibm.com header.s=pp1 header.b=E0dG5s5R;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.158.5 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098419.ppops.net [127.0.0.1])
	by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 07JGUh7K169435;
	Wed, 19 Aug 2020 12:43:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=from : to : cc : subject
 : date : message-id : mime-version : content-type :
 content-transfer-encoding; s=pp1;
 bh=sRB95hWJe5GJQa+znfNM8skqmQzdo7Ihu6s12UxG6zc=;
 b=E0dG5s5R+NGBZkpMpPNQ/R2938bih/wSbtc6GSFmp9F+Xfatp1VrTrH2TkGz2Xi31pQI
 ofWWDBvcVvOx7f4t61nMBaR1cuOvdez/o3Nhi11UCllByKIUUIL0gz3VZW3KPEoq4pXJ
 s5ZvAHA94TktsX2sRw1BqSuDmNvcXqOKFfHfPsm66z0eqai9wkNEtM/UjaMxX27Alh5/
 ecVc6xDXs+x1CfU/8a+t0u12XAZg+jqS7D7z/1AUqXuMhXCL6q5g7w7p5NjqK+vQqwvn
 RMWKS8IUBX9KP6ppA4Fls6Rk2eSM9RPu6qAWHeJGfwdaCZMN70HXjGdWNGM7kaWYZQqx 0g== 
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0b-001b2d01.pphosted.com with ESMTP id 3313qr17dr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 12:43:30 -0400
Received: from m0098419.ppops.net (m0098419.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 07JGVHqL171428;
	Wed, 19 Aug 2020 12:43:29 -0400
Received: from ppma02dal.us.ibm.com (a.bd.3ea9.ip4.static.sl-reverse.com [169.62.189.10])
	by mx0b-001b2d01.pphosted.com with ESMTP id 3313qr17d8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 12:43:29 -0400
Received: from pps.filterd (ppma02dal.us.ibm.com [127.0.0.1])
	by ppma02dal.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 07JGPaIE012150;
	Wed, 19 Aug 2020 16:43:28 GMT
Received: from b03cxnp08028.gho.boulder.ibm.com (b03cxnp08028.gho.boulder.ibm.com [9.17.130.20])
	by ppma02dal.us.ibm.com with ESMTP id 3304ccrubu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 19 Aug 2020 16:43:28 +0000
Received: from b03ledav006.gho.boulder.ibm.com (b03ledav006.gho.boulder.ibm.com [9.17.130.237])
	by b03cxnp08028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 07JGhQ7t61473224
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 19 Aug 2020 16:43:27 GMT
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id DCBAEC6055;
	Wed, 19 Aug 2020 16:43:26 +0000 (GMT)
Received: from b03ledav006.gho.boulder.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88F40C6057;
	Wed, 19 Aug 2020 16:43:21 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.211.41.171])
	by b03ledav006.gho.boulder.ibm.com (Postfix) with ESMTP;
	Wed, 19 Aug 2020 16:43:21 +0000 (GMT)
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
        Greg Kurz <groug@kaod.org>, Igor Mammedov <imammedo@redhat.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>
Subject: [PATCH v6 0/8] Generalize start-powered-off property from ARM
Date: Wed, 19 Aug 2020 13:42:58 -0300
Message-Id: <20200819164306.625357-1-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-08-19_09:2020-08-19,2020-08-19 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 phishscore=0 malwarescore=0 mlxlogscore=999 mlxscore=0 suspectscore=1
 adultscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 spamscore=0
 impostorscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2006250000 definitions=main-2008190135
X-TUID: yA1vQ703NbGV

This version has one small fix in patch 7, and adds Philippe's Reviewed-bys.

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

Changes since v5:

Patch "ppc/e500: Use start-powered-off CPUState property"
Patch "mips/cps: Use start-powered-off CPUState property"
Patch "sparc/sun4m: Remove main_cpu_reset()"
Patch "target/s390x: Use start-powered-off CPUState property"
- Added Philippe's Reviewed-by.

Patch "sparc/sun4m: Use start-powered-off CPUState property"
- Move call to qdev_realize_and_unref() right after object_property_set_bool(),
  as suggested by Philippe.

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
 hw/sparc/sun4m.c        | 31 ++++---------------------------
 include/hw/core/cpu.h   |  4 ++++
 target/arm/cpu.c        |  4 +---
 target/arm/cpu.h        |  3 ---
 target/arm/kvm32.c      |  2 +-
 target/arm/kvm64.c      |  2 +-
 target/s390x/cpu.c      |  2 +-
 12 files changed, 39 insertions(+), 50 deletions(-)
