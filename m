Received: by 10.223.159.82 with SMTP id f18csp614512wrg;
        Wed, 22 Nov 2017 12:22:13 -0800 (PST)
X-Google-Smtp-Source: AGs4zMZOcoojLKXpmA4FCa5xVJoKDK+nyS9pprqnGQ+nRVN+LX+C5OkHhP3RSB5DCxPlvPHEK9QC
X-Received: by 10.37.135.9 with SMTP id a9mr4735763ybl.98.1511382133009;
        Wed, 22 Nov 2017 12:22:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511382133; cv=none;
        d=google.com; s=arc-20160816;
        b=GMbsc83Ae8QJ9ESSy049CAHAdc8fNrpj1r6X04+QNW4XTjflPaGNeAYKsdaZXkVysO
         2+PUyCJ+i3UZHLt0IdDVneZVCfCREekpdLX7OpHW9lpeCwHKPaP7DwjZX3G5QTuaKy6r
         h7i8JEXrsE04qxhhhx/Jfg3JxrGy91AAY/4ST7QPqviPnJv83NdM2U+gUERxJPXbPpLQ
         jacOqSimS2OvtHyS2xSrS3VG2C3IAsRFnCliC+gECjVUpdUEzs6ua//5GkcIqJRL9klU
         LWD0KHE6eGHsx7QOpy0opt+clsb9Hx+jww/9C+dzCJWDBEn+Dc9DEGPDFVpAeUbi+MOz
         UHAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=HPRj4zOfYlp1IO63LHjcSeHxgZ9KJeGnBZm7tcVrUyE=;
        b=K2QvdaE329nfYT7KDpI76pPtdGJ9/6UDi52anTweTSd1bU2A5Gf6mwD38rWwe55OPk
         06FkknEofiCPQ0dvmRUOul+vdb5gJ2cVadBt8rwkKDvlhNOcv+dK+DIfEq+rQvS2sAaM
         2oiqW/XLVfrvrGcpmNyNzLHdW/PsP3GndFHApi8v2BvkdWksEfSTRxZdAU1qoQQ2Jaha
         6KArBC1iKBPm6k8sYHsDJ/ylLMCvzq+cEhMdJzvgRin0D4k+bEwiLNI6HM/SPN1XfKTH
         yej53LJrC4QAw92w6vvhgMYjHAX7YbX2QMIr/T1B2Qx7P3flYILGCp2tMNg+6E2Neujs
         EdIw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=M9shLkWk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p4si3706078ybd.318.2017.11.22.12.22.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 22 Nov 2017 12:22:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=M9shLkWk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:41174 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eHbXA-0000ys-FL
	for alex.bennee@linaro.org; Wed, 22 Nov 2017 15:22:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51990)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eHbX1-0000ya-9b
	for qemu-arm@nongnu.org; Wed, 22 Nov 2017 15:22:04 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1eHbX0-0005Vp-2p
	for qemu-arm@nongnu.org; Wed, 22 Nov 2017 15:22:03 -0500
