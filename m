Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp200412wme;
        Wed, 16 May 2018 15:30:31 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZpj1yOpIVoSocqZsFPDo1TOjgVMdHF2NKA8LtCL0AOaaee29uoZXUNYGtFI/cWOz0iOWu++
X-Received: by 2002:ac8:36f3:: with SMTP id b48-v6mr3113206qtc.334.1526509831367;
        Wed, 16 May 2018 15:30:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526509831; cv=none;
        d=google.com; s=arc-20160816;
        b=UmDI+AWG+RGO/Hc7+vtkfQ2s8I5hIxvZPJ9j5uqqB2wAGf9SPAU1loRbZnzGTzOeVn
         bFVrQ5NputEizNfA7wNwdaeNlHMRAf49tyaX7fNE8byNadxJMGYMzKXbxAcXlTJ58HDK
         x6GzwbGIpwtQ3zoQ78D2rbX3TQkqn90Qyt8UvT4ai6/nbgNzvPpjjWs2waU3M1dQ00J4
         srA630GLYaUGPzd9QlR2mqr+GzHHMx40mhWVdTkIXBTWteKoWCJMVfw6StvNKVY2DLBl
         6RaVzucJ1nUsTBhguji2zd+eoRiyxK+Ac2r+0bq/wEZOAPTGscalg2YOA36XnF2CQAGa
         r4YQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=5huPwqYey858DxVVcrFsOTzMnXfDNMudVLKAYt26OHw=;
        b=UAk5vH+3zu8BJ7il0QIEbKt3gkf8H2/khpoF0+0oR0Clx0wu3xX6w/anCE/G0Sev9n
         o0Lg343tk56ltESC4xtge0RmmIFrgGzvCoWucV8zL1Wz56ugfejqtu6aXBZr++pPWRip
         W8MtxTBi/mX35bxZiqXw3+MOptWXOrU5bRgDcvJvjjjLr2tpYySWt8dKNENkZEGCRR34
         ypgSHBaYOtAjG6UlKfGZU7rLUiNOoWSp4OfER8B+ZzZLC7OCl6yuk9CNm7RgH4Vj7nm7
         GFHIAlbTbVmc65aQ9YEmfQs1BZZMD2WCe1sPwui1fodx85dePJg1ryjvkYOtRTTqAXIG
         3PwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Vb8w6u8A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f13-v6si1253955qtf.75.2018.05.16.15.30.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 16 May 2018 15:30:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Vb8w6u8A;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44749 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fJ4wI-0007S9-OE
	for alex.bennee@linaro.org; Wed, 16 May 2018 18:30:30 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4w2-0007Qn-TR
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:16 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <richard.henderson@linaro.org>) id 1fJ4vz-0007Gj-FZ
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:14 -0400
Received: from mail-pl0-x22d.google.com ([2607:f8b0:400e:c01::22d]:40747)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
	id 1fJ4vz-0007FB-8F
	for qemu-arm@nongnu.org; Wed, 16 May 2018 18:30:11 -0400
Received: by mail-pl0-x22d.google.com with SMTP id t12-v6so1244200plo.7
	for <qemu-arm@nongnu.org>; Wed, 16 May 2018 15:30:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5huPwqYey858DxVVcrFsOTzMnXfDNMudVLKAYt26OHw=;
	b=Vb8w6u8ApyQAI5jjwkGGN+Zmz8DXDTP+2OcqC1q2ZK111yK7lshH1gK6kNc4m7fGAG
	gqTfYYISqJPCPE0/lvLHVtGGAzhFC9JKUqlZO4krgh900ogYIWMZzILLgScP8M5VPqg7
	Zrxeqy8dPG1nS6Ye810zJ10AnOD4lksdRJfGM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=5huPwqYey858DxVVcrFsOTzMnXfDNMudVLKAYt26OHw=;
	b=gO++rAPdI1BBVLqf5oXPnPM2s0DI7mDtB+/jz2MaNB4YNOBl6KkYwbrkbJVFD2TIHe
	VO+JoqPIFCv6cXkP8SIXa/+wrRmL/PgZXGskhntXS/pfXg0ADprOa2jx327wzu5RrAZk
	psPF0TH7SkIVHTvbz8crv4dRF3yaH5Vxpi7HBdEORUacFuiY5MNGP6UXLFXpX40XMwVq
	jFgk0ATmk7wm5Fe1+bzzjxu7h9PbxXckXzC9YDt1w6kB9VnxfkVdG5UIaCnXWagQ1Myt
	VI1N19RSr/wAbDWsdCwwzx+YbqMiraRSrrEUXLu0WYCYfho3MIFTmuptl+zBPws6TDc1
	+YOQ==
