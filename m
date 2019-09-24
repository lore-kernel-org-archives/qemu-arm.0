Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp4077922wrp;
        Tue, 24 Sep 2019 08:55:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyjE73FC4WcDDOuas8HPbK2elCtmM2YL7Ih8syqM4tBgPu4CrywxRTXRLVdCB9fi/uI0FRb
X-Received: by 2002:ac8:664d:: with SMTP id j13mr3528439qtp.191.1569340517315;
        Tue, 24 Sep 2019 08:55:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569340517; cv=none;
        d=google.com; s=arc-20160816;
        b=0XrrhePvUzPpuHaoxe1QsIbPaAxrLVmX9pS0PwEZeAzowLNf+YrEALGTTKEbmWrX6r
         FBpL7zpb3sF8yoQoww0hACTc9zKRvHDH19g50s868w2EakF5mqpkH/4Q7PBuM6E9hd09
         0MwmPgvB1DdRCLMfaW0bRGkXZ107WXHPQT52bqvL+F7yETqbNrodg+dK/hN76Ry8bbY9
         SXw7gdIdB+kpACH8KCpVtcbLq6JOd+KtPQufQgzQnHTK7e2gau1Wig6TW/MOnGbiXifu
         G8fvpIASONht2bMzAgT7EU/gRT11CuDc+CD0yVrqgA+Whb0z6nsg23Zw1xbt66Nfu6pC
         8W5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:autocrypt:openpgp:from:references:to
         :subject;
        bh=Qd/lVln207qz/joTafg4tUtglXE6q1URHcb96DHOkW4=;
        b=vbJmJdm7YhK4lqWrlTAW72tm9RyBd7O4wad5Q6wQVEeAJDt/Ykoa2OhFqrXOACHnPR
         416KOGGvnt/Qki7fyPYwkG3steO/L5JetRh3hv00O7o2drr2YQCNVLKx/HnHHDrpXav2
         7qOMEIZ6FCm2dwZ2d7dFodZlkfRWiTCxN3/0xY58MTVWpi+EtfzUcTCDwe/WM69gAzwx
         8FgAUWUiiMAcw3dMMRWTdvHOXtaX6Egs1NmuKdpDOOyegpckTX3U7U56SerorjpG1Oip
         /VJyDo2k3qYmfhIB+hdtppJMH+kw9tl3FV3uoD7kWFoXNiJiMUIZlsOfuMceJTTfxkkZ
         61mA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 69si1542093qkh.184.2019.09.24.08.55.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Sep 2019 08:55:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47578 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCn9o-0008FW-3d
	for alex.bennee@linaro.org; Tue, 24 Sep 2019 11:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49428)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iCmlG-0007Hb-1W
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 11:29:55 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iCmlE-0000Ki-HN
 for qemu-devel@nongnu.org; Tue, 24 Sep 2019 11:29:53 -0400
Received: from mx1.redhat.com ([209.132.183.28]:35298)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iCml6-0000I2-FI; Tue, 24 Sep 2019 11:29:44 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E0637C069B4B;
 Tue, 24 Sep 2019 15:29:40 +0000 (UTC)
