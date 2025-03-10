Received: by 2002:a17:505:8f44:b0:1be9:327d:8ee3 with SMTP id jy4csp1012771njc;
        Mon, 10 Mar 2025 02:11:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVeRiFVxeluYi744rRmK/gisrIwTr0eqg/vPVGiMYYa4Cqkf1HvLbXS6F7S/7LXXW2yaBbZ07UgBmMmmw==@linaro.org
X-Google-Smtp-Source: AGHT+IE9Mri6gft4SEyRiqzMNMeUEQ6Jtb4IySy5rOXPf3FTrph32fSxR11YrNXPAKPv4NLZWA3D
X-Received: by 2002:a05:620a:2b86:b0:7c5:3cf6:7838 with SMTP id af79cd13be357-7c53cf679bdmr1597396485a.49.1741597904671;
        Mon, 10 Mar 2025 02:11:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1741597904; cv=none;
        d=google.com; s=arc-20240605;
        b=DyGTkK0ErGA93iNcfDRQfvL2OquKWrlnmCLy2Ck6R6kxCcfU70aPJcUcC8Kdfe1vv7
         ou9C7XHHCeQDo3gg+XDgkU2llOWZN1NMiH2V47enxLR4TQ2H/j6GYHHWYIuGQMZlylDv
         JQm3tUu03pG2LjTxYcffqyzxTDPE9ClYj0QdRVEkVv78mLhdxJPZfVGFGWqIo0S7pkOB
         F35i4hRkE37GMSw/B2kdmXNJlEI3g/k7s8JqqC5o9AsDCexHhOK62JoQICXJBy8z/Plw
         J7Sm5NZR9+YkaWVrh4VDPj7M1HHtDXJ3YrHXGJchPCzJg4RoM5720ixe51EOlnhmj0xJ
         YtOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=FcPTOuqF9BfkHpmpmgo+IcFc+83Twl423OmKTcgLbYY=;
        fh=8Cp0sY6Z5cWVFgyT/B0WgC8gFBVnITOdmA10NyrKZjU=;
        b=FUHc4wjucBq6KTWm2bLg+sUFnrBG1luE1jJZdYsUEaQ8zZJCyzMx9vH8w5AffPVAT7
         t88CwkThYBYMTXCbx7cdomxryt42LoPx9j1wCiolc4RDxEeFAdytLbFkF9PN+/XvSVHM
         oATNeLDBXwhJnLk5q92zl5qmT5jo45zyl2kvbosIGBafr4P21d5samjCEvY6+lN051ro
         6nDwCpKvgwWUmF0RocKA1zLCQO8YDgXA3U3NVmjfwS8x1MzsLLzVgV+f1uzwXdlT0If2
         EBUnjUqN+oxwTWBiVu/vjc4LLKTo3MAc2MQo1ysaiJKXzpDoUs5WBUM6bzt7BMzmpgug
         yirQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G9YnAekp;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c54bb62f33si252106385a.545.2025.03.10.02.11.44
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 02:11:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G9YnAekp;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1741597904;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FcPTOuqF9BfkHpmpmgo+IcFc+83Twl423OmKTcgLbYY=;
	b=G9YnAekpy8J2DjiFSNJC36TBgqmPEx86XE+Fbe1NQXtItv9ijoMUOixmQ5ejDoHTlFOHfa
	yDOW/nixha8yJNWorkEK/2NvYWVyPf1Z7ogbQqHIWohJx++DzfFB8nBCXVwSPxTzATANOC
	Jp/OAoBU+G7Iw4HeXFotrC1pxthCWTQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-140-_kIn-PmmNou8-rKW2Pf9qw-1; Mon,
 10 Mar 2025 05:11:40 -0400
X-MC-Unique: _kIn-PmmNou8-rKW2Pf9qw-1
X-Mimecast-MFC-AGG-ID: _kIn-PmmNou8-rKW2Pf9qw_1741597897
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8A6471800266;
	Mon, 10 Mar 2025 09:11:30 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.49])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 47AC819560AB;
	Mon, 10 Mar 2025 09:11:24 +0000 (UTC)
