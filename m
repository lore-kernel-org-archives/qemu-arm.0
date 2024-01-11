Received: by 2002:a17:906:6951:b0:a28:f940:7a27 with SMTP id c17csp1580673ejs;
        Thu, 11 Jan 2024 01:39:24 -0800 (PST)
X-Received: by 2002:a7b:c4cb:0:b0:40e:52cf:3c2c with SMTP id g11-20020a7bc4cb000000b0040e52cf3c2cmr233723wmk.73.1704965964414;
        Thu, 11 Jan 2024 01:39:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704965964; cv=none;
        d=google.com; s=arc-20160816;
        b=OjADBmKPAKUPklgIVMiSP8ZdDRzWXGbOX+NrjG1G8QEwVLL2bfcCJijXfIL6p9iBQP
         gLaLTSn07HPO/+egV63YE5W6yGE60//PEiisSod4nf9JSnoKUi3Iw0OVjE47axRWyYXg
         oo99dEHK1AvziLbni3aCk22btnKonHc0XnbJ+KTnXGgjtH7X6+IjwmTbQqppj9+DtkXi
         TIPYqLMZlvLfK5jfjTuZkNQ0mKKFgm1XVdn83Kxcf7hW5tQ0dyX3FQ0ypjoiwP+eB7pB
         H4OSJ+1yj0Bo1NJW6QscXuJKE3KkTazh2ceqk3tvYgusB7k5gIWaJSJsDoxIX3i5Oqjk
         mDDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=VM0HKEU6ibKzztbyzuajNU6Ll6Gt8v2pcXKmTNWCX1k=;
        fh=YfJQs4vmhaCsFGUCd05RVZO4Luj2juKKgTLxaL17HeQ=;
        b=yM2Z/eCmHYslRnJAtv8+zRCH5ZVstjDhP12tlEc+zzVFUPG3o5LXIBWB0xQYCfds+M
         owYiVbuGd6lmXFfwMftu+dxVHvgI09nm3xm8ftJme8PxmEG8/bEKhUosTSNzniTKURd+
         zz0oei1JvzZG9PzBYzhS14hEYAVD3cprGCenUhy29yBrpp2F4nwRHqvCKXT1gT5op3MC
         MKGi2JK1bWI6GoS4c5vp81wjk18fYIWcnNQPw8DW61nVh3QoI6aA89Tv4S5ks8YTX6Hs
         /z8F+xU2oyEOs53IZG7J7V7S3LAUQkYcJGGuIr3L4JsZG11fEVJdTLPXsPzFujddtX9/
         wr5w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VcLkPJbz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k7-20020a05600c0b4700b0040d76046e2csor242492wmr.5.2024.01.11.01.39.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 Jan 2024 01:39:24 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VcLkPJbz;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1704965964; x=1705570764; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=VM0HKEU6ibKzztbyzuajNU6Ll6Gt8v2pcXKmTNWCX1k=;
        b=VcLkPJbzfmSloHeKuUxrr9ZQjFt9WGI5z66sUizBIXNmICfc+1c/VqfG7uKQAsxIqE
         tkwr0/OMAwydSlJhRjonbEM5xTslcZGjbCNv53aT9d1nKxl3RSXg4a+bFqALWIdianta
         1FDfU1gZETS5XgY/nC94xv/yxPDRzURfrEqk0UrFc14UyMcXkINePf1Kx1cIe8BuUROU
         aQD3t6EkfpV1MvBPa4YG3doMgA/Ipu7kgY+kFPKbt4qUVIYPIRiCjhGOG1jf2Zv4exQz
         u5v4dwgHE26ZgXYJp0eKuLkdNaFYKTZL7fydPQd7Po8JTInbSIX84HIR9mAuvpq4OTzj
         OFzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1704965964; x=1705570764;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VM0HKEU6ibKzztbyzuajNU6Ll6Gt8v2pcXKmTNWCX1k=;
        b=MtJC9+eaCViQflw7+b93MRZhdJz4gW2nn5Z5CyZ4ukh6qsAnO2v4eZowxJD59Ydb7D
         rII3kTm5DA0dnLUn0aQhUW+QC+pKw0F5obag5P5ygVK98d1oOh6ScTfz6MR3dzcr5dii
         mbn+Xqm5zISbjqo86/w0vzlbBzu2sexxGnRt6onbdYGbXQNy7xIzJfm2DNRy59swSoRp
         pG91rwl9kHgxDNijdxQwrQO9voyFVmVmdHnhXutOwSPoaBN9BZOLr04Vuz+ip4/spP3F
         ZqvWoWBv4y3D/jUlVGyYcu43KvSlwP/pYldkeSsnqUwdxiDFTwERlz24uWRB/JmFKnIQ
         KRkw==
