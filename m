Received: by 2002:a1c:4d4:0:0:0:0:0 with SMTP id 203-v6csp366296wme;
        Tue, 15 May 2018 07:48:47 -0700 (PDT)
X-Google-Smtp-Source: AB8JxZraK2dwVMI364U1TQ5i6eULSvK1lrRL2BddJnrETWVHfqPdeuXWHmxC+vddjqS90ej2Mum+
X-Received: by 2002:a37:2162:: with SMTP id h95-v6mr12932214qkh.443.1526395727439;
        Tue, 15 May 2018 07:48:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1526395727; cv=none;
        d=google.com; s=arc-20160816;
        b=hTapJM0MnpP+ywavnEB+yhqgPAG6+UxjlMdG7DsetCiM+CVl0+FA3QeABUNJVQaCab
         Vs+D+MAYpST1rtDASF5nuaLntptbezoT5mftz2vMP+/DYXxZL1nzKqG/bLGxXMNci20p
         C/Cu+C8l+Uf6rvFoHqe3ZTusc8GO04u0XAdI86pPErZ/pdhfKqJRpdBP9Ik7b9pS+8Dt
         tgRNiO9rnX8B8tXu0tjUv46hEygqZUBzrVHLnBkTy5dMRGMc2sTUT6kWYyRp8m44DEpU
         I0qGzV50+E9UKYWzzOP6VGfTiB2Loal9pgaAH9BXtF/L2B0OG7ENf1byzexV2quYa29p
         JBJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=8pLmsuKW5DgNGDKrZgD/rxWxz1cBaZqR8GN3vbbsylk=;
        b=qSLmrlSZe4LMWyRr5tqCzrgBE4XkbCfGHcPbCxKz3hCCOr9AMOAZxF6Zr3QxR2oITm
         h3OTzu3QuQuczyZ2PK0656yNMnRefPme+AUjQnDa3zFY/dTcv2/xvcSRqaMWcxsaV9fn
         fIM8+YlwOWDQiD+S9TgqrNed75d6ghrbbQm7hXi1qtbnGkpGyv2GXe3JhbSUOQf79ORu
         adu4Ss83DMDpC8hhatPoYBbomi/GOVwzoXJYvmo9bW6Ew7ahFZgbgtim8WyvGnteTe8w
         auON8Gm11UpfHZjwF95RaweuRbuxwx4rvlcC0LPu+Vk4sQW+EBNgxbEkJKQ4bylshEzu
         7HTg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uhvCMhqT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id m73-v6si237609qke.41.2018.05.15.07.48.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 May 2018 07:48:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uhvCMhqT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:41742 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fIbFu-0004T4-Um
	for alex.bennee@linaro.org; Tue, 15 May 2018 10:48:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50231)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fIbDn-0003Cl-R8
	for qemu-arm@nongnu.org; Tue, 15 May 2018 10:46:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <rth7680@gmail.com>) id 1fIbDk-0005hZ-K2
	for qemu-arm@nongnu.org; Tue, 15 May 2018 10:46:35 -0400
Received: from mail-pf0-x241.google.com ([2607:f8b0:400e:c00::241]:46426)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <rth7680@gmail.com>)
	id 1fIbDk-0005h4-DR; Tue, 15 May 2018 10:46:32 -0400
Received: by mail-pf0-x241.google.com with SMTP id p12-v6so154905pff.13;
	Tue, 15 May 2018 07:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=8pLmsuKW5DgNGDKrZgD/rxWxz1cBaZqR8GN3vbbsylk=;
	b=uhvCMhqTCG0cEDVz45X+VhNiGYpGZ/wf0DL8fl39a5U/cw+x0H8kDfRG2l+dTAhNUQ
	5k02mPoqUZPdaoEPIDRD3sbkXuKQhdvgIzlmTOySRVVSSYYU7a39xnZ3Gv7wmzZiU28g
	6GFpbwkny2+E3bSlmQJizbDBddowRDja9Us2KVOnIGtk+7DZXdOqB0cO4d4wKkdT8TbR
	xrna1O764VUl2qWgaXCh1VQGRU87hVH7V+iYMksPLCycDhKTPQZAOlpQDN2TSbBXCMkA
	0I62X51oncosFrFghrkTfQn5TxuJ751KN0JPpTvCCTPUbOrxG2O17o4U1p2hlCl1GAxh
	YYsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=8pLmsuKW5DgNGDKrZgD/rxWxz1cBaZqR8GN3vbbsylk=;
	b=lMLFySaELXs1tSzW+nX+4/Ow+Gbi8d4Swq7w1sUxWDvmdpELeCZ4FGo4mXV5TmVK4Q
	0zzGqn7tFxEGvhf2yhgO9p1kyi6VIAsOhlkmaTHxMFlcCAZLAWAh9JA03VK9en4YkBaT
	MPD67GzbXWlh2/U8Ru625o2rbIaNW9O5m6So6uV9O9hlvsqejhE9YqlX3W5JUl2qP6EL
	OyaVmu9Fq+I4JMxZPKH4T67qaYLbhszntpbFSmb0jvMdFHyQq0CDx22pxy83IODxG8+/
	YSWp5BUpsyxkmq2LwrXooT/jOWh/kIFNAAKvjGOFKlF3DL5veHj7Hs6pV5rO2CV6mTwC
	PfzA==
