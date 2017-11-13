Received: by 10.223.150.237 with SMTP id u100csp2448740wrb;
        Mon, 13 Nov 2017 05:28:48 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbs0Q4w/G+QGJAwytVckzcBdPm7IfxrBl/uplcdH1DF9lYY51qrw4nlqRFPD2sMwvtSoY7b
X-Received: by 10.37.14.193 with SMTP id 184mr5486246ybo.156.1510579728247;
        Mon, 13 Nov 2017 05:28:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1510579728; cv=none;
        d=google.com; s=arc-20160816;
        b=KTIhndHaEIrflTcCXPC0C1cUTC6XH+ppzCdnOhYVckl9UrZ+2n/2dXAM8YACeYp87C
         g3FHz3jQPnsT4+G1NGBz/lxB+Ocl08AQyYJOfNPsOFTyO9aYeHnK7/KDMv2yi2A3YbmW
         0l8r8k9QVVIOSbN0Fk631p95EubNZOJgY7LkfjKEqZOhfNIvO7UNAEePYjO0vQB6+OIy
         cdlM9lVn/7meV1FWxghAxQv1uvYp6EvSKErj2tGmlHRL8fQ3XUWlp8TTJMESshNu1o67
         31DwjgXmgDaIpQ9h1CXKTtKCy+NOgsdsKreZMnc0tg1M8c763rlfxuWeLBDSivdJ7mjS
         G0jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=+yxdPilJ+9Sk+RqdQ/gbLz7XMy7Z8/zF8EBxkNuCQHk=;
        b=JtxRjTB+dXIsHW01gb2P1UV/FLMT0DMB+QniaQsAWOiE0rxJmN6wTYstjbAy9iajgT
         5PU4gRE7YPwBLYxgBkm7pqvuiVHIG1VD8aD8TunHY2G6K7VpzCFYiy0+9aK2VQfDsTTW
         pcn29EGa7jSKV5Brkf97xx21CaXtCt2LEaT6och1zeAsbCrm5xPBwAzQNEvNhfKxdTTc
         Py7opfdooBKsgzx6nKy+iQEHC13NrMnXWPzTS0akExgxwv46Ij+W57FTEZftYFFYASBG
         yCbWPlt5rKEMcrCz0bKBHoia0Pn+zgs/gFuco97GewkDipI1Pmw3SphDhJoN1gPUglBt
         JegA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EXwcDz7g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id x67si3438505ybh.444.2017.11.13.05.28.48
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Nov 2017 05:28:48 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=EXwcDz7g;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:54427 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eEEn9-0003B4-Nm
	for alex.bennee@linaro.org; Mon, 13 Nov 2017 08:28:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:32983)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1eEEmr-000324-4I
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 08:28:30 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <joel.stan@gmail.com>) id 1eEEmq-0000QB-Bt
	for qemu-arm@nongnu.org; Mon, 13 Nov 2017 08:28:29 -0500
Received: from mail-lf0-x241.google.com ([2a00:1450:4010:c07::241]:44489)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <joel.stan@gmail.com>)
	id 1eEEmq-0000Mz-5b; Mon, 13 Nov 2017 08:28:28 -0500
