Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp8442942wrp;
        Tue, 1 Oct 2019 09:53:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyCmmQ5cxLWROW/RaWHdCrj/UEe8/SDzxCiPJcL1W0rCa9mQKjUqY/Vv7b3Jb0BF64B5H2A
X-Received: by 2002:a17:906:6c98:: with SMTP id s24mr24447770ejr.28.1569948800982;
        Tue, 01 Oct 2019 09:53:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569948800; cv=none;
        d=google.com; s=arc-20160816;
        b=QAXJGIb6AOEmZFf7QyiICkCohDgwbrApvzLiyKsZdMMAa/uec5OhwReaGj1gNZmpB1
         07MUsEODwSSDtWBvKceJa9uFJAc4kOLoaHSR6Q8tA4/fhmsKtvtSqk4BKpzN56ff81db
         mc5giW7VGxepW+Nv0aVVQ9I6g5m2OZrhXh8pbkaJVwEtxnEiawLW3h7PsxezXjfYXGfs
         IbkVo+Ua/TT55lkf+0CrEGGveL1WIQVEhxVdb9o5Cl9ELq2Gn1xiDKMG92nle+NkfR9o
         3yfbJgofkPma9rEz80GLwrTc2cSJBtNNPvXl3xVhGKi4wKf0Knv4yMo9EeD30uGJL/bS
         TI6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject;
        bh=T2Xs3dJQkd1yvE/krGBhdpFPAaYEIDzTIw8KI6UaEu0=;
        b=iJcRA8kwIdxdAamAHrbdLTz4kbrb0XqrgI80GYo88Bd7PQJ78XqPPB0BDBBwTulzE8
         Hvp9xyB+x2/fXpq60bxINCs/FQCXPuv8hF+szhqysNGmmQOkuSSNe85jYfw6VGVzbuar
         Rv/p3jCN4wOpV/DWUgVj/zDneaGXE1sf2w8JXLlHXH71WP58pPp9Izemvw4QAE2/oWv4
         Zf2FKcmj540v1lPl1ypKLt3rpfq3DUnCua2Ul3H3vYhuE0z0iOqZiRkl+QIlbUJM8v/g
         ALli4CE4i4D8Hdx9btkUbngoJZA5cBiHjrh/ndEZiTvJ/YuVAr+agWJ2yuVUImikbH9F
         On3g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k2si9620075ede.311.2019.10.01.09.53.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2019 09:53:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:45008 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iFLOp-00030H-Do
	for alex.bennee@linaro.org; Tue, 01 Oct 2019 12:53:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57806)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iFLMn-0000ZE-Mo
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 12:51:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iFLMl-00083D-Je
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 12:51:13 -0400
Received: from mx1.redhat.com ([209.132.183.28]:56324)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iFLMf-0007ww-VO; Tue, 01 Oct 2019 12:51:06 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com
 [10.5.11.14])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 1575218CB8F3;
 Tue,  1 Oct 2019 16:51:04 +0000 (UTC)
Received: from [10.3.116.201] (ovpn-116-201.phx2.redhat.com [10.3.116.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id EA9615D9C9;
 Tue,  1 Oct 2019 16:50:44 +0000 (UTC)
Subject: Re: [PATCH v4 05/31] scripts: add script to fix
 error_append_hint/error_prepend usage
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20191001155319.8066-1-vsementsov@virtuozzo.com>
 <20191001155319.8066-6-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <5c4788f0-0ba9-94bb-b677-d7d34f064cde@redhat.com>
Date: Tue, 1 Oct 2019 11:50:44 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191001155319.8066-6-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.6.2
 (mx1.redhat.com [10.5.110.63]); Tue, 01 Oct 2019 16:51:04 +0000 (UTC)
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
Cc: fam@euphon.net, pburton@wavecomp.com, peter.maydell@linaro.org,
 codyprime@gmail.com, jasowang@redhat.com, mark.cave-ayland@ilande.co.uk,
 mdroth@linux.vnet.ibm.com, kraxel@redhat.com, sundeep.lkml@gmail.com,
 qemu-block@nongnu.org, quintela@redhat.com, arikalo@wavecomp.com,
 mst@redhat.com, armbru@redhat.com, pasic@linux.ibm.com, borntraeger@de.ibm.com,
 joel@jms.id.au, marcandre.lureau@redhat.com, rth@twiddle.net,
 farman@linux.ibm.com, ehabkost@redhat.com, sw@weilnetz.de, groug@kaod.org,
 yuval.shaia@oracle.com, dgilbert@redhat.com, alex.williamson@redhat.com,
 qemu-arm@nongnu.org, clg@kaod.org, stefanha@redhat.com, david@redhat.com,
 jsnow@redhat.com, david@gibson.dropbear.id.au, kwolf@redhat.com,
 integration@gluster.org, berrange@redhat.com, andrew@aj.id.au,
 cohuck@redhat.com, qemu-s390x@nongnu.org, mreitz@redhat.com,
 qemu-ppc@nongnu.org, pbonzini@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tUUge/eSnFdR

On 10/1/19 10:52 AM, Vladimir Sementsov-Ogievskiy wrote:
> error_append_hint and error_prepend will not work, if errp ==
> &fatal_error, as program will exit before error_append_hint or
> error_prepend call. Fix this by use of special macro
> ERRP_AUTO_PROPAGATE.
> 
> Signed-off-by: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>
> ---
> 

> +++ b/scripts/coccinelle/fix-error-add-info.cocci
> @@ -0,0 +1,28 @@
> +@rule0@
> +// Add invocation to errp-functions
> +identifier fn;
> +@@
> +
> + fn(..., Error **errp, ...)
> + {

When running this script, I get lots of warnings:

init_defs_builtins: /usr/lib64/coccinelle/standard.h
warning: line 6: should errp be a metavariable?
warning: line 11: should errp be a metavariable?
warning: line 13: should errp be a metavariable?
HANDLING: include/block/nbd.h

This means we are trying to patch only an actual variable named 'errp', 
and not a meta-variable representing any variable of type Error ** 
regardless of whether it is named errp or something else.  I think 
that's okay, in part because ERRP_AUTO_PROPAGATE() expects the exact 
name 'errp' to be in scope, so we cannot apply it to other variable 
names).  But I still have to wonder if there is a way to silence the 
warning, or if we have any outliers (other than the intentional Error 
**errp_in in patch 1) using a different name for a parameter of type 
Error **, which should also be tweaked.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org
