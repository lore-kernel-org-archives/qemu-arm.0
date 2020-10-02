Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp1944608lfq;
        Fri, 2 Oct 2020 14:59:58 -0700 (PDT)
X-Received: by 2002:aca:3b82:: with SMTP id i124mr2330184oia.155.1601675998231;
        Fri, 02 Oct 2020 14:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601675998; cv=none;
        d=google.com; s=arc-20160816;
        b=NpZbZd9PUxcnI1FAppYayGULBpey/+Db1x3zaVpu5NVZVapMLWyW+3/Rjtd/kVoZCA
         T8Cf/eIyK+5sbjD4x53Y+7Ldvukadk39XHnxGr8CY3ZeOqBYCq6eECyCQ3k8vTkAGq0p
         YTbjyHGKzRQeWank+L7K4sCuYbfJMQ0QHBtfiv+c/myukqC7H8oFp5aELWFZbrMtHK4c
         3Yaeqc86LsNSrEA1daNOP5SaXpixtYjiu930dcbpj7tZrrcpjcIlVacndNthelcf2u7q
         amcddXeEVPShBbTV92p6ja/uAfLtYcqbRjlDwR7PPzYmyPFUmUP9ZgHhK76tdYRMiaXJ
         9OPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=4Dp1ZT13R0EQdEu6dxQsq0XHxGgkkn7MNkTsVH0IryU=;
        b=lwiK+RXciqn4dB6FPdEFJxIfrtPv2FOzIRf/MipfqOx3/lUII1Fpcx64tnf00qaBxE
         K+c9maNkd0rhxRvbeRMuzbK80XfxSeew8MzQ+6F+9FoumF+j1h9KxpYKH07SJceDgDZD
         qx/LG6URUCo6FPNSmSMcVQNJsp/24/zD0QmJqVqpCG2z4qxMHpf8deVWWoawZx0G9tlh
         9bmI79Nd8RSJD5+2aSVjSVw6VL+wPJCh3TrQbz0lykT3qSfRvJLhV6iSv1+JPv0bvPgg
         dxdEgsYwx86LdRf9ej2qRW9PJg9e5bgvyqJBnm9e2RmrdMq3yTDnELBRG6IS0l5IdLKd
         y2WQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VzEyCjgH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id l15sor587694otk.35.2020.10.02.14.59.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 02 Oct 2020 14:59:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VzEyCjgH;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Dp1ZT13R0EQdEu6dxQsq0XHxGgkkn7MNkTsVH0IryU=;
        b=VzEyCjgHWf9UwTPvOoMP79F1mljFfZrjrezkIMT1ct+0EQxESPVUG5zy82gV3bCHxS
         5q7e+N/iIdPmKDjZMpcXq6uiDAnDbeqhmr1XGSJTFMOSzMfqmOBbAt1HYTfPHGUVuIxN
         xVjHNRy7nqYnNhGT8Qwf4Sz5DQmUmToNLpwYHHqWyDdOXjyrKePYq5di6Zv7Dgy+/PgI
         QuXa7DNQeGMXm3Ual7YVI8e/67IDkxV0Qg9weMMWyAvjlcGMcerunNkMss1BZQ4gKzgI
         IzFGt+AZxsVce6C/Gw27EC3f5h0l2QtQQcGmFAK7Of+w4K3A9I22pcMQw0/bAtr2Yp7y
         tW1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4Dp1ZT13R0EQdEu6dxQsq0XHxGgkkn7MNkTsVH0IryU=;
        b=K1MP3FZig9YDIACIhwZpGA7HTiN/1jQyywUVZeN6l6RhJxVRD24bSpeWq9Rtql9vya
         JXeXFq4cEwVBIe0Wke50pqrS+JeFe39iOoLlY1cV643XjCsHcoaWClw7tDIldYyMU1rB
         r9Yci6LH6mdGJkn0GTWldkA0Ovqe4UiiZe9avic6SB2hlg/N29kb15yHAvKMd9HmQCYi
         gPh2vJDz3tEyrHbr+HN5W6uKYvjB7iVOk4vMe5Pr8aMCCkFaPorjVzAJOI49YewqVNKT
         /lsMmlxRUSxbCbbDfprfy+npI0I7F/VFHeEOphW/pdE/vsdWRnlL0ndw1XyO/869+K2n
         WKmQ==
X-Gm-Message-State: AOAM530TEcvyACX8w3Win1F3WKIebV1uFoUisq8Do9OBMbZ8xB+YfntC
	pIsJoAnTDd9S6EFRBV0FAexzoBeO
X-Google-Smtp-Source: ABdhPJxAkhJGDjUn9YTztGdCrXIZTjZ/o/n1OZqcumcDuABOqW5J5Ym+wzgcnd0YtYlD+VVNisBiPA==
X-Received: by 2002:a9d:6950:: with SMTP id p16mr3124284oto.60.1601675997688;
        Fri, 02 Oct 2020 14:59:57 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from localhost.localdomain (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id k10sm684268ots.60.2020.10.02.14.59.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2020 14:59:56 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org,
	peter.maydell@linaro.org,
	alex.bennee@linaro.org,
	laurent@vivier.eu
Subject: [PATCH v10 0/8] linux-user: User support for AArch64 BTI
Date: Fri,  2 Oct 2020 16:59:47 -0500
Message-Id: <20201002215955.254866-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TUID: +K9qbaqz6Evw

The kernel abi for this was merged in v5.8, just as the qemu 5.1
merge window was closing, so this slipped to the next dev cycle.

Changes from v9:
  * Split what is now patch 7 into 3 more (pmm).
  * All prerequisites are now upstream.


r~


Richard Henderson (8):
  linux-user/aarch64: Reset btype for signals
  linux-user: Set PAGE_TARGET_1 for TARGET_PROT_BTI
  include/elf: Add defines related to GNU property notes for AArch64
  linux-user/elfload: Fix coding style in load_elf_image
  linux-user/elfload: Adjust iteration over phdr
  linux-user/elfload: Move PT_INTERP detection to first loop
  linux-user/elfload: Parse NT_GNU_PROPERTY_TYPE_0 notes
  tests/tcg/aarch64: Add bti smoke test

 include/elf.h                     |  22 +++++
 include/exec/cpu-all.h            |   2 +
 linux-user/qemu.h                 |   4 +
 linux-user/syscall_defs.h         |   4 +
 target/arm/cpu.h                  |   5 +
 linux-user/aarch64/signal.c       |  10 +-
 linux-user/elfload.c              | 147 ++++++++++++++++++++++--------
 linux-user/mmap.c                 |  16 ++++
 target/arm/translate-a64.c        |   6 +-
 tests/tcg/aarch64/bti-1.c         |  62 +++++++++++++
 tests/tcg/aarch64/bti-crt.inc.c   |  51 +++++++++++
 tests/tcg/aarch64/Makefile.target |   7 ++
 tests/tcg/configure.sh            |   4 +
 13 files changed, 298 insertions(+), 42 deletions(-)
 create mode 100644 tests/tcg/aarch64/bti-1.c
 create mode 100644 tests/tcg/aarch64/bti-crt.inc.c

-- 
2.25.1
