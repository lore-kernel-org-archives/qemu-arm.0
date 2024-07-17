Received: by 2002:a17:504:3f1b:b0:1be9:327d:8ee3 with SMTP id x27csp961096njk;
        Wed, 17 Jul 2024 10:44:02 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXQfY+WqEk4eUqdOm0kBeBHQyRDeCqrLf9EROBh1TC9CQ8Ozyus6FTzKWcG040WJbzmII1Om49eJBUqt7d14ZloO0WAzOfe
X-Google-Smtp-Source: AGHT+IE+W+TLQDIphU6HRZK9iELv63GruqkN3wUUk35I+HkctsTisfFMh6fmsc3MyHwi0fGFdnKP
X-Received: by 2002:a05:6214:29e5:b0:6b5:5f1:4811 with SMTP id 6a1803df08f44-6b78e2d9045mr30382416d6.46.1721238242038;
        Wed, 17 Jul 2024 10:44:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1721238242; cv=none;
        d=google.com; s=arc-20160816;
        b=EB4J9owizQgd8v3EnQCYs8eWxsP3U1vLlfQfOTss5xEWPC45OWKaBZgNpR/PWjqDfl
         sd/56e+bkKSkmNifGNlap3AyHTXZoQW6TBLmaVG0nOHrMp8gqlwMieMAoWDxIGLx8fYS
         tDoCHLHiCCJd3GTDavRBe3MbGuBo8V8wSO1O+RaupQ0ivD85AEbbKHxJXmSmceNM+HYD
         NHVbOg+0AfDhQRCzeDcu866uohO2KiwngV2WKmYVO1shWEGlO74RynGj0aZsp85yfnQ2
         /TPezhwtwX1gJ2pfPi7mkfsIueCEzndWA6+1z1RTiCWIy9X5/rmoaElzAF86VuuAJz+8
         XBMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=6YXMXeJtB0QeW3e9c873mC3SsuGh3TloGp0TB0BkWQU=;
        fh=kO6icxpQ5FfQJ2lTEcLCGZZrQMIRlRWsX4L5D0cuq2w=;
        b=ONt4o5cIvSUo+MxMCwWaPdZG9yz5AciK1Jvn5fOUoc4m9uH5LtMHplboGvWpiQOOlO
         ksrAeVYwhFRxB/SyceeyS0ZDFJO0bLWwnpDk2GEWu27rEmZT9mNqWoPiUa+/3sVjE91G
         by0fPbJlwTMHR6SEVJTn+vAr1uRr63qF+XdZ8ZT+61tmiM+Uw7lFhBxfgbZ8rpQz6sfO
         Ajh6T0Oe9NP5hzbxoVsydWGMF0IVcMqKZaatkQG+vEzrzFfQrD1um9Guvo8mVGEZMCHa
         JNI21xB351dXXwdF0Xmvlhy0gs35cpB046HPBkfUDuzUnw8r9K0NAl6jsihSkKQky7IL
         bhfQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dzmz0FEN;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b79c8000ddsi625936d6.395.2024.07.17.10.44.01
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jul 2024 10:44:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Dzmz0FEN;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721238241;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=6YXMXeJtB0QeW3e9c873mC3SsuGh3TloGp0TB0BkWQU=;
	b=Dzmz0FENHKrjwzjyGEBDx/sxrQbXxsdYiMX3LDXK0vAKjumz+RL456hwukzpKcpvGSA33L
	fFRGvKN9DuICcWawseblX2EDLT11jeV0bdMULNVgmR7MsGcS6t5cmRoYDoWulrjr6lPO/v
	r6b/n3mBhT1kzsGjBFrR95fMWOWmzBY=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-267-xmla52SvN2eSZ7ZmOILznA-1; Wed, 17 Jul 2024 13:44:00 -0400