Date: Mon, 10 Mar 2025 09:11:21 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: Pierrick Bouvier <pierrick.bouvier@linaro.org>,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>,
	"Dr. David Alan Gilbert" <dave@treblig.org>,
	David Hildenbrand <david@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	qemu-s390x@nongnu.org, devel@lists.libvirt.org,
	Eric Farman <farman@linux.ibm.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Markus Armbruster <armbru@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Eric Blake <eblake@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
	Anton Johansson <anjo@rev.ng>, qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [PATCH 0/4] hw/s390x: Alias @dump-skeys -> @dump-s390-skey and
 deprecate
Message-ID: <Z86suUJsscIwh2sP@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240530074544.25444-1-philmd@linaro.org>
 <cb4028fc-9596-47f3-9468-f8912dd48aed@redhat.com>
 <Zl20rAjHLJlZkwxE@redhat.com>
 <fda186da-2e31-42d6-8dd6-0ea3141a73e6@linaro.org>
 <d74d3ff3-3830-4682-87e3-a42ed57068d9@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <d74d3ff3-3830-4682-87e3-a42ed57068d9@redhat.com>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
X-TUID: sTxYxPlzoGCS

On Mon, Mar 10, 2025 at 07:50:57AM +0100, Thomas Huth wrote:
> On 09/03/2025 19.55, Pierrick Bouvier wrote:
> > On 6/3/24 05:18, Daniel P. Berrangé wrote:
> > > On Fri, May 31, 2024 at 06:47:45AM +0200, Thomas Huth wrote:
> > > > On 30/05/2024 09.45, Philippe Mathieu-Daudé wrote:
> > > > > We are trying to unify all qemu-system-FOO to a single binary.
> > > > > In order to do that we need to remove QAPI target specific code.
> > > > > 
> > > > > @dump-skeys is only available on qemu-system-s390x. This series
> > > > > rename it as @dump-s390-skey, making it available on other
> > > > > binaries. We take care of backward compatibility via deprecation.
> > > > > 
> > > > > Philippe Mathieu-Daudé (4):
> > > > >     hw/s390x: Introduce the @dump-s390-skeys QMP command
> > > > >     hw/s390x: Introduce the 'dump_s390_skeys' HMP command
> > > > >     hw/s390x: Deprecate the HMP 'dump_skeys' command
> > > > >     hw/s390x: Deprecate the QMP @dump-skeys command
> > > > 
> > > > Why do we have to rename the command? Just for the sake of it? I think
> > > > renaming HMP commands is maybe ok, but breaking the API in QMP is something
> > > > you should consider twice.
> > > 
> > > That was going to be my question too. Seems like its possible to simply
> > > stub out the existing command for other targets.
> > > 
> > > The renaming is just window dressing.
> > > 
> > 
> > Working on single-binary topic means specificities from every qemu
> > binary/ architecture has to be merged together. Despite appearing has a
> > bad thing now, it's definitely a step forward for QEMU, and will allow
> > to enable new usages.
> > 
> > The hard way is to trigger a deep refactoring, involving lengthy
> > conversations where compromises have to be found ("let's implement this
> > for all arch"). The pragmatic way is to eliminate obvious stuff.
> > 
> > This command is specific to an arch, so renaming is a good and obvious
> > strategy. For the backward compatible anxious developer, another
> > strategy would be to simply declare this command if the running target
> > is s390x. But then, you create a precedent to do something that should
> > not have existed in the first place.
> > 
> > +1 for the renaming, and hope that users of this command are able to
> > change a line in their script to adapt to the new command.
> 
> Sorry, but no: We've got plenty of other target specific commands...
> rtc-reset-reinjection , query-sev, query-gic-capabilities, just to name some
> few. So unless you provide a patch series to rename *all* of them and
> deprecate the previous names, I don't see the point why changing just one
> single s390x command is necessary.

Agreed, I don't see a need to special case s390 and rename this command,
nor extend it to all the others you mention.

The QAPI docs will show users that it is s390x specific if they didn't
already work it out for themselves.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
