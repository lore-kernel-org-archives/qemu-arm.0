Received: by 10.28.173.206 with SMTP id w197csp3096357wme;
        Mon, 15 Jan 2018 11:43:44 -0800 (PST)
X-Google-Smtp-Source: ACJfBoserpUQYHAX8PZFclgyag8aK2QgpV0GlNODIrFLZqElZF6ub+ld+l8H0AakjLc4fsrqM/Zw
X-Received: by 10.129.57.9 with SMTP id g9mr29309282ywa.179.1516045424773;
        Mon, 15 Jan 2018 11:43:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516045424; cv=none;
        d=google.com; s=arc-20160816;
        b=fJmFF4SZRnr9BKFHYINHPq2WhpF/xF3E2HZCrBGb+NaWSjQwqyDkbyPMQu3ZOQDu4K
         8edJS5st7k8+0/7nGj2Si+G3xSm8WKlHChKAqPq0zl9sG3JfcYVhFTwf+arLUfTq/bxI
         B1oMroqxhjZ11baB7UJn4fpHhSrjmU3boTTLJVqn8D17piNMHpAyr2FrgwGU9Uk9yo32
         5oy2N80SZwpx4naQ4gl9J+MuIXVOaxmla5vm+sZEWjZ16Wpg40dRRXdwbekTpaqz/G90
         KuFCT7YvdOMH+o4sFE17WVPgHzDcIjniK9immwKYgB5KXQh5ifYXwSo1G8kqHDdsitS0
         HrIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=kwAR7AygaFv4qZcR/1o06VS1dTRgQpFr9r1xOw5l3N0=;
        b=azSykeHi20ueu5/aUE4Rz/K+M+6b32tCLVATmKEuNQNxVlsX6fMMvzGR3Y/+0yBZX6
         uykTLbSYIJxQqH9HVl47qVgzYchBlPQFzk4jyF6EECsbTy8YXgPPYOo9WShNtfCm11ny
         ObeysFP30cnB7XgVBU1cQ2j/LXckFOS4aQGXXTqTkkoPR8WUZp9xJZWi5UuhAtTywj6+
         evEJU0XAixch5ssk41HBlxsxD/Q5KSW3AHCavd4LRAo/zilvz8wFWLOqFAbAA6aHu9Bj
         7tanBR0KKar/HyRec/px4xjLqLelwXUsI8Kn5VFKuj5OQzwhYh+YghxXeYl19AvmZv+m
         xEog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NyeE8UWI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i6si79654ybm.622.2018.01.15.11.43.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 15 Jan 2018 11:43:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NyeE8UWI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57995 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ebAfY-00027a-6c
	for alex.bennee@linaro.org; Mon, 15 Jan 2018 14:43:44 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53296)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1ebAfO-00026K-BI
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 14:43:35 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <ard.biesheuvel@linaro.org>) id 1ebAfK-0007KA-BY
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 14:43:34 -0500
Received: from mail-wr0-x242.google.com ([2a00:1450:400c:c0c::242]:41744)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <ard.biesheuvel@linaro.org>)
	id 1ebAfK-0007Js-4L
	for qemu-arm@nongnu.org; Mon, 15 Jan 2018 14:43:30 -0500
Received: by mail-wr0-x242.google.com with SMTP id o7so12895753wro.8
	for <qemu-arm@nongnu.org>; Mon, 15 Jan 2018 11:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=kwAR7AygaFv4qZcR/1o06VS1dTRgQpFr9r1xOw5l3N0=;
	b=NyeE8UWISoZ7wdhxCNAfl56UsyC1TYAtPFB7DIXgkbEYXOYzhS4pEa6TmqOBRPnffB
	2QuGMH2KdiBp2hd8cYuUqSTGnDMNPJu9m/WxDD4uNzpq1k/DegjDha2W+nj+mDCnQ1W7
	1wy6AIQS1VMNXumm1N3gxxWmWJeXC/Wy0SNeM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=kwAR7AygaFv4qZcR/1o06VS1dTRgQpFr9r1xOw5l3N0=;
	b=RzwRGBUfpWt0Z0EdEyYhEx6/YPMxnIgt8426qNUFKMJGjWufLauOC2/gARf9sbM2F5
	TOWgEHMtbaDK8C7ntpprVQXewqdywGm+e0bzbkjGHwDQFozhZ9c/LjoTKiFMxHhpX7jO
	AOEhHV34jUbN2qjFfa9GzeMxNqFDn8wAfZ9ZABsYYek74dmgB/s/1Sj4Cph5DPOEKp7M
	deUqWhBB41QKzNiV+jQ/cG3LrdzpS0TBirW0C+izq0pmEC9b78x9bK6U8D+OaTflyeqj
	53OvNMjgULmN1UGaVt9VgPYIDG/OoECbsHEPYX4t7VnxcsytE364IKL5r5QhXjaGLf/c
	JlUA==
X-Gm-Message-State: AKGB3mJ2hypLcCG2k5tfx3BA/Xsoq/jhH8qlmXQSbSLkiZcXpkdGS8yQ
	ND+I/TWuezkUY7pQn/unLd4U6f0IqEQ=
X-Received: by 10.223.145.198 with SMTP id 64mr29472266wri.163.1516045408672; 
	Mon, 15 Jan 2018 11:43:28 -0800 (PST)
Received: from localhost.localdomain ([160.90.52.105])
	by smtp.gmail.com with ESMTPSA id 34sm435051wro.7.2018.01.15.11.43.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 15 Jan 2018 11:43:27 -0800 (PST)
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
To: qemu-arm@nongnu.org
Date: Mon, 15 Jan 2018 19:43:17 +0000
Message-Id: <20180115194321.15411-1-ard.biesheuvel@linaro.org>
X-Mailer: git-send-email 2.11.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::242
Subject: [Qemu-arm] [PATCH v3 0/4] target-arm: add SHA-3,
 SM3 and SHA512 instruction support
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
Cc: peter.maydell@linaro.org, Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: alSbypkL3LtU

This v3 is a follow-up to the single patch 'target/arm: implement SHA-512
instructions' sent out on the 9th of January.

Changes since v2:
- fix thinko in big-endian aware handling of 64-bit quantities: this is not
  needed given that the NEON registers are represented as arrays of uint64_t
  so they always appear in the correct order.
- add support for SM3 instructions (Chinese SHA derivative)

Changes since v1:
- update SHA512 patch to adhere more closely to the existing style, and to
  the way the instruction encodings are classified in the ARM ARM (#1)
- add patch implementing the new SHA3 instructions EOR3/RAX1/XAR/BCAX (#2)
- enable support for these instructions in user mode emulation (#3)

Ard Biesheuvel (4):
  target/arm: implement SHA-512 instructions
  target/arm: implement SHA-3 instructions
  target/arm: implement SM3 instructions
  target/arm: enable user-mode SHA-3, SM3 and SHA-512 instruction
    support

 linux-user/elfload.c       |  18 ++
 target/arm/cpu.h           |   3 +
 target/arm/cpu64.c         |   3 +
 target/arm/crypto_helper.c | 311 +++++++++++++++++++-
 target/arm/helper.h        |  15 +
 target/arm/translate-a64.c | 255 ++++++++++++++++
 6 files changed, 604 insertions(+), 1 deletion(-)

-- 
2.11.0

