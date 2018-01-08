Received: by 10.28.173.206 with SMTP id w197csp2572989wme;
        Mon, 8 Jan 2018 07:07:44 -0800 (PST)
X-Google-Smtp-Source: ACJfBosxyJj9zpKdIaMA5hGNkzvuCvDHLRAL+p1VQp8JQQR941hLZJ+zhLgNz0aG1fpjwnV61fAv
X-Received: by 10.37.161.3 with SMTP id z3mr11471491ybh.335.1515424064308;
        Mon, 08 Jan 2018 07:07:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515424064; cv=none;
        d=google.com; s=arc-20160816;
        b=G8p3UaHunmrnsPT07d7TmXsyuvlhyvm/TXIgSahoZcEIsdUg/2/Ie8B8cQ9mEkuNW6
         Uhu9QwXTVmvo3KUhnC8Ghaah3MdVQlGFJK4N/pCuKHBBslH/DX1WoR0E2zrQP/q1DNWg
         dapDKEV/k1kYyWdI4/n6cQICY+zWjJbYbBZxxZTP3hLh0QyM8jgY2yitKI5DRRAcasyz
         TQw2vyLYkbsq8v0GzrEeVH0DwPzFtLeyAyaph874ULX8DiZtGmSgsxjwHr4HROaBz3nu
         9Ove2PKL1obIGr1nTPuN77o2uMJoyljIeShiY7AdmhzTIxdxuLjkp6mCsaS3ETA7p7Ku
         zOeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=otCUmP4l08KG7oDE0zcj8GqKt/fWW6blviQbsQi8Ox0=;
        b=oYTDvYQP+h2XirT/NL/H6mRLXHD7yqM5lrrYZLb2hh5YrOKO1xWDLAI24ji2R92TVb
         cBAe3WM0vEn+bnuSOkjc7dRfN91vIFGE+AAstBiEL/sDadn0vQKOse+0DuDH3dN5W3Uw
         CSXskKTW4r7WloDWyclEVQEd7aPh+3iGuT18Gpn4M8V9DN8S2nMJ1ju5vAzqPo1iTARy
         s3ghOl/BuiN0QXdLhn2CQYGWlkRgVseqEtBNsdNpqNxB2SHDeiganH8g1VNbbgn5Dy3a
         6d9G3yB03IOEMNTLLtO5UmfT1yFKs1yclaWyYooRqMkcwfeb+KXwCQX4prZoIoxjU3rt
         iQuA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pxB3fyq8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d184si2524679ywh.606.2018.01.08.07.07.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Jan 2018 07:07:44 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=pxB3fyq8;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:39304 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYZ1b-0004S1-NX
	for alex.bennee@linaro.org; Mon, 08 Jan 2018 10:07:43 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:53619)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYYzX-00036b-Uh
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:05:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYYzV-0007bJ-TM
	for qemu-devel@nongnu.org; Mon, 08 Jan 2018 10:05:35 -0500
Received: from mail-qt0-x22c.google.com ([2607:f8b0:400d:c0d::22c]:36097)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1eYYzQ-0007ZM-Gg; Mon, 08 Jan 2018 10:05:28 -0500
Received: by mail-qt0-x22c.google.com with SMTP id a16so13911883qtj.3;
	Mon, 08 Jan 2018 07:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=otCUmP4l08KG7oDE0zcj8GqKt/fWW6blviQbsQi8Ox0=;
	b=pxB3fyq8W/rc/SiAQPiJeVJPErWAoaRS+J/C0QPTjAbKwLWKjlB/wbXltRuxNPcr4/
	lyTJ8RuMJeweKm3UWjqy2K+SgwUkgbIxiQp0xlW3pVnVZRMceHiAtVp9aqkXJGRdM+vv
	V0gCWyaZQRHMmnN2tzu8FQMtpAF6A57czPBii9gYziNw6/ucct5FV19fuiia3WXy2wFq
	XuJwuI21JOgYm0aCUhyu19FwhMDYg9XQufk9NhrstMbdA0eq5aNSMg75hDYL89djUhsS
	3xp3QDIG5nORi+cIy5G/Cu2kDeSSWSW1Eh5OsEWvCdCeL2xTJ+IFvjM9Di2nSGVn8OBf
	QAFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=otCUmP4l08KG7oDE0zcj8GqKt/fWW6blviQbsQi8Ox0=;
	b=Z0iceH4xworsLggmcx3oqPin1wsg2YsmQBWKQ7ds61cjYb7ylDML43eL+QYXMROzrg
	4CrpUXKGNjX4FIj0SHEqNjGkUgTTjrOQ2/oLddcmL7qK413m4oMRuNMsXS6z/EMZBraD
	n84mtic2JGcXD3crYJW1sXAx3uttXxyK788gtBMGngRVZjj59dbCHnQMEyzB7e7j2kSe
	K54Zd9kFSVEPkshIG8ZGjpfHiU0GjowS/xe2m6SMK+tuFIK42PRXhufUvZg6IAts+rEp
	q2H2KjSQWyQfjSA6LK3ld12VU7O2smo8b8QAh0r0CHDn+oirV27HLY1CEu0iLFGZ7hag
	nE0A==
X-Gm-Message-State: AKwxytengdK2jHICSKzf4zdAWMDSRfZb7SdTVHuflpbj9A0iLFuC9Ndg
	ZHgByOGyW+GRfnzntkp7MAo=
X-Received: by 10.200.8.178 with SMTP id v47mr15956050qth.59.1515423927977;
	Mon, 08 Jan 2018 07:05:27 -0800 (PST)
Received: from [192.168.1.11] ([138.117.48.219])
	by smtp.gmail.com with ESMTPSA id z8sm7706942qta.81.2018.01.08.07.05.25
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 08 Jan 2018 07:05:27 -0800 (PST)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180103224208.30291-1-f4bug@amsat.org>
	<CAFEAcA82rAEcG5RH3LxVTHqKpEVDqL+mnW=NfoW-bQ=_VxoHEQ@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <797fc842-813f-77dd-959c-2055ee5e2b90@amsat.org>
Date: Mon, 8 Jan 2018 12:05:23 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <CAFEAcA82rAEcG5RH3LxVTHqKpEVDqL+mnW=NfoW-bQ=_VxoHEQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22c
Subject: Re: [Qemu-devel] [PATCH v2 0/2] pxa2xx_timer: ignore incorrect
 registers access to use U-Boot
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Fam Zheng <famz@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: qTB4uzsMjJWT

On 01/08/2018 11:52 AM, Peter Maydell wrote:
> On 3 January 2018 at 22:42, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> since v1:
>> - fixed qemu_log_mask() lines indentation (Alistair)
>> - added Alistair's R-b
>>
>> tiny patches that allow to boot a Gumstix Connex board and use U-Boot.
> 
> Thanks, applied to target-arm.next. Patch 2 is missing
> a #include "qemu/log.h" (hence the patchew warning) -- I'll
> just fix that in my tree.

Thank you!

I'm adding a sticker to my monitor "build with
--enable-trace-backends=simple" before sending a series with new trace
events.
