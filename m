Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp443063njb;
        Wed, 4 Dec 2024 11:11:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXtdFC8tnyxQzj3S73GRgStyyQNTHU44CuT4fzZeUhXE/KjX3Gr4YP0XsWHYkmXDm7Ha03VQEexPJeo6Q==@linaro.org
X-Received: by 2002:a05:6000:2d10:b0:385:fd07:85f8 with SMTP id ffacd0b85a97d-385fd3f21aamr4111384f8f.29.1733339462733;
        Wed, 04 Dec 2024 11:11:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733339462; cv=none;
        d=google.com; s=arc-20240605;
        b=f3oyQfnBJ+NrMpoOp8/6Nz1yBfhj09bbwCTbvtvOJPIVSez8NxfAc05zenBP/h/a4v
         vYXpGiARU5e0qbOorngHLo3SutBsMQB1+79LNioqxmYatbcwdkRziZChIel470DxDNzK
         Jlnv0feJWpUkGYVo4ehxsmchl2JTtvBKddbR4jUA0nXsRkXXam+BLyCHLUKyniGhWK9I
         ojCwdsAh6jdgzsryift7zsqtZlj9jayEHqgiezMFKwfsPwOX2oJNAwTzD5wcUzcovGWN
         RDkgfWwqBD8mlwdhQlKrJYeHrUmvX9kkQZdxi3QZelJgAjJ4k3+h+k/nwT7JlgcHTSft
         9LdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=xJkr6X6iGm4jU0kNLf3h/3QCpkTdenPRAEhvG0eZ02w=;
        fh=3JPv/Ppz28qUXfCKumoBQbq4lknX6uPyxTch5uDW9VI=;
        b=HOrUtW/1WvDb09a52A+MWp/7C01ztYwc5sV1ygsXEkP0u/s2dhAe/BwLo6unooZnOj
         Hr0MA+RmVKR6wcdf+x6GECTkHW4ZObI8rF0f3hcGsBTNlCz5UIeDWSZJUZsoDQDfoJ/o
         /kvre8cMq7llYMD5NtG18HhuhDU2iO/8n8TINYkxroxeb1fDHRaE6y+xpbJhM5MXRpbO
         cgujC8lpv1D40Ab0uj87RD2dZo0g16YmBboyhc0mDe+pN+hivPCMmVV75UvPoM222fBN
         E9dGZDgIsd6z78mWlCqXDi56N2Nv6DjF+zBf0E2TkBTXaJ3Ny62XTJU/uvVGV1Cc17F2
         Vj+A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OhK7Cd3L;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <jean-philippe@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-385e9f88eb1sor2461084f8f.10.2024.12.04.11.11.02
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 04 Dec 2024 11:11:02 -0800 (PST)
Received-SPF: pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=OhK7Cd3L;
       spf=pass (google.com: domain of jean-philippe@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=jean-philippe@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1733339462; x=1733944262; darn=linaro.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=xJkr6X6iGm4jU0kNLf3h/3QCpkTdenPRAEhvG0eZ02w=;
        b=OhK7Cd3LxyPaIOnbL2AXIR/DeiqgxpYZApVkyc7PiVahhkg5WkVzxGBeBsi/v90r9h
         SslpBRVdd0E2Na4P6S/klqCxjEjX3E0CLnyGgZgOIrrdH96ONwA3WIhVJ7CtvJqM6voF
         peGK4rn5Jk+5dQLNgmxOx0BWLphGx+kXc/wK9hUYYEYFH51pvKzBQmQIGMPRPYNC2SQM
         F92/zFWe/icpQnd+LEB6DiEH0cIyqFY7vtMKNNNNzWV63MaFrooaPdhWt2pC+b4xzEQi
         KkN77NCmgILRvsk/B2j3XRJG2w+OlgfL9OUT1Xe8CJWKKWGpHYNsy2SAEVhZF6F/esnF
         DrhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733339462; x=1733944262;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xJkr6X6iGm4jU0kNLf3h/3QCpkTdenPRAEhvG0eZ02w=;
        b=WtBTGzOUFukvDZt+lYRUSKlYre1Z+monQo+seqIz7EMj+hzBE+HbHSkUgKRkwIXPYJ
         jA+c042Sg3vY1Br4RrASzXFiKKZ6vOZ73+IKm6ARyASDbdMC9WqkSbF8e+0ED+AagU5Q
         /izTexD9+O3tvAztHM2WLSi6alqRjDG17fnHKQ4tzTW696tY3UD42fPdi6n+XOk8KDk9
         ZM2uHaae8F+NzIpEs9TIVIIl/XA/8OunGhWn9VezYjKSuTXv5MpO+AfbPXAejERkDpsH
         eEdltZ4yyysDb/mO9PtUyVHnLYfUIqUxn/k9D0MB0w6DR6Hthy6SMhW3jshK9FsHTA1q
         5kpA==
X-Forwarded-Encrypted: i=1; AJvYcCUHLYB3MOSMK0dUiP03LnNfJJKb9VFGezoDhbKuMwc1rNgO9A2QfUW2xuWMWyA9EUJdiomLJkomq54qDw==@linaro.org
X-Gm-Message-State: AOJu0YzuQPUvW6myMmnWhYrfapXqzSr3R8AvT0/SKY/qTqsTBXc1r6/J
	8JMLA21tosoLxy65p1LEEy2MFxTDo2jwxaTJ9ZVN5RFirdI97pORx9mF5OvkIQYOPA==
X-Gm-Gg: ASbGncsSuae8+oAAia/Zm0R++Z823ArlZ4/qhkVuZ9prFEQYPqJA9MMx3OyvwvaRzU5
	+tl6duzyXm0J3hjI7W71breoqXXx+eKe3az6UZEKhP7xT6aiqInCeTJASnjC8RhH4QTG/iTxQfm
	SFd3aDFqutGFR4MkgsL3KnarWHx4IwzwiYOIPoxV+Jpvc0nNs1QPUnk9b0tZkoO47d6Ip3FP7Cz
	v//hJlQt8UQArd4KWHx2JYYQJ5Pm4gpGGfZEMZaRDKqM8xi
X-Google-Smtp-Source: AGHT+IFSE7EbJ7GAFFLFXXCfbtDYu0IPP92EWaIzpH84TAUFzF3WLmk7cmqpWzWQfvclNGQGSrizKw==
X-Received: by 2002:a5d:6c6d:0:b0:385:f984:2cbc with SMTP id ffacd0b85a97d-385fd3f2d32mr6248857f8f.34.1733339462119;
        Wed, 04 Dec 2024 11:11:02 -0800 (PST)
Return-Path: <jean-philippe@linaro.org>
Received: from myrica ([2.221.137.100])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52c0bfasm34420985e9.32.2024.12.04.11.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Dec 2024 11:11:01 -0800 (PST)
Date: Wed, 4 Dec 2024 19:11:25 +0000
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Cc: Markus Armbruster <armbru@redhat.com>, peter.maydell@linaro.org,
	richard.henderson@linaro.org, philmd@linaro.org,
	qemu-arm@nongnu.org, qemu-devel@nongnu.org, alex.bennee@linaro.org,
	Eric Blake <eblake@redhat.com>,
	Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v3 10/26] target/arm/kvm-rme: Add Realm Personalization
 Value parameter
