Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp2352355wrm;
        Thu, 10 Oct 2019 06:08:23 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxjTm/lS/HFcv/2xETw0JsmcJC/jMrmroFM0lxxzojiI/nJ4P9C43kUmyvrsndp3xYwQlZa
X-Received: by 2002:a37:60d:: with SMTP id 13mr9003542qkg.447.1570712902907;
        Thu, 10 Oct 2019 06:08:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570712902; cv=none;
        d=google.com; s=arc-20160816;
        b=wDPnQGOXgH1BUtOXAY57Tiv/yx4PaX75z/HdzYvJta0ODScw4JUXUus1ufYNDCtvhq
         LdE5t6VeNo9iFQnwQTeqbMyT2XKFKZKXqQt80B86VEUY5k3mYOQdgu9r/lg3/vWRNiIV
         pe0MbAbq45TBdwrOQ9UUnxBUOKyX18wecN1XtPRlDqdaP55fyQo0zY/HSFli0ioyNmwv
         L4AfXfrcIZDO4zjtQeHemBmSzJW8TeLgL5Z9SzEgaUavAYBspEgryQfpC9Gybhlv4zI2
         VIwbi7M/rNVRUkVvVXwg/q4dmS6gpzzDP2WHMejOqdY844KjgRjgUxmGxDSbVvQ8GdBr
         iNug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=GsTLqYjVtiQSGIx/bzxlrsYWa81XLAimS31cLgZBqHs=;
        b=fqtNlcqeFTzvSnp13o3WUW3YdISGqOR5WfzrCOkrBsT0okXt58iVwwEcZYkhZ4ZK/2
         iFnh7WcZyKPxhRj/XN34TC4WHjWu33NAyIAIk91eZxx4R9Vw3Tc11mStbE8lCm3RB3cD
         LAZCKhY4ppx0aAfa93Hvs3F/cKWhiMbAG2D8/amcLIUWX0Zx6SdzlVM+TH/HDWMYxS8+
         OBKLMp0R9/nlTyQ70AqzfN080RBY+O8zesQYsrgXSNTXZipL0OSOXhzi345DiKGx/bZ2
         pPmKjWfA7oh3HBvBb67Imb133Dq9X2uGZrm7hKUZpCqTaL4/IpsBWfu5p8Egb1Vpc5t0
         KlZw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 20si5970666qkv.137.2019.10.10.06.08.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 10 Oct 2019 06:08:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:38948 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIYB4-0001M3-A4
	for alex.bennee@linaro.org; Thu, 10 Oct 2019 09:08:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38406)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iIYAt-0001Hc-BA
 for qemu-arm@nongnu.org; Thu, 10 Oct 2019 09:08:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iIYAr-0006YB-OZ
 for qemu-arm@nongnu.org; Thu, 10 Oct 2019 09:08:11 -0400
Received: from mx1.redhat.com ([209.132.183.28]:40558)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iIYAr-0006XT-Gs
 for qemu-arm@nongnu.org; Thu, 10 Oct 2019 09:08:09 -0400
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id CB6AB81F13
 for <qemu-arm@nongnu.org>; Thu, 10 Oct 2019 13:08:06 +0000 (UTC)
Received: by mail-wm1-f70.google.com with SMTP id j125so2599346wmj.6
 for <qemu-arm@nongnu.org>; Thu, 10 Oct 2019 06:08:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=p5HsNQS7nlFWIeFrSzusv7mbcFKgVobg9aXnxlKOR4I=;
 b=GNT4faWiam2i2FZP6q0GazsGP3x952FSM6iUbWG4B/XP471VTTiTl/8K937cTEUNva
 cVRkfs4Et5EJLqeZWqZtImZCdZBnVxvrRnBPTg4IfNrH7fgzUakUiDz/ShGT8jOelb42
 rELArfrMMRyS/M9COuenF2IiThMK+8YS3h1mRWA9HEfwxj2jh8zfQo6wNGOuOlrvUr5T
 dn5kRFsVV3Plq/qTbrOMfWTsuTdIZ/kqZobQk54b+KgsssFLt3FuChrz/4Pun6DdqQcL
 K8blC/JDuO8k/haGRnKZjXgPZZy3nav8c43lvSEgVNtP7WyMMKjka35Loco52CjWmcYK
 4+0w==
