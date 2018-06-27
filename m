Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp5769694wrq;
        Tue, 26 Jun 2018 21:33:51 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpcNnd9RiAgAushTRv/EuVt+Hg4uXSfU082gnP09h8QoZPTOYu4gfQRkg71+XpC6sGd73r2y
X-Received: by 2002:ac8:3692:: with SMTP id a18-v6mr4137512qtc.406.1530074031361;
        Tue, 26 Jun 2018 21:33:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1530074031; cv=none;
        d=google.com; s=arc-20160816;
        b=NLAf4WaGEVNK8rgKfatRg5N220yiztOVuFXLyai4SdPQtWbj3gQAdmknLj5Vv7Xix3
         JJL+S7poSBfsvRyoCqj6rqfS9ltk9toTcbpkMhXEMPdexOMjvZFHgeZUOmkwzEWm7JMl
         4mjHvP/N2OeiemV29KsmKOy3iHpUF63KbPjBCrrS0GJ4n2ZHeLwKNM4SULhKrNiwdAJW
         EVHA3TyG5my3dqTgipzRC7Gvvo+/RddN5PI/VOlC7EqfuRJcZkLO/64rb0endYec9hQ8
         uil8jv+JM4ply1e8t2xW4qzAVa1vX2lMLK30uR6W5oFqnXBf4UyKjGG/YE8SEoYLTq6C
         Npjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=l3NgF50hmA7g+CHvTO0lQHMuS5cDkQRTneG/AruTrN8=;
        b=SqGub/qUHjXB7DG1XYR5CysgUho3Tht5YGnd+b6TJZTFPpUkxHaBn1Ht8pVuNtXVXz
         FKvwr/1sAs/xLPXLDEupuIaJCheEfl0o+oRwndJ7z2ZG1tiol5dIHZY9FaBRbcazXxvJ
         GQ+s/leU0Ebnz2riNLli7Z87pUhTjmy+/rhHBzXsSepDQidcUaKebFHpQvxxdq4fmISH
         4NeKMvzHyvu3vhTFXF1bQBzaJRLsG1HRmuIEG+ZUMdc6NgJk216WkBDHQfT9R+Ytxrre
         cvmI32w4EvUfjbwQp9J/Mub6XJan0a3mTQy76n+RvoZLl8MthxOkjPfNGu0TjXYZV0yE
         WGRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c+si3qOX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h73-v6si530361qkh.182.2018.06.26.21.33.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 26 Jun 2018 21:33:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=c+si3qOX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56468 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fY29O-00043x-Pa
	for alex.bennee@linaro.org; Wed, 27 Jun 2018 00:33:50 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60047)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY29C-00043J-2i
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:39 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fY296-0008ON-KM
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:38 -0400
Received: from mail-pf0-x22d.google.com ([2607:f8b0:400e:c00::22d]:35920)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fY296-0008Mt-5T
	for qemu-arm@nongnu.org; Wed, 27 Jun 2018 00:33:32 -0400
Received: by mail-pf0-x22d.google.com with SMTP id u16-v6so389105pfh.3
	for <qemu-arm@nongnu.org>; Tue, 26 Jun 2018 21:33:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=l3NgF50hmA7g+CHvTO0lQHMuS5cDkQRTneG/AruTrN8=;
	b=c+si3qOXcI2n7frXIAI+pPpw+XjH9jX76KJyGA+YR7hmIFQc0GkSclRd/J0/aAkJLh
	Aj7FQCBIUgFEzamCAjnYopvmi+vm1pQfq8qnwaYgnr8jqFKbYC8zvdrdBPXdg6GidGsL
	xrca8VqIIoCY3IzzOodqozVEdkE9ufQb7aDJ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=l3NgF50hmA7g+CHvTO0lQHMuS5cDkQRTneG/AruTrN8=;
	b=A/0l7+iTwXPqZnXMaCeA74USmnnc3c5tB90xYwMVAXkuv+8JAvvyF9H5fJlvECzBMZ
	n9R14TMNe3EbB6FHm5ohjnsFUnS4y0xAMHHyFJabKZ+B0zvDQyW1FzGDFTAvvCuG4PEg
	O4gWQtmmNkEzLD1rybWsZ7Cq+obuhnW4kMshdq997hhLyenGuL+lsu2+A2UaaQSJ59cE
	9b2DdmdUg/p/5F9kd1eobFpLjrec1Rl+WeIuqXjzxOrbQauMqzmKmMmK5h8b1ipTw3J5
	Bb4LN7+j1BapmpRk72at9rJOGj6SqKoamyLNHLVG2v/zbaUnpZPkyyBMyosLxNrOQ+xq
	hQkA==
