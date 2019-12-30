Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp15249765lff;
        Mon, 30 Dec 2019 02:33:55 -0800 (PST)
X-Google-Smtp-Source: APXvYqw7MIjjiCT2A9/lrYufl3iaYtXC3H18NkR+ox9EiFQ47ngbGyXmAYKOfu9mCaKQ6+MVtmm2
X-Received: by 2002:a05:6830:1353:: with SMTP id r19mr74776700otq.288.1577702034795;
        Mon, 30 Dec 2019 02:33:54 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1577702034; cv=none;
        d=google.com; s=arc-20160816;
        b=LE8n8ReBwltxedwwAftyQCid9hN6AqYB5awW7XDJPnI0lmX9dd2Zy4CgHsANeFbnpt
         gYBdzOBafuEx9Bh3ROzxL0qa+7TeYcwhJQ04LV6wVpKH0x8m3YF3TDKlKm/nHFPgvdFD
         gHXV3gVcT+Df/rEPdbjTkptz9d+LjbBIa07rtIIx5M3UFWGmP++7w6JBFBg+FU4ISdFG
         qjZT8TNaj+LShCjkXSrpyykWQQzTGg3XL5y29YSMglqtee8kUsEYYGSrxeB8C9UNSCON
         60NXnYwczjYRFi4/AnxLHijUXm/esSzEKzrAqNRR6Ewqjnu1H9QlKvzdL1gLcbrPbUU0
         Iraw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=osz1+gLyr114GefbdMEHHWsIMT6EPaU/DWBMxBOMOeQ=;
        b=rw9ExNyh9Q3c7g5ATA1kF2qbWOafRLvW+hjCLUOxonLw6CH2gkdAHh/qisjOxsZ37O
         qGTMUX8qHFRFPjMomD2Iwf2YnY//YLKwT+XjogyT+FPaHSWz/zYwB2yURLOvGIAmEoKe
         NbcyneWlZ34WceK5U7U0B3xIGF7/yE++yjMX8F3FGmuYAtNYV65UT7IQBTksM2vy9H9K
         lMwW6NriORPJyB5rPXcFSDdYHk74DdL14cKWd8qaOcDFt2l3C8ZQvWPDXt6NVtltjxuS
         UTfgLbUS16pHsVZ4K1D0ZWW4KeEPTqEzZ60+kvHor1zWlOenzdIOvxTQ3U2AgTkF1p7l
         9aDA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RE2Tvwwd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c19si15670054otp.3.2019.12.30.02.33.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Dec 2019 02:33:54 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=RE2Tvwwd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ilsN0-0007bw-0e
	for alex.bennee@linaro.org; Mon, 30 Dec 2019 05:33:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58909)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <pbonzini@redhat.com>) id 1ilsMm-0007Wz-M1
 for qemu-arm@nongnu.org; Mon, 30 Dec 2019 05:33:41 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1ilsMk-0002CR-MK
 for qemu-arm@nongnu.org; Mon, 30 Dec 2019 05:33:39 -0500
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:46487
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1ilsMk-0002C2-JK
 for qemu-arm@nongnu.org; Mon, 30 Dec 2019 05:33:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1577702018;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=osz1+gLyr114GefbdMEHHWsIMT6EPaU/DWBMxBOMOeQ=;
 b=RE2TvwwdhpBUua6EMr2t/AOYMF1f9rTYGZdEyyDDY3mBTk4uhkGqqOHLwiaRyLBC/juJLY
 3osUysJ9ujtRE3Lwr052ewS/2Pu6Z1JaClKGz2kz6x52qzeiDFX0SQi4oMZjwW4MGm38mq
 q5t0rvS4Ts8myTmf1riVDWDkQDrvA5I=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-189-HmYTunk-M-qACIwoirQWaw-1; Mon, 30 Dec 2019 05:33:34 -0500
Received: by mail-ed1-f69.google.com with SMTP id c2so20136024edx.19
 for <qemu-arm@nongnu.org>; Mon, 30 Dec 2019 02:33:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=osz1+gLyr114GefbdMEHHWsIMT6EPaU/DWBMxBOMOeQ=;
 b=ZNhvJ8vzmWA1jPlsPTHoLw72nCo9gSbvkz3Kb5+SkSB+kmoOgfdjoG/rJZtq5vUJPg
 0iT8rz7xubLZlmzplwt6pmwf48Q0IxiDeUHmo5+XbuOgVSgcIjo7UOUa/Q/fcohaFsm3
 4WkwnWTsYGJ+yQvueooZpZgTNFYyOMQ3rK7pJ7WjmV/nbRdCL2GTWZrMm16dSyK+ePiT
 fOsaSo5l4Szh5O/SGLCDx1QmfwC5WXNy9Z8jBrAPnxRAm6EQaKdXICcMRfKH5EGsVwUb
 xC475WXHhs17e4tvwZz96IxXPWI7TLtLZhMi6q0lXrVDT5q9nC9R9hK5PDrGM8IKhFHO
 fhxA==
