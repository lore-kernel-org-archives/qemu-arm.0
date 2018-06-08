Received: by 2002:a5d:4301:0:0:0:0:0 with SMTP id h1-v6csp967672wrq;
        Fri, 8 Jun 2018 07:44:07 -0700 (PDT)
X-Google-Smtp-Source: ADUXVKJn2Nd4/H+TpBRziqY00U48G1Nnv+UsEJ1Pz1d1dS5HBwkNPT8n4mRA+jor0JCXbinfFPF9
X-Received: by 2002:a37:c69a:: with SMTP id s26-v6mr5630574qkl.16.1528469047249;
        Fri, 08 Jun 2018 07:44:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1528469047; cv=none;
        d=google.com; s=arc-20160816;
        b=j0HPaqnsdEhnMh46++Am7i950fi15DecNM8F2ZB1e+ePbnEiFmU1M2USEptoBUKIW5
         PD2Uqsr3y8iogGbHf3pPdCyH/pwReFi7idp00A5W7sE5vE5e9KnveqSrkTvAEbgHpcCu
         2IQd5M1Oe+j+gl1dj2ZQ8xtcZ3KwgAREZ0ljz3SDR2uxrjIQr3qnblP4dNCgp82T4BTU
         JM2kZ1kTNxIslkSXvUxlZhwQkt+lPiAEp5a23UUPxsTgY95EEpq3i/eObkERUNcqQsaa
         NMawFW/vbNN37JdpHJsp0ZmBvigMwj4AtunYdVYw9NL3BkLzow4RsLHNH9In7qIV/1aK
         dgmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=FLU3uSTOf6q5YV1YFCMJwwreFuBPDiEhO3oqo4hzF2k=;
        b=cdtE9vGZaJRNr2A+NL+qGomQARZLh4n8xhHoP4L8/VDdd2bHvOSjacYxa+WSfE3AsH
         bWZfe/zC9l3/Umpx3q2QV8dtbl9dQMaEFU+kXOQLiFHAl1O8VcgPFHMjkuWzv//KsrLX
         zvF8KiHqj3YQXvi8gFA0Bjr7Zdw0Y0AYgYqsMfmBYI/BMLx+aJpX+3zLZlQreTuFddEv
         58sDN7HeRaRORYNLe/30Tfe3PHm8L23TIDxTyxfMaSCiY9OKJ2CIhdorIkVJCj2vSsoH
         dz9B/uT9eK4DdEyl6e6MPTlNCMEAVfcqhOCSJ87PFStPh26SkrUrdv0aFGbKU/S8vdRM
         Co4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IFlhfbZY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id q128-v6si755572qkf.403.2018.06.08.07.44.07
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 08 Jun 2018 07:44:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=IFlhfbZY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36271 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fRIcY-0000rj-RW
	for alex.bennee@linaro.org; Fri, 08 Jun 2018 10:44:06 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56924)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fRIbl-0000M1-9F
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 10:43:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fRIbi-0005Jw-7n
	for qemu-arm@nongnu.org; Fri, 08 Jun 2018 10:43:17 -0400
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:33254)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fRIbi-0005JV-05; Fri, 08 Jun 2018 10:43:14 -0400
Received: by mail-qt0-x241.google.com with SMTP id l10-v6so8453359qtj.0;
	Fri, 08 Jun 2018 07:43:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=FLU3uSTOf6q5YV1YFCMJwwreFuBPDiEhO3oqo4hzF2k=;
	b=IFlhfbZYTxPpsFGJnM7jK0+BJM3qYcylFOjFus5d9kpr4/yyv7a+ck/KzZ5khT04Rk
	wKLrtW8K2rHe72L7BImxb0ohKFLillMJ76XtCg/bM1nHrjMbDhrP61s59bGdRwKm/TkG
	obswIPSOlrvTAUZyp/WVL1PI2mTQ71fPz3LfpXqH/+oIUaV+Y0vMo/Yj8Wrz85WJPSf5
	DEUAQej5396YyAsmTpk2UADYskuw+R1jgx4kpRE3RAKjOGLPAW3PAjrzsQ6a0U48YQl1
	0DxR9k0IAd5xsoMTzNt69wElTZon3kpoWxRH4DaYtYHK72wTZv/oSY9dHa1rJ+uKRlO+
	mfUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=FLU3uSTOf6q5YV1YFCMJwwreFuBPDiEhO3oqo4hzF2k=;
	b=qutXfSkcz4EIi/mry9EOHfJrqkKbH3RAWTf4rujQyy+Sv1Dvo9n9pBQRwV48FSwSmG
	bd63HHkexulO+19eiX4xiJCyEjLnH9iNJohu+NyaEJ4cuOTl3JHJYTRyO+Hq5Oyh+ueh
	IiaLPbPNi7E1Ok/WYnxFoJMl7cKWy3pKjDx6ubbFKzBl/o84pRHG26WNfjrYug3yMf7g
	a5HvuVw9vxi5ytrO4iDTaU1pNqLo9J2P5VV/L4rrvfvKT6cUlcv/QXBaQI7rLVreAxhs
	xrcO3nykv8cOuSV6t93JCHWc2nuGoCDQVTFNuzTMyUy5Zt5I/k6GKIu66VGWPT+ZKaD0
	9cuQ==
X-Gm-Message-State: APt69E3ZK89bvLr+mC0bgnS2FGRgKtJD93DVSjewb52ctp2VU6gX/9WT
	2L3nxo+wZUXgzu7706p82Rk=
X-Received: by 2002:a0c:af67:: with SMTP id
	j36-v6mr5938612qvc.194.1528468993386; 
	Fri, 08 Jun 2018 07:43:13 -0700 (PDT)
Received: from [192.168.1.151] ([190.48.121.146])
	by smtp.gmail.com with ESMTPSA id
	k2-v6sm34634635qkl.95.2018.06.08.07.43.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 08 Jun 2018 07:43:12 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>
References: <20180607180641.874-1-f4bug@amsat.org>
	<CAFEAcA9N9XyQrU9Y1XmgLDU9viUB1+U8iQH5QguAkxzqop4piw@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <4d519668-0f79-80c9-ceef-9fe531c76c1f@amsat.org>
Date: Fri, 8 Jun 2018 11:43:09 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA9N9XyQrU9Y1XmgLDU9viUB1+U8iQH5QguAkxzqop4piw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH v2 0/7] sdcard: cleanup the SD_SPEC version
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Paul Brook <paul@codesourcery.com>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Apqx7Ill58t3

On 06/08/2018 09:14 AM, Peter Maydell wrote:
> On 7 June 2018 at 19:06, Philippe Mathieu-Daudé <f4bug@amsat.org> wrote:
>> Since v2:
>> - heavy documentation improvements
>> - squashed previous 3+4 "add spec_version property default to v2" for atomicity
>> - SSI/SD patch downgraded to RFC
>> - added Alistair R-b tags
> 
>> Philippe Mathieu-Daudé (7):
>>   sdcard: Update the Configuration Register (SCR) to Spec Version 1.10
>>   sdcard: Allow commands valid in SPI mode
>>   sdcard: Add a 'spec_version' property, default to Spec v2.00
>>   sdcard: Disable SEND_IF_COND (CMD8) for Spec v1
>>   sdcard: Reflect when the Spec v3 is supported in the Config Register (SCR)
>>   sdcard: Disable CMD19/CMD23 for Spec v2
>>   hw/sd/ssi-sd: Force cards connected in SPI mode to use Spec v1.10
> 
> Hi; I've applied patches 1-6 to target-arm.next. 7 I had a
> question about.

Thanks!
