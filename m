Received: by 2002:a17:504:794b:b0:1be9:327d:8ee3 with SMTP id uo11csp23693njb;
        Tue, 26 Nov 2024 04:48:11 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCU+HHcPbHLPxsYEXr37e2hW28FVeAgF96KTG7uF0BrA8sCvUzjQMJpYlPGAp6N3VLUqivw0jVgww3/q2w==@linaro.org
X-Google-Smtp-Source: AGHT+IF5rAOkp+9YK6gSRn1kHy96iFE815G9QFoE1u2HKFzGk8ImwysK4NUhAPNbplQ0FRzqLzQN
X-Received: by 2002:a05:6102:942:b0:4a5:bff5:4ee0 with SMTP id ada2fe7eead31-4addcbf8e52mr16173621137.7.1732625291370;
        Tue, 26 Nov 2024 04:48:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1732625291; cv=none;
        d=google.com; s=arc-20240605;
        b=AUDkpL//luQiygYOHG8A7vqNPhvVcQiH4KYaWugUZkVNXZSakorX1TFO4TvrLArQTW
         r/5YuXY3pktaq10Yz3/ehCYOn8Pgdca1WdNRWnsyn27rDFm0QFYG2upNDt0RQY9O58No
         NUZJL5BeODW9ToTeU0LDK+/AUKpeZOqmqeCaOcF4JzQSODCXIsV5//gyUjL4GSlks2DD
         F5br7r4fDUNOC0l1eBIkhmmjgoz9C3jny+DtI5YMLg4Wz5D3mRKTIKqrCZDgIyOMQMNN
         cZALOfdDYXaF7C/ghF6qbbmQBJmJHnD4nAYbJRnqkADYySr48d+KUJaaINcsbUYnieHb
         71wg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=N3uDjIOuIBBBmffy6NPeIvifakQpofHlTffpbOUPghE=;
        fh=jFb/Pp0KTmH7AKXaAmSS1tX5yIJ3d1QNUvT7yMcWs9Q=;
        b=MkvJBfmz5fX8yap+dYNwqtZ6urojCjVUqu8g3PVTFUA78R0ap1El6Wh/mKIAEc88Dp
         x3ThzuZ3u6UARKXAqbyV7q2qthzEzCVUWrGtK/6vbSLS1gJVlhMAI4ROllS9QoFSDsYm
         NOjjWP6xPZhyIm5YMRsvkA8juMOcI6bmlPbI9DGUqejDR0h4XOq4imhDMbyUW93flvz6
         dXUe/VAaquvMa8Vfm78XjWKlUlw+QkAi+3S42kveclz8YbTiv5ggG41UkJWrH9rku6uR
         UBAfsAIAXFOtbWCmWR6Xa2iZCJ3IPNaXiOgZ7bbrDO/CCBlIqjFvulFVEJme+FUnFWky
         krlw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dctu303+;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-85b4e8264ecsi628369241.68.2024.11.26.04.48.11
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Nov 2024 04:48:11 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dctu303+;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1732625290;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=N3uDjIOuIBBBmffy6NPeIvifakQpofHlTffpbOUPghE=;
	b=dctu303+qPoPmzlTDlr+KRrcZUAPuPlnkPWa4C1bmMkZYGmEHCF6rz7LZO1C+FFFGhlq63
	hEx2kzea+5mNapKUcOB1zlBB3s+TC3gGC4KhyirHoTNzs25XF9S0X6cXm/zi6pxwqsKX1C
	KSNhzkuMcGedc+V6ZhFPUFkzvXkJReU=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-57-aLfjaZgEMuqz30yjQlf4yQ-1; Tue,
 26 Nov 2024 07:48:07 -0500
X-MC-Unique: aLfjaZgEMuqz30yjQlf4yQ-1
X-Mimecast-MFC-AGG-ID: aLfjaZgEMuqz30yjQlf4yQ
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 59CD01955F56;
	Tue, 26 Nov 2024 12:48:06 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.147])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 2F36D195E483;
	Tue, 26 Nov 2024 12:48:02 +0000 (UTC)
