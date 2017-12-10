Received: by 10.223.159.74 with SMTP id f10csp1752495wrg;
        Sun, 10 Dec 2017 10:15:47 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbq81Q7UFmdZvxbih+RFOLlJV68ydteTKUORdP1kCWhtHGWSyu8JwFTe4vFJXx/t3KFt4k1
X-Received: by 10.37.12.68 with SMTP id 65mr24991216ybm.345.1512929747203;
        Sun, 10 Dec 2017 10:15:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512929747; cv=none;
        d=google.com; s=arc-20160816;
        b=nr6nsiYBB6JJSVvbvVyXxTBUdG0tQJEWFGOdWdt7E3X+Tx5Fp7Fik2k3Rggd3NfX+u
         6fv3CEyDBQksu03s6MvqGylOpxy+20J6l7WyZLAHea8Ac3P0niOJkpo+d7zIUhCEa4cx
         ZXOIgn0M08NFUu3tnfjUak2jTWuxvmwd5RGfqCKDhVwtmd3buF9tl3X5Ls0NAEpSnZ5D
         5nLaB6naWKq//q9lM/8Q34tJwgQqeVcp3WeWiPw1AHh4xRi8h0kz9bGs+iH92dTOCSAe
         0iu/mnsSBuJIfilHZMlIHTfYU22/BTfmLZisJwDVb0WKOUdPhwxEd2nHgAIsPY5gd5cq
         FA1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=nSUgL9HHKTnhvTUH3BFAnIS7vj2bFWU2M+5B/bquaAo=;
        b=M5mt6sJ77wgVptwL9MKr9H6Rbqc+zKLKBQUwAIugndfwe/eXjffdA0wwBwkbtUvEyX
         7VSoic2Suvf6Ch2hif44kLQPdfSHiPQfv0/uv6Ix01U9nD0wGTAKarzMEpbvO+7oMo5E
         QQjAOcw+zsj2a4tXGHHqsJTUCxOOUlx5csqf+HW1NQK/aIxrGvarlztYc+K04sH3QHRE
         uE/WYa82LTe9se1xHe8mnUeM8G33iZt8lG11ceZdfPAkShijFFU8Vu4qzAcYOQ2VtELq
         GyGObt3EERranT/qJVe4byNXEi+CeFutq0QaRBx1oYFwUKxwjNwQH4aiThWhAjfP3yUC
         TTyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QGZu0UIi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k78si2701907ywe.272.2017.12.10.10.15.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 10 Dec 2017 10:15:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QGZu0UIi;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45532 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eO68g-000213-Kn
	for alex.bennee@linaro.org; Sun, 10 Dec 2017 13:15:46 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45194)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eO68X-00020d-92
	for qemu-arm@nongnu.org; Sun, 10 Dec 2017 13:15:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eO68W-0002HP-Dv
	for qemu-arm@nongnu.org; Sun, 10 Dec 2017 13:15:37 -0500
Received: from mail-ot0-x243.google.com ([2607:f8b0:4003:c0f::243]:37014)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eO68W-0002Gk-9D
	for qemu-arm@nongnu.org; Sun, 10 Dec 2017 13:15:36 -0500
Received: by mail-ot0-x243.google.com with SMTP id s4so13014991ote.4
	for <qemu-arm@nongnu.org>; Sun, 10 Dec 2017 10:15:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nSUgL9HHKTnhvTUH3BFAnIS7vj2bFWU2M+5B/bquaAo=;
	b=QGZu0UIiO3AxmCG0kqkG+A9Ja7i1VfpL5jWUqhDnLG3HwMnsWMYa2yJ0BIP6UhXRB5
	DWN0gUKG96ACDwahKSVLKcY3wHUlC8eILWOwuhEQrxrZiTaeNZu8YZrwXCK/iwEvcKxE
	s4ofp2cSvv/GVGJEZTGq5O5EmHO0bXhzSAWFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nSUgL9HHKTnhvTUH3BFAnIS7vj2bFWU2M+5B/bquaAo=;
	b=gtn5kBBVf0hPrsUMNRTwDOu/On0O+qAtOU1kJYZByQcg99rMIOijt9/5IHkdBF+diN
	/cZjzgoboqa3QKfR0SPdKcrTc4nacYt9mDJH0bn1K+tRTLRU2baXeu/fy6VtbfUXp8xw
	V1sWfHT1+P/j+BzKHM+48m0ZWLBLDV9eMtJ+MavKJ9aPLhToAfiCArcF9CkpZgCa/6Z0
	pbCLhq6N1wvhbYdyQO6WsTVxr2mp7Tiki2hbvpS0oFZ50lm1nhXvgIkBWS5+O3qGToFJ
	4dQUniNoAE0x7TBzQPI3/DbSoQgjFx6EliqEBKdi0+v4JGrcd5WxGpDiPTUHkF4HcDNz
	L/dQ==
