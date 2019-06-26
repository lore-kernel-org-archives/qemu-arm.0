Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp358604wru;
        Wed, 26 Jun 2019 11:29:09 -0700 (PDT)
X-Received: by 2002:a5d:4949:: with SMTP id r9mr4535238wrs.289.1561573749644;
        Wed, 26 Jun 2019 11:29:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561573749; cv=none;
        d=google.com; s=arc-20160816;
        b=eaUu2m4Ci9AhxjzAP6uBKGFMIqoySHsE7av5JYwWBUjlNbIwuVHZU6cM19h4NjEOtF
         xbZqofD6s8Q/XP7dSbloFWURwCKBoRGFDuVCQvzGHherdv2O50zSI73l6n6L7dWDaguN
         sbPwSX97GZpgfiRjgZzvXwyMBKJJQW6hEjboWb6HSpo91aYhyVUE/dCMHZ2yVI02zJ6y
         3GnKfDFiRxTyHQVdaUvPpRKYyWnV+g/VgQsJRpXF8TuO/dAFh4qWk0Y0L47KJ4sTo5BL
         ucAzWCyfXAcWJR00apNkwd50pIduW4IVNW3NlRQheKmt0b9bfFV//YtHdZHv6K2UYnbE
         bUVA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=rohLCCH3DW1wIMS2KSOyep/+sdviPpS4gXS+9OPP1N8=;
        b=g4PjDs3nYiqsk3DTjXkPbv6t94n/OdDlwC2LE1BqNfoA51+wuIutTXrse6gB5ILlqt
         +uQW1NTJD2gcxZ1PMKXazkgQCngZX8liF8u4QvmjGOzuvLlODav9TpjXpkKrY7Lj7hGI
         F0CsW6riTzjtP/Ov4+AFvQy6j7aaHffDATU+Kc7HJTlmLF0INOclTdSu8LrS+5yqAzkS
         QoYYx0IU+r3ww3zJUTdkAAMkAJV13qYPG18DIA7fklhBAyECa1jt53JKYrRVYHLCW2zA
         m8U8+BPLlc0xzSfkX2XPT+U2Z8ruxVjdDQdPoprFvBWYkiF1dXRKEJ7NNZQzZdS5ONVV
         MeJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ji0IW4Cp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id 75sor13193224wrk.12.2019.06.26.11.29.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 26 Jun 2019 11:29:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ji0IW4Cp;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rohLCCH3DW1wIMS2KSOyep/+sdviPpS4gXS+9OPP1N8=;
        b=Ji0IW4CpZ7Zq6k1Z3xqZ7x/2mfnDJ6tdBRRwNqjUCouFyfgFcVPc+vd+YGQMEeZh89
         /aHYTCwco0fE+/KxmX9h11+LsxObtpVprs3vcBzXRkDFHrIlLtshksZBT/HBElHNdmIr
         VlbdHoSHTIcqVik2MSA+GHhc1jjRC6MKeYVbN9DNhA6L0iuDOOrdW9cETsXGBGJ/Ls5A
         Q6BjYKok8cdz0WDbfKe+WMkax9rD80JvhTcGSOjuEJIyMH3fmUsrPl0OBw8DrQenV82W
         AH/6bt1x7OAPuRcROO2KeJ2c9aYAUGoICimk+fY75w5SJm2sxfusoprve6VrIKrqJgDP
         hvgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rohLCCH3DW1wIMS2KSOyep/+sdviPpS4gXS+9OPP1N8=;
        b=KtlvV+cAxXK1lI5qnvqA2LkOsYuhp8CLMcUzEGm6Bf+4tk5S11zYQVvi8c5HxO3J96
         OtUYo1wv/gHPg/rykgsKKWzcI8KhKuIEBBS2peRmeYWqnHBcmeLGTdL0Doo+0/hgl8ZA
         7Z3XJdbYlkHWjqlHjk81yGo+Sd1EagGRfmoeJ+9FrvCyA9g/o/ZMZ0MOaS96LxgfsK1j
         W0UOqxRnIDau9nlGVCIVYtCPl/9GwTMeY2xI2A3tvmMYYDP+ogUxLf8LT7ZUiS4Mz2Yi
         vxbFMZrN8MJAjaNW8P6ePS0B0EhyBlwXshK5geCOL/tTgPxeexwmLGbitq/8lDPJ5qJs
         5Jow==
X-Gm-Message-State: APjAAAXpnijdOznTe7QLI5GJv9xVZnUskjbur8CH/11n6S6qRndbk7Wb
	4aQg9gNbGXT3bx6n5vn+kqA0kP1q
X-Google-Smtp-Source: APXvYqxOuB3Yv1CpY6A/6jbfqjkiLxoPkphA5kSh2Of5jlQ7YmpVVZqLh3zzg4ZvLwoubFbXAR+Ofg==
X-Received: by 2002:a05:6000:110:: with SMTP id o16mr4454827wrx.200.1561573749365;
        Wed, 26 Jun 2019 11:29:09 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.2.137] (93-34-153-63.ip50.fastwebnet.it. [93.34.153.63])
        by smtp.gmail.com with ESMTPSA id a84sm4264284wmf.29.2019.06.26.11.29.08
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 26 Jun 2019 11:29:08 -0700 (PDT)
Subject: Re: [PATCH v2 11/14] target/arm/kvm64: max cpu: Enable SVE when
 available
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20190621163422.6127-1-drjones@redhat.com>
 <20190621163422.6127-12-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <bd43a392-18a5-b04c-9a52-d4113ab1e5be@linaro.org>
Date: Wed, 26 Jun 2019 13:09:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190621163422.6127-12-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: aBQTFVv43NlV

On 6/21/19 6:34 PM, Andrew Jones wrote:
> @@ -675,6 +689,11 @@ static void aarch64_max_initfn(Object *obj)
>  
>      if (kvm_enabled()) {
>          kvm_arm_set_cpu_features_from_host(cpu);
> +        /*
> +         * KVM doesn't yet support the sve-max-vq property, but
> +         * setting cpu->sve_max_vq is also used to turn SVE on.
> +         */
> +        cpu->sve_max_vq = ARM_SVE_INIT;

Can we support this value with KVM_GET/SET_ONE_REG on ZCR_EL2?  (IIRC KVM
requires VHE to support SVE, so the host is always EL2 and the guest is always
EL1.)

Or do we need to probe this via normal userland prctl?

Or am I getting ahead of the patches to follow?


r~
