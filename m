Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4512120ejc;
        Mon, 27 Feb 2023 03:15:06 -0800 (PST)
X-Google-Smtp-Source: AK7set+kg34GbzJeEip37djSmzr/nbkbKVB+Xe8HwXeD4HQZkYbrFbnVvl9xAoyHv5D83ptUuXFs
X-Received: by 2002:a17:906:ad82:b0:8b1:7eb4:6bea with SMTP id la2-20020a170906ad8200b008b17eb46beamr35514977ejb.38.1677496506504;
        Mon, 27 Feb 2023 03:15:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677496506; cv=none;
        d=google.com; s=arc-20160816;
        b=RQihYOgoe7i8UrG++uIAtZvybIooTpwNeNP7FNtyKh018+USZqAO8OY+pF7EgsQYiR
         CHWHCycRkNgIBEebJ3BB80lUaS1JBomFHUwTRe8U88/5zxfMPEJEY1VFnpt5ypetssN0
         SpKH1fxV8AdMfP6U7UPiusTxnxy2TrzfR+p08Jeh9A5ZgRBnbw+VnP7x9/mJ5+eWgCt2
         NPkog0rkYmfvJysvGmp49bwVOXmrnz8YLJuOvMhzOWkGwIT7qtep9nQ3i3YdsgExT4zY
         WRvGRb5ZHTDyuvj1KyfZDnMGgeAlJ1eFDI9bTfzOet6Dlnn887iEjudgn/1uVL+w1ZgB
         iTEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=q8quW/S3YlkC5tpMQB+7/oU2hHmkzJyAe4hhtwQ0kmc=;
        b=PP7Cuus24CTqyMPu6lZlIQ/9L6zRlbD7ilGxwosG8TD78aSgoFv9liJvGFvwLfIPCK
         c9xh1KJldJMbMr286K3l6fFxNSY7Dk5rJDcWup2SezoNX0WYK+yHmGI2VhJcdgURaw8k
         9Ax7IarhkxGwz5WCP1Z2QPSo0lAAP3uW8pyAY2yBl3As95mgS7UbeRyRCANfN2+9sOgd
         gZVPFHGRCrnsviWaWoa8nUpXDB2BdY53TVfiedX5GFV2MXq6fEHjyeL5J1cuvDvEdqk3
         UOzSsLApTVbO6j1XbT4fn6nJw+fYziFGjd9aEO5QFQekz/OK+76IYu48++7gf5RLKw72
         rm3Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eAv4wKXv;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id gx8-20020a1709068a4800b008cc4457c731si7265117ejc.900.2023.02.27.03.15.06
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 03:15:06 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=eAv4wKXv;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677496505;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q8quW/S3YlkC5tpMQB+7/oU2hHmkzJyAe4hhtwQ0kmc=;
	b=eAv4wKXvv4c+1IYl9HqmsAFO8xaWmbFTS00cNpDTPgZpfLiKJ0WeszjrXUrO2a1/PUnjxs
	Citm2kzuCg4w5DtUCLlSDvg9cttCY3adHbsromj12Qba3LQteo18KCrhado8PdJcy3DRCo
	Q5u5M1Uva7sqQIuVzEpWfpSN1R0K+2I=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-572-boaZ86mLOviHUXM3j8sDLw-1; Mon, 27 Feb 2023 06:15:02 -0500
X-MC-Unique: boaZ86mLOviHUXM3j8sDLw-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.rdu2.redhat.com [10.11.54.1])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5D701380662C;
	Mon, 27 Feb 2023 11:15:01 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id A12F8404BEC5;
	Mon, 27 Feb 2023 11:14:56 +0000 (UTC)
Date: Mon, 27 Feb 2023 11:14:54 +0000
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
Subject: Re: [PATCH 2/7] tests/dockerfiles: unify debian-toolchain references
Message-ID: <Y/yQrrfd/XLG6kwv@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <20230224180857.1050220-3-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230224180857.1050220-3-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.1
X-TUID: AzoDcXV7OfTX

On Fri, Feb 24, 2023 at 06:08:52PM +0000, Alex Bennée wrote:
> We use the debian release number elsewhere so fix it for consistency
> along with the broken comment.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/docker/dockerfiles/debian-toolchain.docker | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