Received: from mail-qt0-x22c.google.com ([2607:f8b0:400d:c0d::22c]:37806)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1eHbWz-0005Vc-UZ; Wed, 22 Nov 2017 15:22:02 -0500
Received: by mail-qt0-x22c.google.com with SMTP id d15so25390344qte.4;
	Wed, 22 Nov 2017 12:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=HPRj4zOfYlp1IO63LHjcSeHxgZ9KJeGnBZm7tcVrUyE=;
	b=M9shLkWkVb/i6eulGBzzLSozrJbH8U0/1NZHbvmQhwi9vNIHFadPBOWby/WU8KKvw6
	QWJFyOvgJbAdyEo4PY6IcT8ty3/efrg73DkHeVqwMrJ8a1jZmtpZdehTn0dg0RID7ck0
	wRkW+fR+4nYLoomWX2qGyAmaaCbpcX11D4k7geU4qAAy65hnhPSpK82JiO4GyvNuXheb
	//loRirn2to6lnDx8BwzpNt4cloO9CCYJC8qGKHFJ/qpGFYZ82xpcQnQJQn6GGvy2esN
	EdfpHBn9F4BKlUj0mXY55KduRoxV31W/FaUJ4fMftggZX9zwEzOwTCOrUCpPVcmp4V3N
	TQqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=HPRj4zOfYlp1IO63LHjcSeHxgZ9KJeGnBZm7tcVrUyE=;
	b=fBznaPy53WxKNk56AP3zL4R0IGRqeNQ5zcOGcBEknrJ2NPaUKbQzyhHz8Of54BU8nx
	JBedaRC654d8R2PrrgbCI+k+qRH0NnCMK76LmYfx/7M3Bzz5TCS0cpzn+ewY8NmJ01MG
	bksS+2HzyonGq/sK+rvT8uCxW0+e1xxMnGojPXkWLMpOH+HeQidhpN/jzdBqcDQY1hXr
	0HTAesSWJn0eG5XCOsTO826HcPTE6Vd4YxLVptadx/U5S/1GJlulbcLtpI3FTC2ykn1r
	32R+n9P3L7rX5BvJTtJnjYetuU2GTsXPCCRRA4Q/w9cw8m6xuryif5ua9R1hblbwAjNI
	mmRg==
X-Gm-Message-State: AJaThX5NK5z7sD5PZMcTpIGpZIoS46f9I5BrjDJOnpR02JrHBBHUo3hs
	I6Isl83m15hFZrA9RXKnzGqffEViQXADQM5B1IqhSQ==
X-Received: by 10.237.62.5 with SMTP id l5mr34688516qtf.299.1511382121298;
	Wed, 22 Nov 2017 12:22:01 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.40.243 with HTTP; Wed, 22 Nov 2017 12:22:00 -0800 (PST)
In-Reply-To: <CAFEAcA9EhzPxayCGDOiM_6U9YSS6HK1gCgBroR=C1LM=H=FpQw@mail.gmail.com>
References: <20171106154813.19936-1-andrew.smirnov@gmail.com>
	<20171106154813.19936-5-andrew.smirnov@gmail.com>
	<CAFEAcA9EhzPxayCGDOiM_6U9YSS6HK1gCgBroR=C1LM=H=FpQw@mail.gmail.com>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Wed, 22 Nov 2017 12:22:00 -0800
Message-ID: <CAHQ1cqEW202FqhrNpXOvWTT9s-H-ZGrmdAFTeynRc6VnOia6Uw@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::22c
Subject: Re: [Qemu-arm] [PATCH v3 04/30] imx_fec: Use ENET_FTRL to determine
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
Cc: Jason Wang <jasowang@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	Andrey Yurovsky <yurovsky@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: npmJE35LeYbD

On Tue, Nov 21, 2017 at 9:31 AM, Peter Maydell <peter.maydell@linaro.org> w=
rote:
> On 6 November 2017 at 15:47, Andrey Smirnov <andrew.smirnov@gmail.com> wr=
ote:
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
>> index eb034ffd0c..dda0816fb3 100644
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
>> +        size =3D s->regs[ENET_FTRL];
>>          flags |=3D ENET_BD_TR | ENET_BD_LG;
>>      }
>>
>> diff --git a/include/hw/net/imx_fec.h b/include/hw/net/imx_fec.h
>> index 4bc8f03ec2..0fcc4f0c71 100644
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
>
> This means we now have functions with 16K local array
> variables on the stack, which seems like a bad idea.
>

Can't say I see a big difference between having a 2K vs 16K buffer on
the stack, but regardless, I am not quite clear if you are not too hot
about this patch and want me to drop it (I am fine with it) or do you
want me to modify it to have the emulation layer allocate said 16K
buffer on the heap instead of a stack?

Thanks,
Andrey Smirnov
