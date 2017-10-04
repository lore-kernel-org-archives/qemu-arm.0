Received: by 10.223.197.9 with SMTP id q9csp5931416wrf;
        Wed, 4 Oct 2017 11:43:46 -0700 (PDT)
X-Received: by 10.55.116.196 with SMTP id p187mr25341171qkc.190.1507142626320;
        Wed, 04 Oct 2017 11:43:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507142626; cv=none;
        d=google.com; s=arc-20160816;
        b=hcAc8RYV8B0800lsd8SfV/YsX8xlxBAfs4zI2tFKjANMULjPXVEbNHzLQ7Fz1w5R7R
         9g76CNAHKmYQe3D9U+iZfFNxJhQetyKeKGZslExAMKjr6Mxin9pJJSpwmqPB+VCd7xGT
         MAVZ1XIJO1+19Mx8xRNh/lS9SI8H/foy2xJeDFYRgdLqxSld2K6jkQkVCzcO5cvFkMDq
         GazyfxP3Z5tG9LgdJQLInjCpIbo431vzFCkAyqzCxVAUotTulk9/9GBQetmhl51gvAOu
         em8D4SDe/C3WfqMhb9pg5ARePxExllKub0nl9TxoAtCK2mWbolotpum7Y9CDsfNyI9Jr
         ThtA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=c2R6B4BEd9QaiI3v6MTsGG15RssMSUTB651TslaAgkQ=;
        b=doWXtQ7GQVFKiShJccAWVNF44P2XCnGTfb1wOb8NDClougCcHJHPsoffQffrLGbm3U
         uWYpdox5xkx/NSUif3+FcHuTbunslpHpFfHsbAjU0jQKgJp1eZ7Qb19GWK8M7jke+SuR
         6oVhf+iugVi7fmjMMl6ClxBv+wZKbF7M12fLpOHGAIugX6oOU06N5nd7Jq8YgsMim29i
         Rb4NRrgZ396c6f3w2MF9L1Vh07Jd/7/GQP9GDVukp5MQUXHucGrNNz9JySANmlcFUvC1
         Ih+NRjIgpgzBcFjAN4Gz8K0DL9nVAB3E8bgHzYNtjsilKAATnDndsc/AJ2MUk4rL6+sZ
         Q49w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Myj7Iooq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l3si1419901qth.53.2017.10.04.11.43.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 04 Oct 2017 11:43:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Myj7Iooq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36425 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dzoe1-00089l-Pi
	for alex.bennee@linaro.org; Wed, 04 Oct 2017 14:43:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzodo-00088i-7Y
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:43:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1dzodn-0002Xl-GV
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:43:32 -0400
Received: from mail-qt0-x229.google.com ([2607:f8b0:400d:c0d::229]:49640)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1dzodn-0002XH-6d
	for qemu-arm@nongnu.org; Wed, 04 Oct 2017 14:43:31 -0400
Received: by mail-qt0-x229.google.com with SMTP id o3so21073870qte.6
	for <qemu-arm@nongnu.org>; Wed, 04 Oct 2017 11:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=c2R6B4BEd9QaiI3v6MTsGG15RssMSUTB651TslaAgkQ=;
	b=Myj7Iooq7bBUxBhHz/pNZ6XlGHHHsMBtABwRkdCO4jCQPb67OCsD5ebrGpTqXsgYx9
	bl8UnghlXhnLcnHTLpQYFPlZKXjB83cCxK5uOp8oyFefpbc2eo0012zMF7oC+AGtZriO
	mTLOWeP3Bg1TB9/twKHyjn4q86buAZ9xBUTe4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=c2R6B4BEd9QaiI3v6MTsGG15RssMSUTB651TslaAgkQ=;
	b=WtSwUTIKtSFnmxAkxcTYHULV0A9D3vnswt2dVFrAH4hxjYuicLl/Rj4TMv80+og8D5
	q9gJyPyK/xt94u7UYZWbGtWW9Hy9L6smiRheke71r2egL5mElT0zMunC2kaqmOyeS30e
	PfT6vwNOMovO35QZTtgjzobiKfDQCt15v4uIukv5KKKMJIXkzYeT7lPflk/P8KiB+VPz
	nHPALKZiOHV4JExP8Ax1FQSEmnHdRzznCUSgxNfLmxG25+8nv/rnsXzn6X9sNJkcWdf8
	PYvPzLERTWhG7PRc9pdx47YY0O0hDX6ekaTv91gNz4Tczj7z4IMWCmq2prmMQIRTYkz7
	aeMg==
