Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp1539215lfa;
        Fri, 4 Jun 2021 15:27:32 -0700 (PDT)
X-Received: by 2002:a17:902:265:b029:fa:9420:d2fd with SMTP id 92-20020a1709020265b02900fa9420d2fdmr6385240plc.39.1622845652021;
        Fri, 04 Jun 2021 15:27:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622845652; cv=none;
        d=google.com; s=arc-20160816;
        b=TEtzO9b/7HzeJh1rOyDgrkDTT7IidhCPsJ6h98tYdhauXXZe7Cz6fHnZ3iO9a5ZBD0
         fM+n9Otg7nuZvOlnycDYRYhaKDTXqL/LWAh8y+YqgCML56sI3N14m01XOLnrok2Bu/1Q
         JF2Xe/ETpT2qsHSU1WswrJYSkWUQs5vcAm6UHxZ2dZimS/a/uN5fGiQwV8BOasXAdgIV
         DA2m8PRxDg4n8SeclAvvmGm2z2q25ZJleusNxWz/VS0IVms+orMLXBV2J964oVqE8G16
         JQo9FPxmbJJswJlMGjIk+fMcbyPMmVzmc82V/UVCtYxJvsM3gRwOH5gik031SP3MgRO+
         0tYA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=7selQ+sKpOlsFc3S4SdzFtHuywRIusSg7hbeeXt3k0E=;
        b=ubGx97FSuP5eylPJATACFRauBDxn/nEz2KZVJrfl1IsMHz7Qf6AzKqgKJjq4ctOzSn
         ZNw+XQ9DnfQSwS2kCm6Sn2RpsCM5OBF0zyc53CWU5/OykPuKk7BVOVSIzsVRwpEgzamL
         dbqFDRK9T+gOEn3vKq1GbD6khlFiLGVDy/CXnQonqjISJObPyGPqhEaTu8ZKJAbdkj0T
         AF+L05Ql/brF9By+pBqRJqsm48nzTZsxkFn0h/mTOnFCXgu0weq9aAuaygrWYyh+AacU
         Ew0sXeAIDiX8WcpeZMXD8fOL0S8D4XHksVoFDD+sZgK7LWSGYl3rxjSpUjYFNTGcssfa
         QG7w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jb4teQ+W;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i1sor1867845pgh.24.2021.06.04.15.27.31
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 04 Jun 2021 15:27:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jb4teQ+W;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=7selQ+sKpOlsFc3S4SdzFtHuywRIusSg7hbeeXt3k0E=;
        b=jb4teQ+WyUhE1k1MZEhRsg2EiLycxd5y4SA0fFMe4W1WWOxgQPASMGZoOM0RxpusYR
         JWoerb2cm9SXEFq6m4N9LqBZuXTBOHQjOS3+GlFs0YyGMI1S47EZxql8SAOmwyeo4s8O
         NIloUbL3qJPYZ4TynOKXwM/p3gKpa54UxT1PB3Iux5gFsj0hn4YJK0Uqm77Aysq5koY6
         fn4XyORDyLYTBYsN437lGLfQBwPt/PD4goaSqJ/xDMtH2YD6jCSZAOvKCtVEe02zTGD6
         FeVnpVqVYeBwokv9inzeDS7MzydOlLTeJW8I79wrXalztB2bBy73kjuW5Z41ZFLAMNnX
         Mzdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=7selQ+sKpOlsFc3S4SdzFtHuywRIusSg7hbeeXt3k0E=;
        b=CkLwo7cOqjPZEkQ7Ps20pT10kfzy/FR5LFZ1W8/mcxLkbnDdquq7V8r0yVDdM22rXE
         Ghd7nHuSTBTsIdck77tdEWV6RtZW3nvhecJ9YkRHAe2myAFFRgiErYeexCYY8/uri7if
         dnGT7nOSVECeFG37b0bpQDxVezFTR72qC9k3BLhN202bEMF9R/vS09h8LCmFoTzweQPk
         TXuUTIxUsI19nOD4RSSE9vrjlZiaMB1NdHrbYVvQydOUyIUX4xDbDsnTtnKW5LyQzZls
         46RM4o/N4Q4dqNzw97sqkCbxfXtrEUQ7Q1DT7xlyoC7XlXfdQ3kJokYINS26t8SY217p
         7QZg==
X-Gm-Message-State: AOAM531OO53WaV7PaMjETJZn7pisqgTYZ5bWzl/OJhTpmwxINWo0sTSJ
	C87CGhW/StetH4lirhsXteZ79Pks
X-Google-Smtp-Source: ABdhPJwG9Dg5ORDlIh36z/Wv2WIH0cgvCeajDyLLLkEn4qMNljpBYj0UFlgJrfs911TnM94HxwCAtw==
X-Received: by 2002:a63:594f:: with SMTP id j15mr7152873pgm.244.1622845651569;
        Fri, 04 Jun 2021 15:27:31 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id w1sm2577325pfi.162.2021.06.04.15.27.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 04 Jun 2021 15:27:31 -0700 (PDT)
Subject: Re: [PATCH v16 38/99] target/arm: move arm_sctlr away from tcg
 helpers
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-39-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1f1e6052-15eb-d443-c75c-6cd4b37c7c8e@linaro.org>
Date: Fri, 4 Jun 2021 15:27:29 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-39-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: 2qFSnx+z+ARE

On 6/4/21 8:52 AM, Alex Bennée wrote:
> From: Claudio Fontana<cfontana@suse.de>
> 
> this function is used for kvm too, add it to the
> cpu-common module.
> 
> Signed-off-by: Claudio Fontana<cfontana@suse.de>
> Signed-off-by: Alex Bennée<alex.bennee@linaro.org>
> ---
>   target/arm/cpu-common.c | 11 +++++++++++
>   target/arm/tcg/helper.c | 11 -----------
>   2 files changed, 11 insertions(+), 11 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
