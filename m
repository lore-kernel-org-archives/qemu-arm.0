Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2181485lfe;
        Sat, 21 Mar 2020 07:12:26 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsfcjh8RrHfueGdvM5Vc66O9ghJaeV7Da6Wfezx/uKoUuU1R2p8bXx7jl2rfEZHBXRjxFjA
X-Received: by 2002:a0c:fb45:: with SMTP id b5mr13483136qvq.181.1584799946316;
        Sat, 21 Mar 2020 07:12:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584799946; cv=none;
        d=google.com; s=arc-20160816;
        b=MUmMjvphVMlbO1zDL9F0vekrUCzbJrf6n4zaajZGk8ZlxyelJ8E9zoxWVeCqqxEWNq
         hq3BzkUuyvOkzjxbCdEK0FwSlojTZdIe1OuOSDXmD/smvAdw7E2NBgrJosh1xqrVKHIW
         tnWC1tvMmIiE/AJRa9xWi3sNO3GFgN4oQzbWxyDGHcrk6Fvl1Lr6/yfD5j4ymyYAfEba
         zVOWgk/uwYs6fqWxvlTji8PDXZV39PuZ9kBkzWxxhkfJQXYJGMjS2itxWEk4uxKsGKFs
         cNRse8FHev8Uxnbc/cCBA4PMXfy8vyI9dgXRmgwyyA9bPj4skuU8xNtLL0Tnddx2RMWG
         qFbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=vdctJkNr5flfamIlFadkGaxBCJU9nr8W/MsX0dp2l2I=;
        b=JsDWbH4cvUwCifRPyzCcSrgBiz9/hj8FFXJ0DfUFHiVkQrddWijlKPS0+FJmXRBx+p
         yEHC6J3Fe0vjz0J4JcCm31ORcv5kL4NUZVEm7Aq6KyRMye7NN8/AYGl3BJFNgY2tGOAv
         dj7zkLb4mSuCb1stUFCqmOac9rTtUmv09AXaE2JYljVYlJvL0BFB9WVAje/gd6yzleqw
         51CujMvQVmOIsEIEBZzf7dJNkKGhNEbiWdh97BrS1yNmc+OnA0hATRpf7+RpdDv7M1wT
         u0tr2Xd2/EtyKmysOl1QRJwxJMUce3KXe27F4iVp8G17HxrTO/AigOWZiIGSUiChLEl3
         etgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AQYd09d+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e62si5592907qkf.127.2020.03.21.07.12.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 07:12:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=AQYd09d+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37016 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFerR-0000z8-PC
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 10:12:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54668)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFerC-0000yf-SP
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:12:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFerB-0005K0-AI
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:12:10 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:50745)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFerB-0005J1-5t
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:12:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584799927;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vdctJkNr5flfamIlFadkGaxBCJU9nr8W/MsX0dp2l2I=;
 b=AQYd09d+SlEur792/nXQOFU1UqEqmJxtpN1kckTBulq2PscUQOfRR4Acog+ldFmF4JQnBC
 +3fqym3yUvGjdLPLtNjmE4f46iTY4vEbaX9MzROp//m1nSyOzXmUK3DHxPF0AzAkm9PrO7
 /qCUU73OxY4Hve04Mg5nEz5p4I+xi00=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-486-7bBerDZdNLaJblqyTq3z1A-1; Sat, 21 Mar 2020 10:12:05 -0400
X-MC-Unique: 7bBerDZdNLaJblqyTq3z1A-1
Received: by mail-ed1-f70.google.com with SMTP id y10so7501302edw.23
 for <qemu-arm@nongnu.org>; Sat, 21 Mar 2020 07:12:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=5YTr7B8Vhgph7+l62ANtSEn/6x+hhNiv2LZGdPA8a70=;
 b=oiWwi7tEAN2qmZ25E9d9ImocF3tAs4aCxpaABKcLp2od0nvkYIvsrKgcz3F6kgwy5p
 3RsS+5E+0ckAyz9naZK6H+0jRNyOokHPpjIPNVWKjwgmek5kuTXYcNURfWTkISFt9JNi
 PzuXHgwmMnmVEWNF8Wp0tnUqs+h18FxUXQIf67sPCZVNZDmkkHx2fVvZMsmZQ4HZc7iH
 XwilNpWJQ4NKGEnyFXQ+8c2VbYq7HR88rJqgIoFq9gE6IzvyLWVTleFTxOePoSYkv9b4
 2jjGV1+FFDXoDo+0Tshe/O7wbwUksSrOzTg059/NZH4M9p9XDomkHwCUzovJQj4v/yam
 M2mg==