X-Gm-Message-State: ALKqPwdjaVl9vSSHmyWgMH/FMSLCbGIWPaO8miDoCctDgkASGLEOhYlg
	JlOV/eTKu3PRcVY3OWYuiStoTA==
X-Received: by 2002:a17:902:7409:: with SMTP id
	g9-v6mr2677838pll.255.1526509810053; 
	Wed, 16 May 2018 15:30:10 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.gmail.com with ESMTPSA id
	j1-v6sm6640418pfc.159.2018.05.16.15.30.08
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 16 May 2018 15:30:08 -0700 (PDT)
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Date: Wed, 16 May 2018 15:29:40 -0700
Message-Id: <20180516223007.10256-1-richard.henderson@linaro.org>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c01::22d
Subject: [Qemu-arm] [PATCH v3-a 00/27] target/arm: Scalable Vector Extension
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
X-TUID: E2DwxBF+6OY2

This is the first third, more or less, of my current patch set.
I'm sending only this portion now, rather than another monster
set all at once.

The major change is to move the call to sve_access_check inside
any final decode reject that might be required.  There are other
minor cleanups to patch integrity and comments.

The changes are mostly trivial from the February v2 patch set,
so if an R-b was given, I have retained it.

That leaves 4, 7, 8, and 26 (new) as unreviewed.

The patch that enables SVE for aarch64-linux-user is not present.


r~


Richard Henderson (27):
  target/arm: Introduce translate-a64.h
  target/arm: Add SVE decode skeleton
  target/arm: Implement SVE Bitwise Logical - Unpredicated Group
  target/arm: Implement SVE load vector/predicate
  target/arm: Implement SVE predicate test
  target/arm: Implement SVE Predicate Logical Operations Group
  target/arm: Implement SVE Predicate Misc Group
  target/arm: Implement SVE Integer Binary Arithmetic - Predicated Group
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
  target/arm: Implement SVE Element Count Group
  target/arm: Implement SVE Bitwise Immediate Group
  target/arm: Implement SVE Integer Wide Immediate - Predicated Group
  target/arm: Implement SVE Permute - Extract Group
  target/arm: Extend vec_reg_offset to larger sizes
  target/arm: Implement SVE Permute - Unpredicated Group

 target/arm/cpu.h           |    8 +-
 target/arm/helper-sve.h    |  450 ++++++++
 target/arm/helper.h        |    1 +
 target/arm/translate-a64.h |  118 ++
 target/arm/sve_helper.c    | 1676 +++++++++++++++++++++++++++
 target/arm/translate-a64.c |  119 +-
 target/arm/translate-sve.c | 2203 ++++++++++++++++++++++++++++++++++++
 .gitignore                 |    1 +
 target/arm/Makefile.objs   |   10 +
 target/arm/sve.decode      |  446 ++++++++
 10 files changed, 4933 insertions(+), 99 deletions(-)
 create mode 100644 target/arm/helper-sve.h
 create mode 100644 target/arm/translate-a64.h
 create mode 100644 target/arm/sve_helper.c
 create mode 100644 target/arm/translate-sve.c
 create mode 100644 target/arm/sve.decode

-- 
2.17.0

