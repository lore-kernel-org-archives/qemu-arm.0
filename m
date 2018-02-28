Received: by 10.28.91.67 with SMTP id p64csp983773wmb;
        Wed, 28 Feb 2018 11:31:46 -0800 (PST)
X-Google-Smtp-Source: AH8x224IJjR5EGD1gDK4Lr92HrbQpASLmOuvE+gxcPhc/fyDrQgg/j+vqEVqrWakLfrArtpDGJyH
X-Received: by 10.13.192.196 with SMTP id b187mr12809012ywd.415.1519846306498;
        Wed, 28 Feb 2018 11:31:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1519846306; cv=none;
        d=google.com; s=arc-20160816;
        b=I9v7RsGEaAFzGouBr90fw2+RofrTGgEjx5GTlNr59CVd1Gh7hIPqa7OK6K277XZTrp
         e6aVM+niBBm9MoxunFbKkwFxtQnxz9ewdcLKRqxiqWYxLO5iTdTSVJywiQtzi20bQ3MX
         Mz0fVtoLbFM76qnTeVdXtjfJD99M3TQMEDIA5DRdwA0TDkSTSVeTKewtQzd66qNL4MrT
         LiZfD99D4XjeMh9bVwv2uQMTNGYmbvwbLurxzoqXGZhOq3sGSpoIEe03PaVjAOsRCBbX
         iuzilCOZyxz8Rl0g3O+3HDDFOi37PSn00XLyXhbqLD+C6sI3wkxGn43i2/Y25pbNvnGJ
         DQYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=C+LBVsUbMAmUMQMRRDna4m9qepUMTuzHPuMIaSfKS6Q=;
        b=HVLxc78nsjIc2+TYRfE5rTs2dhvCxXr9kakKAKCtxUxiMV/3ekHnx6ix2MOdZSn7a2
         K+KH4b+syRRtziGP/Y375/IH13enBqZ74gjHzSYp7lfErBZBk3tvn9w4gYPAK74ksB/U
         qGuJdPjXfNfuqOYQr5+kJ7qUZV90wot05I2W5druhjq7fVYqCXRYA78RJfS50AqZoQSg
         Iv9aYU9/K4F3xe6hRquXyNWXeVffNsNXlfJq6vGSbNnUPcMCqE0z12OueesSxkf8wsXF
         pdNtmfeIZysZE4zIk4OisLdysXxkeg7sGafF5X6L+CKHpOTjALNyMZjG2x3vOb2m2syK
         MoPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kWbd+GJ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o9-v6si365296ybk.791.2018.02.28.11.31.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 28 Feb 2018 11:31:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kWbd+GJ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46402 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1er7S5-0003Fj-SS
	for alex.bennee@linaro.org; Wed, 28 Feb 2018 14:31:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35408)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7Rs-0003FF-ML
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1er7Ro-0006DV-Oh
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:32 -0500
Received: from mail-pf0-x244.google.com ([2607:f8b0:400e:c00::244]:42877)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1er7Ro-0006D5-JA
	for qemu-arm@nongnu.org; Wed, 28 Feb 2018 14:31:28 -0500
