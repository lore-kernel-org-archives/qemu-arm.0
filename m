Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp8432655wrp;
        Tue, 1 Oct 2019 09:43:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzQeq2PG8TLVyAWEqTObLhbzOKxOVsrbZIaotOT3ha6qS9uD9vgWEnMRAYuurJ2gZLAAi3T
X-Received: by 2002:a17:906:7802:: with SMTP id u2mr15895336ejm.3.1569948213952;
        Tue, 01 Oct 2019 09:43:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569948213; cv=none;
        d=google.com; s=arc-20160816;
        b=hG/5hRpUOdy4XjqoAktELz+88LT5l9RIFEj796DIipHFljXggoUjhueSSytU8Z3fhf
         1xhWmkamD/iXi6esoLRlVh6GpDgKXcuuoAeNdLtu8hut3eFTb6u73YAFKcINoMTPO8hM
         cyeYY2WwSwJPPg/TBD6zzq+UcyYeG0lnkAQkboyWCYZ2E5r5yecNg+oaCg7viccI4nfu
         tIkotsx4OmNPyGtwkCd8ubvPrxesgyhuT3GvAEOWThwfgAm9GYZEMhpsDWQXTKFFDL4o
         R0mzJ205g2aA2SfvjoGHic79AvR+I+N1LWhvmaQ8/u6Kq+HYVYmP9zADX77ucu2LNJuk
         B8YA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:organization:from:references:to:subject;
        bh=McP3wsv6Q6ath/8wS13LDxBi5C0o+z2gdtOpB89QIwA=;
        b=FpwLyxGLwbz3KxFfVeMCeIN+wVJwi0LjEYNEr/0XAFVd3sV57d7qhocBPCtDJ3f8sx
         edAgcKvrQKQbp1ShzE/E57FsabAsWNzwjen1iBWvYs3TTRQsim2PQRVS2WCTkokWNQyk
         UFG25wCnnGKNDI8KglA195Y0tsCO7OJYOKfiAVuKd0meispgxufh/BCJRZO+9UftxIi0
         VPPvc+f660LpIFpUAndfp2k3XMj/TJv4glkaLTjPyn6VZu4BhwGwJtMilt4JYSJN20e4
         zX8Re04b+uFKneTj+w+B8VjXx7mvSE0C40XkrS0Az9O6wkfyLL/x+MpnFV8VXEPp/rJc
         0qDw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z10si9280715ejx.236.2019.10.01.09.43.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 01 Oct 2019 09:43:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44774 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iFLFM-00008c-2S
	for alex.bennee@linaro.org; Tue, 01 Oct 2019 12:43:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54740)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eblake@redhat.com>) id 1iFKvK-0004Cm-9Q
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 12:22:51 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eblake@redhat.com>) id 1iFKvJ-0000Qf-2P
 for qemu-devel@nongnu.org; Tue, 01 Oct 2019 12:22:50 -0400
Received: from mx1.redhat.com ([209.132.183.28]:33972)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eblake@redhat.com>)
 id 1iFKvB-0000I9-W9; Tue, 01 Oct 2019 12:22:42 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 762FF3082A98;
 Tue,  1 Oct 2019 16:22:40 +0000 (UTC)
Received: from [10.3.116.201] (ovpn-116-201.phx2.redhat.com [10.3.116.201])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 4A92919D70;
 Tue,  1 Oct 2019 16:22:14 +0000 (UTC)
Subject: Re: [PATCH v4 05/31] scripts: add script to fix
 error_append_hint/error_prepend usage
To: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 qemu-devel@nongnu.org
References: <20191001155319.8066-1-vsementsov@virtuozzo.com>
 <20191001155319.8066-6-vsementsov@virtuozzo.com>
From: Eric Blake <eblake@redhat.com>
Organization: Red Hat, Inc.
Message-ID: <cc20df9c-75e4-6139-c6ff-de0622b59104@redhat.com>
Date: Tue, 1 Oct 2019 11:22:13 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191001155319.8066-6-vsementsov@virtuozzo.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.45]); Tue, 01 Oct 2019 16:22:40 +0000 (UTC)
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
X-TUID: 328S3ZcWvkfY

On 10/1/19 10:52 AM, Vladimir Sementsov-Ogievskiy wrote:
> error_append_hint and error_prepend will not work, if errp ==
> &fatal_error, as program will exit before error_append_hint or
> error_prepend call. Fix this by use of special macro
> ERRP_AUTO_PROPAGATE.

This patch doesn't actually fix any code, but adds the script to enable 
automating the fixing of the code in subsequent patches.  Tweaking the 
commit message to make that point clear might be helpful.


>   scripts/coccinelle/fix-error-add-info.cocci | 28 +++++++++++++++++++++
>   1 file changed, 28 insertions(+)
>   create mode 100644 scripts/coccinelle/fix-error-add-info.cocci
> 
> diff --git a/scripts/coccinelle/fix-error-add-info.cocci b/scripts/coccinelle/fix-error-add-info.cocci
> new file mode 100644
> index 0000000000..34fa3be720
> --- /dev/null
> +++ b/scripts/coccinelle/fix-error-add-info.cocci
> @@ -0,0 +1,28 @@
> +@rule0@
> +// Add invocation to errp-functions
> +identifier fn;
> +@@
> +
> + fn(..., Error **errp, ...)
> + {
> ++   ERRP_AUTO_PROPAGATE();
> +    <+...
> +(
> +    error_append_hint(errp, ...);
> +|
> +    error_prepend(errp, ...);
> +)

So, for now, you aren't addressing any *errp usage, or any potential 
cleanups of error_propagate.  But that's okay; your cover letter did 
call out that you were only addressing 1 part out of 3 potential uses 
just to get some motion, based on the size of the effort.

> +    ...+>
> + }
> +
> +@@
> +// Drop doubled invocation
> +identifier rule0.fn;
> +@@
> +
> + fn(...)
> +{
> +    ERRP_AUTO_PROPAGATE();
> +-   ERRP_AUTO_PROPAGATE();
> +    ...
> +}
> 

This looks idempotent once a file is patched, and safe to rerun as many 
times in the future as needed.  I'm still hoping we can find a way to 
make scripts/checkpatch.pl also do a sanity check, but as it's harder to 
parse C in perl than in Coccinelle, I can live with just the .cocci 
script in-tree as long as we remember to manually run it periodically.

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3226
Virtualization:  qemu.org | libvirt.org