X-Gm-Message-State: ALKqPwdE0BI7rFd7kZJXpAU/saK8NmTj5gg3mOssvk4XXmkLUOaTZ/sm
	4XngzfEUc1NmfaaHUDIzhRRfA+X+
X-Received: by 2002:aa7:8354:: with SMTP id
	z20-v6mr15364065pfm.166.1526395590738; 
	Tue, 15 May 2018 07:46:30 -0700 (PDT)
Received: from cloudburst.twiddle.net (97-113-2-170.tukw.qwest.net.
	[97.113.2.170]) by smtp.googlemail.com with ESMTPSA id
	l63-v6sm424211pfi.6.2018.05.15.07.46.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 15 May 2018 07:46:29 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, Stefan Weil <sw@weilnetz.de>
References: <20180513090613.27960-1-sw@weilnetz.de>
	<cc3f26a7-a8b7-35a8-9ffa-c5940c9c1927@weilnetz.de>
	<CAFEAcA9kcKb28uQJOnqCAC4Gf9b7Hnu0wJbG1nHQLF4U1T9sKA@mail.gmail.com>
	<99693ba4-c282-a10b-e811-697617f7ee06@weilnetz.de>
	<CAFEAcA81y1r5N2zi5fPoV5iZ9dd0YBeThcX=qXdJXdNSNO8nsA@mail.gmail.com>
