Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3362645wrt;
        Mon, 10 Dec 2018 01:02:00 -0800 (PST)
X-Google-Smtp-Source: AFSGD/VTHkVCULT3u4oPBQ4bkskjMamnRPKs2MguXD0dTrLNPX+HoYUL88aSkFeDj6+wy+POaIeo
X-Received: by 2002:ac8:36d9:: with SMTP id b25mr11361385qtc.49.1544432520698;
        Mon, 10 Dec 2018 01:02:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544432520; cv=none;
        d=google.com; s=arc-20160816;
        b=OmKlQFILDni8IecwaK3wHuOEevr7pWE/ccbjEdcrWDHcZN9kK3ue3jzLMOe4o0z9cn
         7k/vN7HDKFAVT6RwcxMlimZodD9mug7n41t6O/4vJRS6TPl8QFuBkQliJbQObIj/6Ae2
         3KkPenA5FCkE3paZxEQUT02phQjdFwNX6WAwR6J9y0BbZukppZ7VgoYOYqK/BxOm3AQj
         OMGE3bN5AFSUQ5f896BpAwYcTnjbIM0LiecqpubxXdPnWV97CGOTcckTazyw6lkP/acf
         w70rXLcHQviQcjdj6yv/f5p9Z1aSxE2NNUBpQLqFLW0hz8UT76M2XE2l/QCa7IR9i84T
         lZ4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to
         :dkim-signature;
        bh=GLpMT6vMuE/pSCw5+A99ga29I9bTZpMtxTF1Jd18RRc=;
        b=SMQDBr0V/fc/dwX8fzB3EpvZGnStxMODK7gA0pIRYJayn6lZHFgMTSCHFqrrIK6ID8
         8bLsJMSaDC1YoeA+aje1yqV4lsId65SksIBK+tw3E3mskbCIjSzcgJC+uBfPYP/g5z6O
         jyJULHOtLCGFu82+06Onn1H4co37zktAaMzheB+m2Xl7NKu/fl0qrSDudeNHHnWBrUrA
         BTC/WkOBdPlCPq6r8/fwEpMqRL79PgOtQ43WDokopgeNph6zMMo6g89DMtbiKtmB0PLG
         38bUsUFYIXuXqnnxPRsWG8C2xxqYJvus3sZ2s73O0P9oQAKweDfjuBRiF1/qeTQbJOek
         Lyrg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uhlh7y+9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f9si3577081qtl.69.2018.12.10.01.02.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Dec 2018 01:02:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=uhlh7y+9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:59797 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWHRw-0002l8-A2
	for alex.bennee@linaro.org; Mon, 10 Dec 2018 04:02:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41776)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gWHRp-0002ky-8a
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 04:01:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gWHRm-0008FA-Fz
	for qemu-arm@nongnu.org; Mon, 10 Dec 2018 04:01:53 -0500
