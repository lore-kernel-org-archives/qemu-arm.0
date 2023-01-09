Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp2186294ejc;
        Mon, 9 Jan 2023 03:55:24 -0800 (PST)
X-Google-Smtp-Source: AMrXdXskbXXsZ1Nm1436BsgsUOhKQY3zdrBFkfk7EMFRz4ixkLqLXs/d7rLIxbc+n5CHp38mpd0Z
X-Received: by 2002:ac8:7eeb:0:b0:3a9:7faf:d635 with SMTP id r11-20020ac87eeb000000b003a97fafd635mr81887025qtc.1.1673265324353;
        Mon, 09 Jan 2023 03:55:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673265324; cv=none;
        d=google.com; s=arc-20160816;
        b=pwKeQmPx3cmx+gMD/hq8vF+6/FxPGs09EdJOhOp7ETzCEWrWlXIsrLpB9RVWJaqHd0
         Ghiq8030ZP6JQa4j92Shel9zWDeluajZVez2Tg8kQBcx6Wn0a6DqbL+1MUr9Omu+aXp+
         6CalhlkThUzTTMMza3235dDKHKRZeafh6E0laIgFqKSFgSYFqo4CEuw3nmEgJywRgQtr
         W2kOf/le33T+hc159hQwHFeQHRSrpWr8Dtq77n4H0H+JJn3GisP1uPGUp1O0UnY3+S8L
         pDPr/O3PSXMshZtNOEYDDFZ3HbXk1Ej2Gr8DulbdeAQ0q512gVgEANgcUvg5QWlt8T0s
         mk+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=2Bax02BSkvxaOEt2CRhklLybKGV/xR8mYNLZmlYBdyg=;
        b=l/QUE0/fJCBohx0gI7+zUPpogkSBK+ZPZD6UKbTJQylRsjJQ1CETKAAd/UAKGeTTDZ
         CFCj9pRRJ71M7TI5M9Pbtz/6C2KS9nKUFPCdB53lQEmk+OvY0ypruFc/UhKkPiSPO89E
         TPLIcgMGm+ZF8S9/u4uVYj+OCjaIjiKXPbWyQW66qLdj9CKe72ofvcu+OZ3ysWBX3BLk
         ynM1dFvwdHyNCnz/G7haW42hiUAprb7jZ3OiwzDZKnqxxA0HIIrFnVxwx1eDm4F8XFJ6
         /SytJ82RW7vboApFhnzFR17E570j4DiWjsYiAYmFGo0UNVf/dJOVNTkkQKM/XhazNpc+
         QtCg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QS77c2cz;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id u13-20020ac8750d000000b003ab73b7bb06si4287597qtq.488.2023.01.09.03.55.24
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Jan 2023 03:55:24 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QS77c2cz;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1673265323;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2Bax02BSkvxaOEt2CRhklLybKGV/xR8mYNLZmlYBdyg=;
	b=QS77c2czxIRSQ9wBE/h6QW+Pjbo38CNjNogufnQ08TKMcuCjbcLWA66zhk9szUXTSsGZ0S
	0wvlWGDHVWtKV1vadfA6dSJqQhndNfSIcMZmVW7vl2iou0oYngw660XEFsOgUb69Ci/4sI
	deNLChVTqVzJjuJNzr1kzE612P2nWBg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-496-1tSs-3KtOzSxT7itYk1Mjw-1; Mon, 09 Jan 2023 06:55:20 -0500
X-MC-Unique: 1tSs-3KtOzSxT7itYk1Mjw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E5B4C858F0E;
	Mon,  9 Jan 2023 11:55:19 +0000 (UTC)
Received: from redhat.com (unknown [10.33.37.5])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 51B4D2026D4B;
	Mon,  9 Jan 2023 11:55:07 +0000 (UTC)
