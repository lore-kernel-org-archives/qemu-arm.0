Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2652923wru;
        Mon, 1 Jul 2019 06:25:46 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyfPHPx/YoJK7THCAmNdgNFzs3JQ27APim5y+sKUj6UMVRukTH0YumaqnqQ7MRt6qExJ5WB
X-Received: by 2002:a37:9b84:: with SMTP id d126mr20177590qke.456.1561987546251;
        Mon, 01 Jul 2019 06:25:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561987546; cv=none;
        d=google.com; s=arc-20160816;
        b=X6CiJzaz9DTa5qx6/uULeirFOh1Z4Sev9TBPEx4P6LhlLXAcraNBuQLdOX59AdoZ4r
         Z706FEQ0YnabOwyGomkHGZqSC0ZeWPi6LdEMHy63/Z4ItDXvMm+fsz5Dhj2FsS2THvox
         tCmpmyFOE5o3fF8hOE1tTK3tl7qWgZb+hWGSlI3ArOxYNFGMNweFCHENcpLkgIbCFKeZ
         9DnjKRRZaevC8AsVje8Tdb4UvFc1rjtHKhpRYAWNUK7ZW7kSaKnuyU9TfofuYi4Yeznk
         vEun5yJeHE5kSCOOXNkgKsXQ4cDiVvO9IewEYjbQFR5bMt2NQdyZIqi3b0lofhPJp+oO
         mtFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=QdhDWZZKmSWyuFeP3OfSIRNELYM9ZR88KqAN8VS1NKo=;
        b=N1aZRBrOt7D4eJj73XzgCKlUY2MUdNNPyUbY6KZwdM0452thj9yX5uNnANUjtIQpnG
         buEG3goAzyjpU+F5U0BV9QRAh3t96v+yH94zIERRbYyvznKsLolCrHXhBoZE2sn6fmsa
         RWizYkK6Uhbf5wlW9Pp2mKcRofgnuudIX/zGzqgpod50tC2iIH1yEmpineAW1Mm8q/a3
         FPss410Zv+sF/9uZM5nd8foOdbwPGkNd8qHWISn9OWR76SRsBoZbIiShSiHCAmHeEcS0
         n05t/p+F3hH2G5MzukmUK6ImO2zL8RyONwT3SfRvL0Qe36XMY2QmpWjN06H4bPs9IdtO
         Hz4g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id s49si7773188qth.188.2019.07.01.06.25.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 06:25:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id BFD6AC0524FB;
	Mon,  1 Jul 2019 13:25:30 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 8F01C6085B;
	Mon,  1 Jul 2019 13:25:18 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: Yang Zhong <yang.zhong@intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Rob Bradford <robert.bradford@intel.com>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Andrew Jones <drjones@redhat.com>,
	qemu-arm@nongnu.org,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v3 00/27] Support disabling TCG on ARM
Date: Mon,  1 Jul 2019 15:24:49 +0200
Message-Id: <20190701132516.26392-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.31]); Mon, 01 Jul 2019 13:25:33 +0000 (UTC)
X-TUID: 4rfVKelN7aPq

Paolo motived me to salvage this (other!) previous series fromi
Samuel Ortiz (NEMU project).

v1 cover from Samuel [1]:

  This patchset allows for building and running ARM targets with TCG
  disabled. It splits the target/arm/helper.c file into logical TCG and
  non TCG dependent files so that one can build and run QEMU binaries with
  or without TCG enabled.

  The rationale behind this work comes from the NEMU project where we're
  trying to only support x86 and ARM 64-bit architectures, without
  including the TCG code base. We can only do so if we can build and run
  ARM binaries with TCG disabled.

v2:

Most of the patches from v1 got adapted, except the "Move all
interrupt handlers" patch, because Peter disagreed with it.
See threads:
 https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg03908.html
 https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg07304.html
Anyway this is not a blocking issue, and can be done once this series
get merged.

v3:
(since v2: https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg03271.html)
- Addressed Alex's review comments from v2.
- added RFC patches to remove (pre-v7, M-profile, R-profile) from KVM-only build

Patches 1-9 are ready for the ARM queue.

--

This is a kind of series you don't want to rebase (as in, the quicker
it get merged, the saner). It is also one of my most painful QEMU
series, and really wish it was worthwhile.

Regards,

Phil.

[1]: https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg02451.html

Philippe Mathieu-Daudé (26):
  target/arm: Makefile cleanup (Aarch64)
  target/arm: Makefile cleanup (ARM)
  target/arm: Makefile cleanup (KVM)
  target/arm: Makefile cleanup (softmmu)
  target/arm: Add copyright boilerplate
  target/arm/helper: Remove unused include
  target/arm: Fix multiline comment syntax
  target/arm: Fix coding style issues
  target/arm: Move CPU state dumping routines to cpu.c
  target/arm: Declare get_phys_addr() function publicly
  target/arm: Move TLB related routines to tlb_helper.c
  target/arm: Move debug routines to debug_helper.c
  target/arm/vfp_helper: Move code around
  target/arm/vfp_helper: Extract vfp_set_fpscr_to_host()
  target/arm/vfp_helper: Extract vfp_set_fpscr_from_host()
  target/arm/vfp_helper: Restrict the SoftFloat use to TCG
  target/arm: Restrict semi-hosting to TCG
  target/arm: Restrict PSCI to TCG
  target/arm: Declare arm_log_exception() function publicly
  target/arm: Declare some M-profile functions publicly
  target/arm/helper: Move M profile routines to m_helper.c
  target/arm: Restrict pre-ARMv7 cpus to TCG
  target/arm: Do not build pre-ARMv7 cpus when using KVM
  target/arm: Restrict R and M profiles to TCG
  target/arm: Do not build A/M-profile cpus when using KVM
  target/arm: Do not build TCG objects when TCG is off

Samuel Ortiz (1):
  target/arm: Move the DC ZVA helper into op_helper

 default-configs/arm-softmmu.mak |   47 +-
 hw/arm/Kconfig                  |   42 +-
 target/arm/Makefile.objs        |   31 +-
 target/arm/cpu.c                |  259 ++-
 target/arm/cpu.h                |    9 +-
 target/arm/debug_helper.c       |  334 ++++
 target/arm/helper.c             | 2837 +------------------------------
 target/arm/internals.h          |   69 +-
 target/arm/m_helper.c           | 2676 +++++++++++++++++++++++++++++
 target/arm/op_helper.c          |  505 +-----
 target/arm/tlb_helper.c         |  200 +++
 target/arm/translate-a64.c      |  128 --
 target/arm/translate.c          |   91 +-
 target/arm/translate.h          |    5 -
 target/arm/vfp_helper.c         |  199 ++-
 15 files changed, 3873 insertions(+), 3559 deletions(-)
 create mode 100644 target/arm/debug_helper.c
 create mode 100644 target/arm/m_helper.c
 create mode 100644 target/arm/tlb_helper.c

-- 
2.20.1