Received: from mail-wm1-x341.google.com ([2a00:1450:4864:20::341]:51284)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1gWHRm-0008EB-76; Mon, 10 Dec 2018 04:01:50 -0500
Received: by mail-wm1-x341.google.com with SMTP id s14so10066300wmh.1;
	Mon, 10 Dec 2018 01:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:message-id:date
	:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=GLpMT6vMuE/pSCw5+A99ga29I9bTZpMtxTF1Jd18RRc=;
	b=uhlh7y+9ZdkECUZbQPOMBgm6WP3DhIKumxg6V+EpeQNtji9rvz0NUwmxbORTweAl1f
	K+qqBYyg98uvRl1wq71LJjLxTZ+D8FssG22oH1jRis0unAdAkGB6jquas3ohB61naz9V
	a6z2PavVJhBKCsT2UL1HKJ6TS0yrO7UArQ3HA8WodUQ04ycGP5qWZq8NC/76p/nj/5R1
	/vhLKGab9Qz0X2ruQjuiZNRc0JsYXpI+YXQJz7Jv+oioUVBY9FSd+pK6btJBzkEsuJDy
	uq3ydGDubbnV2fNuwtyAmn4Fz3F/HFXlQYqnACxaIIgcT8ogXxmNWpdgLhMF2e2knKPW
	Ldjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=GLpMT6vMuE/pSCw5+A99ga29I9bTZpMtxTF1Jd18RRc=;
	b=c1VCSIADyz68r9J48acQuSfgTR5XwpxlogM3EwaecbegwBP8aOxGSmLUZZY10q2tVE
	Bo/3p96DWDV019RFgoicYe/OKZ0EPSV7rpfgH9QFl/XE3c2vZFx/frRbc2+WbFoDCYYB
	WD6+eIlleID1CHLEns2IsD5TMir1uy8CoAG1zibIx8pp0zAnerOSqrkC9A56NDjaMqOU
	gn6QcBdMFt7Bk+Cl4VF9yJ3J4v/LN8pd+kt9kYfWS8PfY+qRZaSDlDjX9up4EzCIy1vi
	ulh+F+Wrxkd5qoaFMV2VjRTqbEUU0AJpF1PfP5qSVyOA/0c7IgqxVJwIf4yK7gCpedAF
	QQ5w==
X-Gm-Message-State: AA+aEWa56Za9QyW9XzDHDe0hMRuA5zc0Dgn7f763WpGiqkJxV9wtTnIm
	1dR88Sz+P2wBILo6iuOsTYI38Eex
X-Received: by 2002:a1c:ce0e:: with SMTP id e14mr10428987wmg.53.1544432508838; 
	Mon, 10 Dec 2018 01:01:48 -0800 (PST)
Received: from [192.168.1.34] (172.red-88-21-202.staticip.rima-tde.net.
	[88.21.202.172])
	by smtp.gmail.com with ESMTPSA id p5sm8859260wmh.16.2018.12.10.01.01.47
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 10 Dec 2018 01:01:48 -0800 (PST)
To: Seth K <skintigh@gmail.com>, Alistair Francis <alistair23@gmail.com>
References: <CAErn8fQO8cwNC8KjkczGwh6L3sTgxyzPX48fVkUdihXW9gHBSg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Message-ID: <ecb955dd-2312-ca7c-6f7f-37ca024d918e@amsat.org>
Date: Mon, 10 Dec 2018 10:01:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <CAErn8fQO8cwNC8KjkczGwh6L3sTgxyzPX48fVkUdihXW9gHBSg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::341
Subject: Re: [Qemu-arm] [Qemu-devel] possible bug hw/adc/stm32f2xx_adc.c
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: piiKkIjBKAvO

Hi Seth,

On 12/10/18 4:39 AM, Seth K wrote:
> Thank you all for help with my last patch. I found one more entry in my
> notes that could be a bug, or could be a misunderstanding on my part.
> 
> The memory map in DocID15818 (Rev 15) datasheet says:
>     ADC1 - ADC2 - ADC3:  0x40012000-0x400123FF
> 
> That suggests a size of 0x400 (they share that range?)

This datasheet is more about how the chip interracts with the external
world. There is another document about how to use it (internally) which
is the "Technical Reference Manual" (RM0033 Rev 8):
https://www.st.com/resource/en/reference_manual/cd00225773.pdf

See Section 10.13.18 "ADC register map": There are 3 ADCs indeed, each
mapped at a 0x100 base. Each ADC can be addressed in a 0x50 bytes range.

> 
> Line 279/280 of hw/adc/stm32f2xx_adc.c seems to use 0xFF
> memory_region_init_io(&s->mmio,obj,&stm32f2xx_adc_ops,s,
> 	TYPE_STM32F2XX_ADC,0xFF);

This code define a single ADC and looks correct.

