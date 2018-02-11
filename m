Received: by 10.28.71.27 with SMTP id u27csp3691644wma;
        Sun, 11 Feb 2018 12:59:13 -0800 (PST)
X-Google-Smtp-Source: AH8x227E2YFJOwnupZldCWsVSQcVJwbtD4hsno6QfwAIyPJoRZb0aRPCI4kCwH5yEMjEVwyfuBR7
X-Received: by 10.37.115.84 with SMTP id o81mr6763434ybc.211.1518382753588;
        Sun, 11 Feb 2018 12:59:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518382753; cv=none;
        d=google.com; s=arc-20160816;
        b=JPb8V81KVkqaOE1Oav3di60MTL9brbF/EH7mZagKfp1bp22Z9CP3T0CCzHpQpbfdBh
         0GljFbloHBFbN5p0JyKryYaszKMJ2FK0eNu1mnlfaADcgdobOzKT6RHxsJPEo/EefIck
         8OQwQ+lQ1POaakJ9t4WTXn/6RB52kN85IfTbYQBXYDt3xnz0FS5VvscFa3TgFEE1lIxv
         lO70kLjVlbly0+BE+rfrk94NcH9N4J3wvS0W16s4PUcOgVYPC5d9ay+hvOeYDsFRKVK8
         Ln7J3BS1iHtNUGU2G1p9rZASEasEGF2n0Wx+ohjMR+99b7CY0nt8vP5rf44zy9U6ZYC6
         XrxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=Jz5K9chREC4LnfSvDVGWFukSRzTtwFTUyZa/F8Z0Di4=;
        b=q/gNUNMJJbJ6MY+RJYAAzmhatzK6DvCN56RPeWPD5PEPQ4olKK113gHOwWLzY/tgae
         d8nEhmjGU5jjYVloLO9KZpLWNqNOKeFtDiue9+iScneKUm5XI/XWIiFObif/dWnBb2oB
         WPEJPbW81to9o5WsgE0I5GsbE0ym1dWmMxegt2Ch48f7VLV6qwG6ExqEIGEJV+uSsaTK
         GHdtC+Cp/bcBGqEeTwJG5huw/BiJhUtPsGGAEAxlAoQhPPNdabEb99q6SthxTNfPInHM
         9Fy/Y4bCbM1BEqWqIkVU64PnecE4mCYaT2A7nIR+fUhpact4SbsV9QVtSpMwlKEs0XPt
         g8lg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h0FU/T5v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id a65si730706ybg.170.2018.02.11.12.59.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 11 Feb 2018 12:59:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h0FU/T5v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54929 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekyiO-0006lm-VQ
	for alex.bennee@linaro.org; Sun, 11 Feb 2018 15:59:13 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40249)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekyi6-0006iZ-W2
	for qemu-arm@nongnu.org; Sun, 11 Feb 2018 15:58:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekyi4-00042F-3Y
	for qemu-arm@nongnu.org; Sun, 11 Feb 2018 15:58:55 -0500
Received: from mail-pg0-x243.google.com ([2607:f8b0:400e:c05::243]:41848)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ekyi3-00040x-UL
	for qemu-arm@nongnu.org; Sun, 11 Feb 2018 15:58:52 -0500
Received: by mail-pg0-x243.google.com with SMTP id t4so5094143pgp.8
	for <qemu-arm@nongnu.org>; Sun, 11 Feb 2018 12:58:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=Jz5K9chREC4LnfSvDVGWFukSRzTtwFTUyZa/F8Z0Di4=;
	b=h0FU/T5vNb7zpipPm16DnljyVt47zy7t7boBHnFsneWl96TIFJGJqwo1C6TtT2a5lj
	4cmGdYOdI1/JMO1QMvjpNOf1FjXFXr6BQUDqgA5OFIYmB8AkMgXINJbb2J6i9s11tLXj
	8SwakJeRNQiarM//Hy9yoXHZkoha7pxbYMeLY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Jz5K9chREC4LnfSvDVGWFukSRzTtwFTUyZa/F8Z0Di4=;
	b=GXYa9a24IdLH5dswBcbWAru8rNQb9QUkg7/VmZNZs8So7cHkkbUwmr0uCSeEuYZCXf
	GlFOa/bZW35Sc7aHOfjimgCjCGzogQJhFHhqeVUHPfX3325ruscBx3LC3Nh4RjGaqQN2
	00IvaHRuD9L/ZfEj+dSAQ3OsTJFknBNEkXVog/bjMhK1I6uoZ1+xlV/SO24hqYru5J11
	tE7HO455Qf3zg0aU89iWtIz8inU6gE2ABroZoyULV59T+DkIZY8SR+gC1oW28iqZjIwG
	ryqeLSHazqKC6AbQ2FG5k7gnBU3S44DW0Itj1lY6QTc6nc3eg9coNoAYS03UAZdOoWxO
	DgcQ==
X-Gm-Message-State: APf1xPCQCOtLzn+SYNX+L+4Rot+FAQon+qVHpqFuheK0jFLwQSBJuErR
	fB1cene2fx/HNX25vr3KuviesQ==
X-Received: by 10.99.111.71 with SMTP id k68mr7547595pgc.360.1518382730804;
	Sun, 11 Feb 2018 12:58:50 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	y129sm8850354pgb.27.2018.02.11.12.58.49
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sun, 11 Feb 2018 12:58:49 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sun, 11 Feb 2018 12:58:41 -0800
Message-Id: <20180211205848.4568-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c05::243
Subject: [Qemu-arm] [PATCH v2 0/7] target/arm: More SVE prep work
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
X-TUID: VqI5IswhUfm8

Changes for v2:
Include signal frames and PR_SVE_SET/GET_VL.


Blurb for v1:
First, we had noted that ARM_CP_64BIT needed to be removed from
the ZCR_EL registers, but the patch set was applied without
actually fixing that.

Second, there's an existing bug by which the FPCR/FPSR registers
are not properly trapped when FP is disabled.  Fix that with a
translation-time check.

Third, my attempt at using .accessfn for ZCR_EL fails to take
into account the two different exception syndromes that must be
raised.  Although they probably aren't as important as FPCR/FPSR,
handle them at translation time too.

Fourth, when writing to an AdvSIMD register, zero the rest of
the SVE register.


r~


Richard Henderson (7):
  target/arm: Remove ARM_CP_64BIT from ZCR_EL registers
  target/arm: Enforce FP access to FPCR/FPSR
  target/arm: Suppress TB end for FPCR/FPSR
  target/arm: Enforce access to ZCR_EL at translation
  target/arm: Handle SVE registers when using clear_vec_high
  linux-user: Support SVE in aarch64 signal frames
  linux-user: Implement aarch64 PR_SVE_SET/GET_VL

 target/arm/cpu.h           |  38 ++---
 target/arm/internals.h     |   6 +
 linux-user/signal.c        | 348 ++++++++++++++++++++++++++++++++++++---------
 linux-user/syscall.c       |  20 +++
 target/arm/cpu64.c         |  61 ++++++++
 target/arm/helper.c        |  28 ++--
 target/arm/translate-a64.c | 181 +++++++++++------------
 7 files changed, 480 insertions(+), 202 deletions(-)

-- 
2.14.3

