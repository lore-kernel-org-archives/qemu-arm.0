Received: by 10.223.188.70 with SMTP id a6csp224962wrh;
        Thu, 31 Aug 2017 16:02:47 -0700 (PDT)
X-Received: by 10.237.34.220 with SMTP id q28mr45672qtc.241.1504220567470;
        Thu, 31 Aug 2017 16:02:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1504220567; cv=none;
        d=google.com; s=arc-20160816;
        b=bPYqmAIgGupniLjfWm1DmW+3tOM93WIA+5nU3NP0r7OI999dHKtmjfefLzMcfmO8DM
         p/47RvU8mI3IhgXHy8BMzXOK+AxSFFlx10aIv9ClJ7X/xforg7AHzUiQdnIS95+NmxQE
         PpK1WubrhwxgI2r6bHN5knL0SummqZCX1G8N1w0AM4Bd3NUiNAUL8Jlj+LItJElOnsMQ
         zeZD+wCrkcBESlRnilHatTE9vsQOm7aJuyQHDOacPjj7EUH8FaYu43qqeDMrFSJvcDgR
         QFZul+FKu0Kh48j8E05+IrfzKRRm/rLr8KOxzrfaJJIvFvidqNpr/BKrAg7oa+NeDM8r
         b9Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=zI0Lb9aMIMGCk0z5/DK5DbjlRhh2v/fea/e9g6xI8uA=;
        b=N8bmPoRTmhczE5Rjo8dbbWQoPyfglY71PY1J5oGI6f1dts+xHdWhLXkvvjYtkWbGlk
         tWAOaxjXeRgJ1r5LFZ1YQlO76S3ITmv8edxSnMqX3EhXgpCtyS9nC0YyW/BGppPtggHV
         Naz63T0EKKWgXqiA9QNoX5qXqJcMGXzzmOLKxrwcEgHQ6JnxhLMBf+X1wKQix344a6n+
         P1jgviIaRAuX8a3ZntaQiAhDRK1ERIZcKMySofrg//5NB/sflKpxh/HmbFXHoczWad1a
         DJZDTrT6ymPAk4V/lK68IyfugJPT+euxnjWpAE1F1K9A31xS6NNEC2TiT5ZFkyYPWvbK
         ZN+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=M+CG/ggM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e6si7169497qkf.219.2017.08.31.16.02.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 31 Aug 2017 16:02:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=M+CG/ggM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59833 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1dnYU1-0001J6-CW
	for alex.bennee@linaro.org; Thu, 31 Aug 2017 19:02:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40505)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dnYTt-0001HO-IA
	for qemu-arm@nongnu.org; Thu, 31 Aug 2017 19:02:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1dnYTs-0006i5-TV
	for qemu-arm@nongnu.org; Thu, 31 Aug 2017 19:02:37 -0400
Received: from mail-wr0-x243.google.com ([2a00:1450:400c:c0c::243]:33324)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1dnYTr-0006fC-1K; Thu, 31 Aug 2017 19:02:35 -0400
Received: by mail-wr0-x243.google.com with SMTP id k94so496782wrc.0;
	Thu, 31 Aug 2017 16:02:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=zI0Lb9aMIMGCk0z5/DK5DbjlRhh2v/fea/e9g6xI8uA=;
	b=M+CG/ggMryiBKm2QO5NrxCwQtNAwRuPyv8PRTLF+LMMZrklfH3xCiKGhJ+pX7xZPbc
	pFDRUmBr7DbzGZrEQ0H6iXKGqwEpRMpg9SwiGAyQLpBhyfb/3IQ3QtA2OiYIckghl2yZ
	RT45TK3oRVjcwJtAMa0wTKZoN43nbwVGNs7MFnaElIae0KSPfDidPnu2IJ13I7N3T0qG
	VpVPMhB/DIjXIlb3R24KI2uMv+epvOc/lyJYNMKTwA6/EnwuypeSuPkJEr7lUt+DvJSY
	DcviL3lNEpswCNBkxtCgOtRpExgjBzBLvt4ejHN5MHe/LpMc/GNryO/YsHOmrhNRqkET
	H7ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=zI0Lb9aMIMGCk0z5/DK5DbjlRhh2v/fea/e9g6xI8uA=;
	b=a1OegRNusCZvaDBk8EVaoYwEpt6uTIzEfxgGAIdRPjHx6us4sj5ZmFaJUaAIn4hklV
	d47YoX93exy3OarrhTdRdlskmenieeIz8mrHKxD240LuAad+XtO/130ExlG9gDcR1LNL
	OFXF14sua14kJterhpEwP0JOBwcgdxbK9Nqu4WjWcV23AwhBakie1iwnK0d9C7ZCjuAp
	NRHjdoWD+aTZupNpbHJv0BRpstRX4BXxPKm+LUPB68sIOHLDG141/i17MmpSoNVO2+9l
	9wJ2JhR2cC/PQ3nN6wZhHPPKl8jQZZfupsfPzB0tkP/z823sI8L0RoyL6CZaCVKi3T91
	GDWw==
