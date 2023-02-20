Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2401521ejb;
        Mon, 20 Feb 2023 07:59:12 -0800 (PST)
X-Google-Smtp-Source: AK7set8AGRHqA6w95Sc7BdMZSeRjIsnFEyj4dC5Fu9dDE5ywGOG6tsZ9N96DVGgRQMLuniEV6FfN
X-Received: by 2002:ad4:5ecc:0:b0:537:7bd7:29d4 with SMTP id jm12-20020ad45ecc000000b005377bd729d4mr1334097qvb.47.1676908752142;
        Mon, 20 Feb 2023 07:59:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676908752; cv=none;
        d=google.com; s=arc-20160816;
        b=V4m8yp5I+o8kHWiYYuLeADPaM3Jsh5CvgDJ+4aNsb6sOix3qLfh3Z25mGPHn/sSHmu
         2Oa07gYRozqWuUOXqZUsI53fa7hlIaDMJSiFGycfqrRMsDmyCYyk4sKhySR+r6oBhFWF
         PWGsXPgedfodLAz/2t/blInE6ctw1uxY/e5QL5xUkkYvWhHB5E48YQRfZ8JwI60UtBF2
         qeYhxSK5PVM1V0pUx9ubZ9/wGgx0JaWo4extuoA/uBiTIN/pB2WGd+TDJ129xfSo4ipM
         qGCxKbAjVNuQzxs0++SufFsAwVidtlKE48p714Eq6leT5jFKFxsvzGJjAsaRs+TcCufA
         3RQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=r+QivS3Lqe/QkJCdSJdyeSwwLozBpa5YCEg+swkfxas=;
        b=tvMljBlvpPiQ2COrSIqiI2XcHgTeu2RNxhA92TfcC7NN660KpCu5fV3fJtH9vGEGOt
         bmbtW1oQbxE2etH+gS4v8n1NgM/DXAYvS/pHbTEibpQwoeMGHDQi2aOKUkptdKnYwk2N
         XYCZCV5WWYv+THlBtPfXsbqnZ0oI9y3V4OJexwMmwNxmgzKigxvOwAbS/x4y4On4iY8n
         UpxBVO8Y00c18tCJFJiM140T6vzUCvQeGy8deDBwJRaQA+PsRDnuHgOMEcOma97EJuHg
         4afHxjmLJvtP/GEI80G4y9FN+vQ2SRQtJcYXTpcPirOWkMHY6znItbjoVGbDpvfWJVd+
         vn8Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="B+2uT/Ru";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1-20020a0cb341000000b0056eb049a789si10243061qvf.162.2023.02.20.07.59.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 07:59:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="B+2uT/Ru";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU8Yr-0001QV-4J; Mon, 20 Feb 2023 10:58:41 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pU8Yp-0001Q2-Ew
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 10:58:39 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1pU8Yn-0004yd-Fo
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 10:58:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1676908716;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=r+QivS3Lqe/QkJCdSJdyeSwwLozBpa5YCEg+swkfxas=;
 b=B+2uT/RuYFNxMArukG6QwIC4OWqUbqgEOZ+d/5bnOFJC/8QXoy56hNVMeX9m0qRwbzWCfW
 7cETweeXywQ8bl/1ZNWOsoeti6TY9ChZOpPle3UCfvJJKLfZOnktJi9pfHfZmevUG9vy+x
 TRoSqKrPYmmt1f6lCx1+FdQA9daWP+A=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-660-mbhaKUzHOz2Qq4fMqgvwnA-1; Mon, 20 Feb 2023 10:58:34 -0500
X-MC-Unique: mbhaKUzHOz2Qq4fMqgvwnA-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com
 [10.11.54.6])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 68B5518E0044;
 Mon, 20 Feb 2023 15:58:34 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.52])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 598D02166B26;
 Mon, 20 Feb 2023 15:58:32 +0000 (UTC)
Date: Mon, 20 Feb 2023 15:58:28 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Stefan Weil <sw@weilnetz.de>, Paolo Bonzini <pbonzini@redhat.com>,
 Joel Stanley <joel@jms.id.au>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Stefan Berger <stefanb@linux.vnet.ibm.com>
Subject: Re: [PATCH 3/4] win32: stop mixing SOCKET and file descriptor space
Message-ID: <Y/OYpB9AAeytSPMP@redhat.com>
References: <20230212204942.1905959-1-marcandre.lureau@redhat.com>
 <20230212204942.1905959-4-marcandre.lureau@redhat.com>
 <87r0ukbjfp.fsf@pond.sub.org>
 <CAMxuvaxiN1jYr70k2yK0CUSjo4UQF8DqjPX_COvCdtAWhf3zNw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMxuvaxiN1jYr70k2yK0CUSjo4UQF8DqjPX_COvCdtAWhf3zNw@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: y0Ro1iErPFaW

On Mon, Feb 20, 2023 at 07:29:11PM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Mon, Feb 20, 2023 at 4:38 PM Markus Armbruster <armbru@redhat.com> wrote:
> 
> > marcandre.lureau@redhat.com writes:
> >
> > > From: Marc-André Lureau <marcandre.lureau@redhat.com>
> > >
> > > Until now, a win32 SOCKET handle is often cast to an int file
> > > descriptor, as this is what other OS use for sockets.


> > > @@ -275,15 +276,21 @@ GSource *qio_channel_create_fd_watch(QIOChannel
> > *ioc,
> > >
> > >  #ifdef CONFIG_WIN32
> > >  GSource *qio_channel_create_socket_watch(QIOChannel *ioc,
> > > -                                         int socket,
> > > +                                         int sockfd,
> > >                                           GIOCondition condition)
> > >  {
> > > +    SOCKET s = _get_osfhandle(sockfd);
> >
> > _get_osfhandle() returns a HANDLE as intptr_t.  Is a HANDLE that refers
> > to a socket also a SOCKET?  The docs I found so far are confusing...
> >
> 
> yes
> 
> 
> >
> > >      GSource *source;
> > >      QIOChannelSocketSource *ssource;
> > >
> > > -    WSAEventSelect(socket, ioc->event,
> > > -                   FD_READ | FD_ACCEPT | FD_CLOSE |
> > > -                   FD_CONNECT | FD_WRITE | FD_OOB);
> > > +    if (s == -1 ||
> > > +        WSAEventSelect(s, ioc->event,
> > > +                       FD_READ | FD_ACCEPT | FD_CLOSE |
> > > +                       FD_CONNECT | FD_WRITE | FD_OOB) == SOCKET_ERROR)
> > {
> > > +        g_autofree gchar *emsg = g_win32_error_message(GetLastError());
> > > +        error_printf("error creating socket watch: %s", emsg);
> >
> > Uh, why is printing an error appropriate here?  Shouldn't we leave error
> > handling to callers?
> >
> 
> We could, but we would have to modify callers as well, which can go deep. I
> am considering a &error_warn as a first approach (I am working on something
> to check other WSA API users). Does that sound reasonable?

The caller should also be handling 'NULL' as a return value, as none
of them expect that. They just carry on calling g_source APIs. "Luckily"
glib turns them all into no-ops, so it won't crash, but it also means
the backend is likelyto be non-functional since events won't be
processed.

It isn't clear that there's much of value that a caller can do when it
gets a NULL source either. The context in wich we call this API does
not have error propagation either and its non-trival to add in many
of the callers.

Feels like the realistic choice is between a error_report or an
assert/abort, whether in this method or the caller doesn't make
all that much difference.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