Date: Tue, 26 Nov 2024 12:47:59 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	peter.maydell@linaro.org, richard.henderson@linaro.org,
	philmd@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org,
	alex.bennee@linaro.org, Eric Blake <eblake@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v3 10/26] target/arm/kvm-rme: Add Realm Personalization
 Value parameter
Message-ID: <Z0XDfyDWc3OZSoj0@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-12-jean-philippe@linaro.org>
 <87wmgqsbp1.fsf@pond.sub.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87wmgqsbp1.fsf@pond.sub.org>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-TUID: YYM9p17QBZ+M

On Tue, Nov 26, 2024 at 08:20:42AM +0100, Markus Armbruster wrote:
> Jean-Philippe Brucker <jean-philippe@linaro.org> writes:
> 
> > The Realm Personalization Value (RPV) is provided by the user to
> > distinguish Realms that have the same initial measurement.
> >
> > The user provides up to 64 hexadecimal bytes. They are stored into the
> > RPV in the same order, zero-padded on the right.
> >
> > Cc: Eric Blake <eblake@redhat.com>
> > Cc: Markus Armbruster <armbru@redhat.com>
> > Cc: Daniel P. Berrangé <berrange@redhat.com>
> > Cc: Eduardo Habkost <eduardo@habkost.net>
> > Acked-by: Markus Armbruster <armbru@redhat.com>
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> > v2->v3: Fix documentation
> > ---
> >  qapi/qom.json        |  15 ++++++
> >  target/arm/kvm-rme.c | 111 +++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 126 insertions(+)
> >
> > diff --git a/qapi/qom.json b/qapi/qom.json
> > index a8beeabf1f..f982850bca 100644
> > --- a/qapi/qom.json
> > +++ b/qapi/qom.json
> > @@ -1068,6 +1068,19 @@
> >    'data': { '*cpu-affinity': ['uint16'],
> >              '*node-affinity': ['uint16'] } }
> >  
> > +##
> > +# @RmeGuestProperties:
> > +#
> > +# Properties for rme-guest objects.
> > +#
> > +# @personalization-value: Realm personalization value, as a 64-byte
> > +#     hex string. This optional parameter allows to uniquely identify
> > +#     the VM instance during attestation. (default: 0)
> 
> QMP commonly uses base64 for encoding binary data.  Any particular
> reason to deviate?
> 
> Is the "hex string" to be mapped to binary in little or big endian?  Not
> an issue with base64.

Agreed, using base64 is preferrable for consistency.

> 
> Nitpick: (default: all-zero), please, for consistency with similar
> documentation in SevSnpGuestProperties.
> 
> > +#
> > +# Since: 9.3

There is never any x.3 version of QEMU, as we bump the major
version once a year. IOW, next release you could target this
for will be 10.0

> > +##
> > +{ 'struct': 'RmeGuestProperties',
> > +  'data': { '*personalization-value': 'str' } }
> >  
> >  ##
> >  # @ObjectType:
> > @@ -1121,6 +1134,7 @@
> >      { 'name': 'pr-manager-helper',
> >        'if': 'CONFIG_LINUX' },
> >      'qtest',
> > +    'rme-guest',
> >      'rng-builtin',
> >      'rng-egd',
> >      { 'name': 'rng-random',
> 
> The commit message claims the patch adds a parameter.  It actually adds
> an entire object type.

The object should be added to qom.json earlier in this series when
the RmeGuest class is defined, then this patch would merely be adding
the parameter.

> 
> > @@ -1195,6 +1209,7 @@
> >        'pr-manager-helper':          { 'type': 'PrManagerHelperProperties',
> >                                        'if': 'CONFIG_LINUX' },
> >        'qtest':                      'QtestProperties',
> > +      'rme-guest':                  'RmeGuestProperties',
> >        'rng-builtin':                'RngProperties',
> >        'rng-egd':                    'RngEgdProperties',
> >        'rng-random':                 { 'type': 'RngRandomProperties',

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