The consumer of this ADC is the SoC object, defined in the file
hw/arm/stm32f205_soc.c. You can see lines 70:

 for (i = 0; i < STM_NUM_ADCS; i++) {
     sysbus_init_child_obj(obj, "adc[*]", &s->adc[i], sizeof(s->adc[i]),
                           TYPE_STM32F2XX_ADC);
 }

Having in include/hw/arm/stm32f205_soc.h:42:#define STM_NUM_ADCS 3
and:
static const uint32_t adc_addr[STM_NUM_ADCS] = { 0x40012000, 0x40012100,
    0x40012200 };

So the SoC code instanciates 3 ADCs, each at the correct address.
(You can check the SoC Memory Map at Section 2.3 "Memory map" p. 53).

An easy way to figure out the memory map in QEMU is using the 'info
mtree' in the QEMU Monitor:

qemu-system-arm -M netduino2 -kernel /dev/null -S -monitor stdio
QEMU 3.0.94 monitor - type 'help' for more information
(qemu) info mtree
address-space: memory
  0000000000000000-ffffffffffffffff (prio -1, i/o): system
    0000000000000000-00000000000fffff (prio 0, i/o): alias flash
    0000000008000000-00000000080fffff (prio 0, rom): STM32F205.flash
    0000000020000000-000000002001ffff (prio 0, ram): STM32F205.sram
    0000000040000000-00000000400003ff (prio 0, i/o): stm32f2xx_timer
    0000000040000400-00000000400007ff (prio 0, i/o): stm32f2xx_timer
    0000000040000800-0000000040000bff (prio 0, i/o): stm32f2xx_timer
    0000000040000c00-0000000040000fff (prio 0, i/o): stm32f2xx_timer
    0000000040003800-0000000040003bff (prio 0, i/o): stm32f2xx-spi
    0000000040003c00-0000000040003fff (prio 0, i/o): stm32f2xx-spi
    0000000040004400-00000000400047ff (prio 0, i/o): stm32f2xx-usart
    0000000040004800-0000000040004bff (prio 0, i/o): stm32f2xx-usart
    0000000040004c00-0000000040004fff (prio 0, i/o): stm32f2xx-usart
    0000000040005000-00000000400053ff (prio 0, i/o): stm32f2xx-usart
    0000000040011000-00000000400113ff (prio 0, i/o): stm32f2xx-usart
    0000000040011400-00000000400117ff (prio 0, i/o): stm32f2xx-usart
    0000000040012000-00000000400120fe (prio 0, i/o): stm32f2xx-adc
    0000000040012100-00000000400121fe (prio 0, i/o): stm32f2xx-adc
    0000000040012200-00000000400122fe (prio 0, i/o): stm32f2xx-adc
    0000000040013000-00000000400133ff (prio 0, i/o): stm32f2xx-spi
    0000000040013800-0000000040013bff (prio 0, i/o): stm32f2xx-syscfg

You are correct we should declare a 0x100 region rather than 0xff.

> 
> Probably just confusion on my part, but thought I would mention it just
> in case.
> Thanks,
> Seth
> 
> PS: Sorry if you are all the wrong people to email about this ADC...

You did well :)

You can also use this script:

./scripts/get_maintainer.pl -f hw/adc/stm32f2xx_adc.c
Alistair Francis <alistair@alistair23.me> (maintainer:STM32F205)
Peter Maydell <peter.maydell@linaro.org> (maintainer:STM32F205)
qemu-devel@nongnu.org (open list:All patches CC here)

But for this particular case, using the SoC file is more complete (you
get the ARM list):

./scripts/get_maintainer.pl -f hw/arm/stm32f205_soc.c
Alistair Francis <alistair@alistair23.me> (maintainer:STM32F205)
Peter Maydell <peter.maydell@linaro.org> (maintainer:STM32F205)
qemu-arm@nongnu.org (open list:ARM)
qemu-devel@nongnu.org (open list:All patches CC here)

Regards,

Phil.
