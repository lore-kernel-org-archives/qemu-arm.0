Received: by 10.223.159.74 with SMTP id f10csp2949974wrg;
        Mon, 18 Dec 2017 10:01:45 -0800 (PST)
X-Google-Smtp-Source: ACJfBou2vq/MwNXKAoOCADYcHtiwY3jz9kYmDLv+fkb8fRbxYtZPbWebz7rh3dvb6ryPPGoxY8Kp
X-Received: by 10.37.219.74 with SMTP id g71mr514173ybf.308.1513620105789;
        Mon, 18 Dec 2017 10:01:45 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513620105; cv=none;
        d=google.com; s=arc-20160816;
        b=JR6Ot/ZSOeMjwYp22U0YuFpuLKhSDy0EojYWxGWeAWSmVSk9OH17GBnRvBY5KjS1XK
         zuCOVIvXVbJpS5PCIl8ER57xxmUFHi13+yWEWcqUslyPiRMkxJGiDwuHJWVoML9LgAjG
         HpbmbIzl+hUeaeAr7xUbhMUircFNkKi9yxM64V4V6IEqRZ3FsYxq9nnXCmv1sqXGbuZ1
         UtXI1UAlNhuKE3rKTcLM6/7eZLyLKXazYjjvFL4Fv1fJPAHFB6bb3dbT8hsr+eLy99j6
         HboFYoTiaDAjo5nEBw4dat+txRrS0YoO4N1HlBKmGIv4/0LNMPUlGmrXEfQ6uRm7c4l2
         ZPyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=DTbjgRJx2tHFAB/1TJPG4EN31OEWmJnTqYBKPVDZuMY=;
        b=xR6GbO076Tm3O/N1pKF6mfIzi2Od8RglpmhD2XRYrwPFk3AHvGm90EXe28gOCUPsB+
         qGYzmX7jf/4UgkP/BaejVwH/jRHOhrYF2ckKvgFxhNZUO+DjpahUE+F5wcnoFUNXeXT6
         xx5hZqlo2Mr5zbwvVrQR73JbZbOJ3Nw6I4/NMY05m+xa1JAzfWsnUedZzDocK8HcsG+o
         V3Em2gPR/R5J1IBrli42As7h8tK4TkBGH+TU+kbPYtlfs8hx1OuECgNCvI0BOHrE0/ai
         OSbVIXHsL5E/PG3JGW5XH5dnvbllna7ImkcKiHeJNN3JpRN31Fs7EVT66lZf+kvVLqQF
         01Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ebGnh/5U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id y63si2682794yby.482.2017.12.18.10.01.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 18 Dec 2017 10:01:45 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ebGnh/5U;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60000 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQzjV-0005RT-5q
	for alex.bennee@linaro.org; Mon, 18 Dec 2017 13:01:45 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55422)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUE-0007z8-Lr
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:45:59 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1eQzUC-0001k2-7O
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:45:58 -0500
Received: from mail-pl0-x231.google.com ([2607:f8b0:400e:c01::231]:44090)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1eQzUC-0001jW-1j
	for qemu-devel@nongnu.org; Mon, 18 Dec 2017 12:45:56 -0500