Date: Mon, 9 Jan 2023 11:55:00 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, "Dr. David Alan Gilbert" <dgilbert@redhat.com>,
	qemu-ppc@nongnu.org, xen-devel@lists.xenproject.org,
	Laurent Vivier <lvivier@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	virtio-fs@redhat.com, Michael Roth <michael.roth@amd.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-block@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	qemu-arm@nongnu.org, Paul Durrant <paul@xen.org>,
	Anthony Perard <anthony.perard@citrix.com>,
	David Gibson <david@gibson.dropbear.id.au>,
	=?utf-8?Q?C=C3=A9dric?= Le Goater <clg@kaod.org>,
	John Snow <jsnow@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Gerd Hoffmann <kraxel@redhat.com>, Greg Kurz <groug@kaod.org>
Subject: Re: [PATCH 5/6] tests: add G_GNUC_PRINTF for various functions
Message-ID: <Y7wAlHEIafbNzsdf@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20221219130205.687815-1-berrange@redhat.com>
 <20221219130205.687815-6-berrange@redhat.com>
 <27da4d93-38e6-1c40-4a60-92f3343f380f@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <27da4d93-38e6-1c40-4a60-92f3343f380f@redhat.com>
User-Agent: Mutt/2.2.7 (2022-08-07)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-TUID: KqTMipgrNKL3

On Thu, Dec 29, 2022 at 10:34:55AM +0100, Thomas Huth wrote:
> On 19/12/2022 14.02, Daniel P. Berrangé wrote:
> > Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> > ---
> >   tests/qtest/ahci-test.c           |  3 +++
> >   tests/qtest/arm-cpu-features.c    |  1 +
> >   tests/qtest/erst-test.c           |  2 +-
> >   tests/qtest/ide-test.c            |  3 ++-
> >   tests/qtest/ivshmem-test.c        |  4 ++--
> >   tests/qtest/libqmp.c              |  2 +-
> >   tests/qtest/libqos/libqos-pc.h    |  6 ++++--
> >   tests/qtest/libqos/libqos-spapr.h |  6 ++++--
> >   tests/qtest/libqos/libqos.h       |  6 ++++--
> >   tests/qtest/libqos/virtio-9p.c    |  1 +
> >   tests/qtest/migration-helpers.h   |  1 +
> >   tests/qtest/rtas-test.c           |  2 +-
> >   tests/qtest/usb-hcd-uhci-test.c   |  4 ++--
> >   tests/unit/test-qmp-cmds.c        | 13 +++++++++----
> >   14 files changed, 36 insertions(+), 18 deletions(-)
> ...
> > diff --git a/tests/unit/test-qmp-cmds.c b/tests/unit/test-qmp-cmds.c
> > index 2373cd64cb..6d52b4e5d8 100644
> > --- a/tests/unit/test-qmp-cmds.c
> > +++ b/tests/unit/test-qmp-cmds.c
> > @@ -138,6 +138,7 @@ void qmp___org_qemu_x_command(__org_qemu_x_EnumList *a,
> >   }
> > +G_GNUC_PRINTF(2, 3)
> >   static QObject *do_qmp_dispatch(bool allow_oob, const char *template, ...)
> >   {
> >       va_list ap;
> > @@ -160,6 +161,7 @@ static QObject *do_qmp_dispatch(bool allow_oob, const char *template, ...)
> >       return ret;
> >   }
> > +G_GNUC_PRINTF(3, 4)
> >   static void do_qmp_dispatch_error(bool allow_oob, ErrorClass cls,
> >                                     const char *template, ...)
> >   {
> > @@ -269,7 +271,7 @@ static void test_dispatch_cmd_io(void)
> >   static void test_dispatch_cmd_deprecated(void)
> >   {
> > -    const char *cmd = "{ 'execute': 'test-command-features1' }";
> > +    #define cmd "{ 'execute': 'test-command-features1' }"
> >       QDict *ret;
> 
> That looks weird, why is this required?

This means that the compiler can see we're passing a constant string
into the API call a few lines lower. Without it, the compiler can't
see that 'cmd' doesn't contain any printf format specifiers, and thus
it would force us to use  func('%s', cmd)... except that's not actually
possible since our crazy json printf formatter doesn't allow arbitrary
'%s', the '%s' can only occur at well defined points in the JSON doc.

Using a constant string via #define was the easiest way to give the
compiler visibility of the safety.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