X-Gm-Message-State: APjAAAWp4R1JHX1Z+X7faMUo23FRW0Pm4Dp0HqKj8UdLcMJW1X5GC8D5
 dZeINi2LluE52RstFbqBMXtH1hTTzJ9JV6m2pTEti5SpxZYukrZcW6L1+YGNx/y9NCu5sx+m+LV
 zb4gQTjAfSPmh
X-Received: by 2002:a05:600c:490:: with SMTP id
 d16mr7621639wme.131.1570712885472; 
 Thu, 10 Oct 2019 06:08:05 -0700 (PDT)
X-Received: by 2002:a05:600c:490:: with SMTP id
 d16mr7621597wme.131.1570712885122; 
 Thu, 10 Oct 2019 06:08:05 -0700 (PDT)
Received: from [192.168.1.35] (46.red-83-42-66.dynamicip.rima-tde.net.
 [83.42.66.46])
 by smtp.gmail.com with ESMTPSA id 33sm13601835wra.41.2019.10.10.06.08.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 10 Oct 2019 06:08:04 -0700 (PDT)
Subject: Re: [PATCH v2 0/8] hw: Convert various reset() handler to DeviceReset
To: Li Qiang <liq3ea@gmail.com>, Markus Armbruster <armbru@redhat.com>
References: <20191008142539.7793-1-philmd@redhat.com>
 <CAKXe6S+JX_O8pUS-vtJSML5c4qTqoX-PWWfTYQLJVq6DPO37Zg@mail.gmail.com>
 <f6876b2c-547f-6254-9796-47e293a021bc@redhat.com>
 <CAKXe6SKUfG7hNAEzTbktzkSuH-0obi9Di8K7oH_saCjqbiRusg@mail.gmail.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <44c6da3c-fc91-f3eb-4d02-433a8a1b350e@redhat.com>
Date: Thu, 10 Oct 2019 15:08:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <CAKXe6SKUfG7hNAEzTbktzkSuH-0obi9Di8K7oH_saCjqbiRusg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, qemu-block@nongnu.org,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 Qemu Developers <qemu-devel@nongnu.org>, qemu-arm@nongnu.org,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 Igor Mammedov <imammedo@redhat.com>, John Snow <jsnow@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V+eA5mUfiBLJ

On 10/10/19 3:05 AM, Li Qiang wrote:
> Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com <mailto:philmd@redhat.co=
m>> =E4=BA=8E=20
> 2019=E5=B9=B410=E6=9C=8810=E6=97=A5=E5=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=88=
3:54=E5=86=99=E9=81=93=EF=BC=9A
>=20
>     Hi Li,
>=20
>     On 10/9/19 4:28 AM, Li Qiang wrote:
>      > Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com
>     <mailto:philmd@redhat.com> <mailto:philmd@redhat.com
>     <mailto:philmd@redhat.com>>> =E4=BA=8E
>      > 2019=E5=B9=B410=E6=9C=888=E6=97=A5=E5=91=A8=E4=BA=8C =E4=B8=8B=E5=
=8D=8810:47=E5=86=99=E9=81=93=EF=BC=9A
>      >
>      >=C2=A0 =C2=A0 =C2=A0Since v1:
>      >=C2=A0 =C2=A0 =C2=A0- Removed the pci-host devices
>      >
>      >
>      > Hello=C2=A0 I want to know why=C2=A0 remove this?
>=20
>     I haven't removed the devices, I simply remove the patches converti=
ng
>     them to DeviceReset,=20
>=20
>=20
> Yes, I mean the patches.
>=20
>     basically because I've not enough time to check if
>     the are on a bus that would reset them.=20
>=20
>=20
> IIUC, they are right.
>=20
>     I added these devices on my TODO
>     list for later, so meanwhile the other devices can be easily review=
ed
>     and merged. When few patches from a series are not reviewed or
>     incorrect, sometime the rest of the series is not merged, so I
>     prefer to
>     split it and get these patches merged.
>=20
>=20
> As far as I can see, most of the devices' usage of qemu_register_reset=20
> function can be
> convert to 'dc->reset'. In the main function.
>=20
> qemu_register_reset(qbus_reset_all_fn, sysbus_get_default());
>=20
> The 'qbus_reset_all_fn' calls 'qbus_reset_all' from the 'main-sys-bus'.=
=20
> Then 'qdev_reset_one'
> will call 'device_reset'. So IIUC every bus attached to 'main-sys-bus'=20
> can be reset through 'dc->reset'
>=20
> So I'm quite sure most of the cases that devices use=20
> 'qemu_register_reset' can be changed to 'dc->reset'.
> Seems you're busy,=C2=A0 If you don't mind, I can do some of the work t=
o=20
> convert 'reset' callback(not a patchset, one by one).

