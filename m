Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp705688ejc;
        Fri, 13 Jan 2023 14:01:10 -0800 (PST)
X-Received: by 2002:a05:6a20:28a1:b0:af:7233:5bfc with SMTP id q33-20020a056a2028a100b000af72335bfcmr11802083pzf.8.1673647270596;
        Fri, 13 Jan 2023 14:01:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673647270; cv=none;
        d=google.com; s=arc-20160816;
        b=E/PEseQlyCafSznEvtd3o+3po47e3urhwYcKoCiuqNpS+8j1l6Fk77NdOAUC/XurbQ
         vWu9adRoB5nZkeUzcaJ1BR0YRGN+bVIA447AMdsFDnLTuciLGQvmleuRVhGPgRUb7zNT
         vpiB1mKgAOL5nI/d1iisnUnq9Uwx7YuiS0A+cLd5GZqo/9T7oFtAQRJxNnVYkp/a+VHu
         +BJGq0kvkr3tr8D+hjHMRHMGPEgzArbgNxwLHtViQTB68si0KG6z2ili6t1gyDHpk+jE
         1HTwANiOwVG2z7mUZ8qpSqgWqFOHjWFNB6ypWo4F4W6K/Rq/g7hQ3Mu58spqJ5viqaqQ
         uO2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=fg79wPu6DzfKkM1M68Ys/WsQ0hxdd/okTItA0TVUKeE=;
        b=zSNleBsTdrP02l0YEd0IDXDJKFJqL09FCYU5ZvbmLApJPFRrCao7q1cb9BmTGZhJ42
         dQc3Fp8OjF0/5UPbrcgsJz9hJqsV+Sup9kI8F+LJo83C4I1eQSnCNEQ/IkpBXulqggVN
         Pe5D+zSBucogyaGGN6h2Vg2OaE0f7KAARuhpRFzH90ZD3+mrIZYbrUKTKW3FUlspQsol
         6lgvGQeRtbpZHF0a6tllcqkHLug/Y2U/uZPkGiL0yC8y+yN2tVhzSpj6m/fAtYx1op2b
         kScpWwyKSJzPVJt7WPgD7fCGQJaysGN/acLxlPiHUQb175N/27/tCSio4gRvf6o/Wpan
         XX5A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hOa9c4FO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x23-20020a170902b41700b00174f50a5ae5sor10902445plr.35.2023.01.13.14.01.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Jan 2023 14:01:10 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hOa9c4FO;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fg79wPu6DzfKkM1M68Ys/WsQ0hxdd/okTItA0TVUKeE=;
        b=hOa9c4FOxZPGa1+gJA41OnEqGgr3BClJErbGFmugfmsypBpaGHvrDFaeD9MjmvpINo
         ye/EWeJz1J9ff6tsxemxVz6WNbXEKNPz9X5Q63/dQ5P7gOtkJT3mXT19YUtM7fxOknST
         hP9NvBC9/ycJH2kyOI+qkg8rsS6UXq5SdsQJxs7Fj6DyCZcjF5CeO/DA+RZfAv91iUR6
         46eEZxCuzCvrZrLy7sKDqUg4h8wdSt2S3lt6n2fqYeinu+4To3rVk3AvE9/zAkqBVPIy
         QEVn3olDhU+msaei3DncCvGHulwHjwLVWYoNHbSZZ6BC2zUEA8TFCHPJikW4mNLWoIWy
         4r4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fg79wPu6DzfKkM1M68Ys/WsQ0hxdd/okTItA0TVUKeE=;
        b=wJFkNRt8vRx3UWtORe/xKyZlcOO2XuFJdqlE16G8hDtnRBZz/mVVVqvbIoM3DAkvZr
         JOy45V9bST0wPobfTB+2A00TXubMf1W1ZFEEcYZuHSn3/obtuhb29muUjRZOl1UPGSkR
         4WDyZIPpUGR36pLb35X0THvoXTNKo/QghxiO7KPl8MriXASCv+GtqpOFI/skfnqyTEIa
         G9WRRiD4Ruffg+dycypQ7MkBWPAVIBL/4O6g7zYcax2Z23boBuQCI8EKxKcUKmakq9bW
         kBIbZFpI4xSkYEUnb6zZP8Wky+Yw6Z41ykVx2Wtv/5r3tbMJk0M349+ONTkgF6b/jFyi
         xkMw==
X-Gm-Message-State: AFqh2koWAZluzWVpyM8Q46Uy6rN4B0eUWcXIybstfR+8OPbBTpSFocqB
	jQOOuCQC6bh3BFJYG+T3+NoXiybMqqlGA9/O2HY=
X-Google-Smtp-Source: AMrXdXsju2fbqKabcLe/Zhbus/ngUzGs4WYDsa3TIEfJKo5WZbehxXbRtQkTi1WE1F4KS3LpHfpkng==
X-Received: by 2002:a17:902:ef8c:b0:189:890c:4f6f with SMTP id iz12-20020a170902ef8c00b00189890c4f6fmr11224500plb.64.1673647270133;
        Fri, 13 Jan 2023 14:01:10 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.5.146] (rrcs-173-198-77-218.west.biz.rr.com. [173.198.77.218])
        by smtp.gmail.com with ESMTPSA id q10-20020a170902e30a00b00192a04bc620sm14579835plc.295.2023.01.13.14.01.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jan 2023 14:01:09 -0800 (PST)
Message-ID: <d1edb6d0-2bb9-4923-ea0f-378b6f944fed@linaro.org>
Date: Fri, 13 Jan 2023 12:01:06 -1000
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [RFC PATCH v3 18/28] target/arm: Move common cpu code into cpu.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>
References: <20230113140419.4013-1-farosas@suse.de>
 <20230113140419.4013-19-farosas@suse.de>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230113140419.4013-19-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 9rsnqcslHYng

On 1/13/23 06:04, Fabiano Rosas wrote:
> The cpu_tcg.c file about to be moved into the tcg directory. Move the
> code that is needed for cpus that also work with KVM into cpu.c.
> 
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> ---
>   target/arm/cpu.c     | 76 +++++++++++++++++++++++++++++++++++++++++++
>   target/arm/cpu_tcg.c | 77 --------------------------------------------
>   2 files changed, 76 insertions(+), 77 deletions(-)

Actually, not true.  This is tcg-only.  As is the bulk of aarch64_max_initfn from which 
this is called -- note the first 4 lines of that function:

     if (kvm_enabled() || hvf_enabled()) {
         /* With KVM or HVF, '-cpu max' is identical to '-cpu host' */
         aarch64_host_initfn(obj);
         return;
     }

Thus the rest of the function is only reachable for tcg.


r~
