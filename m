Received: by 2002:a17:906:28cf:b0:a52:4db9:938b with SMTP id p15csp4978857ejd;
        Tue, 23 Apr 2024 05:30:10 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW+RRNFFiYeCo7TE7TaGC320at2AqGfHOSuRrGu39kQXu/OrngIK6JsQFl3tNWSgacpOnUasjbyIVYakTlUgQL9VAJ71IZr
X-Google-Smtp-Source: AGHT+IEbpPzlwEKBYQ+oodvbdZZwoZnDcL/A5yEUB6Ij1Oc7HO2m1vyiepRyHcI97I57VYGTjsr8
X-Received: by 2002:a05:6358:6e90:b0:186:27f9:d71a with SMTP id q16-20020a0563586e9000b0018627f9d71amr20783960rwm.12.1713875409793;
        Tue, 23 Apr 2024 05:30:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713875409; cv=none;
        d=google.com; s=arc-20160816;
        b=lf2YlL5MBDlIP9OBBPLXgTYBRIZyYc82B4vRHLHA5pe3rNpsM/EO8IzmO1tWxJtI4a
         BkvirRFBwbtjWQODev4C8LggYB8M4JhiRMz+G2J+8hcQYCgeE3gHzZ4bsL/fKJiK3iV+
         6NzYbbIm/D7SPZs1NB0yX3N0JJEIz1TUMDr5IQMICBpxV5glRXLfniSXRYCSfdicY60A
         qvlYe6sVXHE4Ngu2ZPKy2Elc7clWuuNVcXL57ZlpW05LFLoJoWd3K9HlahRkJC10bCEK
         DyJGJkjaa+E/+H2veANqZGSdskjTbadDvyXQA6K5jwWFZPjU09hLh+OTN3lXbS65bBy5
         LAKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=r5YmGgbKI3nqiIt1WA82Fe5RFo8wRLu+Nl7AH7k4mj0=;
        fh=wZqHyTFs6L4LPU3Kx9qLUZdYidQhWA9pq7mJaFoEadI=;
        b=NenF+WscG+MV6ASmpeTHith+bnwsIR8Kx9g6BLwX3Sb4CnCKmneA1KdQUzhM1o4nRd
         LoTFPlaXFykVDRM4zv9iMrFLO6816P8wDgsIfcbuvuYbJWZfGpTRl+2GEmhrifqrclC5
         zY35zVnpXixGQTpc2KGhIg1/ut+DnsyspNXV8FuQyGCtBp+hur2DZc/FkCBzdvh/o7Qh
         bk10LjyKDladLSu3zvQsSEiVprnZ2Bx2HETkmreUkJuia7J1fMERqSmXb5Ngbs15+CBj
         dksnoqg0W4BUGWzCChABMydI+azJIsP5e9WCKgHDIZCBMtuktdGt0FX56W5HIwLWSvaO
         i54w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XRTHw1wD;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id w17-20020a05620a095100b0078eeda2cf82si11956363qkw.153.2024.04.23.05.30.09
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Apr 2024 05:30:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XRTHw1wD;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1713875409;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r5YmGgbKI3nqiIt1WA82Fe5RFo8wRLu+Nl7AH7k4mj0=;
	b=XRTHw1wDGFiFZQG3lwGxwUrrnKyQpJQfO+nxsLJg2WQNrk3qAdaMj2u37ZLBmqFgTADpHr
	9/IaWfsQsUBsyxQlqvc25Hy9Ib8xy5wr36mAHPzbRmvwOHbNMxsxc4IlP1esadcKvnsuc0
	o4faVH47QDfk93LNvomp0OvXS6kMhqs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-452-SVEwI74BMd-2fQMR7lLMGQ-1; Tue, 23 Apr 2024 08:30:06 -0400
X-MC-Unique: SVEwI74BMd-2fQMR7lLMGQ-1
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.rdu2.redhat.com [10.11.54.9])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 85FE918065AE;
	Tue, 23 Apr 2024 12:30:05 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.127])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 098E4492BC6;
	Tue, 23 Apr 2024 12:30:02 +0000 (UTC)
Date: Tue, 23 Apr 2024 13:30:00 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Jean-Philippe Brucker <jean-philippe@linaro.org>,
	richard.henderson@linaro.org, philmd@linaro.org,
	pbonzini@redhat.com, alex.bennee@linaro.org, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Eric Blake <eblake@redhat.com>,
	Markus Armbruster <armbru@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 14/22] target/arm/kvm-rme: Add Realm Personalization
 Value parameter
Message-ID: <ZiepyDp4LasLicJU@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20240419155709.318866-2-jean-philippe@linaro.org>
 <20240419155709.318866-16-jean-philippe@linaro.org>
 <CAFEAcA_0wi_Ujt5vjbcUFacNqxktmbF7Kma8uEw+pOUp==W0oA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFEAcA_0wi_Ujt5vjbcUFacNqxktmbF7Kma8uEw+pOUp==W0oA@mail.gmail.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.9
X-TUID: 2Lzn4SnpGl1L

On Tue, Apr 23, 2024 at 01:20:20PM +0100, Peter Maydell wrote:
> On Fri, 19 Apr 2024 at 16:59, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
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
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> > v1->v2: Move parsing early, store as-is rather than reverted
> > ---
> >  qapi/qom.json        |  15 +++++-
> >  target/arm/kvm-rme.c | 111 +++++++++++++++++++++++++++++++++++++++++++
> >  2 files changed, 125 insertions(+), 1 deletion(-)
> >
> > diff --git a/qapi/qom.json b/qapi/qom.json
> > index 623ec8071f..91654aa267 100644
> > --- a/qapi/qom.json
> > +++ b/qapi/qom.json
> > @@ -931,6 +931,18 @@
> >    'data': { '*cpu-affinity': ['uint16'],
> >              '*node-affinity': ['uint16'] } }
> >
> > +##
> > +# @RmeGuestProperties:
> > +#
> > +# Properties for rme-guest objects.
> > +#
> > +# @personalization-value: Realm personalization value, as a 64-byte hex string
> > +#     (default: 0)
> > +#
> > +# Since: FIXME
> > +##
> > +{ 'struct': 'RmeGuestProperties',
> > +  'data': { '*personalization-value': 'str' } }
> >
> >  ##
> >  # @ObjectType:
> > @@ -1066,7 +1078,8 @@
> >        'tls-creds-x509':             'TlsCredsX509Properties',
> >        'tls-cipher-suites':          'TlsCredsProperties',
> >        'x-remote-object':            'RemoteObjectProperties',
> > -      'x-vfio-user-server':         'VfioUserServerProperties'
> > +      'x-vfio-user-server':         'VfioUserServerProperties',
> > +      'rme-guest':                  'RmeGuestProperties'
> >    } }
> 
> This list is in alphabetical order. Are we obliged to add new
> items to the end for some compatibility reason, or should this new
> item be filed in its correct place with the other 'r's ?

Ordering has no bearing on compatibility, so this should be at the
correct alphbetical position.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
