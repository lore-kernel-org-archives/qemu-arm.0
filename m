Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1393343wrm;
        Wed, 9 Oct 2019 13:29:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxzsHzWW+iY99JafLeY2c47CigVT1+z8SkKR2GhyPOCWpoOOwlgrb6bUrD7eUkmNgtVq1n6
X-Received: by 2002:a17:906:6a4a:: with SMTP id n10mr4652092ejs.23.1570652960234;
        Wed, 09 Oct 2019 13:29:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570652960; cv=none;
        d=google.com; s=arc-20160816;
        b=i/eAVtSaSgwpIj7M5o+THfPVHUFd7xcOwmiPD1K+9Qut+to5UMxul4+sWIkiuPtuL+
         4mPHhPDS2k+1pwCOU+FhJhQRGHP+MtehoUYu+X4rm2ynHUc8CFKa4H6ivl5vX/Sw11/4
         s98ozIjxxh7f+L1zqArSoVny/OO7gzWh7Gkc5tOZ9UZliS9lOtVn36YIacTbkiVA8T0h
         F1RqDGMASkBpAL6Y0nOX8+UkUUmzo9jtQfVHYADFjGSEbJlCk/79mRKgA4Y+SVU4wGJ5
         R+3HVEyATbevCsBYA1rUxSJszpIrmlGhmNJNzla/1isqnaBQJZkT2Ynw2tlv3Vy4wtbL
         N2Og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:user-agent
         :message-id:in-reply-to:date:references:subject:to:from;
        bh=GI1n+zuxuQHo1P1LiQW73J12bbV8eTGPrKiIJHJjjeM=;
        b=T7LEOIpuBc+CH3UDG2VGDJ7OH+9/GdiFHi6KmQThzTO2Ac7m7Jwx68h/JpPF9Ou2JK
         a1vD/GEkcP7Ku6WfsgW63hIczj3ktkempa/+pTfUBS7s3TCVTl7m2LPhuDsrKojQywMD
         2PYiwbxXiVUBY4CxvkeRD0XAnEYrBOwpgigWXgO+iHOAV4Bl5vwtMBZwgswwDGQgpNbH
         yy+0pKr7HPgOei5J9WGWCOH1/aOl+0b9Zl/KjPXP0zSdGVPp1R5WIKA37g1Z6BU+iFIx
         2vMKOexw/7P9KE1HV7JdLpn95J3tfTuxUkbT8IR+pzA2isFP1xjcr6OID2neftsaFCMI
         AsNA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a12si1746906ejp.425.2019.10.09.13.29.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 13:29:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:56922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIIaE-0004AQ-Kx
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 16:29:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50758)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <armbru@redhat.com>) id 1iIHLx-0002vx-Ol
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 15:10:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <armbru@redhat.com>) id 1iIHLs-0002lr-Gz
 for qemu-devel@nongnu.org; Wed, 09 Oct 2019 15:10:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:58042)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <armbru@redhat.com>)
 id 1iIHLk-0002hU-40; Wed, 09 Oct 2019 15:10:16 -0400
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id E3E12769E1;
 Wed,  9 Oct 2019 19:10:13 +0000 (UTC)
Received: from blackfin.pond.sub.org (unknown [10.36.118.123])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 291CC60167;
 Wed,  9 Oct 2019 19:09:56 +0000 (UTC)
Received: by blackfin.pond.sub.org (Postfix, from userid 1000)
 id 6B58F1138619; Wed,  9 Oct 2019 21:09:39 +0200 (CEST)
From: Markus Armbruster <armbru@redhat.com>
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
Subject: Re: [PATCH v4 04/31] error: auto propagated local_err
References: <20191001155319.8066-1-vsementsov@virtuozzo.com>
 <20191001155319.8066-5-vsementsov@virtuozzo.com>
 <87r23m8hvb.fsf@dusky.pond.sub.org>
 <b330f111-4e71-c3a6-4484-22dd25906b55@virtuozzo.com>
