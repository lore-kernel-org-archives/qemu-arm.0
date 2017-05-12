Received: by 10.25.0.6 with SMTP id 6csp48458lfa;
        Thu, 11 May 2017 20:37:44 -0700 (PDT)
X-Received: by 10.200.3.195 with SMTP id z3mr1851124qtg.185.1494560264824;
        Thu, 11 May 2017 20:37:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1494560264; cv=none;
        d=google.com; s=arc-20160816;
        b=Yw3WheWv7wdrpLlB0VYsJHXbiMIOU0CI9AkfHS5ypvCJkdb4tqGjrYQLrBMM/znfWT
         0u1OGnnwLpmxx0Dq+rtHxsCcdMbTGRC8JWDILe4dcQEkzyNH09BRTxC8nXtdi4pRQP7Q
         o1Cv4yJS5PGdK65MjGqhXA03F7bNPcrw8u3W93d7S7UBDqAORsSPxnYHCdALbiqwEQmm
         lAWzDPZGmO/th+hi+rEZhIUdqYPWZg/7X35/WYds5CHUrLh3fU6VB8k/yUGwAamro6ZN
         j8IPIyihZ4BK0RY6xeR4nlGhVZW6WHSIyrcLAbacOUQFAnsHPJoMx1upzZCS51qOgH+D
         6X5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:mime-version:message-id:date:to:from
         :dkim-signature:arc-authentication-results;
        bh=EHzW0L3O8G7FiqHBhsZQvaW5HqXR3UdJz/4zGZYYS78=;
        b=tTH/gEops2799Xqggcolami1TciE3fEoQAdX74/q4X6ba/aEMWcKBduvCBo5J3rbJJ
         rOtYbFdWs6CvlLEYsxDByQDmJw/vK6Me5orbl5lGBAuOmFkjbOe9WfGbqhh2dfYxI8uJ
         /+C9VOJUQLyfcBAGoMdKaqvKVhhxe1DYdVNjx/4+chOPjcgSycDCu63v25KEsl6vwMLq
         lbncurvEyrwY0dI9tqR/G4EoVeth38yQFQOdUIPaCNHDz3lQmM5qGiWBy3WyEny8/nah
         JrDMNLhGdAESvN0rUAP+79NJhf2c8pVDmaSkQvkLaupSLM0cgpmezuplN25AaW6hM6Fj
         1Mbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 201si2197923qko.98.2017.05.11.20.37.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 11 May 2017 20:37:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:51154 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1d91Oi-0007ib-81
	for alex.bennee@linaro.org; Thu, 11 May 2017 23:37:44 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:47181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d91N9-0006TD-Mp
	for qemu-devel@nongnu.org; Thu, 11 May 2017 23:36:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d91N5-0003Yp-Of
	for qemu-devel@nongnu.org; Thu, 11 May 2017 23:36:07 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:36329)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1d91N5-0003Ya-Js; Thu, 11 May 2017 23:36:03 -0400
Received: by mail-qt0-x244.google.com with SMTP id j13so5359596qta.3;
	Thu, 11 May 2017 20:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=EHzW0L3O8G7FiqHBhsZQvaW5HqXR3UdJz/4zGZYYS78=;
	b=S9vJnKlGnOZOJ1aVXUHKSjDOq6shPOJ1WlXZcPP4A469t0jcLhLVVrZB8+xx/GjMyK
	YTN92yhCtJr1H5QuVLDN/vngXNaT5FbX2Xog+sYId6dH+t5OAnqgktWNWGpI0mhqNwuL
	A3ND1zo0joJ8o8vT+iJV14YgKMn+juAStCH5LXOCoGcXkClxnMFXbbdFyb3FdBPf622m
	ZFbkEIoMOD15bTx0w/1avfdlI581afHNITn+S05QHWjKS8JvkfyYGmmrUHcplHZP+jRE
	TfJg8kXK+03K70KNyHDb1vWLmHKN0zZ5/zQzu8bbmTiRijmE/Edy7ntWeUniNlccwAfI
	swug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:from:to:cc:subject:date:message-id
	:mime-version:content-transfer-encoding;
	bh=EHzW0L3O8G7FiqHBhsZQvaW5HqXR3UdJz/4zGZYYS78=;
	b=mWr/QBeS28VSHilg1JKtA36FnBVthlcSlKAwm+jxJjto/8LTolhJBa27J4bAcuFiEe
	WL+za7hxSx6sCDoKz9kG1WiPWllxxWFsH/5/XK7YxSTKoGWFM7KeJhL3ComNe2TcnBfg
	4XKTcpBhEO2vQ4+0sfQB53jBp8+sEtiAoOVSNz2yrxgRuwmAc6feM3Z8c2Ycu/mnwUfW
	XTNAd//kf5NYKKZc5c+eZ9S6QZ6TESAIjkspsSGOEpFmE8fTebH0Jnp0S8S7ZSKYJfRU
	QTY0RoDxBQguHBuKFHtxSyZpfWaso6+8Hz91fkgPC8r2vqNKKD7dQgqT5aZYH5qt/yun
	OcIg==
