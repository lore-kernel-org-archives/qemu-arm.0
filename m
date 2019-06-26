Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp358700wru;
        Wed, 26 Jun 2019 11:29:15 -0700 (PDT)
X-Received: by 2002:adf:dc45:: with SMTP id m5mr4767905wrj.148.1561573755577;
        Wed, 26 Jun 2019 11:29:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561573755; cv=none;
        d=google.com; s=arc-20160816;
        b=LbQ5oEqIGUc9iMOAXKHYDDDClBJM172V4CHJ6uqr5OJG5zP5cqBikWgQuTpAC8+sji
         gfKER+LHJQ8v0JUpBf1Pm23hwyCDSXRarsf8FvbdqBIsc9yqG34yq6qDT9aRluvV1iDW
         aLxCksefH7hzaY6CRtCyfoXuKOADxZDhvAET5+y6gpFioXf3EvePfM4zhpjhUV+TJVNi
         nWMYFyK6DNWauNjC9XSXWAnRcViRYdvOtsQsCEDS9VduLCrDUsSgmLABpEtacQiljT+O
         9vnkNYfzDM0SBXzih4ooYqwxYqBj6dgeSdMn0wRH3+N9ZDAE59D1ShAa3NKIhj+QV9Pz
         HbWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=n3YkOEVUPRaKEULHS1Gzl/S5jvMt2zT4d79BA6WQFVk=;
        b=aJp2FYYq47l/ic5bgyV3E4/EKIb0xTos9ePX81rCFCgCx1drNP91MvHbfxO7h/M68S
         lPJ7NpIyBHw3dil8NIsJTuMyC7dPSRrGM8O+aTEXoqR78UX7pqyeIru4Ftx8tai08apX
         kJr4+A3f2uUzvZpeP+ep00xS9GQyzzNOybNb+nh4vOsI7J4AcuToy5zwByisC5bqYGxx
         xh3iJWLICrtjqpyc4TH/qsuVS8DBlCZnif3xT0GDGvEK5XoRHNHa/UZ9ZrVEdKpM9T44
         IyIkBFfUML9B8Pe06qYilRZlOFhkM/FKyveQceRFMdxvwpMNuDgXmiyOQ4E5lE7HcYAh
         wTzQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uiQNBUaX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id g29sor9432449wrb.16.2019.06.26.11.29.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 26 Jun 2019 11:29:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=uiQNBUaX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=n3YkOEVUPRaKEULHS1Gzl/S5jvMt2zT4d79BA6WQFVk=;
        b=uiQNBUaXa29Gqmi5QC15DLBZoLVs0XXbFDquCUaCqd/6/tWYWyJfCQ1wiii6GBT1lq
         L3cUjsT3NBdopSZZDe4/41NvQCcEjVURS3YlJbCCRjffMkYNCB2kSY04OsmdAmlKx86W
         a7RVem45mdQRJ+xGqert/+rrniVuDU55MVCwUz8JkDREpx9DwWLkV89a+xl+vZWm7kSr
         g5ziA3mLeBy97Lj46+ow5b9iqMgq+iOb+IhmwRJZ/3IgQsNsXA/uWs+ywji9aLr3IjAZ
         hww5muX7T2LVNvPzChfMOyes2kSlyBoxTSOWHcAxVdCeCZF6Wh64SX4fbO+gjqiJDwSP
         4qrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=n3YkOEVUPRaKEULHS1Gzl/S5jvMt2zT4d79BA6WQFVk=;
        b=XxtZU9DCjKf7WWtUqJhekp2yiQaZL+e5P09rbV7xXjUIu1POHZAofyYL7aW5kxtNGa
         kOtjqD4ZotenbSNdkSd/yiWEe+KctM+E3CUzDBSKVrixnS4hH3pBnc3TsaT1E8VGGJbS
         y+lVQwZSNkS1x/LoJi+AqzPSEL6zWQJh+EiqjTcQxScOc5k1ifmmqv7yg34flYPUnh+z
         y+z12fvPcaWbxlnbFtm9YIz4I71j7vkXmctiSKxzQrRFFxtw90O3+KSzbhpDGMcCi30A
         tzlWZmInfAOGDR2YT41gGqLrxDglnGyx+ML4y3AI07YzoiSZ+e7K6XHAoLMbwujKY87l
         ejfQ==
X-Gm-Message-State: APjAAAVdaqZNT4/lnrJeLqORh/W+RgFpsS7WIDrPderjkulEfss1l54q
	lm2d6rcbqpT6GoGBc7oeeeBpYfeT
X-Google-Smtp-Source: APXvYqxS4k5Ds+/EqCduvsf9WJjkJc3fyPnY9jW2DFjyd+wSoBaHPHJbWa0nAaEacibQVVQdTsgvaw==
X-Received: by 2002:adf:f649:: with SMTP id x9mr4351295wrp.86.1561573755313;
        Wed, 26 Jun 2019 11:29:15 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it. [93.34.153.63])
        by smtp.gmail.com with ESMTPSA id o11sm3350513wmh.37.2019.06.26.11.29.14
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 11:29:14 -0700 (PDT)
Subject: Re: [PATCH v2 08/14] target/arm/kvm64: Fix error returns
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-9-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <90009b4b-0f96-89b2-a401-9d84a8b2526e@linaro.org>
Date: Wed, 26 Jun 2019 13:50:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190621163422.6127-9-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: gacNVQA01Dxa

On 6/21/19 6:34 PM, Andrew Jones wrote:
> A couple return -EINVAL's forgot their '-'s.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---
>  target/arm/kvm64.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