Received: by mail-pl0-x231.google.com with SMTP id n13so5240459plp.11
	for <qemu-devel@nongnu.org>; Mon, 18 Dec 2017 09:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=DTbjgRJx2tHFAB/1TJPG4EN31OEWmJnTqYBKPVDZuMY=;
	b=ebGnh/5UylaQFKVoQJ1s/QLFWND62eYfGiGiHeD8O3KykqNbZ/+iYOt8Lfo0gw6het
	4ewrvDm1YZxNW+gEmq7dgWBgrSnfAb29VcAw4McY48CPqdRSkHnrpzLev/kaIRUqJlWv
	CFxmlSmH79HEEug/4LJ0hIEYGjXEYvmcjH7WQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=DTbjgRJx2tHFAB/1TJPG4EN31OEWmJnTqYBKPVDZuMY=;
	b=AZAcvI1bZNX+ENqhteOFFJj0RcKRJ24KjrUUm9iASQPNfNr2vngDiRzg/eCxoh6sam
	peGJoI+wEfGQjGc7IqmRuMkbfHEHVZ8aWbXkb1H062nZmy7F4pO1ZdQOuxiOgR4PPY8c
	WO3mzaznZz3F9u1Yq2/8xMAosB1a5Tdc30bFzw5lWCg7wZKHAGOo93mO8ULEFH/h/6Te
	SyWGQLcNksMtsl3IpualRMSJ3MoRyCSdCHeavPm1RcbSgzn1nb0fi4GtSgtwVpvxFs7L
	uZOXtu5RkSuB/21q2sgUi2ZgywQYOjicatRRkirRiobDUk2nGCyCy05fcxQLTGwzF6sc
	LSyg==
X-Gm-Message-State: AKGB3mIDRPboNFaQo9cbk+l7tI8MmNM6G0gSv0/4soravpLeEO+tG5bo
	DRc6JQDalQrRZuAZ5sFzebpGS+yCqAo=
X-Received: by 10.84.143.131 with SMTP id 3mr477166plz.113.1513619154710;
	Mon, 18 Dec 2017 09:45:54 -0800 (PST)
Received: from cloudburst.twiddle.net (174-21-7-63.tukw.qwest.net.
	[174.21.7.63]) by smtp.gmail.com with ESMTPSA id
	t84sm26209657pfe.160.2017.12.18.09.45.53
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 18 Dec 2017 09:45:53 -0800 (PST)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Mon, 18 Dec 2017 09:45:29 -0800
Message-Id: <20171218174552.18871-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.14.3
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::231
Subject: [Qemu-devel] [RFC 00/23] target/arm: decode generator and initial
 sve patches
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
X-TUID: E+Kxks5CiVHF

The most important part here, for review, is the first patch.

I add a code generator, writen in python, which takes an input file
that describes the opcode bits and field bits of the instructions,
and outputs a function that does all of the decoding.

The subsequent patches begin to add SVE support and also demonstrate
how I envision how both the decoder and the tcg host vector support
are to be used.  Thus, review of the direction would be appreciated
before there are another 100 patches along the same style.


r~


Richard Henderson (23):
  scripts: Add decodetree.py
  target/arm: Add SVE decode skeleton
  target/arm: Implement SVE Bitwise Logical - Unpredicated Group
  target/arm: Implement PTRUE, PFALSE, SETFFR
  target/arm: Implement SVE predicate logical operations
  target/arm: Implement SVE load vector/predicate
  target/arm: Implement SVE Integer Binary Arithmetic - Predicated Group
  target/arm: Handle SVE registers in write_fp_dreg
  target/arm: Handle SVE registers when using clear_vec_high
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
  target/arm: Implement SVE Element Count Group, register destinations

 target/arm/helper-sve.h    |  409 ++++++++++++++
 target/arm/helper.h        |    1 +
 target/arm/translate-a64.h |  112 ++++
 target/arm/sve_helper.c    | 1177 +++++++++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c |  272 +++------
 target/arm/translate-sve.c | 1313 ++++++++++++++++++++++++++++++++++++++++++++
 .gitignore                 |    1 +
 scripts/decodetree.py      |  984 +++++++++++++++++++++++++++++++++
 target/arm/Makefile.objs   |   11 +
 target/arm/sve.def         |  328 +++++++++++
 10 files changed, 4418 insertions(+), 190 deletions(-)
 create mode 100644 target/arm/helper-sve.h
 create mode 100644 target/arm/translate-a64.h
 create mode 100644 target/arm/sve_helper.c
 create mode 100644 target/arm/translate-sve.c
 create mode 100755 scripts/decodetree.py
 create mode 100644 target/arm/sve.def

-- 
2.14.3