X-Gm-Message-State: AJaThX5HGUUavPd4vzuDMahehbmuS6PNkxFzbkaA/3fh1raThuEONaQE
	uKBBXJoSSNpFffd1BXIe6tFcKaI/mftd6Em8HPXzmQ==
X-Received: by 10.157.80.24 with SMTP id a24mr30449807oth.335.1512929735128;
	Sun, 10 Dec 2017 10:15:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Sun, 10 Dec 2017 10:15:14 -0800 (PST)
In-Reply-To: <CAHmME9rSEtwg=n1gtqOVh=Et5yn45Yveh3LEFj357aqRZXwwcQ@mail.gmail.com>
References: <20171023122719.17199-1-Jason@zx2c4.com>
	<CAFEAcA_PM5Fjx2Pk58h75p9vaZwFcusQdXuwy9tbDtc=EaoOJg@mail.gmail.com>
	<10e16ca3-175b-9f34-65e7-031b883b7201@amsat.org>
	<CAHmME9qtBiuAEnkCeuMd7EdeZveTVa4UOf+AQhMCFye0SYJY=Q@mail.gmail.com>
	<20171026133445.kemzfgvpbmtcogsl@kamzik.brq.redhat.com>
	<CAHmME9oyBvAV8FF9QMHyF46n8Ct6KZqThQVih2ipQmivD94Cag@mail.gmail.com>
	<CAFEAcA8O6YyS1tSzaydckFpsqpb8HXgW5PJe-VTWud_5YGdW5A@mail.gmail.com>
	<CAHmME9pE79krWx-zD=VGiScT4c=4TZ1wVxYFiF3m+8wsx9Fqeg@mail.gmail.com>
	<CAFEAcA9XoeXDCQCmRBehntWSo0WGRBsaMDmC8QCqgU1K8jAF_A@mail.gmail.com>
	<CAHmME9qSJSPjANce_cWN6nm=qJsncfczgk7PoPa0xkOHmZjLUA@mail.gmail.com>
	<CAFEAcA-bKPNwJpcny=1azScO8bzHsi0Ou+m3rYPq-=v52Gf26g@mail.gmail.com>
	<CAHmME9qNnqYEbW_m8LG0E0HBKUE38YjUodbBihnSi2k0FrZJtw@mail.gmail.com>
	<CAFEAcA-5F2GMx9UNoH=LJAa-m1DXg2HW8PJZ47kurjx5x3NhWA@mail.gmail.com>
	<CAHmME9rSEtwg=n1gtqOVh=Et5yn45Yveh3LEFj357aqRZXwwcQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 10 Dec 2017 18:15:14 +0000
Message-ID: <CAFEAcA9R4=+aTuvrkkOBTTFnu5jnOKaVWLY9t+2Hj+dQrtdaHA@mail.gmail.com>
To: "Jason A. Donenfeld" <Jason@zx2c4.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] hw/arm/virt: support 4 serial
 ports
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
Cc: QEMU Trivial <qemu-trivial@nongnu.org>, Andrew Jones <drjones@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sBVCRU6CxYXm

On 8 December 2017 at 18:39, Jason A. Donenfeld <Jason@zx2c4.com> wrote:
> On Fri, Dec 8, 2017 at 12:49 PM, Peter Maydell <peter.maydell@linaro.org> wrote:
>> My suggestion is that we should add a second non-secure UART
>> to the virt board, so if you're using secure=no then you
>> get serial 1 and 2, and for secure=yes serial 1 is the first
>> NS uart, serial 2 is the secure uart and serial 3 is the
>> 2nd NS uart. (I don't really want to add a 4th uart unless
>> there's some good reason to -- maybe we would turn out to
>> want it for the secure side, for instance.)

> I'm curious why you don't want to add a 4th UART. It seems trivial to
> do, and the more the merrier? Or that's a silly attitude? Mostly just
> curious about that, as having two personally suits my needs.

As I say, if we add it for the non-secure world we can't
make it a secure uart later if that turns out to be what we need.
The "4 uarts max" limit is a compile time one.
(Also it uses physical address space in a region which is
relatively small and which we might want for a different device.)

thanks
-- PMM
