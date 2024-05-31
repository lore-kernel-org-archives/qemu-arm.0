Received: by 2002:a17:906:7fcb:b0:a66:557b:2f6e with SMTP id r11csp289780ejs;
        Thu, 30 May 2024 21:47:52 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXJSyWXJINTl54/YPw1JqfdX8idZHJaLTRhzOp8+0HxBoKgOCaUqGjbiI+AGYePHaSALOYVVjSGqD5Zb6BvhH5TpX5mA5Ds
X-Google-Smtp-Source: AGHT+IEY0VzIN3RwUcuTt43LG6yuuUlvWsR2dAVviWbdfwtuKOv2qGuY8lw88bY4961OpUU5JJMI
X-Received: by 2002:a05:620a:2235:b0:794:d3e9:de55 with SMTP id af79cd13be357-794f5ee05d3mr74294585a.72.1717130872597;
        Thu, 30 May 2024 21:47:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717130872; cv=none;
        d=google.com; s=arc-20160816;
        b=NnnQLL7QLzWqSpGtmfGiqvEIXEP6AnzRPS9RQ67Q3L93cbItvinm45g3nyrd3k32hI
         xl3QwsUQ3Qbj6Ef5W1CF+IT6x0hGf8GTELyIbczyay1Az/yW2EU7cdSeF+olJJgnsOYL
         L9GwG1rCmRdRBQhxqyPLeNvcrMQAGBYVZE1EY+hF05DIvqXOm2hSx6fy6gwuiqB+rLIV
         EawtbeGX0mEY549tT82tsnbj+pi+Wvv7ZNTnAjL3IAlTLQ9VMTCtcxpoIfiRyVtl9Ees
         8FJ3/BXAAFr7H8Vz7pwdxpWUmU8B/03VwDtvJRAgnLmSBK12ewKNA5VbRwRgdwvQ/0Ge
         vIsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:autocrypt
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=+P3QGhHKzBu224Iz46o7eOyH6NqOjJOwZK1FHNyFE6k=;
        fh=Cu8nIVAouHdKgXxOS/9Tl/PyofKnaBkA276Zy1WwuaU=;
        b=wYel8K7iK51351lTwSMKSg0lQ3as0ENHh9M6UN+a0R+aMCXOL8axj2YR7rDMSOo9bq
         okvVYUzM6yTSzl8cCNqbAPU5s/EEZPRMLKnwpplFEZbmJEKFTAcJ8FEuT+mL2MrT1qUb
         rmpAS/UqQNVFEs0OuHxRZl+lXK/QzqzURCAl1WWKE4PyyKwjW0yxm6cB6jSL5aXfmnTk
         OOXk4pyvRNt3fxhQwDG/oPGV6KXlh/G5FMceuIRQPbeUL7PCeGhkvnEqVeuE0RF4rF5Y
         SPjlWHAnjnJBaf2q304UyJ/wZHJtHWVqZlRSekZTTf9TAOLYoMjEoHkS5hMyBc/EV7lJ
         ltvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="bFUd/wV2";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id af79cd13be357-794f2f177easi116516685a.169.2024.05.30.21.47.52
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 May 2024 21:47:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="bFUd/wV2";
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717130872;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=+P3QGhHKzBu224Iz46o7eOyH6NqOjJOwZK1FHNyFE6k=;
	b=bFUd/wV29QpyQR+/liuWTxb5brtdKUGow+BDjy1J93hcdiyxSa1uWgRRH28+d2Z9GX/kQx
	8fjEObEgL+yRHUjts6JTQscNuVhknO6yUXWO4OLwoG6JoJ+1lrdNWDS9CpSvUFrY+6/8KM
	EWAR+0AXVIjQGSc8NRWwWTG5ao4AWGQ=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-513-4761bDz7M1q7VEcNPWUnKw-1; Fri, 31 May 2024 00:47:50 -0400
