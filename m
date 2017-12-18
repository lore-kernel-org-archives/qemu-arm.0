Received: by 10.223.159.74 with SMTP id f10csp2957222wrg;
        Mon, 18 Dec 2017 10:07:57 -0800 (PST)
X-Google-Smtp-Source: ACJfBousgM1VLPP1fi4eI6RrmsmmtOzgPbyrYg8E+EJ4OnFuEYKk46sjMEgV3Me4LpQ1J2Dts8ic
X-Received: by 10.13.221.133 with SMTP id g127mr483665ywe.125.1513620477195;
        Mon, 18 Dec 2017 10:07:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513620477; cv=none;
        d=google.com; s=arc-20160816;
        b=iQB6csaR6B7J3VfdG3JB3L4hbKqrr9OtNTIHNpucbirIbPMXEIPU1NKK9RVakvqAY9
         fxUW2hg4mSjzkQQfN0Nyhqd0M13YdUwSl4K+64KdFnBcWCaxQKSdQE19buvg+cGvFAqJ
         oY+FEum6c+kEeJPNlqs5vo6iEnILLjglbQRCUxQTWXwAUtxRwM0b8TG2JYRhlioXr49w
         N5J77cnBwvBMvokECunjgq+MUeN0QsZCZJoj41ifz0WNOErEum7WPe6Y0O7Ld96oDYj8
         a/H3R9cxFb0FmHgGV1XffGE89/61wojxVWbL11Yxtx6Dn8D8IUiVUW6sQsXAT+7QUGOR
         V3nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=ntY/xc7cGIfcX1jinEy509cxK4QqnzxFIJhymRyfm0s=;
        b=us9PUW4L9wMly7QMa2psdPruY4BL3SnGxd1tNJ3bEAKuH9XjzqDTYwsX77TqpCTpZn
         e9GqNHx3jX4XZiBSJCYRKgm6mfWJ23zVWzFDtsSlGegkY/2KY7gQji2wZA51jNmBgmGC
         ypAYn+7SbalqmY2vOXAEOCMoKQoHl7uLDwUNL20bN1mGXHoKjazbbikSQWKvRVSeXrJI
         1F4gXZBxE4L1WYbTypBWWmxHY+e4x4WF5+Nj1Nmvocy6tEpA0LTnyTyvgbt9KuDI99Do
         99JfTSfeiQ5zvSCyBm9YO60iti04Km9cK0Rest+9R6U0RSv3OzwwzFL4KwRD/1EMRg9J
         ubmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V9iiBAQV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r7si1811525ybb.413.2017.12.18.10.07.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 10:07:57 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=V9iiBAQV;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60175 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQzpU-0002UO-HF
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 13:07:56 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44141)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzFF-0002XR-Be
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:30:31 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzFC-0004Xy-1W
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:30:29 -0500
Received: from mail-pg0-x241.google.com ([2607:f8b0:400e:c05::241]:46583)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQzFB-0004WI-QV
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:30:25 -0500
Received: by mail-pg0-x241.google.com with SMTP id b11so9404289pgu.13
	for <qemu-devel@nongnu.org>; Mon, 18 Dec 2017 09:30:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=ntY/xc7cGIfcX1jinEy509cxK4QqnzxFIJhymRyfm0s=;
	b=V9iiBAQVsLx+pksow41ynnne1jOqKDmdzIGLxEXweAp2QgVUbdbol/r9k0e4JY66RW
	7cT1PKWZIdO+QIYGbkd8Gy3Va3FFczGMDO7J9elgHoDnnaifD8pWpUX/RBcsfoor1/YN
	FmdUwtWBhyyLiYA0edUVcVtwTiaLaNOMa8198=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=ntY/xc7cGIfcX1jinEy509cxK4QqnzxFIJhymRyfm0s=;
	b=psw6v3TRBDJ6l9l4D4HBErSBY+EtUSE/Q8J4wUSowhtQQAubpfhXC6kJRIavsFj8sY
	uKn1LWcUmer9nDq+uLVXH1FKMnjx6NGcSwFoUPzY8vityslzY3tJovTRWyjbrveSdl2a
	2qCxw5sGSa4fhJJd2WMKBYCOYufOop+YObysjGMX+RegAMN0ULsNVHg+n9HphNiYAgHR
	hSVvFNEorpyFPuCwnmk5h+h2RpqmrQadoiLqcYV1hpEP4kS8prUNcr4XGMUNjDxXWKub
	8yYQcTm6eCFchT9OQ/fmwiQEh1XG5TaIwORL8dSnWXn+GI9Jke5w4yvftsosBTPaXvIM
	0OGA==
X-Gm-Message-State: AKGB3mI+jHN3PrGwlaGA/V0XAGzT1jAjWQFIz2KH4KW5R7C5rXRlvqed
	BfT8YwR10AIsIkNFhMPcg2ljY1lIOOM=
X-Received: by 10.98.18.88 with SMTP id a85mr419532pfj.141.1513618224555;
	Mon, 18 Dec 2017 09:30:24 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63]) by smtp.gmail.com with ESMTPSA id
	h69sm26553411pfe.107.2017.12.18.09.30.23
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:30:23 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:30:13 -0800
Message-Id: <20171218173022.18418-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::241
Subject: [Qemu-devel] [PATCH 0/9] target/arm: Prepatory work for SVE
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ARziQe/XlP8I

This is primarily about changing the representation of env->vfp.regs
to allow for the larger vector sizes.


r~


Richard Henderson (9):
  target/arm: Mark disas_set_insn_syndrome inline
  target/arm: Use pointers in crypto helpers
  target/arm: Use pointers in neon zip/uzp helpers
  target/arm: Use pointers in neon tbl helper
  target/arm: Add aa32_vfp_dreg/aa64_vfp_qreg helpers
  vmstate: Add VMSTATE_UINT64_SUB_ARRAY
  target/arm: Expand vector registers for SVE
  target/arm: Add ZCR.LEN to tb->flags
  target/arm: Add ARM_FEATURE_SVE

 include/migration/vmstate.h |   9 ++-
 target/arm/cpu.h            | 127 ++++++++++++++++++++++--------
 target/arm/helper.h         |  46 +++++------
 target/arm/translate.h      |   3 +-
 linux-user/signal.c         |  22 +++---
 target/arm/arch_dump.c      |   8 +-
 target/arm/cpu.c            |   2 +
 target/arm/cpu64.c          |   1 +
 target/arm/crypto_helper.c  | 184 +++++++++++++++++---------------------------
 target/arm/helper-a64.c     |  13 ++--
 target/arm/helper.c         |  32 +++++---
 target/arm/kvm32.c          |   4 +-
 target/arm/kvm64.c          |  31 +++-----
 target/arm/machine.c        |  37 ++++++++-
 target/arm/neon_helper.c    | 162 ++++++++++++++++++++------------------
 target/arm/op_helper.c      |  17 ++--
 target/arm/translate-a64.c  | 106 ++++++++++++-------------
 target/arm/translate.c      | 138 ++++++++++++++++++---------------
 18 files changed, 510 insertions(+), 432 deletions(-)

-- 
2.14.3

