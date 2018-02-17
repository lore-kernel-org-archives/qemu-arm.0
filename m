Received: by 10.28.71.27 with SMTP id u27csp2069620wma;
        Sat, 17 Feb 2018 10:23:51 -0800 (PST)
X-Google-Smtp-Source: AH8x224dV712dyUabqQE7x6G+frp+Zlf2qpJD4UP3zw0iet4TYsfXg3dQEx5GJbso9eM312bM1ve
X-Received: by 10.129.78.147 with SMTP id c141mr1250963ywb.369.1518891831407;
        Sat, 17 Feb 2018 10:23:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518891831; cv=none;
        d=google.com; s=arc-20160816;
        b=eqaBUzTWXBZORQHorERNC4MHwFBO2OlepANvNKBCdWY/7aJpGaY/C6AvAk4RFqlm1Q
         GxeT8uf2xzvv1xDtZggVTvhlTAhARZ0bDnIyKPrfRIISTvje5QiSEqlR1/HQp++WSXK+
         rhyOvLktP+DbnLkS3lavtXNTg8B/5w5X++LOIIR4KJ8PoIiZNMgSqZWQ5uwXYFCfIndp
         7Znwc9vC/pMwDCDIGR/ABey7gZHs5QO2019/DrfnhpPurv1kFybhEccz3OX9lEpx4Vc+
         /BtF7buhKLiDYmaWqfV+Mhp4IdaDcEs/Mga/gi4b18EuI0L5nEQyhyBOBnf0RWx1nEXR
         elkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=Ozq4WtqLivT5jWxg2n96ncRQlgTHTuUgA5WefsvrPFU=;
        b=BVBDqIIMLCe5kl8OlDH6LyJlh3XI8gclTPh9gj14g4vwLywbAbfUWJ+86aLzDFIfmi
         uLSoX4urffZEBl1iEO+gFWRu7V3rrC9AJNQp+efKAopRUKQ+4d1u87CcF5kSlKwvjR2Q
         kVlJZj3eVZpXBi79pZc5+ACYkGQag4Ciu3q7B6zpU6ml46HtmItD7H6yPZZ39TewAZET
         lWe1jHo74YOc/0VZeo/5DJTrkCi9br6HVfyhZGklSz32HCUGQOiD+R8sJoXKAeNNCExp
         5EcImeesXf1xemD/3G5nrD3UgHCjkhFTBJ9FdsPOnxQzt0EES7fXN7184u2r3Ge9Ta1f
         BSKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NFVOk4hN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i67si3543320ywd.256.2018.02.17.10.23.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 17 Feb 2018 10:23:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NFVOk4hN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48047 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1en79K-00007W-Og
	for alex.bennee@linaro.org; Sat, 17 Feb 2018 13:23:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en792-0008W8-DF
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1en78y-0001Q7-8x
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:31 -0500
Received: from mail-pl0-x244.google.com ([2607:f8b0:400e:c01::244]:45433)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1en78x-0001Pq-Us
	for qemu-arm@nongnu.org; Sat, 17 Feb 2018 13:23:28 -0500
Received: by mail-pl0-x244.google.com with SMTP id p5so3428017plo.12
	for <qemu-arm@nongnu.org>; Sat, 17 Feb 2018 10:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=Ozq4WtqLivT5jWxg2n96ncRQlgTHTuUgA5WefsvrPFU=;
	b=NFVOk4hN14V54rAn0lS8oIiUImXT2MMeTmNligt11jZRuDVZw76s0goU8wJE2RlSfA
	t5T5XBPvAYMQCA8mLI9VxGCvgKuvSTMjBi0WgGhHevYMIEEOgjLgve3TAlgiFCpQdA8D
	CmeV0kd1Ct0aE02D9uxwKsVJmyqBORyespouk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Ozq4WtqLivT5jWxg2n96ncRQlgTHTuUgA5WefsvrPFU=;
	b=ALG8xgrIf4qIvlx39s7GtrmkNaAFIpm1FrfaUOR6rcA7AcRk+9cwCfFRXU/hjRQOQ1
	fWMAvXJvhqNmofr24GrhVSpNyZ/HEtYsTq4TxKj3I/oNoYoTWZxYhtVlGMAtVO8Fm6Wj
	5Hyyc2K9UVUTgvcynJEveFGhvl5iYF1Grok/0EV1bN7Xb0znO9zmyl5Wb72ygz/xUJgX
	4u8HQNNjEqjzMPGJHkwDUB24B2787c86Xy77Aixg234QzPvgbXbZdpseKykg0C7Enk55
	yNgY9FKPzvZzQCHEpVJbCNQqnYZHW0yw8xc4m/dcypzBrEKDwSkZdAju40d8IGrXKEAl
	/yFw==