I guess we are all busy ;) I'm just trying to prioritize here.
This series is not very important because what we have today works, and=20
I would rather not introduce regressions. What happened then is it is=20
the 3rd time at least I get confuse with the qemu_register_reset()=20
function while reviewing code. Then my rule of thumb is if an=20
improvement takes less than 1h, then I just do it and keep going, else=20
if I postpone it I'll never go back to it. When a series start to take=20
too much rework it means I might started it wrongly, or I underestimated=20
the time required. Time that is taken of other more important tasks.
Today I prefer merged a subset of the series that is correct, rather=20
than aiming for the whole and never get it merged.

If you are interested in respining/fixing the pci-host devices I'd be=20
very thankful! I appreciate your help (and reviews).

Regards,

Phil.

PD: I'll respin as v3 with your tags and the PIIX4_IDE fix.

>      >
>      >=C2=A0 =C2=A0 =C2=A0- Removed the vmcoreinfo conversion (elmarco)=
 but add a comment.
>      >=C2=A0 =C2=A0 =C2=A0- Added Igor's R-b tag.
>      >
>      >=C2=A0 =C2=A0 =C2=A0Following the thread discussion between Peter=
/Markus/Damien about
>      >=C2=A0 =C2=A0 =C2=A0reset handlers:
>      > https://www.mail-archive.com/qemu-devel@nongnu.org/msg617103.htm=
l
>      >=C2=A0 =C2=A0 =C2=A0I started to remove qemu_register_reset() cal=
ls from few
>     qdevified
>      >=C2=A0 =C2=A0 =C2=A0devices (the trivial ones).
>      >
>      >=C2=A0 =C2=A0 =C2=A0Regards,
>      >
>      >=C2=A0 =C2=A0 =C2=A0Phil.
>      >
>      >=C2=A0 =C2=A0 =C2=A0v1:
>     https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg06367.html
>      >
>      >=C2=A0 =C2=A0 =C2=A0Philippe Mathieu-Daud=C3=A9 (8):
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 hw/acpi/piix4: Convert reset handler =
to DeviceReset
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 hw/isa/piix4: Convert reset handler t=
o DeviceReset
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 hw/ide/piix: Convert reset handler to=
 DeviceReset
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 hw/ide/sii3112: Convert reset handler=
 to DeviceReset
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 hw/ide/via82c: Convert reset handler =
to DeviceReset
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 hw/isa/vt82c686: Convert reset handle=
r to DeviceReset
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 hw/input/lm832x: Convert reset handle=
r to DeviceReset
>      >=C2=A0 =C2=A0 =C2=A0 =C2=A0 hw/misc/vmcoreinfo: Document its rese=
t handler
>=20
