Received: by 2002:a19:791d:0:0:0:0:0 with SMTP id u29csp742401lfc;
        Fri, 17 Dec 2021 07:02:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyFM7X2mcz5qAY1pk3ejEe6pRasjL1voWesmlcHQW6t6+DNcGIcPKU5pRjSZumoMS8nOkKP
X-Received: by 2002:a17:907:16a8:: with SMTP id hc40mr826994ejc.210.1639753322319;
        Fri, 17 Dec 2021 07:02:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639753322; cv=none;
        d=google.com; s=arc-20160816;
        b=QdPUzic7X40v7Zt10L1G1F6n7Dc823/L+yixmVCcyc+1HW3xyYVwe2+immyojmPjt+
         DMJ4mI3jqncBDwNewe5RzcRhLqVzKJ0cMv1vKK+ar06pWDbQq02AyDyt+weWxc8xrdxW
         4tBy1MJoGRvJgKV5ZLoXNz7rBgmBSdTmJTsGA+9srV3Zr4WToyLBqfuYZYA3OftZhraj
         342nGNPZuL29AqOeObxQkgblDx2LlslAKKermC5WgxBcyzu6Zqe5mzpVrfZ8hsB0sU/F
         xEpwLJ+4QH6lByxnOUNNDekYdFHPBUiplAv5YMtHhW0BweO3Vu6fF8UWBCpr0iTfRWC9
         UK2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=Fxu2JLKFuvBEujjfrNcMVtqnapkgvTnQJsuF/0zfQok=;
        b=fSsNm0fjAaeesYfo80IdQI5nbxXaYBr+bPRmoObCdSRayrMsbKHDY+NT2YqQK8s9wx
         DfsK22GYTqZPuPkfKTm6NAKNlFK/7GIpxkzj/Km3ZSHhEiIybOxnTqKNwJXNitxjtGtE
         93MmeyARwNIiPCXJxZGhz+N3I12PpSmrp/L4O3yQ11c1bYgyVvWrsj43YOcgKwaG6Rje
         VxD91KbFn1Bpi+XxdzgzkhzIavNoBqGylVAf1tWoHt2Hr8ENK9QMIqbthOXgu6DHRXgn
         s24rzRZ3+V9FK82wma7mkc8dcNJTqyQIqHBfNCfLDZg37mYqYAxVB2vNmW+TxRyQeq7U
         BXhQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aRntHZyU;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id u24si5300785edt.444.2021.12.17.07.02.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Dec 2021 07:02:02 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aRntHZyU;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639753320;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Fxu2JLKFuvBEujjfrNcMVtqnapkgvTnQJsuF/0zfQok=;
	b=aRntHZyUBH+8BlZtxmI3kJ5kZWfrOhbIyPuQ9qLRAP76FOkgcK5pHgN0iVaBmk3AaPmsrO
	9fFPWjltXAgybLovm6YobkoSKngAl+yewyt6zMiPJDExxQJpVo1REbqjm3pG77bIiIOf1k
	y2k/YgBWoZ+wmEYM3AeCCjiTEBvnINY=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-508-nby7Sj3QMcizNUNA3mB3Lg-1; Fri, 17 Dec 2021 10:01:48 -0500
X-MC-Unique: nby7Sj3QMcizNUNA3mB3Lg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com [10.5.11.23])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id EB2FD801AAB;
	Fri, 17 Dec 2021 15:01:46 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.60])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4BBD5E2F0;
	Fri, 17 Dec 2021 15:01:41 +0000 (UTC)
Date: Fri, 17 Dec 2021 15:01:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>,
	qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
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
	Eduardo Habkost <ehabkost@redhat.com>,
	Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>, Hanna Reitz <hreitz@redhat.com>,
	qemu-block@nongnu.org, qemu-ppc@nongnu.org
Subject: Re: [PATCH v3 02/28] glib-compat: Introduce g_memdup2() wrapper
Message-ID: <YbymUms9NLa2Gb4Y@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-3-philmd@redhat.com>
 <875yrofxki.fsf@linaro.org>
 <YbyT7D/UpSGpmC24@redhat.com>
 <87ilvne0x2.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87ilvne0x2.fsf@linaro.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: yF5MU6RWy1VF

