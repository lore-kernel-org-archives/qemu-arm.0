Received: by 10.25.0.144 with SMTP id 138csp400845lfa;
        Wed, 12 Apr 2017 10:38:06 -0700 (PDT)
X-Received: by 10.55.24.219 with SMTP id 88mr41641835qky.249.1492018685971;
        Wed, 12 Apr 2017 10:38:05 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id i5si20101923qkf.225.2017.04.12.10.38.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 12 Apr 2017 10:38:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45575 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cyMDT-0002GN-Eg
	for alex.bennee@linaro.org; Wed, 12 Apr 2017 13:38:03 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41477)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cyMDN-0002G9-9e
	for qemu-arm@nongnu.org; Wed, 12 Apr 2017 13:37:58 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cyMDM-0002nK-Dt
	for qemu-arm@nongnu.org; Wed, 12 Apr 2017 13:37:57 -0400
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:35464)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cyMDM-0002mx-7O
	for qemu-arm@nongnu.org; Wed, 12 Apr 2017 13:37:56 -0400
Received: by mail-wm0-x22c.google.com with SMTP id w64so93768062wma.0
	for <qemu-arm@nongnu.org>; Wed, 12 Apr 2017 10:37:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=5k5orIRdS9y3RraOihFyQ835Wp+TSj22eYh3d+rJ84s=;
	b=fKU1HgWRDLVDJAGTvqLwmxIifQafjKM1rmbHtgKLO6L+tshqvGkHY6yrPg7R+wwfwo
	t7hLeHz8S9j/SaxKeyvWwEGGGN0oYi+ymkPrQtwvw1vHIJYb7cYoQ5iJp1HgSd+A2iK1
	Sd1KVAIUO0yrQIxRUb4cMIRNV7DVpZ+tcH8Cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=5k5orIRdS9y3RraOihFyQ835Wp+TSj22eYh3d+rJ84s=;
	b=fUGoipSb7azLElx/XeViC8MB/zTITwILL134saJmkgKaGAPaCrCFCv2VwR+1vqffQK
	OwdA48JQFEDC8JzfJ6rI6fd8fDA6amOUxDqZMLojRnZ5/JPypWjFJFXxfWdPohRzEQsf
	ZlpqRyiZklYDvPakv5eiMrl03WeMpDXHdcwQskH1ThWAx85mr9jzIx6+TJ4aGdcL0OPO
	pWFQ1xTX6wbc8pbQiduB2ongb9Pb2IwI0FMe02EhBNFecZhw9fIK8R8XNglXL74bYDoz
	iaZwOHZdm9mVCowA5Lzuo6qDQpNRhLvnUhyVMXqJ+NuxunVtDPJZGT8+tK7h/wnsyhQ1
	bAug==
X-Gm-Message-State: AN3rC/6q3/x0phK998LkzMDHYb9OGjJuilNs2fhoESZkqQo43VXQlAywiNkw58amzlZNi/+S2Jp6bajhNAUCUkZe
X-Received: by 10.28.34.130 with SMTP id i124mr3874814wmi.111.1492018675076;
	Wed, 12 Apr 2017 10:37:55 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.145.97 with HTTP; Wed, 12 Apr 2017 10:37:34 -0700 (PDT)
In-Reply-To: <2fc1a67b-5608-2736-c629-b8a1c8730223@kaod.org>
References: <1491051477-10455-1-git-send-email-clg@kaod.org>
	<1491051477-10455-2-git-send-email-clg@kaod.org>
	<CAFEAcA8jfj1p45qdPr9AWALb4dURQvDAiigok6pH7ao_nNT6-w@mail.gmail.com>
	<2fc1a67b-5608-2736-c629-b8a1c8730223@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Apr 2017 18:37:34 +0100
Message-ID: <CAFEAcA9L7b4E3Q4KmrNEbPrJu_V0LPpW3AO_pSzQhCvaGo9crg@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::22c
Subject: Re: [Qemu-arm] [PATCH 1/4] net: add FTGMAC100 support
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
Cc: Jan Kiszka <jan.kiszka@siemens.com>, Jason Wang <jasowang@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>,
	Dmitry Fleytman <dmitry@daynix.com>,
	Samuel Thibault <samuel.thibault@ens-lyon.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zTQ3RgyHkSjM

On 12 April 2017 at 18:29, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> On 04/10/2017 03:43 PM, Peter Maydell wrote:
>> On 1 April 2017 at 13:57, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>>> +    case FTGMAC100_MAC_LADR:
>>> +        return (s->conf.macaddr.a[2] << 24) | (s->conf.macaddr.a[3] <<=
 16) |
>>> +               (s->conf.macaddr.a[4] << 8)  |  s->conf.macaddr.a[5];
>>
>> This will sign extend the high bit of macaddr.a[2] into bits 63..32 of
>> the return value, which probably isn't what you intended and will
>> make Coverity unhapppy.
>
> indeed. What would you recommand ? simply :
>
>         ((uint64_t) s->conf.macaddr.a[2] << 24) | ...

Cast to uint32_t is sufficient. We just need to avoid ending
up with a signed 32 bit value...

thanks
-- PMM
