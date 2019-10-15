Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp6004296wrm;
        Tue, 15 Oct 2019 09:46:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyrSFE1zIgjCuhdYdXLnXgXXhSy41g52mGPvZja8PkHEL6IonpLpfr7XiDoslKeaoBXD3Vg
X-Received: by 2002:a37:454d:: with SMTP id s74mr36093597qka.498.1571158013664;
        Tue, 15 Oct 2019 09:46:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571158013; cv=none;
        d=google.com; s=arc-20160816;
        b=w9K7i4bt2GqKkMhy4jyr6WixMWBuS4/lOdMMshCvDS0Da4hRZWk3LbDmgqJtkhySyn
         Tjl6d+cdX/lMrcLT0EdrzlJLNCJ+9H1rfN0c1gggE7rupr/Kf8zwf2l8vfYYtaOEbAHv
         DEPU/h3H7Bg/2g4AfcvYhAZmP0s6zoZafNnf2ZF6sGov2W43leC/7E/6Ee1eTKpdZx+0
         y412C0iopDcG+Rsu04XezWmi4jV85/XWaX785yUq5AYK5lCvvHucfOwJEkZI2snLJ2pE
         OikEY+7DIY6BhnXRxmD9Km4WxwIAeGdvsCLfuvr8WKzVsK107fxdvVtoedgQqVOm3bNO
         Qjtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:message-id:date:subject:to:from
         :dkim-signature;
        bh=H6OVoJrQX7RGgK41fMCeCXgNG3P+xR1iomsErR3VVAM=;
        b=rikuSk7NHm71CjaIBmxjILHeQljLia6cxjed0zvJ5HvCxYa/EGh1OJxhoBN5aQX/yX
         Soh+okxPTQXiaYFQSAw3xlrKLUEcnhr+vO1BUeJ7bSti4NLA29Lcz127Z1v2HFRpQGQk
         l386lR5A9zdcG27QUQlLlQSEgo/VMr8PagFdlzkfu4LQfWnuO/GUsm++p8aYPHoI8+WC
         lVutI08J0EVvDunBftz/16nvzDANnrwrqZgKkDbVXiDo/VfluYLP/Evyc3DlUQvt/8AJ
         BIKdn/eew2c5XfcdJ8bl2JcYIMwkJU563biD3KJpDDJABmkH8hFl8P94g5Jnah53FLhy
         Vh4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="zl3sWEF/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 89si22270975qtc.116.2019.10.15.09.46.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Oct 2019 09:46:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="zl3sWEF/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52898 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKPyF-00060d-MM
	for alex.bennee@linaro.org; Tue, 15 Oct 2019 12:46:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42096)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iKPkp-0005ET-TS
 for qemu-arm@nongnu.org; Tue, 15 Oct 2019 12:33:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iKPko-0007PR-K0
 for qemu-arm@nongnu.org; Tue, 15 Oct 2019 12:32:59 -0400
Received: from mail-pg1-x541.google.com ([2607:f8b0:4864:20::541]:37217)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iKPko-0007OI-CX
 for qemu-arm@nongnu.org; Tue, 15 Oct 2019 12:32:58 -0400
Received: by mail-pg1-x541.google.com with SMTP id p1so12463529pgi.4
 for <qemu-arm@nongnu.org>; Tue, 15 Oct 2019 09:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id;
 bh=H6OVoJrQX7RGgK41fMCeCXgNG3P+xR1iomsErR3VVAM=;
 b=zl3sWEF/MS+j7lZIxe67oEtKIkuRKHcYsJsQmpsETegnV9urD4UhOJay7qRlZr4wJ/
 u+bo9vuXgGYQyuGtzTSdIf9Tqo777e+BN3QdZ0cm1lnVz1NxvLQ6Rrd2qbJRP8cIKHDn
 p1DQfdDXHiTFLwI5h4jop8b5DGm4XmcWh4HfiWuL627yxIkFbr5rr3wK03alxevF/+8x
 BlRjvg/regGi5camyzZkQN3uKEP2lXKg0rqQGrD4kAeCCZf/T+rMXpsjQBy0B8GNA2d/
 fXQfHMQkhcUVr0joFzR69OAqvVWpPp8vNKj1oCk+bvet4dV8HMv7kQJ20SuLA/LGPCdG
 ebFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=H6OVoJrQX7RGgK41fMCeCXgNG3P+xR1iomsErR3VVAM=;
 b=Kk+AApttF6G8+vR5c/5U/D5CN5zgPNXrYfGc8ohjJ4dE5+BZBI5p+akKwtQ5ZE1nFG
 mq7CFJIjbcgc4SI6jN6LT09+9G/WXMPl/N0rKwJ23MzYtl+vrt7p9SBtEQ0kH0ggY7p8
 7aTNHxqiRDURREHk6jUFw036UuYxhik7uZbJwV+tLKJ1NLpp121scKoj8bn2UU6inybF
 7ipr58t4HpFyr1r65tR6/L/eUz4awl2uJLt9hhPAXjkSbb+/r4rS7SGqCeGl+6AJBwlM
 FfoqP6QFvId1nR9foTuaWZVkmwP7Jpjux2ciKAm4oQRQuTQzA0UMgbZlQ0NQOLEyQcsi
 c4mg==
X-Gm-Message-State: APjAAAVLr0Xdksx+zPWeP+YVBgHGXJbJKX66IGrKyVEvSAte150pRGxo
 IML7+SvKsd6xHpvEcAWFMKFTQg==
X-Received: by 2002:a62:1dd2:: with SMTP id
 d201mr40173621pfd.131.1571157176172; 
 Tue, 15 Oct 2019 09:32:56 -0700 (PDT)
Received: from localhost.localdomain (97-113-7-119.tukw.qwest.net.
 [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id g4sm20082824pfo.33.2019.10.15.09.32.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Oct 2019 09:32:55 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Subject: [PATCH 0/3] target/arm: Implement ARMv8.5-MemTag, user mode
Date: Tue, 15 Oct 2019 09:32:48 -0700
Message-Id: <20191015163254.12041-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::541
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
X-TUID: lr42Xjc/w9dq

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

