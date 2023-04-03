Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp177412ejb;
        Mon, 3 Apr 2023 12:16:44 -0700 (PDT)
X-Received: by 2002:a05:600c:21d7:b0:3eb:39e2:915b with SMTP id x23-20020a05600c21d700b003eb39e2915bmr311811wmj.31.1680549403875;
        Mon, 03 Apr 2023 12:16:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680549403; cv=none;
        d=google.com; s=arc-20160816;
        b=TzGsR1vaxctgzwPkMR9YQVjiS0Le3GwB1LxyqqjoKqMScWtlbs2T7oqSQHnJvWBgjR
         kuZg5IEpAoVNEyvLaZcU/D8oxYgmauYasXdzwUXIv0AjxSz/GA7RdOdl0pUUgdHJRjCn
         IyZFHT7iaUyQNOivAAKNuLVmKcAlqtZPMGF6qXbMNrbOFR/dBAoY6VRoyKdx3y7Ao9qM
         vUJ31S7Rvs5Zw42rpqdbV1Xa6UdUqNKXvCgaTvqeQQ7ydLVmWdibgEj1yuIl8ZoRDUAs
         /kC/kHCHowKSEh5bQe3K2zMn7Zih3AxVC/8v9dIO7OaeW45j39SJ8xVylZDRTf21qozc
         F56Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=KtGeefx8eNnQOPdD5E0djsAwT6dYykWx7TqVYkfzahU=;
        b=TWUb14sekQSASaR4UchM1Dc73vkD32K5Ies8hEQ9h8bTuND/FAFDFLy4g1xP0/HhRX
         we4pK/muCGPUaz4C5BZvD7G/Sx1nm169gZeoo/jmfzapLtFASSYbCBz+765o42YYylP/
         kEBMUcwp1ruK8FVOP1tYshrfks1138G9vgFk56loyoWTvOV/LDg8l2YUfy+IRvSI6kIR
         DNFmrhg47L58O153Pnvp1t0GNCg6NTOwlTpz310IwpwWWbrp+TJbA6eyk6Xa1CCfFS93
         3KKYjjaeSUrudKf8ToxX+HNhs/d6ZGGteJfB5GJtYK74W2zwJYFZnhZoy9yToX/yjIE8
         WKmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=BoZJjiCO;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <francesco.cagnin@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y5-20020a1c4b05000000b003ee6bc01d11sor3086791wma.4.2023.04.03.12.16.43
        (Google Transport Security);
        Mon, 03 Apr 2023 12:16:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20210112 header.b=BoZJjiCO;
       spf=pass (google.com: domain of francesco.cagnin@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=francesco.cagnin@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680549403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=KtGeefx8eNnQOPdD5E0djsAwT6dYykWx7TqVYkfzahU=;
        b=BoZJjiCO7aeDrYp8beQD6wkuGlSuFXDigltrHvWzxGjNtokvDOeqpCqE3cvm4eATEv
         p/9jS7GTQblXfKEUgU9DhaeqT0/T1dAOgdUmu03cKct2QjAxXbz0Tix1iIfkKwf1dhsp
         QLBjOQhO3xwGsvVCkpOhrk9s1g7he5eC9Uzm/s7uA4OIcKeZr4rCa31Js+iWqQhtKBzB
         3Y32+141eoP/pOjsd+mQH2khmOiYhcZxIL7utqfELyaC64EudlFlMSRHCUf64OzN+B+k
         zdfy6nfcfixl27v73OCiSIYN/EdvGDfZnaVBTf8Y5V0bMylmg3icvei7iXO7rcum7mOS
         qt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680549403;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KtGeefx8eNnQOPdD5E0djsAwT6dYykWx7TqVYkfzahU=;
        b=tX2zHEIsMeW/bCIliO1jt6xIMqsKjaq7Wuku07bngk8CKMZy47m7CSA8wWfy7uP2qT
         z+I5saLdqjiSp++L8SW845Yqm1G2vAjYaxOHI9SR33VJBZ1uz3uLRR+bZiWxPD9I9RaP
         5BTSZozcT9A4xR+xfefMbk1Yf85gzSc7gYWBTrtEx/Q1lSxuFiNfLvCHk+/At8mMR8jQ
         MwqTeXbTJKmMlczrfdfRg5aPLX+2bhk6m6t2bbLhzm2ZnkwwVO+vcio4euXyQm7iFs65
         m+Q8tFt/Icajc4lKiz9vIhdI1ThB16VIwxiv9DXseREWKM1R8B+Jk5AGIi+dDYA5UY8s
         IF/A==
X-Gm-Message-State: AAQBX9eMCFr29MbMrxkinNlr4vPJoUO4SpOp6eMNRdKhohHjIC5qa1xK
	zws5vkOAqY0J/zpl1maYmRs=
X-Google-Smtp-Source: AKy350aUgSmgR3yt2L9hY7YJwPtM1fK/f0+IRCISYw32Z1fR7w0H0oTED8BRsr0bPktr1zsTKhL7fw==
X-Received: by 2002:a7b:ce10:0:b0:3eb:25ff:3446 with SMTP id m16-20020a7bce10000000b003eb25ff3446mr376540wmc.4.1680549403389;
        Mon, 03 Apr 2023 12:16:43 -0700 (PDT)
Return-Path: <francesco.cagnin@gmail.com>
Received: from omega.lan (233.87.95.79.rev.sfr.net. [79.95.87.233])
        by smtp.gmail.com with ESMTPSA id t6-20020a7bc3c6000000b003ee1b2ab9a0sm12801051wmj.11.2023.04.03.12.16.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 03 Apr 2023 12:16:42 -0700 (PDT)
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
Subject: [PATCH v4 0/2] Add gdbstub support to HVF
Date: Mon,  3 Apr 2023 21:15:58 +0200
Message-Id: <20230403191600.43487-1-fcagnin@quarkslab.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: 4Fc00MpK5utS

From: Francesco Cagnin <fcagnin@quarkslab.com>

This patch series aims to add gdbstub support to HVF (the 'QEMU
accelerator on macOS that employs Hypervisor.framework') on Apple
Silicon hosts.

The proposed implementation, structured like the KVM counterpart,
handles single-stepping, software breakpoints, hardware breakpoints and
hardware watchpoints.

The patch has been most recently tested working on macOS Ventura 13.3
hosts and single-core Linux kernel 5.19 guests with the test script
'tests/guest-debug/test-gdbstub.py' (slightly updated to make it work
with Linux kernels compiled on macOS, see
https://gitlab.com/qemu-project/qemu/-/issues/1489).

The patch still has uninvestigated issues with multi-cores guests (see
thread https://www.mail-archive.com/qemu-devel@nongnu.org/msg932884.html).

v4:
* Add license and copyright comment in 'hyp_gdbstub.c'
* Fix build on x86 macos
* Add architecture specific functions to check guest debug support
* Move include to the top of the file in 'hvf.h'
* Merge patches 2 and 3 from previous patch series
* Re-inject EC_AA64_BKPT into the guest if unhandled
* Add comments explaining how debug registers are handled
* Minor refactor around debug registers for readability
* Other minor changes

Francesco Cagnin (2):
  arm: move KVM breakpoints helpers
  hvf: implement guest debugging on Apple Silicon hosts

 accel/hvf/hvf-accel-ops.c | 115 +++++++
 accel/hvf/hvf-all.c       |  23 ++
 include/sysemu/hvf.h      |  34 ++
 include/sysemu/hvf_int.h  |   1 +
 target/arm/hvf/hvf.c      | 709 +++++++++++++++++++++++++++++++++++++-
 target/arm/hyp_gdbstub.c  | 253 ++++++++++++++
 target/arm/internals.h    |  50 +++
 target/arm/kvm64.c        | 276 ---------------
 target/arm/meson.build    |   3 +-
 target/i386/hvf/hvf.c     |  33 ++
 10 files changed, 1218 insertions(+), 279 deletions(-)
 create mode 100644 target/arm/hyp_gdbstub.c

-- 
2.40.0
