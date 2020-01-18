Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp759034lff;
        Sat, 18 Jan 2020 11:39:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqxOpa5CCpsHB2v8EjetuZ0PaG4609ZEE+XHH+/CdWKSe2eXLW4YUxCzLrPw33HoiysJy4BY
X-Received: by 2002:a17:906:6bd5:: with SMTP id t21mr13897523ejs.110.1579376355705;
        Sat, 18 Jan 2020 11:39:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579376355; cv=none;
        d=google.com; s=arc-20160816;
        b=AiTC+7biRUM7aCAqPxZkydF7n2pMWZcT+gOc1u/8vK+7c9fM/suKZA6OZXZgXQ3oi6
         Tlz9hGQi62U2j0HXzgnrKz0Q+XQoZMzgd/okprE914Lyd9Z5o7rOaU3m3/aG20jKg6L3
         s3/9lbv9MUO/qwzrMpQhzvTBdnJ2DlYG1paLsoo4vWnGqIITsMvi/kVtAJc2yhH8G4+S
         c4hGTklgDHtT1JjKddqvJiAKsowayY7LK8JyYtywy54+H924uWNl6nqfMtnwh5DLStAb
         TwopOWW3iM+J3Kc+xLjAFqaDu0XCSIsdnfj/niMM6snuMg4T0VvbKn/prEhM6L46gjqY
         7+jQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=4Yt0cLPEtWQSPHouvmP/tZdV+Nm8YIxHarzWfnOxaVo=;
        b=GfqWEgz4b3gKTSrIOlOSsVx8lgPhSLXV+ye3SuNX9VW0F0oEIPop8E40H+0yTUEcyP
         xwwld+490MdsDzT4RKPaJn185HPbuFYaZE8rW+QWxI+dDRBaXX+hUg0Ad9HO6u0XCFpX
         3FKIoVU45+Rz2oL4N/vdvgT4mPBnxKwi1R1lsk18a8DDr4fGSdIQCZVzzf28BUZwULHd
         Uj4IJHbu4iTN6/7+04PuAPhyjyyoU9NWY9O9G8kWq5+7e7XirUo98vGCtELY1TBAB1x4
         0b3ionMtL44EGICmjTvMjTz76nI0///hYkmKm+aTvdXH2tQLeS7VkbIrjyZafeKVOAOQ
         719Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="bjl/JYVY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b23si18864728eju.283.2020.01.18.11.39.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 18 Jan 2020 11:39:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="bjl/JYVY";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44274 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1istwA-0001nR-DL
	for alex.bennee@linaro.org; Sat, 18 Jan 2020 14:39:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50539)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1isthw-00025t-Fu
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 14:24:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1istht-0001pj-VG
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 14:24:32 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:27195
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1istht-0001pG-S2
 for qemu-arm@nongnu.org; Sat, 18 Jan 2020 14:24:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1579375469;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4Yt0cLPEtWQSPHouvmP/tZdV+Nm8YIxHarzWfnOxaVo=;
 b=bjl/JYVYkfEwtsqjSkUHk+n0NFnF+yBnmRCt9ince3fy6MAtQTcEoxDp/9PKU0Vh93lubw
 pAm6lCWjix8HUm6Amqg4EqpszbXnIxWsSOL5SNtQ+B3fbAtpKgpIJJ5TPHm2qGfQtkywBA
 n5T4RF7mbSdKjpL9l7j46I5xiW2i2xc=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-164-SCURoSBXPum3-hmeNoZgQg-1; Sat, 18 Jan 2020 14:24:26 -0500
