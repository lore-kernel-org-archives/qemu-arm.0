Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1945693wrt;
        Thu, 24 Jan 2019 05:47:31 -0800 (PST)
X-Google-Smtp-Source: ALg8bN475wpE59FVT6iJjmp0mdu7HSbsg3Qflh46s5YIrlALfdL44GDVvO5fXu8/ZHG35Q8nHBTL
X-Received: by 2002:a5d:4fcb:: with SMTP id h11mr7397915wrw.139.1548337651803;
        Thu, 24 Jan 2019 05:47:31 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548337651; cv=none;
        d=google.com; s=arc-20160816;
        b=QMpWJiddbzwaueQdyWQlRcXIMginooE9PVodEx4oWtMEROBhH7YE3FCdUs2OKdMtWk
         n2cdSANU3HB8ZXOPYH4XzlOW9LJxgTeSlaBeRdz/nHgD/mUVvcN7fpXcXwVBlt8SfDtQ
         JXOOK1rebWfaEu7reHsgzylzubDDc8hLCka1QRuQO+XMtWoZSk5Nm0Hr8w9vHQ7hYJYb
         vWZyj9y/pUx8wLFhnsiQ1W1KJek2T2Au8usKIKGOzhFu9iQbquLDvbX4SGcmflLpzmq5
         ZZ8W506a73cx0M1OdYnbg2ZX9GJrTBg5cKukrCNfi0uPup3PDqWdujMHwx2zXVv/m+Qz
         W0tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=025YqkawA2ubH0ng6Tq5MgrOkzLLcmHVQ+JCkCJx55g=;
        b=M5D2szJfTHidoxU5iPnyKabqjm5Ug4JPU4sfwnaEtwopIgHdPuB8ihTvuMWatH7LTI
         zGXmDVMaBNM93Luu3oZdMpmArKYiJ7B6Twpy7xZCTD2tkgvouHBulISRoHQdlz0aMCI7
         2nZN/kQZ+Z+bBuxZ6Hw2e/PNyhVAxqIauag0na2LZ766rFPSLE4KdXadfJnzbA9FgxG8
         GiK2m4T3oLGyo1RlmsNlukGALDVbwmrU7k8pK/ViI5eEVLJm94ppHU2bsPTBNV9zHzOJ
         mjiabOQdAkwafLCmcvboVzbctkN+fr4XQssGHjikbXT6GSzPPuTxY2f88o33OdUB67pu
         JExA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b2si64641462wrt.409.2019.01.24.05.47.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 05:47:31 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([127.0.0.1]:54158 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmfLu-0002Yo-Qi
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 08:47:30 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58437)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1gmfFb-0005ho-C4
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 08:41:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1gmf8h-0000do-76
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 08:33:52 -0500
Received: from 12.mo4.mail-out.ovh.net ([178.33.104.253]:47255)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1gmf8h-0000Pw-18
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 08:33:51 -0500
Received: from player690.ha.ovh.net (unknown [10.109.143.189])
	by mo4.mail-out.ovh.net (Postfix) with ESMTP id 9F0CE1CCDB2
	for <qemu-arm@nongnu.org>; Thu, 24 Jan 2019 14:33:29 +0100 (CET)
Received: from kaod.org (deibp9eh1--blueice1n0.emea.ibm.com [195.212.29.162])
	(Authenticated sender: clg@kaod.org)
	by player690.ha.ovh.net (Postfix) with ESMTPSA id 2AA811DFC650;
	Thu, 24 Jan 2019 13:33:20 +0000 (UTC)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20190121154928.32065-1-clg@kaod.org>
	<CAFEAcA-n-5GVpnKn_w03bJUR2Wxf=vCtyeXt1GK=PKEzvahTMg@mail.gmail.com>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <fae7c680-9164-f42b-40f7-a3fecaa42552@kaod.org>
Date: Thu, 24 Jan 2019 14:33:19 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA-n-5GVpnKn_w03bJUR2Wxf=vCtyeXt1GK=PKEzvahTMg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 13738512141857753978
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtledriedvgdehfecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 178.33.104.253
Subject: Re: [Qemu-arm] [PATCH] aspeed/smc: snoop SPI transfers to fake
 dummy cycles
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xaBljvQVANur

On 1/24/19 2:24 PM, Peter Maydell wrote:
> On Mon, 21 Jan 2019 at 15:49, C=C3=A9dric Le Goater <clg@kaod.org> wrot=
e:
>>
>> The m25p80 models dummy cycles using byte transfers. This works well
>> when the transfers are initiated by the QEMU model of a SPI controller
>> but when these are initiated by the OS, it breaks emulation.
>>
>> Snoop the SPI transfer to catch commands requiring dummy cycles and
>> replace them with byte transfers compatible with the m25p80 model.
>>
>> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
>> ---
>=20
> This fails to compile:
>=20
> /home/petmay01/linaro/qemu-from-laptop/qemu/hw/ssi/aspeed_smc.c: In
> function =E2=80=98aspeed_smc_do_snoop=E2=80=99:
> /home/petmay01/linaro/qemu-from-laptop/qemu/hw/ssi/aspeed_smc.c:646:42:
> error: =E2=80=98R_DUMMY_DATA=E2=80=99 undeclared (first use in this fun=
ction)
>              ssi_transfer(s->spi, s->regs[R_DUMMY_DATA] & 0xff);
>                                           ^
> /home/petmay01/linaro/qemu-from-laptop/qemu/hw/ssi/aspeed_smc.c:646:42:
> note: each undeclared identifier is reported only once for each
> function it appears in
> /home/petmay01/linaro/qemu-from-laptop/qemu/rules.mak:69: recipe for
> target 'hw/ssi/aspeed_smc.o' failed
>=20
> Is it dependent on some other patch ?

oups. sorry :/ it depends on another patch adding this register.=20

I will build a patchset for the whole. It shouldn't be controversial.
I haven't add time to rework the DMA support so I will leave that out.

Thanks,

C.
=20
