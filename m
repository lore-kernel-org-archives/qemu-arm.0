Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp1993179wrd;
        Tue, 21 Aug 2018 07:39:32 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPzm9dBfe1ntKPYHMAlQtVOtdkNfhxbgSinzLJy57m5z44oLIqmNjiXK1iO0r4AHJ7CNDLn/
X-Received: by 2002:ac8:31bd:: with SMTP id h58-v6mr20553170qte.145.1534862372267;
        Tue, 21 Aug 2018 07:39:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534862372; cv=none;
        d=google.com; s=arc-20160816;
        b=cGCTzI4E7x44FO9hefGisTpQ+CYbdyaDDAcVK8ZARh/b0nPOoY9Kzb1B3Y16hhtIkt
         +BHljVWRr2GPkR4wrNJoh/1vYXI3GoUTJt8gzLaK0pFhGu8LBu+uoxMVjBVWoer2t2xj
         xV/3zsnMATOLSDi4x4X+99s3WLTRG2CFj2v+BNpuurF/5eLwpiBJXqODlPPsG8FBWEPJ
         FglD+9R9IVdPjT/zmndgLClTIuKihokG24CC2A/VfwzQaMOqyX5+xe1m13dRvqX4ohOo
         AmPgiPjObdM8hSmZ4g1VGz5s2LB4Ci+9jk/92X+Sm2C0lrG0mPFrDgMlEPSr0kE2pujP
         FxhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:reply-to:from:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:dkim-signature
         :arc-authentication-results;
        bh=zUU+xOWsAjwXkhTv6Qc2/g28txxNgubcMuiMAY5Af+w=;
        b=UZ5agBOjEkEp7kzeMTNsRUO539VMizyhiX1pg7x7GDDlnTi84XNu9tH6gMqycPpNei
         MdzaqXmIRtEdPNquMbJj5gnQjOSbJiqmrdUK61TQUrmLtBslzikp/otxzWszjgWorwD9
         v2aoQdMM/ULHDYMEAROqqEqJvnAhk8M8szDy1fB/9BDtf6Np0soA/cQAbnCEU0aD/O1c
         FJaDJr9qlxueuYJebiYbGH9DIPoONBhWdzjSL92HP7ywy4VbEqSRtOQb3H20bWWKxQsP
         CQD5jgUPE7tLKzvk6iHrdSAp2JHIgznc4DgzT/Fk3wkJVFZiiwTff1f9ygPQIxp1oyPe
         8bYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@mail.ru header.s=mail2 header.b=uKb8h3Wq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 62-v6si4341386qku.18.2018.08.21.07.39.31
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Aug 2018 07:39:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@mail.ru header.s=mail2 header.b=uKb8h3Wq;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54006 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fs7oh-0001xB-IT
	for alex.bennee@linaro.org; Tue, 21 Aug 2018 10:39:31 -0400
Received: from eggs.gnu.org ([208.118.235.92]:39622)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <jusual@mail.ru>) id 1fs7oS-0001vw-RM
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 10:39:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <jusual@mail.ru>) id 1fs7oN-0003qG-Td
	for qemu-arm@nongnu.org; Tue, 21 Aug 2018 10:39:16 -0400
Received: from smtp36.i.mail.ru ([94.100.177.96]:38550)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <jusual@mail.ru>)
	id 1fs7oN-0003o5-4R; Tue, 21 Aug 2018 10:39:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mail.ru;
	s=mail2; 
	h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject;
	bh=zUU+xOWsAjwXkhTv6Qc2/g28txxNgubcMuiMAY5Af+w=; 
	b=uKb8h3WqezaEk/gBQkaKqru0+CwdGQZ+54ycW4uqb+1Fn8qZ/NtDvM8pLslWMfxrdfyGQTUgdGmc2Gl/IScHwYVktpCxAsjWcUA1i5KNz1Xlop5wLCrvs6ZhepaMIIyO9JLKacojM/juoC59BRED36b5KDfgQ+QlQF6upZAOJZw=;
Received: by smtp36.i.mail.ru with esmtpa (envelope-from <jusual@mail.ru>)
	id 1fs7oJ-0003Js-4g; Tue, 21 Aug 2018 17:39:07 +0300
