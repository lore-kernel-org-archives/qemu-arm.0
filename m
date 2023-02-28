Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5610001ejc;
        Tue, 28 Feb 2023 02:41:01 -0800 (PST)
X-Google-Smtp-Source: AK7set9JknjnZhIlSNSZOHl1QnXFtRMDsY61190l4Ou79ddwGv5Kz+UGLn50NJ08+kQd5E2/mE6y
X-Received: by 2002:ac8:7e82:0:b0:3bf:c994:c9b6 with SMTP id w2-20020ac87e82000000b003bfc994c9b6mr4260250qtj.29.1677580860866;
        Tue, 28 Feb 2023 02:41:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677580860; cv=none;
        d=google.com; s=arc-20160816;
        b=qc/I14eg9czBQQQQc6eJf+0hzZcmINr/ftCHZKbfv+UPFryskxVKAuTztRG5iy4822
         x7O8I+wwKg8qUVOC9wO8bJNWavLkzu51gFsZK/cJDWrJz6VXb6gHc8vp0jZdfgRojHKt
         kmnSMFv9jztRrM7pfgPocZ4RP3B8xeXoI3cvPuHhbnRGzW99OW8A6wHGjQVPGpTtKc7c
         2r6iNkb+aKtAvDkTGerzzzG3rRq81rKhX1f6/ErTDUae/WfVsJfAn4i1uSfPgsLTbpMF
         ZIyr9XuUQRrYB6LgTiXgrHO9DkQk1xOkL1150/4KDiZWooVgDpxLfJgmMdqnveLsa7X8
         fSVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=FSYei66tFHCyjMMB9ujDqdeW0mNQ2peKXozoguywMR0=;
        b=VKU9I5PSRXbcQSmKiBDg8/kDUuCRuhvah5p+uWky82RJ6X+TqwIUXMXLAitoTGTq4S
         AMjyHJSFg58no3kXLWkXW7Xz9KPlNIgjwHp6HKGY+uzu6wi6UkldS0XAFVlEZoi33wqy
         pOAfAcXHpMMBAxXtyizcN1bdbVhYadQesJy48A1Nmoi6eoWxxaXAA24X11vLGKprJcNe
         gVjFnKyXrgpAN3J1WUiOCL82xA2hPM+fJP9M5eJ//9/LnmzqdFoqAMojAE8mSyefkgS1
         M8bG7t5Ev73g+8SEFuYuaLVIHdxlebIp3bGpfVg9ahcxa2Z4ixcBsFu4cyTLxDWWHl6Z
         96Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WuWBTVG8;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id c16-20020a05622a025000b003b82046683fsi8995657qtx.80.2023.02.28.02.41.00
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 02:41:00 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=WuWBTVG8;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677580860;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FSYei66tFHCyjMMB9ujDqdeW0mNQ2peKXozoguywMR0=;
	b=WuWBTVG8+vhc3EwBuivScxj7lELAgxcmVmz8IHckLkxK2hSm0T1UX9LKbJ+mQgMaWMSV7Y
	JLoS2NJDFWC/as2PnQussVHONmownBw3hyXOEAooJgT4fD3iT3xDIXSrGXwQlfuJp6NA9u
	qUJwcjNsh1kTA+Jf2VIQeRbzsy2iNQE=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-164-dPYwdBgKNAmX9pS8S4QFMg-1; Tue, 28 Feb 2023 05:40:57 -0500
X-MC-Unique: dPYwdBgKNAmX9pS8S4QFMg-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 63D4E1816EC0;
	Tue, 28 Feb 2023 10:40:56 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 0DD541121314;
	Tue, 28 Feb 2023 10:40:51 +0000 (UTC)
Date: Tue, 28 Feb 2023 10:40:49 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Li-Wen Hsu <lwhsu@freebsd.org>,
	Thomas Huth <thuth@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Michael Roth <michael.roth@amd.com>,
	Qiuhao Li <Qiuhao.Li@outlook.com>, Beraldo Leal <bleal@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Cleber Rosa <crosa@redhat.com>,
	Yonggang Luo <luoyonggang@gmail.com>, Ed Maste <emaste@freebsd.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	Aurelien Jarno <aurelien@aurel32.net>, qemu-arm@nongnu.org,
	Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
	qemu-block@nongnu.org,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	John Snow <jsnow@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	Alexander Bulekov <alxndr@bu.edu>, Hanna Reitz <hreitz@redhat.com>,
	Bandan Das <bsd@redhat.com>, Markus Armbruster <armbru@redhat.com>,
	Darren Kenny <darren.kenny@oracle.com>,
	Wainer dos Santos Moschetta <wainersm@redhat.com>,
	Pavel Dovgalyuk <pavel.dovgaluk@ispras.ru>
Subject: Re: [PATCH 5/7] tests/docker: use direct RUNC call to build
 containers
Message-ID: <Y/3aMdIfL6NFwztI@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <20230224180857.1050220-6-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230224180857.1050220-6-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
X-TUID: b/qhfsUUvaAH

On Fri, Feb 24, 2023 at 06:08:55PM +0000, Alex Bennée wrote:
> We don't really need stuff from docker.py to do the build as we have
> everything we need with a direct call. We do rely on the dockerfiles
> being able to tweak the UID/name mapping as the last step.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/Makefile.include | 22 +++++++++++++---------
>  1 file changed, 13 insertions(+), 9 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
