Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5726880ejc;
        Tue, 28 Feb 2023 04:58:51 -0800 (PST)
X-Google-Smtp-Source: AK7set9vSSZp7fBU4xqZbi6wEYFi3vtQu7o7LV0n6uSUel9VzOJJkqwcoVm7Pry3DyRzDGEfpZWB
X-Received: by 2002:a05:622a:1a24:b0:3bf:e13e:30d2 with SMTP id f36-20020a05622a1a2400b003bfe13e30d2mr4498089qtb.67.1677589131208;
        Tue, 28 Feb 2023 04:58:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677589131; cv=none;
        d=google.com; s=arc-20160816;
        b=SH3p5dKQTGeDUwOWL9iErVJl8g9zniMClZPXcRF8TIGs9lpCSPWXxVgqv77hd8iQzU
         gH7cgn77lLy4CCTJYAIy6ybK1BW8OWhDptU3pFpXElGKiWRrr93XlWP0ao9CETI2xOpQ
         5gk3YRFhBOStExB9q9MqSn7lj2mlraTvn5hEz2EmxdEpgfH7QAs6JP56TnuoDjR2jVHo
         gm2SQgrT4rKRmL4X3Y3Q61fOyax65FND6/v7S2wsn3f1bUa+FN7vBcqo5WCxdPP5VI8n
         vWjt8F/kbTU4h7QDcBfn2j6Wev2wxlXdygfpWAsGm3eZG+j8ond2mkGUkWbeDqCykK6r
         Z8gA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=k3d/8/yP8XPH6VOnj6Filc0BXcoL7mySPSH07LGQ24Y=;
        b=PB7ujOhhd/vnIW/Ma3ebglxYyA9XzfY2aq8t5rKGHBEWXQ6tM/aVzmQ2V++89S+wZM
         p5KeFaAIvzxWTmNYC3uhaWGqSbcGAH46JPY5jQuBaINKLUidd9Pf1lhOFHjksxUJ0kdF
         0Js+kyFObPYKv8t0AvJ4A/k9XRwDJFPIfflQgDMXfrOCK5im03coS1g38DvtDH/mDIig
         Sm5RE8oVfxO71ADRvszTpK62hdGTf6PqJf8lfu5uXOCDEgXM79u6xQ5OuiZng0rLyGzn
         7RbViXh3LylYG4OlP1hn7BDoKsToPZkMxzBl/fv9Q8ePCaupQBrR2/9vi0kXlf/jbQwF
         JNSw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LpG4LYUR;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id y14-20020ac85f4e000000b003bfb0f0b695si8498755qta.742.2023.02.28.04.58.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 04:58:51 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=LpG4LYUR;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677589130;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k3d/8/yP8XPH6VOnj6Filc0BXcoL7mySPSH07LGQ24Y=;
	b=LpG4LYUR3xC0IFaW1GasJpUDLtt1S81ML8xpD6di4vGlyD0o7Q1sh/Zr19Jr1DQBNs1Baf
	Qzo++PSfNqAY24fggk4V0xEkflQKiNuVSJMgmjuI1ss4aj8RGPBQ2EEGQKZaOQivaF39Ir
	LlV/kG61yQtR5kKixJ4wKU1y/m82Dgs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-564-24nM39oCOyquhcN6KYYxiw-1; Tue, 28 Feb 2023 07:58:47 -0500
X-MC-Unique: 24nM39oCOyquhcN6KYYxiw-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 0C28585CCE2;
	Tue, 28 Feb 2023 12:58:47 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 975EB2166B26;
	Tue, 28 Feb 2023 12:58:41 +0000 (UTC)
Date: Tue, 28 Feb 2023 12:58:38 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
	Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>, Beraldo Leal <bleal@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>, Ed Maste <emaste@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
	qemu-block@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	John Snow <jsnow@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
	Bandan Das <bsd@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: Re: [PATCH 0/7] testing/next: docker.py removal and kaniko updates
Message-ID: <Y/36fmORLIjpldXn@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <c6081ec9-d192-aa24-f8f7-717d7957c67b@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c6081ec9-d192-aa24-f8f7-717d7957c67b@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.6
X-TUID: M/t7K02A8iLs

On Tue, Feb 28, 2023 at 12:58:54PM +0100, Philippe Mathieu-Daudé wrote:
> On 24/2/23 19:08, Alex Bennée wrote:
> > This series attempts to remove our dependence on the docker.py script
> > and build things directly with the appropriate tool. I've been
> > noodling around with how we build images on gitlab to see if they can
> > cache better because the normal case should be we don't need to
> > rebuild everything if the upstream distro hasn't updated its package
> > list.
> > 
> > Anyway what do people think?
> 
> Removing dind limitation is interesting.
> 
> Unrelated, can we tag registry.gitlab.com/qemu-project's
> docker images along with releases?

Can you elaborate on this ?

We're only using the images for CI purposes and they must always reflect
the current state of git master. We're using a fixed docker tag 'latest',
as that avoids the container registry growing arbitrarily large.

Our CI rules should prevent the pipelines running on stable branches,
so we shouldn't need container tags for stable.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
