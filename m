Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp1884298wme;
        Tue, 22 May 2018 12:26:42 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZrA7sHyYPSXhi5ddONt8Qr/IkcJeaIR/+mEAsxMVgsx9MM0wmMrblKwd59jYr/kCWnilM3u
X-Received: by 2002:aed:3536:: with SMTP id a51-v6mr23808469qte.96.1527017202077;
        Tue, 22 May 2018 12:26:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1527017202; cv=none;
        d=google.com; s=arc-20160816;
        b=1CnbXCDqBadfL7DGYQUESUKiiQvHTToW3BtW+ad13j6vd6HEofQDqRYLRIWDds50Wg
         j+sUgwKL8XS++ioIhT5R/Do7O5CyswSeuE4nPoFTv5gVG0SPRpQ+Qrw+Jf8gAGJf4Zvt
         L32DqFVnIOKpgsqAvU/rOEHHxruhWIvMWdPjr0PDiHAH4TeZ45u18hqaTN/VCZi5Kfvz
         6zQGUKNWiJuakAL/asXbw4Py5Hb1SrHQNBwznx3V96h8r9Xh/kRAuumcoYeGDhMDt1Cv
         1cKwG6ehaBIHdnTgdSDTOEdHq2NWzD75CkLmAOzH8su/MO3WQD4MmAXtL4H6qtn4mQYm
         mKoQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=p9tzXXdUlzg7WInvqLDVl2M0bz39WuPD+utdAo3YPLU=;
        b=VIDXvaznoK93uc05ouityAlgcaLxLU/ycKVE3nTh4+yDLtGvXdbUXV/HsBy2NL+duX
         nyDdIKiiAmT2E584l1kz+Zb/ppo3GlDBVm3VExUWZjFAGveYkfXL9KVz6ezFSP4dwYkk
         BXS3VQFD8kR31pSY8zYICLuyO5v+fJcprD5ccBBLviDyJ3RcYlKFIESep5DJrGWzMXo+
         x27zutUt9TreGCRpgAsDDTNRVxR5vhxbNlE3zw0exYQ4JpxCz0sUYWqh4srXNDQkkcRy
         hSletvy77zkPPQVqaRFkPaHhuLy8zhjpnFqzVRubn+XIPV0bLolE8Z/Ob7gDWiJs1JF+
         Qhww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DjyDJwo8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s2-v6si1324218qti.304.2018.05.22.12.26.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 22 May 2018 12:26:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=DjyDJwo8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57524 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fLCvh-0004ih-Kz
	for alex.bennee@linaro.org; Tue, 22 May 2018 15:26:41 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60677)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLCvW-0004iK-Mq
	for qemu-arm@nongnu.org; Tue, 22 May 2018 15:26:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fLCvV-0006R6-R9
	for qemu-arm@nongnu.org; Tue, 22 May 2018 15:26:30 -0400
Received: from mail-ot0-x244.google.com ([2607:f8b0:4003:c0f::244]:38784)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fLCvV-0006Qn-MI
	for qemu-arm@nongnu.org; Tue, 22 May 2018 15:26:29 -0400
Received: by mail-ot0-x244.google.com with SMTP id n3-v6so22337061ota.5
	for <qemu-arm@nongnu.org>; Tue, 22 May 2018 12:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=p9tzXXdUlzg7WInvqLDVl2M0bz39WuPD+utdAo3YPLU=;
	b=DjyDJwo8lrl+X+X2aCGKASc/8V3i4Oip9/lRC68i2dsfBDKzumN7Mwt0Wk2IZPQbK2
	x3cA0CuychweJvVS7zq6Qlbp6/qop44/kUXzKl6+rNIxIgKNoT6f3rZYmEy13QNBQUzC
	8YU6P4OHWylu50/IFbq0rndwdkOWTbE0w/x+8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=p9tzXXdUlzg7WInvqLDVl2M0bz39WuPD+utdAo3YPLU=;
	b=hMQZuDV6z64uH3tkRIGJx98RKyei7NT8vWh1xKc3lKr3DAJvmFvZftpv/w2hZt55Ga
	V1nEtIIVkjVz7ANiqiEM51gMd8Va3lemIUh5+DKxLdwZf9+NisVg3m/Z9DmhDyw07ZrQ
	YEjJ6o25fCtMOI9piIJdAhsuSCD/W/sT6DKO1zLf9CcFgPk600GhvelHZ7xE/mv2INhn
	+bUuY4JhXWCAH/5XKZ4G0CExM7B845TolFqTAeILQHtDFA/JiBNnZliqJuSxuDZbyRsg
	nJ7bU5je7nchfPxPD5Lo1VYhh2iD17r3MVMk6rhuaPfFqvH3P9mdbXUon/5u5ezkKtrK
	aVtw==
X-Gm-Message-State: ALKqPwfkrXGqqvlGkQvC+SCYL10WJ4WbxnF8g/6rJObs69WjbLM2zRe7
	hS1+jOqvgFq7Tds2LLoPHzs6cLbSjiat1XXw30TSIg==
X-Received: by 2002:a9d:16d0:: with SMTP id
	s16-v6mr17783101ots.294.1527017189010; 
	Tue, 22 May 2018 12:26:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Tue, 22 May 2018 12:26:08
	-0700 (PDT)
In-Reply-To: <d8c13782-48b1-0975-ee2c-0d2ec2eecebe@kaod.org>
References: <20180522173713.26282-1-peter.maydell@linaro.org>
	<d8c13782-48b1-0975-ee2c-0d2ec2eecebe@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 22 May 2018 20:26:08 +0100
Message-ID: <CAFEAcA_3P-JEsiz_3ZdVhG2kcQ+Y3yOAufLQtHknuzufRosANQ@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::244
Subject: Re: [Qemu-arm] [PATCH] Correct CPACR reset value for v7 cores
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: w9KDhRpJU3Gl

On 22 May 2018 at 20:06, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 05/22/2018 07:37 PM, Peter Maydell wrote:
>> This is sufficient that a save-and-reload while the romulus-bmc
>> machine is in the bootloader will work. On the other hand if
>> I do a save-and-reload after the kernel has started booting
>> then we get the classic "guest hang after reload", so some
>> state is still not being transferred somewhere (probably in
>> a device in the machine model?)
>
> I see the problem. Bizarre.

Usually it means that something in the path from timer device
through to the CPU has failed to save-and-reload the state
that it needs to, so that when the timer fires post-reload
it doesn't actually cause a CPU interrupt. You can probably
debug by putting a breakpoint on whatever looks like a likely
timer device's 'set the irq line' function and stepping
through to figure out what's happening.

(You're not using trustzone, are you? I know of a bug with
migration of cpus with TZ enabled which I'm probably going to
look at later this week)

thanks
-- PMM
