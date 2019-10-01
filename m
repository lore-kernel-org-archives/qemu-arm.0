Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp8516733wrp;
        Tue, 1 Oct 2019 10:58:06 -0700 (PDT)
X-Received: by 2002:a63:e444:: with SMTP id i4mr31809222pgk.45.1569952686576;
        Tue, 01 Oct 2019 10:58:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569952686; cv=none;
        d=google.com; s=arc-20160816;
        b=SxmNEGiWNVtNUbcoRnK5ITtiEZ7Jj3VjyzMfl8spaCIdgLWYaCNY07nqShagIO4g1K
         k+m9fcDnYGdg1rB2Cd/iBxOrqmqszVWGrnOBY1yqTjAKbZtL6At+7eUHjvF/ZN4uc2xD
         nOcA4qg+oXTGXXDPN2dLZj3cK0lVdz9QoHuA/JPNag3XxvCFSVBl+lETGlhk6ksDf9wb
         H68QuDRuKculMY1Z7rDAPpj7Xc4GVRkOMVrwZYbabzwSVkerJXgwGB/1F1ZvtitIwMsC
         Cjd1x5utoblBOmMAzgikIkXAypvFxBaPkMa4lhnPYxjvFWXS68lnz7pCWWdIakT44nkm
         JTMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=GpG3ksufPUabInnVHaFmlcM2bJfnLvdb2nUimFeA08Q=;
        b=D2j3AYJuGFQ79BaHT6akc8YzjUepWqa3YFDkjZuVqUCZlK1qJMpXK0mHrEitYGwa9k
         H2E9y/DF2Oc9jAaFzdJT0lw9/qKJDDeTFqlwoiAmbS6eB7vOUvBQbY8AOxlYjuHNzGv3
         JmjkXR0qowK9lmzWZlMUHTYvebzFU+Oi4YxKOw2XM3ArmSVqtQdu6AG4N1XFLZ3QLle9
         UC0n4yapSwovFDhpptmj7A/Ruce1tSQnie3OAcMwJ0c2I/+QojiCnoElg6p0sdOSYU2a
         k7ns+MKYmlSgstNTwIcilVVsZiW7xYiQADFnmsvscZM02Qz9/1OSCOVsEowy3SCK4XFP
         8EuQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xSUCO0Sm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s21sor16451188pfh.73.2019.10.01.10.58.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Oct 2019 10:58:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=xSUCO0Sm;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GpG3ksufPUabInnVHaFmlcM2bJfnLvdb2nUimFeA08Q=;
        b=xSUCO0SmLutHE9MyHtPLHBggp79hImRbJhKlEMdnBZziHfO8misTP5aecFBZi3xcDN
         Rwqncr0enYd9iqO9mFFJp5daLAtE8LAc3cTXnwMiNlk/pJo6DuiMurhB3OAppLS9dE60
         iVtXhQIcsmy3NdFXKwZs8x7kvyrZ+6UOdfAsG/o9LtCQJC1HFyArUm1ebpY65BSbp3ll
         hPHPq1dQwTar4OljFCF3s/figfSn23984qHXxUVF4dDBG8FvW0EYVhOkImISd3ahcOpg
         Xxm5z+MoOdQ3WupgbwLiIIzxCXnENvxEGYhTXMB6Afi7cEu+4wWuVFkwP/XQwQSt940p
         pNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GpG3ksufPUabInnVHaFmlcM2bJfnLvdb2nUimFeA08Q=;
        b=OnRbVqVALN6o6hzs/6Cc/VMXbaE1K2105vQcEPBIFRWKF4/Nm6zpmlw+Wg4VsGGnW9
         wcAC/q7pPn5DAy51PLS3Cc5mm2EYrX2qj5+SobOZVK9Vh0iDjs2t7rbcCIg5hzcUPJst
         GnqitmuYJU8LOpkxNwIAksbM6f/AsjhRZOt8WB0F3UYH4i53fc7bEdIxiYN9c5G+ggXm
         Vcvy4Avr0epYWVgxerpJ56X2O1vq+CZrvWD0BVC+ZkgSzQtfzjK6iPKRVEislNtm2lq1
         3VlK4TUoABFxWJUcIJbLd4No6x/ENQ6jBdHIKUGqCgQ790PBJ/Cxx8JhQY5bfvOAywHC
         JRfA==
X-Gm-Message-State: APjAAAXSPbMAv6X5jTtth3GC//2VANFmUQs2T6vmb4p//c09FLIq1NO1
	jNgoa2VrqUkRL05SXra3rYu9I+pB
X-Google-Smtp-Source: APXvYqzCf1nNyyRE7Snq0KrLW8VzB9cE8x9ERYguQ8gDSSS3ZgQ93bQKAjDattLuGfxFEfmoVZJFJg==
X-Received: by 2002:aa7:9104:: with SMTP id 4mr29339661pfh.176.1569952686018;
        Tue, 01 Oct 2019 10:58:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id o60sm4022122pje.21.2019.10.01.10.58.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 10:58:05 -0700 (PDT)
Subject: Re: [PATCH v5 8/9] target/arm/cpu64: max cpu: Support sve properties
 with KVM
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20191001125845.8793-1-drjones@redhat.com>
 <20191001125845.8793-9-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <231b4353-9c4f-71e3-3337-bf858edabdfc@linaro.org>
Date: Tue, 1 Oct 2019 10:58:03 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001125845.8793-9-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: 2JIbkwr8B5wO

On 10/1/19 5:58 AM, Andrew Jones wrote:
> Extend the SVE vq map initialization and validation with KVM's
> supported vector lengths when KVM is enabled. In order to determine
> and select supported lengths we add two new KVM functions for getting
> and setting the KVM_REG_ARM64_SVE_VLS pseudo-register.
> 
> This patch has been co-authored with Richard Henderson, who reworked
> the target/arm/cpu64.c changes in order to push all the validation and
> auto-enabling/disabling steps into the finalizer, resulting in a nice
> LOC reduction.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
