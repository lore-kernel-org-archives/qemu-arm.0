Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp28607njb;
        Tue, 26 Nov 2024 04:57:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWuvyypB7/357N0tY9Qdc+CgebM3KUrz9FmLghl9roGPVwKEJdeIScu+v2FPgSuf7iZQQzjWw5whj5S4Q==@linaro.org
X-Google-Smtp-Source: AGHT+IGugRa+Rt2GrWEBTB/zodYeUcvQ48YE1/SFLKjUQKM+UoFqIuvvZT9Dv0kEEEqAbE8o5f+h
X-Received: by 2002:a05:6102:9d0:b0:4ad:48e3:a306 with SMTP id ada2fe7eead31-4addcd2b90bmr16146077137.19.1732625852707;
        Tue, 26 Nov 2024 04:57:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732625852; cv=none;
        d=google.com; s=arc-20240605;
        b=TJxvWy2khhAIYIWRyVbs12wj2O0PNNmqDf7dp+ejcMnVAsT93GWrfMpLWHtO0xL6ls
         azRS4taNEt9W2JBtx3orLHQWzoH8Nk+iIgbMG3DmFI2Jgp+IrjfOVLm3B9riIEpQTm5o
         bq9PAEPnITdfXHPpUMpg3ZODtcr534VyfrJktfCYpodeTNoltj5kosOl9b3dJhf14miA
         K7hjUBd2P/SruviUBv+bJLpxmLw8iQbw+qDbZ56enzEjWcQ0UdBrKG9Ek8Qhwkp0BHR/
         1Gqn7wyDblQ3P87YtfqT30uIBM9Rjparg56hLLgMLtCeZVFErE4zt0sZvvd8uH/ss7d8
         AK/g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=QGOmP5dCOn8AoD8n68FQpmw+ByxO4khxn2FtEwn8lCc=;
        fh=viLdcSkNm7Zsj4J/NO8HxLslwwy/Qn1SnyFRM80HHTs=;
        b=lXwy78nvMp8SjU8pSBqWBQtANOxbxsdAuLs9m5P76sFbJphVteq34fWgTXYcJYuMKb
         fRZ5VEmKHnQWo+srR17ke8+pR7HbslN/ymLqEPHtSF1Vi38JIotRqMKGNSN86XPaQdFy
         kHCQKg91/gwcZB8N0mFkFZAvTFr7pNqsUtueEFtIBZc8o7xbDGTuKAVN4GjS3/F6eOGa
         X++57cbv2zAOtYS93Wa/kbhPg2m8ZzJnN1KtJNyoBrI7UozECqYm8LCt2A5PJ9dVjrjI
         xJHgyH9JuYzSZ7DKcxBRfCb7nDi5NBTdTjysxlBHAQNCRWPElg+jO4G2TDJy2fPlsM0i
         55ng==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W7ZOmx+j;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id ada2fe7eead31-4af3590c5afsi628990137.439.2024.11.26.04.57.32
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 04:57:32 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=W7ZOmx+j;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732625852;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QGOmP5dCOn8AoD8n68FQpmw+ByxO4khxn2FtEwn8lCc=;
	b=W7ZOmx+jLawm4zgR76YxwpRqJfUCBhv5o3Hilc/u5Yn2+MllEuoM2NHOv6oiB9BROAPvr+
	7lSt5H03KthJql/56NDojZtOZeusQwhNhvZdwLHbMXvcEpFpb401uHtmp0ETaguEoFqCEz
	WrvoC/C9EDP2fgHuCXD4cfj1G9oBsFc=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-86-N3AYO85tODOy4TVrOusabQ-1; Tue,
 26 Nov 2024 07:57:29 -0500
X-MC-Unique: N3AYO85tODOy4TVrOusabQ-1
X-Mimecast-MFC-AGG-ID: N3AYO85tODOy4TVrOusabQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 354011953954;
	Tue, 26 Nov 2024 12:57:27 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.147])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 246341956086;
	Tue, 26 Nov 2024 12:57:23 +0000 (UTC)
Date: Tue, 26 Nov 2024 12:57:20 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: peter.maydell@linaro.org, richard.henderson@linaro.org,
	philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.bennee@linaro.org, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v3 11/26] target/arm/kvm-rme: Add measurement algorithm
 property
Message-ID: <Z0XFsC6vWkrR7aAm@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-13-jean-philippe@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241125195626.856992-13-jean-philippe@linaro.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: r+3vgpCOIQ1k

On Mon, Nov 25, 2024 at 07:56:10PM +0000, Jean-Philippe Brucker wrote:
> This option selects which measurement algorithm to use for attestation.
> Supported values are SHA256 and SHA512. Default to SHA512 arbitrarily.

I'd suggest that defaulting to sha256 is the better choice.

sha512 is overkill from a security POV, while doubling the size
of hash data that has to be passed around. It is unusual for
applications needing hashing to pick 512 over 256 IME.

Shorter config param data is a win for QEMU command line parameters.

> SHA512 is generally faster on 64-bit architectures. On a few arm64 CPUs
> I tested SHA256 is much faster, but that's most likely because they only
> support acceleration via FEAT_SHA256 (Armv8.0) and not FEAT_SHA512
> (Armv8.2). Future CPUs supporting RME are likely to also support
> FEAT_SHA512.

IMHO speed is largely tangential for this use case, as it is a
one time hash operation at VM startup.

> Cc: Eric Blake <eblake@redhat.com>
> Cc: Markus Armbruster <armbru@redhat.com>
> Cc: Daniel P. Berrangé <berrange@redhat.com>
> Cc: Eduardo Habkost <eduardo@habkost.net>
> Acked-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> ---
> v2->v3: Rename measurement-algorithm
> ---
>  qapi/qom.json        | 20 +++++++++++++++++++-
>  target/arm/kvm-rme.c | 39 ++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 57 insertions(+), 2 deletions(-)
> 
> diff --git a/qapi/qom.json b/qapi/qom.json
> index f982850bca..901ba67634 100644
> --- a/qapi/qom.json
> +++ b/qapi/qom.json
> @@ -1068,6 +1068,20 @@
>    'data': { '*cpu-affinity': ['uint16'],
>              '*node-affinity': ['uint16'] } }
>  
> +##
> +# @RmeGuestMeasurementAlgorithm:
> +#
> +# @sha256: Use the SHA256 algorithm
> +#
> +# @sha512: Use the SHA512 algorithm
> +#
> +# Algorithm to use for realm measurements
> +#
> +# Since: 9.3
> +##
> +{ 'enum': 'RmeGuestMeasurementAlgorithm',
> +  'data': ['sha256', 'sha512'] }


A design question for Markus....


We have a "QCryptoHashAlg" enum that covers both of these strings
and more besides.

We have a choice of using a dedicated enum strictly limited to
just what RME needs, vs using the common enum type, but rejecting
unsupported algorithms at runtime.  Do we prefer duplication for
improve specificity, or removal of duplication ?

> +
>  ##
>  # @RmeGuestProperties:
>  #
> @@ -1077,10 +1091,14 @@
>  #     hex string. This optional parameter allows to uniquely identify
>  #     the VM instance during attestation. (default: 0)
>  #
> +# @measurement-algorithm: Realm measurement algorithm
> +#     (default: sha512)
> +#
>  # Since: 9.3
>  ##
>  { 'struct': 'RmeGuestProperties',
> -  'data': { '*personalization-value': 'str' } }
> +  'data': { '*personalization-value': 'str',
> +            '*measurement-algorithm': 'RmeGuestMeasurementAlgorithm' } }
>  

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