To: =?UTF-8?Q?Steffen_G=c3=b6rtz?= <mail@steffen-goertz.de>,
	=?UTF-8?Q?Steffen_G=c3=b6rtz?= <contrib@steffen-goertz.de>
References: <20180811090836.4024-1-contrib@steffen-goertz.de>
	<20180811090836.4024-7-contrib@steffen-goertz.de>
	<CAFEAcA_=8r_X_rLfwJovEkusBb6hmaG5Ns8YQxQMLL4z0KpHXw@mail.gmail.com>
	<6c13fca2-6f16-adb0-1072-7601abefd18d@steffen-goertz.de>
Message-ID: <156619bb-c1c8-3338-b327-6dd298aa16cf@mail.ru>
Date: Tue, 21 Aug 2018 17:39:03 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <6c13fca2-6f16-adb0-1072-7601abefd18d@steffen-goertz.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Authentication-Results: smtp36.i.mail.ru; auth=pass smtp.auth=jusual@mail.ru
	smtp.mailfrom=jusual@mail.ru
X-7FA49CB5: 0D63561A33F958A560945CD9364FED4A39E11ED43A59E3CD188011539C69AE6E8941B15DA834481FA18204E546F3947C2FFDA4F57982C5F4F6B57BC7E64490618DEB871D839B7333395957E7521B51C2545D4CF71C94A83E9FA2833FD35BB23D27C277FBC8AE2E8BF1175FABE1C0F9B6A471835C12D1D977C4224003CC8364767815B9869FA544D8090A508E0FED6299176DF2183F8FC7C01B780A39BCC1DD35B3661434B16C20ACE7DDDDC251EA7DABAAAE862A0553A39223F8577A6DFFEA7C983A24F52E3FD00DC247EF6CF1F8C7BCEFF80C71ABB335746BA297DBC24807EA27F269C8F02392CDC1A41FEE7B8D90AE3C9F3DD0FB1AF5EB4E70A05D1297E1BBCB5012B2E24CD356
X-Mailru-Sender: 805131ABF43B5F09F0FB011D781A234276AC31CA85D94F3C80A1DAF31CAD83816C3CB3B31809DA4F342D7E53901C55FD6F53C80213D1719C4487B406A59785443329DBF425CF03A167EA787935ED9F1B
X-Mras: OK
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 94.100.177.96
Subject: Re: [Qemu-arm] [PATCH 6/7] arm: Instantiate nRF51 peripherals
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
From: Julia Suvorova via Qemu-arm <qemu-arm@nongnu.org>
Reply-To: Julia Suvorova <jusual@mail.ru>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Jim Mussared <jim@groklearning.com>, Stefan Hajnoczi <stefanha@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6UhxfLdCAQHf

On 21.08.2018 14:43, Steffen Görtz wrote:
> Hi Peter,
>>> +
>>> +static uint64_t clock_read(void *opaque, hwaddr addr, unsigned int size)
>>> +{
>>> +    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " [%u]\n",
>>> +                  __func__, addr, size);
>>> +    return 1;
>>> +}
>>> +
>>> +static void clock_write(void *opaque, hwaddr addr, uint64_t data,
>>> +                        unsigned int size)
>>> +{
>>> +    qemu_log_mask(LOG_UNIMP, "%s: 0x%" HWADDR_PRIx " <- 0x%" PRIx64 " [%u]\n",
>>> +                  __func__, addr, data, size);
>>> +}
>>> +
>>> +static const MemoryRegionOps clock_ops = {
>>> +    .read = clock_read,
>>> +    .write = clock_write
>>> +};
>>
>> You don't need to roll your own "do nothing but log" device:
>> you can use the TYPE_UNIMPLEMENTED_DEVICE to do this.
>
> Until we have a more proper STUB for POWER/CLOCK/MPU peripherals we actually need this,
> because the unimplemented device will return 0 on reads which will cause guest code to stall.

Do you need this stub to run micropython code? Could you delete this,
please, so that I can post the correct stub structures for js
directly on Joel's code?

Best regards, Julia Suvorova.
