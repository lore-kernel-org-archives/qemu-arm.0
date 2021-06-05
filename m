Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp2202780lfa;
        Sat, 5 Jun 2021 11:39:37 -0700 (PDT)
X-Received: by 2002:a05:6a00:13a5:b029:2db:85e0:8264 with SMTP id t37-20020a056a0013a5b02902db85e08264mr10354588pfg.10.1622918377480;
        Sat, 05 Jun 2021 11:39:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1622918377; cv=none;
        d=google.com; s=arc-20160816;
        b=UiEB6AE4Auhsn/k4Rxet+iDU1jcEwH+FTTrrfY6aV+Dh6vWKQkG4joAzom+1qI5Kxj
         3dmYHzxzaPuv7hnHVGaeTy0XO7DW3fcxnc1VpRbYP3TyiAHpIKRrfKowRTLaQCujpWBJ
         JY97fl+TSXUzpbRQWnDWiO1AQVeAZ7H5CG2GbpzvGethyw2/5oPGT5jyO0X+Mk/CvL+l
         pmsdPevBRobes1tcNACxrK75S6hBeZjM3wWGKcqOP0h5QLS6MKKO0iBj1ccOu/vvEeJC
         8RZGj2lXc++UzumYbv3cVO/k6JOMWDZpPZmCz2SV0itsHr77UBLuG7vZz8zMuO9jvTTc
         vxCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=SZ7jQNPnzgr/PEHfbbCvtkdSb20nF6IhR0AS1IwPZps=;
        b=h3DsxLGfBbcUysIM6PKPMKXahkdeN4wybN/fzjoRoRUUzRrxyA0a/YvPYsuCrGTnV7
         ykQdPvrMiLBG+GJeGQgXdq/QBLmmR9sy9dqkcf9ngEoGZpUVRPfivUcaAgOWwX1Dk6W/
         L7KXVXcko8xJk725vChDHK9UHLiSIxoV1LjmWo1mOx6j5v8mzOS/tmdIN6zDf1pVvAam
         OsrkR6F11ijufsTGvLXuTjgdtdOuoybWjc3O/zyQYi9im3N4X9HwXVWMX090IP/d1neH
         u23BjU0CrDvAsmgcuIKdFcXl1pr6MwC6srfEQKpGlnCuOKsxEVL8sIZFmX08ZWTRFgTI
         kELQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FypTVuIO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ie21sor3652349pjb.38.2021.06.05.11.39.37
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 05 Jun 2021 11:39:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FypTVuIO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SZ7jQNPnzgr/PEHfbbCvtkdSb20nF6IhR0AS1IwPZps=;
        b=FypTVuIONprKzIU0tLIMcN3To2dgJQ5X8trju2zWjTpGX208FRp2qmUYUSEKDRFbDe
         pKM/qgST8m6q76Z6A8f+hDCFOBinyyQ1K327hfKbuLOU4yvOvzN10JOn5e7MKF8cgCT1
         iaxJKhgUX7iGZTTuSJ5jl3rdHLY2GSzMGVKv7eQurNNdYLUchuP8VCx1h/kTZr9xax+N
         Ux5HobRxfnBbFp+YcUjx1qTwixP+kBgr8ZaaezIH0aiHhcT96zdphfXa93bhzaoNzdri
         7iQME2AQkRG7+2qca/lK3KH+Zqtote7hTuyPn5yHA5USjpNfXT8DsJALJv8Zff8e0NbD
         +oPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SZ7jQNPnzgr/PEHfbbCvtkdSb20nF6IhR0AS1IwPZps=;
        b=XGxBb/WohP9OZj5h1MejdIJ8xkMP/1wc/0fTN5PO4jqqEktE//7deIwvQNAqUAjG6A
         cPDKgcilITyI9CPbPNeXcLH4n3NQA6ThqSTCh/dEO4w/nsXmb346b5d6pJ3mtnZn0XRX
         tJUNuZV1NiZGkN09ovOg9h6sJcMKaK3VeIb6IY9xkuCvnzUQYw6OBH68Y69wvl+wXRAu
         OhPc0JItqr+8feyFbEGDp9S4xwr8uYUcXMYJp10NnW6tFnEq5hDoFWCsV5fO6+2cWdMH
         aplMAfGeh/pOmURUJa9mD5pWv0YKA4+Mcb08DAGcEfMuHBBZjWbcoHOb7ACLs72x0PRu
         1xJQ==
X-Gm-Message-State: AOAM533zdYgPmmXcVQKYfdoQnbKdHBZHUNBs6SXqGnSfSMyPpYlbBKTE
	deuokvZ3Y/zF2jWqYXNHQuKvaMXz
X-Google-Smtp-Source: ABdhPJxGCPKq9Eop5BDumkBy4FGl8voAWyu09ac8taG7AGqu55tvGmIU/ilHH5YtzyEz1btB1K3PVw==
X-Received: by 2002:a17:90a:a512:: with SMTP id a18mr4452964pjq.215.1622918376917;
        Sat, 05 Jun 2021 11:39:36 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
        by smtp.gmail.com with ESMTPSA id j16sm7485302pjn.55.2021.06.05.11.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 05 Jun 2021 11:39:36 -0700 (PDT)
Subject: Re: [PATCH v16 72/99] target/arm: cpu-sve: rename functions according
 to module prefix
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 Claudio Fontana <cfontana@suse.de>
References: <20210604155312.15902-1-alex.bennee@linaro.org>
 <20210604155312.15902-73-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <242f83e4-d573-52cf-240c-4674ea294b51@linaro.org>
Date: Sat, 5 Jun 2021 11:39:34 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210604155312.15902-73-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: YswPYzPB+lfT

On 6/4/21 8:52 AM, Alex Bennée wrote:
> @@ -276,8 +276,8 @@ static void cpu_max_set_sve_max_vq(Object *obj, Visitor *v, const char *name,
>    * of the contents of "name" to determine which bit on which
>    * to operate.
>    */
> -static void cpu_arm_get_sve_vq(Object *obj, Visitor *v, const char *name,
> -                               void *opaque, Error **errp)
> +static void get_prop_vq(Object *obj, Visitor *v, const char *name,
> +                        void *opaque, Error **errp)

The comment above this function needs some renames to match.
Otherwise,
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


> diff --git a/target/arm/kvm/kvm-cpu.c b/target/arm/kvm/kvm-cpu.c
> index a23831e3c6..09aede9319 100644
> --- a/target/arm/kvm/kvm-cpu.c
> +++ b/target/arm/kvm/kvm-cpu.c
> @@ -89,7 +89,7 @@ static void host_cpu_instance_init(Object *obj)
>   
>       kvm_arm_set_cpu_features_from_host(cpu);
>       if (arm_feature(&cpu->env, ARM_FEATURE_AARCH64)) {
> -        aarch64_add_sve_properties(obj);
> +        cpu_sve_add_props(obj);

As an aside, I think this if is always true.  kvm is 64-bit only now.  One can 
start 32-bit guests, with proper host cpu support, but it's the "aarch64" cpu 
property that controls this.  And all cpu properties are processed all at once.


r~
