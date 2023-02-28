Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp5614201ejc;
        Tue, 28 Feb 2023 02:46:09 -0800 (PST)
X-Google-Smtp-Source: AK7set9WM7lxgdelfjcpGYV3vmkEtNQK73aYTUZYfZnBljXJORGrVOEn1qStHGCJDFqA1eaYg+ZY
X-Received: by 2002:a05:622a:13c7:b0:3bf:c86b:3d2f with SMTP id p7-20020a05622a13c700b003bfc86b3d2fmr3826714qtk.51.1677581169649;
        Tue, 28 Feb 2023 02:46:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677581169; cv=none;
        d=google.com; s=arc-20160816;
        b=ATr9W+a+Xly2s7yhV/5sI6oBcHfaR3CXLYWvIciBO+JJiSbzD0haKUYOGdAeRBYiW4
         aCYazb0CEasTdKIBiC3vFfYMyLo4kc6Pwcwyt4V0vaQ17cS0ddiiMTKCBn8NaRO3pt9d
         eioVbStQL76P1pgOyIWrFYadmI7zs3MXq3juL+fEA0FZE5nSrLsFGqFzR+JNyvY8TR5h
         Jxi7Ktc0CuDYnWYKfr7Fpn23VgBfvHWqC3hKfa7H3V1RthUUzEoMlmiT/zoxW1Xhc71o
         Xk6eYbCGcSNlenFmVj5nE4Y2E0Aq+zHlgMQD+/REknNQQgvVbn/2wL6d+CM4FWAOHVlm
         eEIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=HD2vh6PJyRJxznzS6TEUslaYje+rra8brnfldtvXhlY=;
        b=r25HNOiVR8SlC0hevzwLc8TKwl0XlbtSbIjlSnRgvn7D14zIk/MUrmiarCAfwmx9fB
         zriKZFGji8CfDUpqUYeqK3TygxeDDB4/A5Q4I4Zoyt4RkzY8nR77wNgo/SwYGqFk9iy+
         VkwuIWjK/Fiei2ZoISZq9f7036gMHuRpCShFXB4DQv0jVNWqSIa7zddSsBBHu9V0rHww
         F4VbWM+kTk2pI6GaaW6EbfRH2K4BSer3UxuffOVcLu7w3r2qraQYA50C4P/uH0OnN843
         pTSlCPevECONPQDOIT6e7VVQTvhsp2KaPjlbUqClTz7BfoSzCrOeYJvGIxQ04Lkimvkt
         IGkQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OJ4FWsyq;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id u27-20020a37ab1b000000b0073128e8f63esi7704636qke.534.2023.02.28.02.46.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Feb 2023 02:46:09 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=OJ4FWsyq;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677581169;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HD2vh6PJyRJxznzS6TEUslaYje+rra8brnfldtvXhlY=;
	b=OJ4FWsyq2/Xm/pHeXn1BREyLPo8ZPsqnSXmuRshAXZ1ZakRLwj32aboiPWrNV4K8KKTaR2
	4y6uawcV/0aSHL0ytwbgJIvUZZ0QtHEcUc2i24s07mNmHFMc9B+CEgD+bpPBYIBT9ghSIN
	S8zcL6Sw7xRf92a+gRvon45wsejsuVw=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-447-M06N2DT-Ozeesxhac_49xg-1; Tue, 28 Feb 2023 05:46:06 -0500
X-MC-Unique: M06N2DT-Ozeesxhac_49xg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2C60D28237C2;
	Tue, 28 Feb 2023 10:46:05 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.73])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EE75DC15BAD;
	Tue, 28 Feb 2023 10:46:00 +0000 (UTC)
Date: Tue, 28 Feb 2023 10:45:58 +0000
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
Subject: Re: [PATCH 6/7] tests/docker: use direct RUNC call to run test jobs
Message-ID: <Y/3bZowhWie+zEEj@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <20230224180857.1050220-7-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230224180857.1050220-7-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
X-TUID: 9WZrT+DDTb9B

On Fri, Feb 24, 2023 at 06:08:56PM +0000, Alex Bennée wrote:
> If we build them without the script we can certainly run them without
> it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/Makefile.include | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