Message-ID: <20241204191125.GD2349278@myrica>
References: <20241125195626.856992-2-jean-philippe@linaro.org>
 <20241125195626.856992-12-jean-philippe@linaro.org>
 <87wmgqsbp1.fsf@pond.sub.org>
 <Z0XDfyDWc3OZSoj0@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z0XDfyDWc3OZSoj0@redhat.com>
X-TUID: Ox6oOzHfOjMW

On Tue, Nov 26, 2024 at 12:47:59PM +0000, Daniel P. Berrangé wrote:
> On Tue, Nov 26, 2024 at 08:20:42AM +0100, Markus Armbruster wrote:
> > Jean-Philippe Brucker <jean-philippe@linaro.org> writes:
> > 
> > > The Realm Personalization Value (RPV) is provided by the user to
> > > distinguish Realms that have the same initial measurement.
> > >
> > > The user provides up to 64 hexadecimal bytes. They are stored into the
> > > RPV in the same order, zero-padded on the right.
> > >
> > > Cc: Eric Blake <eblake@redhat.com>
> > > Cc: Markus Armbruster <armbru@redhat.com>
> > > Cc: Daniel P. Berrangé <berrange@redhat.com>
> > > Cc: Eduardo Habkost <eduardo@habkost.net>
> > > Acked-by: Markus Armbruster <armbru@redhat.com>
> > > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > > ---
> > > v2->v3: Fix documentation
> > > ---
> > >  qapi/qom.json        |  15 ++++++
> > >  target/arm/kvm-rme.c | 111 +++++++++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 126 insertions(+)
> > >
> > > diff --git a/qapi/qom.json b/qapi/qom.json
> > > index a8beeabf1f..f982850bca 100644
> > > --- a/qapi/qom.json
> > > +++ b/qapi/qom.json
> > > @@ -1068,6 +1068,19 @@
> > >    'data': { '*cpu-affinity': ['uint16'],
> > >              '*node-affinity': ['uint16'] } }
> > >  
> > > +##
> > > +# @RmeGuestProperties:
> > > +#
> > > +# Properties for rme-guest objects.
> > > +#
> > > +# @personalization-value: Realm personalization value, as a 64-byte
> > > +#     hex string. This optional parameter allows to uniquely identify
> > > +#     the VM instance during attestation. (default: 0)
> > 
> > QMP commonly uses base64 for encoding binary data.  Any particular
> > reason to deviate?
> > 
> > Is the "hex string" to be mapped to binary in little or big endian?  Not
> > an issue with base64.
> 
> Agreed, using base64 is preferrable for consistency.