X-Gm-Message-State: ANhLgQ0JoZw8LlD4lNcI17abSYNwbg/bhyr0sFIPbFYpTJ1av0bl368o
 1D9moxVFOnYr+UEu1lN+gszQipfyMDvA0fVlJiBpZiHC8yyptFowjDZzEJIih70uGE6zZZPYf20
 dP9mfWqQut005
X-Received: by 2002:a17:906:c835:: with SMTP id
 dd21mr12788912ejb.140.1584799924212; 
 Sat, 21 Mar 2020 07:12:04 -0700 (PDT)
X-Received: by 2002:a17:906:c835:: with SMTP id
 dd21mr12788886ejb.140.1584799923899; 
 Sat, 21 Mar 2020 07:12:03 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id oz27sm579169ejb.13.2020.03.21.07.12.00
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Mar 2020 07:12:02 -0700 (PDT)
Subject: Re: [PATCH-for-5.0 07/11] hw/gpio/aspeed_gpio: Remove dead assignment
To: BALATON Zoltan <balaton@eik.bme.hu>
References: <20200321114615.5360-1-philmd@redhat.com>
 <20200321114615.5360-8-philmd@redhat.com>
 <alpine.BSF.2.22.395.2003211420450.82121@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <41f0d6a5-8699-e272-4832-fc1fce2e019e@redhat.com>
Date: Sat, 21 Mar 2020 15:12:00 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.BSF.2.22.395.2003211420450.82121@zero.eik.bme.hu>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 63.128.21.74
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
Cc: Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 "Michael S. Tsirkin" <mst@redhat.com>, Michael Tokarev <mjt@tls.msk.ru>,
 qemu-devel@nongnu.org, qemu-block@nongnu.org, qemu-trivial@nongnu.org,
 Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>, John Snow <jsnow@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>, Kevin Wolf <kwolf@redhat.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, Max Reitz <mreitz@redhat.com>,
 Andrew Jeffery <andrew@aj.id.au>, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: oNYAO6m9ly+/

On 3/21/20 2:22 PM, BALATON Zoltan wrote:
> On Sat, 21 Mar 2020, Philippe Mathieu-Daud=C3=A9 wrote:
>> Fix warning reported by Clang static code analyzer:
>>
>> =C2=A0hw/gpio/aspeed_gpio.c:717:18: warning: Value stored to 'g_idx' dur=
ing=20
>> its initialization is never read
>> =C2=A0=C2=A0=C2=A0=C2=A0 int set_idx, g_idx =3D *group_idx;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^~~~~=C2=A0=C2=A0 ~~~~~~~~~~
>>
>> Reported-by: Clang Static Analyzer
>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>> ---
>> hw/gpio/aspeed_gpio.c | 4 ++--
>> 1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
>> index 41e11ea9b0..cc07ab9866 100644
>> --- a/hw/gpio/aspeed_gpio.c
>> +++ b/hw/gpio/aspeed_gpio.c
>> @@ -714,11 +714,11 @@ static void aspeed_gpio_write(void *opaque,=20
>> hwaddr offset, uint64_t data,
>> static int get_set_idx(AspeedGPIOState *s, const char *group, int=20
>> *group_idx)
>> {
>> =C2=A0=C2=A0=C2=A0 AspeedGPIOClass *agc =3D ASPEED_GPIO_GET_CLASS(s);
>> -=C2=A0=C2=A0=C2=A0 int set_idx, g_idx =3D *group_idx;
>> +=C2=A0=C2=A0=C2=A0 int set_idx;
>>
>> =C2=A0=C2=A0=C2=A0 for (set_idx =3D 0; set_idx < agc->nr_gpio_sets; set_=
idx++) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const GPIOSetProperties *set_=
props =3D &agc->props[set_idx];
>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (g_idx =3D 0; g_idx < AS=
PEED_GROUPS_PER_SET; g_idx++) {
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for (int g_idx =3D 0; g_idx =
< ASPEED_GROUPS_PER_SET; g_idx++) {
>=20
> Is declaring variables here allowed by coding style? Shouldn't you only=
=20
> remove init value from above?

You are right, it is not (yet?) allowed by QEMU coding style.

>=20
> Regards,
> BALATON Zoltan
>=20
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if (!=
strncmp(group, set_props->group_label[g_idx],=20
>> strlen(group))) {
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 *group_idx =3D g_idx;
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 return set_idx;
>>

