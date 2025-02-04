Received: by 2002:a17:505:32ab:b0:1be9:327d:8ee3 with SMTP id js11csp104925njb;
        Tue, 4 Feb 2025 01:57:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUUhC15/ssMc15ob+L7crk+XLUVYXocYCnWRG1NHDhX27Qkhcc9AZ23jRnQNId2/hDynVx91HcQt4AW4w==@linaro.org
X-Google-Smtp-Source: AGHT+IEJEaLmTydmaSiizA80LJm8H7B1/gW8uoQFysSYTyXFBWf+VwVe6yfB7tqmVfUMZkSK4oTf
X-Received: by 2002:a05:620a:4556:b0:7b6:dac1:cb80 with SMTP id af79cd13be357-7bffcdb1e79mr3645478185a.58.1738663076540;
        Tue, 04 Feb 2025 01:57:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738663076; cv=none;
        d=google.com; s=arc-20240605;
        b=cYcfGdzL+6gftt8TY7XFf4XN2Wzy71LJ9LPKBDla4MJ7V74A+5xgLi9LG78xMqV3Go
         1USmpsfHZa5dxSDa6ul90Wjg06fhawC/3rBpYj5A6w8ZV+iNdqBkLRnHnw5fbLbuZQo0
         sdsjxrn4daKGfGCu+GTAFZ2o+sEqGDcVV5gg7L80bnYwcVKW8K4Ite0yvVYl8pQ4Rj0G
         Is8I0Scf2yrd8PgLC0LewFYME7mdvsaGMVIR7Bcs6aUTJmZEQC0It7/SvBHGU7JlKuBO
         8AKttwQYOxHFh3upRj6yBdPQxZKImZHT7i4qGT55LZmYGAmjVt8xWof+aWqjEvAdtXVz
         9Ihw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=6wOfD6wl8HRJmdVvw6Fl4fJc9lI2o+gjYGu99zpcPkQ=;
        fh=lu773w75w/i7TjQdWbJVklPn2lP29lCMkAzFx2pRSiI=;
        b=CIwF+Sd6k2mS4W/YTVYHyKP8QKOG5ltvC+h8iZGS2oqBo83o12v/DVXwhmZVI4KwMV
         XGD1Zq2P/UNCwmiml47rb3BI8wfX79+W0zc+cRKLh8tBGnYqflE91ZMSOHmtNKWm7rW9
         WuUgyC0XCvqSF80BT4A6UR12gKtEVW7Rms6JlZfxTNv6Fl8HSkxIVnT9S8a7vPMFnHuS
         GFTV3DhR15uxNbNQKFXpiwqHLo1hJrH0kSqnVE8exb3ySaq+qdqYo83SpYHp9uwhYoby
         jdxgKZDISUyxE63G+swhve6+enkkQZ0cyjSZ7TjgEiSWc2d5Kc2DJtQWEs+MIv4j68Wr
         QP6Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HNawE4Sz;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id af79cd13be357-7c02dc098efsi219159185a.609.2025.02.04.01.57.56
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 01:57:56 -0800 (PST)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=HNawE4Sz;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1738663076;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6wOfD6wl8HRJmdVvw6Fl4fJc9lI2o+gjYGu99zpcPkQ=;
	b=HNawE4SzG0wj826dtfixGayWgPjaIwCVBCh3nFfdEZqHb+C57qKQ2xn2SMtibBvah6kya3
	R8PJTxIdIeJvB9rlepQG2sCqKzLPyNyhAUCm2ATbboS5GfsxZpGnZsSAWO99KTlVTXNXZE
	iFQfs+INiYQ7QRtwpDSjzgTS0ytYt7Y=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-286-7rxGVZBqP9Cr7qKpixcgwQ-1; Tue,
 04 Feb 2025 04:57:53 -0500
X-MC-Unique: 7rxGVZBqP9Cr7qKpixcgwQ-1
X-Mimecast-MFC-AGG-ID: 7rxGVZBqP9Cr7qKpixcgwQ
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id D4AAF195608A;
	Tue,  4 Feb 2025 09:57:50 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.60])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5DAAC1956095;
	Tue,  4 Feb 2025 09:57:44 +0000 (UTC)
Date: Tue, 4 Feb 2025 09:57:40 +0000
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
	BALATON Zoltan <balaton@eik.bme.hu>,
	Laurent Vivier <lvivier@redhat.com>,
	Ovchinnikov Vitalii <vitalii.ovchinnikov@auriga.com>,
	Jared Mauch <jared+home@puck.nether.net>,
	Fabiano Rosas <farosas@suse.de>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	devel@lists.libvirt.org
Subject: Re: [PATCH v2 11/12] hw/arm/raspi: Deprecate old raspiX machine names
Message-ID: <Z6HklNsu0Mzgh7bC@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250204002240.97830-1-philmd@linaro.org>
 <20250204002240.97830-12-philmd@linaro.org>
 <CAFEAcA-3JJ1tZAXsik5hAonuSO9sCqDF1xqPQVhAeN-XwAAhDw@mail.gmail.com>
 <e32a54f2-ef46-4964-89d4-a8969b6d1b05@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e32a54f2-ef46-4964-89d4-a8969b6d1b05@linaro.org>
User-Agent: Mutt/2.2.13 (2024-03-09)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-TUID: SE6yNglk2x8e

On Tue, Feb 04, 2025 at 10:51:04AM +0100, Philippe Mathieu-Daudé wrote:
> On 4/2/25 10:22, Peter Maydell wrote:
> > On Tue, 4 Feb 2025 at 00:23, Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> > > 
> > > All previous raspi machines can be created using the
> > > generic machine. Deprecate the old names to maintain
> > > a single one. Update the tests.
> > > 
> > > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > 
> > > diff --git a/docs/about/deprecated.rst b/docs/about/deprecated.rst
> > > index 4a3c302962a..c9a11a52f78 100644
> > > --- a/docs/about/deprecated.rst
> > > +++ b/docs/about/deprecated.rst
> > > @@ -257,6 +257,19 @@ Big-Endian variants of MicroBlaze ``petalogix-ml605`` and ``xlnx-zynqmp-pmu`` ma
> > >   Both ``petalogix-ml605`` and ``xlnx-zynqmp-pmu`` were added for little endian
> > >   CPUs. Big endian support is not tested.
> > > 
> > > +ARM ``raspi0``, ``raspi1ap``, ``raspi2b``, ``raspi3ap``, ``raspi3b`` and ``raspi4b`` machines (since 10.0)
> > > +''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
> > > +
> > > +The Raspberry Pi machines have been unified under the generic ``raspi`` machine,
> > > +which takes the model as argument.
> > > +
> > > +    - `raspi0`` is now an alias for ``raspi,model=Zero``
> > > +    - `raspi1ap`` is now an alias for ``raspi,model=1A+``
> > > +    - `raspi2b`` is now an alias for ``raspi,model=2B``
> > > +    - `raspi3ap`` is now an alias for ``raspi,model=3A+``
> > > +    - `raspi3b`` is now an alias for ``raspi,model=3B``
> > > +    - `raspi4b`` is now an alias for ``raspi,model=4B``
> > 
> > This is not how we typically handle "we have a bunch
> > of different devboards in one family". What's wrong with the
> > existing set of machine names?
> 
> Zoltan and you don't want to add more machine names, then you
> don't want a generic machine. This is very confusing.

IMHO we can have distinct machines for each model, but
*NOT* have further machines for each RAM size within a
model.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
