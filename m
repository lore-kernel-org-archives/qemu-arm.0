Received: by 2002:a19:791d:0:0:0:0:0 with SMTP id u29csp690286lfc;
        Fri, 17 Dec 2021 05:44:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJw06BJrjUn200i1Is+cVT8chNEkXdZIm8K2dj6gEjG08cMomKhY/QKdB2S8BNZRC+jGQrb3
X-Received: by 2002:ae9:f11a:: with SMTP id k26mr1718245qkg.444.1639748678870;
        Fri, 17 Dec 2021 05:44:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639748678; cv=none;
        d=google.com; s=arc-20160816;
        b=qFSNDm1Mg8piUCCTQK/+weagjysRj0Spmo95zjQ4KUB/151ZqG0x+p/VWaLON+52tu
         tELhiFhUHC6PezeOmHSOYzgXZKZ+sKTmtILPcWLln4UJvlQreG6YfmG5IJzt+4H4pswW
         /yB+1VH5trFdFQRwFadz7HjbK/QN0yYzCcqMT2jiLOpSmkaN7irklvUhZuC0lhSo++La
         hAGD6jNLHZqdkPsY1pwnw0r1utZqAR+C4jr+xlohGbe2o/jZuJsMU8Jc1mVUe2/yhSRw
         uVKWiZjYN3SgQ1Wep95HNoKm/hOfKCtIH25hTuERsjiIY1G/xp+ooT8VvKkmFD/dR5QE
         2ZcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=grdJCQFq0CnPfK8IG6P9M7aXLslUbiUFWUPfJzKLpJ4=;
        b=kORwJCvJmJYajuVHW336AVeXIaHXTYSMagrMtDxGjPFJ45s20NC/La2oMZr6yXdijj
         7GHMAyhtSz6Y1mcbLVLSLI6Sb6YZwj0zcBup74cUxJespL+xeMxCGnZvQjJEDvokAjP3
         oj+IAAOFyCNFkdIKt1ZS6ELp5JNfAwoozkNoDH4RX8GFYdyCbyYVxM2YlmBi0Bf88pyB
         If1aSebDVT+yC5GYYQV9vDMzI5PVlgsazDlq4MDqiU9Usrg8AZJDs8x+15RgopyXJLCQ
         YyAQNrIAflJQt4w9PVEnNpo7PoyhI4MrXSCPtvj64USzDd4PPxsjqvxzn6HTcLgQD/KV
         3t7A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UPNdvmEq;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id h10si3668094qkp.752.2021.12.17.05.44.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Dec 2021 05:44:38 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UPNdvmEq;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639748666;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=grdJCQFq0CnPfK8IG6P9M7aXLslUbiUFWUPfJzKLpJ4=;
	b=UPNdvmEq11jod2b5akquuLEcaUzrg40cfFa+eKuyAYcabTg86sF8AVGYV9gMe6gwxN8ebd
	Vh1LCxSAuAEXqRW3kvlySKhiin8k94TPM4feHG4Lvox0cVmhdykzp91+6DDJIubSwXzNRf
	DM4Y4cOI9LjIQmcPwjTsijNSGO7AG3g=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-581-Gkg4u-GBPJusg16uXxK9gQ-1; Fri, 17 Dec 2021 08:44:13 -0500
X-MC-Unique: Gkg4u-GBPJusg16uXxK9gQ-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com [10.5.11.11])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 912C081EE6E;
	Fri, 17 Dec 2021 13:44:11 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.60])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 7CCB945D9C;
	Fri, 17 Dec 2021 13:43:10 +0000 (UTC)
Date: Fri, 17 Dec 2021 13:43:08 +0000
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
Message-ID: <YbyT7D/UpSGpmC24@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-3-philmd@redhat.com>
 <875yrofxki.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <875yrofxki.fsf@linaro.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: q0QyAKAqU+Lw

On Thu, Dec 16, 2021 at 02:11:37PM +0000, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
> > When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
> > (Fedora 34 provides GLib 2.68.1) we get:
> >
> >   hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: Use 'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
> >   ...
> >
> > g_memdup() has been updated by g_memdup2() to fix eventual security
> > issues (size argument is 32-bit and could be truncated / wrapping).
> > GLib recommends to copy their static inline version of g_memdup2():
> > https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
> >
> > Our glib-compat.h provides a comment explaining how to deal with
> > these deprecated declarations (see commit e71e8cc0355
> > "glib: enforce the minimum required version and warn about old APIs").
> >
> > Following this comment suggestion, implement the g_memdup2_qemu()
> > wrapper to g_memdup2(), and use the safer equivalent inlined when
> > we are using pre-2.68 GLib.
> >
> > Reported-by: Eric Blake <eblake@redhat.com>
> > Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > ---
> >  include/glib-compat.h | 37 +++++++++++++++++++++++++++++++++++++
> >  1 file changed, 37 insertions(+)
> >
> > diff --git a/include/glib-compat.h b/include/glib-compat.h
> > index 9e95c888f54..8d01a8c01fb 100644
> > --- a/include/glib-compat.h
> > +++ b/include/glib-compat.h
> > @@ -68,6 +68,43 @@
> >   * without generating warnings.
> >   */
> >  
> > +/*
> > + * g_memdup2_qemu:
> > + * @mem: (nullable): the memory to copy.
> > + * @byte_size: the number of bytes to copy.
> > + *
> > + * Allocates @byte_size bytes of memory, and copies @byte_size bytes into it
> > + * from @mem. If @mem is %NULL it returns %NULL.
> > + *
> > + * This replaces g_memdup(), which was prone to integer overflows when
> > + * converting the argument from a #gsize to a #guint.
> > + *
> > + * This static inline version is a backport of the new public API from
> > + * GLib 2.68, kept internal to GLib for backport to older stable releases.
> > + * See https://gitlab.gnome.org/GNOME/glib/-/issues/2319.
> > + *
> > + * Returns: (nullable): a pointer to the newly-allocated copy of the memory,
> > + *          or %NULL if @mem is %NULL.
> > + */
> > +static inline gpointer g_memdup2_qemu(gconstpointer mem, gsize byte_size)
> > +{
> > +#if GLIB_CHECK_VERSION(2, 68, 0)
> > +    return g_memdup2(mem, byte_size);
> > +#else
> > +    gpointer new_mem;
> > +
> > +    if (mem && byte_size != 0) {
> > +        new_mem = g_malloc(byte_size);
> > +        memcpy(new_mem, mem, byte_size);
> > +    } else {
> > +        new_mem = NULL;
> > +    }
> > +
> > +    return new_mem;
> > +#endif
> > +}
> > +#define g_memdup2(m, s) g_memdup2_qemu(m, s)
> > +
> 
> As per our style wouldn't it make sense to just call it qemu_memdup(m,
> s)?

Not in this case. We use suffix as we don't want people calling this
directly with the suffix.

In the glibcompat.h header we're attempting to transparently/secretly
replace/wrap standard glib APIs.  All the callers should remain using
the plain glib API name, never call the method with the suffix at
all. This lets us delete the wrapper later and not have to update
any callers. The suffix is basically just a hack of the impl we use
for transparent replacement. 

A method with a 'qemu_' prefix by constrast is something that callers
are explicitly expected to call directly.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
