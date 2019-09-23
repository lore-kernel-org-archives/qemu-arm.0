Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2409808wrp;
        Mon, 23 Sep 2019 01:46:59 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwAx1GpOuAlW1abGxh5S2o9by4qORbuj0KMHkbGNV2oNLh8wyRuI37iDfny2YzKtuvCCYu7
X-Received: by 2002:a05:6402:1251:: with SMTP id l17mr27271995edw.270.1569228419194;
        Mon, 23 Sep 2019 01:46:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569228419; cv=none;
        d=google.com; s=arc-20160816;
        b=OdPbP8dJGrJ/kb0WqXYjdGj4A2YCVxfALxDUF4MA2HgRZ1JNh9EqUmQ+fxfKGOt6L+
         6gUKQdGVuPhOL7ejX6UxS4IwsdXVDc7ae0pRjYNNnIsk6GVQMfuRkavvRDdIjUBBZG5S
         GwVJw2w4Dg98d3To+beBC6ovfbVgdhTU6vCmCe6R/B4qEslfJgzUTkOGWN3ea0iP9a0y
         8iA/6WbLQVAxKw13yhzUblCrJoTgjpY0VCb05aci1rRydWJNsa9bmSnaXuHHl9oO66tw
         JnfRP3eB058pe63Hu1UNW7El+ZoC5+LZKBo7KCRGsECW2mhRkSYJIqURCwTG+PZiwmx9
         NEMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject;
        bh=KhObWh/8JlGH5en6EVck2NIPRe5vC9UzGB13wTpYDCI=;
        b=H/FK83zk1OAU3UySu/3OtSDiHQUMcl/76wUOERi/Z/W3Fod6qDTv/7xKoAG424gWlB
         vaiFokV9NGqjtlMhaD3gjtZYnN3uDSOajChB1qjBbWcuDb9rSrhVN7qh7tb0h/cdqgKh
         HUJWYKPiCNXYxzYKk1fnwdrPDySwPAQSTmEKBFpjbhzhtjYTedPN6G2enYn56t4+7hiV
         MJSPsDKTMmbnxoCRbsK+Wm2zBEf0+KYkp+t7SiCsOERFqeP3c9KJzd0IMOJRtQa4aB7w
         NKtTjfxUs5NNI18s30vXf4l6dY+oFKhnEufn8yrOEbvoLBtD2tO+4JWsM+z6Rkbo6ro/
         MU+w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v13si6330047edy.441.2019.09.23.01.46.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 01:46:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53794 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCJzm-0006Ag-68
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 04:46:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48804)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iCJwE-0003Ti-Vi
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 04:43:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iCJwD-0006i3-Pl
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 04:43:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41560)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iCJwD-0006hp-Iq
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 04:43:17 -0400
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9B83E89AC6
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 08:43:16 +0000 (UTC)
Received: by mail-wm1-f69.google.com with SMTP id g82so6324561wmg.9
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 01:43:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=RZ8TfihFLFp9ogn/VN3z57FhE0lipjbfgVMgo4BXLqI=;
 b=X1K0kmQ59E3mgESMOAp/m/kT1oV61dlaqd+hvpXFujXGOuwsYdgAQnY/KEZAvsG17t
 8cwpn+HOcs5OGAII6bK/4xqJCe8D0hklSdj1nfa+mcMMOoRsdlFg4g9hQGgQC9szNijK
 iBIFD82G5mXDJDHpXHS6qofsiBHs28M7xLANINJeaMjAzPdGWEXDi1Fj6dT4B5P65yuq
 RCLf8MFjm3Z2QivJkVmkSvA2CxnnJbM0WEXpXocfAlLTS7gxM0J7Ij6trJwJiw+vc0zb
 IQQTRXvS1FbhLgq0JmRbc8DGrNb1r5S5RTtMxmwyA/sZ+aMO7lcsvcUee5kKtUH1NuhO
 Ef2A==
X-Gm-Message-State: APjAAAVj0anLszXwY3ryzkhe192dxj5YLRmOQjVV9EhIVHU2JIu0I4Ei
 IF5xOEAPhWpUsqHVb2gc2qDPvn+YRlxfmAoVIAS2lMZ2tbGZ5Q5iZAlSuG2g2uQGKz0pYFU39oI
 rLcurP1hq6lJr
