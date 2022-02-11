Received: by 2002:a05:6512:40d:0:0:0:0 with SMTP id u13csp2394548lfk;
        Fri, 11 Feb 2022 08:23:48 -0800 (PST)
X-Google-Smtp-Source: ABdhPJytWZesM4cHW79BnuSy7tfEJQoA8QqWBsclkgK33YtDVX6ctd2nxoNhcAGAzj6mfLEuQ7Id
X-Received: by 2002:a05:6402:5247:: with SMTP id t7mr2726632edd.10.1644596628331;
        Fri, 11 Feb 2022 08:23:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1644596628; cv=none;
        d=google.com; s=arc-20160816;
        b=fr7+q7NRzX6S0/oSGg0Q4lkjn66TZWbfdKaxl/yQAfCfQAduH2fb9T39j5j4ORz2Ui
         PBxHtXGG9+d74ZInln4DJrehc04IGfRA2rD//xR/a83njd649cTV4oU43Vqn1wPW+Xlt
         hnSSx5ELovpLRQNEGKJAPg+jMsTdUJftA/CvijJ/TwTTUnpDUimnJUK8wHTWBdsyb5n4
         EzcGuXOMw15kXd/vsHgeg6B1yp30T1QkHtYNiLQrymorZLYv0tqUjvE4u0QD+8rQ6TlX
         37JxVY8tgJnckHkCJn8gGuYsVBYf2+izf8bBbgQjwybroa7It7vu/oe9gFbxdt0ZNDzR
         BRFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:reply-to:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=LY1s5CB8AR0M2mRctboEX/XRQOMCvE1Vj9tskMIrV/k=;
        b=GOy8NX6OkYtQQIzQEWt10X5Lri5L4aUmmwhDOQNDv0oiix/D6BbwTavS7/1jDF4/Po
         50m7HtvrfE3KO58b8n7QOO9wUPrFBMrF/BbkcMTKDxRyZx7/2XBlQZPxLDo8Kzm4ptq7
         s1nNR4Himt04XUMYNlRCSZOGxnTc3+rU5iOf0Cl/7rmcvLMV+YXagTrgSb4qEEbF3UbY
         l2N20tqW94nLUaS9cM3/rxNkXNCaGUyDr2BuCSYHCKoklsncDmsntUr75s6QuqygMNcJ
         xolUc1lrUPs0yCgHyhwejCRkXfWlThyhkgbS1BtJ7oZzFCmRBy+bMfu5JWCwhSbhITDw
         frkg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HJKrOyJI;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ne28si6946873ejc.989.2022.02.11.08.23.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 11 Feb 2022 08:23:48 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HJKrOyJI;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1644596627;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=LY1s5CB8AR0M2mRctboEX/XRQOMCvE1Vj9tskMIrV/k=;
	b=HJKrOyJIdUYPjyPKZDJA2/d25+W7/BVOziuxTOJv36zQmEXO5N3+MM1uGeyq0vxSfyGEFf
	QHBcbwjNIrjsA9OIePSuM3MeGJYayUpBL8PTPfx9OxiPg9xw1qn0aHlYYCGj88tMwmIfOe
	5FWUpslFLL7v4XHQPMn5b6PxCutU39o=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-520-oLNzROi_O16r-ta41ZNOHg-1; Fri, 11 Feb 2022 11:23:32 -0500
X-MC-Unique: oLNzROi_O16r-ta41ZNOHg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 53C328144E3;
	Fri, 11 Feb 2022 16:23:31 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.156])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A85BF5B2BB;
	Fri, 11 Feb 2022 16:23:06 +0000 (UTC)
Date: Fri, 11 Feb 2022 16:23:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, fam@euphon.net, f4bug@amsat.org,
	aurelien@aurel32.net, pbonzini@redhat.com, stefanha@redhat.com,
	crosa@redhat.com, qemu-arm@nongnu.org,
	Thomas Huth <thuth@redhat.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Beraldo Leal <bleal@redhat.com>
Subject: Re: [PATCH  v1 02/11] tests/docker: add NOUSER for alpine image
Message-ID: <YgaNZyojexpreBWj@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20220211160309.335014-1-alex.bennee@linaro.org>
 <20220211160309.335014-3-alex.bennee@linaro.org>
MIME-Version: 1.0
In-Reply-To: <20220211160309.335014-3-alex.bennee@linaro.org>
User-Agent: Mutt/2.1.5 (2021-12-30)
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=berrange@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: Rt8d32qGwKKb

On Fri, Feb 11, 2022 at 04:03:00PM +0000, Alex Bennée wrote:
> The alpine image doesn't have a standard useradd binary so disable
> this convenience feature for it.

Hmm, can you elaborate on the problem here ?

IIUC, the NOUSER env was just about controlling what docker
flags we added. I didn't know it had a dependancy on stuff
inside the image ?

> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/Makefile.include | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/tests/docker/Makefile.include b/tests/docker/Makefile.include
> index 0ec59b2193..286f0ac5b5 100644
> --- a/tests/docker/Makefile.include
> +++ b/tests/docker/Makefile.include
> @@ -158,6 +158,9 @@ docker-image-debian-native: DOCKER_REGISTRY=
>  docker-image-debian10: NOUSER=1
>  docker-image-debian11: NOUSER=1
>  
> +# alpine has no adduser
> +docker-image-alpine: NOUSER=1
> +
>  #
>  # The build rule for hexagon-cross is special in so far for most of
>  # the time we don't want to build it. While dockers caching does avoid
> -- 
> 2.30.2
> 

Regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
