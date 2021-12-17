Received: by 2002:a19:791d:0:0:0:0:0 with SMTP id u29csp687615lfc;
        Fri, 17 Dec 2021 05:40:12 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyQ4IrMdcYyV3xvhlk/zhsMCqXAssRMsyUliCCNX1w1Sw7ObXbiUd9QCoHShcseC2etX2+h
X-Received: by 2002:a05:6402:5107:: with SMTP id m7mr2950410edd.165.1639748411957;
        Fri, 17 Dec 2021 05:40:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639748411; cv=none;
        d=google.com; s=arc-20160816;
        b=BjdtOhTqotcA2ukzjxMoxS6oSTBObaiNgcfFgUblEpzbQ1Z6sE6+291HU31xLpbgYE
         S3c3YmPnVGiAihFj9N4vNu8E5V5BQPAudI47LmSkWsbEapJCksywB7dT4mIP6oCiAZtx
         t4YylPr1HW3KA1DOLhkmuEbYAAk92jLuSodqTdiXn3k0IEfDDTlQq8V3TXS2cjxO29H5
         279opZILYaevd+DLC/gO6KUmF2OUw6zKCDO/j2Q/GGjRcwz7kNP6nFreG/WnL4zNLj/n
         sw3bp2q8zvKq0jbSAsNo4R42fBmvGj145JBu6hJQMwilJsTqYfPfnQtJE8iwaj0MJoMH
         03jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=+WII+q6sMQtq6oiTOPoewOtdOLNUWgzawJNtWuwMt0Y=;
        b=azw1B8pAYNScWdgGopnqYHf6m3aPc0WX6eKBEh0YQz0phCL4zKNqPje7K2vBW+0mVa
         FnwUfbNqEhMDt9yH0o9aerBTsUrW4AFP0iZ7boaM7N4DIkawzvjzOUY7V3KYi2o2+ZKb
         BJBnyNmdFNkMrh+lBJtfWRt1pPHcNtS6dz8Lm96z4bP82HSCV0cetSLBf+U3fpwvGeAt
         wYpytx7ypyA+nCiA4JRcb6IgC3VaIz+QaBmSCYBKqkMq0oyzeQvJoTS9BC79w4J+ac5k
         uFjp4ICNNBgsg4UJMtnD3rBEtR1or77BdfXi8+XmpvJqq4LqHwGTGbXBWhKjJCyb4ijf
         Rg5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XUQqsmkO;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id b20si3406621ejz.420.2021.12.17.05.40.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 17 Dec 2021 05:40:11 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XUQqsmkO;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639748410;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+WII+q6sMQtq6oiTOPoewOtdOLNUWgzawJNtWuwMt0Y=;
	b=XUQqsmkOva/L5MYP+Rj0OTry2GhwHZUg8o+E9wvxGYm4pCUGSZl/dL8zuzjxxatHYcJaih
	mIMppwd8/VhywjSq/vJokWLI2fFaz+H0e4xPrmPV9R1coPvAHNtxhXu2EFuGgj47+6D4qa
	oVLMRCQUJGzucz4kHmNAkvBZG1ZdyjI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-400-M2LCHepfPh2jVD5gCUJAow-1; Fri, 17 Dec 2021 08:40:06 -0500
X-MC-Unique: M2LCHepfPh2jVD5gCUJAow-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com [10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4FA38874986;
	Fri, 17 Dec 2021 13:40:05 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.60])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 2CDD3104A9F3;
	Fri, 17 Dec 2021 13:39:41 +0000 (UTC)
Date: Fri, 17 Dec 2021 13:39:37 +0000
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
Message-ID: <YbyTGUmLOcCoPYiq@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-3-philmd@redhat.com>
 <875yrofxki.fsf@linaro.org>
 <34bd86db-a213-bb3a-9c72-8c48bd138835@redhat.com>
 <87v8zneap1.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87v8zneap1.fsf@linaro.org>