X-Gm-Message-State: APt69E0X9Wu35tt+nenbKUpGYV0IG8oKU54sQy9tJieumKtoZQ3TdtA5
	sp1Q/rNRxIsAc4ZWaIBKuU6fWg==
X-Received: by 2002:a65:6292:: with SMTP id
	f18-v6mr3747479pgv.85.1530074011000; 
	Tue, 26 Jun 2018 21:33:31 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	p20-v6sm4577638pff.90.2018.06.26.21.33.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jun 2018 21:33:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Tue, 26 Jun 2018 21:32:53 -0700
Message-Id: <20180627043328.11531-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::22d
Subject: [Qemu-arm] [PATCH v6 00/35] target/arm SVE patches
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
X-TUID: 7VlrozIatezA

This is the remainder of the SVE enablement patches,
with an extra bonus patch to enable ARMv8.2-DotProd.

V6 updates based on review.

Patches with changes:
  0002-target-arm-Implement-SVE-Contiguous-Load-first-fa.patch
  0007-target-arm-Implement-SVE-FP-Multiply-Add-Group.patch
  0009-target-arm-Implement-SVE-load-and-broadcast-eleme.patch
  0010-target-arm-Implement-SVE-store-vector-predicate-r.patch
  0011-target-arm-Implement-SVE-scatter-stores.patch
  0013-target-arm-Implement-SVE-gather-loads.patch
  0023-target-arm-Implement-SVE-floating-point-convert-p.patch
  0027-target-arm-Implement-SVE-MOVPRFX.patch
  0030-target-arm-Pass-index-to-AdvSIMD-FCMLA-indexed.patch
  0033-target-arm-Implement-SVE-dot-product-indexed.patch
  0034-target-arm-Enable-SVE-for-aarch64-linux-user.patch
  0035-target-arm-Implement-ARMv8.2-DotProd.patch

Patches lacking reviews:
  0002-target-arm-Implement-SVE-Contiguous-Load-first-fa.patch
  0007-target-arm-Implement-SVE-FP-Multiply-Add-Group.patch
  0013-target-arm-Implement-SVE-gather-loads.patch
  0030-target-arm-Pass-index-to-AdvSIMD-FCMLA-indexed.patch
  0031-target-arm-Implement-SVE-fp-complex-multiply-add-.patch
  0033-target-arm-Implement-SVE-dot-product-indexed.patch


r~


Richard Henderson (35):
  target/arm: Implement SVE Memory Contiguous Load Group
  target/arm: Implement SVE Contiguous Load, first-fault and no-fault
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
  target/arm: Implement SVE first-fault gather loads
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
  target/arm: Implement SVE MOVPRFX
  target/arm: Implement SVE floating-point complex add
  target/arm: Implement SVE fp complex multiply add
  target/arm: Pass index to AdvSIMD FCMLA (indexed)
  target/arm: Implement SVE fp complex multiply add (indexed)
  target/arm: Implement SVE dot product (vectors)
  target/arm: Implement SVE dot product (indexed)
  target/arm: Enable SVE for aarch64-linux-user
  target/arm: Implement ARMv8.2-DotProd

 target/arm/cpu.h           |    1 +
 target/arm/helper-sve.h    |  682 +++++++++++++
 target/arm/helper.h        |   44 +-
 linux-user/elfload.c       |    2 +
 target/arm/cpu.c           |    8 +
 target/arm/cpu64.c         |    2 +
 target/arm/helper.c        |    2 +-
 target/arm/sve_helper.c    | 1855 ++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c |   57 +-
 target/arm/translate-sve.c | 1688 +++++++++++++++++++++++++++++++-
 target/arm/translate.c     |  102 +-
 target/arm/vec_helper.c    |  311 +++++-
 target/arm/sve.decode      |  427 +++++++++
 13 files changed, 5116 insertions(+), 65 deletions(-)

-- 
2.17.1