X-MC-Unique: 4761bDz7M1q7VEcNPWUnKw-1
Received: by mail-lj1-f197.google.com with SMTP id 38308e7fff4ca-2ea91ce9225so4642141fa.3
        for <alex.bennee@linaro.org>; Thu, 30 May 2024 21:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717130868; x=1717735668;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+P3QGhHKzBu224Iz46o7eOyH6NqOjJOwZK1FHNyFE6k=;
        b=qNW3VYEsd//mZ3dBnjCVTjz4igGNJU5Zj93wEPk4++uFIDcMutlswIhVbxumbGRvF5
         VbYZ8v97aUs8MKMCSPfZQEDm0VomV75GIoyFk0YQikTWSzcX9x35ezc3Qu39ZQiyYdEl
         pZ8Ge0yBa+SUg+qSrXmcovM09mN801w5RsWujmnSsqB94Ibyph98YMv5+14+IuveyMDP
         Xv6K4PPSyjXL585DzGlONko79zS1ofLoeAbrajRS9gaK4oTptR+b0N7aTfwZs0bWRC9Z
         Pg9XTdHaKOzv0J1S7vC584Zzkz46pVusYc3O5WYXRArseZc9MktIWipaoguNCy99+pAI
         ktFg==
X-Forwarded-Encrypted: i=1; AJvYcCUZnWBOcgSISwKgx+R5b3EF2/i982csqn56zcd/c8/r8mJcSx43L6axkGbov6NpgE1K5BTVhalETSDiBqLdS7FxCBvIdrX0
X-Gm-Message-State: AOJu0YxGQH4b1KiSTqlLNSJ1+2pWo72wQVprqQn8jnDhUjNH3pIEA8uD
	scu0wYRO4XbLFdYwZLXD8cIFVAAYFjc5jYts+Vobaph5YL2q6B7h5/Azv0mc4dxhTeojbgOw9OH
	k1MpXIVEe+p9QZ+0r5xfA4QAvtP8+Ok3TmBTFt+RV9xfe5gsup43iQw12PgvrBA==
X-Received: by 2002:a2e:9d88:0:b0:2e1:9c57:195a with SMTP id 38308e7fff4ca-2ea951de27fmr5502851fa.32.1717130868614;
        Thu, 30 May 2024 21:47:48 -0700 (PDT)
X-Received: by 2002:a2e:9d88:0:b0:2e1:9c57:195a with SMTP id 38308e7fff4ca-2ea951de27fmr5502651fa.32.1717130868104;
        Thu, 30 May 2024 21:47:48 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.4] (ip-109-43-176-229.web.vodafone.de. [109.43.176.229])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a67eb621507sm44372766b.222.2024.05.30.21.47.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 May 2024 21:47:47 -0700 (PDT)
Message-ID: <cb4028fc-9596-47f3-9468-f8912dd48aed@redhat.com>
Date: Fri, 31 May 2024 06:47:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] hw/s390x: Alias @dump-skeys -> @dump-s390-skey and
 deprecate
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Cornelia Huck <cohuck@redhat.com>
Cc: "Dr. David Alan Gilbert" <dave@treblig.org>,
 David Hildenbrand <david@redhat.com>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Christian Borntraeger <borntraeger@linux.ibm.com>,
 =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-s390x@nongnu.org, devel@lists.libvirt.org,
 Eric Farman <farman@linux.ibm.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Markus Armbruster <armbru@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Eric Blake <eblake@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Anton Johansson <anjo@rev.ng>, qemu-arm <qemu-arm@nongnu.org>
References: <20240530074544.25444-1-philmd@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <20240530074544.25444-1-philmd@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: bhKaUnBJcths

On 30/05/2024 09.45, Philippe Mathieu-Daudé wrote:
> We are trying to unify all qemu-system-FOO to a single binary.
> In order to do that we need to remove QAPI target specific code.
> 
> @dump-skeys is only available on qemu-system-s390x. This series
> rename it as @dump-s390-skey, making it available on other
> binaries. We take care of backward compatibility via deprecation.
> 
> Philippe Mathieu-Daudé (4):
>    hw/s390x: Introduce the @dump-s390-skeys QMP command
>    hw/s390x: Introduce the 'dump_s390_skeys' HMP command
>    hw/s390x: Deprecate the HMP 'dump_skeys' command
>    hw/s390x: Deprecate the QMP @dump-skeys command

Why do we have to rename the command? Just for the sake of it? I think 
renaming HMP commands is maybe ok, but breaking the API in QMP is something 
you should consider twice.

And even if we decide to rename ... maybe we should discuss whether it makes 
sense to come up with a generic command instead: As far as I know, ARM also 
has something similar, called MTE. Maybe we also want to dump MTE keys one 
day? So the new command should maybe be called "dump-memory-keys" instead? 
Or should it maybe rather be an option to the existing "dump-guest-memory" 
command instead?

  Thomas