User-Agent: Mutt/2.1.3 (2021-09-10)
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: 5dki60SImNKB

On Fri, Dec 17, 2021 at 11:10:31AM +0000, Alex Bennée wrote:
> 
> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> 
> > On 12/16/21 15:11, Alex Bennée wrote:
> >> Philippe Mathieu-Daudé <philmd@redhat.com> writes:
> >> 
> >>> When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
> >>> (Fedora 34 provides GLib 2.68.1) we get:
> >>>
> >>>   hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: Use 'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
> >>>   ...
> >>>
> >>> g_memdup() has been updated by g_memdup2() to fix eventual security
> >>> issues (size argument is 32-bit and could be truncated / wrapping).
> >>> GLib recommends to copy their static inline version of g_memdup2():
> >>> https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
> >>>
> >>> Our glib-compat.h provides a comment explaining how to deal with
> >>> these deprecated declarations (see commit e71e8cc0355
> >>> "glib: enforce the minimum required version and warn about old APIs").
> >>>
> <snip>
> >>> +#define g_memdup2(m, s) g_memdup2_qemu(m, s)
> >>> +
> >> 
> >> As per our style wouldn't it make sense to just call it qemu_memdup(m,
> >> s)?
> >
> > I followed the documentation in include/glib-compat.h:
> >
> > /*
> >  * Note that because of the GLIB_VERSION_MAX_ALLOWED constant above,
> > allowing
> >  * use of functions from newer GLib via this compat header needs a little
> >  * trickery to prevent warnings being emitted.
> >  *
> >  * Consider a function from newer glib-X.Y that we want to use
> >  *
> >  *    int g_foo(const char *wibble)
> >  *
> >  * We must define a static inline function with the same signature that does
> >  * what we need, but with a "_qemu" suffix e.g.
> >  *
> >  * static inline void g_foo_qemu(const char *wibble)
> >  * {
> >  *     #if GLIB_CHECK_VERSION(X, Y, 0)
> >  *        g_foo(wibble)
> >  *     #else
> >  *        g_something_equivalent_in_older_glib(wibble);
> >  *     #endif
> >  * }
> >  *
> >  * The #pragma at the top of this file turns off -Wdeprecated-declarations,
> >  * ensuring this wrapper function impl doesn't trigger the compiler warning
> >  * about using too new glib APIs. Finally we can do
> >  *
> >  *   #define g_foo(a) g_foo_qemu(a)
> >  *
> >  * So now the code elsewhere in QEMU, which *does* have the
> >  * -Wdeprecated-declarations warning active, can call g_foo(...) as normal,
> >  * without generating warnings.
> >  */
> >
> > which is how g_unix_get_passwd_entry_qemu() is implemented.
> 
> Yet later we have qemu_g_test_slow following the style guide. Also I'm
> confused by the usage of g_unix_get_passwd_entry_qemu because the only
> place I see it in qga/commands-posix-ssh.c right before it does:
> 
> #define g_unix_get_passwd_entry_qemu(username, err) \
>    test_get_passwd_entry(username, err)

The g_unix_get_passwd_entry method is a bad example as it is
not following the guide for transparent replacement.

 > 
> although I think that only hold when the file is built with
> QGA_BUILD_UNIT_TEST.
> 
> > Should we reword the documentation first?
> 
> The original wording in glib-compat.h was added by Daniel in 2018 but
> the commit that added the password function comments:
> 
>   Since the fallback version is still unsafe, I would rather keep the
>   _qemu postfix, to make sure it's not being misused by mistake. When/if
>   necessary, we can implement a safer fallback and drop the _qemu suffix.
> 
> So if we are going to make a distinction between a qemu prefix and
> suffix we should agree that and add it to the style document.

The glibcompat.h header should only be used for cases where
we are doing transparent replacement such that callers continue
using the normal glib API name, and the suffix is a hidden
impl detail only seen in the header.

I think in that particular case we should have just had
'qemu_unix_get_passwd_entry' defined in a completely separate
place like osdep.c.

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
