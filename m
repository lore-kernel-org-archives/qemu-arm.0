Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp1520422ejc;
        Fri, 27 Jan 2023 16:04:09 -0800 (PST)
X-Received: by 2002:a17:902:e0c2:b0:196:2cc1:50a5 with SMTP id e2-20020a170902e0c200b001962cc150a5mr68958pla.42.1674864248787;
        Fri, 27 Jan 2023 16:04:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674864248; cv=none;
        d=google.com; s=arc-20160816;
        b=FbEfBgojGVZeqsuJ1fWL8syWsbKczzQqaQUev4+I0vkc0fqkQnHH/ic5XDZsamyT+w
         gmBf/m9aXAQ16gjgdCSoQdM+FQNLBPU0J/jteN+saOgOYQke1sBN4wQ0paLGhO2xOWls
         F7KhsiBUPKYVFmejeVy40sTG+vZtfHZWpoiSYbeZDcuwYrrYMrizNRUS2+0vmeDQb/XX
         kZQQj+dm6Xu6nX/AKc47FwjpObLHykMJ1QOUbdEuKHT9/z7f1BM8caK2jeESaVNDqV+7
         NDRf0YnvVw9kzwPnsAOyTRjar0Kawn7aH6Pvw51MIFmG7CZRwvZ6dZRUv2IGB77J9zAk
         Uc9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=4SvC1feFkbBqy7QBIwsr7DmQNEtL+I701d5xBYA4Kl8=;
        b=rnqZaRK+LLT1f/d4tChf1uOyyO6oyoh0F3Q5tbCtmRIVe3wp2NJwMiYLvn4bBc4RX2
         Tabd8bLMNjuhcDdS2k9HLGD67639eLnkCWTfKwT2EtykUibvxbE1GRNiwcs8DCeBF04z
         ZNoJgcdFNB3ZqHrmOl/R4xX1o319bQH4Vq9Hlm83A3LGJRAGTNtDrMTYU5ucPBt52EYi
         3h++uw2hkO/t87qV7yfYhFGBJgfO+NDHmRIsDw9sF6/umZnZE+whxg/sYthCfYvhZKsf
         Z5smjIYn8YvoUMo7ifRG6Y/7uQEIF1IqJ7aQ6Pjg4oWHm06V52O+mknCdu9Lq8zv3AaS
         J+xQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=as0397xB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f14-20020a170902684e00b001963f6b6bf5sor2629851pln.88.2023.01.27.16.04.08
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 27 Jan 2023 16:04:08 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=as0397xB;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4SvC1feFkbBqy7QBIwsr7DmQNEtL+I701d5xBYA4Kl8=;
        b=as0397xBOTkg9YIlJfPvLDrOxcR3GQIJwklYVleFlM6YPKzh4iibDoQpGll4Y1PHML
         0ScKOMg+I6TZnxoMQVVE4oKVudimutX3CLZCI3qefQuo1yLDwLwHHVtLzHjF+ZC/YwZa
         u1HLDtpr92Y4yuyuiv8lMtU7+GsjSuCBn3B8cQB6GLXvq6ExAxLMo6ZIwPTzhQ8oajuq
         BJBVbuk6OO97s8kE0v2VD9bYAD8sKA4t2vDvwm001Eb/EtjDRSh//AblRuAKSRpnLo8q
         oYg3qR4XVCCR0yJnwmBFSJXoI0kt4wiXn58BdD7EhRFGqwhCAw4PfRJfW1VF7LYBodlK
         NCQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4SvC1feFkbBqy7QBIwsr7DmQNEtL+I701d5xBYA4Kl8=;
        b=I75kM9/JI++/Xb4lcso6KNonW1oQZv1UmuWzbZcZ928AjF2hq/aZuGkP9tkUQKFDtF
         AkEQr6/Er3nIYeGeJVCuiXIhAgitdNtlrypbKlo2ANI+w3rbS7UUju4HRXXUjzR+e/bt
         X3Ku8d/Z4RJwVEnWtwvhLZJR1Ckd8M9lGsPBCqeCsGlRmIeZbdMtKQMvtnyS5hcDt9F8
         chWboDFXkrVdQ386DI4VuEJ0wiNxv/9CrywqPf/VlsDda9hQOMtzqXcLxiDwMfFoxQzv
         6mXxKgTThHR7ghBiRxnQQ0M/Bj4R8or+SCgh2oWx5iv/G4qXy3E6y6lW2M0MIAXh59Wr
         fFiA==
X-Gm-Message-State: AO0yUKWGdYj+gBYdHUiCKQVuT5JvVQ1Tzj6KUbKCEsE9srMDZGdr875j
	E84Xdb2wqco2AwQRz6bMnQVthndt
X-Google-Smtp-Source: AK7set+gwomdMBVVWS8JBAcitf8EX9TORI/1i+q5YLsBPIM1IFblRySABjH0BTmGf4DPExYlpkLfyQ==
X-Received: by 2002:a17:902:d491:b0:196:2e10:ba5c with SMTP id c17-20020a170902d49100b001962e10ba5cmr78935plg.49.1674864248339;
        Fri, 27 Jan 2023 16:04:08 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.50.174] (rrcs-173-197-98-118.west.biz.rr.com. [173.197.98.118])
        by smtp.gmail.com with ESMTPSA id jj4-20020a170903048400b00189743ed3b6sm3423602plb.64.2023.01.27.16.04.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Jan 2023 16:04:07 -0800 (PST)
Message-ID: <59472544-bea9-1717-6bf8-ee15503f06e2@linaro.org>
Date: Fri, 27 Jan 2023 14:04:03 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH 10/16] target/arm/kvm-rme: Add measurement algorithm
 property
Content-Language: en-US
To: Jean-Philippe Brucker <jean-philippe@linaro.org>, peter.maydell@linaro.org
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, pbonzini@redhat.com,
 eblake@redhat.com, armbru@redhat.com, berrange@redhat.com,
 eduardo@habkost.net, alex.bennee@linaro.org
References: <20230127150727.612594-1-jean-philippe@linaro.org>
 <20230127150727.612594-11-jean-philippe@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230127150727.612594-11-jean-philippe@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: WPCjF6tFHbra

On 1/27/23 05:07, Jean-Philippe Brucker wrote:
> +    object_class_property_add_str(oc, "measurement-algo",
> +                                  rme_get_measurement_algo,
> +                                  rme_set_measurement_algo);
> +    object_class_property_set_description(oc, "measurement-algo",
> +            "Realm measurement algorithm ('sha256', 'sha512')");

Better as object_property_add_enum, so that you don't duplicate parsing.
C.f. NetFilterDirection.


r~
