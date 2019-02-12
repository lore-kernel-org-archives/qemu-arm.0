Received: by 2002:adf:efc1:0:0:0:0:0 with SMTP id i1csp594702wrp;
        Tue, 12 Feb 2019 03:13:50 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbUFNZsMJKXgS6KNg2GdWbIUNkNdj9MUHZypDQDkvoUtGaWDPUavgqzSG74Am+EowVKUhMW
X-Received: by 2002:a25:a43:: with SMTP id 64mr2281408ybk.475.1549970030589;
        Tue, 12 Feb 2019 03:13:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549970030; cv=none;
        d=google.com; s=arc-20160816;
        b=MSPNoEfljQxKWVF7ve8xkM+COHMtyCgdNDM3Gg4blHOuxCdD2PpIKzJuVT1jWDQOpY
         wsBjir+38CV9z8ZwRg0QoEnOyiYRsP0wq+L1XPo+qlVvViQMwLW2PcKu6vKb+YxfbMvN
         LhHs3BYcSEJ6FiF9aGMWNcmTKIGRwVDXk7bmHL4NxH9clwdY2GmOgYS5QYQEkQZpXzda
         5BjFerr5wQNb/+BoMHgNdQmB6xhvDNNB152jh1H7wjvPd9Khe2wZyvE2sd8b2AAcV1Uz
         kY3q5XeUpQxlAeeQ1xJkUECpEzQtSDHoRO/SD0BCiJAhDZDg77SsooImPwCYL5SuQzUU
         pLeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=LN8B65PE5y68gsJcnnX8RHkVwYYe2GA1T9B2mt9XU10=;
        b=KdC4KMRmeOegHbHLfw2gJxXnh4MYp2Fs0AJpTh7M3umBhsXFZqKpW3D6Yru827GSWo
         /+IlBtFNBgZ848vK84n8G32RHIC8ZyYutrKmmHbS7KdKxJFo66ypPXyUzKEWwSmuAWVm
         Bus34rII2sFrHC4dhBJvg5CnNtEQLlkqvwGS/tForl72OCgfUI1dnbv+TFAwjHayqAT4
         zAvgfFuK8iCp0HKuxiIhE5wC6YFxD10ftg9/Nted0YpG7T+VS0NpFp3hN27Hp/8np2DJ
         qGjgESSzVnFMymtC4ewer9hxc9X+OJ/Eeud/EXvYDildTQQkhVXn+Xjk3RzOFHdc1nLx
         iJdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SmPuTtvm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d15si3336334ywb.64.2019.02.12.03.13.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 12 Feb 2019 03:13:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SmPuTtvm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:37481 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gtW0b-0005cP-UR
	for alex.bennee@linaro.org; Tue, 12 Feb 2019 06:13:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55951)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gtVtt-0008Sv-AI
	for qemu-devel@nongnu.org; Tue, 12 Feb 2019 06:06:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gtVtr-0007Ah-C3
	for qemu-devel@nongnu.org; Tue, 12 Feb 2019 06:06:53 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:42055)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gtVtp-00072H-8U
	for qemu-devel@nongnu.org; Tue, 12 Feb 2019 06:06:49 -0500
Received: by mail-ot1-x341.google.com with SMTP id i5so3668385oto.9
	for <qemu-devel@nongnu.org>; Tue, 12 Feb 2019 03:06:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=LN8B65PE5y68gsJcnnX8RHkVwYYe2GA1T9B2mt9XU10=;
	b=SmPuTtvmsLZYSegkAVFhG4BNNH2879ZsIiLGlO8MtvzKvidUh6yVoav1n/OZFr18w0
	v1HACjETeGuwyz46RVbaUP0QX9PtW6JgBI85MCPm+58iDxZ+vldyPNhR2liQLbPFoW1Y
	mh6i1hkMk0VJbSJ6pqBN7ePQnYw7BspL7K5Dnl49x5yRLsFr/PwvIABmEBxyvqAgTRYu
	Nf+QB9gInZQVKcyLo9IoLIEdpaV+JZ4WbJcvBrGgSgMfbmxQ12H5/8BOr35EbXrvIGKj
	xtgqBXfxyxkexIhv4EjyfZfZW6Vdwi9VlSBcux93rhjlJB5efF8pgg8C3nKwp5Ocvy/b
	Yo6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=LN8B65PE5y68gsJcnnX8RHkVwYYe2GA1T9B2mt9XU10=;
	b=Wz0PkEh4B9t/Mr9Nw3W8qUiaKzCaXaxwpbhABfz5EueULLfBECF4dUqmPn25oCvEbA
	+t7CfeyaffroX4ZZEvdEjnkE0KOv32jAL8uWfMB59AtzHamT9r9suUtN1PNPLBny59Rp
	x5BTWUqnKs78xzqU/E7bgVZO1RFyYx2EsB5k6xrVSyOOJKZ95yHLjNxn+UBmdfm/YjKJ
	+926zgiGDy5vyQJzCAshhyPVhHgAQ4UqvPbMAZhoDg0AoFFdFvts6SaNei47H/bL+2ga
	ngJCjsZa8vqELBQ1g6acKv6hwgkJ/s0UvrvxhvNaUdGEgW2aFqzagDdjLOAVdYSjnEn5
	sK/g==
X-Gm-Message-State: AHQUAuZ53mG+f7y5nv8SRBbxVI7793Y9nXIv1egRTiis7iHVy4LCIViQ
	mC83J/LZbssu9YNyLaoX2BGQ5tyWSZ/tUZ8D6Qnv+Him6dM=
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr3254181oth.317.1549969604814; 
	Tue, 12 Feb 2019 03:06:44 -0800 (PST)
MIME-Version: 1.0
References: <20190212105201.13795-1-peter.maydell@linaro.org>
	<1df0da56-7abd-4688-0fed-6dc2bf10ebb6@redhat.com>
In-Reply-To: <1df0da56-7abd-4688-0fed-6dc2bf10ebb6@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 12 Feb 2019 11:06:33 +0000
Message-ID: <CAFEAcA9Jds9wLwJUqe4kJrDszL__KoWpKm5ajh0HCcR+mSH8tg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH] hw/arm/armsse: Fix miswiring of expansion
 IRQs
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZoH24CWOk6sW

On Tue, 12 Feb 2019 at 11:05, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> On 2/12/19 11:52 AM, Peter Maydell wrote:
> > In commit 91c1e9fcbd7548db368 where we added dual-CPU support to
> > the ARMSSE, we set up the wiring of the expansion IRQs via nested
> > loops: the outer loop on 'i' loops for each CPU, and the inner loop
> > on 'j' loops for each interrupt. Fix a typo which meant we were
> > wiring every expansion IRQ line to external IRQ 0 on CPU 0 and
> > to external IRQ 1 on CPU 1.
> >
> > Fixes: 91c1e9fcbd7548db368 ("hw/arm/armsse: Support dual-CPU configurat=
ion")
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>
> > ---
> > It turns out that the ARM-TFM image I was using to test that
> > I hadn't broken the mps2-an505 doesn't actually rely on any
> > interrupts from the external devices...
>
> How did you notice that, simply reviewing? Via 'info qtree'?

I'm working on a model of a different board (Musca) which also
uses the SSE-200, and the test code I had for that does happen
to care about the interrupts.

thanks
-- PMM