Received: from [10.3.116.249] (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9D57860BFB;
 Tue, 24 Sep 2019 15:28:53 +0000 (UTC)
Subject: Re: [RFC v2 0/9] error: auto propagated local_err
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20190923161231.22028-1-vsementsov@virtuozzo.com>
 <d1527fdc-b5e8-093a-9206-6f7ceeece2ac@redhat.com>
 <84c9e5dd-3e0f-94e1-5da1-2c7baa594bf1@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=eblake@redhat.com; keydata=
 xsBNBEvHyWwBCACw7DwsQIh0kAbUXyqhfiKAKOTVu6OiMGffw2w90Ggrp4bdVKmCaEXlrVLU
 xphBM8mb+wsFkU+pq9YR621WXo9REYVIl0FxKeQo9dyQBZ/XvmUMka4NOmHtFg74nvkpJFCD
 TUNzmqfcjdKhfFV0d7P/ixKQeZr2WP1xMcjmAQY5YvQ2lUoHP43m8TtpB1LkjyYBCodd+LkV
 GmCx2Bop1LSblbvbrOm2bKpZdBPjncRNob73eTpIXEutvEaHH72LzpzksfcKM+M18cyRH+nP
 sAd98xIbVjm3Jm4k4d5oQyE2HwOur+trk2EcxTgdp17QapuWPwMfhaNq3runaX7x34zhABEB
 AAHNHkVyaWMgQmxha2UgPGVibGFrZUByZWRoYXQuY29tPsLAegQTAQgAJAIbAwULCQgHAwUV
 CgkICwUWAgMBAAIeAQIXgAUCS8fL9QIZAQAKCRCnoWtKJSdDahBHCACbl/5FGkUqJ89GAjeX
 RjpAeJtdKhujir0iS4CMSIng7fCiGZ0fNJCpL5RpViSo03Q7l37ss+No+dJI8KtAp6ID+PMz
 wTJe5Egtv/KGUKSDvOLYJ9WIIbftEObekP+GBpWP2+KbpADsc7EsNd70sYxExD3liwVJYqLc
 Rw7so1PEIFp+Ni9A1DrBR5NaJBnno2PHzHPTS9nmZVYm/4I32qkLXOcdX0XElO8VPDoVobG6
 gELf4v/vIImdmxLh/w5WctUpBhWWIfQDvSOW2VZDOihm7pzhQodr3QP/GDLfpK6wI7exeu3P
 pfPtqwa06s1pae3ad13mZGzkBdNKs1HEm8x6zsBNBEvHyWwBCADGkMFzFjmmyqAEn5D+Mt4P
 zPdO8NatsDw8Qit3Rmzu+kUygxyYbz52ZO40WUu7EgQ5kDTOeRPnTOd7awWDQcl1gGBXgrkR
 pAlQ0l0ReO57Q0eglFydLMi5bkwYhfY+TwDPMh3aOP5qBXkm4qIYSsxb8A+i00P72AqFb9Q7
 3weG/flxSPApLYQE5qWGSXjOkXJv42NGS6o6gd4RmD6Ap5e8ACo1lSMPfTpGzXlt4aRkBfvb
 NCfNsQikLZzFYDLbQgKBA33BDeV6vNJ9Cj0SgEGOkYyed4I6AbU0kIy1hHAm1r6+sAnEdIKj
 cHi3xWH/UPrZW5flM8Kqo14OTDkI9EtlABEBAAHCwF8EGAEIAAkFAkvHyWwCGwwACgkQp6Fr
 SiUnQ2q03wgAmRFGDeXzc58NX0NrDijUu0zx3Lns/qZ9VrkSWbNZBFjpWKaeL1fdVeE4TDGm
 I5mRRIsStjQzc2R9b+2VBUhlAqY1nAiBDv0Qnt+9cLiuEICeUwlyl42YdwpmY0ELcy5+u6wz
 mK/jxrYOpzXKDwLq5k4X+hmGuSNWWAN3gHiJqmJZPkhFPUIozZUCeEc76pS/IUN72NfprZmF
 Dp6/QDjDFtfS39bHSWXKVZUbqaMPqlj/z6Ugk027/3GUjHHr8WkeL1ezWepYDY7WSoXwfoAL
 2UXYsMAr/uUncSKlfjvArhsej0S4zbqim2ZY6S8aRWw94J3bSvJR+Nwbs34GPTD4Pg==
Organization: Red Hat, Inc.
Message-ID: <22191b09-822a-1f54-dcaa-3726c833805b@redhat.com>
Date: Tue, 24 Sep 2019 10:28:52 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <84c9e5dd-3e0f-94e1-5da1-2c7baa594bf1@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.31]); Tue, 24 Sep 2019 15:29:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: "stefanha@redhat.com" <stefanha@redhat.com>,
 "codyprime@gmail.com" <codyprime@gmail.com>,
 "jan.kiszka@siemens.com" <jan.kiszka@siemens.com>,
 "berto@igalia.com" <berto@igalia.com>,
 "zhang.zhanghailiang@huawei.com" <zhang.zhanghailiang@huawei.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "arikalo@wavecomp.com" <arikalo@wavecomp.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "hpoussin@reactos.org" <hpoussin@reactos.org>,
 "anthony.perard@citrix.com" <anthony.perard@citrix.com>,
 "samuel.thibault@ens-lyon.org" <samuel.thibault@ens-lyon.org>,
 "philmd@redhat.com" <philmd@redhat.com>,
 "green@moxielogic.com" <green@moxielogic.com>,
 "lvivier@redhat.com" <lvivier@redhat.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>,
 "xiechanglong.d@gmail.com" <xiechanglong.d@gmail.com>,
 "pl@kamp.de" <pl@kamp.de>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "b.galvani@gmail.com" <b.galvani@gmail.com>,
 "eric.auger@redhat.com" <eric.auger@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "ronniesahlberg@gmail.com" <ronniesahlberg@gmail.com>,
 "jsnow@redhat.com" <jsnow@redhat.com>, "rth@twiddle.net" <rth@twiddle.net>,
 "kwolf@redhat.com" <kwolf@redhat.com>, "andrew@aj.id.au" <andrew@aj.id.au>,
 "crwulff@gmail.com" <crwulff@gmail.com>,
 "sundeep.lkml@gmail.com" <sundeep.lkml@gmail.com>,
 "michael@walle.cc" <michael@walle.cc>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "kbastian@mail.uni-paderborn.de" <kbastian@mail.uni-paderborn.de>,
 "imammedo@redhat.com" <imammedo@redhat.com>, "fam@euphon.net" <fam@euphon.net>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "sheepdog@lists.wpkg.org" <sheepdog@lists.wpkg.org>,
 "david@redhat.com" <david@redhat.com>, "palmer@sifive.com" <palmer@sifive.com>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "jcmvbkbc@gmail.com" <jcmvbkbc@gmail.com>, "hare@suse.com" <hare@suse.com>,
 "sstabellini@kernel.org" <sstabellini@kernel.org>,
 "arei.gonglei@huawei.com" <arei.gonglei@huawei.com>,
 "namei.unix@gmail.com" <namei.unix@gmail.com>,
 "atar4qemu@gmail.com" <atar4qemu@gmail.com>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "amit@kernel.org" <amit@kernel.org>, "sw@weilnetz.de" <sw@weilnetz.de>,
 "groug@kaod.org" <groug@kaod.org>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "peter.chubb@nicta.com.au" <peter.chubb@nicta.com.au>,
 "clg@kaod.org" <clg@kaod.org>, "shorne@gmail.com" <shorne@gmail.com>,
 "qemu-riscv@nongnu.org" <qemu-riscv@nongnu.org>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "amarkovic@wavecomp.com" <amarkovic@wavecomp.com>,
 "aurelien@aurel32.net" <aurelien@aurel32.net>,
 "pburton@wavecomp.com" <pburton@wavecomp.com>,
 "sagark@eecs.berkeley.edu" <sagark@eecs.berkeley.edu>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "edgar.iglesias@gmail.com" <edgar.iglesias@gmail.com>,
 "gxt@mprc.pku.edu.cn" <gxt@mprc.pku.edu.cn>, "ari@tuxera.com" <ari@tuxera.com>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "mdroth@linux.vnet.ibm.com" <mdroth@linux.vnet.ibm.com>,
 "lersek@redhat.com" <lersek@redhat.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "antonynpavlov@gmail.com" <antonynpavlov@gmail.com>,
 "dillaman@redhat.com" <dillaman@redhat.com>, "joel@jms.id.au" <joel@jms.id.au>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "integration@gluster.org" <integration@gluster.org>,
 "rjones@redhat.com" <rjones@redhat.com>,
 "Andrew.Baumann@microsoft.com" <Andrew.Baumann@microsoft.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "walling@linux.ibm.com" <walling@linux.ibm.com>,
 Denis Lunev <den@virtuozzo.com>, "mst@redhat.com" <mst@redhat.com>,
 "mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
 "v.maffione@gmail.com" <v.maffione@gmail.com>, "marex@denx.de" <marex@denx.de>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "alistair@alistair23.me" <alistair@alistair23.me>,
 "paul.durrant@citrix.com" <paul.durrant@citrix.com>,
 "pavel.dovgaluk@ispras.ru" <pavel.dovgaluk@ispras.ru>,
 "g.lettieri@iet.unipi.it" <g.lettieri@iet.unipi.it>,
 "rizzo@iet.unipi.it" <rizzo@iet.unipi.it>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "akrowiak@linux.ibm.com" <akrowiak@linux.ibm.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "xiaoguangrong.eric@gmail.com" <xiaoguangrong.eric@gmail.com>,
 "pmorel@linux.ibm.com" <pmorel@linux.ibm.com>,
 "wencongyang2@huawei.com" <wencongyang2@huawei.com>,
 "jcd@tribudubois.net" <jcd@tribudubois.net>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>,
 "stefanb@linux.ibm.com" <stefanb@linux.ibm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: II+/9uX/uAVO

