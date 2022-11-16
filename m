Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp627343ejx;
        Wed, 16 Nov 2022 09:48:10 -0800 (PST)
X-Received: by 2002:a05:600c:3ca6:b0:3cf:ca45:3b19 with SMTP id bg38-20020a05600c3ca600b003cfca453b19mr2770181wmb.179.1668620890177;
        Wed, 16 Nov 2022 09:48:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1668620890; cv=none;
        d=google.com; s=arc-20160816;
        b=uDJhwNXRA9/SPDAu7jGWzFdo/+QxjHj8bgO417rfDFLkGYFirVAE87rf4/7iMmb5gQ
         WaMvev/ty/jPRnfSPaHbybSUeaJLS2WVWSoL2n2vxeAVe8esMho3mt+22y7KrMZsWYiI
         jOES4uQ+QZfnAkJGWVVjuPTTdJ00fXgXQxTkKySwGcJXuqm4ykRbxZgF7d70RANephT/
         oejv990KOjMNcLOOi9I7eMu/oRbV0DhAnP8xzIq/FRw938LR+V67mwru/jssGCxkWnew
         ohWuCGSvIwxgHdlus6ny5QVcabKISsmnvO7OY7csD+KGKBp0wkHMBeDrUomCIHmxuP33
         n3Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=RMBo7pxLDFqLDNCPbIFxjqDC8i1LyC537dC2FLVS84U=;
        b=YcL03d6/WezzOo19kErnaL55yz7j0/Zs6cIov0ckByLSAkXvapPMgmo06wqplzRxbs
         alzjLG2mFTQ2oZJunEp9f2zLs9mfu5HKnvLh6mxGksv2sioCPAC4Xuua0FeQ7j0NdXmy
         RrtyLZFLs49j6t8Swy6ZGX/FhQyX8aUfgst9IN/mQwz2VP32K1A689z+fETjnSI45gQX
         S+BxiE0ZZYMEZGW1ULm0p728Es09GaMDcKVc3utR5sgMr8UztcAwhZxwdLDSh8Fq6LMu
         KF8Gk5gf7LjnY6IYK8mLBUPipn/7OAKzRF+yhRyAdGrOUpBoC8CulnVA4O+1mU0z4KDi
         jahw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=hNJ0gudQ;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <francesco.cagnin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i30-20020adfa51e000000b0022c9ae40241sor8211380wrb.2.2022.11.16.09.48.10
        (Google Transport Security);
        Wed, 16 Nov 2022 09:48:10 -0800 (PST)
Received-SPF: pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=hNJ0gudQ;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=RMBo7pxLDFqLDNCPbIFxjqDC8i1LyC537dC2FLVS84U=;
        b=hNJ0gudQrRDr/N7kRIsybLmm6C+5zrDakidGGKTNQqMT9PsFoBk1C8tlAlw2BXa+8U
         jx9/o/W9K9Anw3mrj6eSkhQZ/6PuG9GWoffBs7Ylf90vNMRqbBMEB6JxBoQ5DVoJrM2S
         wIRjrwHKzrf6Y8hFrL2E+BvxmlEzPrA8L1uJS79Y0RDzaCT1xlLt/nMlaZGNNU8rE6qQ
         jYY2vEfh3opWjYiwI+ZP8xBh14NWUFL0JolH+/R8zNQHe/g7hvyo2mGbfUrTg3lxsa3n
         N59soeW0wNITsot8dz6iYYbpqRyse16VA/gBN0SlFqiIM1sp5cZMdc9/ubGDFSqtZcl6
         WCIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RMBo7pxLDFqLDNCPbIFxjqDC8i1LyC537dC2FLVS84U=;
        b=HEJrLcrI72r1ydR57tfV3y0tHJCIH1DEww2GnFTiKLJgjiQIc+5qU1xjkbHQuBhu6Z
         MIJomj7LdrfvwhDem4qOs/453rF4vvcWAbYaBF4ZX+VTOOprm7bg6AE0+9/mybzZxxR+
         To6j3Ax2iOsyrMlAP1uqAGXB3Xa1Qrkd8QDWK8fWqs0Va/8xnSWR3VtOdLtOqgWSnRXX
         l2wFRe0tFF1hbI/jnVkyTRRBXg6ls2xwdPw0pasOzI4mR5COxDOW+5+tXMC7N4z5Rdcd
         0Io5+D9kpsI4qmM6S0+15RpD9wbbN9DC5z/bvURTI0SspVHEPEZGvKVHD2undCd9YC1/
         RC0w==
