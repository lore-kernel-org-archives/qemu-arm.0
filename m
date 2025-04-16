Received: by 2002:a17:504:14cd:b0:1be9:327d:8ee3 with SMTP id g13csp3202558njc;
        Wed, 16 Apr 2025 02:12:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVCJZ3eKhheHvGzYZGeVtDavMDePIAoLFSVRx60G38TzSCwyTzaLGh3N+sFc/vzMS+OWAH+2EpWHUaf/A==@linaro.org
X-Google-Smtp-Source: AGHT+IHBb+7pQYKT+RXLrw1WIA68JQYl7hXZCSy1Kbs+dyHsYaEkCm8qkbhU1IojmuE+fzDMP4mv
X-Received: by 2002:a05:6902:15c5:b0:e6e:195d:406b with SMTP id 3f1490d57ef6-e727598a2fbmr1400444276.28.1744794765596;
        Wed, 16 Apr 2025 02:12:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1744794765; cv=none;
        d=google.com; s=arc-20240605;
        b=bGBTEyQzIxABTVOuZnZrIJSanD+uaBpEWCiqMDI/ZfOberqdBrYkWxY1Zq06BtyMB0
         7rTeMU1Pl4a6cfikKe3CqqDqdva0uZ1/TWR4iMQfiMaeXTztI2Rib9TfceMyx7P0A55U
         3Q4mz3cTNmARwJAqZx3+rqFKR3dcCq8r4nahJMlZky+nhWoTj5Q4sR99yNFtGOJ46shL
         K83NggyFX8AeAH86fVq+lQYhoVcJjmq48YPMElEbxRqhtUvCy/r2N7pqMx1bUEAMa8ok
         4ma9TxdoAploS7lAiNSbhfmPbQkeJBJNfq4CQJ0LPDCXIxGjOnFfNgzYXfK+BeBCjxrD
         TVMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=NRkPwzwUr2ZRm9OT5a1JiPbtfsT1DAMR2Iob30hjX4M=;
        fh=UShjZqrrDK42PKAzXjL/tCNRJ8rN9jlMNSjlGvmASGA=;
        b=G76o86NmHQucaUpaGEHap1zWNwtcOwOc80CTuRgKkpXsaABg5HI7pmaZ0uOpCzJk1z
         7cDLJGq6SutekF7sHPyx1pNfs/cHnQTErXBL28+TW+lqHutyUbhcQOvdovLzSl7s4R9Y
         oMfoq/hIjKGR++zvg1x1OOXgkXLhRWB7AWwYehrkYIiQjsjqm9n3/A3Bp9hjIsIb611t
         WaHi1Jrt1DG0MC4dQW3v6vzxxm02CnkWBX4oAz0K98KHfL5Gdx4EBtcawZO+q6CEIvdI
         0tDDVsblkoddx7oB11XTHc6zB2A8PvY9f6bYqKyHdhNFJ3i+0Ll44hal22Pj2OzBtlJ1
         ytNg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gg3JANQ0;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 3f1490d57ef6-e70a6d44e15si2848212276.395.2025.04.16.02.12.45
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 02:12:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=gg3JANQ0;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744794765;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NRkPwzwUr2ZRm9OT5a1JiPbtfsT1DAMR2Iob30hjX4M=;
	b=gg3JANQ0mKioUSw0fmnd9or5FonnZPPo94YOjrchYXTTLsvbkNZ7iwGCHYpLZZX1OB76Zc
	kTGOyXdwafoIOSEh8z1f6QOTNXIV6LfN0UOThxNAMYHkx//V33Z/hH2SnEqAA8l4EWhlpI
	unCb7xvAjstrZA9h27jmcEmf20HdYXQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-ugVE9C-sPe25fbUS6G-e-w-1; Wed,
 16 Apr 2025 05:12:41 -0400
X-MC-Unique: ugVE9C-sPe25fbUS6G-e-w-1
X-Mimecast-MFC-AGG-ID: ugVE9C-sPe25fbUS6G-e-w_1744794759
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 25A581828AA8;
	Wed, 16 Apr 2025 09:12:26 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.58])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 988B01954B05;
	Wed, 16 Apr 2025 09:12:14 +0000 (UTC)
Date: Wed, 16 Apr 2025 10:12:10 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Kohei Tokunaga <ktokunaga.mail@gmail.com>,
	qemu-devel <qemu-devel@nongnu.org>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Hanna Reitz <hreitz@redhat.com>,
	Alexandre Iooss <erdnaxe@crans.org>,
	Mahmoud Mandour <ma.mandourr@gmail.com>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Pavel Pisa <pisa@cmp.felk.cvut.cz>,
	Francisco Iglesias <francisco.iglesias@amd.com>,
	Vikram Garhwal <vikram.garhwal@bytedance.com>,
	Jason Wang <jasowang@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Zhao Liu <zhao1.liu@intel.com>, Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	"open list:Block layer core" <qemu-block@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	"zmta06.collab.prod.int.phx2.redhat.com, list@suse.de" <qemu-ppc@nongnu.org>,
	qemu-s390x <qemu-s390x@nongnu.org>
Subject: Re: [PATCH 01/19] hw/core/loader.c: Fix type conflict of GLib
 function pointers
Message-ID: <Z_90aqNE74sonn8O@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <cover.1744787186.git.ktokunaga.mail@gmail.com>
 <44e9ef95ea6e8aa33560ca8580db0033623f0e91.1744787186.git.ktokunaga.mail@gmail.com>
 <Z_9qIQhjsI5zOwXA@redhat.com>
 <CABgObfaj0ycyc2jVSJEVvQJ1m+uLf=_HYiOafn2MECgU36aspw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABgObfaj0ycyc2jVSJEVvQJ1m+uLf=_HYiOafn2MECgU36aspw@mail.gmail.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: IWDRZPiw8Fh3

On Wed, Apr 16, 2025 at 11:00:37AM +0200, Paolo Bonzini wrote:
> Il mer 16 apr 2025, 10:29 Daniel P. Berrangé <berrange@redhat.com> ha
> scritto:
> 
> > > -    secs = g_list_sort(secs, sort_secs);
> > > +    secs = g_list_sort_with_data(secs, sort_secs, NULL);
> >
> > I don't see what the problem is with the original code.
> >
> > The commit message says we have a bad function cast, but the original
> > method decl is
> >
> >   GList *g_list_sort(GList*list, GCompareFunc compare_func);
> >
> > where the callback is
> >
> >    typedef gint (*GCompareFunc)(gconstpointer a, gconstpointer b);
> >
> > Our code complies with that GCompareFunc signature.
> >
> 
> The cast is inside glib; g_list_sort casts the function pointer and calls
> g_list_sort_with_data.

Sigh, the commit message should have said that, as it reads like the
problem is in QEMU code, not glib code.

> I suggested this solution to Kohei because it's easy to check that we're
> converting all users and not introducing new ones in the future (see
> poisoning in patch 10).

It is easy to check this /one/ example, but this pattern of bad casts
is typical in glib with likely many more examples, so avoidance in this
way does not feel like a sustainable long term strategy to me.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
