Received: by 10.223.159.74 with SMTP id f10csp1148665wrg;
        Sat, 16 Dec 2017 16:41:34 -0800 (PST)
X-Google-Smtp-Source: ACJfBosrNjjv2BRMHulToqdy7lpv/87nxl/7z3LFK7xL9cd41TRcbCZ8Bb3k5glv5m+9NbP+I06g
X-Received: by 10.37.111.196 with SMTP id k187mr10350940ybc.172.1513471294368;
        Sat, 16 Dec 2017 16:41:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1513471294; cv=none;
        d=google.com; s=arc-20160816;
        b=qAlxft58XOY/Upl2ra5kozVJjFDcEYhnxTdDy7SnzEnVhfrUcOwsqX6gNpqoJEBpR/
         27dINnuYdeg33gZADGFusPxPmb5OSB3JpE9aHXL7/utQlAg5raTuwqOI0kKj5/hZXgN1
         0Vod2SSoUDXyOQGjEpoMTii0O242csKw4C5KYMfYcDFhA5BadeBb8vPqZTGi5QRF0R0h
         Uyf+6TJ0BlMkPP/e9N+axxBuJJRHrlmKuZZRSsRaZ98CZ5DOobPLxigDTSu1gYd3ief4
         kC+ARxMTJCRMrmd/GwXyb4Cg+3gF9hREI5wCsICFJ5uTz7m2tp9ZqgGtVu0xPzJOBCdR
         DwvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=ImpXxg0qDiRqmvQclAEHf7ygDK/2LMqZcN64WYcZp2c=;
        b=btLM8nnueX28rHOmQZ+WLNs2efHrp2tMw6xsFduTesQJqwQ0iTTgNDjb6DYZUrClcN
         7StpT7TifOXfXLMQW+tBKCUrVKeuooapm6/0qgDTX2gzytYWcj5OvlK7nLzJ0VJD0AYO
         hbogdrMXq3wmAhBeiLFE+IXSWtv5BTZRYOB6ZcSq1SDvVbVc/FAwIdgAaYx743pMS2Ey
         5sCQaHGpbrz6fNzEv2pypuJWv2IGdqI2qImthWJSgoTf4JBsPtbJ1CpktVVwXz/j7yyo
         IVcnGaaQzlgE8d/TMFzynVuI/lTXmLDGx6jva9ZJFMcavAswsnd/zdZ0GuDsq/iqLX/y
         Ev9g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oZayObnY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d185si1852040ybf.142.2017.12.16.16.41.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sat, 16 Dec 2017 16:41:34 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=oZayObnY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52654 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eQN1J-0006Ix-SX
	for alex.bennee@linaro.org; Sat, 16 Dec 2017 19:41:33 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:54282)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eQN1A-0006Im-BN
	for qemu-arm@nongnu.org; Sat, 16 Dec 2017 19:41:25 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eQN19-0003fI-BL
	for qemu-arm@nongnu.org; Sat, 16 Dec 2017 19:41:24 -0500
Received: from mail-qk0-x234.google.com ([2607:f8b0:400d:c09::234]:46506)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eQN19-0003fA-56; Sat, 16 Dec 2017 19:41:23 -0500
Received: by mail-qk0-x234.google.com with SMTP id c85so431198qkh.13;
	Sat, 16 Dec 2017 16:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=ImpXxg0qDiRqmvQclAEHf7ygDK/2LMqZcN64WYcZp2c=;
	b=oZayObnYwYWY4hALOnKfM/DlnROHsVArtixhJmm9EEqfZWo3uN/85EzdTApChEhaHb
	yhUp6vJYtgQb8sjg5EEXRBK2nKW2nFJDP81Kz+WkzO/UrWVQRsWLbCGu1Y4mnUvyQCn2
	fWR4LL+6hV7gwJSR4H14Z/Q5UPKMvqtlOkndzFH+Mo4yHP3FFSIkRLshZbZQizoh1oM2
	fCxZcqRlP+7p3zNvHGAOSaYqidWogYzaGFk+R/nQnrpQTCop+5ya3+7mgzbuB4RUChgx
	831kV+ZWmRh+lnUYM0LDcrebg4C+LRn7ihtKXkhuY9XYQclMGGEIUVNNbMo7anX7H2a2
	VOPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=ImpXxg0qDiRqmvQclAEHf7ygDK/2LMqZcN64WYcZp2c=;
	b=IJaiskYhvme5TY1//w6s8YFcuKKnTJCY75ku7KwxyRKwG7GmpccrRxMuOsyX1ZskoK
	9NUaEXPPGAcFkGtgNaSTbA+vwCZjgS6bO3WnVOWGnW4EPJ6nCvdLLjlnbuPpFbok4BY5
	65kYdukRndDqe6mmsNi1wL6tTl28KQRq1+MOsEEcCHCC1SYwEqulwRCbhbGMgI15BuDp
	nv5fBc7HmWEZRrxG6/NFNVLrQ03uD8WliFQyu81xKSoa7KpdKJ9qc3asPlMRgVUwRSNI
	sVi5DNQEhxOfRB77o8GxISU7lmbfjkeWjdYpoptGhd5JmhmvMz40EhP79XdKRHdvfkK/
	ZjwQ==
