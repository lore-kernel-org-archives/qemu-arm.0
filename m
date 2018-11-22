Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp509736wrt;
        Thu, 22 Nov 2018 02:38:53 -0800 (PST)
X-Google-Smtp-Source: AFSGD/V6Kax6PFJ1zTYSwTdh9Ql3fchPx5WbeEtT1M+9DR4Xa6RtR7lLbqc9kNMQcCWCG043rmQn
X-Received: by 2002:a81:e404:: with SMTP id r4mr7373849ywl.472.1542883133616;
        Thu, 22 Nov 2018 02:38:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1542883133; cv=none;
        d=google.com; s=arc-20160816;
        b=wpy2sNq7H8VB32uY6xZI0L5OKEaZ7p6Mr/89r8a9fjVxNlS21AImOrWJbQ5Hf2iXqD
         BKS90IurTAiK5vvHv4EYifZ7Q3l2HX+RV4+SJuw7ZUbeArDvc+gI+Kq549gx90BwFzhU
         /BsoSaxk6XVZxTEF8UQ9PbkIxSqgRMpGP9tLpnFM6ltV5fW4yOxr5ZARXNZHvXnenalE
         LpJTBvKGgDiaMBgOHN8LPveXvnUvo6HjXOUP934SMksz4SRiNc9VvdPopZLB9TMzQYvr
         Aj0qVIaEmq4mqzx+jUILpnjdQjrvYU5Qp4MuGjiums+sbjb1dm/tjx+t5LkJA+P+z2Qr
         HC0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature;
        bh=jKnOXA1+YQZ6R31AX2RGsJO5BrzAkVLYMDTwdW29dsU=;
        b=yEUJ1eN2dwhR1s+p1kHcOb+r6gLD2kAHnO2R6kfyD11WZAZpbfCpmKQHB+u5RfEXFh
         1eg+jFr+iR9/wHImHjScfP1MlDcaDpNpK/gIZGphA6FZB7y7nZxvpKy2mVf5EwUUKSgs
         +lUFLSRHz3cgREGvLTDPMX71VyPeEy74o7b7wKK3M3tpM0foqy2oP2cWu3dLKIxM86JT
         Fp9/BD4UJvl/+XRM3QxGzFnvFgfs74SoESm8FFL4N75UeLrxP55O85UIaf11U1C9GeFB
         wywPUDuUoCloHgDiqLVQIUglEO28M2NjXvN+1ENCEPKH74sgYT5hdgF+t6T0PEeI4A2V
         MbMQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MyNRTsOK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id w16si15449523ywd.77.2018.11.22.02.38.53
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 22 Nov 2018 02:38:53 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MyNRTsOK;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:45071 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gPmNp-0005Ae-2b
	for alex.bennee@linaro.org; Thu, 22 Nov 2018 05:38:53 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43098)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gPmNa-00058u-Py
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 05:38:39 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gPmNY-0005bw-Cg
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 05:38:38 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:41984)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gPmNY-0005ay-6J
	for qemu-arm@nongnu.org; Thu, 22 Nov 2018 05:38:36 -0500
Received: by mail-oi1-x243.google.com with SMTP id w13so7082825oiw.9
	for <qemu-arm@nongnu.org>; Thu, 22 Nov 2018 02:38:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=jKnOXA1+YQZ6R31AX2RGsJO5BrzAkVLYMDTwdW29dsU=;
	b=MyNRTsOKvtoNQIUHOIysz5z9Zorw1g3W0A8iX1AVxVYcbCJNObNQqQRFalGTkJ4M0s
	1VE1WZIAft6WoiN2eJN7DYYD+r+BIsNFuo508GiOkm1BssvMGfEyN0krBuLnvEBFAmZj
	A30lEP01ceCDEzri08nAx3EcSUXVjv4JHPj3I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=jKnOXA1+YQZ6R31AX2RGsJO5BrzAkVLYMDTwdW29dsU=;
	b=QCddFe2v08wP02j5JsgSCvTYm3UKS+q18O96j6UAR+BSwLoEl5uVycXzIU0q1Aopcw
	NuoPWUB96k5B7AzCrM8K56goyyH1RZYxyB/uLgnAzvWtT28V2MtB/YNkc3MI+ArjKf+Y
	Dy37vxGYKmCei2fJJHiIVirUvu0OUhwk9oxeeQjuBzymOTsQ+3CnUrin41SuEEFTGhY5
	z9DS/faSHyrZ0DQuQoGk4fJbQsg/A1kjvR5xUtcfkeoVAg4sMD+RZMIApaxpShffx9e8
	NDiOyFsw8kbd3EZ+EzvR10SvbbC24gx1PvEggwGbEzAsQKm71hoXoISU3y99eR6TfdYX
	ttSw==
