Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp2459719lfk;
        Fri, 11 Feb 2022 10:09:23 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwXJXNSlbQRzYYVDbRgFi+xwcINYEV/ycjzOc5eXvqoOvNF7pUV8qMmNJAkKvhS673Zz0Ew
X-Received: by 2002:a81:7046:: with SMTP id l67mr2966230ywc.303.1644602963229;
        Fri, 11 Feb 2022 10:09:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644602963; cv=none;
        d=google.com; s=arc-20160816;
        b=VSJmBBiqt/SarxbZptzHFBcHU4dEEeanRVVJoQOjapX+UbkeXbuStG8XqrBZo2IWty
         Vmjesg4dPz3KIHLES98N9alLeGlBVMgolXfrGrp/heaFpPLmsbhhuUdCCk712X3Ligua
         Wk0jbkS3SNvuV+PYFhqfchbbiK3hHXC24dk+0RjVSIAzQ3wu/SJqJxoD0i1A+vfbf99T
         pzwaz7YEcy8/F1kH/npF9U9UzT4JdSv+xgzfd177mvXWmw0V25HS7l/CMAmbQfzVj5K7
         T8evrSnjuK9LMqKAg2IYvTL4/wvdsPHvpCJhgzXaqexBvG4R1DiAo7wj6akC2sxhcRUq
         QjJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=AeU/fB1grqCZm2OZfuQDH//aao0QgUotcd6h2nL3858=;
        b=DkrBgtP2u/84+HToF81Ap0BYoNylEQ8f7PU0EK1OP7PhnAxztCXZYnA/lkOteRzBTX
         x/AV/bte8NwBgGjPody2zcVNVH5XdqenZWAREt+o/03QHTyqVHrQ12YStDyydd5wZKHJ
         /lYytYL1iZAz+LioI3hSSq/ddv0cD1jwEryTD88f7GBfYQhcSmrIcAensNsWVCCYguHx
         vDjQhuB1Z1OYEr+l575ftibr9zpwKFd+E8TAe0XuUN+vEfNlsUduCJFisn4p1OspJQ8k
         FCUwF1r6585BXmPcnTcvYhGY1FOlb8aE2E/jNy5esm+Qcdti4H8Kcxe3/FBMzBTGDhJR
         hFVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S0l1fArt;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id v184si16655135ybc.287.2022.02.11.10.09.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Feb 2022 10:09:23 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=S0l1fArt;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644602962;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AeU/fB1grqCZm2OZfuQDH//aao0QgUotcd6h2nL3858=;
	b=S0l1fArtoyovl/YTHSLoR2DBrULclUqZW+ggboM3s83o3rn/FsSvy4xQ1XLDorofdTMWcu
	97khFtKmKXaK+tSdr/xrlpScXkkvMXu+5nj9dj2wPfX8xPs/cSREKvBLo37b48EkecjknB
	6hJQecfG0b+2pJxHWa3fHsxqSZ9rAlM=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-119-Owi-pmM0ODqIV9Capm-wig-1; Fri, 11 Feb 2022 13:09:14 -0500
X-MC-Unique: Owi-pmM0ODqIV9Capm-wig-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.12])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 1B1448144E0;
	Fri, 11 Feb 2022 18:09:13 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.156])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 258E77E11E;
	Fri, 11 Feb 2022 18:08:50 +0000 (UTC)
Date: Fri, 11 Feb 2022 18:08:48 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, f4bug@amsat.org,
	aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
	crosa@redhat.com, qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH  v1 02/11] tests/docker: add NOUSER for alpine image
Message-ID: <YgamMKSpfg9Zskc0@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220211160309.335014-1-alex.bennee@linaro.org>
 <20220211160309.335014-3-alex.bennee@linaro.org>
 <YgaNZyojexpreBWj@redhat.com>
 <87o83dcmjl.fsf@linaro.org>
MIME-Version: 1.0
In-Reply-To: <87o83dcmjl.fsf@linaro.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: u5Wrikjg22WQ

On Fri, Feb 11, 2022 at 05:51:25PM +0000, Alex Bennée wrote:
> 
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Fri, Feb 11, 2022 at 04:03:00PM +0000, Alex Bennée wrote:
> >> The alpine image doesn't have a standard useradd binary so disable
> >> this convenience feature for it.
> >
> > Hmm, can you elaborate on the problem here ?
> >
> > IIUC, the NOUSER env was just about controlling what docker
> > flags we added. I didn't know it had a dependancy on stuff
> > inside the image ?
> 
> The docker.py script expands the dockerfiles with a:
> 
>   "RUN id %s 2>/dev/null || useradd -u %d -U %s"
> 
> when they are built so when they are invoked for building TCG tests they
> won't mess up permissions of the final files. It is a useful convenience
> for the other images as well so you can access compilers and tools with
> something like:
> 
>   docker run --rm -it -u (id -u) -v $HOME:$HOME -w (pwd) qemu/debian-arm64-cross /bin/bash
> 
> however it's not required for the normal cross-compile tests as they are
> all done inside the docker image. The alpine image being slim doesn't
> have this nicety although there is an adduser binary. However given we
> don't use alpine for TCG tests I demurred from adding more complexity to
> docker.py to handle it.

Ah, I understand now, so

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>



> 
> >
> >> 
> >> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> >> ---
> >>  tests/docker/Makefile.include | 3 +++
> >>  1 file changed, 3 insertions(+)
> >> 
> >> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> >> index 0ec59b2193..286f0ac5b5 100644
> >> --- a/tests/docker/Makefile.include
> >> +++ b/tests/docker/Makefile.include
> >> @@ -158,6 +158,9 @@ docker-image-debian-native: DOCKER_REGISTRY=
> >>  docker-image-debian10: NOUSER=1
> >>  docker-image-debian11: NOUSER=1
> >>  
> >> +# alpine has no adduser
> >> +docker-image-alpine: NOUSER=1
> >> +
> >>  #
> >>  # The build rule for hexagon-cross is special in so far for most of
> >>  # the time we don't want to build it. While dockers caching does avoid
> >> -- 
> >> 2.30.2
> >> 
> >
> > Regards,
> > Daniel
> 
> 
> -- 
> Alex Bennée
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