On Fri, Dec 17, 2021 at 02:53:05PM +0000, Alex Bennée wrote:
> 
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Thu, Dec 16, 2021 at 02:11:37PM +0000, Alex Bennée wrote:
> >> 
> >> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> >> 
> >> > When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
> >> > (Fedora 34 provides GLib 2.68.1) we get:
> >> >
> >> >   hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: Use 'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
> >> >   ...
> >> >
> >> > g_memdup() has been updated by g_memdup2() to fix eventual security
> >> > issues (size argument is 32-bit and could be truncated / wrapping).
> >> > GLib recommends to copy their static inline version of g_memdup2():
> >> > https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
> >> >
> >> > Our glib-compat.h provides a comment explaining how to deal with
> >> > these deprecated declarations (see commit e71e8cc0355
> >> > "glib: enforce the minimum required version and warn about old APIs").
> >> >
> >> > Following this comment suggestion, implement the g_memdup2_qemu()
> >> > wrapper to g_memdup2(), and use the safer equivalent inlined when
> >> > we are using pre-2.68 GLib.
> >> >
> >> > Reported-by: Eric Blake <eblake@redhat.com>
> >> > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> >> > ---
> >> >  include/glib-compat.h | 37 +++++++++++++++++++++++++++++++++++++
> >> >  1 file changed, 37 insertions(+)
> >> >
> >> > diff --git a/include/glib-compat.h b/include/glib-compat.h
> >> > index 9e95c888f54..8d01a8c01fb 100644
> >> > --- a/include/glib-compat.h
> >> > +++ b/include/glib-compat.h
> >> > @@ -68,6 +68,43 @@
> >> >   * without generating warnings.
> >> >   */
> >> >  
> >> > +/*
> >> > + * g_memdup2_qemu:
> >> > + * @mem: (nullable): the memory to copy.
> >> > + * @byte_size: the number of bytes to copy.
> >> > + *
> >> > + * Allocates @byte_size bytes of memory, and copies @byte_size bytes into it
> >> > + * from @mem. If @mem is %NULL it returns %NULL.
> >> > + *
> >> > + * This replaces g_memdup(), which was prone to integer overflows when
> >> > + * converting the argument from a #gsize to a #guint.
> >> > + *
> >> > + * This static inline version is a backport of the new public API from
> >> > + * GLib 2.68, kept internal to GLib for backport to older stable releases.
> >> > + * See https://gitlab.gnome.org/GNOME/glib/-/issues/2319.
> >> > + *
> >> > + * Returns: (nullable): a pointer to the newly-allocated copy of the memory,
> >> > + *          or %NULL if @mem is %NULL.
> >> > + */
> >> > +static inline gpointer g_memdup2_qemu(gconstpointer mem, gsize byte_size)
> >> > +{
> >> > +#if GLIB_CHECK_VERSION(2, 68, 0)
> >> > +    return g_memdup2(mem, byte_size);
> >> > +#else
> >> > +    gpointer new_mem;
> >> > +
> >> > +    if (mem && byte_size != 0) {
> >> > +        new_mem = g_malloc(byte_size);
> >> > +        memcpy(new_mem, mem, byte_size);
> >> > +    } else {
> >> > +        new_mem = NULL;
> >> > +    }
> >> > +
> >> > +    return new_mem;
> >> > +#endif
> >> > +}
> >> > +#define g_memdup2(m, s) g_memdup2_qemu(m, s)
> >> > +
> >> 
> >> As per our style wouldn't it make sense to just call it qemu_memdup(m,
> >> s)?
> >
> > Not in this case. We use suffix as we don't want people calling this
> > directly with the suffix.
> >
> > In the glibcompat.h header we're attempting to transparently/secretly
> > replace/wrap standard glib APIs.  All the callers should remain using
> > the plain glib API name, never call the method with the suffix at
> > all. This lets us delete the wrapper later and not have to update
> > any callers. The suffix is basically just a hack of the impl we use
> > for transparent replacement.
> 
> Right - at the risk of bike shedding names maybe we should choose a
> suffix the better reflects the purpose like _alt or _internal rather
> than overloading qemu?

Sure, I'm fine with that.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
