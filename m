Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp4661813ejc;
        Mon, 6 Mar 2023 05:48:21 -0800 (PST)
X-Google-Smtp-Source: AK7set8a7UpkHCs7B0P1lCuK4PSOu5t5YUaE221r2C8YjxLQqu27FL6TbThfUgOQRvr8+QSDi3vY
X-Received: by 2002:ac8:5bc1:0:b0:3bd:48:7097 with SMTP id b1-20020ac85bc1000000b003bd00487097mr18677760qtb.49.1678110501086;
        Mon, 06 Mar 2023 05:48:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678110501; cv=none;
        d=google.com; s=arc-20160816;
        b=yIn98NbmcJMY1AIr0FTtHRQbei4uVZtV7D7qxIHcE/XsbqDykHXweY10tx95BjUJ4j
         +UnqFwwueJGHTsVY7Ywz5VIFzrGVDOeJH/z+0RZuP+UVGrL+JgOsVygHTACUrvf/m9nu
         VgfpFz03g1h5MgLYDRsorkK1AR8gOEPhetOdIOho5RSvd14b05Bvj+ukGPXhq4BCjEvA
         MkgkOd0n4xDIKQfP0Xkoix5bHtXpz3SpN28Ug2mc14VlVbSQc+mXp+4cSZBcHnpzX5TW
         4iXrzpynuoIVyuHglnuNPdRQ52QCQpMIMHvFGwHpnELNO5PU36iHO6QgmXdEVp/7QpJj
         k+9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=Xp1uVGpz5WAE3d5wBHh+CPfxFFEftI2bHpCIHpoRqB8=;
        b=SEyOlpCeFCkWtwv637ZaJuivZIoZIcTIkYLI4Mp9jBJBMaQLuT7HsvF3DzWm8K20EG
         yhYYZvwgMK5Hpq0Joo9vZAGV5Tc0bF4PpwRxnxMXoAWAbr02ZlKuyMWY4gBCvO/C6/oT
         p3pSaOMXzE42oKCveyaJTdJ0MXJlM+3uhdxkILRJiqd6ZQJja5nEK6DlZAZj2+H+J9Pa
         Dy7K/KsiENjg2UDbUG2Nq0GfeHTWHKF4OButgAC6koYY4zEnHtD4ejF4cVM6zV7etr54
         vkpY2Jdp2W8qmK7FpOVzRHio06l2YkaI+6F90RlkgaGiA606MUqo02UFq99hSAYYEuJU
         eCVQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CBbznj+X;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id u9-20020a05622a14c900b003bfc3657f6esi7251591qtx.723.2023.03.06.05.48.20
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Mar 2023 05:48:21 -0800 (PST)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=CBbznj+X;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1678110500;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Xp1uVGpz5WAE3d5wBHh+CPfxFFEftI2bHpCIHpoRqB8=;
	b=CBbznj+XNypeHstq3v2m+JWUDy/+SoSw4JJQBAMtYTIgseDWbwh2p1ecrYiAgDTRdRWeA7
	DTTolU0madM+c20AoIB5/bmZ0KYTUhbLZIOtHJdpkNRSYpTvsEUBJluiHYYfckaRB1ieUK
	76p/BiREzZNKqXR+fGOkF/vjTN5JCt8=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-281-SB0jPHC9MLaOp52cItGSFA-1; Mon, 06 Mar 2023 08:48:19 -0500
