Received: by 2002:a17:504:5682:b0:1be9:327d:8ee3 with SMTP id r2csp1053006njx;
        Fri, 25 Oct 2024 06:28:42 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVd0WcNFX1/tjZvMcbuJpyiVyNQMcKYN0C3oyDGmrA2pLV2meiyyryXY8xrWoo+C9UZoNgM4eZXmwZMLg==@linaro.org
X-Google-Smtp-Source: AGHT+IGrTbICty6Gd6dWXjZ0pw2lNpTuTGOafuvmo3Np/glAQODBYdkOENExqgrrY/YWpoF3IgfZ
X-Received: by 2002:a05:6214:5347:b0:6d1:72f5:bc6c with SMTP id 6a1803df08f44-6d172f5bcc2mr45913896d6.22.1729862922678;
        Fri, 25 Oct 2024 06:28:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729862922; cv=none;
        d=google.com; s=arc-20240605;
        b=AEWfFEJ3SVdl4CMFZQcZE9BAY9yKY1m4QnQcDxrtvq7dGvVSRCuAOTcL6qDoc8iNNZ
         cgwCv55bKsrqyh5dWy+tMGtkYqAqwyGiWd4M8ITrlRa/qksgZr5GLdzoqscGms0Q5X/g
         xqCEovc7TIZ+YKQ8BWwKgjVnH/Z+ByAgpxIJY2OTv5r7aM0oS9X3v7JypcURwI/NS/ha
         dENNIegwjLE0ptkG2cBonlxMAyQPxpU0hD+jv/MJFytUfADXJJ08+Kqh4GgcztKofzR7
         udoid3wirT9dYfnbBiQxA5uC2NSCcRorirPymdDSzG+WFjXYDx2vZsRWwp07dm1+CENj
         BYSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:dkim-signature;
        bh=jfuBxxkO8cV8uPIqOpQfVwuiKiP8AV2qLKYZ7Y6yiag=;
        fh=euy+9dj2VHtSqnZLVIOF7qXcykvhRjpeyMC1ZW5LbnA=;
        b=fszdN85xbw7R3gUxBfHmuQPZh4tnHR8qiXyV8J4h0OGc2PMGFORaSCfWnV0HeUoyFL
         ofF6jwupLVMOfEJNb5fdDuw+u7GpRx9HgRnj/W4JQ9l9ScXq2mGpICJefuGoJKt4jOEG
         p6XGtqHK9OUDqX1fddcMP29plm+KoQmz4a79k/wxbpxOUp0Xz9mK06Hxd+2RZoYlBe8s
         wo3XVoWr3p4BsBtyG7iQa7s3v3sZHO9iKslEpLmBqDC0UHKZ4uaS+uJLz+h1P/RwlX5X
         qvFCfJzDcxGHCFFXxoNOHU0jV8U4PM9PS3Lm3rdEbQdwhj3HIZjUYyn0ODA9CSWiYZwf
         rnvA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ajsQuJUC;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eric.auger@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id 6a1803df08f44-6d179a7e799si15920256d6.497.2024.10.25.06.28.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Oct 2024 06:28:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ajsQuJUC;
       spf=pass (google.com: domain of eric.auger@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=eric.auger@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1729862922;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jfuBxxkO8cV8uPIqOpQfVwuiKiP8AV2qLKYZ7Y6yiag=;
	b=ajsQuJUC5gMbFi/T5BxG1gD4SeLvsGHBtkYNKaIIDPCTNk1vj7fW/a0VfA/UYiBzsXpQy7
	OSLlqmttfeWSLpqCjtmmMKhQ7S+8Wp11w32GmLc+WYL0myBKMNvV5fXfUtkS2FE52AC85G
	US76AsE4LIwCaP5P32SRs4dyVGXT3Fs=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-35-ImFRXxLPNASeL8K7CpVhbA-1; Fri, 25 Oct 2024 09:28:41 -0400
X-MC-Unique: ImFRXxLPNASeL8K7CpVhbA-1
Received: by mail-lf1-f71.google.com with SMTP id 2adb3069b0e04-53a0b48e8d4so1962862e87.3
        for <alex.bennee@linaro.org>; Fri, 25 Oct 2024 06:28:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729862919; x=1730467719;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jfuBxxkO8cV8uPIqOpQfVwuiKiP8AV2qLKYZ7Y6yiag=;
        b=Ewz7rMMjT9wvpOHAXrnoRjZ9xu3YKymY8PvPInDEpMVM5GBci9ljuJ3q7EI1c5lH+L
         ok3cJggHj/t9KQbjMux0Bg2p433GJbCsGLmKSsGCDRqJLcfmy5TdQ5IlpYW3ipLe2yB2
         jDIaX7g6Are/Sl+PEcIbHdiwVeexJ9Q7qu8wO1BFIKRZWEPXMmqzqQszrewRa/ceSGYg
         yMeZHjk63impGY0EFR1X2kGJUD/xUtA6nBN/DCgLI5vr/9neXBb4mL7Y9D9Snv2yBgnQ
         VSmGtwcC2Ojn47mT4aIkH+U7PqghfOaZHsXO3lbZ04kL+B0Btoe0Bnez7nU6dA7kwjT5
         ZY8A==
X-Forwarded-Encrypted: i=1; AJvYcCVLF/CYBy2V3kMi39cTXUfpA7jltHoVHm2HHiTqOmSaquuphYowhL5UY2dKPWewXHlQiTEk2Y1W3+XzXg==@linaro.org
X-Gm-Message-State: AOJu0YyQIx0zXRWy2vdrlE59lNvaYvjcjsTmPLUZ7V7ok3tw11O3l9Go
	lwPOMF0taP6jaS2hSBflmURQ/6ZjEtx9qeBWj6+HMDa03Qd84f/8pPXGvyoh9Wd4WqcK1HmKvvf
	dkDDozbngZZm4Zj0NEoSKrPIXOuKpbX3ebkjQQItTX8k66Bg2eZQ4gQ==
X-Received: by 2002:a05:6512:2305:b0:539:e88f:2398 with SMTP id 2adb3069b0e04-53b23e8ec21mr3936005e87.39.1729862919496;
        Fri, 25 Oct 2024 06:28:39 -0700 (PDT)
X-Received: by 2002:a05:6512:2305:b0:539:e88f:2398 with SMTP id 2adb3069b0e04-53b23e8ec21mr3935965e87.39.1729862918950;
        Fri, 25 Oct 2024 06:28:38 -0700 (PDT)
Return-Path: <eric.auger@redhat.com>
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874? ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43193572932sm18131515e9.1.2024.10.25.06.28.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Oct 2024 06:28:38 -0700 (PDT)
Message-ID: <0700af51-a1a6-4b11-a4bf-0eaf6e279c6d@redhat.com>
Date: Fri, 25 Oct 2024 15:28:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: eric.auger@redhat.com
Subject: Re: [RFC 21/21] arm/cpu-features: Document custom vcpu model
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: eric.auger.pro@gmail.com, cohuck@redhat.com, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, kvmarm@lists.linux.dev, peter.maydell@linaro.org,
 richard.henderson@linaro.org, alex.bennee@linaro.org, maz@kernel.org,
 oliver.upton@linux.dev, sebott@redhat.com,
 shameerali.kolothum.thodi@huawei.com, armbru@redhat.com,
 abologna@redhat.com, jdenemar@redhat.com, shahuang@redhat.com,
 mark.rutland@arm.com, philmd@linaro.org, pbonzini@redhat.com
References: <20241025101959.601048-1-eric.auger@redhat.com>
 <20241025101959.601048-22-eric.auger@redhat.com>
 <ZxuZkUFz_bwAA1pf@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <ZxuZkUFz_bwAA1pf@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: mDMqGoNXOuXM

Hi Daniel,

On 10/25/24 15:13, Daniel P. Berrangé wrote:
> On Fri, Oct 25, 2024 at 12:17:40PM +0200, Eric Auger wrote:
>> From: Cornelia Huck <cohuck@redhat.com>
>>
>> Add some documentation for the custom model.
>>
>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
>> ---
>>  docs/system/arm/cpu-features.rst | 55 +++++++++++++++++++++++++++-----
>>  1 file changed, 47 insertions(+), 8 deletions(-)
>
>> @@ -167,6 +196,16 @@ disabling many SVE vector lengths would be quite verbose, the ``sve<N>`` CPU
>>  properties have special semantics (see "SVE CPU Property Parsing
>>  Semantics").
>>  
>> +The ``custom`` CPU model needs to be configured via individual ID register
>> +field properties, for example::
>> +
>> +  $ qemu-system-aarch64 -M virt -cpu custom,SYSREG_ID_AA64ISAR0_EL1_DP=0x0
>> +
>> +This forces ID_AA64ISAR0_EL1 DP field to 0.
> What is the "baseline" featureset implied by 'custom' ?
there is no baseline at the moment. By default this is a host
passthrough model.
>
> On x86 we have the named CPU models each setting a baseline that matches
> some corresponding real world silicon. Arm has that too, with TCG at
> least. So that way you know what the baseline is that you're toggling
> features against.
Having named models is the next thing. custom vcpu model is not a named
model. But we don't want to TCG like CPU model (like A57) because we
want to be able to migrate between different machines like Ampere to
NVidia or different Ampere systems. So the baseline must be something
usable by both hosts.
>
> Experiance on x86 was that making arbitrary feature changes on top of the
> named models could often backfire, as there are too many scenarios where
> code will check for feature "Y", and assume that existance of "Y" implies
> existance of "A", "B" and "C" too. So if you invent custom models where
> Y is set, but B is missing, there's decent risk of things going wrong in
> horrible to debug ways.  With that in mind, best practice is to try to
> just the vanilla named CPU models to the greatest extent possible, and
> keep feature toggling to an absolute minimum.  This 'custom' model does
> not seem to give us such ability for arm.
The custom model is not yet a named model. This is rather something to
start this kind of discussion.
The code used by the custom vcpu model allows fine tuning of the ID reg
fields. This code could be reused by named models. We can also imagine
that libvirt does implement the named models, ie. hardcodes some IDReg
fields and thus implement the named model instead. Libvirt could
identify what is the baseline source and dest are the closest to, choose
this baseline and tune few reg id fields if some additional tuning are
needed.

Thanks

Eric
>
> With regards,
> Daniel