X-MC-Unique: xmla52SvN2eSZ7ZmOILznA-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6b5e4073c5fso396186d6.2
        for <alex.bennee@linaro.org>; Wed, 17 Jul 2024 10:44:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721238240; x=1721843040;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6YXMXeJtB0QeW3e9c873mC3SsuGh3TloGp0TB0BkWQU=;
        b=pT1oB1tsN8dCLtNstbAdQ8N4AnDVjSCnAyGqiMZjop1uaqGsmhu313KGZMVdzrX0CW
         WjiyoJ9urdlT/cONd+yGG2vzLqlfXnpPMZxpGEbAQ4tidErCec739aFwsZFbEt3mYlDs
         K7CKQyXDVIS4H20MF37LdOpff2HKxA2m7msLCHjnyOKXFx0ctgiVd4GWj1qw4/B3iyR3
         McS8quQVa2RHbdOGlUPwkhJgXLZGv3RmXmSeoEe4NwJEfrS/1lGiF0dsI5aiPY6vX8tG
         Fn4cgjavwyx3UPVV2zIbi49B544B3WtFU2etnMatjI17zxouzwI4xj/k4KVd/ko0UB//
         nz5A==
X-Forwarded-Encrypted: i=1; AJvYcCUb/cFiI6AnoHS9PtePwUNzEQLMcJinerXTqHE2kPmxO4evYnbm2H103UdgRVtaZWJAomniHqhb2qjbpcTa4wyxG8G1PEy8
X-Gm-Message-State: AOJu0Yy/FiIc6p0ckaCGaGyLGgnI5Qufg4a8B7edb0Mk/fTrKADsmep+
	Tb7KyPtNfZKuZKfjAJxHcFDp6NjXlW179QwadsmZW8shyFC0ifXuO40z9ZaK66UCnDxhb+V8NOd
	054merWTlJasEJHjL5ehAHTEJ+5+qtHrcec9baCs6xvNvNBX05yjCnQ==
X-Received: by 2002:a05:6214:19c3:b0:6b5:e24b:bb0a with SMTP id 6a1803df08f44-6b78e38ae18mr33647246d6.58.1721238239695;
        Wed, 17 Jul 2024 10:43:59 -0700 (PDT)
X-Received: by 2002:a05:6214:19c3:b0:6b5:e24b:bb0a with SMTP id 6a1803df08f44-6b78e38ae18mr33646936d6.58.1721238239245;
        Wed, 17 Jul 2024 10:43:59 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b79c677763sm428766d6.142.2024.07.17.10.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jul 2024 10:43:58 -0700 (PDT)
Message-ID: <1e7e750b-61bd-4822-8742-124bdf66a7c4@redhat.com>
Date: Wed, 17 Jul 2024 19:43:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [PATCH v5 00/18] SMMUv3 nested translation support
To: Jean-Philippe Brucker <jean-philippe@linaro.org>,
 Mostafa Saleh <smostafa@google.com>
Cc: qemu-arm@nongnu.org, peter.maydell@linaro.org, qemu-devel@nongnu.org,
 alex.bennee@linaro.org, maz@kernel.org, nicolinc@nvidia.com, julien@xen.org,
 richard.henderson@linaro.org, marcin.juszkiewicz@linaro.org
References: <20240715084519.1189624-1-smostafa@google.com>
 <20240717150931.GA3988597@myrica>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240717150931.GA3988597@myrica>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: t7ZDk/3SkJcd

Hi Peter, Richard,

On 7/17/24 17:09, Jean-Philippe Brucker wrote:
> On Mon, Jul 15, 2024 at 08:45:00AM +0000, Mostafa Saleh wrote:
>> Currently, QEMU supports emulating either stage-1 or stage-2 SMMUs
>> but not nested instances.
>> This patch series adds support for nested translation in SMMUv3,
>> this is controlled by property “arm-smmuv3.stage=nested”, and
>> advertised to guests as (IDR0.S1P == 1 && IDR0.S2P == 2)
> For the whole series (3-9, 11, 12, 15, 16, 18):
>
> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>
> (and I think patch 16 is missing Eric's R-b) 

Jean-Philippe and I have followed up the progress of this series,
Mostafa took into account all our comments and all the patches were
reviewed. It seems to be in a pretty decent state so if you don't have
any objection, please consider pulling it for 9.1.

On my end I did some testing in non nesting mode with virtio-net/vhost
and I have not noticed any regression.
Would be nice if someone could send his T-b for the nested part though
(Julien?).

Thanks

Eric