Received: by mail-lf0-x241.google.com with SMTP id s16so18094100lfs.1;
	Mon, 13 Nov 2017 05:28:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=+yxdPilJ+9Sk+RqdQ/gbLz7XMy7Z8/zF8EBxkNuCQHk=;
	b=EXwcDz7gU8C+CS6f3ql7j+xl8Ijg2nNnMwXm4zepkZkS+t/T80bzTp88AbJ9xZcXMp
	pAQoXf8CnKW/+Xo8cqr284vuMyhhjuSgI3CPeh7rk9y58P5mvWvPxshckOcsCqkYR7uO
	71BUjCGatOgq2Nmtv234MrHASVEqN7QvO/8fazPdey65eKpVwRiyqvApupeBae0YA82O
	VgvJxz9ka31tU4yIZaaJv9zJMlGbkvHvNg6NlyYLJ3a0L8XMWjPLWA8Y5OyCwf9Dxb3q
	j50OcDJZL6MXVKWSnm59ibm19Gy0XLhhrL7zfVipdyBqVcnhXEdgtTKec31bwgfl5P/E
	lcKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=+yxdPilJ+9Sk+RqdQ/gbLz7XMy7Z8/zF8EBxkNuCQHk=;
	b=iH2iqn/w0gcXZfnSeZTt+0GOrlYFcDt8THSju08LaGm06xJdywvWwMnKYMCA+8Vikx
	kw0rGL8hCEJmhajbQCP6V/RwDfRqi0m6RUwtAdwzknCgfEHvoN7A8zz4mejt59BWeaw0
	EArfXKJgj5mh/suQd3I6S4dc12gKPpCdg4m2+nuLjl5y1xCal/rKmbccZF3iWWqggwT9
	NUoxKU2E6jbDxUeQTW3KQAAIFZKtAUhVww2O5I7v4KTSgx+G6RTOeFzQna8wCbJRQJp3
	ZrkZGzmcRARUOrQbi9qLvhrUPjJWuuJkRlZ+WpYYrFvQxFNq2/R2gIUgXAIoSJ7HJA4Z
	+gng==
X-Gm-Message-State: AJaThX5qxkKnb1Reuy5RLt8MX+x4KQB8QO2JfKZzhAa/TAMhCVfFR8kE
	nxHivExPV9pmQyBjz2d1/S5pOBTS1eEN3j+NBak=
X-Received: by 10.46.88.92 with SMTP id x28mr488847ljd.138.1510579706269; Mon,
	13 Nov 2017 05:28:26 -0800 (PST)
MIME-Version: 1.0
Received: by 10.25.155.4 with HTTP; Mon, 13 Nov 2017 05:28:05 -0800 (PST)
In-Reply-To: <d67d5e55-95e1-8858-2005-7df5a3c94cba@kaod.org>
References: <20171108032427.11163-1-joel@jms.id.au>
	<d67d5e55-95e1-8858-2005-7df5a3c94cba@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 13 Nov 2017 23:58:05 +1030
X-Google-Sender-Auth: nhUIutrgOqXdxmJNpVGC9RYIxFQ
Message-ID: <CACPK8Xc3gS0Og5Zbw2RE9RTjbn9xDkTB0cHGrEPUWMHe4FLV8A@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::241
Subject: Re: [Qemu-arm] [PATCH] hw/arm/aspeed: Unlock SCU when running kernel
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: gbocpz0IPGEn

On Thu, Nov 9, 2017 at 5:54 PM, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 11/08/2017 04:24 AM, Joel Stanley wrote:

>> --- a/hw/misc/aspeed_sdmc.c
>> +++ b/hw/misc/aspeed_sdmc.c
>> @@ -18,7 +18,6 @@
>>
>>  /* Protection Key Register */
>>  #define R_PROT            (0x00 / 4)
>> -#define   PROT_KEY_UNLOCK     0xFC600309
>
> why are you using the memory controller magic value ?

Oh. My bad. I think both ctags and myself became confused :)

>> --- a/include/hw/misc/aspeed_sdmc.h
>> +++ b/include/hw/misc/aspeed_sdmc.h
>> @@ -16,6 +16,8 @@
>>
>>  #define ASPEED_SDMC_NR_REGS (0x8 >> 2)
>>
>> +#define PROT_KEY_UNLOCK 0xFC600309
>
> Ditto. Should we be using the one from SCU ?
>
> Now that we are externalizing this value, adding a prefix would be
> preferable : ASPEED_SCU_ ?

I will grab the correct value from the SCU and rename it
ASPEED_SCU_PROT_KEY for v2.

Thanks for taking a look.

Cheers,

Joel
