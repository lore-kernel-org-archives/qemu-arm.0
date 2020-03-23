Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp1558724lfi;
        Mon, 23 Mar 2020 08:01:31 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vu9ztiUyJL+c/m6rWfq6ueaPHJITHBjz8y/DxQcFHfPpHfzqTN5sBSkvAJDYqCX9blwd4XI
X-Received: by 2002:ac8:1628:: with SMTP id p37mr16937345qtj.277.1584975690924;
        Mon, 23 Mar 2020 08:01:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584975690; cv=none;
        d=google.com; s=arc-20160816;
        b=Ul1+SfmVRJvkNSvFqylyxE8qYWQ+mlJwd1+cexonnqEzM9sC8XiZweTpKVc4FS27Fp
         LY3mXXcsgxEhKZj4M4gFVZ9xN++rZbH+UOY27uPwWfdBNJFh9OSlUGb+Dka6eQ1kfhJ2
         8FrK/+lO4vKvGmdPnyNu+2bcUiFTxDR52jzVGY8Jc8+xZ2AY0PeTDkdQqzLnETtDsF8k
         T47pLGfmKMlGgLXbKZTuIyEfsmyikeWqMY9vqn2nSFsM1SjgrqH7cPsBakXsAjZCM7u3
         wdTRatVNtPq4msMvpiAE4+eyGdlWWiREQfOwl+HnhKH1/8zjCcBpxzdOi2bb8lY5CZoH
         Hawg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=KKeE6h7tq0L0aScGIdzsCho9ssli9lSjPim6mqvxRxM=;
        b=K04ZSs99/OGckpfRhWloiBdLY5mQ4wYlQbrQKpGvSm03mEqhlKuU+2Ckfnmy5rFMzF
         XwDxcV/hl1n+WoOSPhRIzBeolJVbkig5EBu7PXG0MJOoCz4D/91+AS18ysXsyxH9w2fq
         9cqTaF3z/95YtfMorpxhtdz8w3uKYOYk84I9wJLDdhyhn+h36I/f9RaPOjQDZExDLkm6
         pRh7NK1C0i+MTIY9BOYLkvKPlMP/Hx+Z44FxsyzL75LCvzPSTjL8GnmQCDwd+i9+xN8s
         Qtkdrb1Z/iAAOU7Txtn7Xxa23OSWVf+hg/qSfSznKhWa50pH88jFAOiLEzF6drgZVIfF
         Fqsg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iupApbdA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n5si9303652qti.323.2020.03.23.08.01.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Mar 2020 08:01:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=iupApbdA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:35090 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jGOa2-00013V-A3
	for alex.bennee@linaro.org; Mon, 23 Mar 2020 11:01:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46736)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jGOZo-0000yj-5o
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 11:01:17 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jGOZm-0008KS-Iw
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 11:01:16 -0400
Received: from us-smtp-delivery-74.mimecast.com ([63.128.21.74]:49600)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jGOZm-0008Jd-Cd
 for qemu-arm@nongnu.org; Mon, 23 Mar 2020 11:01:14 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1584975673;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KKeE6h7tq0L0aScGIdzsCho9ssli9lSjPim6mqvxRxM=;
 b=iupApbdAlkqB7Z3/zGrBNV1vEZETnBN+oZH6CaPNZKqWLSXtDoKvDvXNDklx0g3cOkJtvK
 pvuR2dwcBRmbfoyfJTOMOcvFYSRbVla9/Dpa/91q0RnOV6ujSzHAYkXLmvnu4Nid4bcfAB
 N7z9cI+OwpY/zTtIvrfq0VepMr3gSZ8=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-BjEzEQtDOFSv3dYgi6bf5A-1; Mon, 23 Mar 2020 11:01:08 -0400
X-MC-Unique: BjEzEQtDOFSv3dYgi6bf5A-1
Received: by mail-wm1-f69.google.com with SMTP id x23so776389wmj.1
 for <qemu-arm@nongnu.org>; Mon, 23 Mar 2020 08:01:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=B6se+74uq8IigJ1DNxLJ6QpeoObvmc8ZqUW9UUwi4Q0=;
 b=ISbLjIERvYMmUrnL6upEdFok46VGqYytMFTcAlfo7JPBYrt+jXKXyKtK9xkofGqkG3
 VNhXLJFadCAwB1zXGnje5dTScPyRWRaX6xh0nAN+pWhownafcyaEAulFxyGp/cHONPMi
 HrJx5hnFxz1o8BIYoFkZPRX+icrYNKIpkNAd/BDAOPgmiiVObWY5I/glBHZPA0zpRe5t
 74wZrgD8plGGdjwFKek5gFwRtKjWaNZrd8glCqAjl6S0+juaFYRBq3miFff3G0/JUHX7
 m9snc9/FW2ZDpXlTr/wlggNmFDu0TtcCIbJNEtg8HgjhJMEJrmtZ/C9nYfS6osHnAqKa
 aEcw==
X-Gm-Message-State: ANhLgQ0g3CAKjFM3BKn1wGZFKx1TwqaDi8XXbR2gUiRdeh24KTQeqZQM
 1+dfj34vRqdUAGlthiai/L66PxMP7rAMMWRJvof9D0QESb8Ev8p+0wz956duZl/sqsMmjCI9Y4K
 i5y4mJI4rqUN4
X-Received: by 2002:adf:8187:: with SMTP id 7mr17180836wra.358.1584975667311; 
 Mon, 23 Mar 2020 08:01:07 -0700 (PDT)
X-Received: by 2002:adf:8187:: with SMTP id 7mr17180780wra.358.1584975666830; 
 Mon, 23 Mar 2020 08:01:06 -0700 (PDT)
