Received: by 2002:a17:907:20b4:b0:9a1:fa4e:495e with SMTP id pw20csp1171600ejb;
        Fri, 15 Sep 2023 05:00:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzaBvMOAomKjAC24ve/PviSDXcpElmtWo0QBSYhl5JlwDGn52IwH/kheN6LVegD+ScQyY6
X-Received: by 2002:a0c:fa08:0:b0:641:8df1:79e3 with SMTP id q8-20020a0cfa08000000b006418df179e3mr1657434qvn.29.1694779229555;
        Fri, 15 Sep 2023 05:00:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694779229; cv=none;
        d=google.com; s=arc-20160816;
        b=nWl84X0q2BQTJvOhIce+DF9Ai5Lm7yngmmhvdp6B9teYhXlvwCOnqM5Uq1eO7LgsSy
         KEwzUP3+4DBs3tWGnbKhTdXcpVDd5gfa8RaIYC1dyHRn9hbRsUK81mTJg1fcfKIaPcqH
         KuFfjZoL/0uhKWIFX+X/nED4RxyvifhKLOWVO77dGSMqh7SwGF0xU+RM4PS1IZ7A6q2M
         QwBcmA3wIOFdNksioZ3/w15DePSIGX+Zp3GLKi0YQmKVw5BpqTaqfvdPdTsBn8yzxr3W
         t+EWHS3MZ1XdRwxQhh4goZcPU8994VaO06lQskmpM1bdg/OCPD2J/FniTvkJIC/r7xUl
         D2wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=t89cCaSgAmZtTUrikE8w9841NqS6ojPrpDsBQYgPXgQ=;
        fh=BwzHYUuenO0Ne3/SAKcDZ+NJ+hnspXUwS6dR8/vdcqs=;
        b=uv2dHYiZ27ddvTFGLO+FOwkIMn30Lv76gpoMqWCjsDnLS9NgSs2I8bHFBRymV+GwlL
         RX4jaiLJqM5fCVZnWeldyP5fssx/VyBjNxQLqNiLrL6X29FKBDFaI7KKaLB9Oq8ZfJl9
         acx9YYkixmQVt1pzP7E08ll36BQV5NoarKCmACPo8kEeMdp/1bZM/u/yc8QwBjU/5+IC
         /OonvAtAdbPo8+Gi20j/8HWV147VYACTgOMbGH15KydIiac6FFgD8SueByz/Jpj5/DfJ
         95kYOW77LtVv+N2AKj39uYtP1zmHFjh8pwOl+d0Lzs7LsxhgnEctyCpyrC6rR4HruuUR
         MNQQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eY2nlV+Y;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id a10-20020a0cb34a000000b00655dadf3eaasi2111874qvf.141.2023.09.15.05.00.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Sep 2023 05:00:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eY2nlV+Y;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1694779229;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=t89cCaSgAmZtTUrikE8w9841NqS6ojPrpDsBQYgPXgQ=;
	b=eY2nlV+Y2jJoJF+31//QPBCJlArA0Eeob+d8H0UDVK5p8ue9p0QLTkmJOkmWQY4ec66sY/
	qQ8k0zVWCHeqjGUKRO3BJOYAqcJwRHTBm1wwdj5CEoZeHdYAEb9bW2JqYrjPtpvX/WsbrI
	USXWhGKsnsOe7hisKP9PjjktP9uWbqk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-614-igbImswUO7uYakpbC2VfRw-1; Fri, 15 Sep 2023 08:00:26 -0400
X-MC-Unique: igbImswUO7uYakpbC2VfRw-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 76A5D803470;
	Fri, 15 Sep 2023 12:00:25 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.37])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1ED04176DE;
	Fri, 15 Sep 2023 12:00:22 +0000 (UTC)
Date: Fri, 15 Sep 2023 13:00:20 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-devel@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
	Cleber Rosa <crosa@redhat.com>, Joel Stanley <joel@jms.id.au>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>, qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Jiaxun Yang <jiaxun.yang@flygoat.com>, John Snow <jsnow@redhat.com>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	Peter Maydell <peter.maydell@linaro.org>,
	Laurent Vivier <lvivier@redhat.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH 1/9] tests: update Debian images to Bookworm
Message-ID: <ZQRHVIkgme0EOm/I@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230914155422.426639-1-alex.bennee@linaro.org>
 <20230914155422.426639-2-alex.bennee@linaro.org>
 <30ac04ad-eb02-90ad-57ff-089538413602@linaro.org>
 <ZQQi6n+3mp+bQIgu@redhat.com>
 <242dc7bd-f0c4-d58c-fc6a-f3ddc0168bf2@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <242dc7bd-f0c4-d58c-fc6a-f3ddc0168bf2@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
X-TUID: 4TDQGa1zS4iw

On Fri, Sep 15, 2023 at 12:53:30PM +0200, Philippe Mathieu-Daudé wrote:
> On 15/9/23 11:24, Daniel P. Berrangé wrote:
> > On Fri, Sep 15, 2023 at 11:14:29AM +0200, Philippe Mathieu-Daudé wrote:
> > > On 14/9/23 17:54, Alex Bennée wrote:
> > > > Bookworm has been out a while now. Time to update our containers to
> > > > the current stable. This requires the latest lcitool repo so update
> > > > the sub-module too.
> > > > 
> > > > For some reason the MIPs containers won't build so skip those for now.
> > > 
> > > Debian removed mipsel:
> > > https://lists.debian.org/debian-devel-announce/2023/09/msg00000.html
> > > https://lists.debian.org/debian-release/2019/08/msg00582.html ...
> > 
> > Wwith our general aim to support latest release, plus the previous
> > release (capped to a maximum of 2 years), we can still consider
> > mipsel supportable in QEMU CI by sticking with oldstable (Bullseye)
> > for the mipsel containers.
> > 
> > Once Debian 13 comes out, however, we'll be discarding Bullseye
> > from CI and so we'll be unable to do CI for mipsel. At the very
> > least this means we'll consider mipsel to be downgraded in terms
> > of supportability when that happens. We might then consider
> > explicitly dropping it as a buld target entirely, as the writing
> > is on the wall for 32-bit OS platforms in general...
> 
> I'm fine with dropping system emulation on 32-bit hosts, but a bit
> reluctant to drop user emulation there. Anyhow I agree with our
> distrib releases support rules, so the mipsel buildsys part is
> effectively condemned.

I wouldn't say condemned, because we are free to continue including
mipsel code in QEMU if we desire - we just will be unable to
guarantee that it works correctly - we'd be relying on developers
and users to report bugs and test it on whatever distro thye happen
to still have working.  Cutting it back to just user emulation is
a reasonable thing - testing user mode guest is not locked into
our support matrix, so we can easily test user mode binaries via
ancient distros if desired.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
