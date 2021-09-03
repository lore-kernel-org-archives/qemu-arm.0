Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1181709lfb;
        Fri, 3 Sep 2021 04:17:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxn9v67qTgknfsv1PTVVhsME+Df7t85uQ6nHG9TtvWbmRChdlyrLuoyawYrVH/BfMLXt0gK
X-Received: by 2002:a17:906:8517:: with SMTP id i23mr3544674ejx.367.1630667840686;
        Fri, 03 Sep 2021 04:17:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630667840; cv=none;
        d=google.com; s=arc-20160816;
        b=KsPK0LIz/ql+wSDgXm3QxiCyTCp+itp5S4g73OnBEbbBTnuPSOzqapWMGJJFcI5ENr
         JLWycY5HPdVp53tophMwQA26UMvJeJ5YEcCsGjJBydb3TBy/8a8yDNBdkL9behf73NSS
         ZNjyuUuFidQYfZXM89YO0nCLPo65s7AnYxBjgeNwqzy8YSV7mpYZsUdul5EhP28SSgi0
         iq5mp2lP7L/zTDmI1EnG/ZaGyUniPHybaJFICzE+RrL1Il3KVKfBIUvt5EbbKZNoPFCA
         +UuiMwvkdX+Lb/dbVQ5UnErP4MAXHlfoA3EMsj8eJsCe5nNntfPcuja2XCVlyAdpeq4C
         6rDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=fH4orEAi1LMmKIlXzvrN15sR0XgUwy7e9wcO4+jWOtI=;
        b=xZoxU+LhXjUC0dyDxXUIMcA2fAvZyxJNmHTtgA6C8k1uycs0hN5QU60epsuYltsjzI
         qZPgpCSGQQSeYTQxv/Ae0B6UGlP3s7pvqJ52PPzAYoUEqNSJ62x3AfscahBTCh6PEkgD
         GZ9Rl6tRKAeGZmpp2UXpOOzqp5soAVUhCf2CM7JwhtJH6HYhg7OLPqKE/hVOKuvfKJHg
         vrfSTrUdYwbHPLZ8GoFLoR5dIZhHpkCyCl+LZRvTFtd/KvwDoOSx/SPCcuM+qCcZcygr
         fVlceTFV/sAfST/wj6Mxw6LqnX0SOcRQ0TayI5ANG3V9UALA2qKqpXfGoFBAjmGDy2S+
         0HzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i3eXXfjK;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id j18si5227191edp.44.2021.09.03.04.17.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 04:17:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=i3eXXfjK;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630667839;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fH4orEAi1LMmKIlXzvrN15sR0XgUwy7e9wcO4+jWOtI=;
	b=i3eXXfjKagDWLCjqd1cSM2+qH79XmmbBZILe9oXLcmMTiMP87YJ1bvcJsklU2flNjXcxcQ
	BXJ/hfZyI2adgnNt1nhOpybaeKlC0Si0kkbD8w9qGjNM+ujtb9E2l7AmOuVXqB9JTEKHkZ
	Q841YMzHJD6oexCpS7xK9qIEGE1TktQ=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-20-HsxRonmDMQOsc8su8Mn70A-1; Fri, 03 Sep 2021 07:17:06 -0400
X-MC-Unique: HsxRonmDMQOsc8su8Mn70A-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 35D9C84A5E0;
	Fri,  3 Sep 2021 11:17:03 +0000 (UTC)
Received: from redhat.com (unknown [10.39.193.241])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id C5F2960BF1;
	Fri,  3 Sep 2021 11:16:31 +0000 (UTC)
