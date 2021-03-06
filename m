Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp838809lfg;
        Fri, 5 Mar 2021 17:27:41 -0800 (PST)
X-Received: by 2002:a17:90a:7104:: with SMTP id h4mr12607103pjk.189.1614994061297;
        Fri, 05 Mar 2021 17:27:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614994061; cv=none;
        d=google.com; s=arc-20160816;
        b=MbJuWQ4m0bfcHzRgM+YjMXEACL8rh6Ly1ac5PJ10EgEBKKnNddO1ojoFv4GT2XwtWN
         DOzp+3OtoWIkfOVOQcGYzJW6syXgvD1YYG7TI/gjiXJ+No3s7CaLSNb/DJe69/2SwU56
         b+WRtQcY05lLh5D3C+M+yBFWNHf6o8N/6d9gAb4p5lPKq4M4en3rgBruSxGTjnoYyRxM
         licWs72cs4scy27qyehI+eGmRnT/EKWPD+b40vS2++edV02/iKl3JexMuvT5Ga7pivnY
         Pf2gsbkHOHEonmg1/wTn1ifTBvGKGQUqKPq849Er4465V6RDNd72pBgPxLOczG4ldlru
         8GOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Bext7Uzqjj9nVzO96fA6YlKGegXrH8woj2XV53BabsQ=;
        b=J0RBWzSDeFoZ8iilQoj9Z0zT4cybKJWm9Kj45UWKTv93mx3AS2LYLwJXUvEVdU8oUd
         r31qw19LdsjKSAyN+X3V3Y9/7xcwg9C+hXF66zV00J1p4n9csUjAUe9EicdBReJLfnsO
         RW1ZoT5LjlfsgOtDEApyhEz/2hKWSXx8vTMudkJH+xYVcr5KTKf93lzPtoce4mUrYCXV
         Vj35Y6YuaMmXAgCu0+JItqfEEVnHgAPJJy7O0nmvCkxnsuXvwX3UPF8rRXdQFYVBN46b
         9S9exN7cFbUlaWxuq8Rv3n1zWEYMgsGxv4d4lrCStujOQE+9QVynevTY+Hofpcmhz5kC
         5cZg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gdB5h4po;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s20sor2297220pgg.62.2021.03.05.17.27.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 05 Mar 2021 17:27:41 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gdB5h4po;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Bext7Uzqjj9nVzO96fA6YlKGegXrH8woj2XV53BabsQ=;
        b=gdB5h4po7ZluvwV2kF5QJP8Ylqy/7dL3gLiSdrrvziiKOJBxixsydTsbCOzJ52GD6x
         8lJfOdxLxlR7yQVau3lZqY20XgsFDFQNgrssVMqxYnNMlW9QzQby82aFqseOdhV4QRcY
         aFj71S2CcNEDJsAQyH8O2PBSxb1hkjYh+dCs+i6NRwin9atyB9K6pxrLTUbbzii+4gLT
         I6wElfn28Y3+X+kpCh8Dxyuu03JktSYPGdcdfIpF3VXTHbHFsylzhjGtYZgpPlq1o70/
         OrdqyiNhZnSn8RCmWMO/7EvS7TNzGyJph9PngclklX2qI/zlYApmiduEK6xKAhb8DhfV
         wGug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Bext7Uzqjj9nVzO96fA6YlKGegXrH8woj2XV53BabsQ=;
        b=D+M1j0fnKAZPvT8VQlz6KklQ/paPOo9M0LzTv2FEXcfP/XUo5Lj5QX3XAbXD+DgIhm
         r2+RmCwKqWNogaSvz+jpaU3XzTzqQSb9i5szHrfsNU7ooT6P46hEHGIFUvwSVRjLi2EX
         qgt2X2jXib48CmY7filN6FqVBUKQXKXYXps2y3sq7Siy8sifvogMHp138ujYFkdJSGii
         V4R2CXdPPdtn3VEgu1FZECIqZk8qeabMZCNYFvkuHXIHdvU6vQDXg+Ksf/Ivfh9aIhBk
         YnBnmpfFKCuuTxdfKIQReW1AZTTnJXBmkXS+YvvGI2xXwQbfh7YCoRWbem6KBOO3h6Mh
         VoUw==
X-Gm-Message-State: AOAM531BZWnnh/imskvTs+bBQ5RsVazjDOxdSv0ChrWjC/ywzdYjJMp8
	sp566isA6uFw4OyHXasckpKFVobc0Lp5GVBM
X-Google-Smtp-Source: ABdhPJwtruxrMsd78onEUZY7MNf2zEcXOEKxZbX+KwMhtsWChlJBZ26cBa+vB9MkLztyZc63cYqq7w==
X-Received: by 2002:a63:ee04:: with SMTP id e4mr11077549pgi.446.1614994060320;
        Fri, 05 Mar 2021 17:27:40 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] ([71.212.131.83])
        by smtp.gmail.com with ESMTPSA id w26sm1423803pge.23.2021.03.05.17.27.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Mar 2021 17:27:39 -0800 (PST)
Subject: Re: [PATCH v1 3/3] semihosting/arg-compat: fix up handling of
 SYS_HEAPINFO
To: Keith Packard <keithp@keithp.com>,
 Peter Maydell <peter.maydell@linaro.org>
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Bug 1915925 <1915925@bugs.launchpad.net>,
 "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20210305135451.15427-1-alex.bennee@linaro.org>
 <20210305135451.15427-4-alex.bennee@linaro.org>
 <CAFEAcA9LdZ=Ym_UQFwqMcrHv6pygdxZC+fgoc=N3mU484d-a_A@mail.gmail.com>
 <87im65gxla.fsf@keithp.com>
 <CAFEAcA8DuMANP7-JF=bTDXG7uJF0q4HUQ2P4WOGvXAOWGtPYnA@mail.gmail.com>
 <877dmlgnrf.fsf@keithp.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <91d57887-8a5b-a837-6027-3fc2c38c48c7@linaro.org>
Date: Fri, 5 Mar 2021 17:27:37 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <877dmlgnrf.fsf@keithp.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: dQc18zeFs1Nz

On 3/5/21 3:54 PM, Keith Packard via wrote:
> I don't know of any implementation in hardware or software that supports
> modifying this value. I'm not sure we need to support this in the
> semihosting code for qemu as I'm pretty sure getting qemu to support
> dynamic XLEN values would be a large project

I think it would be fairly trivial, now.  We have riscv_cpu_is_32bit (which 
checks misa, not xlen, fwiw).  It's not examined in cpu_get_tb_cpu_state(), but 
it is many other places.

> (a project which I don't
> personally feel would offer much value).

Now that's a different story.  I'll take no position there.

However!  We do have a function, that can be made into a TCG hook, which could 
then be queried by semihosting/.


r~