X-Gm-Message-State: AOJu0YzhrQILGDQnDf7+0Yiq3/K8mrH6A0booxVVVjrqFKepcahLh8fO
	FsYHXBPg7BreuTV/nVGBhYuhaaPTJDnB46Z5
X-Google-Smtp-Source: AGHT+IF2cYqLJHu2UWDuqXDpPX02gIFlgyGX3SyNXha60MpDNU7MZlWY/HBb1vrIX/f7CMfghaFVUw==
X-Received: by 2002:a05:600c:4693:b0:40e:5b66:f4dc with SMTP id p19-20020a05600c469300b0040e5b66f4dcmr213359wmo.7.1704965964029;
        Thu, 11 Jan 2024 01:39:24 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.207.175] (83.red-88-28-3.dynamicip.rima-tde.net. [88.28.3.83])
        by smtp.gmail.com with ESMTPSA id w18-20020a05600c475200b0040d2d33312csm1229961wmo.2.2024.01.11.01.39.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Jan 2024 01:39:23 -0800 (PST)
Message-ID: <ff57e1f5-ea78-459e-b51c-48040483bdea@linaro.org>
Date: Thu, 11 Jan 2024 10:39:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 13/14] hw/arm: Prefer arm_feature(AARCH64) over
 object_property_find(aarch64)
Content-Language: en-US
To: qemu-devel@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Andrew Jones <ajones@ventanamicro.com>
Cc: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-arm@nongnu.org,
 Kevin Wolf <kwolf@redhat.com>, Igor Mitsyanko <i.mitsyanko@gmail.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Radoslaw Biernacki <rad@semihalf.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Leif Lindholm <quic_llindhol@quicinc.com>, Rob Herring <robh@kernel.org>,
 Markus Armbruster <armbru@redhat.com>,
 Alistair Francis <alistair@alistair23.me>, Marc Zyngier <maz@kernel.org>
References: <20240110195329.3995-1-philmd@linaro.org>
 <20240110195329.3995-14-philmd@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20240110195329.3995-14-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: dXAmnEaDZDmV

On 10/1/24 20:53, Philippe Mathieu-Daudé wrote:
> The "aarch64" property is added to ARMCPU when the
> ARM_FEATURE_AARCH64 feature is available. Rather than
> checking whether the QOM property is present, directly
> check the feature.
> 
> Suggested-by: Markus Armbruster <armbru@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   hw/arm/virt.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 49ed5309ff..a43e87874c 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2140,7 +2140,7 @@ static void machvirt_init(MachineState *machine)
>           numa_cpu_pre_plug(&possible_cpus->cpus[cs->cpu_index], DEVICE(cpuobj),
>                             &error_fatal);
>   
> -        aarch64 &= object_property_get_bool(cpuobj, "aarch64", NULL);
> +        aarch64 &= arm_feature(cpu_env(cs), ARM_FEATURE_AARCH64);

So after this patch there are no more use of the ARMCPU "aarch64"
property from code. Still it is exposed via the qom-tree. Thus it
can be set (see aarch64_cpu_set_aarch64). I could understand one
flip this feature to create a custom CPU (as a big-LITTLE setup
as Marc mentioned on IRC), but I don't understand what is the
expected behavior when this is flipped at runtime. Can that
happen in real hardware (how could the guest react to that...)?

Thanks,

Phil.
