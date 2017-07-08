Received: by 10.25.44.15 with SMTP id s15csp806061lfs;
        Fri, 7 Jul 2017 19:51:05 -0700 (PDT)
X-Received: by 10.55.109.199 with SMTP id i190mr73471398qkc.125.1499482265140;
        Fri, 07 Jul 2017 19:51:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499482265; cv=none;
        d=google.com; s=arc-20160816;
        b=WbQrMnmkRVs2t68x1/j3PI62qRRadqebBIfpnZZoawvA2SBdVnGzFULP/t11VJnCGe
         Kpk29Gw8MkfHDFGR18Rq7xdXI746VYJqV4/jQLtrDtDCQh+zaWhAEW5f9OikydASkkGH
         VmjiMFsA+p8qrlF+K/qPZtIKAF35KfTGanengOE3ho6ELpoOtu2prr+LaY9KCHjApzmA
         P7jhAMSeC39CsgTrAT/rHI9UOSmuAcI2skEipTPCV1fQXKhFd5YXr5igX/7OuaRG7jy+
         Vp7CgJd1vJbYGT2Q2zRUvLZ6k+HBvmevUuSl6f1tSe09v2r14ZyxBwiesAzQN1XK5cuQ
         /pMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=AZvKLLsEhK7P4wtdgHumqMbWiDc2tGY5Kwk/JXmbjxc=;
        b=wxTteZg9bmp0G42wnF3MGNHbL989P1BxnTnOvKhQUbdZXGlrwe2+T//qWHsJEWrx28
         litmxjisI5tSUPCsg+aDdhHINSHF3mL4JWiJlFLdG+OEnBmLAQcm9Qtsso6kUKgd+AIH
         /XiYqIG6QIVB5IH5xqjUqsWUoYEkkJVNKjIWkRb/VR6njXAhd59aADCw8h74sAaPS12S
         zKGAK2kBFvLua4r52tCjHTU4Ixf6HCOyZPMB1SKHMUineLAcQGTdWpXuRyJ+fAxmTDcA
         EdNNmKj0ENWhqKysfvzlNOsH7ZbIV6Oh5fjc9AHbdWXqpdGrBP3kbWyVNL599D0FFEIQ
         8Ogg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.b=cAGqQLjC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t10si5075641qtt.0.2017.07.07.19.51.04
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 07 Jul 2017 19:51:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.b=cAGqQLjC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:59558 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dTfpm-0001Ui-5Z
	for alex.bennee@linaro.org; Fri, 07 Jul 2017 22:51:02 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43628)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dTfpg-0001Sl-Ob
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 22:50:57 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1dTfpg-0004yf-2D
	for qemu-arm@nongnu.org; Fri, 07 Jul 2017 22:50:56 -0400
Received: from mail-qt0-x243.google.com ([2607:f8b0:400d:c0d::243]:33279)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1dTfpb-0004v3-Qc; Fri, 07 Jul 2017 22:50:51 -0400
Received: by mail-qt0-x243.google.com with SMTP id c20so6456652qte.0;
	Fri, 07 Jul 2017 19:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id;
	bh=AZvKLLsEhK7P4wtdgHumqMbWiDc2tGY5Kwk/JXmbjxc=;
	b=cAGqQLjCzwcW/OV9Cl1agfz203B5GLwXFN/x7gkLVs8BeS1ZwnUHvAv/F/wy9irgZU
	lEph5S0clg80Z9QSY2PFUm2VaQo2Bfk59qp12Xj+mynUr1qKqJYb0Co9fByxFntpy2ZM
	2pvBmDkK5fcDVzSXglUdIIogJ5na12EzegCJMxWXvtCqNUf91BUYDUxj/eJbznqHYMhK
	W6daYwqr04EyCSGi19gtx0ONmcSdVSlANMQREIocJH5Fxa2z2JSfwVfP/ZoyLQ+q99i0
	/dUY7CeDBpnSbNv7u9UAP84NO/hKFKRYtPTvRZ5O2SA44QGUA3FaZSOnNJ5MKm0kXZwe
	8pcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id;
	bh=AZvKLLsEhK7P4wtdgHumqMbWiDc2tGY5Kwk/JXmbjxc=;
	b=Vy6KtXJUHXeW5gfiF9Zz4Okj1ZfqRXWHXmeNVdN7xbvx+9UYCjoOhZYU0Bj/665Zze
	dIgrDvpLCS9ZiRx60dyqXJUxZy8rh+xN0EsNkA7vXajaaJVLzF7tlQTh+4OOSb1LjqPu
	r0eDIzKRogu4dly2dOAKJdYrnTpApdQv42wkmBER+9xkSLV+zJqrAPHq6WKkuh/9V6k1
	l4AvLGLGHN4PO9pCXgTYF9w+5PxoHHImT0B91/JL8RV1Bm2YEEwJaweuC/xJJfM2nhFM
	sATpbuqsnH8bo7J6DdBF17AGxGUA3x9HqynREtt+KGhcE45nhx9rhRZ97ufGF801H00Q
	Scug==
X-Gm-Message-State: AKS2vOzG3R+7D7rQA0sszr7Lofns5YT4VPQtEzP9kB/OGybMB+JMC+Rt
	1SCqRUBXnS8NS4OuDHI=
X-Received: by 10.237.47.230 with SMTP id m93mr75186758qtd.103.1499482249361; 
	Fri, 07 Jul 2017 19:50:49 -0700 (PDT)
Received: from bigtime.twiddle.net.com (rrcs-66-91-136-156.west.biz.rr.com.
	[66.91.136.156]) by smtp.gmail.com with ESMTPSA id
	q90sm3793925qki.11.2017.07.07.19.50.44
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 07 Jul 2017 19:50:48 -0700 (PDT)
From: Richard Henderson <rth@twiddle.net>
To: qemu-devel@nongnu.org
Date: Fri,  7 Jul 2017 16:50:27 -1000
Message-Id: <20170708025030.15845-1-rth@twiddle.net>
X-Mailer: git-send-email 2.9.4
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::243
Subject: [Qemu-arm] [PATCH 0/3] linux-user fixes for va mapping
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: aurelien@aurel32.net, riku.voipio@iki.fi, laurent@vivier.eu,
	qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MPerzzR4qXRR

At first I was simply going to add TARGET_SH to the existing
set of defines that trigger a 31-bit address space.  But then
I realized that one could create non-working va configurations
from the command-line.


r~


Richard Henderson (3):
  tcg: Fix off-by-one in assert in page_set_flags
  linux-user: Tidy and enforce reserved_va initialization
  linux-user/sh4: Reduce TARGET_VIRT_ADDR_SPACE_BITS to 31

 linux-user/arm/target_cpu.h |  4 ++++
 target/mips/mips-defs.h     |  6 +++++-
 target/nios2/cpu.h          |  6 +++++-
 target/sh4/cpu.h            |  6 +++++-
 accel/tcg/translate-all.c   |  2 +-
 linux-user/main.c           | 38 +++++++++++++++++++++++++-------------
 6 files changed, 45 insertions(+), 17 deletions(-)

-- 
2.9.4

