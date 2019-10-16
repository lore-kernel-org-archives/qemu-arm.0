Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp7076272wrm;
        Wed, 16 Oct 2019 05:26:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxT2J7XckkQjA3IK1hz4LbCPAFD84vhXtLGMLIPOclXz2OUq7+3hYEY7JhP/owtTHcLVTTz
X-Received: by 2002:a92:4743:: with SMTP id u64mr11979889ila.239.1571228769601;
        Wed, 16 Oct 2019 05:26:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571228769; cv=none;
        d=google.com; s=arc-20160816;
        b=NpPLrjSkrVVxKn+ySOInCVgSp1T6FWXWh4Q9vlojOlygiex6NA8hjvtYwDWJxBn2Mv
         x2MExMXMMnNJG+lWfFV5/q+bVmK3Udoa1sYTiCUSB/sQpnUxa78IZfq6S5VlfH2L/Oy8
         HiSFTnzH6ZINFwy3TVt1vxJp2ZBBibBUrrFR4n3zUQF0wc3nkbiPDVSWks22bG/u84YZ
         QTbU9QwFSpclVp5w3p3gLrle43HUJWX7a8XGqg6nMeleM3cAzguxbStjgecX85NKudOe
         A4X/UHToVn0rN9uBxPkKlc1FOpxlP+RbkupsGOzJRI78m9iMLapC4o6/LyQu02S0VuCx
         s8Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=D3fmE5URL3lZrrxnAvrx/BLBCrKFk1+z6Ak/1mn8qEI=;
        b=aCemdTN8gXeHgAANOAptARPQfuHe2HRDBQSbuwNzVEXGCcgLdBCTH9+tIKkTzHBwAk
         sSbgKhyC9OWzqvKqS3SccMke8MQpcDQ1sy1ffHqCZJz3jQDLpNTCKdWyfQkeD168a00W
         tdih8OVyf4cDmGL6RHqV2/hV4iembxQSd/yb2mJtno4ibziuk63BwOFjNg3Pu02vAcRm
         080UeEBqqgAe8eN6WiOOaoClUfwfy3KaaP+yA7pEE62OBN/wy0yOLMMNi0gFVuT+LPwE
         7m1fw3B2H9BoVnJLI1dKtAnrnzlez8uK69UeGq4RBCIR45kGoneTEZonVVHVzJO+1G8J
         xykw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id g205si42242286jac.56.2019.10.16.05.26.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 05:26:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of philmd@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com [209.85.128.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id B0A6E51EE6
	for <alex.bennee@linaro.org>; Wed, 16 Oct 2019 12:26:08 +0000 (UTC)
Received: by mail-wm1-f71.google.com with SMTP id 190so1139582wme.4
        for <alex.bennee@linaro.org>; Wed, 16 Oct 2019 05:26:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=D3fmE5URL3lZrrxnAvrx/BLBCrKFk1+z6Ak/1mn8qEI=;
        b=UFA+1xVRXId/UvOCINryEm/67Id0zgNps7KXfNgvQpRK90KQRYwRkxH+oM9XCuISU2
         UfptEUxxYtHxWzjr129uCgf7DkRo23yVGr/Ie+/pdXs4o6ytjvDxX44gZVlP6HAtnDpJ
         LrumOGg+jYBWsReMRGLCaLvuAWt3wnjdyl5jiuy8l4goCac9XVJfMIFwGAYvSRxfpFwK
         /vEEXzyHJ5DjuInX6O0KhFGyHnhJpB7LwM538hdr0cRQ1t6GeKgZ0pzckuI3w0t66R2G
         VV5FdESGPj6lanieB3eVNv6zR+hJiYOiYEPdKkfXyB71UbmTXXI+Ht2HPLfqB12O6OpU
         oZtA==
X-Gm-Message-State: APjAAAUQv1Sy3YawD+XFhR/KFlTc9zdYQFPvf4fJcPW0mxkCfX+E04M6
	+NQphV3CzXjqv1bPlMOxgMJLZ+5UdQs6CcgIgg9SxWFRIf11pp+tf9qBylyv7nwTV/Fdz3kO2Nm
	nYOcY9esl7X8Mlyt6
X-Received: by 2002:a5d:67c5:: with SMTP id n5mr2617975wrw.72.1571228767489;
        Wed, 16 Oct 2019 05:26:07 -0700 (PDT)
X-Received: by 2002:a5d:67c5:: with SMTP id n5mr2617960wrw.72.1571228767320;
        Wed, 16 Oct 2019 05:26:07 -0700 (PDT)
Received: from [192.168.1.36] (14.red-88-21-201.staticip.rima-tde.net. [88.21.201.14])
        by smtp.gmail.com with ESMTPSA id q124sm3814325wma.5.2019.10.16.05.26.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Oct 2019 05:26:06 -0700 (PDT)
Subject: Re: [PATCH v6 2/9] tests: arm: Introduce cpu feature tests
To: Andrew Jones <drjones@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, peter.maydell@linaro.org,
 richard.henderson@linaro.org, armbru@redhat.com, eric.auger@redhat.com,
 imammedo@redhat.com, alex.bennee@linaro.org, Dave.Martin@arm.com
References: <20191016085408.24360-1-drjones@redhat.com>
 <20191016085408.24360-3-drjones@redhat.com>
 <cec54f08-9508-13e5-600f-3442962a1642@redhat.com>
 <20191016122103.l6vz423k3gpdr2bv@kamzik.brq.redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <626412a4-5c61-1f6e-0f18-7b0d9f754baa@redhat.com>
Date: Wed, 16 Oct 2019 14:26:05 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191016122103.l6vz423k3gpdr2bv@kamzik.brq.redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: QweB2w3uW77K

On 10/16/19 2:21 PM, Andrew Jones wrote:
> On Wed, Oct 16, 2019 at 02:05:24PM +0200, Philippe Mathieu-Daudé wrote:
>>> +static void test_query_cpu_model_expansion_kvm(const void *data)
>>> +{
>>> +    QTestState *qts;
>>> +
>>> +    qts = qtest_init(MACHINE "-accel kvm -cpu host");
>>> +
>>> +    assert_has_feature(qts, "host", "pmu");
>>
>> Have you tried this on a ARM host? I wanted to but don't have access to one
>> :(
>>
> 
> Yes. All code in this series has been tested; covering these
> configurations
> 
>   - TCG aarch64
>   - TCG arm
>   - KVM aarch64 without SVE
>   - KVM aarch64 with SVE
>   - compile tested arm code with CONFIG_KVM enabled

OK, I'd appreciate if someone with ARM hardware can test:

     - KVM arm

Thanks,

Phil.
