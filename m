Received: by 2002:ac2:5544:0:0:0:0:0 with SMTP id l4csp34418lfk;
        Mon, 8 Nov 2021 01:24:35 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxHfLhn3Dta+78JAFeWrmXnkVMJKRiS5CjDOF+qEyXGYrYw8jpubnhCaP+6e45Sv7ZB8ZBq
X-Received: by 2002:a05:6102:c4b:: with SMTP id y11mr64220721vss.48.1636363474938;
        Mon, 08 Nov 2021 01:24:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1636363474; cv=none;
        d=google.com; s=arc-20160816;
        b=QJ3W68mS0A//gJknDQE2KUUN0T6X10HF9mfp9HZmwdnhGu71/zDmHQP+ZUTnMSHLRV
         4u+Ro3oKlbrZ5d+CiVT5hCPZrr8sZo21e2SWxD+yU/2yq3/1cRxatxXCAr3bFIgEJGPl
         5cFTAKTZCupqE1LASyF26DbZZGpo7l0gBP8kZWExa99enZQKhJ5IeXS1Ssr/gmzzWt0e
         xmGbLyJ3Cp3X7oC8uODorl0aYKK1N7rCmKr0U+IIwXI357SCMjLa5flfodMrbIEYoKlG
         8Dl9wRcnBxBWVGFv4C4GtSGTI2CYEz4mrPCpyb5c1J4iRM6WIjiMYISs9eO3oNCGJJBg
         49UA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=BHOosZ2kMKUQ4jEgih1lEA03JC3f7ooM35j2w8GgmWw=;
        b=slkcOEFSi09BvSnjH/r0/4KJpdNAgkxSow0oIQRlDJM9pvwbqf3VEX1+/KRadmgdp7
         0BamuJipVXcWOdDiODbX1v9zKdkATBF0+SDfvSQbZLc7npTyLMwUv2yVTGN99APb8GGr
         zCa5rQAcevC0ltAJeNAx+MPjA0wnXhxaN8suNgO0MPCa6F6V+XeO1Cv8sCR7YhiLrzgE
         wIaJJYFm5DsjEwXBsTrqfcoeLqQFSPWBLVd/LKyAblhvC2j/WjnnkNmQfetvXgojDfGb
         QpR9tlRDvKVqBg8dztd957kfGdwpTm+ibY6yhGWmYHtHcXgoQIxHzdj5GTtSGK8A5r70
         yJYA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J23GCfSC;
       spf=pass (google.com: domain of berrange@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id m8si30155644vsg.263.2021.11.08.01.24.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Nov 2021 01:24:34 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=J23GCfSC;
       spf=pass (google.com: domain of berrange@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1636363474;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BHOosZ2kMKUQ4jEgih1lEA03JC3f7ooM35j2w8GgmWw=;
	b=J23GCfSCIShI92lyQ4U0+DAgdItqa6c7aDL+tvfRIRd8vBYxxEhOQFvPOsdwdihjVR7QQ2
	qycspTIfiL5vRRzYkYzSOXYIVpaGzgHHAbg/BxqgcrkSpaymSxpaJCV5Inn5YuyF4M+QXq
	1uF4jun8o5gdI6gcGgv1qUa/UobQWzI=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-573-YlsiA1RyPFeXY8ZDj988Ug-1; Mon, 08 Nov 2021 04:24:33 -0500
X-MC-Unique: YlsiA1RyPFeXY8ZDj988Ug-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 34BFA804142;
	Mon,  8 Nov 2021 09:24:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.176])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B45960BE5;
	Mon,  8 Nov 2021 09:24:16 +0000 (UTC)
Date: Mon, 8 Nov 2021 09:24:13 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Willian Rampazzo <willianr@redhat.com>, qemu-devel@nongnu.org,
	Michael Rolnik <mrolnik@gmail.com>,
	Niek Linnenbank <nieklinnenbank@gmail.com>,
	=?utf-8?B?SGVydsOp?= Poussineau <hpoussin@reactos.org>,
	John Snow <jsnow@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <f4bug@amsat.org>,
	qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
	Cleber Rosa <crosa@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, libvir-list@redhat.com,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Subject: Re: [PATCH v2 1/2] tests/acceptance: introduce new check-avocado
 tartget
Message-ID: <YYjsvY3W27a1jUCD@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20211105155354.154864-1-willianr@redhat.com>
 <20211105155354.154864-2-willianr@redhat.com>
 <e7d8e96b-cfca-c41f-257c-a70cb899ca9a@redhat.com>
MIME-Version: 1.0
In-Reply-To: <e7d8e96b-cfca-c41f-257c-a70cb899ca9a@redhat.com>
User-Agent: Mutt/2.0.7 (2021-05-04)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: LUZBV241V5C7

On Mon, Nov 08, 2021 at 08:59:51AM +0100, Thomas Huth wrote:
> On 05/11/2021 16.53, Willian Rampazzo wrote:
> > This introduces a new `make` target, `check-avocado`, and adds a
> > deprecation message about the `check-acceptance` target. This is
> > a preparation for renaming the `tests/acceptance` folder to
> >   `tests/avocado`.
> > 
> > The plan is to remove the call to the `check-avocado` target one
> > or two months after the release and leave the warning to force
> > people to move to the new `check-avocado` target.
> > 
> > Later, the `check-acceptance` target can be removed. The intent
> > is to avoid a direct impact during the current soft freeze.
> > 
> > Suggested-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> > Signed-off-by: Willian Rampazzo <willianr@redhat.com>
> > ---
> >   docs/about/deprecated.rst | 13 +++++++++++++
> >   tests/Makefile.include    | 17 ++++++++++++-----
> >   2 files changed, 25 insertions(+), 5 deletions(-)
> > 
> > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > index 56f9ad15ab..7bf8da8325 100644
> > --- a/docs/about/deprecated.rst
> > +++ b/docs/about/deprecated.rst
> > @@ -410,3 +410,16 @@ nanoMIPS ISA
> >   The ``nanoMIPS`` ISA has never been upstreamed to any compiler toolchain.
> >   As it is hard to generate binaries for it, declare it deprecated.
> > +
> > +Testing
> > +-------
> > +
> > +Renaming of the acceptance folder to avocado
> > +''''''''''''''''''''''''''''''''''''''''''''
> > +
> > +The ``tests/acceptance`` folder was never used to store acceptance tests
> > +in terms of software engineering. This naming can confuse developers
> > +adding tests using the Avocado Framework to this folder. The folder
> > +name change to ``tests/avocado`` also changed the ``make`` target from
> > +``check-acceptance`` to ``check-avocado``. In this case, the use of the
> > +``check-acceptance`` target is deprecated.
> 
> Not sure whether we need  to document this in deprecated.rst, too, since
> we're normally only listing the things here that affect the users of the
> qemu binaries, not the people who want to recompile and run the tests...
> OTOH, I don't mind too much either if we list it here... Anybody else got an
> opinion on this?

Deprecations are only things for user facing changes in the apps.

For build system changes we don't bother with any deprecation cycle.
Just make the change immediately and document it in the release notes.


Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