Received: by mail-wr1-f69.google.com with SMTP id h30so12020347wrh.5
 for <qemu-arm@nongnu.org>; Sat, 18 Jan 2020 11:24:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=HVQGz5YSjkxifvvhIhHWjfL482L8+9+PoGYqgiTx25Q=;
 b=qS9IP6kaZVFr440iZ5iM3YiAMaKER9040rvEx+0pNJaIGd/Zmf/zKChlOFQ9VdXrH+
 I6LN8olEuz6ckUjKY1aMU+mT3TbkJ+4GWszghxFqj/ypFJ6BCSMULvHKh13Zjy9fUQ/0
 2osIvQwqW2Er5pzKR4wYElXl4jK8Nvtmip8rwGfIgibSsAi8dVf2B6G1G3n48E10RLIt
 z/A/IU4ksvrJxWfmD9mDPghqq/h/RVlruzDOkIepRq1V1SdlMiVW+M5NrkL1dTqmIILT
 ow+RweSbQhPTpr9txfNJaMHfv1go3/ZRFdBFKTtwd/YFGdGe1/riMOB4lgkNl8UhRSzo
 BXwQ==
X-Gm-Message-State: APjAAAWbhT7vRL88Uzi88MtPcvrIAZYSVc1wRxogeYTmiFcAxN8XFoIZ
 aK99XDLdbFsvW/k95ZEhOvSlfkiQgFZ/YOaHDQj/msvDCt3aGRMdam7xx8oZxXAuZRbQ6ZTrZND
 qCNr/j/hXBQ7w
X-Received: by 2002:a05:600c:22c8:: with SMTP id
 8mr11144081wmg.178.1579375464908; 
 Sat, 18 Jan 2020 11:24:24 -0800 (PST)
X-Received: by 2002:a05:600c:22c8:: with SMTP id
 8mr11144060wmg.178.1579375464682; 
 Sat, 18 Jan 2020 11:24:24 -0800 (PST)
Received: from ?IPv6:2001:b07:6468:f312:e0d6:d2cd:810b:30a9?
 ([2001:b07:6468:f312:e0d6:d2cd:810b:30a9])
 by smtp.gmail.com with ESMTPSA id h17sm41015708wrs.18.2020.01.18.11.24.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 18 Jan 2020 11:24:24 -0800 (PST)
Subject: Re: [PATCH 0/6] Fix more GCC9 -O3 warnings
To: Markus Armbruster <armbru@redhat.com>,
 "Chubb, Peter (Data61, Kensington NSW)" <Peter.Chubb@data61.csiro.au>
References: <20191217173252.4672-1-philmd@redhat.com>
 <84fthiaahd.wl-Peter.Chubb@data61.csiro.au>
 <87a77q9njk.fsf@dusky.pond.sub.org>
From: Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <97c34bbd-79d2-070e-a35e-4fdf68b2e291@redhat.com>
Date: Sat, 18 Jan 2020 20:24:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <87a77q9njk.fsf@dusky.pond.sub.org>
Content-Language: en-US
X-MC-Unique: SCURoSBXPum3-hmeNoZgQg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 205.139.110.61
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
 Hannes Reinecke <hare@suse.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "qemu-trivial@nongnu.org" <qemu-trivial@nongnu.org>,
 Jason Wang <jasowang@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>, Max Reitz <mreitz@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@aj.id.au>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>, Gerd Hoffmann <kraxel@redhat.com>,
 Kevin Wolf <kwolf@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 99nTD6VH6xxi

On 18/12/19 07:05, Markus Armbruster wrote:
> "Chubb, Peter (Data61, Kensington NSW)" <Peter.Chubb@data61.csiro.au>
> writes:
>=20
>>>>>>> "Philippe" =3D=3D Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> w=
rites:
>>
>> Philippe> Fix some trivial warnings when building with -O3.
>>
>> For compatibility with lint and other older checkers, it'd be good to ke=
ep
>> this as /* FALLTHROUGH */ (which gcc should accept according to its
>> manual).
>=20
> We have hundreds of /* fall through */ comments already.
>=20
>> Fixing the comments' placement is a different matter, and should be
>> done.  Seems to me that until gcc started warning for this, noone had
>> actually run a checker, and the comments were just for human info.
>>
>> Peter C
>=20

Queued, thanks.

Paolo