X-Gm-Message-State: AODbwcDVXOHnesbiB9ac39R7lvtzP3KfIlaqhk7CKFmG+bN+xWUS54RU
	D8GRLo7asphYLA==
X-Received: by 10.237.42.5 with SMTP id c5mr1799842qtd.284.1494560162891;
	Thu, 11 May 2017 20:36:02 -0700 (PDT)
Received: from localhost.localdomain ([138.117.48.226])
	by smtp.gmail.com with ESMTPSA id
	m188sm1443267qkc.5.2017.05.11.20.35.57
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 11 May 2017 20:36:02 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
To: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
	Richard Henderson <rth@twiddle.net>, Alexander Graf <agraf@suse.de>,
	Artyom Tarasenko <atar4qemu@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	David Gibson <david@gibson.dropbear.id.au>,
	Eduardo Habkost <ehabkost@redhat.com>, Eric Blake <eblake@redhat.com>,
	Laurent Vivier <laurent@vivier.eu>, Laurent Vivier <lvivier@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Markus Armbruster <armbru@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
	Nikunj A Dadhania <nikunj@linux.vnet.ibm.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 May 2017 00:35:38 -0300
Message-Id: <20170512033543.6789-1-f4bug@amsat.org>
X-Mailer: git-send-email 2.11.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: [Qemu-devel] [PATCH v3 0/5] optimize various tcg_gen() functions
 using extract op
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
Cc: Julia Lawall <julia.lawall@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	Markus Elfring <elfring@users.sourceforge.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vtrPEwDoJwct

Changes from v1:

In my first attempt I misunderstood tcg_gen_extract() intrinsics, and Richard
Henderson pointed that out.
In this patchset the cocci script is corrected and clarified, it also print how
arguments are checked while running.
Also:
- incorrect patches have been removed. (Richard Henderson, Nikunj A Dadhania)
- Coccinelle script licensed GPLv2+ (Eric Blake)
- comment in each commit about how to apply the patch (Eric Blake)
- added Acked-by for m68k (Laurent Vivier)
- Cc: Coccinelle developers.

[v1]

While reviewing a commit from Aurelien Jarno where he optimized a TCG generator
for SH-4 [1] I found the same optimization done on PPC by Nikunj A Dadhania few
months ago [2].
After asking on the ML about a cocci script [3] I thought it would be easier to
learn about Coccinelle.

citing Aurelien Jarno:
    This doesn't change the generated code on x86, but optimizes it on most
    RISC architectures and makes the code simpler to read.

I actually applied the script using the following command:

$ docker run -v `pwd`:`pwd` -w `pwd` petersenna/coccinelle \
    --sp-file scripts/coccinelle/tcg_gen_extract.cocci \
    --macro-file scripts/cocci-macro-file.h \
    --dir target \
    --in-place

Please review, thanks.

[1] http://lists.nongnu.org/archive/html/qemu-devel/2017-05/msg01466.html
[2] http://lists.nongnu.org/archive/html/qemu-devel/2017-02/msg05211.html
[3] http://lists.nongnu.org/archive/html/qemu-devel/2017-05/msg01499.html

Philippe Mathieu-Daudé (5):
  coccinelle: add a script to optimize tcg op using tcg_gen_extract()
  target/arm: optimize rev16() using extract op
  target/m68k: optimize bcd_flags() using extract op
  target/ppc: using various functions using extract op
  target/sparc: optimize various functions using extract op

 scripts/coccinelle/tcg_gen_extract.cocci | 69 ++++++++++++++++++++++++++++++++
 target/arm/translate-a64.c               |  6 +--
 target/m68k/translate.c                  |  3 +-
 target/ppc/translate.c                   |  9 ++---
 target/ppc/translate/vsx-impl.inc.c      | 15 +++----
 target/sparc/translate.c                 | 15 +++----
 6 files changed, 85 insertions(+), 32 deletions(-)
 create mode 100644 scripts/coccinelle/tcg_gen_extract.cocci

-- 
2.11.0