X-Gm-Message-State: APjAAAXb9VYZCdPuvePsA74WzH6KB0F3cBMz2U1e5C3dfcFHANXf8XSK
 /J/7BWnEXNWII3TAZs0+XIVgVFmW13AOSAtK+GFoKjhVfvNg2g/y8bnnpQkfIMgFAtdANczSFl7
 B6Ibm7d8Bf7dkgxjAk87VMb96ZRAW
X-Received: by 2002:a17:906:7fd0:: with SMTP id
 r16mr67457070ejs.319.1577702013586; 
 Mon, 30 Dec 2019 02:33:33 -0800 (PST)
X-Received: by 2002:a17:906:7fd0:: with SMTP id
 r16mr67457016ejs.319.1577702013308; 
 Mon, 30 Dec 2019 02:33:33 -0800 (PST)
MIME-Version: 1.0
References: <20191230090900.446-1-philmd@redhat.com>
 <20191230090900.446-2-philmd@redhat.com>
 <273bf2e5-1223-3d01-f930-394195c037e4@weilnetz.de>
 <64c2434d-3b2b-1a3e-5358-e4b5acfbe8e8@redhat.com>
In-Reply-To: <64c2434d-3b2b-1a3e-5358-e4b5acfbe8e8@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Date: Mon, 30 Dec 2019 10:33:21 +0000
Message-ID: <CABgObfYahQbbteCAsMfKAYjPLDUpGJExO9mWyRw15mm=VWHsbQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] tcg: Search includes from the project root source
 directory
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
X-MC-Unique: HmYTunk-M-qACIwoirQWaw-1
X-Mimecast-Spam-Score: 0
Content-Type: multipart/alternative; boundary="00000000000010b1de059ae96084"
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>, Anthony Green <green@moxielogic.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 qemu-devel <qemu-devel@nongnu.org>, Max Filippov <jcmvbkbc@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
 Marek Vasut <marex@denx.de>, Markus Armbruster <armbru@redhat.com>,
 Palmer Dabbelt <palmer@dabbelt.com>,
 Aleksandar Rikalo <aleksandar.rikalo@rt-rk.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Andrzej Zaborowski <balrogg@gmail.com>, Artyom Tarasenko <atar4qemu@gmail.com>,
 Eduardo Habkost <ehabkost@redhat.com>, Stefan Weil <sw@weilnetz.de>,
 Riku Voipio <riku.voipio@iki.fi>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Stafford Horne <shorne@gmail.com>,
 Richard Henderson <rth@twiddle.net>, qemu-riscv@nongnu.org,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>, Claudio Fontana <claudio.fontana@huawei.com>,
 Laurent Vivier <laurent@vivier.eu>, Michael Walle <michael@walle.cc>,
 qemu-ppc@nongnu.org, Aleksandar Markovic <amarkovic@wavecomp.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CQWmFGl/GJGS

--00000000000010b1de059ae96084
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Il lun 30 dic 2019, 09:59 Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com> h=
a
scritto:

> > I'd prefer not changing those files.
>
> OK, I'll wait to see what Richard/Markus prefer.
>

I think it's best if you keep the include directives as-is for files only
needed from tcg/, and move the other headers (those that are needed from
other directories only) to include/tcg.

Thanks and happy new year!

Paolo

>
> > Regards and best wished for 2020
>
> Thanks ;)
>
>

--00000000000010b1de059ae96084
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"auto"><div><br><br><div class=3D"gmail_quote"><div dir=3D"ltr" =
class=3D"gmail_attr">Il lun 30 dic 2019, 09:59 Philippe Mathieu-Daud=C3=A9 =
&lt;<a href=3D"mailto:philmd@redhat.com">philmd@redhat.com</a>&gt; ha scrit=
to:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;b=
order-left:1px #ccc solid;padding-left:1ex">&gt; I&#39;d prefer not changin=
g those files.<br>
<br>
OK, I&#39;ll wait to see what Richard/Markus prefer.<br></blockquote></div>=
</div><div dir=3D"auto"><br></div><div dir=3D"auto">I think it&#39;s best i=
f you keep the include directives as-is for files only needed from tcg/, an=
d move the other headers (those that are needed from other directories only=
) to include/tcg.</div><div dir=3D"auto"><br></div><div dir=3D"auto">Thanks=
 and happy new year!</div><div dir=3D"auto"><br></div><div dir=3D"auto">Pao=
lo</div><div dir=3D"auto"><div class=3D"gmail_quote"><blockquote class=3D"g=
mail_quote" style=3D"margin:0 0 0 .8ex;border-left:1px #ccc solid;padding-l=
eft:1ex">
<br>
&gt; Regards and best wished for 2020<br>
<br>
Thanks ;)<br>
<br>
</blockquote></div></div></div>

--00000000000010b1de059ae96084--