X-Gm-Message-State: AHPjjUhySWI2Xhe5Vfw1UNYXw+sZdU534iDd4TPyIIBFm7p6p1e6bmLB
	a4xMd5Lq6LynIj67g0ay4l/ydq9fwg==
X-Google-Smtp-Source: ADKCNb5R1KFOWSXS+RKTAwFWo3FyjMvUAeVyW46DG5JuKIAedf5UGIVN+qh9f4Ls+gDVwD8+p5OkuRxelM+zVLH9jJA=
X-Received: by 10.223.146.195 with SMTP id 61mr15316wrn.318.1504220553968;
	Thu, 31 Aug 2017 16:02:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.191.130 with HTTP; Thu, 31 Aug 2017 16:02:03 -0700 (PDT)
In-Reply-To: <40ca8d07-75e5-e0b3-021e-5abaffd16b78@amsat.org>
References: <1503938283-12404-1-git-send-email-sundeep.lkml@gmail.com>
	<1503938283-12404-5-git-send-email-sundeep.lkml@gmail.com>
	<10da5552-c90a-21e6-43ac-829932f64930@amsat.org>
	<CAFEAcA9W=YqbeYKuAxvfNyjfCWGyAXuPdxwFrpLmoezLJ4pm-A@mail.gmail.com>
	<40ca8d07-75e5-e0b3-021e-5abaffd16b78@amsat.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Thu, 31 Aug 2017 16:02:03 -0700
Message-ID: <CAKmqyKOyw3w4gqyUmW8qWVz_TtEmbx61J5GEm3NwA75Rhy8kQg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::243
Subject: Re: [Qemu-arm] [Qemu devel v7 PATCH 4/5] msf2: Add Smartfusion2 SoC
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oxuq/JVxFLMJ

On Wed, Aug 30, 2017 at 7:47 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> On 08/30/2017 09:26 AM, Peter Maydell wrote:
>>
>> On 30 August 2017 at 03:45, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org=
>
>> wrote:
>>>
>>> I think they might be issues if you start QEMU without -serial and then
>>> use
>>> a firmware polling for an uart, the device won't be mapped and the memo=
ry
>>> accesses are mostly ignored.
>>>
>>> I'd rather use:
>>>
>>>      for (i =3D 0; i < MSF2_NUM_UARTS && i < MAX_SERIAL_PORTS; i++) {
>>>          static const char *serial[] =3D {"serial0", "serial1"};
>>>
>>>          if (!serial_hds[i]) {
>>>              serial_hds[i] =3D qemu_chr_new(serial[i], "null");
>>>
>>>          }
>>>
>>>> +            serial_mm_init(get_system_memory(), uart_addr[i], 2,
>>>> +                           qdev_get_gpio_in(armv7m, uart_irq[i]),
>>>> +                           115200, serial_hds[i],
>>>> DEVICE_NATIVE_ENDIAN);
>>>> +        }
>>>> +    }
>>
>>
>> It would be better to fix serial_mm_init() to handle having
>> a NULL chardev pointer, because we already have a lot of
>> SoC code that just passes it serial_hds[] regardless.
>
>
> clever :)
>
>> I'd leave this code as it is and we can fix serial_mm_init
>> separately (somebody pointed out this issue for a xilinx
>> board recently).

Ah, I'll look into this then.

Thanks,
Alistair

>
>
> Sure.
