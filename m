Received: by 2002:adf:b64b:0:0:0:0:0 with SMTP id i11-v6csp5019839wre;
        Wed, 30 May 2018 11:02:08 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKIgcm5j5rnC2UvjwteDhCloZEtmnEJOUrssspqnVKyW6dyyzEefJH0Yxrf2JEbMKaHQ9+9K
X-Received: by 2002:a37:a204:: with SMTP id l4-v6mr3430343qke.144.1527703327986;
        Wed, 30 May 2018 11:02:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527703327; cv=none;
        d=google.com; s=arc-20160816;
        b=U8TYYKELp5zMcJlZGo7SFif/E89I/GTH6wde06o+b1ZwxoA8sljoVv0kiUf0C9sRs3
         P04VgSAS4bvyYus6nmM62ejFTL3Y+8TJ4rCV8WfQKUkZKfFK4bWwNJaZB8ZUtQYtLOSV
         c10mBVI4YuQeMZ9uO+g7rLwqNA9O271q/EPiSy679evFN2TsZDwl4AcOcgeITHdFUuo8
         HoMpUaUy+ZUiGFGWFAxMDnvjQfiHb7w0adVw5pIHiGaTpBG6I4i0MnseEdHoaUd0J8dC
         zIYpWWhHQ8y2qpzfYhkQfLpQQE8ZfWdy2bHj0uRlX7m+v+rVuSvhBwaREBaVxsHW/oZm
         UXig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=eU3ASJsd7UFxCg4F7oPFqi3GmbhTOZUMJWUGN7c4f+A=;
        b=bb4hYnnnrxsr5yl6H0DcDZLQyCKuYxD3qBq7LTYtndKkdviF+L3k8AVh8QPMPKSm6/
         fUboj6XTX0XN0W+GWyuWTj4NsjrZGRBPRtDSfT4PcJZpJtg/nCN7x0bVLnB4lh3J/NUi
         edenTBTldJMSpsAi7UyqtBgkDVEMgYsabI/gcTQgJqcNwXn0Z1wgdMNwXlizd05pcIW0
         xwTHm+o0ohwc5zSU3FG837NLPQDVaj9LIWMn7vcpxjOHJSqaGGrq4TUfkiHkiEr1jVux
         hUvFxYLdkr1zfBVKCdeOOisbTxH9IwIdLsL6YpICPb8ReLcciY+QHZAHPv6mKDXn9J3s
         VzGA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TAWfRIRJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z64-v6si6211603qkg.67.2018.05.30.11.02.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 30 May 2018 11:02:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=TAWfRIRJ;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40035 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fO5QF-0001mV-Gg
	for alex.bennee@linaro.org; Wed, 30 May 2018 14:02:07 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33043)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5Pb-0001kO-7G
	for qemu-devel@nongnu.org; Wed, 30 May 2018 14:01:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fO5PY-0004JZ-Bv
	for qemu-devel@nongnu.org; Wed, 30 May 2018 14:01:27 -0400
Received: from mail-pl0-x235.google.com ([2607:f8b0:400e:c01::235]:45907)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fO5PY-0004IF-73
	for qemu-devel@nongnu.org; Wed, 30 May 2018 14:01:24 -0400
Received: by mail-pl0-x235.google.com with SMTP id c23-v6so247547plz.12
	for <qemu-devel@nongnu.org>; Wed, 30 May 2018 11:01:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id;
	bh=eU3ASJsd7UFxCg4F7oPFqi3GmbhTOZUMJWUGN7c4f+A=;
	b=TAWfRIRJMCfR+WJMSk1KJS0bH6/+E4UNfrBzXGMpF4PrW5uNwu629mme4u29cW7JsD
	K3wcJQcZ8IQjDPJM6u0h1gunGLZyJgijwdSG+v0Lw73PBESQvbFo5v28afGi8JvUlHl2
	YE6ClLOz30Q6YH4xJALQkeLd0+n/uEr6MP1AM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=eU3ASJsd7UFxCg4F7oPFqi3GmbhTOZUMJWUGN7c4f+A=;
	b=ZSv+05qA7M5mhySCSqaZZ9FZYVuSspfnX+4M8TU9cy6WRMyLhdwXdKid3oeYDnBWLD
	V8ynpmVxtrJssqp1uewvbMBB+8PCUU0XayhGRwduznRK2hi/WKpwdmzxWzxLJ3PwNhMQ
	a9IQr17HfV580rf5CiFCqZJ0wg93EqnW+rxrOUVuQZxvJ2fCAA/Oe3GQV6eeS3ii9Q9k
	+8jtQcK4Bp4ZRWE6SiX98dZWZD4cx50IflbLEObDBL+Xiyrw2vkeYUYVRMOVDNM7sQDY
	5b/U1QZVaoKLdOr1C0uFANo0FPWPDITn+jRgD3r+DrAOlC9xlSDD5GC/qkDRNmXDouev
	HLlw==
X-Gm-Message-State: ALKqPwe3ZcEPmdx3wfRY769eFQYa1oikgrIRWBEGETmQzhBkO1wKi+sr
	fLG+2zHTHm2UvC7H7E1RjTRHB/QhmJE=
X-Received: by 2002:a17:902:1347:: with SMTP id
	r7-v6mr3749702ple.62.1527703282665; 
	Wed, 30 May 2018 11:01:22 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-126-112-211.tukw.qwest.net.
	[97.126.112.211]) by smtp.gmail.com with ESMTPSA id
	b84-v6sm28179157pfm.123.2018.05.30.11.01.21
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 30 May 2018 11:01:21 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 30 May 2018 11:01:02 -0700
Message-Id: <20180530180120.13355-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::235
Subject: [Qemu-devel] [PATCH v3b 00/18] target/arm: SVE instructions, part 2
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
X-TUID: cOLJ8i4YD2No

Here's the second installment of SVE instructions.
There are about 25 patches waiting for a third installment;
this makes a nice break before beginning with the memory ops.


r~


Richard Henderson (18):
  target/arm: Extend vec_reg_offset to larger sizes
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

 target/arm/helper-sve.h    |  294 ++++++++
 target/arm/helper.h        |   19 +
 target/arm/translate-a64.h |   26 +-
 target/arm/sve_helper.c    | 1248 +++++++++++++++++++++++++++++++
 target/arm/translate-sve.c | 1450 ++++++++++++++++++++++++++++++++++++
 target/arm/vec_helper.c    |   69 ++
 target/arm/sve.decode      |  248 ++++++
 7 files changed, 3345 insertions(+), 9 deletions(-)

-- 
2.17.0

