Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp2587866wrg;
        Mon, 13 May 2019 02:32:53 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwjUjgkhSsu7hys+diRJ8IDNR1xJhhba5wCLJU5l73WRoFNPEtRAwlhiRUcVECDldUOs4Mk
X-Received: by 2002:a37:4c04:: with SMTP id z4mr4973159qka.195.1557739972993;
        Mon, 13 May 2019 02:32:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557739972; cv=none;
        d=google.com; s=arc-20160816;
        b=Dk19Dw+QOxs5kDKioMtY95nt3sOL5c2jyEl/htoRE6SG+cHC8tSHYKvS2jZ9wUl0Mr
         iEtTbcjFyGRCk4lN4JdOdfO5/WKu/h93H+AnAf7hJHYT9OwcQ1fUZwBKsgIsA38C3UMN
         f9LDKUtpWScAgm5nat+lozmb+Rok6L9vGsJlB5AVwhrOAs+4oApJ+QitLUmwff94Ojek
         E5J8H+8uwRxZSs5zijOc6YstP+shcZ2xuBcFEX/2iiSDzRm3iufmgFYOM15+rOIcjotn
         eKhvlBZIaEnGfi2zOQ+HZNDWp0ZEMQscOz5mH014XmPzDR2rqe9eDBS4HuPBW8NY0n5l
         vsMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:user-agent:references
         :in-reply-to:date:cc:to:from:subject:message-id;
        bh=eF9Z3cqI4i44k/psAZlWHRyyJmaB4FE9xLj1dWepB+Q=;
        b=uns1uwU5oihNDoEgatt9P/nV6GCO/5IUY9ItV4rS/4ned/ZsbDLNp3lCPJ2jUluuiL
         ORYmQwOUehWsSKxnwLQDwI88L7ill53gOnuLwR2GJB3rhzw0h2Ek+YK6FtRHO2DKKmAo
         hBOYE0fo/ecKf8PKt20eZSI/n6B7beZ+klxjBJqSCNVTZaPA2M39W6JBeBWnq6bvVoWb
         PrVNjrH5wPwSotZv/6MuonXwHe4hM/7e8BOssrVlkzts8V9SU1HNEnFDG81Dd69lWcTo
         nkyUnHfzm4/RO4rtdbqt88+P6+vyHVkN5FFxOoVwC6qqeL0X10P+AzWSh27DGYy2Wvkv
         IYPQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of abologna@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=abologna@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <abologna@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id g6si288652qvn.86.2019.05.13.02.32.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 02:32:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of abologna@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of abologna@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=abologna@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 0E23E3092648;
	Mon, 13 May 2019 09:32:52 +0000 (UTC)
Received: from kinshicho (unknown [10.43.2.73])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 041EF19C68;
	Mon, 13 May 2019 09:32:47 +0000 (UTC)
Message-ID: <9f57bfa56715b3128c1823150457ddb866e6054c.camel@redhat.com>
Subject: Re: [PATCH 00/13] target/arm/kvm: enable SVE in guests
From: Andrea Bolognani <abologna@redhat.com>
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org, 
 alex.bennee@linaro.org, armbru@redhat.com, eblake@redhat.com,
 Dave.Martin@arm.com
Date: Mon, 13 May 2019 11:32:46 +0200
In-Reply-To: <20190512083624.8916-1-drjones@redhat.com>
References: <20190512083624.8916-1-drjones@redhat.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.32.2 (3.32.2-1.fc30) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.43]); Mon, 13 May 2019 09:32:52 +0000 (UTC)
X-TUID: P5KSEPaYSV6/

On Sun, 2019-05-12 at 10:36 +0200, Andrew Jones wrote:
[...]
>    CPU type | accel | sve-max-vq | sve-vls-map
>    -------------------------------------------
>  1)     max | tcg   |  $MAX_VQ   |  $VLS_MAP
>  2)     max | kvm   |  $MAX_VQ   |  $VLS_MAP
>  3)    host | kvm   |  N/A       |  $VLS_MAP
> 
> Where for (1) $MAX_VQ sets the maximum vq and smaller vqs are
> all supported when $VLS_MAP is zero, or when the vqs are selected
> in $VLS_MAP.

I'm a bit confused by the nomenclature here. VL clearly stands for
Vector Length, but what does VQ stand for? You seem to be using the
two terms pretty much interchangeably throughout the cover letter.

[...]
> There is never any need to provide both properties, but if both
> are provided then they are checked for consistency.

I would personally just error out when both are provided.

> The QMP query returns a list of valid vq lists. For example, if
> a guest can use vqs 1, 2, 3, and 4, then the following list will
> be returned
> 
>  [ [ 1 ], [ 1, 2 ], [ 1, 2, 3 ], [ 1, 2, 3, 4 ] ]
> 
> Another example might be 1, 2, 4, as the architecture states 3
> is optional. In that case the list would be
> 
>  [ [ 1 ], [ 1, 2 ], [ 1, 2, 4 ] ]

I think the proposed QMP command is problematic, because it reports
the valid vector lengths for either KVM or TCG based on which
accelerator is currently enabled: it should report all information
at all times instead, similarly to how query-gic-capabilities does
it.

[...]
> And now for what might be a bit more controversial; how we input
> the valid vector set with sve-vls-map. Well, sve-vls-map is a
> 64-bit bitmap, which is admittedly not user friendly and also not
> the same size as KVM's vls bitmap (which is 8 64-bit words). Here's
> the justification:
> 
>  1) We want to use the QEMU command line in order for the information
>     to be migrated without needing to add more VM state.
>  2) It's not easy/pretty to input arrays on the QEMU command line.
>  3) We already need to use the QMP query to get a valid set, which
>     isn't user friendly either, meaning we're already in libvirt
>     territory.
>  4) A 64-bit map (supporting up to 8192-bit vectors) is likely big
>     enough for quite some time (currently KVM and TCG only support
>     2048-bit vectors).
>  5) If user friendliness is needed more than migratability then
>     the 'max' cpu type can be used with the sve-max-vq property.
>  6) It's possible to probe the full valid vector set from the
>     command line by using something like sve-vls-map=0xffff and
>     then, when it fails, the error message will state the correct
>     map, e.g. 0xb.

I don't have a problem with having to use a bitmap internally,
though libvirt will clearly want to expose a more approachable
interface to users.

However, QMP reporting the information in the current format means
we'd have to build an additional parser on top of the bitmap handling
and conversion routines we'll clearly need to make this work; plus it
just feels weird that the information reported by QMP can't be used
on the command line without going through some tranformation first.

Wouldn't it make more sense to both accept and report bitmaps?

-- 
Andrea Bolognani / Red Hat / Virtualization
