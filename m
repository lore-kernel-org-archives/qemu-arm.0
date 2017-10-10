Received: by 10.223.197.9 with SMTP id q9csp3555915wrf;
        Tue, 10 Oct 2017 06:25:20 -0700 (PDT)
X-Received: by 10.55.110.196 with SMTP id j187mr11454590qkc.192.1507641920867;
        Tue, 10 Oct 2017 06:25:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507641920; cv=none;
        d=google.com; s=arc-20160816;
        b=bJPF1goBNgLmIqTHZ2yBZZgD4q7PcpBuz3gbe/jGdHZexu89FkmIbXXqnUBg//fdQF
         PhaNuNY9RqKEZlJP2lcA359gZvhZC4iqzV9vnRU2Kqt/zV9k008opIIjIKOnJ26wGJc4
         7dLs3FIVgzn55P3zxNWQJGncPAsEfodGAQgPktZc7+d+Gulr0OgZdX/NZrQzv0PlI+Bi
         I/gv5Qo48KRqNRivFrQYm1NG8wmFSelUNRHDX/gpGk++NX7dNJW33vX/1OLPuaaTT0Zi
         R5FhCqaGh1ofthUPCHbQnINCPxmE35mZ8w8FjhCE9+L4pasXjZ2qnqOadKZLSz8LD3mr
         l5sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=hEIGFO0eWyZwSULlqUfsYSkytV2XyqAJd/KDlR4DL1E=;
        b=muACYs7E1gQVnc4OLvRqcPaXK09KddUxg34DQGVrOAiAiBLlgHXSfqYQ2obfiuUGdz
         +RnmI3EDG+jBquLzPmYWtV7AJcYZgRHaGPwlbYbaDAxCGOE94MVQZE47hRLQnOgixyBn
         MFFj9dVSViS6KhJd1mqbXL8ykTHMyxCUBdTVdbIStVyPB0FtWnwlVVqyb+y48nCyyBMb
         G2cFe3dTQF1uhCZCZt6Hurz++4mF3rf8Chq3LgCCmDuTSlY4fEDfr93yvnHT5pRLqEjy
         0gCef/NVYCgA+qC2/gTjLIFjWpO4SC+FYoKU4mNBEpIhEwIaHqPhc8Dtbw3sfAsKGUd4
         HWiA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kbGG6j1Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g186si943162qkd.231.2017.10.10.06.25.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Oct 2017 06:25:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kbGG6j1Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:35072 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1uX8-0003e6-KS
	for alex.bennee@linaro.org; Tue, 10 Oct 2017 09:25:18 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56123)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1uWu-0003bt-8s
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 09:25:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1uWt-0004ro-BJ
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 09:25:04 -0400
Received: from mail-wm0-x236.google.com ([2a00:1450:400c:c09::236]:46723)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e1uWt-0004rW-37
	for qemu-arm@nongnu.org; Tue, 10 Oct 2017 09:25:03 -0400
Received: by mail-wm0-x236.google.com with SMTP id m72so5159453wmc.1
	for <qemu-arm@nongnu.org>; Tue, 10 Oct 2017 06:25:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=hEIGFO0eWyZwSULlqUfsYSkytV2XyqAJd/KDlR4DL1E=;
	b=kbGG6j1Zp+dfO9Zo/bXigHT+l1fVPFp/i5THMDvkBkE2TGT9Ciw5F5XMoXcpO4p44U
	6xeYVdnf6UmEzFI7R0pGKcPuSzh2YUDq5buC4mXbIj66VEJF8mh6ZQQaO82j4hK3xGA4
	9YYhehKQ4vBapd5jJoQ45NGGFwyX7NZNuUsDk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=hEIGFO0eWyZwSULlqUfsYSkytV2XyqAJd/KDlR4DL1E=;
	b=rlPaItgMQ7WpmPe0OCXEq2xyIeKAlkcYC3fYPHAPdIHNjEhvLW/ef1u24Qbjd7nbgL
	gjwSJd4PHPrgslMAe22yHWjIUpSd7OoS21XdkC3GAVQF7eZCEBOCDiyBYABeD9f2h1hL
	5pJqze9y4ZB4GqFkm45fpEyif18XaTkkarYeMzFS5s+C3DZlVKHIefS/VDt1+KDeHAJM
	/CrVbT8+g5zqRe4iixTNxOZVA5641KIlsVUKmuSmjnxyeJeeIJudB8dXmvj2eqRvznNK
	fSaUkmG8itRZakcY6hkSG814GjXY4b0Adwz3Hh79N7dkacSD3Pd09ELyue0+VL+kkNz9
	o2mQ==
X-Gm-Message-State: AMCzsaUKEmu5OeWbnzMck+6ES//JWmwgtzAa0jeUlh4L7SMyb1wdGgBc
	zOPE3lLYC9R+fPK7Hc0XCCUAE/xH3aTR4w0k81mapw==
X-Google-Smtp-Source: AOwi7QANI+p7c77/CZIw8QRGt98UDE8yHQNJTHWANAf3YDrW8dlC+7/mkqrwYEb70D/4IkzxG3USHmPyGp7oVnvlqbI=
X-Received: by 10.223.186.201 with SMTP id w9mr12285078wrg.230.1507641901946; 
	Tue, 10 Oct 2017 06:25:01 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Tue, 10 Oct 2017 06:24:41 -0700 (PDT)
In-Reply-To: <900ffff3-3667-7e17-bf38-7c6a520ed838@kaod.org>
References: <20170920070135.31379-1-clg@kaod.org>
	<20170920070135.31379-2-clg@kaod.org>
	<CAFEAcA9-dmTD3v1YU7Wr5EcA53z=c_WxS0K1+1zbw16q=vj-vQ@mail.gmail.com>
	<f3871f0a-7df2-a5e0-1770-8df04bb76750@kaod.org>
	<CAFEAcA-kJ-qEoo-2ZWaH0XPv-cJA4O3wZAW=FwmM5nUU4-mVBg@mail.gmail.com>
	<900ffff3-3667-7e17-bf38-7c6a520ed838@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Oct 2017 14:24:41 +0100
Message-ID: <CAFEAcA-tZG-mVMk-kfxZz3oKOSBr9QDpwJWc_CSvqc7An8NNbg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::236
Subject: Re: [Qemu-arm] [PATCH v2 1/6] aspeed: add support for the
 witherspoon-bmc board
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
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 33L8hztkpn2h

On 10 October 2017 at 14:21, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 10/10/2017 11:54 AM, Peter Maydell wrote:
>> The goal is to model hardware correctly. Hardware gives
>> aborts if you touch a physical address with no device there,
>> and so QEMU's model should do the same. If you have guest
>> code that touches a physical address and blows up because
>> of an abort (but doesn't when run on h/w) then either:
>>  * it is trying to probe a device that exists in real h/w:
>>    you need to provide a stub implementation in QEMU
>>  * the SoC's bus fabric really doesn't pass aborts back
>>    to the CPU; I think this is unlikely, but you can model
>>    it at the SoC level with a suitable default memory region
>
> well, that is case it seems.

If it is, then we should model the SoC that way, ie find
out from the hardware docs what part of the bus fabric
ignores decode errors and use memory regions with the
right default behaviour to cover the relevant address
ranges.

thanks
-- PMM