X-Gm-Message-State: AA+aEWZfrpQjj4liY43a9peSSB00491KNJbkTX736cIlHtoVDHYxb/Ir
	f3PPgVU4FFZMfWiUDKd0L6ZuSJPn9/fy61DMWBtq4ZN7nGM=
X-Received: by 2002:aca:1e17:: with SMTP id m23mr185724oic.332.1542883115216; 
	Thu, 22 Nov 2018 02:38:35 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a9d:4b0e:0:0:0:0:0 with HTTP; Thu, 22 Nov 2018 02:38:14
	-0800 (PST)
In-Reply-To: <e61b7517-a736-8cb5-ce35-815225f18c52@redhat.com>
References: <1542880825-2604-1-git-send-email-liq3ea@gmail.com>
	<e61b7517-a736-8cb5-ce35-815225f18c52@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 22 Nov 2018 10:38:14 +0000
Message-ID: <CAFEAcA8XgZRXyHkjWnOZ4d_yrqzWdxCDJjo6DtR+PTzx4t1cxg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH] hw: arm: musicpal: drop TYPE_WM8750 in
 object_property_set_link()
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
Cc: Mao Zhongyi <maozhongyi@cmss.chinamobile.com>, Li Qiang <liq3ea@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Markus Armbruster <armbru@redhat.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wrETb1eSrUYG

On 22 November 2018 at 10:35, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
> Hi Li,
>
> On 22/11/18 11:00, Li Qiang wrote:
>> The third argument of object_property_set_link() is the name of
>> property, not related with the QOM type name, using the constant
>> string instead.
>
> You are correct.
>
>>
>> Signed-off-by: Li Qiang <liq3ea@gmail.com>
>> ---
>>  hw/arm/musicpal.c | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/hw/arm/musicpal.c b/hw/arm/musicpal.c
>> index 9648b3af44..726ae29394 100644
>> --- a/hw/arm/musicpal.c
>> +++ b/hw/arm/musicpal.c
>> @@ -1696,7 +1696,7 @@ static void musicpal_init(MachineState *machine)
>>      dev =3D qdev_create(NULL, TYPE_MV88W8618_AUDIO);
>>      s =3D SYS_BUS_DEVICE(dev);
>>      object_property_set_link(OBJECT(dev), OBJECT(wm8750_dev),
>> -                             TYPE_WM8750, NULL);
>> +                             "wm8750", NULL);
>
> Since this property is not related to migration, maybe we can resolve
> this the other way, using TYPE_WM8750 in mv88w8618_audio_init():
>
> -- >8 --
> @@ -255,3 +255,3 @@ static void mv88w8618_audio_init(Object *obj)
>
> -    object_property_add_link(OBJECT(dev), "wm8750", TYPE_WM8750,
> +    object_property_add_link(OBJECT(dev), TYPE_WM8750, TYPE_WM8750,
>                               (Object **) &s->wm,
> ---
>
> So using the same definition would protect someone to accidentaly rename
> the property name.

I think I prefer Li's patch -- the property name is just
an arbitrary name not related to the type name necessarily.

thanks
-- PMM
