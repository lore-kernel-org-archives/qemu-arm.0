Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp38992ejc;
        Thu, 2 Mar 2023 10:09:20 -0800 (PST)
X-Google-Smtp-Source: AK7set/NNDvJFr8PLfOBsVdESJP+5p08QCU5HeYCzHzjP4BrmS5so1bZIdSpRswcmCyCmiV+VqrO
X-Received: by 2002:a67:f599:0:b0:414:f50:81ab with SMTP id i25-20020a67f599000000b004140f5081abmr5592602vso.5.1677780559870;
        Thu, 02 Mar 2023 10:09:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677780559; cv=none;
        d=google.com; s=arc-20160816;
        b=K2XfrP8Mroj9eketavGOI/ZZoGN7E70379VhO300c4pGzBUdDViFp8mmSZnumQ1dQt
         T2tw7MKPoC2JDBQJSrNXEXLsZIlWZVG1MjN8r80e+mCvWzwiYwj2TC4T6L+Ut2BEiorv
         oA9IxYz5mJzCAkMECcHonar1hBqDKaifPpVaMX59GGvdKP2gCHqPWi15Cqt5RmSNqnaP
         mkRj+aYuodxm+aYaPyz/YmFtTtWiIrSy6YD/ExzDI2Wr7m9ucqj3shnLtmjkwlrkB8De
         NR6lEGx0u9/RY0pXMM7vQMs0Wnk3fiUBpP2PiKi9urIe6MVZmNKWVhkVcb2IvYk8KIiM
         C2Qw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=HiVBqMnf1rJ1eG3Qv6m/ZxXVASAu56FD87PLiyS+zOU=;
        b=J4FGIfXu759navFzft3PZwMxBnQ2ZyG6bvzF1zwoyvVyGtwqyaezdoRIxl/hn7hfEj
         pDpy/Rnc9PdG3yXPvr9TecPYEAWbnTOVCzASd+/dSQra8UW3V8k5ImQh7NmoiZEvUzdI
         Y4goY7jtqA+EIBgY7vpRDHKvqLQpjlyo2lIKflcpcTemv9+tP1uWT/VyJ5gO2w5haLQN
         +Inm95fp8qAwWHqnRRzTKA+nxc6eho8gJp/7IFDEz9F22SP+HFJcy2b47S6I+O7CGzT8
         /UYawC7k0lYsZxZFtPnzVKNJYpWq53wemgL5zlSylxlyuGxOu1VCJoAKLBG4Ui28yziy
         EnSg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KGiWPmde;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id t17-20020ab02691000000b0068b9e00bcc4si4945782uao.192.2023.03.02.10.09.19
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Mar 2023 10:09:19 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KGiWPmde;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677780559;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HiVBqMnf1rJ1eG3Qv6m/ZxXVASAu56FD87PLiyS+zOU=;
	b=KGiWPmdeoB5dxc+UxmOAK1oxI3cb4sOwu24gPNZKL+19lqu3Q4bcksZet4H8XjLYXzCvS1
	uvMJ8qrnJu/dtMJ4rfohwA11IpvUMyFn+DXd/SkOpJgLmOWLEafavOaaep7pWpQzdP2BhT
	3uSYSTTcZGOhxIhfrgjPVFMBPJdGPCs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-320-oGMHrVdGOk-q1eVLl11_hw-1; Thu, 02 Mar 2023 13:09:17 -0500
X-MC-Unique: oGMHrVdGOk-q1eVLl11_hw-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 6FA1A877CAA;
	Thu,  2 Mar 2023 18:09:17 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.46])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 4C7E02026D4B;
	Thu,  2 Mar 2023 18:09:11 +0000 (UTC)
Date: Thu, 2 Mar 2023 18:09:03 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Thomas Huth <thuth@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	qemu-arm@nongnu.org, Maxim Levitsky <mlevitsk@redhat.com>,
	libvir-list@redhat.com,
	Richard Henderson <richard.henderson@linaro.org>,
	xen-devel@lists.xenproject.org,
	Reinoud Zandijk <reinoud@netbsd.org>
Subject: Re: [PATCH v2 5/6] docs/about/deprecated: Deprecate 32-bit arm hosts
Message-ID: <ZADmPwStkmFltjo7@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230302163106.465559-1-thuth@redhat.com>
 <20230302163106.465559-6-thuth@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230302163106.465559-6-thuth@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.4
X-TUID: YWoZo45gmMMY

On Thu, Mar 02, 2023 at 05:31:05PM +0100, Thomas Huth wrote:
> For running QEMU in system emulation mode, the user needs a rather
> strong host system, i.e. not only an embedded low-frequency controller.
> All recent beefy arm host machines should support 64-bit now, it's
> unlikely that anybody is still seriously using QEMU on a 32-bit arm
> CPU, so we deprecate the 32-bit arm hosts here to finally save use
> some time and precious CI minutes.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> ---
>  docs/about/deprecated.rst | 9 +++++++++
>  1 file changed, 9 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>

> diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> index 21ce70b5c9..c7113a7510 100644
> --- a/docs/about/deprecated.rst
> +++ b/docs/about/deprecated.rst
> @@ -229,6 +229,15 @@ discontinue it. Since all recent x86 hardware from the past >10 years
>  is capable of the 64-bit x86 extensions, a corresponding 64-bit OS
>  should be used instead.
>  
> +System emulation on 32-bit arm hosts (since 8.0)
> +''''''''''''''''''''''''''''''''''''''''''''''''
> +
> +Since QEMU needs a strong host machine for running full system emulation, and
> +all recent powerful arm hosts support 64-bit, the QEMU project deprecates the
> +support for running any system emulation on 32-bit arm hosts in general. Use
> +64-bit arm hosts for system emulation instead. (Note: "user" mode emulation
> +continuous to be supported on 32-bit arm hosts, too)

s/continuous/continues/

s/,too/, as well as command line tools like qemu-img, qemu-nbd, etc/

> +
>  
>  QEMU API (QAPI) events
>  ----------------------
> -- 
> 2.31.1
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
