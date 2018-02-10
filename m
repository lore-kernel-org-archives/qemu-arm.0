Received: by 10.28.71.27 with SMTP id u27csp2742542wma;
        Sat, 10 Feb 2018 15:06:22 -0800 (PST)
X-Google-Smtp-Source: AH8x224fxxOMpVbLXu+3uNJlA5mveo+ICwxzMnD15GtHCslLu7kjbFnyu2sFCytKp+Il5w23vxl7
X-Received: by 10.13.199.7 with SMTP id j7mr5149473ywd.433.1518303981910;
        Sat, 10 Feb 2018 15:06:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1518303981; cv=none;
        d=google.com; s=arc-20160816;
        b=n48S5TjivOjLCdQAvpTWe23KlreOwSGnlwZoAb71Xnkd2BvJZ6HAcBTHFyyxYujZLJ
         UbfHtmCAVGMVKbOtDmuD4Qu8f0VIUAoYxnMUif2NuFMq9LvHG43nGUabc7zb8rsJtEhW
         S+utAVJNgBNXwO74mTxliIT/yV/bg16pNuhOlqZbmTqzTh6xda77J5/cljDiERB8bI3A
         +vWWvZI2wPsD83pJwSq5TDQal5rjHsc/s9P7Mcq4fMlMpBp4LKXOrAjY6AMZGk2GvPrS
         Y1LfrRQFDBTAjqkmzy5G7tyS56NUp59zKUqPPAITtlN9o4qsTFCl6jjPCbtwNN6JY0uQ
         lo/A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=dLugjCneogZMvP1KRw9wbNQBGpio9g2o78qEbxwgeKM=;
        b=n0eXahYk7jQubYVyTzdQz/i+36tjBqQPcwshl6FDFUAD8gHbtnmFocGVrwfflSZO+m
         qUcu1/2wHIx4n/jgLPbBV6HxGf9EVUO3pjcnADOC2hNopOvDCF/h5sVFzzP/S/zty639
         yTk26YOMcv8uH2sDVzYsQPGb8MQZclHDdu8P9Euo3IMHEgDLhhB4DU3YseuqYuv0qvAM
         KWDkxlzRZqsPPhrW2AIv6GaWa84eCe+9yDbcSUH3iC5VDk673m4XKFICc9K8dLCQxtHt
         l5B9uelA7plv54OQgYxjuSUYEMaIhZjlMrnA6/euRp6Ydr3S/l18HhsS/I/34maLNUW9
         WmrQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jR0tm6ex;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 129si947758yby.527.2018.02.10.15.06.21
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 10 Feb 2018 15:06:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jR0tm6ex;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45767 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ekeDt-0006Wi-9D
	for alex.bennee@linaro.org; Sat, 10 Feb 2018 18:06:21 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58482)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekeDC-0006Tc-Ef
	for qemu-devel@nongnu.org; Sat, 10 Feb 2018 18:05:40 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1ekeD9-00080X-E2
	for qemu-devel@nongnu.org; Sat, 10 Feb 2018 18:05:38 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:36770)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1ekeD9-0007yn-2p
	for qemu-devel@nongnu.org; Sat, 10 Feb 2018 18:05:35 -0500
Received: by mail-pf0-x244.google.com with SMTP id p8so572050pff.3
	for <qemu-devel@nongnu.org>; Sat, 10 Feb 2018 15:05:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=dLugjCneogZMvP1KRw9wbNQBGpio9g2o78qEbxwgeKM=;
	b=jR0tm6exnuWMDtlIo6fcQ9NzHIx561nfZ1WAHqCkizl17MKEa7NbK/pqjxv0R4r8Rl
	vL85jB2QRqJUeXBw8iEJI8BveuaAwqPSqKCgVbgjf3b2Cg1n8oQq445zlWfNHHsF+OMD
	wg9rfvGlHQNWPoGg7TnYTHAlDEFEhugjR/wWs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=dLugjCneogZMvP1KRw9wbNQBGpio9g2o78qEbxwgeKM=;
	b=Wk1ArJvI2BkjigIA/by9AJPU2kBLlsAy12pjoLOnX9M/Oeb6aJ1o5TIARoyVzmlAgm
	+0hMPu07xoLQHKXYaKN3LRXSEryf0DbhWRnlHrLhEQ/MrzMbXmLG8hVHRS/lCJ3DcpgL
	yhiECbMyfJes4iupwSjKB3cqa8kaFb8dNSG9EKLun5tZZnwJeeRC1d+rHHA1nqwaB9Pa
	X5If479ARZM2Gd5+1w/YoYEwWFyR4rhFaKslWk8bYWxlCUdN1jjtu+Oo3gAb2A7rYxgo
	7SDzfvGDFzT5PDpcK2ZPteRHSI+px7zhnF7ZXBY0b+KAWx24bTeQWgB1FxnKmQ8TsDLV
	lJ3w==
X-Gm-Message-State: APf1xPBZ4lC4VW9eNo3CpzvOYXShD/1822pRFc0CpPtQkSV4YbjJHqYI
	9m/4AXTVxJlM6ZWAF2NkB/dtteILPXQ=
X-Received: by 10.101.76.204 with SMTP id n12mr5834444pgt.15.1518303933416;
	Sat, 10 Feb 2018 15:05:33 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-6-47.tukw.qwest.net.
	[174.21.6.47]) by smtp.gmail.com with ESMTPSA id
	w10sm14122374pgr.57.2018.02.10.15.05.31
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 10 Feb 2018 15:05:32 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Sat, 10 Feb 2018 15:05:25 -0800
Message-Id: <20180210230530.8421-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-devel] [PATCH 0/5] target/arm: More SVE prep work
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
X-TUID: m9xxVlTqHc3d

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


Richard Henderson (5):
  target/arm: Remove ARM_CP_64BIT from ZCR_EL registers
  target/arm: Enforce FP access to FPCR/FPSR
  target/arm: Suppress TB end for FPCR/FPSR
  target/arm: Enforce access to ZCR_EL at translation
  target/arm: Handle SVE registers when using clear_vec_high

 target/arm/cpu.h           |  36 ++++-----
 target/arm/internals.h     |   6 ++
 target/arm/helper.c        |  28 ++-----
 target/arm/translate-a64.c | 181 ++++++++++++++++++++-------------------------
 4 files changed, 114 insertions(+), 137 deletions(-)

-- 
2.14.3

