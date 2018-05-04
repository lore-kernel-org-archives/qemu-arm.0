Received: by 10.28.4.212 with SMTP id 203csp333611wme;
        Fri, 4 May 2018 11:30:41 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZqDrZWMFJ0xApKC1yDJYLW/DI2vlg6PN2nQXu7mFfuk2Y+0aAeC7hGdI283B9jxoiOBN97F
X-Received: by 10.55.217.205 with SMTP id q74mr23128108qkl.303.1525458641360;
        Fri, 04 May 2018 11:30:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1525458641; cv=none;
        d=google.com; s=arc-20160816;
        b=ueBX8dP+ArGGi6KIQj1B+ZeZ+p5L0QcmT47my1oG/6lY0eNKj/bNeJG0o6N0Psrta9
         qbGApD3qGBXVfZzZzEdOAKrSrc0fU/EG5vmZXQhMooLdCsabOFbzfAYodTpC76niMa2Y
         w8vlrdUx6yx9PStKvdQoRxF+rJSKZ4XOmDOvNEYkX4qK5Tof3LMKdI8zNmxqxYhlSEGP
         ew4IBbIQLFOqPNVXstAUdO/jOi7AbDybMI8hICUP9dn7hIWwdb86YYoHYMIEOfuce7Tp
         sxUzVpbc/9trDAOh4n4ahtqXrySs30u4HvYGuuo14k97hD4nPWpunXW/nSIcdRRTrA+A
         pdNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=NnLHwPEUHd78QMOSxXEfR74eTOdxsx0ytS3dgUv9VU0=;
        b=0j+7DjNFifHTiaHY7LXtllG4ozovj7ZjRgKwPu+zSX/XJtghv/RIX+i6QN0xz8PUdW
         +5dMa108Zwit1w0NtM6SL99FN6B3xGXvgJjP8gmcBJHNjZKubcNXspGQtTm2YrKXUibd
         8F8VFSWkUKlogHl1UWWDfFUIqLecOPxRjK3vsrk93pSWlfpCDUih/SAcsUBeFmQ5h0qe
         0VhJVlJA64pTuSJNdl3FmiPNCgHfuH8Z8Q9j6IQ87BR7aF3MtxNvPcefRDAR/dnJK7V4
         +L4oURTNGE2QIMYuzJr4tOKYGYdhI9ufhxwcXQ66qj3XbXwB9mt9ENhbD5mlUw7WfCQ+
         dT6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fwwgu2jx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u2si6778451qkf.331.2018.05.04.11.30.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 04 May 2018 11:30:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=fwwgu2jx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35972 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fEfTc-0007TA-Nm
	for alex.bennee@linaro.org; Fri, 04 May 2018 14:30:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEfTQ-0007Sh-L7
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fEfTN-000117-ED
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:28 -0400
Received: from mail-pf0-x231.google.com ([2607:f8b0:400e:c00::231]:39960)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fEfTM-0000zM-UC
	for qemu-arm@nongnu.org; Fri, 04 May 2018 14:30:25 -0400
Received: by mail-pf0-x231.google.com with SMTP id f189so18067356pfa.7
	for <qemu-arm@nongnu.org>; Fri, 04 May 2018 11:30:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=NnLHwPEUHd78QMOSxXEfR74eTOdxsx0ytS3dgUv9VU0=;
	b=fwwgu2jx2Lylima6B6vnY1QB7q4+83ORXYVq/KAZt0jncDjtxn+M3Do1YCXwelxdyN
	mlxt/HaE1xIHss4AzFaZy28SZKXuu4K0n1lDSD1KbqLipYiTab+d4L8spVc+iSHKzaU4
	0Cq/feOOinUKLolSw69wfhUPUsdYCj5R5uIjo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=NnLHwPEUHd78QMOSxXEfR74eTOdxsx0ytS3dgUv9VU0=;
	b=Vho1jCpCTXk7Lw/d45pc0KONWpse+r7bYZ93jQhaUmaS1DZ9E0+0/OdoVU9h9PKmPG
	4VwFTCbhZz4gB8GL8Qya52qR4rYH53cGxCNMWYPHeklaQ0ZagnFCYF7Ytc93T0S0E/l7
	GXDSp83MAueHnEDS9UlGn8ZUda+kshNzC78WAKKKW5PJq5/bMxGfjSXXk6gMXZS66LZR
	H9Z/EFi5J7LOD43kjBqSD6o0HSrCvKC2q5xT2NzJJ6lAkkIjhDDT9ltNpv0v14upMFox
	YRju3w4LtoI5R5CYCl3B3gNQVSNkRdM4WbZ6ExJRFfCGVL1LJi+hZ5a2G3NbloDMRG6j
	jJmA==
X-Gm-Message-State: ALQs6tD5kLFjWuTrtY2b82vfeLZyn7MBApWgV3YrVUMqpu/uiA2wsH+a
	voRxjSbLkBpzJhTuCTbIrjy54A==
X-Received: by 2002:a65:50cc:: with SMTP id
	s12-v6mr23606926pgp.313.1525458623734; 
	Fri, 04 May 2018 11:30:23 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	r8-v6sm16987413pgn.2.2018.05.04.11.30.22
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 04 May 2018 11:30:22 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Fri,  4 May 2018 11:30:11 -0700
Message-Id: <20180504183021.19318-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::231
Subject: [Qemu-arm] [PATCH v2 00/10] target/arm: Implement v8.1-Atomics
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: QC29/ydeG2x2

This implements the Atomics extension, which is mandatory for v8.1.
While testing the v8.2-SVE extension, I've run into issues with the
GCC testsuite expecting this to exist.

Missing is the wiring up of the system registers to indicate that
the extension exists, but we have no system CPU model that would
exercise such a setting.

Changes since v2:
  * New patch to use a helper macro for opposite-endian
    atomic_fetch_add and atomic_add_fetch, as suggested
    by pm215.
  * Introduce ARM_FEATURE_V8_1 and define ARM_FEATURE_V8_ATOMICS
    in terms of that, reinforcing the mandatory nature of
    the extension.
  * Typo fix in patch 8.


Peter, do you want to take the whole thing into target-arm.next,
or have it split?  We have a review and an ack for the riscv and
xtensa patches.


r~


Richard Henderson (10):
  tcg: Introduce helpers for integer min/max
  target/arm: Use new min/max expanders
  target/xtensa: Use new min/max expanders
  tcg: Introduce atomic helpers for integer min/max
  tcg: Use GEN_ATOMIC_HELPER_FN for opposite endian atomic add
  target/riscv: Use new atomic min/max expanders
  target/arm: Introduce ARM_FEATURE_V8_ATOMICS and initial decode
  target/arm: Fill in disas_ldst_atomic
  target/arm: Implement CAS and CASP
  target/arm: Enable ARM_FEATURE_V8_ATOMICS for user-only

 accel/tcg/atomic_template.h | 112 ++++++++-----
 accel/tcg/tcg-runtime.h     |   8 +
 target/arm/cpu.h            |   2 +
 target/arm/helper-a64.h     |   2 +
 tcg/tcg-op.h                |  50 ++++++
 tcg/tcg.h                   |   8 +
 linux-user/elfload.c        |   1 +
 target/arm/cpu64.c          |   1 +
 target/arm/helper-a64.c     |  43 +++++
 target/arm/translate-a64.c  | 375 +++++++++++++++++++++++++++++++++++---------
 target/riscv/translate.c    |  72 +++------
 target/xtensa/translate.c   |  50 ++++--
 tcg/tcg-op.c                |  48 ++++++
 13 files changed, 587 insertions(+), 185 deletions(-)

-- 
2.14.3

