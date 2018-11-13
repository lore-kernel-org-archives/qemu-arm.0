Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp4521643wrw;
        Tue, 13 Nov 2018 07:43:53 -0800 (PST)
X-Google-Smtp-Source: AJdET5foXrhpu0h+0HIbo9SwdDxP4rT8w2xOghpCrWPBkCqQ+87q6oprVamLKRsusMipS1LkaxkV
X-Received: by 2002:a37:9f87:: with SMTP id i129mr5021711qke.255.1542123833868;
        Tue, 13 Nov 2018 07:43:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542123833; cv=none;
        d=google.com; s=arc-20160816;
        b=t4//VbBuBnnzbtf7x4I9oyMbKrh264eovexwSCDXltsiu9DtB54eZBqoPuVHHQBvWV
         GwzVk5XpnJbnYNK8HkVHgp3OIvtSS9k9PAji3w+YB+4F9Nq05+wW6ygxkrfOHAMRcbri
         jAKbC9Q+GlvrDuwHtIjA7WZl55XyR8+7AZqRPzRNEIFqA7sx06LPqBilgplQtoXpc1Wu
         lHGPANZTu16QWutdlvtIdGhkEgSsflBTkiJaL8KQBmYfaZRMLm5bx00aM2QQNzK3ozlZ
         gKs52950ArTfgQcRmsUH9hN3WmmBhc8vMEAXq1auEJu9f7mikvO/W0P7KjQnitiCx+fB
         l6Tg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature;
        bh=zsHwg3pCehxQaNMIvw7MAwH96N1Y5gB2a3hrCfRdLjs=;
        b=srOYXncteoWW1XnWsDT9dQyL/2YdiadjrnwYDWUb898zyoC8v02clGEnQnOCqiwjrD
         nUrKE1jPL714Kc8oV7tFW6wZwpruyAlMQN6mfwmpmz05PcKkCw8HuJ1MZXEbLSNm3wE4
         O9cPn5YqSvOpW8dapjx9a2GIEJ3wOieHw5wWAw0IjEwYxH5zzJtywn24vqORJQvWqv6S
         assbcD7M7LhrfBEySCdvZjXGL+HR1p0kxl27XFYYQLPrGfDPE9ZpyENcPkmQzCzjmXTC
         k8CeA4SC+Spwi8+Rl2DYy0j5u/fnG06xhdDexNJFjy4+ca83lv1dvlk1VCr0G5wvaXbl
         a+GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iNc1w3cu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 42si2198608qvd.29.2018.11.13.07.43.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 13 Nov 2018 07:43:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iNc1w3cu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54552 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gMar3-0002Tt-CZ
	for alex.bennee@linaro.org; Tue, 13 Nov 2018 10:43:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40480)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMaqr-0002T2-Ky
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 10:43:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1gMaqb-0002Gy-3H
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 10:43:32 -0500
Received: from mail-wm1-x344.google.com ([2a00:1450:4864:20::344]:56102)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1gMaqW-0002C0-CQ
	for qemu-arm@nongnu.org; Tue, 13 Nov 2018 10:43:21 -0500
Received: by mail-wm1-x344.google.com with SMTP id i73-v6so7116145wmd.5
	for <qemu-arm@nongnu.org>; Tue, 13 Nov 2018 07:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=zsHwg3pCehxQaNMIvw7MAwH96N1Y5gB2a3hrCfRdLjs=;
	b=iNc1w3cuxKr9OZzKqKZAy/0RXqI9y9gtkLbHHmyaQo7ugOfV/IosmuaVxvZD8w21Y0
	/oySF3BLrDKOoY8v/dvR5g/R5+3ae5QsXczlKxUgi2mTWGZpUSUrO1I7FsFH0btbSM8K
	RHIxfqLHKYErJPJ7a4mEpVEuYtrdsJ3w+5VQk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=zsHwg3pCehxQaNMIvw7MAwH96N1Y5gB2a3hrCfRdLjs=;
	b=k8btfF8MGwSz1NDNFdHHbOf1MRH/0gOn6g3x+VBmeuNpHGt5TYXqIoAI9j2o8ekjAw
	k3PiYur9WdP7K5ULoRSWDALnU61BOpAdLtBpRCvVk+ykIaHf9zv1pusyfvNB9xpM8pqs
	4TYRbb2wiKxFi2xNJ8nNt9BVGWqvcj+Lq74CvT/tuAwZIDWOIW4Px+9v3/Ajm+ZRmcVD
	yO3HueuxgSr480V4ZjGdgTpEFqtJpSN5rRkhJItZK30oHufR+4kNG1qgEdrVUdrc3GKE
	uBkCD6Q0rGSNIRr0y/yTSU1U5j/Ev4nx+q7UKvllcNKmXhN8HdMJGE+04japnCxYqKwH
	7s4w==
X-Gm-Message-State: AGRZ1gJoAnnAEDPEdd5gNHKf2ckaLe7a9J8jQStEZYy8iqBBr+82jfWa
	ybaRcUyvLHGmj4woRPqsmaIuiw==
X-Received: by 2002:a1c:d1cd:: with SMTP id i196mr3596729wmg.107.1542123796234;
	Tue, 13 Nov 2018 07:43:16 -0800 (PST)
Received: from cloudburst.twiddle.net
	(26.red-176-87-105.dynamicip.rima-tde.net. [176.87.105.26])
	by smtp.gmail.com with ESMTPSA id
	s16sm3479709wrt.77.2018.11.13.07.43.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 13 Nov 2018 07:43:15 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 13 Nov 2018 16:42:22 +0100
Message-Id: <20181113154226.14396-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.2
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::344
Subject: [Qemu-arm] [PATCH v4 0/4] target/arm: KVM vs ARMISARegisters
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
X-TUID: RahfaZ2JdwcR

My previous patch set for replacing feature bits with id registers
failed to consider that these id registers are beginning to control
migration, and thus we must fill them in for KVM as well.

Thus, we want to initialize these values within CPU from the host.


Changes, v3->v4:
  * Drop THUMB2EE patch; will revisit next development cycle.
  * Fix aa32 id_isar6 read on old kernels (pmm).

Changes, v2->v3:
  * Work around sysreg read failures from old host kernels.

Changes, v1->v2:
  * Remove assert that AArch32 sysreg <= UINT32_MAX.
  * Remove unused local variable.
  * Add commentary for AArch32 sysregs vs missing AArch32 support.


r~


Richard Henderson (4):
  target/arm: Install ARMISARegisters from kvm host
  target/arm: Fill in ARMISARegisters for kvm64
  target/arm: Introduce read_sys_reg32 for kvm32
  target/arm: Fill in ARMISARegisters for kvm32

 target/arm/kvm_arm.h |  1 +
 target/arm/kvm.c     |  1 +
 target/arm/kvm32.c   | 77 ++++++++++++++++++++++++++++----------------
 target/arm/kvm64.c   | 62 +++++++++++++++++++++++++++++++++--
 4 files changed, 111 insertions(+), 30 deletions(-)

-- 
2.17.2