Ack

> 
> > 
> > Nitpick: (default: all-zero), please, for consistency with similar
> > documentation in SevSnpGuestProperties.
> > 
> > > +#
> > > +# Since: 9.3
> 
> There is never any x.3 version of QEMU, as we bump the major
> version once a year. IOW, next release you could target this
> for will be 10.0

Ok good to know

Thanks,
Jean

> 
> > > +##
> > > +{ 'struct': 'RmeGuestProperties',
> > > +  'data': { '*personalization-value': 'str' } }
> > >  
> > >  ##
> > >  # @ObjectType:
> > > @@ -1121,6 +1134,7 @@
> > >      { 'name': 'pr-manager-helper',
> > >        'if': 'CONFIG_LINUX' },
> > >      'qtest',
> > > +    'rme-guest',
> > >      'rng-builtin',
> > >      'rng-egd',
> > >      { 'name': 'rng-random',
> > 
> > The commit message claims the patch adds a parameter.  It actually adds
> > an entire object type.
> 
> The object should be added to qom.json earlier in this series when
> the RmeGuest class is defined, then this patch would merely be adding
> the parameter.
> 
> > 
> > > @@ -1195,6 +1209,7 @@
> > >        'pr-manager-helper':          { 'type': 'PrManagerHelperProperties',
> > >                                        'if': 'CONFIG_LINUX' },
> > >        'qtest':                      'QtestProperties',
> > > +      'rme-guest':                  'RmeGuestProperties',
> > >        'rng-builtin':                'RngProperties',
> > >        'rng-egd':                    'RngEgdProperties',
> > >        'rng-random':                 { 'type': 'RngRandomProperties',
> 
> With regards,
> Daniel
> -- 
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.com :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
> 