X-Gm-Message-State: APf1xPAZbiEyXeT9RnIi8vJXpBm7pWH+CSG8BI339gdYroo4D7waU0vw
	CSqMXyqCshBBrsqfNSxv9SmVSQ==
X-Received: by 2002:a17:902:b488:: with SMTP id
	y8-v6mr8853476plr.432.1518891806645; 
	Sat, 17 Feb 2018 10:23:26 -0800 (PST)
Received: from cloudburst.twiddle.net ([50.0.192.64])
	by smtp.gmail.com with ESMTPSA id
	h15sm13466712pfi.56.2018.02.17.10.23.24
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 17 Feb 2018 10:23:25 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 17 Feb 2018 10:22:16 -0800
Message-Id: <20180217182323.25885-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::244
Subject: [Qemu-arm] [PATCH v2 00/67] target/arm: Scalable Vector Extension
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
Cc: qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9PN4EuVYMy2m

This is 99% of the instruction set.  There are a few things missing,
notably first-fault and non-fault loads (even these are decoded, but
simply treated as normal loads for now).

The patch set is dependant on at least 3 other branches.
A fully composed tree is available as

  git://github.com/rth7680/qemu.git tgt-arm-sve-7

There are a few checkpatch errors due to macros and typedefs, but
nothing that isn't be obvious as a false positive.

This is able to run SVE enabled Himeno and LULESH benchmarks as
compiled by last week's gcc-8:

$ ./aarch64-linux-user/qemu-aarch64 ~/himeno-advsimd
mimax = 129 mjmax = 65 mkmax = 65
imax = 128 jmax = 64 kmax =64
cpu : 67.028643 sec.
Loop executed for 200 times
Gosa : 1.688752e-03 
MFLOPS measured : 49.136295
Score based on MMX Pentium 200MHz : 1.522662

$ ./aarch64-linux-user/qemu-aarch64 ~/himeno-sve 
mimax = 129 mjmax = 65 mkmax = 65
imax = 128 jmax = 64 kmax =64
cpu : 43.481213 sec.
Loop executed for 200 times
Gosa : 3.830036e-06 
MFLOPS measured : 75.746259
Score based on MMX Pentium 200MHz : 2.347266

Hopefully the size of the patch set isn't too daunting...


r~


