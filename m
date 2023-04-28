Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp178987ejm;
        Fri, 28 Apr 2023 15:37:10 -0700 (PDT)
X-Received: by 2002:adf:e911:0:b0:2f6:661:c03c with SMTP id f17-20020adfe911000000b002f60661c03cmr5413480wrm.28.1682721430835;
        Fri, 28 Apr 2023 15:37:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1682721430; cv=none;
        d=google.com; s=arc-20160816;
        b=pHfHdcV0cp3lPwwduwPnRBQrUzt2JxCoP3/HHpnBbdxAb9GazIbHqoa/Gi6TAMCtGa
         ysV8p+L6GqpCNE3cjoIBv4SCQT2J7rdzLk6mo/KTOgzpcizIccW1IAaiQj5znzTiDPjb
         BmHQb21gOlTFX+qAetgDsS8hpn3lhCo5bzzuPrwe0XRb7WQJ/M7/bsUHP7jV8u/L2wi6
         i9ysXluOisisQ57P966VspF4BGTHjhEN8mFhNNJ1rrqEvgyTTdWXQqm7Lp0TW659E+Be
         vPNQsDC3J5xuSZh7q8sGqV29UTzNMhNxew7ZbO8EMp/8Vn+Njlwp09qPJof3ywtLHK0D
         9RCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=NJbJykr/INsV1uYXaU0jMtwgdpc2qfAaY6+u7ZR54vc=;
        b=KfVrYLI6YGy3RvGsv2sLo1sY/AqVbY2kEF7v0fTzYX4zVuCrBJxYqKi/6eestIwPxE
         9UZJUWuxhYgT2xIUdEgsyJARCfRGIFN9XezPlSx4o7lIsAhHnGma4nR7UpXdBIWK6wlS
         SimQcxV/e3ByJzUqf9Z9FLvFScBkGqr5VG+jpYbXzAsK4q8wOxqgzbGQC4gDkjrq9xw2
         sMzJYr3mHvwOi82z7h2BMF0U6BZ+r1A4oD9PhnCMHDPqw5TlNOqJUR77UgNBeygi8ru/
         6IQZaYqOqiowGBnCc0BmIe3qO9gSxrs8NO/oevnCgQ7lwB1PmXjA+75a/jzst1i4jL5/
         UXUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A8LDqMDZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id x17-20020a5d4911000000b002f54946afd0sor8898207wrq.69.2023.04.28.15.37.10
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 28 Apr 2023 15:37:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=A8LDqMDZ;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1682721430; x=1685313430;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NJbJykr/INsV1uYXaU0jMtwgdpc2qfAaY6+u7ZR54vc=;
        b=A8LDqMDZwDmGhmDwKQPfphgYlax3mJYMZMZuxC+uTHHvPO0SOdv8rgO0s+1WpEWcn3
         BPSBWHrh6L4XaAjD7TxUrYC0PfnVomRs0kgWBJqtQ9QWSN2g9SZFBZ1W9iuFeggX/qBE
         eP4hhv6MfB2tIJVVrstc02g4m3zOH3+RODCx9T51F/nWxEZqho323djF/fbUxPqEwl++
         SiLd+haaUVFcLtjdSkrjNb5t+ta1qbS5Gwbk0ahWz+/l8rDMrMmQcaA1Zf363OLZHzOz
         0x1NVgLss+o8s03FRrP6W8l+PxIT7BSVaYEUKjwEuIqrdR5mrGHgQA4DLKSyu45dCHE0
         ER6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1682721430; x=1685313430;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NJbJykr/INsV1uYXaU0jMtwgdpc2qfAaY6+u7ZR54vc=;
        b=SskAy3w+N1AFs229ffFuydV1Ra+MEMdWwet+kmIdg8seevCC1s+I+EpA1GkRbyHW/D
         jwwXR0T1UTRim8GpGiPLqyweRRXw1WGJjPKRN4rdQYn2Qc41xXksVdyk6Ok0vwRQcxrj
         FV4I0jC8d/v8+a7w2wNdl5015imJFC1Jk8eKqz0McGmSToh2WI4b1ubgYOJxpEB0/d+M
         RNDgCsSeoX6w7Fxm+Y7dJuPw/6LWHXj5rDIIr6ujrJOZfEJZHcCOLE3xdRmdkQ5n906e
         qSfHamjq54OPS1PjwfoHSh4hVbXmhE00tWrCrdxsrTegy5YY7cbamn/2W9P+hyEgm7m/
         7pJg==
X-Gm-Message-State: AC+VfDzNiPhPAZ4jUmy+mErLZaZh96Ah56apIcwJroWsJPIlak2Y7hnP
	5XVy5bMiolyfG7lDqaXa0ct0EzW7
X-Google-Smtp-Source: ACHHUZ5dElpqekjLlyXw1SjTa6Nj5mZQXAJmbiZhTMbxSVPzfLqct84A9IWpxt8DHDhh7YQxR4RVKw==
X-Received: by 2002:adf:ff81:0:b0:2d0:58f9:a6b with SMTP id j1-20020adfff81000000b002d058f90a6bmr8122633wrr.13.1682721430504;
        Fri, 28 Apr 2023 15:37:10 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.192.175] (47.red-88-28-19.dynamicip.rima-tde.net. [88.28.19.47])
        by smtp.gmail.com with ESMTPSA id g9-20020a05600c000900b003f0aa490336sm28797891wmc.26.2023.04.28.15.37.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Apr 2023 15:37:10 -0700 (PDT)
Message-ID: <f29b7c51-97d2-96b6-077d-71ceb246f41c@linaro.org>
Date: Fri, 28 Apr 2023 23:37:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.10.0
Subject: Re: [PATCH v11 07/13] target/arm: move cpu_tcg to tcg/cpu32.c
Content-Language: en-US
To: Fabiano Rosas <farosas@suse.de>, qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Claudio Fontana <cfontana@suse.de>,
 Eduardo Habkost <ehabkost@redhat.com>, Alexander Graf <agraf@csgraf.de>,
 Cornelia Huck <cohuck@redhat.com>, Thomas Huth <thuth@redhat.com>
References: <20230426180013.14814-1-farosas@suse.de>
 <20230426180013.14814-8-farosas@suse.de>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230426180013.14814-8-farosas@suse.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 2b6Q+1NFKxPX

On 26/4/23 20:00, Fabiano Rosas wrote:
> From: Claudio Fontana <cfontana@suse.de>
> 
> move the module containing cpu models definitions
> for 32bit TCG-only CPUs to tcg/ and rename it for clarity.
> 
> Signed-off-by: Claudio Fontana <cfontana@suse.de>
> Signed-off-by: Fabiano Rosas <farosas@suse.de>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Acked-by: Thomas Huth <thuth@redhat.com>
> ---
>   hw/arm/virt.c                         |  2 --
>   target/arm/meson.build                |  1 -
>   target/arm/{cpu_tcg.c => tcg/cpu32.c} | 13 +++----------
>   target/arm/tcg/cpu64.c                |  2 +-
>   target/arm/tcg/meson.build            |  1 +
>   5 files changed, 5 insertions(+), 14 deletions(-)
>   rename target/arm/{cpu_tcg.c => tcg/cpu32.c} (99%)

I think it took almost 3 years to get this in... :)

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>

