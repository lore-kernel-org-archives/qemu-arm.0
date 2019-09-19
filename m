Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1022726wrp;
        Thu, 19 Sep 2019 06:54:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz9x1AMFY48KleW4ncbFS3rkIMg4+xeQoYN4m+gR5HXIJpN/ln9hf8ILoCkbCz4SGJx/xv0
X-Received: by 2002:a37:2784:: with SMTP id n126mr2872526qkn.302.1568901273135;
        Thu, 19 Sep 2019 06:54:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568901273; cv=none;
        d=google.com; s=arc-20160816;
        b=HHOJjrh87JI3Li268kGzlzIJYtYfs5UBFCMdkM4poFw+/LWuVP2YIQbQI+aWO6Y8yg
         lKLw45eceaiSkBt2bfuRMr39usKMjcDeNLZQHRSXuVHGHQOljkxknD+bx19dwkhrIH6U
         2ZWPXZiELpF5lTxkoPlwFLOH33BVNjggOoO85b0LvC3krexcb4+z+ABxHZQNDmkpATfW
         lpKSe1uotvioct20KVrsIgBMcPw4ly0NjEjOGyZtCBO92t2YP8P1Ra0IX+50mR2QaYmW
         UJAIeTE+XPQfHC7Oz93O4ktzYSpsMAVux4S+ct/QhNFDSQ1/BAM7ZheROddgmdPz2shr
         75Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=s/GxcNLca86v2jyD0ms6MKA2RbRV+ENKW8V6Idcu2C0=;
        b=za2RXorWpysSGuIrCGK//TU+DBXKUmY63wWvmct6/neil1kx4dtwyriV4N9BpzG6zk
         13I0+AubviaFO5yLkvYSSZephtO1Hhy+tCZFgcXkAyNxgULFHfhHIuvYsNt9IubxEoiT
         kfcP3/10MXKR/uNykjvWlE/6Zx33Khp085nrvjufTtnpij8ZMManOGTI5qORXjQm7mPd
         aEPUXLvuEQ+QkftnVMKGcIvh9r7XvV/Tiq0SGxCof1KKsAhGgyo8YTR/ZwKpRxE47SGO
         c8H5FsO7A0MD63j3G3vHp1tfOz0PGxc+adbAgCnzOLpeUnf+CK/z4ki8c5zl6Ae4YCyJ
         kZPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21si6363560qki.323.2019.09.19.06.54.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 06:54:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44450 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAwtE-0002DM-4x
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 09:54:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47058)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iAwVE-0007Ho-UF
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 09:29:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iAwVD-0002bN-H1
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 09:29:44 -0400
Received: from mx1.redhat.com ([209.132.183.28]:47694)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iAwVD-0002ap-88; Thu, 19 Sep 2019 09:29:43 -0400
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1E76C2D6A04;
 Thu, 19 Sep 2019 13:29:42 +0000 (UTC)
Received: from [10.3.116.249] (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 8126E60C18;
 Thu, 19 Sep 2019 13:29:14 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>
References: <20190918130244.24257-1-vsementsov@virtuozzo.com>
 <abb14088-6af2-5db2-da0d-0948fd4ac81c@redhat.com>
 <0497ac1e-c841-39cd-9944-48dd54c5b0f0@virtuozzo.com>
 <9450fbfd-0f8b-d10f-7577-64805917f67a@redhat.com>
 <26217614-77cf-9519-f94b-d606864f4d46@redhat.com>
 <1c82faa5-9443-bc3d-6df2-dbfd82a7b830@virtuozzo.com>
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
Message-ID: <f10d759b-58b0-f3f8-5250-9b4f11f10433@redhat.com>
Date: Thu, 19 Sep 2019 08:29:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1c82faa5-9443-bc3d-6df2-dbfd82a7b830@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.29]); Thu, 19 Sep 2019 13:29:42 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [RFC] error: auto propagated local_err
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
Cc: "fam@euphon.net" <fam@euphon.net>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "mst@redhat.com" <mst@redhat.com>, "codyprime@gmail.com" <codyprime@gmail.com>,
 "mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
 "mdroth@linux.vnet.ibm.com" <mdroth@linux.vnet.ibm.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "david@redhat.com" <david@redhat.com>, "armbru@redhat.com" <armbru@redhat.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "rth@twiddle.net" <rth@twiddle.net>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "groug@kaod.org" <groug@kaod.org>, "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "jsnow@redhat.com" <jsnow@redhat.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "kwolf@redhat.com" <kwolf@redhat.com>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "sundeep.lkml@gmail.com" <sundeep.lkml@gmail.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GzjrM3fKLols

On 9/19/19 1:47 AM, Vladimir Sementsov-Ogievskiy wrote:

>> "The evaluations of the initialization list expressions are
>> indeterminately sequenced with respect to one another and thus the order
>> in which any side effects occur is unspecified."
>>
>> which does not bode well for the assignment to __auto_errp_prop.errp.
>> All changes to errp would have to be within the same initializer.  Maybe:
>>
>> #define MAKE_ERRP_SAFE() \
>>    g_auto(ErrorPropagator) __auto_errp_prop = { \
>>      .local_err = (__auto_errp_prop.err = errp, \
>>          (errp = &__auto_errp_prop.local_err), NULL) }
> 
> Is it guaranteed that .errp will not be initialized to NULL after evaluating of
> .local_err initializer?

Probably not.

> 
>>
>> but by the time you get that complicated, just using a statement is
>> easier to read.

Either two declarations (the second being an unused dummy variable
declared solely for its initializer's side-effects) or a declaration and
a statement are the only sane ways I can see to provide guaranteed
ordering.  It's hidden behind a macro, so I don't care which.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org