From: Richard Henderson <rth@twiddle.net>
Openpgp: preference=signencrypt
Autocrypt: addr=rth@twiddle.net; prefer-encrypt=mutual; keydata=
	xsBNBFGuLC8BCADcAoWcnW9lTsDMzbO3MBU+KbiGaj5JPatEUscRDkQYM2fyNjJp2tIWDK5a
	n4yngeXB3eX61WbYR3QraRK8mlYLGxyAdHMEQfPipbqf3TmN043fssT2bc82ApJcs1zvLYgI
	rhMht7Dck7A0wNC1jo+ZjVVFig5gDTN7gOzaAdBtV8tVNUddwkLzzaGpfihhSD6U46NdqKOG
	Wlnn6TrkMy0QGdQ5NaXHkRlUjnnUTSW/nKfoxD+EI+A9V4sYOd8mc/TL4aJh/i/AiU57eLbo
	n17uQI6/VTWDUWl8USiz4x9c8vmqlywLx00tAFxxoRWqk4KVJlj+Sh0up/D/sJ+vPpgBABEB
	AAHNI1JpY2hhcmQgSGVuZGVyc29uIDxydGhAdHdpZGRsZS5uZXQ+wsCBBBMBAgArAhsDBgsJ
	CAcDAgYVCAIJCgsEFgIDAQIeAQIXgAUJC7UHogUCWaDNVgIZAQAKCRCtEnDMTdAnm9N5CADO
	cB8F/SudJ72IupxQf40hbJdBK176+gb3sHMsixyLtrU59lee+lIM1OZmlNjsnCYmiSnbA5ks
	Q7p0HfO7DgdmfLzcK6xsHZukqSZy5LByw348Y913ZyjOrJZFdPP7kDg1MnqRqH4+3ZdzxV4y
	eYBWFU9GYMIF06JbUubossOOO4ArNVZbnIPu8Vn2tDZVVqsCBqkoCSBMj519xrvyOu5z4mHS
	LkCglXmVDOXMbqLuNAC3rfNXSnyM4hYkLUyfALJlAAy1Ro+jUqYhu7XUFV/MiwRuFMh5GbtY
	Urkx7tqsWQXLT3GeDk/LqvpWJQwk4cHHckYjRih+70CHIenm81PVzsBNBFGuLC8BCACyEx3x
	94HIkTX0CHu2sA0w75+h9wuoA8ggJ7+S4ri0y2YsijWad5TTt6z6MMiqxk9kSA5bppaj4HXh
	86hBF/dWCtMpNr3Rb8FNOKyeA/qkYHVD6HiAiw9c6D8Dr9hWmOk3/HSmGrNURxeUFOckDXsv
	I+yGGKBNshj59j7QZr7ZiuIi2rWlBL8dFN/OWa/o3x7HKsE4k6K8ngwvCKP/QbDLwLLBOWH+
	VEUtpyeyxTr3OJ47ECTxdYvXoAV2iJaKr+6doVQiiR5eVFiMYrUPUECJeolOCwqc/JlWE18L
	+PCAFaW1H+/mpPVfSpN4wnkJ5cQiQVB41IaCM4p20iRzx7ZJABEBAAHCwGUEGAECAA8CGwwF
	AlmgzYEFCQu1CEoACgkQrRJwzE3QJ5s7rggAwABzDAGrZ6uWsMxg5PeiiAYPy6LBnCBJSpB5
	Tfy5jH8QTmLfXW+u4Ib4sWXG7PYNR7sIrtqUHjRqXLVXrSnBX9ASGcYw/Xil45khW6LsRpO1
	prHv9gkwQfa6fTiWXVfSfm2Nant6u02q+MaYtQpCVTiz/9ki4FfftUwUHFLU0MhIQogjd11y
	/E08RJsqBwaHQdt14PwU1HphDOzSkhOXRXQLSd3ysyeGUXvL+gqQoXl5XYdvk8IId4PoJRo4
	jcyJ4VbnldvXh5gdGhFA/f9JgkLk9tPW+C3wNtNWyRUq8azR9hF2fg2HJUf4IXQlIu8OOgh1
	VcROBqvtH3ecaIL9iw==
Message-ID: <291b8b6f-1692-a5ee-f44c-4f8c4dd614fa@twiddle.net>
Date: Tue, 15 May 2018 07:46:27 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA81y1r5N2zi5fPoV5iZ9dd0YBeThcX=qXdJXdNSNO8nsA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400e:c00::241
Subject: Re: [Qemu-arm] [PATCH] disas/libvixl: Fix VIXL_FALLTHROUGH macro
 for QEMU
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developer <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aC+zeYRtAqdj

On 05/15/2018 06:25 AM, Peter Maydell wrote:
> On 15 May 2018 at 14:13, Stefan Weil <sw@weilnetz.de> wrote:
>> This is fixed in upstream vixl, in fact:
>>
>> https://git.linaro.org/arm/vixl.git/commit/?id=de326f850f736c3a337fda52845ed3d2e620cc02
>>
>> That fix will work for the moment, but is not sufficient for the future
>> because it only supports gcc 7.x, but not gcc 8.x or later:
>>
>> +#elif __GNUC__ == 7
>>
>> How do we proceed with the code in QEMU? Do you have a plan to update the
>> vixl code? As vixl is obviously no longer maintained on GitHub, I am not
>> sure whom I could contact.
> 
> The github page points you to the linaro repo which is the new upstream.
> That said, I think we're planning to deprecate vixl now we have the
> capstone support. Richard, what's the status here? Could we just remove
> the vixl code now?

We could just remove vixl, yes.  I'd like to see updates to capstone to support
instructions post v8.0, but it's not like we have those with vixl either...

> I guess that having the compiler check is better than finding them
> later with coverity. It's a shame gcc doesn't support the standard
> mechanism of using /* fallthrough */ to mark these, though.

It does.  Apparently not by default anymore, however:

@item @option{-Wimplicit-fallthrough=0} disables the warning altogether.

@item @option{-Wimplicit-fallthrough=1} matches @code{.*} regular
expression, any comment is used as fallthrough comment.

@item @option{-Wimplicit-fallthrough=2} case insensitively matches
@code{.*falls?[ \t-]*thr(ough|u).*} regular expression.

@item @option{-Wimplicit-fallthrough=3} case sensitively matches one of the
following regular expressions:
...

I think either =2 or =1 would work for us in QEMU.


r~