Received: by mail-pf0-x244.google.com with SMTP id a16so1409158pfn.9
	for <qemu-arm@nongnu.org>; Wed, 28 Feb 2018 11:31:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=C+LBVsUbMAmUMQMRRDna4m9qepUMTuzHPuMIaSfKS6Q=;
	b=kWbd+GJ9qbhiPKU+X7KA85YM4axGkmE+CxENp7VmgEFCzkEn8A+f/Jv9B/XoD6+c5C
	7iGowi+v1ysIWUgFTCdeWaaFzFMgTcyh3XOFRLt/UVLphfnUdhUyemi4CSQZs39xJ/h6
	+NEGEPH9GfWNJDld1Z8mV3m42sm5HvyNwzENY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=C+LBVsUbMAmUMQMRRDna4m9qepUMTuzHPuMIaSfKS6Q=;
	b=Hd6gmpAZHa+j1UOa2OIQB32cSHx8OdsLy45mtg9uunyfGKEyDbBpdDB9ZZ+aR02yc6
	fSsVg3q/qC2vlnSrkbrdUZj10w4aLJq0LbSMeC/laijPUJip7IyLRxKUwb3iffS8la49
	0ca8DOjnfY9+l6vE39T0qw5pQTILgM6qw5T04V0KhEnurmJwWNI6BT8iSxF4o1haw7lX
	jY5VzdvbWRMLOC+Furvf1lgssyxaHCxdT+MVgDHgt1IRljpH4b9DbYfxpMVXvsvOuJPI
	2TWOhRSzTDSL3JfEGnlyTdTK2US8upXkEpQR8MpqZSYf4wu0oUwau0sVWmRYFVZqQSDH
	Y9Pg==
X-Gm-Message-State: APf1xPCoehLHferjE9gg+ZxXHPDnqpre7WyX/z1J4Ccy1IHjAjjjb1HA
	bMXEep/Y0qCZgDEN8BvzwTYTrQ==
X-Received: by 10.98.70.198 with SMTP id o67mr18611338pfi.173.1519846287315;
	Wed, 28 Feb 2018 11:31:27 -0800 (PST)
Received: from cloudburst.twiddle.net (97-113-169-147.tukw.qwest.net.
	[97.113.169.147]) by smtp.gmail.com with ESMTPSA id
	k185sm4200212pgk.94.2018.02.28.11.31.25
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 28 Feb 2018 11:31:26 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 28 Feb 2018 11:31:09 -0800
Message-Id: <20180228193125.20577-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::244
Subject: [Qemu-arm] [PATCH v3 00/16] ARM v8.1 simd + v8.3 complex insns
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
X-TUID: l8J7jV7RKRmG

I believe I've incorporated all of Peter's feedback from v2.
This is based on target-arm.next, which now contains Alex's fp16 work.

Re-tested our standard aarch64 risu tests with -cpu cortex-a57,
and against the new risu tests I posted this morning for aa64 and aa32.


r~


Richard Henderson (16):
  target/arm: Add ARM_FEATURE_V8_RDM
  target/arm: Refactor disas_simd_indexed decode
  target/arm: Refactor disas_simd_indexed size checks
  target/arm: Decode aa64 armv8.1 scalar three same extra
  target/arm: Decode aa64 armv8.1 three same extra
  target/arm: Decode aa64 armv8.1 scalar/vector x indexed element
  target/arm: Decode aa32 armv8.1 three same
  target/arm: Decode aa32 armv8.1 two reg and a scalar
  target/arm: Enable ARM_FEATURE_V8_RDM
  target/arm: Add ARM_FEATURE_V8_FCMA
  target/arm: Decode aa64 armv8.3 fcadd
  target/arm: Decode aa64 armv8.3 fcmla
  target/arm: Decode aa32 armv8.3 3-same
  target/arm: Decode aa32 armv8.3 2-reg-index
  target/arm: Decode t32 simd 3reg and 2reg_scalar extension
  target/arm: Enable ARM_FEATURE_V8_FCMA

 target/arm/cpu.h           |   2 +
 target/arm/helper.h        |  31 +++
 linux-user/elfload.c       |   2 +
 target/arm/cpu.c           |   2 +
 target/arm/cpu64.c         |   2 +
 target/arm/translate-a64.c | 514 ++++++++++++++++++++++++++++++++++++---------
 target/arm/translate.c     | 275 +++++++++++++++++++++---
 target/arm/vec_helper.c    | 429 +++++++++++++++++++++++++++++++++++++
 target/arm/Makefile.objs   |   2 +-
 9 files changed, 1133 insertions(+), 126 deletions(-)
 create mode 100644 target/arm/vec_helper.c

-- 
2.14.3