X-Gm-Message-State: AKGB3mLt/9xYoiFfH/WatGSWnPYeNyv5qsFOIV3pZLy0NyH2spr+Qsii
	GStN7T5r2+vffeXJGrZHy+9TyOz6JTu9XG0HblM=
X-Received: by 10.55.163.12 with SMTP id m12mr28232467qke.60.1513471282395;
	Sat, 16 Dec 2017 16:41:22 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.40.243 with HTTP; Sat, 16 Dec 2017 16:41:21 -0800 (PST)
In-Reply-To: <9b5f2a4a-2cdf-d3c1-c7b6-0c1ab7e7dabc@amsat.org>
References: <20171214145255.31545-1-andrew.smirnov@gmail.com>
	<20171214145255.31545-6-andrew.smirnov@gmail.com>
	<9b5f2a4a-2cdf-d3c1-c7b6-0c1ab7e7dabc@amsat.org>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Sat, 16 Dec 2017 16:41:21 -0800
Message-ID: <CAHQ1cqEbp-AaYOPii1F52ozvsO75rUOmwJGcUOurAofX0oQKEw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c09::234
Subject: Re: [Qemu-arm] [PATCH v2 05/15] imx_fec: Use ENET_FTRL to determine
 truncation length
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
	"open list:ARM" <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9Ru8DTDaBrQR

On Fri, Dec 15, 2017 at 2:15 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> Hi Andrey,
>
> On 12/14/2017 11:52 AM, Andrey Smirnov wrote:
>> Frame truncation length, TRUNC_FL, is determined by the contents of
>> ENET_FTRL register, so convert the code to use it instead of a
>> hardcoded constant.
>>
>> To avoid the case where TRUNC_FL is greater that ENET_MAX_FRAME_SIZE,
>> increase the value of the latter to its theoretical maximum of 16K.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  hw/net/imx_fec.c         | 4 ++--
>>  include/hw/net/imx_fec.h | 3 ++-
>>  2 files changed, 4 insertions(+), 3 deletions(-)
>>
>> diff --git a/hw/net/imx_fec.c b/hw/net/imx_fec.c
>> index 56cb72273c..50da91bf9e 100644
>> --- a/hw/net/imx_fec.c
>> +++ b/hw/net/imx_fec.c
>> @@ -1052,8 +1052,8 @@ static ssize_t imx_enet_receive(NetClientState *nc=
, const uint8_t *buf,
>>      crc_ptr =3D (uint8_t *) &crc;
>>
>>      /* Huge frames are truncted.  */
>> -    if (size > ENET_MAX_FRAME_SIZE) {
>> -        size =3D ENET_MAX_FRAME_SIZE;
>> +    if (size > s->regs[ENET_FTRL]) {
>
> Shouldn't this be:
>
>        if (size > s->regs[ENET_FTRL] + 1) {
>
>> +        size =3D s->regs[ENET_FTRL];
>
> and:
>
>            size =3D s->regs[ENET_FTRL] + 1;
>

I haven't tried to reproduce this in real HW and verify the behavior,
so I can't say for a fact, but the datasheet seems to be pretty clear
about "ENETx_FTRL":

"Frame Truncation Length
Indicates the value a receive frame is truncated, if it is greater
than this value. Must be greater than or
equal to RCR[MAX_FL].
NOTE: Truncation happens at TRUNC_FL. However, when truncation occurs,
the application (FIFO) may
receive less data, guaranteeing that it never receives more than the set li=
mit."

so, having nothing better to go on than above description, I think the
original code is OK.


>>          flags |=3D ENET_BD_TR | ENET_BD_LG;
>>      }
>>
>> diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
>> index 67993870a2..a390d704a6 100644
>> --- a/include/hw/net/imx_fec.h
>> +++ b/include/hw/net/imx_fec.h
>> @@ -86,7 +86,6 @@
>>  #define ENET_TCCR3             393
>>  #define ENET_MAX               400
>>
>> -#define ENET_MAX_FRAME_SIZE    2032
>>
>>  /* EIR and EIMR */
>>  #define ENET_INT_HB            (1 << 31)
>> @@ -155,6 +154,8 @@
>>  #define ENET_RCR_NLC           (1 << 30)
>>  #define ENET_RCR_GRS           (1 << 31)
>>
>> +#define ENET_MAX_FRAME_SIZE    (1 << ENET_RCR_MAX_FL_LENGTH)
>> +
>>  /* TCR */
>>  #define ENET_TCR_GTS           (1 << 0)
>>  #define ENET_TCR_FDEN          (1 << 2)
>>