Date: Wed, 09 Oct 2019 21:09:39 +0200
In-Reply-To: <b330f111-4e71-c3a6-4484-22dd25906b55@virtuozzo.com> (Vladimir
 Sementsov-Ogievskiy's message of "Wed, 9 Oct 2019 08:17:44 +0000")
Message-ID: <87a7a9zqfg.fsf@dusky.pond.sub.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.27]); Wed, 09 Oct 2019 19:10:14 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
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
Cc: "fam@euphon.net" <fam@euphon.net>,
 "pburton@wavecomp.com" <pburton@wavecomp.com>,
 "peter.maydell@linaro.org" <peter.maydell@linaro.org>,
 "codyprime@gmail.com" <codyprime@gmail.com>,
 "jasowang@redhat.com" <jasowang@redhat.com>,
 "mark.cave-ayland@ilande.co.uk" <mark.cave-ayland@ilande.co.uk>,
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "kraxel@redhat.com" <kraxel@redhat.com>,
 "sundeep.lkml@gmail.com" <sundeep.lkml@gmail.com>,
 "qemu-block@nongnu.org" <qemu-block@nongnu.org>,
 "quintela@redhat.com" <quintela@redhat.com>,
 "arikalo@wavecomp.com" <arikalo@wavecomp.com>,
 "mst@redhat.com" <mst@redhat.com>,
 "mdroth@linux.vnet.ibm.com" <mdroth@linux.vnet.ibm.com>,
 "pasic@linux.ibm.com" <pasic@linux.ibm.com>,
 "borntraeger@de.ibm.com" <borntraeger@de.ibm.com>,
 "joel@jms.id.au" <joel@jms.id.au>,
 "marcandre.lureau@redhat.com" <marcandre.lureau@redhat.com>,
 "rth@twiddle.net" <rth@twiddle.net>,
 "farman@linux.ibm.com" <farman@linux.ibm.com>,
 "ehabkost@redhat.com" <ehabkost@redhat.com>, "sw@weilnetz.de" <sw@weilnetz.de>,
 "groug@kaod.org" <groug@kaod.org>,
 "yuval.shaia@oracle.com" <yuval.shaia@oracle.com>,
 "dgilbert@redhat.com" <dgilbert@redhat.com>,
 "alex.williamson@redhat.com" <alex.williamson@redhat.com>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, "clg@kaod.org" <clg@kaod.org>,
 "stefanha@redhat.com" <stefanha@redhat.com>,
 "david@redhat.com" <david@redhat.com>, "jsnow@redhat.com" <jsnow@redhat.com>,
 "david@gibson.dropbear.id.au" <david@gibson.dropbear.id.au>,
 "kwolf@redhat.com" <kwolf@redhat.com>,
 "integration@gluster.org" <integration@gluster.org>,
 "berrange@redhat.com" <berrange@redhat.com>,
 "andrew@aj.id.au" <andrew@aj.id.au>, "cohuck@redhat.com" <cohuck@redhat.com>,
 "qemu-s390x@nongnu.org" <qemu-s390x@nongnu.org>,
 "mreitz@redhat.com" <mreitz@redhat.com>,
 "qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
 "pbonzini@redhat.com" <pbonzini@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6cHR3T+176p+

Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:

> 09.10.2019 11:04, Markus Armbruster wrote:
>> Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com> writes:
>> 
>>> Here is introduced ERRP_AUTO_PROPAGATE macro, to be used at start of
>>> functions with errp OUT parameter.
>>>
>>> It has three goals:
>>>
>>> 1. Fix issue with error_fatal & error_prepend/error_append_hint: user
>>> can't see this additional information, because exit() happens in
>>> error_setg earlier than information is added. [Reported by Greg Kurz]
>> 
>> Done in PATCH 07-31.
>> 
>>> 2. Fix issue with error_abort & error_propagate: when we wrap
>>> error_abort by local_err+error_propagate, resulting coredump will
>>> refer to error_propagate and not to the place where error happened.
>>> (the macro itself doesn't fix the issue, but it allows to [3.] drop all
>>> local_err+error_propagate pattern, which will definitely fix the issue)
>>> [Reported by Kevin Wolf]
>>>
>>> 3. Drop local_err+error_propagate pattern, which is used to workaround
>>> void functions with errp parameter, when caller wants to know resulting
>>> status. (Note: actually these functions could be merely updated to
>>> return int error code).
>> 
>> Not done.  Can you prototype this part?  A few manually done examples
>> would give us an idea how the complete solution would look like.  A
>> (semi-)automated complete conversion of a subsystem would additionally
>> give us an idea how to actually do the conversion.
>> 
>> We can discuss applying ERRP_AUTO_PROPAGATE() as a bug fix for 1., and
>> leave 2. and 3. for later.  Feels like a half-done job to me.  We've got
>> too many of those in the tree already.  Dunno.
>> 
>
> If update everything it's about 90-140 patches.
>
> The whole thing was done in "[RFC v2 0/9] error: auto propagated local_err"
> <20190923161231.22028-1-vsementsov@virtuozzo.com>
> https://lists.gnu.org/archive/html/qemu-devel/2019-09/msg05157.html
>
> - it was so huge, that I decided to postpone 2 and 3...

Suggest to post unsplit patches as RFC.  This lets us see how the macro
gets used, and can also help us decide on a sensible split.  The
automatic split isn't quite right in places, and feels excessively
fine-grained to me.
