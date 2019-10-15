Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp6004592wrm;
        Tue, 15 Oct 2019 09:47:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwR9Mm40K9KK3UmiZOBUZf6PfZTpBgugzKhGW+VsHX3sv3Q0ZjHqg2dxE+q7H+vMWpwLe+B
X-Received: by 2002:a17:906:154a:: with SMTP id c10mr34002096ejd.238.1571158030228;
        Tue, 15 Oct 2019 09:47:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571158030; cv=none;
        d=google.com; s=arc-20160816;
        b=rn0peR18iTBurBwgce0lVHyK2IzS7B0IyXTbHtGLQ21Iiy8EB/viwi5AGSft+NzAzy
         jnNRKvsFQigX0hu4RKVjVonDyo/ql2819mWU34SVpdMlRLv1NhMVkFuefvUthxYnRw2b
         WrASdrhkJJA0sYCkJbjcBNA2RtoJbREF2Vnbl1a2PmdsYr7IJ9r0EucDbshbw4Vb56L1
         y9Bhf802fjwFVGfbkKQVVbKN0UIH3UBMEUHe/ClTpxlyjNt4Wi0C9CcNLwBmhrfaldO5
         tYTnx/HROagU68yKskEkWIYFLyV9USxNIlcnKSi4iTyFB5/HQgIkGduwAgKghf6pV/sn
         Jf2w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=H6OVoJrQX7RGgK41fMCeCXgNG3P+xR1iomsErR3VVAM=;
        b=uBROfV4H18MeRItYI35MSEOmfyq81xP4/hn6OzVNZ6i/0+2/IzxqDadc7cgLFpi2fE
         8QMBDy8yzgliY6ldC3g9kNIl+u7hG4/pd9lvsj2oTU0tSwx4Xa6qbNyNf0tlOsLT+mlD
         WUlq+5Pk/BhUF8xy5iOh/KkzQfkyTirf/5yvhbOgD7epIJy6Vb0tyVyQ9kguenNMpX81
         pvuiV3Ex6i75eHbmD9k5I8aO4JzUEV58T4a0BEuRdWwGVcP4zDVX7v80SG83KOg6Kyng
         7Hrz0IfF6cjcd9+IDgDlsol6s8x/wic2WW0k9KUHqt1fVgnXunIOBRMmNN66nehnVADe
         alqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tptGsGvc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id rk14si13565031ejb.24.2019.10.15.09.47.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Oct 2019 09:47:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=tptGsGvc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKPyW-0006US-IJ
	for alex.bennee@linaro.org; Tue, 15 Oct 2019 12:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42495)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iKPmy-0008A6-2W
 for qemu-arm@nongnu.org; Tue, 15 Oct 2019 12:35:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iKPmw-0000E5-Rl
 for qemu-arm@nongnu.org; Tue, 15 Oct 2019 12:35:11 -0400
Received: from mail-pf1-x443.google.com ([2607:f8b0:4864:20::443]:40798)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iKPmw-0000Dg-LH
 for qemu-arm@nongnu.org; Tue, 15 Oct 2019 12:35:10 -0400
