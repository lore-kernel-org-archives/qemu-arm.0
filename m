Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1063488wrp;
        Thu, 19 Sep 2019 07:27:06 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxIMMIYoMa76Adg45b8sQkC47WyMdSEIWjPkWm5sMvcSCskuSodsqNbAULLdUq0eP4Hi/wD
X-Received: by 2002:a17:906:699:: with SMTP id u25mr8655397ejb.250.1568903226683;
        Thu, 19 Sep 2019 07:27:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568903226; cv=none;
        d=google.com; s=arc-20160816;
        b=p1bQy/Ldy9+wKmTr8IUeLb6eqlOaeWnIar4SxRw4J7mKuDA0YvBzPE48h7yyOPgwrT
         RwWJt5J7+xD+AiW/wx241EhCJGPzLHmE7T8uRYTASBGKqoiKX7ZFEwcdoeLDlf6p8lDH
         Eg65ySb4JrchyP2lfaMWRTV+Vch90AEHrXu5T3nLRY9AzhUH67titPpuG8hBInIA/vGK
         Py/5WA0AwBfXfvTRHUEWS3Pyc8uHyABxwzE7c3stSPdBHm+OtqqKw8cnu87LcHCaf54b
         W6nlW0toROKTqO1NkjzAtuGkn3ODeCxdH3m+RMON23AAsfy+UwWkxa1M4HheNKBCj/+P
         H4NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=7rFI3Ei34HE+74uFiHWzPNb/YWaAH5C8l3HTsa7Mzcw=;
        b=OOb131hm7plU+CRceZMsh9H9UdJTJzIZTRkaH6wRMLXVRZiGHm75EZ5iNFOSpjmE8W
         sLyNhjRNr3IwKvXzojcSJkyjq7gDwDefOvk4qGUaHBDPOMzUtawsI0Y1fFMrSaE3pM2z
         +AKChTubn5OBC/imiQatwt/Es3cQTYw+1oBBs4HZ7wL9I6mlKMg9DBCMCR1xPIp6LNqI
         sr1EFgVQMWqbo1+Lq/fHyl0cFcYDgI24tqdEH4l/GEX27hMMR1RN5c0kuHvI7XlyfRGX
         Sn+cWBcgW49J9yxcRUBb/e4tO9JBykVSUGZF0Dfd5BZ2D3bixJjRQB9o1GJmlN39JpbZ
         VLMg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z19si2998517edr.403.2019.09.19.07.27.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Sep 2019 07:27:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44958 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iAxOj-0005u0-Hi
	for alex.bennee@linaro.org; Thu, 19 Sep 2019 10:27:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55908)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iAxOL-0005nj-4I
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 10:26:42 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iAxOI-0007tZ-6X
 for qemu-arm@nongnu.org; Thu, 19 Sep 2019 10:26:39 -0400
Received: from mx1.redhat.com ([209.132.183.28]:44015)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iAxOH-0007sd-T9; Thu, 19 Sep 2019 10:26:38 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1D72B3082137;
 Thu, 19 Sep 2019 14:26:36 +0000 (UTC)
Received: from [10.3.116.249] (ovpn-116-249.phx2.redhat.com [10.3.116.249])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id BE54219C7F;
 Thu, 19 Sep 2019 14:26:12 +0000 (UTC)
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Kevin Wolf <kwolf@redhat.com>
References: <20190918130244.24257-1-vsementsov@virtuozzo.com>
 <abb14088-6af2-5db2-da0d-0948fd4ac81c@redhat.com>
 <20190919091720.GB10163@localhost.localdomain>
 <57483252-273c-4606-47a8-eddeb840109a@redhat.com>
 <35c972e1-bdb5-cbcb-ed45-6a51f19af98c@virtuozzo.com>
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
Message-ID: <7ad7fa9f-59fe-808a-31eb-d3bdb1456bbb@redhat.com>
Date: Thu, 19 Sep 2019 09:26:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <35c972e1-bdb5-cbcb-ed45-6a51f19af98c@virtuozzo.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.42]); Thu, 19 Sep 2019 14:26:36 +0000 (UTC)
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
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "armbru@redhat.com" <armbru@redhat.com>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "david@redhat.com" <david@redhat.com>,
 "mdroth@linux.vnet.ibm.com" <mdroth@linux.vnet.ibm.com>,
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
 "berrange@redhat.com" <berrange@redhat.com>,
 "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "sundeep.lkml@gmail.com" <sundeep.lkml@gmail.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Rs4Y7XFpzY0e

On 9/19/19 9:13 AM, Vladimir Sementsov-Ogievskiy wrote:

> 
> With my plan of two different macro, I at least messed the case when we need
> both dereferencing and hints, which means third macro, or one macro with parameters,
> saying what to wrap.
> 
> And my aim was to follow the idea of "do propagation only if it really necessary in this case".
> 
> But may be you are right, and we shouldn't care so much.
> 
> 1. What is bad, if we wrap NULL, when we only want to use hints?
> Seems nothing. Some extra actions on error path, but who cares about it?
> 
> 2. What is bad, if we wrap error_fatal, when we only want to dereference, and don't use hints?
> Seems nothing again, on error path we will return from higher level, and a bit of extra work, but nothing worse..
> 
> So I tend to agree. But honestly, I didn't understand first part of Kevin's paragraph against propagation,
> so, may be he have more reasons to minimize number of cases when we propagate.

Here's the problem.

error_propagate(&error_abort, ...)

produces an abort() with a stack trace tied to your CURRENT location,
not the location at which the error was first detected.  We DO copy the
function name and line number from the original detection, but we have
moved on since that point in time, so the backtrace does not match the
reported location in the error struct.  So for error_abort, you want to
abort as soon as possible, without any intermediate error_propagate - we
use this to flag programmer errors, and want to make life easy for the
programmer.

But for error_propagate(&error_fatal, ...), we WANT to delay things to
as late as possible, in order to gather up as many additional
append_hints as possible, before finally telling the user their problem.
 In that case, we don't care about the stack trace or even the function
and line number of the failure, but about giving the user as much as we
can to help them fix their command-line problem.

> 
> To the same topic, of minimization: should we always call MAKE_ERRP_SAFE at function top, or only
> in block, where it is needed (assume, we dereference it only inside some "if" or "while"?
> Kevin, is something bad in propagation, when it not related to error_abort?

error_propagate() serves two purposes:

It is a crutch to make it easier to paper over passing NULL as errp (in
that case, we substitute a non-NULL pointer, then we can use 'if
(local_error)', and error_propagate() then frees local_error).  Hiding
this crutch behind a macro is desirable (less boilerplate).

It helps transfer from one error to another.  In this form, we are fine
using it for error_fatal (because we WANT the transfer to happen as late
as possible, because once we transfer the program exits so we can't add
any more hints), but not for error_abort (because we don't want to lose
context by transferring), and wasteful at other times (write directly to
the original error, instead of having to transfer).  So again, hiding it
in a macro means we no longer have to call it directly, but only in the
places where it helps.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org
