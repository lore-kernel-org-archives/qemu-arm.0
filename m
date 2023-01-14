Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp216405ejc;
        Sat, 14 Jan 2023 08:13:48 -0800 (PST)
X-Received: by 2002:a05:600c:3110:b0:3da:2932:b61a with SMTP id g16-20020a05600c311000b003da2932b61amr2324174wmo.18.1673712828839;
        Sat, 14 Jan 2023 08:13:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673712828; cv=none;
        d=google.com; s=arc-20160816;
        b=ciyizw4374EF9l9hEaW6UiHFuuDM5utS4vcKcc6Tt0jyK0Yc80rJvxe8R6vXasCcS5
         xglSxwrqHjF4EOngVPH/njPethDPd3u7qgMcEccv2QXFsny2JHFaerJTHNUCQYgAruMo
         y+ONfIMnOsc+ZbsAqYlObT4tuAsmQON2rqp4yBZ8aQFYzzOM+a0ENOMFMI8lx9efrXZO
         i/n835D/2wgwXrSh8r/SH3PV6aNwn/LdSyZK5elw4RNAnjLmDCHRzfjB7AwEAHA1jEEP
         f1vlkZ+b+0MceY0NmHrS3r6DzROtxjcFWVp03V+A0aLVzuVjw6V2sQDCXo3Um/O0jBd8
         xhxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=3541pRrn8lpJE4sW30oitbMJnzbaSEbBU6oloBO7whE=;
        b=m4Ulu3HrHNrPeOb6gIBjx6UVct+56JTIcmcsdx/oJz0eNFJ8+/WhFw+ir9ye7SAaOE
         a6PyzA60x2l9kO7SKbBdRAmop2ufRpqePgW1nRTHn05/MA57fv4Kz3IUG+fFW6hkFpcA
         ClAup7ADRVTVhDfLtroDnTMLVjZThBQCk6rQuBT0X+ot5HvdwhysK2I9NZTz5z7jLpuW
         h7sEsW08Qw026EzW55SUQKpa6+B41u3tOYYDgNUY7CmzCpG5U4XP1MVed+GEU55yXdyh
         AEUmTO91mkO7lbDShX5Sb30TK0OcBMxfUb7rqZ9N5sFORk0lecb46rgBqq65jjtrKyxG
         Gc5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=kCgUde19;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <francesco.cagnin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q9-20020adfab09000000b0022ccbedc1b7sor9128764wrc.4.2023.01.14.08.13.48
        (Google Transport Security);
        Sat, 14 Jan 2023 08:13:48 -0800 (PST)
Received-SPF: pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=kCgUde19;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3541pRrn8lpJE4sW30oitbMJnzbaSEbBU6oloBO7whE=;
        b=kCgUde19pA8R7rDD0R4+Uks6v7VasNd9LqbmpnR6FtXMt0B6ilEsB3bB7yJBu1oj2q
         /NxRMXw65rrHBBc58tWCPf+Fyv+/qzmD2Xq0a9mKugigSxVvS+swci8LRw4pgDJxpZso
         ryjAoVYdLDToaaeULXsZiYJbe+t+bKY4s3R/eBNEf+NAt6H5vJbSGw82AnlaTePd3GT6
         cerTdyCRN4Bz2UTJ3VnmNqf7u2Z7sws6/N/QCCIUCtVpVzscQAo7vTp84C+0vF0QzgiC
         X7CYCLhNpY7/R3gpmqUYOSEcipsk4BU6mfg2BCj98USD4f75DcmSZvAqZIHrRfppjhrj
         lD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3541pRrn8lpJE4sW30oitbMJnzbaSEbBU6oloBO7whE=;
        b=LWAQM6X5lEQDO+m2n98VW2/IvVGyTmm4PqF/eoA41KQkLKEwBLewGZTNIPVsVNCVaf
         gtwNMPPVD3nKF9/+XwTVe7pFu7esP1uEC+YNMCzjjdDc1jg0cl3UItIN4vRtYIOvLIev
         mtAFoIbpBCjfKi3aG53pGHbY6BswADGrRh4EdHDA8qSj1a59HhvDIvAvh07pFBN3xDQR
         YlYF2DLcDhr5jnkcuzlOJ0tDaOj3gtyU4+Hno6M3oCaP8sfVNsmZgXagFNr1PasqFkJN
         P/x61ypjlBI5Qc0V+Wl4L1z9tegjXIiqoe76J6mEZp0ofV5Ui9GR1DOEEOqDiW1K3Y2z
         Vi5A==
