Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp962477ejc;
        Fri, 3 Mar 2023 03:39:18 -0800 (PST)
X-Google-Smtp-Source: AK7set9LBcvyELuBy8qEgOSaXdb3Nhs8nFAmorYablcqZTY1pQSmQYtOIE8WxvnSCSeHi4KDhQot
X-Received: by 2002:a17:906:9252:b0:8b2:23fb:dfd9 with SMTP id c18-20020a170906925200b008b223fbdfd9mr1395532ejx.39.1677843558337;
        Fri, 03 Mar 2023 03:39:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677843558; cv=none;
        d=google.com; s=arc-20160816;
        b=R98QVE8iNFopsIM/xeVHvHsNW2CNsLt2FSVGruBbIc0yTDY5Vwnm9Pit1QisUsLT2j
         L1ybNZdsgkJeugKewQ2HB36tdmo3cFl+La/lxGX9bF34Txso0NIgolqS7C3tN5FUaiA+
         1Z9KDTUjSPTP5l1PJUFg7xZ3C9VKfs0bNxy69NriSbMkkO8OjI6y6h/n5oe3eM9uUEpz
         2wo8motNZYhFRuJV42mtWgcAIfhAmGjQwxEdgsdVa86H8gCcmL6/3rUZgKCyC1/XlKe1
         gFTEsqUlchMUyyWeguXAhHjbrM/92Ct5QGTKmJSreTZTywcjR37yW6XnSVZQ5omHm0OD
         ZANw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :reply-to:message-id:subject:cc:to:from:date:dkim-signature;
        bh=Sexof3CaldIYpbgHhQFfPYuNh/PjDrWj3k12Gp1hVDo=;
        b=s4yOtP39vIEUVsedwaJ51xUa6GXmd/pca5C58Ed4yiEvbY0WRov1H8cdhFnWzYjrPh
         g9kKL7IjfUsTiRrDFD+EWeGR+ky3XGC8grgGFldv7VKBP4P6ecjE3nRXBTr7X8y1BiUZ
         OjeU3dFCXDDmaXCHjS+gJfHe7JlNIC6u6A+3tcptj98TZTAhEC56LBbCR0AP/xCEcLpg
         SPfyo5nejwgZLRlQlthZAQPx3tV9UADEbTvInGMz5JMUO8MVMR7Xvn/HmtYsU4LwbWUn
         FN6lqxWKS7/BXXDkhQRw6nZ98nfS8OWipX6XwTka4TU7czFP9F7CKG7zAnr/g7P1eLK3
         ABOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gfnbDeFS;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id u12-20020aa7d0cc000000b004acbe0bbe12si2394855edo.2.2023.03.03.03.39.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 03:39:18 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gfnbDeFS;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677843557;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=Sexof3CaldIYpbgHhQFfPYuNh/PjDrWj3k12Gp1hVDo=;
	b=gfnbDeFS/1h7xrKmbd7CdcCsbxZwXVvujI8mcjHXvfHTPf05x4gvLOYJr9u6iwdl9rme2n
	y4H+JqDEazLxMF6mKEl8cBPWAuDTXrsFH17dc6+0Q1nu8SgTIjAnbcfjfyXvn3sdZ0pqvA
	UdJOZeLNJEn/wErEynup7KMEU0IlkU0=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-374-7_OlWQwlO0GNqGzgpw94mw-1; Fri, 03 Mar 2023 06:39:15 -0500
X-MC-Unique: 7_OlWQwlO0GNqGzgpw94mw-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5BA9B29AA3B0;
	Fri,  3 Mar 2023 11:39:15 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.53])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id E45B6140EBF4;
	Fri,  3 Mar 2023 11:39:11 +0000 (UTC)
Date: Fri, 3 Mar 2023 11:39:09 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>
Subject: Re: [PATCH v2 4/6] docs/about/deprecated: Deprecate the
 qemu-system-arm binary
Message-ID: <ZAHcXUvAKFHeJiM7@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-5-thuth@redhat.com>
 <CAFEAcA8JZqKnSN98PoO684zS1ZADj_KkaWO2QMk3w9uXk2cdMg@mail.gmail.com>
 <4e6512e4-b159-cbe2-5f74-89fab25208e6@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <4e6512e4-b159-cbe2-5f74-89fab25208e6@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: W549PA+h5x+h

On Fri, Mar 03, 2023 at 12:31:42PM +0100, Thomas Huth wrote:
> On 03/03/2023 12.16, Peter Maydell wrote:
> > On Thu, 2 Mar 2023 at 16:31, Thomas Huth <thuth@redhat.com> wrote:
> > > 
> > > qemu-system-aarch64 is a proper superset of qemu-system-arm,
> > > and the latter was mainly still required for 32-bit KVM support.
> > > But this 32-bit KVM arm support has been dropped in the Linux
> > > kernel a couple of years ago already, so we don't really need
> > > qemu-system-arm anymore, thus deprecated it now.
> > > 
> > > Signed-off-by: Thomas Huth <thuth@redhat.com>
> > > ---
> > >   docs/about/deprecated.rst | 10 ++++++++++
> > >   1 file changed, 10 insertions(+)
> > > 
> > > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > > index a30aa8dfdf..21ce70b5c9 100644
> > > --- a/docs/about/deprecated.rst
> > > +++ b/docs/about/deprecated.rst
> > > @@ -45,6 +45,16 @@ run 32-bit guests by selecting a 32-bit CPU model, including KVM support
> > >   on x86_64 hosts. Thus users are recommended to reconfigure their systems
> > >   to use the ``qemu-system-x86_64`` binary instead.
> > > 
> > > +``qemu-system-arm`` binary (since 8.0)
> > > +''''''''''''''''''''''''''''''''''''''
> > > +
> > > +``qemu-system-aarch64`` is a proper superset of ``qemu-system-arm``.
> > 
> > I think this is not quite true -- at the moment if you want
> > "every feature we implement, 32-bit" the only way to get
> > that is 'qemu-system-arm -cpu max'. The '-cpu max' on
> > qemu-system-aarch64 is 64-bit, and we don't implement for TCG
> > the "-cpu max,aarch64=off" syntax that we do for KVM that would
> > let the user say "no 64-bit support".
> 
> Ok ... so what does that mean now? ... can we continue with this patch, e.g.
> after rephrasing the text a little bit, or do we need to implement "-cpu
> max,aarch64=off" for TCG first?

I think we need to have a way to request the max 32-bit CPU before we
deprecate, because deprecation has to tell people what they should use
instead.

For qemu-system-i686 -cpu max, I guess we have lm=off to hide the 64-bit
support, so that's OK from QEMU POV, but will need libvirt enhancement
as I don't think we've taken that into account.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
