Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1670059lfb;
        Fri, 3 Sep 2021 14:11:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZIAhoJcLIsAovoT8K8356d03pE08OJ12gcG0fmcCWVCKI73dIn9wih4+ZpTE5yVt/jozy
X-Received: by 2002:a17:906:3497:: with SMTP id g23mr853220ejb.85.1630703479125;
        Fri, 03 Sep 2021 14:11:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630703479; cv=none;
        d=google.com; s=arc-20160816;
        b=vpVkyc33bfc1K8af+6EXF3+cVR/b3ABkzicyz45DNdhPO9pxYwkua9l2Ewmd3Wk+xB
         uHms8TreoUsAGzdfR0xWZcUTS7JDaw4UDZi5vZvNg4oZ3K+IAQoq8nkk3Zvl88Ll9127
         zsaR+MEOSn+9Vc8rya+f+iMWSOGkaDlTApS2wCHsSr2cuAIZQg20uV0z2SYvda2NIkUi
         Xy5envcz6URhpu4IVb+ECvwYYbXSnfENPLrB2xMV9cG39ORvg0hpp+akyOY2yjM6zrZ+
         00tgRi4z0BhtcW2/fj0UyremerNqom3yP+6FohKhXs+9ig2hNtZ+oUEH7L8PeSIC64C4
         4iKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=509e9qQPKk67PxlHPsH5v8Hs84kOus8xl5Bui86n/Ks=;
        b=rzb1tKaOW7NUEns1L3aVwjf8Gjd/Ggw3OzyJVdBJQmPpfmadLg6RbphpQ6Lxse27kd
         rIaMzLqccJtNVNNxcwo+hn1hpzvWI66ibTbKGh1AsAmXxZFJSYvWTY7OkzkIYfpNv0ns
         kYmyE/xVsTLIhRcq9TnDMhE7fTfKf+UPHcXUFPKPuyD+ZmH3xJzCXQShbdBolFUSssFz
         Ym4zt3a0Sacr/eCpW85ovKo2V2I73clIBoufNT+YxCXcyRrqEJlweW50A3Qvvs+r7e+s
         sI2WgTOC2DgZlei7Z1h/eijR88N2Tu4c4wa3IYU5Ei4b1qemizjvLx+JxVezhCw7Jh7x
         aE+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L4icVTEp;
       spf=pass (google.com: domain of eblake@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eblake@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id h24si386492ejt.408.2021.09.03.14.11.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 14:11:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of eblake@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=L4icVTEp;
       spf=pass (google.com: domain of eblake@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630703478;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=509e9qQPKk67PxlHPsH5v8Hs84kOus8xl5Bui86n/Ks=;
	b=L4icVTEpTIkTrz36hcKsfyjqqIEnt48sgPPTplK/GiP92PjQIn5uR1UyTNCdeHn3DFUcNf
	FXT8Gzpu+98xIO3KuKSz4qwJBFLMmKYXGlN5+5oPeQvyXO2WcmuaQjq6T/kGsxsRMvSFPO
	FTT/pSMyg7Ah38w2VhtlrvV/cYrNkGs=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-525-XUxF0OF-Nt-xuIdsl4bAvQ-1; Fri, 03 Sep 2021 17:11:15 -0400
X-MC-Unique: XUxF0OF-Nt-xuIdsl4bAvQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 8464418397A3;
	Fri,  3 Sep 2021 21:11:13 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id BB30B10016F4;
	Fri,  3 Sep 2021 21:10:59 +0000 (UTC)
Date: Fri, 3 Sep 2021 16:10:57 -0500
From: Eric Blake <eblake@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
	qemu-ppc@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v3 03/28] qapi: Replace g_memdup() by g_memdup2()
Message-ID: <20210903211057.kvn6r5pvx7iuwf5a@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-4-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210903174510.751630-4-philmd@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: EhyVPgWToV9q

On Fri, Sep 03, 2021 at 07:44:45PM +0200, Philippe Mathieu-Daudé wrote:
> Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
> 
>   The old API took the size of the memory to duplicate as a guint,
>   whereas most memory functions take memory sizes as a gsize. This
>   made it easy to accidentally pass a gsize to g_memdup(). For large
>   values, that would lead to a silent truncation of the size from 64
>   to 32 bits, and result in a heap area being returned which is
>   significantly smaller than what the caller expects. This can likely
>   be exploited in various modules to cause a heap buffer overflow.
> 
> Replace g_memdup() by the safer g_memdup2() wrapper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  qapi/qapi-clone-visitor.c | 16 ++++++++--------
>  qapi/qapi-visit-core.c    |  6 ++++--
>  2 files changed, 12 insertions(+), 10 deletions(-)

Reviewed-by: Eric Blake <eblake@redhat.com>

> 
> diff --git a/qapi/qapi-clone-visitor.c b/qapi/qapi-clone-visitor.c
> index c45c5caa3b8..b014119d368 100644
> --- a/qapi/qapi-clone-visitor.c
> +++ b/qapi/qapi-clone-visitor.c
> @@ -37,7 +37,7 @@ static bool qapi_clone_start_struct(Visitor *v, const char *name, void **obj,
>          return true;
>      }
>  
> -    *obj = g_memdup(*obj, size);
> +    *obj = g_memdup2(*obj, size);

I did not audit whether any callers were previously vulnerable,
although I suspect most (if not all) callers were from the generated
QAPI code passing in the results of sizeof, and none of our QAPI types
are 4G large to cause overflow.

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
