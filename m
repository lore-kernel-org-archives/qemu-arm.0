Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp2830057ejs;
        Tue, 4 Jun 2024 02:59:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWJc+STCgUkUMiwZqnkY4TEvjIsEw4iB4R/BfBKYsxAFrT6tAtQRzA2+StwPispACIJhi8mX0lXjIIkpUvikHOrnZB3iUBp
X-Google-Smtp-Source: AGHT+IHEKvCzDYER8Kug/iVA8sBPcEblA96qAznlHyDV4RTz/HgSwqmwiD4rweEYBactzP+tnXTL
X-Received: by 2002:a05:690c:24a:b0:61b:9369:ef28 with SMTP id 00721157ae682-62c79674cbamr120417707b3.9.1717495181851;
        Tue, 04 Jun 2024 02:59:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717495181; cv=none;
        d=google.com; s=arc-20160816;
        b=rYJBokilxxtlqGI4dPzwxbPkEWC+ZqE3XIYJ5/cn9BCAkNMvrT4zuhTppoE3zDI6ap
         NQLIRGsoybhW3ZgROz5d2iaZrRWEzAcg1mhiFNabdLRra2wO33THw5BhXFZIYf647NJA
         FRUW3HymK2MkzepW0JbntzjiMpDku+Pjuuuwv2UNjJZzwgMwpixNoBS3FZMWa1ebSW6W
         NFOLoOyzuYEWPVLJwI695m/ayTc90XuxWWA5MN10Hsn0+Z/QlTyyO252AW/cl+S2TfU0
         xK70rqPJPD3NrDoTtL3nnJMMtBVgIvmVQ8LXEtfk4PyWQZxLa5Q4eCit9OxWGaABV9sL
         nPpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=zr2w9n2Is7vHKdf2DbFcB71ShJzhn42yXCEfGd2PB0M=;
        fh=QHhCo/cftrLHlZw3fC9Pme3mdpNEvkSnddu4B63gl7k=;
        b=T8AvLeJ1dE+47D6S5UuEY/PwNUuWprEPzhfoIVrvJBgTyL6OYjrRPOFeszgbhmSNg9
         ZFKXnnFSDVF5jSxczEGYkVMA8waRCkvuIkv9K7XspHxZvPdAR/GsrH4n5Kf3AMbxB8xM
         Fe1mpmLNtJ2yrPIZN7HcPascKxwxN+RHjsIlAFz589P9rlz1NK9kcgqnO+6qeeTflBr5
         92C9MU2gcjWhF3SLa0YtudCbK9TUtW2KcLiG1Usv6X2hHByI0MBjbnbHSb5f1MDtU6MN
         3hpRnAGZ26PCtpywOIHMohpEk7S2nioJwYXcZgz7LtlToo5w2Cxp/FC4ATWqPZwQ9LMn
         gRCA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=avl0GM1M;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ae4b4021c3si106277926d6.265.2024.06.04.02.59.41
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 02:59:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=avl0GM1M;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717495181;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zr2w9n2Is7vHKdf2DbFcB71ShJzhn42yXCEfGd2PB0M=;
	b=avl0GM1MY4ff3Ef3jZTj31fVGL22c6mABM7B6MDcT9YmLvV9FSmvXls798nNzCoy0n9I3V
	rENSsP//KnolUHePnpU2HNGVSiw370deA3NiF0brMoEsMOYUN6Dw0m5EKG6GCFq7C/BDWp
	Nm7ERxBIQe+BFE5tuJsnYkjRt+R11ag=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-543-izeoHxjwMSiEeMotBzjQ2Q-1; Tue,
 04 Jun 2024 05:59:39 -0400
X-MC-Unique: izeoHxjwMSiEeMotBzjQ2Q-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B725F1C0512B;
	Tue,  4 Jun 2024 09:59:38 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.51])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0F0AD111E417;
	Tue,  4 Jun 2024 09:59:33 +0000 (UTC)
Date: Tue, 4 Jun 2024 10:59:32 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Markus Armbruster <armbru@redhat.com>,
	"Dr. David Alan Gilbert" <dave@treblig.org>,
	Thomas Huth <thuth@redhat.com>, qemu-devel@nongnu.org,
	Cornelia Huck <cohuck@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	qemu-s390x@nongnu.org, devel@lists.libvirt.org,
	Eric Farman <farman@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Anton Johansson <anjo@rev.ng>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH 0/4] hw/s390x: Alias @dump-skeys -> @dump-s390-skey and
 deprecate
Message-ID: <Zl7lhF3kAAHptDty@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240530074544.25444-1-philmd@linaro.org>
 <cb4028fc-9596-47f3-9468-f8912dd48aed@redhat.com>
 <Zl20rAjHLJlZkwxE@redhat.com>
 <Zl4tgFuAdjU2bst6@gallifrey>
 <87y17lcni7.fsf@pond.sub.org>
 <fcb6ff5d-fcad-4eb1-9b64-0a8477954a0d@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <fcb6ff5d-fcad-4eb1-9b64-0a8477954a0d@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.3