On 9/24/19 9:12 AM, Vladimir Sementsov-Ogievskiy wrote:

>>> 3. What to do with huge auto-generated commit 07? Should I split it
>>> per-maintainer or per-subsystem, or leave it as-is?
>>
>> It's big. I'd split it into multiple patches (and reduce the cc - except
>> for the cover letter, the rest of the patches can be limited to the
>> actual maintainer/subsystem affected rather than everyone involved
>> anywhere else in the series. With the current large cc, anyone that
>> replies gets several mail bounces about "too many recipients").  It may
>> be easier to split along directory boundaries than by maintainer
>> boundaries.  Markus has applied large tree-wide Coccinelle cleanups
>> before, maybe he has some advice.
> 
> 
> If split by subsystem it would be 200+ patches:
> git diff --name-only | while read f; do scripts/get_maintainer.pl -f $f --subsystem --no-rolestats 2>/dev/null | grep -v @ | head -1; done | sort | uniq | wc -l
> 205
> 
> 
> Try to look at larger subsystem:
> git diff --name-only | while read f; do scripts/get_maintainer.pl -f $f --subsystem --no-rolestats 2>/dev/null | grep -v @ | tail -2 | head -1; done | sort | uniq | wc -l
> 139
> 
> still too many.. Or is it OK?

Hmm - that becomes a tradeoff in length of the series (where individual
patches may be reviewed fast, but where the overall process may be
bogged down by sheer length), vs. length of individual emails (where the
email itself is daunting, but as the review is mechanical and done by
automation, it becomes a matter of spot-checking if we trust that the
automation was done correctly).  You can probably group it in fewer
patches, by joining smaller patches across a couple of subsystems.  It's
an art form, there's probably several ways to do it that would work, and
it comes down to a judgment call on how much work you want to do to try
and reduce other's work in reviewing it.  Maybe even an off-hand split
of gathering files until you reach about 500 or so lines per diff.  I
wish I had easier advice on how to tackle this sort of project in the
way that will get the fastest response time.


>>>   vl.c                                          |  13 +-
>>>   scripts/coccinelle/auto-propagated-errp.cocci |  82 +++++++
>>>   319 files changed, 2729 insertions(+), 4245 deletions(-)
>>>   create mode 100644 scripts/coccinelle/auto-propagated-errp.cocci
>>
>> The diffstat is huge, but promising.

We also learned in reviews of 7/9 that the diffstat here is misleading,
the number of insertions will definitely be increasing once the
Coccinelle script is fixed to insert the macro in more functions, but
hopefully it's still a net reduction in overall lines.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org
