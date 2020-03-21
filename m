Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp2185595lfe;
        Sat, 21 Mar 2020 07:16:57 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvfaM1PmblS6FxZylUt1QLhuFTtxrIb+xtMd79agOA0XqF+mOtkaievV5AbvxWr5hiQrtpO
X-Received: by 2002:ac8:3805:: with SMTP id q5mr8366597qtb.46.1584800217597;
        Sat, 21 Mar 2020 07:16:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584800217; cv=none;
        d=google.com; s=arc-20160816;
        b=Cc8s0smXuhBmfd3AHo1F1fehLuXBJ86vpy5oI9IVkLJG9JPaFmAs6Hk0/KP1K1+wE1
         A111LP4BTlV1+6qSW4CC8qp8BqPtqwXUiu5p69Yy/8GShhu4xtrN2JSGfK5isriIptRY
         SUM///70v2f+a5nAE/f+qto+GiXu7N8t770PSixsl5Eyt/9UPBzStIaSIq/4flJ+TqOn
         dzqvBAEDsoJ8jRMZ4KSKWwKe0PMHeEvp0ijvjTgdAdRqT/NmdKyntTUvPqnyaFf/4SRv
         E3rMtDJYI3F8tdIim99KbNsmwvhbtfcL/c+EwFxLsjuY3DiljF5gfu57QlDLOe0hUBk6
         aLwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=njLK0rH8vHGOJ+Mc5dURjJtNNPmhW6cJ2g/UU+Cj9/A=;
        b=HGitX/ERFJLk2FEjAkN1DJqJcAbSeAwQsMM+qXyqgnJTTGByD9kAVQzv2bjGSU3pWa
         J8PeuWX5R6pdZG2EXRhXbx5eJYy8ykOvL9KMSdYFa3VZDKZpI6WublKaUhQCEAD0VfR3
         Sfrbt9RP7EvUZ1RD/WtJ22CaHsKk8gWqjrguGWpSA0N6tnPeOHWTRssuQptmwpkg7n6A
         jyaP15xBHJrbhFsHcLu6nqI6cOIpDuiKCER0POGxio1oBbvtl9UBWSt/S59sWTCwWQ04
         MGMFH52aJs7/1TTKAvhK37FT6A/SepHdZkSd4pzLOZi5pxUQzDjxDZxbGl6jz24GyPXP
         zBqA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=C7YW9uqJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a53si5670313qtc.271.2020.03.21.07.16.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 21 Mar 2020 07:16:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=C7YW9uqJ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37130 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jFevo-0006WP-Vo
	for alex.bennee@linaro.org; Sat, 21 Mar 2020 10:16:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55694)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jFevG-0005mO-Tv
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:16:23 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jFevF-0001qM-M8
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:16:22 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:44609)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jFevF-0001q3-IK
 for qemu-arm@nongnu.org; Sat, 21 Mar 2020 10:16:21 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584800181;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=njLK0rH8vHGOJ+Mc5dURjJtNNPmhW6cJ2g/UU+Cj9/A=;
 b=C7YW9uqJWhwPDHpN2U5ECYrENBVNdudRInTWBP3XoRWfHqgZ5YSegigvSuc42rX8B/YxXE
 DpZx9stj5LE42ifUtoN8NGFGW/Qaq5IOvSFuuxa2UN5Nu24Lj8p+lBb6AnKDqhQeedfviK
 SJ839bqFIlXGuZn1D7xvXf28F1naLJE=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-226-P4E81HKPPsOvmD0Pbu4kBA-1; Sat, 21 Mar 2020 10:16:19 -0400
X-MC-Unique: P4E81HKPPsOvmD0Pbu4kBA-1
Received: by mail-ed1-f69.google.com with SMTP id b9so6512167edj.10
 for <qemu-arm@nongnu.org>; Sat, 21 Mar 2020 07:16:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B2w5aB3KtXWGYrfsxcpbGSy7pJ3V05lyzlzVysm9X/g=;
 b=fSVm9AJMIiSu3yI7nGEChqIsdl4TWCtFolLFSjxs1CaB+sXVpITwB1cfkJ4RnqXxMF
 Xmk10jM1Dd8O9YMxEyKKWlh8Iz2BsRKfUDQthWmAo3sgOAO+qU8Q8vTZ6P7u/6U/Z7Op
 I+e+GVCafPgWxwKT+WnVqdr6r2NvXqVGjFBQ/E+dQ1TNZnwsEPjZnc1m/jgXxYIqFGJS
 k8A/55/CfJicisDBq5G3OxSgf8p1KE6xxu/OxHN8XoN3s9gM/3l1U9tPtzr09kIfVd3b
 FHdnqzpl1lC94Ua/qQw4Q+BIsK6emjPkng9ioVT8JGd0yyezrFb13FzGgjFKnAV9vxqi
 4CrQ==