X-Received: by 2002:a05:600c:2412:: with SMTP id
 18mr12278191wmp.128.1569228195106; 
 Mon, 23 Sep 2019 01:43:15 -0700 (PDT)
X-Received: by 2002:a05:600c:2412:: with SMTP id
 18mr12278143wmp.128.1569228194240; 
 Mon, 23 Sep 2019 01:43:14 -0700 (PDT)
Received: from [192.168.1.40] (240.red-88-21-68.staticip.rima-tde.net.
 [88.21.68.240])
 by smtp.gmail.com with ESMTPSA id c18sm8776662wrv.10.2019.09.23.01.43.12
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Sep 2019 01:43:13 -0700 (PDT)
Subject: Re: [PATCH] hw/arm/boot: Use the IEC binary prefix definitions
To: Stefano Garzarella <sgarzare@redhat.com>
References: <20190921103405.19623-1-philmd@redhat.com>
 <20190923082919.y2fjn2y6t7lire3z@steredhat>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <75b5eaec-5e00-6dd0-1a67-b0dafd2d5622@redhat.com>
Date: Mon, 23 Sep 2019 10:43:12 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190923082919.y2fjn2y6t7lire3z@steredhat>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-trivial@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4U2h06DqMz8t

On 9/23/19 10:29 AM, Stefano Garzarella wrote:
> On Sat, Sep 21, 2019 at 12:34:04PM +0200, Philippe Mathieu-Daud=C3=A9 w=
rote:
>> IEC binary prefixes ease code review: the unit is explicit.
>>
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>>  hw/arm/boot.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/hw/arm/boot.c b/hw/arm/boot.c
>> index bf97ef3e33..59bb2fa0d3 100644
>> --- a/hw/arm/boot.c
>> +++ b/hw/arm/boot.c
>=20
> Very appreciated!
>=20
> What about fixing also this other line?
>=20
> @@ -575,7 +575,7 @@ int arm_load_dtb(hwaddr addr, const struct arm_boot=
_info *binfo,
>          goto fail;
>      }
> =20
> -    if (scells < 2 && binfo->ram_size >=3D (1ULL << 32)) {
> +    if (scells < 2 && binfo->ram_size >=3D 4 * GiB) {

Good idea!

>          /* This is user error so deserves a friendlier error message
>           * than the failure of setprop_sized_cells would provide
>=20
>=20
>> @@ -1095,7 +1095,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU =
*cpu,
>>       * we might still make a bad choice here.
>>       */
>>      info->initrd_start =3D info->loader_start +
>> -        MIN(info->ram_size / 2, 128 * 1024 * 1024);
>> +        MIN(info->ram_size / 2, 128 * MiB);
>>      if (image_high_addr) {
>>          info->initrd_start =3D MAX(info->initrd_start, image_high_add=
r);
>>      }
>> @@ -1155,13 +1155,13 @@ static void arm_setup_direct_kernel_boot(ARMCP=
U *cpu,
>>                   *
>>                   * Let's play safe and prealign it to 2MB to give us =
some space.
>>                   */
>> -                align =3D 2 * 1024 * 1024;
>> +                align =3D 2 * MiB;
>>              } else {
>>                  /*
>>                   * Some 32bit kernels will trash anything in the 4K p=
age the
>>                   * initrd ends in, so make sure the DTB isn't caught =
up in that.
>>                   */
>> -                align =3D 4096;
>> +                align =3D 4 * KiB;
>>              }
>> =20
>>              /* Place the DTB after the initrd in memory with alignmen=
t. */
>> @@ -1178,7 +1178,7 @@ static void arm_setup_direct_kernel_boot(ARMCPU =
*cpu,
>>                  info->loader_start + KERNEL_ARGS_ADDR;
>>              fixupcontext[FIXUP_ARGPTR_HI] =3D
>>                  (info->loader_start + KERNEL_ARGS_ADDR) >> 32;
>> -            if (info->ram_size >=3D (1ULL << 32)) {
>> +            if (info->ram_size >=3D 4 * GiB) {
>>                  error_report("RAM size must be less than 4GB to boot"
>>                               " Linux kernel using ATAGS (try passing =
a device tree"
>>                               " using -dtb)");
>=20
> With or without the new line fix:
>=20
> Acked-by: Stefano Garzarella <sgarzare@redhat.com>

Did you mean Reviewed-by?

Regards,

Phil.