X-Gm-Message-State: ANoB5pk5jRHQyp4YAIcgasrTzGE3GVAKO8D+DVpAu2HoQcl5VDEcCiHG
	cAGakKZgbG1eVmhqt5Zh4SY7MUX8GejcDQ==
X-Google-Smtp-Source: AA0mqf6B9Kh4eluxLtg+JE+UNkpsgtUA5oRZc2qflhr5qaskoG+yVaDRVcOV9s14iWaMedN1PFTT/Q==
X-Received: by 2002:a5d:4386:0:b0:22e:3177:1401 with SMTP id i6-20020a5d4386000000b0022e31771401mr14091256wrq.148.1668620889856;
        Wed, 16 Nov 2022 09:48:09 -0800 (PST)
Return-Path: <francesco.cagnin@gmail.com>
Received: from localhost.localdomain (229.19.205.77.rev.sfr.net. [77.205.19.229])
        by smtp.gmail.com with ESMTPSA id n17-20020a05600c465100b003cf483ee8e0sm2477490wmo.24.2022.11.16.09.48.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 16 Nov 2022 09:48:09 -0800 (PST)
From: francesco.cagnin@gmail.com
X-Google-Original-From: fcagnin@quarkslab.com
To: qemu-devel@nongnu.org
Cc: mads@ynddal.dk,
	dirty@apple.com,
	peter.maydell@linaro.org,
	qemu-arm@nongnu.org,
	agraf@csgraf.de,
	pbonzini@redhat.com,
	alex.bennee@linaro.org,
	Francesco Cagnin <fcagnin@quarkslab.com>
Subject: [PATCH v2 0/3] Add gdbstub support to HVF
Date: Wed, 16 Nov 2022 18:47:46 +0100
Message-Id: <20221116174749.65175-1-fcagnin@quarkslab.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: Nyg0v9YVwy/O

From: Francesco Cagnin <fcagnin@quarkslab.com>

This patch series aims to add gdbstub support to HVF (the 'QEMU
accelerator on macOS that employs Hypervisor.framework') on Apple
Silicon hosts.

The proposed implementation, structured like the KVM counterpart,
handles single-stepping, software breakpoints, hardware breakpoints and
hardware watchpoints.

The patch has been most recently tested working on macOS Ventura 13.0
hosts and Linux kernel 5.19 guests with the test script
'tests/guest-debug/test-gdbstub.py' (slightly updated to make it work
with Linux kernels compiled on macOS).

If deemed useful, I can also submit an analogous patch targeting Intel
hosts.

v2:
* Move debug helpers to 'target/arm/hyp_gdbstub.c'
* Add support for SSTEP_NOIRQ and multi-core (thanks Mads Ynddal)
* Move calls to 'hv_vcpu_set_trap_debug_exceptions()' to
  'hvf_arch_update_guest_debug()'
* Use 'arm_num_brps()' and 'arm_num_wrps()' to compute the number of
  breakpoints and watchpoints available (thanks Peter Maydell)

Francesco Cagnin (3):
  arm: move KVM breakpoints helpers
  hvf: implement guest debugging on Apple Silicon hosts
  hvf: handle writes of MDSCR_EL1 and DBG*_EL1

 accel/hvf/hvf-accel-ops.c | 123 ++++++++++++++
 accel/hvf/hvf-all.c       |  24 +++
 cpu.c                     |   3 +
 include/sysemu/hvf.h      |  29 ++++
 include/sysemu/hvf_int.h  |   1 +
 target/arm/hvf/hvf.c      | 334 +++++++++++++++++++++++++++++++++++++-
 target/arm/hyp_gdbstub.c  | 242 +++++++++++++++++++++++++++
 target/arm/internals.h    |  50 ++++++
 target/arm/kvm64.c        | 276 -------------------------------
 target/arm/meson.build    |   3 +-
 10 files changed, 806 insertions(+), 279 deletions(-)
 create mode 100644 target/arm/hyp_gdbstub.c

-- 
2.38.1
