Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4514903ejc;
        Mon, 27 Feb 2023 03:18:50 -0800 (PST)
X-Google-Smtp-Source: AK7set9Z7gp7qo2VlYTXkqQZnEFCjl3rX7b3wx338X70OLIkn0lcDKeu1vsDJP7LTC2A19JTtvrm
X-Received: by 2002:a05:622a:1703:b0:3b6:9c63:5ca1 with SMTP id h3-20020a05622a170300b003b69c635ca1mr31080775qtk.43.1677496730279;
        Mon, 27 Feb 2023 03:18:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677496730; cv=none;
        d=google.com; s=arc-20160816;
        b=XZCwizuTHNrFRo2DcBFfcU4syDxVESogshZpWMoi3/yetnEMtcE16mpyODqQoC32al
         uHgHw4xyk4UEvv/dQ4tD9+mowrh/ZDy9yOF59uPPvz6SkzdYgTphP6AyNMfDZYXYPQ7F
         zV9qADMHznO7H0wwU9ko/VdcWX6ucCIzq8ZwpHE3tVPVR3QfK6iHsjH6Dnv++PCR37aj
         SUqCdNns3B6kQ5lEjbt89X8Es0Yt2vJM46Un321Bhb8HRsMCIchGtUGaTIXd9sTuUQLr
         G/rVTH/TZHIrGI/gw+63oheO5SP/5QpHJ/bsg24Tz88VjbXneqzTamCS7+w25coAe4bH
         7t5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=yq4pQ1itRWnHeyD6nG+UMd6m9VPl8GLa1RnimdbOn8g=;
        b=ae8lzPDhth5JGDoHzU9MorrlyL9eEkiKuzNYxDoXKSApBOmtpmh3k5zW96ygvIIk6S
         spAuQxWnFq6hv915G0kj0AS9ynhczQY4U6EBdKIBCfJXpG3ZNbqoe0zIQdltAlNHQdkF
         raxVBt3znF//NzOPCZMXFKaP0N2dx/KEY+SpPqz4U/tJanmSSACnjLaSZBVGGiYw4gHv
         QoTJraj9GRwLZvjLB02AX6Oq6frYLX09Ya94BPshC1093OQbOlZcfrCq50icooiCx/wK
         nRgzjs1aXlHHA63mGE0PVM9tT1aSiTOcIXjt6AejOKGd3jUtS5//Rzkgs+JO45hcC6eW
         ruAg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V2Sb+04q;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id j19-20020ac85f93000000b003b83c5038a6si6192555qta.411.2023.02.27.03.18.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Feb 2023 03:18:50 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=V2Sb+04q;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1677496729;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yq4pQ1itRWnHeyD6nG+UMd6m9VPl8GLa1RnimdbOn8g=;
	b=V2Sb+04qXFCccs8ZjNlLjLmqF7ZyeQqMZNnLmy1VveORnicejzI6J5K1SD7wznAMRIlSgF
	N1sGvelTNAXazdkeIjsO6AsPae5Vb8C57pG4aqOUdUAI+/KdDIAzIQN5Oz1dOTMrBQD91I
	ncleQUEEydJLD358CTgOMQ+pztRtYsA=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-637-x0m8138sN2mNDUmg7S7hhQ-1; Mon, 27 Feb 2023 06:18:48 -0500
X-MC-Unique: x0m8138sN2mNDUmg7S7hhQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.rdu2.redhat.com [10.11.54.7])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id CA9EC85A5A3;
	Mon, 27 Feb 2023 11:18:47 +0000 (UTC)
Received: from redhat.com (unknown [10.33.36.71])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id B3DBE140EBF4;
	Mon, 27 Feb 2023 11:18:43 +0000 (UTC)
Date: Mon, 27 Feb 2023 11:18:41 +0000
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
Subject: Re: [PATCH 1/7] configure: expose the direct container command
Message-ID: <Y/yRkRTXwTtEXjZC@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230224180857.1050220-1-alex.bennee@linaro.org>
 <20230224180857.1050220-2-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230224180857.1050220-2-alex.bennee@linaro.org>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.7
X-TUID: ow09xywCIgKv

On Fri, Feb 24, 2023 at 06:08:51PM +0000, Alex Bennée wrote:
> In the process of migrating away from using docker.py to build our
> containers we need to expose the command to the build environment. The
> script is still a useful way to probe which command works though.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  configure | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Daniel P. Berrangé <berrange@redhat.com>


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