Date: Fri, 3 Sep 2021 12:16:28 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Fam Zheng <fam@euphon.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Li Zhijian <lizhijian@cn.fujitsu.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Jason Wang <jasowang@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Yuval Shaia <yuval.shaia.ml@gmail.com>,
	Peter Xu <peterx@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>, Eric Blake <eblake@redhat.com>,
	qemu-block@nongnu.org, Zhang Chen <chen.zhang@intel.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Helge Deller <deller@gmx.de>, David Hildenbrand <david@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	"Gonglei (Arei)" <arei.gonglei@huawei.com>,
	Stefan Weil <sw@weilnetz.de>, Laurent Vivier <lvivier@redhat.com>,
	Thomas Huth <thuth@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Greg Kurz <groug@kaod.org>,
	Alex Williamson <alex.williamson@redhat.com>, qemu-arm@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>, John Snow <jsnow@redhat.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	Laurent Vivier <laurent@vivier.eu>,
	Shannon Zhao <shannon.zhaosl@gmail.com>,
	Hanna Reitz <hreitz@redhat.com>, qemu-ppc@nongnu.org,
	Igor Mammedov <imammedo@redhat.com>,
	Mahmoud Mandour <ma.mandourr@gmail.com>
Subject: Re: [PATCH 02/28] glib-compat: Introduce g_memdup2() wrapper
Message-ID: <YTIEDKAgWGRt/I6y@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210903110702.588291-1-philmd@redhat.com>
 <20210903110702.588291-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210903110702.588291-3-philmd@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: V4pjH/I5TU0X

On Fri, Sep 03, 2021 at 01:06:36PM +0200, Philippe Mathieu-Daudé wrote:
> When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
> (Fedora 34 provides GLib 2.68.1) we get:
> 
>   hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: Use 'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
>   ...
> 
> g_memdup() has been updated by g_memdup2() to fix eventual security
> issues (size argument is 32-bit and could be truncated / wrapping).
> GLib recommends to copy their static inline version of g_memdup2():
> https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
> 
> Our glib-compat.h provides a comment explaining how to deal with
> these deprecated declarations (see commit e71e8cc0355
> "glib: enforce the minimum required version and warn about old APIs").
> 
> Following this comment suggestion, implement the g_memdup2_qemu()
> wrapper to g_memdup2(), and use the safer equivalent inlined when
> we are using pre-2.68 GLib.
> 
> Reported-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/glib-compat.h | 36 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 36 insertions(+)
> 
> diff --git a/include/glib-compat.h b/include/glib-compat.h
> index 9e95c888f54..6577d9ab393 100644
> --- a/include/glib-compat.h
> +++ b/include/glib-compat.h
> @@ -68,6 +68,42 @@
>   * without generating warnings.
>   */
>  
> +/*
> + * g_memdup2_qemu:
> + * @mem: (nullable): the memory to copy.
> + * @byte_size: the number of bytes to copy.
> + *
> + * Allocates @byte_size bytes of memory, and copies @byte_size bytes into it
> + * from @mem. If @mem is %NULL it returns %NULL.
> + *
> + * This replaces g_memdup(), which was prone to integer overflows when
> + * converting the argument from a #gsize to a #guint.
> + *
> + * This static inline version is a backport of the new public API from
> + * GLib 2.68, kept internal to GLib for backport to older stable releases.
> + * See https://gitlab.gnome.org/GNOME/glib/-/issues/2319.
> + *
> + * Returns: (nullable): a pointer to the newly-allocated copy of the memory,
> + *          or %NULL if @mem is %NULL.
> + */
> +static inline gpointer g_memdup2_qemu(gconstpointer mem, gsize byte_size)
> +{
> +#if GLIB_CHECK_VERSION(2, 68, 0)
> +    return g_memdup2(mem, byte_size);
> +#else
> +    gpointer new_mem;
> +
> +    if (mem && byte_size != 0) {
> +        new_mem = g_malloc(byte_size);
> +        memcpy(new_mem, mem, byte_size);
> +    } else {
> +        new_mem = NULL;
> +    }
> +
> +    return new_mem;
> +#endif
> +}

Close, but you missed the final piece of the puzzle

   #define g_memdup2(a) g_memdup2_qemu(a)


Such that in all following patches you can use the normal "g_memdup2"
API. This means when we later update min glib, we just delete the
compat code here, and the callers don't need updates.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
