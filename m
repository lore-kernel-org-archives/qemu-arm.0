Received: by 2002:a17:90a:1a54:0:0:0:0 with SMTP id 20csp863124pjl;
        Wed, 2 Oct 2019 07:01:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqx3wHksOiJa9vRaKxUQIkb92iHPU7x0rhAaXjjqrXqxSgidS3VH2WTI9Vn/ONyArD3EzjpG
X-Received: by 2002:a17:906:74d4:: with SMTP id z20mr3161003ejl.191.1570024907388;
        Wed, 02 Oct 2019 07:01:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570024907; cv=none;
        d=google.com; s=arc-20160816;
        b=Ekk47CdYsXEQf6Eb6T4E9EK0Jgm73MQLh/E7YshZ9+Akrq8y9Jv+ZbS734cLAdUh82
         +xOIEnCF1KTCaQ1hJgtkkVYVmpC8CiI/n822sqmXAvKVey9BVWby07Y3eKN/sQLSVab/
         CVA7vLXbWhd3tCl6q21KG3vZvb/ukD+nE5Ymq0eLJjVoMO5MDFpxCcZIRNbqjyfkBz7q
         rLbf6EZ2mEp2UAl9ahpH/QBl4FwPItHUAk0Fj+MwHIRUP6bp9jW3eNPIwyuSv4NklsL6
         AobjthxUyGkkak7hydeFSDR+ms74NsHindgJcZ5uCKG4Fk4+7rTwdqzmRTH+VJLQqOpU
         NT3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject;
        bh=HcyNP3zhV7zvJ9suOkJd6RHDPreSuMfJ6KD5wvJfQr8=;
        b=rJilxv2fS/AqCOtbT25FN4YKbg+SlYRxSR/plXqAMZID2Kn9KUipBYFr19Pe+ec8uw
         XC2kS3NZ1AAj1P/SvXT0vipfee11aACjI+OX8dvMG8M6eVK92HpNBbXrkMscsI4fllhv
         RcSlViFRd3UWUAqqPKrwPEJeB7/DYw4gsqrKlU0ph5r55GkjjBqicfjYlxMi37zzLfnZ
         RK4nA7qc2Bw9ytYb8hEdZQn4nOBv5mqagoLjwSdVbkWX6HYwCM9ach1qVjB3ib3BFhF0
         5fVbzKmKDNyJ+tItvaZvJRN1NU4MGxGKM1oU93Nf/oqCUmlFe7KhqcFYO1v3W/bfTyWk
         k9sg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l15si10444320eja.290.2019.10.02.07.01.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 02 Oct 2019 07:01:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:55608 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iFfCK-0004gU-Pt
	for alex.bennee@linaro.org; Wed, 02 Oct 2019 10:01:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34302)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iFfC3-0004f9-92
 for qemu-arm@nongnu.org; Wed, 02 Oct 2019 10:01:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iFfC0-0001tY-Or
 for qemu-arm@nongnu.org; Wed, 02 Oct 2019 10:01:25 -0400
Received: from mx1.redhat.com ([209.132.183.28]:25227)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iFfC0-0001t0-GU; Wed, 02 Oct 2019 10:01:24 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 8B8FE3090FD6;
 Wed,  2 Oct 2019 14:01:22 +0000 (UTC)
Received: from [10.3.117.6] (ovpn-117-6.phx2.redhat.com [10.3.117.6])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id D75375D9D3;
 Wed,  2 Oct 2019 14:00:48 +0000 (UTC)
Subject: Re: [PATCH v4 04/31] error: auto propagated local_err
To: Roman Kagan <rkagan@virtuozzo.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org, fam@euphon.net, pburton@wavecomp.com,
 peter.maydell@linaro.org, codyprime@gmail.com, jasowang@redhat.com,
 mark.cave-ayland@ilande.co.uk, mdroth@linux.vnet.ibm.com, kraxel@redhat.com,
 sundeep.lkml@gmail.com, qemu-block@nongnu.org, quintela@redhat.com,
 arikalo@wavecomp.com, mst@redhat.com, armbru@redhat.com,
 pasic@linux.ibm.com, borntraeger@de.ibm.com, joel@jms.id.au,
 marcandre.lureau@redhat.com, rth@twiddle.net, farman@linux.ibm.com,
 ehabkost@redhat.com, sw@weilnetz.de, groug@kaod.org, yuval.shaia@oracle.com,
 dgilbert@redhat.com, alex.williamson@redhat.com, integration@gluster.org,
 clg@kaod.org, stefanha@redhat.com, david@redhat.com, jsnow@redhat.com,
 david@gibson.dropbear.id.au, kwolf@redhat.com, berrange@redhat.com,
 andrew@aj.id.au, cohuck@redhat.com, qemu-s390x@nongnu.org,
 mreitz@redhat.com, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 pbonzini@redhat.com
References: <20191001155319.8066-1-vsementsov@virtuozzo.com>
 <20191001155319.8066-5-vsementsov@virtuozzo.com>
 <20191002101535.GA30896@rkaganb.sw.ru>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <d644082d-2463-a095-146c-1648f65b4dfe@redhat.com>
Date: Wed, 2 Oct 2019 09:00:48 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191002101535.GA30896@rkaganb.sw.ru>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 02 Oct 2019 14:01:23 +0000 (UTC)
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: FX1PqNjoOCbV

On 10/2/19 5:15 AM, Roman Kagan wrote:
> On Tue, Oct 01, 2019 at 06:52:52PM +0300, Vladimir Sementsov-Ogievskiy wrote:
>> Here is introduced ERRP_AUTO_PROPAGATE macro, to be used at start of
>> functions with errp OUT parameter.
>>
>> It has three goals:
>>
>> 1. Fix issue with error_fatal & error_prepend/error_append_hint: user
>> can't see this additional information, because exit() happens in
>> error_setg earlier than information is added. [Reported by Greg Kurz]
>>

>> +/*
>> + * ERRP_AUTO_PROPAGATE
>> + *

>> +#define ERRP_AUTO_PROPAGATE() \
>> +g_auto(ErrorPropagator) __auto_errp_prop = {.errp = errp}; \
>> +errp = ((errp == NULL || *errp == error_fatal) ? \
>> +    &__auto_errp_prop.local_err : errp)
>> +
> 
> I guess it has been discussed but I couldn't find it, so: what's the
> reason for casting in stone the name of the function parameter, which
> isn't quite so obvious when you see this macro used in the code?  IMO
> if the macro took errp as a parameter that would be easier to follow.

It was discussed.  Forcing a specific name of the 'Error **errp' has 
tradeoffs:

Pro: possible to write a sed script to check for missing spots in the 
macros (in fact, my sed script found spots missed by Coccinelle when not 
using the correct --macro-header option)
Pro: enforces uniform style
Con: misses instances that have typos or otherwise used the wrong name

Allowing the macro to take the name of the parameter:
Pro/Con: More flexible (allows use in more place, but loses consistency)
Pro: Coccinelle can still handle the conversion
Con: using sed to check if Coccinelle missed anything is harder

But opinions on how to paint the bikeshed are still welcome; it's easy 
enough to respin the series with the macro taking an argument if that 
is agreed to indeed be more legible.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org
