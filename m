Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp3003957wru;
        Mon, 1 Jul 2019 12:49:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxO4TTJ4d53ad6rkD1ztFXvAzeHZ0VeIpEZXDIgXhmGM/7xfhAIVgBw3bJK2QXFibcWx6ye
X-Received: by 2002:a05:620a:124f:: with SMTP id a15mr22537628qkl.173.1562010599095;
        Mon, 01 Jul 2019 12:49:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562010599; cv=none;
        d=google.com; s=arc-20160816;
        b=p0oSDfZjJmXCZ5mhJML6gmCb/UNzZn0R0+xNa0oE6SLhT49Z4gsouzLw7ER2j0W6lr
         O/kp9c5fbV+NqwF+4Mrb+xQEqa4A/7XRqaIbnSkYtd1Rrj/EBn34D/ncHkKqePbC/14y
         vJfjxUHHKWK3Zk+LcQ9ICfnACFsh3c4N5kMbiJAtWHgBLqiPK4+FHv6e1Y8DNa3/QT5D
         FhggsBCPihT4aRhXVVe5MVGVwTRgvDGMqZbXkc7L19LOSZiThGUCOQZ0Pyuosx3m2lav
         Rjc86si89M0bpr121HurJPyQqnPasYFmriH7tx5dZJ4DwRshnjCis0bkOLCSuk2ZrJod
         XbqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from;
        bh=cpoMhxqOa0DPEQg6hc1cCTvgALtwO1eBK43Eh40nyTo=;
        b=MOjI2l5kAKDpROQxlboMTZGuM8tGgAKwCmT2X5k+awz58Jl3QpJJ6j+gL+Fmi+tPDe
         TkCTh0Bbnu6Vhgw7cnx5T1be5xa8t93TTTTajnTOwWeMVecT3aQ7OCId11jOMgvCAy1B
         3dNmgDmP26O3W0XX5dh0xtJWkNTkocRZ5txu2K0uqE8UjPraMqDTQaFlnyC0B9iJcq9r
         WFouu3au6W2IYP8ddfd2rZAkwkihJF2M7bi9kVI6qj/XAboEly/zFFC1oyKkBu90lyxq
         JcyljO1lcgBKL69x82aYckMWtU+NJyBydesP0cvN3TAfGb4uRxeXAti/D5IG3NaVBcKo
         YynA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id i15si8337818qkg.199.2019.07.01.12.49.58
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 01 Jul 2019 12:49:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9270C8667B;
	Mon,  1 Jul 2019 19:49:50 +0000 (UTC)
Received: from x1w.redhat.com (unknown [10.40.205.170])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 488F912A6B;
	Mon,  1 Jul 2019 19:49:45 +0000 (UTC)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Samuel Ortiz <sameo@linux.intel.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Rob Bradford <robert.bradford@intel.com>,
	qemu-arm@nongnu.org,
	Andrew Jones <drjones@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Yang Zhong <yang.zhong@intel.com>,
	Thomas Huth <thuth@redhat.com>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: [PATCH v4 0/8] Support disabling TCG on ARM
Date: Mon,  1 Jul 2019 21:49:34 +0200
Message-Id: <20190701194942.10092-1-philmd@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.26]); Mon, 01 Jul 2019 19:49:57 +0000 (UTC)
X-TUID: OJ//tnbuxjNP

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

v2: https://lists.gnu.org/archive/html/qemu-devel/2019-06/msg03271.html

Most of the patches from v1 got adapted, except the "Move all
interrupt handlers" patch, because Peter disagreed with it.
See threads:
 https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg03908.html
 https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg07304.html
Anyway this is not a blocking issue, and can be done once this series
get merged.

v3: http://mid.mail-archive.com/20190701132516.26392-1-philmd@redhat.com
- Addressed Alex's review comments from v2.
- added RFC patches to remove (pre-v7, M-profile, R-profile) from KVM-only build

v4:
- patches 1-12, 14-17, 19-21 accepted, rebased on target-arm.next
- addressed Peter's comment (described in each patch).
Based-on: target-arm.next

$ git backport-diff -u v3 -r target-arm.next..v4
Key:
[----] : patches are identical
[####] : number of functional differences between upstream/downstream patch
[down] : patch is downstream-only
The flags [FC] indicate (F)unctional and (C)ontextual differences, respectively

001/8:[0048] [FC] 'target/arm: Move debug routines to debug_helper.c'
002/8:[0004] [FC] 'target/arm: Restrict semi-hosting to TCG'
003/8:[0027] [FC] 'target/arm/helper: Move M profile routines to m_helper.c'
004/8:[----] [--] 'RFC target/arm: Restrict pre-ARMv7 cpus to TCG'
005/8:[----] [--] 'RFC target/arm: Do not build pre-ARMv7 cpus when using KVM'
006/8:[----] [--] 'RFC target/arm: Restrict R and M profiles to TCG'
007/8:[----] [--] 'RFC target/arm: Do not build A/M-profile cpus when using KVM'
008/8:[----] [--] 'target/arm: Do not build TCG objects when TCG is off'

Patches 4-8 are included as RFC for series completeness, but are not
meant for review for the 4.1 release.

Paolo, the RFC patches are ARM but Kconfig related, you might want to
have a look at them ;) Cc'ing Thomas for the same reason.

Thanks a lot to Alex and Peter for their review time, and Samuel for
the original effort.

Regards,

Phil.

[1]: https://lists.gnu.org/archive/html/qemu-devel/2018-11/msg02451.html

Philippe Mathieu-Daudé (8):
  target/arm: Move debug routines to debug_helper.c
  target/arm: Restrict semi-hosting to TCG
  target/arm/helper: Move M profile routines to m_helper.c
  RFC target/arm: Restrict pre-ARMv7 cpus to TCG
  RFC target/arm: Do not build pre-ARMv7 cpus when using KVM
  RFC target/arm: Restrict R and M profiles to TCG
  RFC target/arm: Do not build A/M-profile cpus when using KVM
  target/arm: Do not build TCG objects when TCG is off

 default-configs/arm-softmmu.mak |   47 +-
 hw/arm/Kconfig                  |   42 +-
 target/arm/Makefile.objs        |    9 +-
 target/arm/cpu.c                |   25 +-
 target/arm/cpu.h                |    7 +
 target/arm/debug_helper.c       |  311 ++++
 target/arm/helper.c             | 2669 +-----------------------------
 target/arm/m_helper.c           | 2676 +++++++++++++++++++++++++++++++
 target/arm/op_helper.c          |  295 ----
 9 files changed, 3091 insertions(+), 2990 deletions(-)
 create mode 100644 target/arm/debug_helper.c
 create mode 100644 target/arm/m_helper.c

-- 
2.20.1
