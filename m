Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3188562wrt;
        Mon, 7 Jan 2019 00:02:50 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6k9kzzahpCAtRWKeRDRc5bCIxgZbFL0GAUP5P762tMLaG0ltkvHZG3UbdNOZ74Fhoh2Liv
X-Received: by 2002:a5d:488f:: with SMTP id g15mr50789221wrq.15.1546848170056;
        Mon, 07 Jan 2019 00:02:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546848170; cv=none;
        d=google.com; s=arc-20160816;
        b=JA+910NHqPADN+mvJ5qOdwp3EQidgIxnxOVm9vE2NhsdVjA63H9NXGwmSkDxJsrZR3
         /bmNw9kINPR6PFgFPg0nd9+dGgPJkTHFBc/W44DEa3wUrbM6p47otmOi1Nkp3G6iNYzy
         1rsO02fokx7PjfjpF1ayutczNhM5SxAoFZvKHkT9exFP9TqtWpCQEOt/ioekDCHjGPpH
         9kn9a3dYYRd3XIuS1xkSbb4Rwv2iEGs4jdM8KbyTXDEQoM/ZXivDb7iu3SvcPuXUB8Qq
         MnKsGOfNhQozbzAZESlnbIo2+59ZvVEJy2In3UTqETJnwvvqbt83Fn48HhMdyDMAyjc+
         qxpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=/DA0K3gNgBadFXXVer+qJX8JD+BvnU4N1UpcM2BBFFA=;
        b=jCwv/lcWrVFlQ0syTVBdB53OeMDKyUmi5/4ApDUkL6yp25sSUHYrQb1oMLo/XvQUvl
         hHzQJbxM5Hlex8rgCXrMKr/mFPOl15z842WTwRHJtvgGB3Nk4qmeQjUxcMXGjLmvafGc
         YRPbjz1q89g9tRTyBiVHUuHyyaH3Cj+v34fkBwnznyMLSt27giMrHNH9TJeREurv5uj8
         M3tEKjeOy1ACzpUPKKHbGODK0ty1FgpLs18J412M2aPBZgaEfaF6yPFgVR2JL4vEpMNz
         KxH9xL/xU4KAuAhR7hsemJmILLwPZFDZJEVY71FOu0VAXbQhsynh1jW6GUK9EuNlztTp
         Q7/g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8si16488507wrw.341.2019.01.07.00.02.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 07 Jan 2019 00:02:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:42378 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggPs1-0005UP-4t
	for alex.bennee@linaro.org; Mon, 07 Jan 2019 03:02:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42460)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ggPro-0005T6-4h
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 03:02:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1ggPrl-0004UN-Vp
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 03:02:35 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:36556)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ggPrj-0004Q4-Sg
	for qemu-arm@nongnu.org; Mon, 07 Jan 2019 03:02:32 -0500
Received: by mail-wm1-f65.google.com with SMTP id p6so6530699wmc.1
	for <qemu-arm@nongnu.org>; Mon, 07 Jan 2019 00:02:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=/DA0K3gNgBadFXXVer+qJX8JD+BvnU4N1UpcM2BBFFA=;
	b=A0pQfUwoPgXN88BMgMQTE6TjYtAYyGKPchvQJa7fI7THLQzwWq7/XyXwVmGazAOwa6
	DFqmyXiuKj9y1dQl/FhRsS/fpz/JX4nss9LqOXnvTRUlvAfowaw7I9ir2eVioJEUX40g
	TR+rNH86kXfJuckaR1p25KPO66ypYe8g5H3B2EbqMYBJqrICUKG48VNULovXvKtZSrO9
	tiqYmZr83w8AHAmJkf8klmxY+AOjrHi9xWjuBTydOCMZ2c8JNs9yp2rKJF5nWB+aUBEO
	9ukoj9bbAlwKW910CEyQ3gdZgNsS0isaogv8B458OGx34PuxjMegTJuXJ4832Kq/wLsx
	mEKw==
X-Gm-Message-State: AJcUukc/vbnEyTc7UAeCyAA74DcsVU/tfr6MsZezkFQozDFJcaqroBXq
	ke9hI5jXYJAiyzYtOAgpvnAdiQ==
X-Received: by 2002:a1c:c181:: with SMTP id r123mr7878997wmf.8.1546848148690; 
	Mon, 07 Jan 2019 00:02:28 -0800 (PST)
Received: from [192.168.1.33] (110.red-83-51-161.dynamicip.rima-tde.net.
	[83.51.161.110]) by smtp.gmail.com with ESMTPSA id
	199sm7996617wmh.21.2019.01.07.00.02.27
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jan 2019 00:02:28 -0800 (PST)
To: Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org
References: <20190104175847.6290-1-philmd@redhat.com>
	<20190104175847.6290-9-philmd@redhat.com>
	<fe31012f-9311-1455-a20a-70eb83400e50@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <6443e9fa-6fb3-56d8-8568-93608cff0d69@redhat.com>
Date: Mon, 7 Jan 2019 09:02:26 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <fe31012f-9311-1455-a20a-70eb83400e50@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-arm] [PATCH 08/16] MAINTAINERS: Add missing entries for
 the TI touchscreen devices
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Rob Herring <robh@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>, Joel Stanley <joel@jms.id.au>,
	David Gibson <david@gibson.dropbear.id.au>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Beniamino Galvani <b.galvani@gmail.com>, qemu-arm@nongnu.org,
	Peter Chubb <peter.chubb@nicta.com.au>,
	=?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
	Richard Henderson <rth@twiddle.net>, Andrew Jeffery <andrew@aj.id.au>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Michael Walle <michael@walle.cc>, qemu-ppc@nongnu.org,
	Jan Kiszka <jan.kiszka@web.de>, Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wOXBRZ0oG/4X

Hi Thomas,

On 1/7/19 8:18 AM, Thomas Huth wrote:
> On 2019-01-04 18:58, Philippe Mathieu-Daudé wrote:
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
>> ---
>>  MAINTAINERS | 2 ++
>>  1 file changed, 2 insertions(+)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index f571b29077..03872552ee 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -640,6 +640,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
>>  L: qemu-arm@nongnu.org
>>  S: Odd Fixes
>>  F: hw/arm/nseries.c
>> +F: hw/input/tsc2*.c
>>  F: include/hw/display/blizzard.h
>>  F: include/hw/misc/cbus.h
>>  
>> @@ -649,6 +650,7 @@ M: Peter Maydell <peter.maydell@linaro.org>
>>  L: qemu-arm@nongnu.org
>>  S: Odd Fixes
>>  F: hw/arm/palm.c
>> +F: hw/input/tsc2*.c
> 
> The Palm machine does not seem to use tsc2005, does it? So I think this
> entry here is wrong.

It does use another touchscreen controller, the tsc2102, which in the
next patch are declared in the same header (you suggested "tsc2xxx.h):

$ git grep tsc2.*init hw/arm/
hw/arm/nseries.c:284:    s->ts.chip = tsc2301_init(penirq, kbirq, dav);
hw/arm/nseries.c:306:    s->ts.opaque = tsc2005_init(pintdav);
hw/arm/palm.c:88:    tsc = tsc2102_init(qdev_get_gpio_in(cpu->gpio,
PALMTE_PINTDAV_GPIO));
