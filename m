Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp504822lfe;
        Mon, 16 Mar 2020 13:10:35 -0700 (PDT)
X-Received: by 2002:a62:1a03:: with SMTP id a3mr1343329pfa.171.1584389434980;
        Mon, 16 Mar 2020 13:10:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584389434; cv=none;
        d=google.com; s=arc-20160816;
        b=tm8C9zZFlp2yiIwZPfpf/JpCorud3h1EW5kIfT9Axt/XNVQhjT9RDqE9ZtMSYr41Fz
         7S8mlwhhpKR9Y2DNNy7fFL9+6Bj2wO2Wvimy2K1mOwma5dbRKNUXqKgXNSr5bJhpTa25
         kWYgu+rs3avzt1dnK57sGttkW5IJ0Rt/sZZz4mTUZxidxKpv0S5Qq6rMBOD1NYHolS/t
         TT7IFGJz/UuohLY1eb9b3q8hfI8CoQCnLccl6Pn1l0HkYRv82TYM5gc2TMEs9ZNMfutM
         Jv94vIFRIOVccMhInioY5F0MQJP0GWcfaEzu5bD4X8YAnOrUifNLwBKs1VD3INUfLvgC
         BDYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=MY8MkhaDCZV5A/K6qiTfn+gJM+K/rUxU8elb3vMFzUw=;
        b=Pp+IO4QATOzErZeKUBh/XQ5o/JsBpSYlUI8xOeQ2lhdDcFVdg/P2g6HXMHbwV3YnEO
         Ynomhf/E5g3MhlOB1jt2B101J/f3nuoBocvoC1SKKPxsDvPAg7JRzcpCkaOkwNynPtbE
         TmPaYXdsnH8m0jPE5HqopPURfUBP9DLdbVsepjJYHz0GhOOxVW9d+CjChwc6dt66/t5O
         4KQprnRtAAOdKFlW+t2QHTxasfJWBLN0wicGHohH0CzbD0CkboOXiAlI5gdspjBK6ATZ
         vmNr6qi523YUlxRLvj/YUXCjH4zSwa7eQvyyzrlKiE/RCxegyYusxdFDz6pgPVA4FmZC
         I+3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IsbDbkXV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id ie5sor916423pjb.22.2020.03.16.13.10.34
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Mar 2020 13:10:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IsbDbkXV;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MY8MkhaDCZV5A/K6qiTfn+gJM+K/rUxU8elb3vMFzUw=;
        b=IsbDbkXVyyfep+K7aPqVt5aCvcdTj3M22CRGivPVGEmT3RYBYmRUSkUMAKDOSoBrWb
         M3BcPZi75ckrZa7mQL0siEnco9vQsyRub/WJ/+5fXmJYckwgZQvpG1OIMw0uDHNg63Es
         Cd4p1EIhzPFLFSUK/ZCK0fSXv/sntjuiFCfBD0i+hp1Yk8qt1DyGP5Hf/0zLw4Bo724n
         rQSHuoh7KDnRQEV5hf7GJwMcORrF0SpAFP5W3YMEXFMLbRlXvWwqM/MU92G34L14jCeJ
         6rCJhVW3ySuh3w/5ley49fbfMu/MXognqfrPoG692mmTcexlDH4PJwWG4k4L544TONBz
         6rEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MY8MkhaDCZV5A/K6qiTfn+gJM+K/rUxU8elb3vMFzUw=;
        b=gqiQxyBYOM3mn0GyQho3VKnqiToR1jA8CwNVVLbEZuYNDXjwrIvoYe8bZ5mVsYnpdM
         zUsFUpRwcsaEPj6Xuvq3jsdN73M/eaLMLkIXeNKMgNd3WOi5GiwkmD5Dl23acYV5llRD
         IPZ3CyYowSVPv7UvgxMBsUvmOpvu5zeuGkmH9llXftYHA4y9DqTdH8HbmX8l41EWicVa
         QYHYbFbTH88cSYmzofVzqfSf2nvigZbhKe7ZkoYdg0z/ztHt1AXodtssPSrVtT0HYoBp
         xaynDwAtZ/iMUPfC/WkTcWc9e33t0oMWDeppiWE6gC+vcBZ+/YvPXmjR56F9P26VamHP
         +OMA==
X-Gm-Message-State: ANhLgQ2eIMVC0fCqd0Ch0Gq8UN2YGU1ttJzg2TX2osdx+i/e+FADFCZX
	W45sgdpT/UsjEuTtzZzYLERU2QUp
X-Google-Smtp-Source: ADFU+vsfOpkbA5/KzKZmtYtj2u6FDMGO7fkFq2kdP+aaQsvpZBgdbHmRSI6nkzzTrUNnSe2NEzBlng==
X-Received: by 2002:a17:90a:a417:: with SMTP id y23mr1249051pjp.184.1584389434398;
        Mon, 16 Mar 2020 13:10:34 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id m9sm329171pga.92.2020.03.16.13.10.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2020 13:10:33 -0700 (PDT)
Subject: Re: [PATCH v3 07/19] target/arm: Make cpu_register() available for
 other files
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Auger <eric.auger@redhat.com>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-8-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <78359d38-4fde-7cda-a4e0-d36f1fb8d166@linaro.org>
Date: Mon, 16 Mar 2020 13:10:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316160634.3386-8-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: L5axchqTlBSI

On 3/16/20 9:06 AM, Philippe Mathieu-Daudé wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> Make cpu_register() (renamed to arm_cpu_register()) available
> from internals.h so we can register CPUs also from other files
> in the future.
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Message-ID: <20190921150420.30743-2-thuth@redhat.com>
> [PMD: Split Thomas's patch in two: set_feature (earlier), cpu_register]
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/arm/cpu-qom.h |  9 ++++++++-
>  target/arm/cpu.c     | 10 ++--------
>  target/arm/cpu64.c   |  8 +-------
>  3 files changed, 11 insertions(+), 16 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
