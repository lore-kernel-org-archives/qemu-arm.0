Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5762339ejc;
        Tue, 28 Feb 2023 05:34:51 -0800 (PST)
X-Google-Smtp-Source: AK7set+ImtJ35jXccBYj2LQHezVFd35ggOSsW4c7HJmIrs+Q1SmX65mbsw1qRXuMoOD1I5cS7jUE
X-Received: by 2002:a17:906:a447:b0:8d6:626d:7e03 with SMTP id cb7-20020a170906a44700b008d6626d7e03mr2873423ejb.40.1677591290947;
        Tue, 28 Feb 2023 05:34:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677591290; cv=none;
        d=google.com; s=arc-20160816;
        b=0ySmI1qI3AZJDX33AbCl7UKbfmTBB1L43jldF9OnCH5W7qcFYMYzNsFmG59pnYyTpG
         U5K4BdE5gg819roCOUMhm49BqGAjwsiGNS9JTfh2Zg0A5vrQ0fwhkCFf9cEqCTb521+A
         nwDkkpeJIaxFlHq3Lj8MoqyL+x1DVG5FTUigbCbkMO0TYP1LADduBK23pbG7ySgToNt2
         9p2GjOh1/zYi+IaVcjVHJfVskxXcAXADepheY0C1T/oLSiLxwA8xgb5HM986I990ng8J
         0iJmsiXpO0OTDPLvmRIvbDi2RdtTOoqzgW8Xx4GFZn2Cv3EzoO67JHa9kTpVdWmsZBzl
         3SkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=AuCK/12rqoa8bzo+vg7qWvEMiiaw5s5DCZFUm+V/ep8=;
        b=xZGMsKEb8vVdpD55niIdBDO9codAz0sg514WFYrtthiH/Aehu0/dWlqrP2iydTxNHh
         CEoJ9YbywLKqguk0Vyl+5Z/HS7LGbC9QYN/fId05BLEODtIgoGy/SMm6HahfmOiV52X3
         vO9QQ2ZD7TMPWCjNCA8CBzmUNdl5SZ1xSASvPjuY5WBRNXWQAJalJUGIVNeOqfsVHa3Y
         OMG7caxbWjfz7QOWEP8oQstbWmZR9yrYomMZRNnuf+6XchWGhRK2UOpA45aWnl/uVflr
         I3CpBs0gWhItg7ox7izk6nf59/ymDgRcBdhEpXNDnZxqnv8G/pMgsE2nXvRQxL5aNHOv
         cy2w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="J/dc2ETW";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id hc44-20020a17090716ac00b008e416a5f36bsi14753564ejc.515.2023.02.28.05.34.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 05:34:50 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="J/dc2ETW";
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677591289;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AuCK/12rqoa8bzo+vg7qWvEMiiaw5s5DCZFUm+V/ep8=;
	b=J/dc2ETWFtK9sMZH6hTn5VkcALWll/jz16W/q/X15mIoOmOdENN/GmfGP84MY1IJERZ74M
	CO8ipW5Im2RaxSEQt26SvrYAQf2rbuWwTQIemtNAHBpYbieI/4uH8ZkOqw5nv5UeBtAfU3
	EZGoI4RHFuHbkEkpPzkkFJS0bFuNxoY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-610-5CqE96AzPnyU8oI1ujw-pg-1; Tue, 28 Feb 2023 08:34:46 -0500
X-MC-Unique: 5CqE96AzPnyU8oI1ujw-pg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id D419A8828C0;
	Tue, 28 Feb 2023 13:34:45 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 9117A43FBB;
	Tue, 28 Feb 2023 13:34:41 +0000 (UTC)
Date: Tue, 28 Feb 2023 13:34:39 +0000
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
Message-ID: <Y/4C74k7QTuIwz7v@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <c6081ec9-d192-aa24-f8f7-717d7957c67b@linaro.org>
 <Y/36fmORLIjpldXn@redhat.com>
 <791f2eca-1ab4-8f94-a810-1772f4fa49a6@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <791f2eca-1ab4-8f94-a810-1772f4fa49a6@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-TUID: eMY2eiGrG6Ls

On Tue, Feb 28, 2023 at 02:29:12PM +0100, Philippe Mathieu-Daudé wrote:
> On 28/2/23 13:58, Daniel P. Berrangé wrote:
> > On Tue, Feb 28, 2023 at 12:58:54PM +0100, Philippe Mathieu-Daudé wrote:
> > > On 24/2/23 19:08, Alex Bennée wrote:
> > > > This series attempts to remove our dependence on the docker.py script
> > > > and build things directly with the appropriate tool. I've been
> > > > noodling around with how we build images on gitlab to see if they can
> > > > cache better because the normal case should be we don't need to
> > > > rebuild everything if the upstream distro hasn't updated its package
> > > > list.
> > > > 
> > > > Anyway what do people think?
> > > 
> > > Removing dind limitation is interesting.
> > > 
> > > Unrelated, can we tag registry.gitlab.com/qemu-project's
> > > docker images along with releases?
> > 
> > Can you elaborate on this ?
> > 
> > We're only using the images for CI purposes and they must always reflect
> > the current state of git master. We're using a fixed docker tag 'latest',
> > as that avoids the container registry growing arbitrarily large.
> > 
> > Our CI rules should prevent the pipelines running on stable branches,
> > so we shouldn't need container tags for stable.
> 
> I'm not suggesting keeping jobs to build, but doing a snapshot of the
> released containers.
> 
> I.e. when we release 8.0, we should tag qemu/fedora:v8.0 and never touch
> it again. This is useful when bisecting pre-v8, but also to build pre-v8
> and do performance comparison. One shouldn't have to upgrade such
> container (in particular when package mirror disappear), since it
> already contains all we need.

The main risk with this is the impact on our storage quota. With the
OSS Program membership IIUC we get Ultimate level features which
is 250 GB of storage, across git repos, pipeline cache/artifacts/logs,
container registry.

Currently they have no way to enforce that since their accounting of
usage is not accurate enough. They're working on fixing that so at
somepoint we'll be subject to the 250 GB limit.

What I don't know is how much storage we're currently using across
the /qemu-project namespace, and what extra is implied by taking
a snapshot of our container registry 3 times a year. I'm expecting
it to probably be in the high 10's of GB though for the container
registry.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
