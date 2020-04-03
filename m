Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp652193lfi;
        Fri, 3 Apr 2020 06:23:26 -0700 (PDT)
X-Google-Smtp-Source: APiQypIhgPDWrP3oox+TtRSEIO4HlB3mE0MpLs/tWyqQOgzKLE1qsp4QGiwUkfMaXKVpE18kC1xA
X-Received: by 2002:a05:620a:2f7:: with SMTP id a23mr7999062qko.303.1585920206541;
        Fri, 03 Apr 2020 06:23:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585920206; cv=none;
        d=google.com; s=arc-20160816;
        b=Z7bcvSuKMSDT/1DsBZaOuqgSO+nB/l92zMWYoKlZtkN1pw6xOr0BlSe6+BvbhS8+OY
         EpqF7UBV5NdXXCbK+wenrwvag9YDo+uEVrseJXu38LnxQHvo7Ah+Qq3kcav6HS+K6hDo
         MQndXvZ4WApWYVzUfWOqUkEw/01Z5QPWKN8LywUhfRxPwa4BoUZ41oESx0hlbHl50mkZ
         6H7kAOCDSamUFaGMNM3duk7ZaxBm452Ct969SroSum68o7lRmjOpykOHEtwIiHMoWjaO
         idFrLqLbU4c0ANVneaZqT/clMBXUEA2HACKOmRlxjEwQVnDGyTEwJmqnrrJas8/6LXWU
         iZHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=nOI41YyfRXPM/02G5+DP8/D60BlR8sG4s4ju+htuYgE=;
        b=v0JFjFwo6d/byd4RltGwBmQeBSa0/m2SDV5j8PvXdkRHmKPkuskIUTPdGL6r+wvQ+D
         QOTe6UgdysjVvMvSGIHiSDkelQdMumYS6jrtTu/34GSmSfDglhBg3Ys28FwSzwDbPIEV
         OCGcoAE05KaA9JWoOm1RF8Ism3mlz84/0H949+rNepIn79A0WU7G4NYsgXWjGW1ZXhGR
         G2Ortzyoi2x2n9x0xraY01Hftt6N3dj1UjH2/aDzSDIE5Pt1jwcNdWqQfNQpvNgMQRQf
         zzNQUSb3GBLtcgpZdnrErKvXfON/1C1yr0G22UD7aI0Yv9Fuso85HQZrm64YIDiLfOhw
         q/Qw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O1m9GLKr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e13si563762qtk.293.2020.04.03.06.23.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Apr 2020 06:23:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O1m9GLKr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jKMI9-0000eE-9x
	for alex.bennee@linaro.org; Fri, 03 Apr 2020 09:23:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32961)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1jKMI2-0000e1-Mu
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 09:23:19 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1jKMI1-0004Tv-8N
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 09:23:18 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:58181
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1jKMI1-0004TA-27
 for qemu-arm@nongnu.org; Fri, 03 Apr 2020 09:23:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1585920196;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nOI41YyfRXPM/02G5+DP8/D60BlR8sG4s4ju+htuYgE=;
 b=O1m9GLKr4xyS0HBqUsIyEPOdjMm3KUsF/you3Z+Vyxg52acitYs6f9wuZzi6RJnWqlsPhf
 q4fbuDngxuJjSai3SCJ91FX6dT7Nb+KL3PzlMp/BmZg3CXUnpyl7chfqugQm7iyN1rtPN0
 m/eYo9kS/dIqP+Rbm+KPyPkHISzoRJQ=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-73-mvuLFL9vM9a9dUD4AoqGFQ-1; Fri, 03 Apr 2020 09:23:10 -0400