X-TUID: Gtiuw8pVnqG2

On Tue, Jun 04, 2024 at 11:45:11AM +0200, Philippe Mathieu-Daudé wrote:
> Hi Daniel, Dave, Markus & Thomas.
> 
> On 4/6/24 06:58, Markus Armbruster wrote:
> > "Dr. David Alan Gilbert" <dave@treblig.org> writes:
> > > * Daniel P. Berrangé (berrange@redhat.com) wrote:
> > > > On Fri, May 31, 2024 at 06:47:45AM +0200, Thomas Huth wrote:
> > > > > On 30/05/2024 09.45, Philippe Mathieu-Daudé wrote:
> > > > > > We are trying to unify all qemu-system-FOO to a single binary.
> > > > > > In order to do that we need to remove QAPI target specific code.
> > > > > > 
> > > > > > @dump-skeys is only available on qemu-system-s390x. This series
> > > > > > rename it as @dump-s390-skey, making it available on other
> > > > > > binaries. We take care of backward compatibility via deprecation.
> > > > > > 
> > > > > > Philippe Mathieu-Daudé (4):
> > > > > >     hw/s390x: Introduce the @dump-s390-skeys QMP command
> > > > > >     hw/s390x: Introduce the 'dump_s390_skeys' HMP command
> > > > > >     hw/s390x: Deprecate the HMP 'dump_skeys' command
> > > > > >     hw/s390x: Deprecate the QMP @dump-skeys command
> > > > > 
> > > > > Why do we have to rename the command? Just for the sake of it? I think
> > > > > renaming HMP commands is maybe ok, but breaking the API in QMP is something
> > > > > you should consider twice.
> 
> I'm looking at how to include this command in the new "single binary".
> 
> Markus explained in an earlier series, just expanding this command as
> stub to targets that don't implement it is not backward compatible and
> breaks QMP introspection. Currently on s390x we get a result, on other
> targets the command doesn't exist. If we add a stubs, then other targets
> return something (even if it is an empty list), confusing management
> interface.

I'm not convinced about calling this "not backward compatible".

We're always free to add new commands, and there's never any
guarantee that you can execute a given command under every
possible QEMU configuration.

IOW, adding 'dump-skeys' and having it always return an error
on non-s390x targets is valid IMHO, and I wouldn't call that
a backwards compatibilit problem.

Apps shouldn't assume that just because a command is reported
in introspection, it can be used in any scenario. An app is
expected to itself understand the behaviour of any given command
sufficiently well, to know when they can execute it, or be prpared
to accept errors.

> > PRO rename: the command's tie to S390 is them immediately obvious, which
> > may be useful when the command becomes available in qemu-systems capable
> > of running other targets.
> > 
> > CON rename: users need to adapt.
> > 
> > What are the users?  Not libvirt, as far as I can tell.
> 
> Years ago we said, "all HMP must be based on QMP". Now we realize HMP
> became stable because QMP-exposed, although not consumed externally...

That's not the case though. We've added plenty of conversions of
HMP to QMP, while declaring them unstable. We might have missed
that in some cases, but that's just a bug, and we can fix that
any time by adding the 'unstable' feature tag to the schema.

> Does the concept of "internal QMP commands" makes sense for HMP debug
> ones? (Looking at a way to not expose them). We could use the "x-"
> prefix to not care about stable / backward compat, but what is the point
> of exposing to QMP commands that will never be accessed there?

Debug only, unstable commands are totally valid for QMP. There's nothing
that requires them to be inherantly HMP only.

QAPI modelling can benefit many debug only, unstable commands, but we
can also still just return printf formatted strings as documented here:

  https://www.qemu.org/docs/master/devel/writing-monitor-commands.html#writing-a-debugging-aid-returning-unstructured-text


I remain convinced that we should eventually delete the HMP impl as it
exists today, and just provide a QMP client whose interactive interface
matches what HMP provides today. There's no compelling need for HMP to
run inside QEMU, if QMP exposes all the required functionality.

> > docs/devel/qapi-code-gen.rst:
> > 
> >      Names beginning with ``x-`` used to signify "experimental".  This
> >      convention has been replaced by special feature "unstable".
> > 
> > Feature "unstable" is what makes something unstable, and is what
> > machines should check.
> 
> What I mentioned earlier could be 'Feature "internal" or "debug"'.

IMHO we don't need to invent new terms for this.

"unstable" is sufficient as it expresses that the command's
inputs and outputs are liable to change their format, which
is the case for most of the historical debug only commands.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