Received: from [192.168.1.35] (37.red-83-52-54.dynamicip.rima-tde.net.
 [83.52.54.37])
 by smtp.gmail.com with ESMTPSA id f14sm21834164wmb.3.2020.03.23.08.01.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 23 Mar 2020 08:01:06 -0700 (PDT)
Subject: Re: [PATCH-for-5.0 v2 00/11] misc: Trivial static code analyzer fixes
To: Laurent Vivier <laurent@vivier.eu>, qemu-devel@nongnu.org
References: <20200321144110.5010-1-philmd@redhat.com>
 <1c711740-6166-c730-ef67-d07511add1e6@vivier.eu>
 <262f8318-1590-1c48-f4de-a6482fdc3071@redhat.com>
 <10431e44-880a-cbec-c35e-1d425064c40b@vivier.eu>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <1016a691-244d-9890-01bb-894e62414963@redhat.com>
Date: Mon, 23 Mar 2020 16:01:04 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <10431e44-880a-cbec-c35e-1d425064c40b@vivier.eu>
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
 "Michael S. Tsirkin" <mst@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 BALATON Zoltan <balaton@eik.bme.hu>, qemu-block@nongnu.org,
 qemu-trivial@nongnu.org, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Joel Stanley <joel@jms.id.au>, Andrzej Zaborowski <balrogg@gmail.com>,
 Michael Tokarev <mjt@tls.msk.ru>, Alistair Francis <alistair@alistair23.me>,
 qemu-arm@nongnu.org, =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 John Snow <jsnow@redhat.com>, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>, Andrew Jeffery <andrew@aj.id.au>,
 Max Reitz <mreitz@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 qemu-ppc@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: rpbxJEUsjxhN

On 3/23/20 3:55 PM, Laurent Vivier wrote:
> Le 23/03/2020 =C3=A0 15:45, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit=C2=
=A0:
>> On 3/23/20 3:32 PM, Laurent Vivier wrote:
>>> Le 21/03/2020 =C3=A0 15:40, Philippe Mathieu-Daud=C3=A9 a =C3=A9crit=C2=
=A0:
>>>> Fix trivial warnings reported by the Clang static code analyzer.
>>>>
>>>> Since v1:
>>>> - Addressed Markus/Zoltan/Aleksandar review comments
>>>>
>>>> Philippe Mathieu-Daud=C3=A9 (11):
>>>>  =C2=A0=C2=A0 block: Avoid dead assignment
>>>>  =C2=A0=C2=A0 blockdev: Remove dead assignment
>>>>  =C2=A0=C2=A0 hw/i2c/pm_smbus: Remove dead assignment
>>>>  =C2=A0=C2=A0 hw/input/adb-kbd: Remove dead assignment
>>>>  =C2=A0=C2=A0 hw/ide/sii3112: Remove dead assignment
>>>>  =C2=A0=C2=A0 hw/isa/i82378: Remove dead assignment
>>>>  =C2=A0=C2=A0 hw/gpio/aspeed_gpio: Remove dead assignment
>>>>  =C2=A0=C2=A0 hw/timer/exynos4210_mct: Remove dead assignments
>>>>  =C2=A0=C2=A0 hw/timer/stm32f2xx_timer: Remove dead assignment
>>>>  =C2=A0=C2=A0 hw/timer/pxa2xx_timer: Add assertion to silent static an=
alyzer
>>>> warning
>>>>  =C2=A0=C2=A0 hw/scsi/esp-pci: Remove dead assignment
>>>>
>>>>  =C2=A0 block.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>>>  =C2=A0 blockdev.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>>>  =C2=A0 hw/gpio/aspeed_gpio.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 2 +-
>>>>  =C2=A0 hw/i2c/pm_smbus.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 1 -
>>>>  =C2=A0 hw/ide/sii3112.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 | 5 +++--
>>>>  =C2=A0 hw/input/adb-kbd.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 | 6 +-----
>>>>  =C2=A0 hw/isa/i82378.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 | 8 ++++----
>>>>  =C2=A0 hw/scsi/esp-pci.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 1 -
>>>>  =C2=A0 hw/timer/exynos4210_mct.c=C2=A0 | 3 ---
>>>>  =C2=A0 hw/timer/pxa2xx_timer.c=C2=A0=C2=A0=C2=A0 | 1 +
>>>>  =C2=A0 hw/timer/stm32f2xx_timer.c | 1 -
>>>>  =C2=A0 11 files changed, 12 insertions(+), 20 deletions(-)
>>>>
>>>
>>> I think your series covers cases already covered by:
>>>
>>> [PATCH v3 00/12] redundant code: Fix warnings reported by Clang static
>>> code analyzer
>>> https://patchew.org/QEMU/20200302130715.29440-1-kuhn.ch
>>
>> Unfortunately [for me...] I don't have v3 in my INBOX... *sigh*
>> This was 3 weeks ago. *sigh*.
>>
>> I can see the series in the archives:
>> https://lists.gnu.org/archive/html/qemu-devel/2020-03/msg00219.html
>> But I can't find the outcome, was it queued in the trivial tree?
>> Any idea when this will be merged in the master tree?
>=20
> Some patches are already merged via trivial (1, 2 (should go by SCSI
> queue) 3, 5, 6, 7, 9, 11 (by USB queue), 12).
>=20
> But others needed R-b tags or new version. I didn't check which of your
> patches are already covered by this series.
>=20
> I'm sorry to not have checked your series earlier...

Don't be sorry, the problem is my INBOX that is unreliable.

I was using NNTP last month until I heard it was working properly again,=20
which is not the case apparently. I'll try to find them on NNTP and=20
review them.

>=20
> Thanks,
> Laurent
>=20

