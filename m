Received: by 10.223.159.82 with SMTP id f18csp655761wrg;
        Wed, 22 Nov 2017 13:10:13 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbTxpQEYgal6EW6xt4hsIkbGlmOEtpkylV8fRgMi1oH6jQoiWGzQjtItcsHJf8vCnVzjlqq
X-Received: by 10.37.49.68 with SMTP id x65mr13414528ybx.261.1511385013493;
        Wed, 22 Nov 2017 13:10:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511385013; cv=none;
        d=google.com; s=arc-20160816;
        b=xIatfz1fdRD9jg0/+1IVSm8le5Y74ww5dlU2xTxlHJbId8cQrKbwg4H2bqFgofhUfU
         +bTjzucelFn5ePZm58r+CjBqixES1BRWItjSb0dluI7f3jUCyWMi6lSWkr0jQ22EiteL
         UTLNnsnfP+3iNxx2LbeGJo1MyBs5+QR8Tf5ldIE1Vxs0+ucho8z+5qSfbvsvubRGCG5a
         K6+ffLFdjjZd/Lrt1b6swTc38ttdHftGf0hf/OA9SfINF5BdDVuk97MPHzvjP98+MQPL
         O1GZWOOFpx48eS4O39Axklj/KHumUJ5mvExyCeJQKqkCosvxWTrhCuFYItvpYvnfWYrt
         pgNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=s5pby5E1U2H0c79BRlyWIjIAOvl2QBz0+KLtwbmfna4=;
        b=bVbb/W3Yq5vgHOTgW+QTu7KlEbBAKKm5W2TLq5vnp+orm+oW0q1r8YD0lBiu88pUcZ
         +XDmEkTBLrBYFx1iGvcQKpwbt5hMx2aZDFRFV2LdhNFriYI/19iXVB24PaxBUwW9PSPC
         6nHKErbJhT+ak3Fa45BRzlIr2I0Y3eAAfveVNuKAVd/N4MX+gN8OTlm56/Z5rLcaQ466
         b0Iqx8Ixwijx8exw+Dh2zVW7mQFXmh91PVFHsBI7gVeFSuXUtK6uj/MoziddjFWl4BzF
         8smj9kfwU3DYr/rcNDbiRM+ZqUoQcE0iGIZvXkM/yRaKUj3MHkBXK1dHrYQ7J9hXtVGF
         970w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ok0XJvER;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n123si3878490ywe.179.2017.11.22.13.10.13
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Nov 2017 13:10:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ok0XJvER;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41335 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHcHc-0000VW-OC
	for alex.bennee@linaro.org; Wed, 22 Nov 2017 16:10:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:35870)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eHcGC-0007pr-CC
	for qemu-arm@nongnu.org; Wed, 22 Nov 2017 16:08:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eHcGB-0005xN-Br
	for qemu-arm@nongnu.org; Wed, 22 Nov 2017 16:08:44 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:38516)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eHcGB-0005x6-78; Wed, 22 Nov 2017 16:08:43 -0500
Received: by mail-qt0-x241.google.com with SMTP id q13so14103208qtb.5;
	Wed, 22 Nov 2017 13:08:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=s5pby5E1U2H0c79BRlyWIjIAOvl2QBz0+KLtwbmfna4=;
	b=ok0XJvERoi8E9Xu1w6IZtMbZuZnADPYxpgwwe4NHbm3SAE+XF2q+yUELuywva3LUYG
	ewnQ0GZJZ932U/tfqbQZT/EMwvoouMiXxrTn/Ut/QbpfteTzmjF09zGcS5/guHxxqCAe
	j2Ub3YThuJndr7BtYO5ilW+E8AmnbY+PrN/Jnav3XXkhTc1LjkbH7ZI2T6FLa+sjSKks
	l3xfZa01zWuUh3HaynVS5B0oSFuOy24f1Jz6i/XP1kWXbPKNtwHHI7YsqoyLL/Yk9lGM
	J2K+Kj8f+14qMibYbCAmASuJXsgMIEaEAei+6ybW+EdoWSjpj4rGgJs2fCjV72VCKrj+
	zerA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=s5pby5E1U2H0c79BRlyWIjIAOvl2QBz0+KLtwbmfna4=;
	b=MoieNLxlmAoXFpqjJZZBfMSYIYsk2yPnRz01D0jQSQoS9M6CcTwSYejdzGwq/O30YH
	cahIEyqK5JM3rND1b9832jYTbxqw0xXvSuNOLMSUdVSCt5KT4+RlG7Ud/91Lf/HAoyKv
	8eFZF6PtxEvboiqB/OIbhzn9P47oRLjxOhiDBXpBf905qn/WJ3zK0emKXmur6LLYf99n
	feifixWqxoGL+OgoOamMdDmrKR7pYfdv+eTZhqEmgoFBW07kBXmfLgdDm4aojLYREsYs
	YzcT43sm/L39D/RA+K2Qqdu81YDsGM8BmUADF5EFvVpTSr8ktLLKqbv9saim6Kj3jqoj
	31Vw==
