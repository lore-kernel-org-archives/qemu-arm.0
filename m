Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2342734lfq;
        Sat, 3 Oct 2020 03:04:01 -0700 (PDT)
X-Received: by 2002:a05:6830:211a:: with SMTP id i26mr1216377otc.101.1601719441593;
        Sat, 03 Oct 2020 03:04:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601719441; cv=none;
        d=google.com; s=arc-20160816;
        b=rPpHIRiYIHZysdaeZIKh3x5RwLl6FsUFqiIteDvz/xFSapnEEFvXdAfw5uCaMqJp+3
         hN1h1PkftmfIPtbBjfT4rd/PzZmIjTxUrxpCD8PQLqTsYn8wI84Oz1tt8sijkZ/GK2kW
         YkKPrkieviQd82mPnx/L4XYCrukZ/CZ3/dxNGOaCwzCwCqVkiCkBaqAitKqlPzRoerg3
         QRA7zhHgc7zZbA68QV3JI3YeJMvn/LQsFPLuhqW20H/d3Yjyre4vlW2LbFfi7aLy55IL
         zml0EH4nGmUYnlhv8ByBKevC4zsUUqDpdyf9XprBWNa4FKmkXWwZsst2zFAfbmQgLzgZ
         Rdig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=cG+rDiGufIRUZmngOUTf5V0P1gEN2vU/I0BKD4lYt1U=;
        b=ktq/MO3ufm+jDdBqbgts/eyubVisCKVl/VNh3fqmztoILf1l5lxkDZwtNwl6UU7Ytl
         bC7vKAsIurtOejH6HHDP39i9x4UBNimxKZfCNlKIlFLEzqqt1FjvAo/mOG8W42TJtM1B
         4C00isRVy07bVXP8cmmbrHtHBM/3HQZFQ+ow553MDs7lA+d/8+JKhzNzuBGToq2e9yQu
         tSNZiTFhLwOjwaz64Fek2EIzVqNJ9eNcDQp635Evj8GPBew/m6fbCm1UosnK3y4amO/Y
         vLhprry+COVTxpFoJygu3khTmapXyBn0mWhqa3d3j7kKBZj5YyadjEtqZnTIgL+g3bD1
         hk1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HdJSC7mD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y133sor833463oiy.95.2020.10.03.03.04.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Oct 2020 03:04:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HdJSC7mD;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=cG+rDiGufIRUZmngOUTf5V0P1gEN2vU/I0BKD4lYt1U=;
        b=HdJSC7mDbiLifLA6qFPvkUWJX0Cfc+6dls/6n6VrDuxJqkAIlTuLnRTeeccAZCwVEq
         WbRW1oCg1sZgeVV5YMgz5+gQR/KoLrI1UQvGKPwV5CEN2zoNmXM/Y8qqKPnnFkHjcBTN
         A4TW+urnAoa+fse2BW7gDWhVtwgWazBcDb8ZCYZVYH9dLDcFbePe6vObYCwKtSNiSffo
         ZVx77zc/+/D1RqLVe5T+pTqzja9KMwWUvT5fXgS3vmCV7lM2APa/mXGQxCyZhsewcmNV
         nO80LcoiyKmAzMqM6uqV7upkTS4QCMgJV7xAjrn90AiPr4B0Z5ywj8Iwwl71vldE3Nny
         owlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=cG+rDiGufIRUZmngOUTf5V0P1gEN2vU/I0BKD4lYt1U=;
        b=OdJMPbzw05DqeCxuTL0sw/iAZehDBKo/ULQY6XnxUCVR5UJ50zdGzA2+r0Mb35rTPl
         iVboBBOIt6ncJJpszT862GswbgGxBmfSzCCekEHIYgAZwTs00rCDPLJ0fAnyfeNQvwvZ
         fc2o47sZOiX8RKJdVSpTw6M4t4wF22afV+BAF9HLSxhPuYNbSv+JBKvgT+XJv6eg0EjL
         lB+F9c/IVEjEVaoALN/SocNSEDtKNQwzGefLF4OqId5x97AjG7qvKl5lpTWbBCRj7jc1
         /+lXX2i+P1tgBeG8NUOveZ0yolfNg8ehN0WqHVYIXbBwpLw0ty4uSiLum2nRxib41fNU
         znLw==
X-Gm-Message-State: AOAM530b9V6fC1Wg6yCN6iu6wDvl9oS4pShH7bsZYaUSeYNx/62rhiBx
	FEayk2/U2xuG3lCOHaEgHhKoi91M
X-Google-Smtp-Source: ABdhPJwIeDtlbvhrW+UehIVEor+MVHY96lsLif2Knq/6uJbUXaH4H8RsDWtuRdpkBSxiFT5aLe+D9A==
X-Received: by 2002:aca:ef03:: with SMTP id n3mr3457690oih.67.1601719441143;
        Sat, 03 Oct 2020 03:04:01 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id j21sm1162131otq.18.2020.10.03.03.03.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 03:04:00 -0700 (PDT)
Subject: Re: [PATCH v4 12/12] .travis.yml: Add a KVM-only Aarch64 job
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>
References: <20200929224355.1224017-1-philmd@redhat.com>
 <20200929224355.1224017-13-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <bd4c4587-de23-7612-48c7-afc8b94ab9fb@linaro.org>
Date: Sat, 3 Oct 2020 05:03:57 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200929224355.1224017-13-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 3h+YkcileVXO

On 9/29/20 5:43 PM, Philippe Mathieu-Daudé wrote:
> Add a job to build QEMU on Aarch64 with TCG disabled, so
> this configuration won't bitrot over time.
> 
> We explicitly modify default-configs/aarch64-softmmu.mak to
> only select the 'virt' and 'SBSA-REF' machines.

I really wish we didn't have to do this.

Can't we e.g. *not* list all of the arm boards explicitly in default-configs,
but use the Kconfig "default y if ..."?

Seems like that would let --disable-tcg work as expected.
One should still be able to create custom configs with e.g.
CONFIG_EXYNOS4=n or CONIFIG_ARM_V4=n, correct?


r~
