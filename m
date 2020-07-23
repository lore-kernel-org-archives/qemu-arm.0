Received: by 2002:ac2:5042:0:0:0:0:0 with SMTP id a2csp1281771lfm;
        Wed, 22 Jul 2020 19:57:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzlwG7HhPhqbmw1gAxt+fCI+xL9UzCiim+n7/f5dRueE5sgC5xfd8ZszhILCaKLb5HQQKTX
X-Received: by 2002:a17:90a:348d:: with SMTP id p13mr2212446pjb.108.1595473072990;
        Wed, 22 Jul 2020 19:57:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595473072; cv=none;
        d=google.com; s=arc-20160816;
        b=CGzgKkrWiysgs4xK3p0n9F30cOmPisOfRj+ezdSwb+8quoflPUQq5ZQHYZaHq+8px9
         cwlA1kfLUE2S4znq67X4Sr6xBIyA4PT156ioJu5h01KfBQ/keBvHEkNZoyL2eC8j0Flw
         i2evDR23bPdiRS68THVRacUS24AcSS1smOgbXjbfaC/zl3eIKTNLeUWKK5T9md6SNniY
         SRgNVVDibHD+jZR+ttaWVDjUkw8z9eIHcbtn5WVg/WQ80mAEWaWVBmU2DibXTYURJasu
         nfhU6ddKU4KTjDEgZf+GR8xXIG2hBIUNlEVA5ELMhlG/ImjcgIsdsHRxcvFMsCryn2aj
         si+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=H0j/3DqYj/iBXAMUY5K5j2GqBpl8XeiEVbucgYH+9cM=;
        b=R6Drxs8a9em6A9z/eJfkZWrI5uw01lAxhfLSpxzCkZm0q89aMvU43AnvJmYwnEzrGJ
         uMzPuQahNu3/dUNMclcowpDqiddGs/9ZGmfDdHF1NVh+UiNOSLHnjG1NEaNjrUiFkKtL
         GW8B7MP/I4ziiScqu6BXrMjwqlM4EFrx6AhpRgHTq0cwyVlv73tn70R86PyWKOAAStTi
         UXNf8MlnQvrjDV2Z6Xpm7w0B8BXtuLzF+PZhkiZ0qQvVnwHcXfaF6iyYBDIMpaCTXIMD
         0hS7qfyiqpWgK8QjtEgyvadg6ESiQVc+zkWYxa8sLGRyLWJu8a8wIpW/W6gn8DBsaq0W
         CXcg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Return-Path: <bauerman@linux.ibm.com>
Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com. [148.163.156.1])
        by mx.google.com with ESMTPS id n8si881597pfj.84.2020.07.22.19.57.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 22 Jul 2020 19:57:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) client-ip=148.163.156.1;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of bauerman@linux.ibm.com designates 148.163.156.1 as permitted sender) smtp.mailfrom=bauerman@linux.ibm.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=ibm.com
Received: from pps.filterd (m0098399.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 06N2ni5u007768;
	Wed, 22 Jul 2020 22:57:24 -0400
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32f23fr4yv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2020 22:57:24 -0400
Received: from m0098399.ppops.net (m0098399.ppops.net [127.0.0.1])
	by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 06N2qZY7018521;
	Wed, 22 Jul 2020 22:57:24 -0400
Received: from ppma03wdc.us.ibm.com (ba.79.3fa9.ip4.static.sl-reverse.com [169.63.121.186])
	by mx0a-001b2d01.pphosted.com with ESMTP id 32f23fr4yd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 22 Jul 2020 22:57:24 -0400
Received: from pps.filterd (ppma03wdc.us.ibm.com [127.0.0.1])
	by ppma03wdc.us.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 06N2pGv5019365;
	Thu, 23 Jul 2020 02:57:22 GMT
Received: from b01cxnp23034.gho.pok.ibm.com (b01cxnp23034.gho.pok.ibm.com [9.57.198.29])
	by ppma03wdc.us.ibm.com with ESMTP id 32brq9h2ye-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 23 Jul 2020 02:57:22 +0000
Received: from b01ledav006.gho.pok.ibm.com (b01ledav006.gho.pok.ibm.com [9.57.199.111])
	by b01cxnp23034.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 06N2vLAO55837126
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jul 2020 02:57:21 GMT
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id D7AA1AC059;
	Thu, 23 Jul 2020 02:57:21 +0000 (GMT)
Received: from b01ledav006.gho.pok.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B50C8AC05F;
	Thu, 23 Jul 2020 02:57:14 +0000 (GMT)
Received: from morokweng.localdomain.com (unknown [9.211.93.190])
	by b01ledav006.gho.pok.ibm.com (Postfix) with ESMTP;
	Thu, 23 Jul 2020 02:57:14 +0000 (GMT)
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
Subject: [PATCH v3 0/8] Generalize start-powered-off property from ARM
Date: Wed, 22 Jul 2020 23:56:49 -0300
Message-Id: <20200723025657.644724-1-bauerman@linux.ibm.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-07-22_17:2020-07-22,2020-07-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 suspectscore=1
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2006250000
 definitions=main-2007230018
X-TUID: /+JGpeaDuD3z

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
 hw/mips/cps.c           |  6 +++---
 hw/ppc/e500.c           | 10 +++++++---
 hw/ppc/spapr_cpu_core.c | 10 +++++-----
 hw/sparc/sun4m.c        | 28 ++--------------------------
 include/hw/core/cpu.h   |  4 ++++
 target/arm/cpu.c        |  4 +---
 target/arm/cpu.h        |  3 ---
 target/arm/kvm32.c      |  2 +-
 target/arm/kvm64.c      |  2 +-
 target/s390x/cpu.c      |  2 +-
 12 files changed, 27 insertions(+), 47 deletions(-)