X-Gm-Message-State: AFqh2krVY8xiSGoH/ai40Z0v4ik8c5z2zjzvIayoyyPvshPW+tmI0wra
	6MdIoG+4fl6/I9TNdA1c/e4=
X-Google-Smtp-Source: AMrXdXtq1PwCgIxN+MfRDjRl7cC4rUOOIdiTmqBfWJI9xFUjs7WBfwSp3LndOkUTp8Hn9WLo/5773g==
X-Received: by 2002:a5d:688b:0:b0:2bd:db42:36cd with SMTP id h11-20020a5d688b000000b002bddb4236cdmr5820999wru.0.1673712828245;
        Sat, 14 Jan 2023 08:13:48 -0800 (PST)
Return-Path: <francesco.cagnin@gmail.com>
Received: from omega.lan (194.46.205.77.rev.sfr.net. [77.205.46.194])
        by smtp.gmail.com with ESMTPSA id y18-20020a5d6152000000b002425be3c9e2sm21330040wrt.60.2023.01.14.08.13.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 14 Jan 2023 08:13:47 -0800 (PST)
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
Subject: [PATCH v3 0/3] Add gdbstub support to HVF
Date: Sat, 14 Jan 2023 17:12:59 +0100
Message-Id: <20230114161302.94595-1-fcagnin@quarkslab.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: FVogPlyR5vs4

From: Francesco Cagnin <fcagnin@quarkslab.com>

This patch series aims to add gdbstub support to HVF (the 'QEMU
accelerator on macOS that employs Hypervisor.framework') on Apple
Silicon hosts.

The proposed implementation, structured like the KVM counterpart,
handles single-stepping, software breakpoints, hardware breakpoints and
hardware watchpoints.

The patch has been most recently tested working on macOS Ventura 13.1
hosts and Linux kernel 5.19 guests with the test script
'tests/guest-debug/test-gdbstub.py' (slightly updated to make it work
with Linux kernels compiled on macOS).

v3:
* Keep separate views of DBG*_EL1 registers while guest debugging is
  enabled  
  NOTE: Should be implemented as Peter and Alex suggested, and works as
  intended in my (limited) tests. Any other register to handle beside
  DBG*_EL1?
* Handle singlestepping over instructions triggering a VM exit
  NOTE: I'm not aware of unwanted side effects, please double-check the
  fix is adequate.
* Merge patches 2 and 3 from previous patch series

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
  hvf: handle singlestepping over instructions which trigger a VM exit

 accel/hvf/hvf-accel-ops.c | 123 ++++++++
 accel/hvf/hvf-all.c       |  24 ++
 cpu.c                     |   3 +
 include/sysemu/hvf.h      |  29 ++
 include/sysemu/hvf_int.h  |   1 +
 target/arm/hvf/hvf.c      | 635 +++++++++++++++++++++++++++++++++++++-
 target/arm/hyp_gdbstub.c  | 242 +++++++++++++++
 target/arm/internals.h    |  50 +++
 target/arm/kvm64.c        | 276 -----------------
 target/arm/meson.build    |   3 +-
 10 files changed, 1107 insertions(+), 279 deletions(-)
 create mode 100644 target/arm/hyp_gdbstub.c

-- 
2.39.0