X-Gm-Message-State: AMCzsaU4Tp7efRi3GV0jyRNcL8NrF14+lG//FJZ4TdcJ7Lygk2usCh1u
	UN5II79uaIJzhX/p3aiQiAFuXnoh7Dg=
X-Google-Smtp-Source: AOwi7QB+7tzt0pZPMw1penUkL4874dwlOMhKjuPpXHrP7/bPJT0+R/tsoorN4rk2F78NX7oFfVk45w==
X-Received: by 10.37.41.5 with SMTP id p5mr4682403ybp.442.1507142610069;
	Wed, 04 Oct 2017 11:43:30 -0700 (PDT)
Received: from bigtime.twiddle.net.com ([2606:a000:7a4a:b100::1b])
	by smtp.gmail.com with ESMTPSA id
	o64sm3020464ywe.12.2017.10.04.11.43.29
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 04 Oct 2017 11:43:29 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed,  4 Oct 2017 14:43:13 -0400
Message-Id: <20171004184325.24157-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.13.6
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::229
Subject: [Qemu-arm] [PATCH v1 00/12] ARM v8.1 simd + v8.3 complex insns
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
X-TUID: /sfGit1i/hPn

This patch set depends on v3 of native-vector-registers;
for ease of review the whole tree is at

  git://github.com/rth7680/qemu.git tgt-arm-cplx

I have successfully tested all insns for AArch64 via RISU.
I have successfully tested everything but VCMLA for AArch32.

The insn that doesn't match up is

  fef3c848  vcmla.f32  q14, <illegal reg q1.5>, d8[0], #270

for which FoundationModel is *not* signalling illegal insn.
I'm not really sure what it is doing -- perhaps treating the
insn as a coprocessor 8 nop?  I'll have to investigate further.

In the meantime, it's surely time for a round 1 review.


r~


Richard Henderson (12):
  HACK: use objdump disas
  target/arm: Add ARM_FEATURE_V8_1_SIMD
  target/arm: Decode aa64 armv8.1 scalar three same extra
  target/arm: Decode aa64 armv8.1 three same extra
  target/arm: Decode aa64 armv8.1 scalar/vector x indexed element
  target/arm: Decode aa32 armv8.1 three same
  target/arm: Decode aa32 armv8.1 two reg and a scalar
  target/arm: Add ARM_FEATURE_V8_FCMA
  target/arm: Decode aa64 armv8.3 fcadd
  target/arm: Decode aa64 armv8.3 fcmla
  target/arm: Decode aa32 armv8.3 3-same
  target/arm: Decode aa32 armv8.3 2-reg-index

 target/arm/cpu.h            |   2 +
 target/arm/helper.h         |  26 ++++
 disas.c                     |   2 +-
 linux-user/elfload.c        |  10 ++
 target/arm/advsimd_helper.c | 331 +++++++++++++++++++++++++++++++++++++++++
 target/arm/cpu.c            |   2 +
 target/arm/cpu64.c          |   2 +
 target/arm/translate-a64.c  | 350 +++++++++++++++++++++++++++++++++++++++-----
 target/arm/translate.c      | 241 +++++++++++++++++++++++++++---
 target/arm/Makefile.objs    |   2 +-
 10 files changed, 912 insertions(+), 56 deletions(-)
 create mode 100644 target/arm/advsimd_helper.c

-- 
2.13.6