X-Gm-Message-State: AJaThX58zw6wWZELHen238kcpiE5xFhsrZSn5NwMYSv7mSIxvXBCx7nb
	h9iAjzS+PAFINPraDk1iEDV9i3cxzQZl333OFQI=
X-Received: by 10.200.27.43 with SMTP id y40mr35980134qtj.126.1511384922665;
	Wed, 22 Nov 2017 13:08:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.40.243 with HTTP; Wed, 22 Nov 2017 13:08:42 -0800 (PST)
In-Reply-To: <20171122163426.13f3ed3f@redhat.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-30-andrew.smirnov@gmail.com>
	<20171122163426.13f3ed3f@redhat.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 22 Nov 2017 13:08:42 -0800
Message-ID: <CAHQ1cqGQ-_k6n=Dfj9qQSkiDCbzDVbJBRXyKf+MsVj0tYWNrBA@mail.gmail.com>
To: Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v3 29/30] i.MX: Add i.MX7 SOC
 implementation.
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
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"open list:ARM" <qemu-arm@nongnu.org>, Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: dsbwk6lEkHeP

On Wed, Nov 22, 2017 at 7:34 AM, Igor Mammedov <imammedo@redhat.com> wrote:
> On Mon,  6 Nov 2017 07:48:12 -0800
> Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>
>> The following interfaces are partially or fully emulated:
>>
>>     * up to 2 Cortex A9 cores (SMP works with PSCI)
>>     * A7 MPCORE (identical to A15 MPCORE)
>>     * 4 GPTs modules
>>     * 7 GPIO controllers
>>     * 2 IOMUXC controllers
>>     * 1 CCM module
>>     * 1 SVNS module
>>     * 1 SRC module
>>     * 1 GPCv2 controller
>>     * 4 eCSPI controllers
>>     * 4 I2C controllers
>>     * 7 i.MX UART controllers
>>     * 2 FlexCAN controllers
>>     * 2 Ethernet controllers (FEC)
>>     * 3 SD controllers (USDHC)
>>     * 4 WDT modules
>>     * 1 SDMA module
>>     * 1 GPR module
>>     * 2 USBMISC modules
>>     * 2 ADC modules
>>     * 1 PCIe controller
>>
>> Tested to boot and work with upstream Linux (4.13+) guest.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
> ...
>> +
>> +static void fsl_imx7_init(Object *obj)
>> +{
>> +    BusState *sysbus =3D sysbus_get_default();
>> +    FslIMX7State *s =3D FSL_IMX7(obj);
>> +    char name[NAME_SIZE];
>> +    int i;
>> +
>> +    if (smp_cpus > FSL_IMX7_NUM_CPUS) {
>> +        error_report("%s: Only %d CPUs are supported (%d requested)",
>> +                     TYPE_FSL_IMX7, FSL_IMX7_NUM_CPUS, smp_cpus);
>> +        exit(1);
>> +    }
>> +
>> +    for (i =3D 0; i < smp_cpus; i++) {
>> +        object_initialize(&s->cpu[i], sizeof(s->cpu[i]),
>> +                          "cortex-a7-" TYPE_ARM_CPU);
> pls reuse ARM_CPU_TYPE_NAME() macro here

Will do in v4.

Thanks,
Andrey Smirnov