Richard Henderson (67):
  target/arm: Enable SVE for aarch64-linux-user
  target/arm: Introduce translate-a64.h
  target/arm: Add SVE decode skeleton
  target/arm: Implement SVE Bitwise Logical - Unpredicated Group
  target/arm: Implement SVE load vector/predicate
  target/arm: Implement SVE predicate test
  target/arm: Implement SVE Predicate Logical Operations Group
  target/arm: Implement SVE Predicate Misc Group
  target/arm: Implement SVE Integer Binary Arithmetic - Predicated Group
  target/arm: Implement SVE Integer Reduction Group
  target/arm: Implement SVE bitwise shift by immediate (predicated)
  target/arm: Implement SVE bitwise shift by vector (predicated)
  target/arm: Implement SVE bitwise shift by wide elements (predicated)
  target/arm: Implement SVE Integer Arithmetic - Unary Predicated Group
  target/arm: Implement SVE Integer Multiply-Add Group
  target/arm: Implement SVE Integer Arithmetic - Unpredicated Group
  target/arm: Implement SVE Index Generation Group
  target/arm: Implement SVE Stack Allocation Group
  target/arm: Implement SVE Bitwise Shift - Unpredicated Group
  target/arm: Implement SVE Compute Vector Address Group
  target/arm: Implement SVE floating-point exponential accelerator
  target/arm: Implement SVE floating-point trig select coefficient
  target/arm: Implement SVE Element Count Group
  target/arm: Implement SVE Bitwise Immediate Group
  target/arm: Implement SVE Integer Wide Immediate - Predicated Group
  target/arm: Implement SVE Permute - Extract Group
  target/arm: Implement SVE Permute - Unpredicated Group
  target/arm: Implement SVE Permute - Predicates Group
  target/arm: Implement SVE Permute - Interleaving Group
  target/arm: Implement SVE compress active elements
  target/arm: Implement SVE conditionally broadcast/extract element
  target/arm: Implement SVE copy to vector (predicated)
  target/arm: Implement SVE reverse within elements
  target/arm: Implement SVE vector splice (predicated)
  target/arm: Implement SVE Select Vectors Group
  target/arm: Implement SVE Integer Compare - Vectors Group
  target/arm: Implement SVE Integer Compare - Immediate Group
  target/arm: Implement SVE Partition Break Group
  target/arm: Implement SVE Predicate Count Group
  target/arm: Implement SVE Integer Compare - Scalars Group
  target/arm: Implement FDUP/DUP
  target/arm: Implement SVE Integer Wide Immediate - Unpredicated Group
  target/arm: Implement SVE Floating Point Arithmetic - Unpredicated
    Group
  target/arm: Implement SVE Memory Contiguous Load Group
  target/arm: Implement SVE Memory Contiguous Store Group
  target/arm: Implement SVE load and broadcast quadword
  target/arm: Implement SVE integer convert to floating-point
  target/arm: Implement SVE floating-point arithmetic (predicated)
  target/arm: Implement SVE FP Multiply-Add Group
  target/arm: Implement SVE Floating Point Accumulating Reduction Group
  target/arm: Implement SVE load and broadcast element
  target/arm: Implement SVE store vector/predicate register
  target/arm: Implement SVE scatter stores
  target/arm: Implement SVE prefetches
  target/arm: Implement SVE gather loads
  target/arm: Implement SVE scatter store vector immediate
  target/arm: Implement SVE floating-point compare vectors
  target/arm: Implement SVE floating-point arithmetic with immediate
  target/arm: Implement SVE Floating Point Multiply Indexed Group
  target/arm: Implement SVE FP Fast Reduction Group
  target/arm: Implement SVE Floating Point Unary Operations -
    Unpredicated Group
  target/arm: Implement SVE FP Compare with Zero Group
  target/arm: Implement SVE floating-point trig multiply-add coefficient
  target/arm: Implement SVE floating-point convert precision
  target/arm: Implement SVE floating-point convert to integer
  target/arm: Implement SVE floating-point round to integral value
  target/arm: Implement SVE floating-point unary operations

 target/arm/cpu.h           |    7 +-
 target/arm/helper-sve.h    | 1285 ++++++++++++
 target/arm/helper.h        |   42 +
 target/arm/translate-a64.h |  110 ++
 target/arm/cpu.c           |    7 +
 target/arm/cpu64.c         |    1 +
 target/arm/sve_helper.c    | 4051 ++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c |  112 +-
 target/arm/translate-sve.c | 4626 ++++++++++++++++++++++++++++++++++++++++++++
 target/arm/vec_helper.c    |  178 ++
 .gitignore                 |    1 +
 target/arm/Makefile.objs   |   12 +-
 target/arm/sve.decode      | 1067 ++++++++++
 13 files changed, 11408 insertions(+), 91 deletions(-)
 create mode 100644 target/arm/helper-sve.h
 create mode 100644 target/arm/translate-a64.h
 create mode 100644 target/arm/sve_helper.c
 create mode 100644 target/arm/translate-sve.c
 create mode 100644 target/arm/vec_helper.c
 create mode 100644 target/arm/sve.decode

-- 
2.14.3