X-Gm-Message-State: ANhLgQ2/2EzzGa04qJNMj6AsdsY86i2BOQs/+zYEWFQxDAQfKLt6Et8l
 MKl41JLiLxWlBf0KAX4UTZfWKM7eUnpRcq9jhASC6mxD25zTVu6FcWXrEIzUo8NlMXqXkCBixli
 GMOw7yzSIh5fT
X-Received: by 2002:a17:906:3410:: with SMTP id
 c16mr6339287ejb.304.1584800177725; 
 Sat, 21 Mar 2020 07:16:17 -0700 (PDT)
X-Received: by 2002:a17:906:3410:: with SMTP id
 c16mr6339251ejb.304.1584800177404; 
 Sat, 21 Mar 2020 07:16:17 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id l19sm575026ejn.31.2020.03.21.07.16.15
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 21 Mar 2020 07:16:16 -0700 (PDT)
Subject: Re: [PATCH-for-5.0 05/11] hw/ide/sii3112: Remove dead assignment
To: BALATON Zoltan <balaton@eik.bme.hu>,
 Aleksandar Markovic <aleksandar.m.mail@gmail.com>
References: <20200321114615.5360-1-philmd@redhat.com>
 <20200321114615.5360-6-philmd@redhat.com>
 <CAL1e-=hQPwJ3XKrt4ip2S92ScjyjS63-A4REDeXzyiCt1Phx6A@mail.gmail.com>
 <alpine.BSF.2.22.395.2003211511170.82121@zero.eik.bme.hu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <11fc4c44-fb8c-9698-e59f-5592b7d8efea@redhat.com>
Date: Sat, 21 Mar 2020 15:16:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <alpine.BSF.2.22.395.2003211511170.82121@zero.eik.bme.hu>
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
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Andrew Jeffery <andrew@aj.id.au>, Alistair Francis <alistair@alistair23.me>,
 Michael Tokarev <mjt@tls.msk.ru>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Markus Armbruster <armbru@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Paolo Bonzini <pbonzini@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 John Snow <jsnow@redhat.com>, Max Reitz <mreitz@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goate?= =?UTF-8?Q?r?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FI9hmNP4Fs/3

On 3/21/20 3:12 PM, BALATON Zoltan wrote:
> On Sat, 21 Mar 2020, Aleksandar Markovic wrote:
>> On Saturday, March 21, 2020, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.=
com>
>> wrote:
>>
>>> Fix warning reported by Clang static code analyzer:
>>>
>>> =C2=A0=C2=A0=C2=A0 CC=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 hw/ide/sii3112.o
>>> =C2=A0 hw/ide/sii3112.c:204:9: warning: Value stored to 'val' is never =
read
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D 0;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ^=C2=A0=C2=A0=C2=
=A0=C2=A0 ~
>>>
>>> Reported-by: Clang Static Analyzer
>>> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
>>> ---
>>> =C2=A0hw/ide/sii3112.c | 2 +-
>>> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/hw/ide/sii3112.c b/hw/ide/sii3112.c
>>> index 06605d7af2..36f1905ddb 100644
>>> --- a/hw/ide/sii3112.c
>>> +++ b/hw/ide/sii3112.c
>>> @@ -125,7 +125,7 @@ static uint64_t sii3112_reg_read(void *opaque,=20
>>> hwaddr
>>> addr,
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D (uint32_t)d->r=
egs[1].sien << 16;
>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>> =C2=A0=C2=A0=C2=A0=C2=A0 default:
>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 val =3D 0;
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 break;
>>
>>
>> There is another function in the same file, having a similar switch
>> statement. There is no warning for that second tunction, since "val"=20
>> is its
>> parameter, not a local varioble, like is the case here. This means=20
>> that the
>> proposed change introduces inconsistency between two functions, therefor=
e
>> it is better to remove the initialization of "val" to 0, than to remove
>> this line in "default" section.
>=20
> Oh, actually I think the warning was for that statement not for the one=
=20
> patched as it makes more sense there where val is assigned in void=20
> sii3112_reg_write() where it's indeed not used so maybe that was meant=20
> to be patched instead?

Ah, the warning is for hw/ide/sii3112.c:204 but I incorrectly patched=20
hw/ide/sii3112.c:128 =3D)

>=20
> Regards,
> BALATON Zoltan

