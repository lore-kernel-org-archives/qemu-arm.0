Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp136498njb;
        Tue, 26 Nov 2024 07:18:18 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXpVtLE+2CjoSd2l4NZhnJSKCs9w9TbfwYpHzEM+kCRj1b4Qn6ajszho4py3JmJUvmKR9+rynbP3pRnvQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFtFhRjsUfMiGsrTWpGfHMVgAhG0nImNq8GxL3YVzWTSQFn9GP6WwgMTYUa4MczpFzlhdM0
X-Received: by 2002:a05:622a:2988:b0:461:6478:eea2 with SMTP id d75a77b69052e-466a3be6d15mr51462341cf.28.1732634298548;
        Tue, 26 Nov 2024 07:18:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732634298; cv=none;
        d=google.com; s=arc-20240605;
        b=fJY385YaLEd76V6EBaXDrjrOvY1AbLZ8d8yvEcmCuCF+FeAcPNb3EYIBFWF0ZoaQ84
         Pwze/C4QpFk/L3npjfMSb56rkDlFYYFzxIEclrD/Hn27SYYHUaez5YNvCk4FZ855opZK
         RqrC7WfzsGbxz+lf4g4heBcf6sDjmUzkUJZNYjCWYLzlBiwxe6D0f5fCKWCb46tQGuub
         w1Donp0sL4+eEniX8NUH+4G5igWXRZhCHhMIMcs09yqr59CYIzFvG9e5jxkuIMsR5n7w
         N4Dy9r4UKqZAxoTPTrleP7GD9leOUsrGmUUgfA3gDHNuB8q59/rwr5GOR33FxP8CNhxe
         nIcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=nUFj0u4xUrZUnxNbS5AT2u7yQ1rYvddwlqDbureuip8=;
        fh=jFb/Pp0KTmH7AKXaAmSS1tX5yIJ3d1QNUvT7yMcWs9Q=;
        b=HsBzsEOeg1iCjGPL82TSPTvar/1cbl27scMyG7r8/Fe5oD251qQP3HEI24+gVCumGo
         2Qcetd0/C25DeUjAEhxmC1PE7b3CND2eY/52upx4lMXaFE3wltoriUETFyeAJ0xgfGvg
         2N8glWZy51NSlA0q2tSeX+jwKwfZDx5+hMYxsS1G9T1IUK307suhyTEx2wTT71/wuksJ
         E/hEl7FFSGsX4p4bYQNo0/CYuw3l0JDVlmuTcSbysy5my6ajs/uZ53rAxNVzwpcoN/X7
         7wzXLMmjgbxufLb4xv11UiKjR2/B2Gdu5M8afyrgIKsDn0Sf8I7kyFy4oRSMPTmOshPc
         TNzw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Nj0DtgWj;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-46688a5c223si62281481cf.323.2024.11.26.07.18.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 07:18:18 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Nj0DtgWj;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732634298;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nUFj0u4xUrZUnxNbS5AT2u7yQ1rYvddwlqDbureuip8=;
	b=Nj0DtgWj06CdphCEE/BFqHyubwfjyiI0Dtojjc8utyCezmR0CMO6FTy5IVTOTv2aIkiBfl
	4MEutjD0CkTUrlQ2kaEi+zGSOx2nNi9zIwUB6eTW0g+RqX+Or/FRf7N8Uiqhbwes5P5lDK
	HtPt2kXWhpZgvPgoPvzG/26yCLWyj1A=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-387-f2WajsY8OlGMqIdTKpdiDA-1; Tue,
 26 Nov 2024 10:18:10 -0500
X-MC-Unique: f2WajsY8OlGMqIdTKpdiDA-1
X-Mimecast-MFC-AGG-ID: f2WajsY8OlGMqIdTKpdiDA
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E781B19775F7;
	Tue, 26 Nov 2024 15:17:52 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.147])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7C109300019E;
	Tue, 26 Nov 2024 15:17:49 +0000 (UTC)
Date: Tue, 26 Nov 2024 15:17:45 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	peter.maydell@linaro.org, richard.henderson@linaro.org,
	philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.bennee@linaro.org, Eric Blake <eblake@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v3 11/26] target/arm/kvm-rme: Add measurement algorithm
 property
Message-ID: <Z0XmmfCNmQHB0vpu@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-13-jean-philippe@linaro.org>
 <Z0XFsC6vWkrR7aAm@redhat.com>
 <87ed2yowrs.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87ed2yowrs.fsf@pond.sub.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-TUID: KalVUuhjN+Nk

On Tue, Nov 26, 2024 at 04:11:19PM +0100, Markus Armbruster wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> 
> > On Mon, Nov 25, 2024 at 07:56:10PM +0000, Jean-Philippe Brucker wrote:
> 
> [...]
> 
> >> diff --git a/qapi/qom.json b/qapi/qom.json
> >> index f982850bca..901ba67634 100644
> >> --- a/qapi/qom.json
> >> +++ b/qapi/qom.json
> >> @@ -1068,6 +1068,20 @@
> >>    'data': { '*cpu-affinity': ['uint16'],
> >>              '*node-affinity': ['uint16'] } }
> >>  
> >> +##
> >> +# @RmeGuestMeasurementAlgorithm:
> >> +#
> >> +# @sha256: Use the SHA256 algorithm
> >> +#
> >> +# @sha512: Use the SHA512 algorithm
> >> +#
> >> +# Algorithm to use for realm measurements
> >> +#
> >> +# Since: 9.3
> >> +##
> >> +{ 'enum': 'RmeGuestMeasurementAlgorithm',
> >> +  'data': ['sha256', 'sha512'] }
> >
> >
> > A design question for Markus....
> >
> >
> > We have a "QCryptoHashAlg" enum that covers both of these strings
> > and more besides.
> >
> > We have a choice of using a dedicated enum strictly limited to
> > just what RME needs, vs using the common enum type, but rejecting
> > unsupported algorithms at runtime.  Do we prefer duplication for
> > improve specificity, or removal of duplication ?
> 
> With a dedicated enum, introspection shows precisely the accepted
> values.
> 
> If we reuse a wider enum, introspection shows additional, invalid
> values.
> 
> Say we later make one of these valid here.  If we reuse the wider enum
> now, nothing changes in introspection then, i.e. introspection cannot
> tell us whether this particular QEMU supports this additional algorithm.
> With a dedicated enum, it can.  Whether that's needed in practice I find
> hard to predict.
> 
> I lean towards lean towards dedicated enum.
> 
> Questions?

That's fine with me. Lets stick with the approach in this patch.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
