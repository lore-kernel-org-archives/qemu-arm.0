Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp814241wrp;
        Fri, 6 Sep 2019 08:05:56 -0700 (PDT)
X-Received: by 2002:a6b:e514:: with SMTP id y20mr2766753ioc.197.1567782356211;
        Fri, 06 Sep 2019 08:05:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567782356; cv=none;
        d=google.com; s=arc-20160816;
        b=V9n69K6KsQ7SzQIEZc6Y4QQD/EIPoBigv5qFSD3J/B+eeQxt7QOl14AcD0olxDEDyH
         7aZBlQf21g2Q34cyBQLTh1l9AtYRTpRBROOPM6uRlRLkXYDHuSzHvyjvYUitoUsVNATD
         ApXtfWj8VE4Xj7r822FqEyTmm1wE9/YRtqk2wkfxSEIIGfJFke2G1QN9QQbR7LFdFKPe
         QAAtsNPh8vxxLekBHq1W63atrjs4kX3Q4rEHRyCr9JzvOsA2QPvzmHheuWKBsNiJbMqs
         B92690lPtrR9y/kcVnpA/Gqpt8hPYjI+QSbw35dbS0PviaqT7W6gvjfS6gDzVXUQb4eq
         ksFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=Fy5YmNAqcFmQl2O+s2pYG0sex/cikoUa8lQCqM6+K20=;
        b=lee+sdR8Uj6KbJqhWMlnJvVzdev9AfKcyNjAnXVbQQuwEWfDiwNwb3QLVK4nnK4kcO
         xZffoTH+0rpWVc0mxIUpW1ndG4RnPMpLKhWFBy3HnSg1smBPmFYF3unfisQNX5F5Aa+i
         wqiNh0MrupvnA6OS7BqRX+WRIWat8tl+ygjr/eVBvVHlCNQ7N8vey491WWrhb1fLLbss
         XdCzXBHgVB6WIkeExJG9AbWeSK4y9LR48VIR35qCL0T4baUFgsj9UqyWwY61jTlKZI8d
         xUIgZoyNyDFVFA7yVfPHIFP+YICaG9W/Y8+DXOGr9L0JcBFczPgp9etKQTld/yki/8hQ
         24Ag==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HComk8S2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id y10sor10580319jar.1.2019.09.06.08.05.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 06 Sep 2019 08:05:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HComk8S2;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Fy5YmNAqcFmQl2O+s2pYG0sex/cikoUa8lQCqM6+K20=;
        b=HComk8S24CFzQePpm7SJTe9g7yAXFjAQ9cxoH2xEmmreLu5YcjLeHsHZbxRGhdvhfF
         Tb0QdTCml8D26s9Kk99f5bIYPpix7BhkTjAxoUC7/AF5B7j9EZlnTdlHWV9EUvwA6gFK
         C1gGgZM+kDVu4A2c5gQbcjc4MFiAd6wQlh37yOALvhjHxKrkf9/V2eN20OWG11lwqZpv
         GJd/a1eX1HEvhOBpa4kKWRRP1V42qglJspMjCZ9CzIVOHGmLE8ecZ3rz4XdeFIcv4VK8
         85mvBYZluNaWGz3Az/3hnXJi5fxDIJBYm+6yIeAuLnFMXY63hkOPH/MMfYGv/X8nTh/c
         nQEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Fy5YmNAqcFmQl2O+s2pYG0sex/cikoUa8lQCqM6+K20=;
        b=Arn1ubG1TP+nc1mUaX6DyZkClY+x6Mz8Vg/iphaxn8vWQ8zojUps65/lJKAUi5I/VN
         611eMIDxoisqx0fJ+nWBBIfKUbWb/cupoGmkX2RvuJtcOkewwkftqEV4LRtThTUfD3ID
         pvpiA/6x4Rem3aIQROiuiOeu2oGU0foLWV/IomDtBdgFAyZ3ChnrTWUCugIgC2n2C1rt
         2dL5iSUnS4kETb16ChgkQuxjFETARhdjeKPBP0i5Y9hYq//wEwdHg+Jzf3yAUF9vqOGU
         hMCEWREml99m9BPwQsOF+br2/1eKh756LtNdDr5mFoPk01cPAADATqr0WCxlJBB4a6o0
         8+gg==
X-Gm-Message-State: APjAAAVWBx3pixUEonoF+l1jmsBWzIS9RzPpfb+v1zzgaiNeUPGP2EIC
	hj9TItbTjEQ1tBKi990xzAPayRA5
X-Google-Smtp-Source: APXvYqxdWvXJwWQPSa8+xnbj8PhDTMumPwLetBDIwL3i9msLmxKkg+TNazdO3yvgwx9GZN26mBt9jw==
X-Received: by 2002:a02:a403:: with SMTP id c3mr10091380jal.93.1567782355003;
        Fri, 06 Sep 2019 08:05:55 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPv6:2607:fea8:a260:81:78cf:74ad:c2b2:73ef? ([2607:fea8:a260:81:78cf:74ad:c2b2:73ef])
        by smtp.gmail.com with ESMTPSA id z9sm4092949ior.79.2019.09.06.08.05.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 06 Sep 2019 08:05:54 -0700 (PDT)
Subject: Re: [Qemu-devel] [PATCH v3 2/4] target/arm: handle A-profile
 semihosting at translate time
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 peter.maydell@linaro.org
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20190906124706.19145-1-alex.bennee@linaro.org>
 <20190906124706.19145-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <9a2a8938-35d4-c160-e9c4-a5baf934b881@linaro.org>
Date: Fri, 6 Sep 2019 11:05:51 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190906124706.19145-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: jQrEsVoyEc/R

On 9/6/19 8:47 AM, Alex Bennée wrote:
> +    if (semihosting_enabled() &&
> +#ifndef CONFIG_USER_ONLY
> +        s->current_el != 0 &&
> +#endif

!IS_USER(s).


r~