Received: by mail-pf1-x443.google.com with SMTP id x127so12816341pfb.7
 for <qemu-arm@nongnu.org>; Tue, 15 Oct 2019 09:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=H6OVoJrQX7RGgK41fMCeCXgNG3P+xR1iomsErR3VVAM=;
 b=tptGsGvcuiDdignTWCEnJsfOkpLL0mIF7qSYukBqx5kpO/ZSgPBfbQJMuhcG5+j6Cd
 IYJzVxNnoNWNq7kI6mVPwx/TEcb+IwiBA4FQbDo9X8RP/o/7iW/7br8byGj0OUnIOhUz
 MZ1aQavjk4sYDWdT6TJHy63BoL2BMA8FuWcozGHEsVHTKxbggSJxWeFk7Pd1vVIo8cfR
 eFsIesGghWdEZa9qRUnu2jyJu53UpOlj8kRMH2GHapngd6ptWpH4v9lu7yhIK8Lt74Ag
 81axfUlVlrDXoBZJv0mbbjbLK5/EbxnOD3AGLm0B5czBMG5yMopjvYcgqKucOT8ew52s
 XLRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=H6OVoJrQX7RGgK41fMCeCXgNG3P+xR1iomsErR3VVAM=;
 b=QqW/HxShabIy1QBaXVXQpEGWLwIBbMnRT+ltYPb2y/9fBWwluDlGC3LankbGF+ewqm
 nI8QhPDxPZJeFmThXxgFWMwDjgGm2SVEo9oP6NyTMnkAwYof/ZW06RetDAGpw4TQZ+26
 pUPE/sPutKr8YZpbwmI7nRUn436o+Lt4gSuu6UElUaaqDRiPXmyc3q23VPJxDj6s0sY3
 nHRV+olUFdwt89nE2Qhu0Tc58xXFTOOvqD+fNv24yYN0lQ4rQWDUdU2JwdlsDCsZlfbe
 JXkseftXfO8VoeaUopJr6vMlR9kGdzxDqyI4xIyAx3uG4aZSaWEoy0Axq2FeHDA+2KjT
 MOAQ==
X-Gm-Message-State: APjAAAUWr8wfo4yduTrWZt5NXYPUxhwxCQQ8UtZQBus6XOZ/LbUPdfrN
 OC6XfKuXp9XDmNlCDo1J+2Bp/Q==
X-Received: by 2002:a17:90b:d90:: with SMTP id
 bg16mr43937814pjb.143.1571157309569; 
 Tue, 15 Oct 2019 09:35:09 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id m22sm22011593pgj.29.2019.10.15.09.35.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 09:35:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/arm: Implement ARMv8.5-MemTag, user mode
Date: Tue, 15 Oct 2019 09:35:04 -0700
Message-Id: <20191015163507.12153-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::443
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: elver@google.com, icb@rice.edu, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: PPibH14yE1lO

This is a refresh of the user-only patch set from March.

I do not attempt to implement any part of a kernel abi wrt mmap
and/or mprotect.  Instead, it uses a x-tagged-pages property to
assume that all anonymous pages have tags.

The tests added are disabled by default, but do pass if you have
binutils 2.32 installed.


r~


Based-on: <20191011134744.2477-1-richard.henderson@linaro.org>
("target/arm: Implement ARMv8.5-MemTag, system mode")

Based-on: <20190803210803.5701-1-richard.henderson@linaro.org>
("target/arm: Implement ARMv8.5-BTI for linux-user")

Complete tree: https://github.com/rth7680/qemu/tree/tgt-arm-mte-user


Richard Henderson (3):
  tcg: Introduce target-specific page data for user-only
  target/arm: Add allocation tag storage for user mode
  tests/tcg/aarch64: Add mte smoke tests

 include/exec/cpu-all.h            | 10 ++++++--
 target/arm/cpu.h                  |  4 ++++
 accel/tcg/translate-all.c         | 28 ++++++++++++++++++++++
 linux-user/mmap.c                 |  8 ++++++-
 linux-user/syscall.c              |  4 ++--
 target/arm/cpu64.c                | 20 ++++++++++++++++
 target/arm/mte_helper.c           | 35 +++++++++++++++++++++++++--
 tests/tcg/aarch64/mte-1.c         | 27 +++++++++++++++++++++
 tests/tcg/aarch64/mte-2.c         | 39 +++++++++++++++++++++++++++++++
 tests/tcg/aarch64/Makefile.target |  5 ++++
 10 files changed, 173 insertions(+), 7 deletions(-)
 create mode 100644 tests/tcg/aarch64/mte-1.c
 create mode 100644 tests/tcg/aarch64/mte-2.c

-- 
2.17.1