X-MC-Unique: mvuLFL9vM9a9dUD4AoqGFQ-1
Received: by mail-ed1-f70.google.com with SMTP id o17so1887007edv.17
 for <qemu-arm@nongnu.org>; Fri, 03 Apr 2020 06:23:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=7URV7jlHSDOLfeFGIdz3M4FEJCLRLZhAbtcOyF+OQH8=;
 b=f+8MG+mw32E+E7b6OCP4ZQAktC29/l1stJB3/ZLWzIYB3+1RfPcwOYuDOVlnUanbX4
 UPuEQOFlTSfxL4p0xJMHb1waw45q2toKq04ksWNlk9GoNrmz3f+uwrhx5h/xy7/XsMkr
 Jga37xvucHKrh0EkIqovyAuibZSqUuZ3Z3ca20+xc1H6seePx3yzIukbQ13xrSUcMvky
 q8EPsGQRCN/vITXbSoaM1QUyLzmbDbkLShAsU4Z7BQ6EdhqmbOPDwA+8/2nIlBDcJ//o
 /eXH6jjr0n9lXq9QYJGognqltl2ISY2sQjgnNff/LZoyPtAoEmUFjKpEzAa3b5o3sqgw
 Xvuw==
X-Gm-Message-State: AGi0PuZH7JWJIO6PAB2zSnZGyfHkWZ0CuDE7OthKsKNGy30QBaLR2+QI
 0ODCrKGmAYmeD6lvdmcHgn9LOoXWmmb3cTq6vc6oThaggKqZLr0asIJutOngOpjSyZ1I79oabUz
 SJtRXBvzNvSIj
X-Received: by 2002:a05:6402:1619:: with SMTP id
 f25mr6821482edv.201.1585920189659; 
 Fri, 03 Apr 2020 06:23:09 -0700 (PDT)
X-Received: by 2002:a05:6402:1619:: with SMTP id
 f25mr6821457edv.201.1585920189353; 
 Fri, 03 Apr 2020 06:23:09 -0700 (PDT)
Received: from [192.168.1.39] (116.red-83-42-57.dynamicip.rima-tde.net.
 [83.42.57.116])
 by smtp.gmail.com with ESMTPSA id ar26sm1625920ejc.52.2020.04.03.06.23.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Apr 2020 06:23:08 -0700 (PDT)
Subject: Re: [PATCH for-5.0] hw/gpio/aspeed_gpio.c: Don't directly include
 assert.h
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20200403124712.24826-1-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <35265256-15e5-a206-dc7c-8f495d71ff68@redhat.com>
Date: Fri, 3 Apr 2020 15:23:07 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200403124712.24826-1-peter.maydell@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 207.211.31.120
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
Cc: Andrew Jeffery <andrew@aj.id.au>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OvQs8Nq6D1Wr

On 4/3/20 2:47 PM, Peter Maydell wrote:
> Remove a direct include of assert.h -- this is already
> provided by qemu/osdep.h, and it breaks our rule that the
> first include must always be osdep.h.

Seems a leftover for debugging added between v3:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg634251.html
and v4:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg637329.html
since not commented in v4 cover:
https://www.mail-archive.com/qemu-devel@nongnu.org/msg637328.html

>=20
> In particular we must get the assert() macro via osdep.h
> to avoid compile failures on mingw (see the comment in
> osdep.h where we redefine assert() for that platform).
>=20
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> Reported via a random comment on our github mirror...
> we should probably do a proper clean-includes run post-5.0.

Yes... Or schedule/include a pre-soft-freeze tasklist in the wiki=20
"things to do 1month before soft-freeze".

- refresh MAINTAINERS entries
- look at what we can deprecate
- run cocci cleanup scripts

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

>=20
>   hw/gpio/aspeed_gpio.c | 2 --
>   1 file changed, 2 deletions(-)
>=20
> diff --git a/hw/gpio/aspeed_gpio.c b/hw/gpio/aspeed_gpio.c
> index 41e11ea9b04..e52fcfd9a03 100644
> --- a/hw/gpio/aspeed_gpio.c
> +++ b/hw/gpio/aspeed_gpio.c
> @@ -6,8 +6,6 @@
>    * SPDX-License-Identifier: GPL-2.0-or-later
>    */
>  =20
> -#include <assert.h>
> -
>   #include "qemu/osdep.h"
>   #include "qemu/host-utils.h"
>   #include "qemu/log.h"
>=20

