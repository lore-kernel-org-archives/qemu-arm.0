Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3069981wrg;
        Mon, 13 May 2019 10:19:28 -0700 (PDT)
X-Received: by 2002:a65:63d5:: with SMTP id n21mr32727101pgv.330.1557767968586;
        Mon, 13 May 2019 10:19:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557767968; cv=none;
        d=google.com; s=arc-20160816;
        b=xLurqojA5xkopeOVnYVH01yDd73Ei+hSsUEfQISQeCKPnLX8J4GZN/RVffDOsO4K7Z
         m1+WyTEzRzXG4DfPPXt3ALBpkTBXHwOmFGlScpbbyVvh0H0zsR1hMS0xI4zmKO4dJ/Ab
         5F4LwjaXSTvHRQc3TborsvI8RWuvwDP428nFZJAMhzCjsotxtv5B9SmEXifDlqo/m0qh
         DdRxayxaHzCHGXCMC98D1kw5+GB89J0g+xwwXQU1t50BU9T8UCjamahBvPiyLmMRHm+R
         9Odw0X+CkjVi6ccdfF+FWyeDwUOXiYEMJvyGd+ijCDoBEq2OMcrCjPLBh8dKMVk3F15+
         jHvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=XxwWa2ijAArGPWsus3mu2myK1b43gnq5vviw5SvdiQ8=;
        b=kllg6hLEGTEA36nIbcQDxuw8OClZwbFcptdbtYXp6eMGZmQEarXVmK10VULXFWax7B
         aegjPxq8p///O+dJIJKBNMAjSD2Qyl+VFhzcyTwi7vE85UPZs3GNvradEr9IFsSkAx7t
         vZU/Uw3DEwAJEqFTjtq8LRjphSnyevKOVGfFwJPUlZYQg2ytczg8GO5TFK69LtS+gp7C
         HbQIB4iD9hjX8ESvRMcB9rx+Er+i0MQpmY5NuwssdpcIxrNBJpQjps18dc0v/8HFZjrz
         uYQHDMtrfXtdVjJOyvi3uJ5hUeurP4i5X4Qhz0KJUktCV2KNR+3kzj2bttnRMcjGGp2w
         z49A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FN4oihnz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x68sor17466470pfd.42.2019.05.13.10.19.28
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 13 May 2019 10:19:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FN4oihnz;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XxwWa2ijAArGPWsus3mu2myK1b43gnq5vviw5SvdiQ8=;
        b=FN4oihnzdM8f84+djyrybamm1Ng0iNIvZ6UmimF/pZri7a2KA0y1hLKa0m1BiD8o0F
         r13ypMxzFXHb0+usZf+uaW0P3yK1S7Yy/+BbDgF7uWsMAgLmO1MFNzJSH68OlFuJ+PBO
         zkoINE1ExGEFkhUXae6JO717KO7Mv9y4+VJAaOUzL6/SE4SlFGNP/I+uyceYWN5d3Y83
         HWlm9IX0pb5SjdGu/0PAstcdxu+LgoPIES3hGV76NCH3erWoD6sm/1oumuvqqTLt1eNN
         xGUFMmELPQHrpjmXMTT6jXFDLxK3QH+7hCCgWesSIgqlApD049unmj6xtcODWeo36aQh
         7pNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XxwWa2ijAArGPWsus3mu2myK1b43gnq5vviw5SvdiQ8=;
        b=SZ5/nFaDsnanWZXujLGBN/bY15o3/2umqBUiiAwBXSeHwMw4zM5Vys7fgoE21C2JnQ
         4EtN7o/xrIzz2C1zGOPXdRZNildYy+/brf05BAyKdsSrKzS1OZN2g3+2gkxM5s++1Poh
         HaKvkMcrkByv/Xlt7aM8bMIR7QJUgHrhZZHE92FgBmjG+RpeZ68QwSYs2Z13kgynEZoy
         gJi0SX2y1vwRIdhzALk4QE5tkN3EOQxugCi7bHcoop6KZtGPI2f4owmkO741+h6X6BTK
         +UdJrxisgLL/yOocfxdIxa8dXXVwEeoJstgaHYq1ve3F2n2NDyLmgJ7U1er0/OWOVz+/
         ypBg==
X-Gm-Message-State: APjAAAXSWNF8FIu5Ese3vytx5bueIBI0YooEkvFz4kEb9XgU67USl6xx
	80id7NCuUiZCcMQRJ3AAMqj3E+/g
X-Google-Smtp-Source: APXvYqzEm+QiUBlc5s2j+lc5i0gf6a65KtN2gNwwMM3HI1Dc+nE2vMoGGKIaLvtsLNXF016hAeeWXA==
X-Received: by 2002:a63:a08:: with SMTP id 8mr32301138pgk.46.1557767967909;
        Mon, 13 May 2019 10:19:27 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-13-231.tukw.qwest.net. [97.113.13.231])
        by smtp.gmail.com with ESMTPSA id a3sm18165859pfn.182.2019.05.13.10.19.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 13 May 2019 10:19:27 -0700 (PDT)
Subject: Re: [PATCH 07/13] target/arm/kvm: max cpu: Allow sve max vector
 length setting
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, abologna@redhat.com
References: <20190512083624.8916-1-drjones@redhat.com>
 <20190512083624.8916-8-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <50d07a50-d780-2c73-d9d8-f6eeff6a17c8@linaro.org>
Date: Mon, 13 May 2019 10:19:25 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190512083624.8916-8-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: Tz4EB2tJ6XiU

On 5/12/19 1:36 AM, Andrew Jones wrote:
> @@ -292,7 +292,7 @@ static void aarch64_max_initfn(Object *obj)
>  
>      if (kvm_enabled()) {
>          kvm_arm_set_cpu_features_from_host(cpu);
> -        cpu->sve_max_vq = ARM_MAX_VQ;
> +        cpu->sve_max_vq = -1; /* set in kvm_arch_init_vcpu() */

Perhaps a better comment is "unspecified, to be finalized in ..."

> +    object_property_add(obj, "sve-max-vq", "uint32", cpu_max_get_sve_vq,
> +                        cpu_max_set_sve_vq, NULL, NULL, &error_fatal);

as one can set it here, via the command-line.

> @@ -644,6 +702,24 @@ int kvm_arch_init_vcpu(CPUState *cs)
>      }
>  
>      if (cpu->sve_max_vq) {
> +        uint64_t sve_vls[KVM_ARM64_SVE_VLS_WORDS];
> +        ret = kvm_arm_get_sve_vls(cs, sve_vls);
> +        if (ret < 0) {
> +            return ret;
> +        }
> +        if (cpu->sve_max_vq == -1) {
> +            cpu->sve_max_vq = ret;

You still cannot set a value larger than ARM_MAX_VQ, as that is the fixed
amount of space allocated within the cpu structure.


r~