X-MC-Unique: SB0jPHC9MLaOp52cItGSFA-1
Received: by mail-wm1-f71.google.com with SMTP id e22-20020a05600c219600b003e000facbb1so6759397wme.9
        for <alex.bennee@linaro.org>; Mon, 06 Mar 2023 05:48:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678110498;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xp1uVGpz5WAE3d5wBHh+CPfxFFEftI2bHpCIHpoRqB8=;
        b=pN6GyW/SMa90Tk2EvI9BIiw6hakmJxzSN1mjIM74kRaCOe2XK5oF9pqFCWBSXYRH2o
         JIzJzYL5xtG+dna/j/4XZVX3GZ4u9oGRk0R3cGIH+1xxeq6wyDxf0X1wfsweVUS/kBcX
         2knT77xj+/xoMKrIJiR2btTnfp6c4wncjlq9xZv17xq2JIdOdxg3wnKF2cbXFwX6opoL
         7yQSerMydmBCLODfqbrjKUB2X8aB7Gtj5IAmI844cYWsQcaq5+GlRt9j695AvY6K61JV
         8fjI/lb5lWoplgLyBIvIxmDYDz2vFDQSrjDJjNeVYvyeF5/Q3Nq3v0pZ+lhrfrDZ8vYq
         Hg3w==
X-Gm-Message-State: AO0yUKV48YvMqlPZ8e7IgqRO3GXi6s3UG/hFKkeKst6Q9gK9TQBQ27sL
	m80ZZcxg/M3uyrIZ+V3RVK8havUtvWrKty9MlGKmipPlThspWCKLdP8fWDU0GWI7fziF8A46Qvy
	/v4M7W08MQBvfzG4A
X-Received: by 2002:a05:600c:190b:b0:3eb:38e6:f64f with SMTP id j11-20020a05600c190b00b003eb38e6f64fmr9267073wmq.8.1678110498644;
        Mon, 06 Mar 2023 05:48:18 -0800 (PST)
X-Received: by 2002:a05:600c:190b:b0:3eb:38e6:f64f with SMTP id j11-20020a05600c190b00b003eb38e6f64fmr9267050wmq.8.1678110498419;
        Mon, 06 Mar 2023 05:48:18 -0800 (PST)
Return-Path: <thuth@redhat.com>
Received: from [192.168.0.2] (ip-109-43-177-59.web.vodafone.de. [109.43.177.59])
        by smtp.gmail.com with ESMTPSA id p21-20020a05600c431500b003daf672a616sm10046951wme.22.2023.03.06.05.48.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 06 Mar 2023 05:48:17 -0800 (PST)
Message-ID: <a97c8b6d-8e58-82b5-d73f-72a7061fb5d4@redhat.com>
Date: Mon, 6 Mar 2023 14:48:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH v4 2/5] docs/about/deprecated: Deprecate the
 qemu-system-i386 binary
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Markus Armbruster <armbru@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org,
 Maxim Levitsky <mlevitsk@redhat.com>, libvir-list@redhat.com,
 Richard Henderson <richard.henderson@linaro.org>,
 xen-devel@lists.xenproject.org, Reinoud Zandijk <reinoud@netbsd.org>,
 Wilfred Mallawa <wilfred.mallawa@wdc.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>
References: <20230306084658.29709-1-thuth@redhat.com>
 <20230306084658.29709-3-thuth@redhat.com> <ZAWx5eBskd1cItDx@redhat.com>
From: Thomas Huth <thuth@redhat.com>
In-Reply-To: <ZAWx5eBskd1cItDx@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: ci6ULsSO4vI+

On 06/03/2023 10.27, Daniel P. Berrangé wrote:
> On Mon, Mar 06, 2023 at 09:46:55AM +0100, Thomas Huth wrote:
>> [...] If a 32-bit CPU guest
>> +environment should be enforced, you can switch off the "long mode" CPU
>> +flag, e.g. with ``-cpu max,lm=off``.
> 
> I had the idea to check this today and this is not quite sufficient,
[...]
> A further difference is that qemy-system-i686 does not appear to enable
> the 'syscall' flag, but I've not figured out where that difference is
> coming from in the code.

I think I just spotted this by accident in target/i386/cpu.c
around line 637:

#ifdef TARGET_X86_64
#define TCG_EXT2_X86_64_FEATURES (CPUID_EXT2_SYSCALL | CPUID_EXT2_LM)
#else
#define TCG_EXT2_X86_64_FEATURES 0
#endif

  Thomas
