Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp8518371wrp;
        Tue, 1 Oct 2019 10:59:58 -0700 (PDT)
X-Received: by 2002:a63:f0e:: with SMTP id e14mr28965444pgl.404.1569952798050;
        Tue, 01 Oct 2019 10:59:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569952798; cv=none;
        d=google.com; s=arc-20160816;
        b=fLdpqd2+0PtQEZt15L4bobArvHYdRLTl7xRSFRQZ4CgqjB6Zjy/jyHJZqlgxqqzgog
         qHFJB5fOK3thQ22Ht5kWdSLdAVaDmZJmpngennGhLRg7JoxzeWSwPJf1eR8fIdpN50WZ
         poqCYDyI13p/caVO30FdZ9TRFqSFvVNf9AXwcNaHXTvFiJphVZIt4PSaIoOONZX95Dxe
         xo15wZrALMyStRcHDVFiqvvbfAY5n1U0vZYl/EpkLldglvZCCnrzJuYpePZRBsT8a2TL
         bxb8TGekeTtqsPh1JtmbL5w0TXB0Lb4b7KXKMMUSwsdDlSCNZJoPAf83bQjAweOq9W67
         ZHdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=SFJLAxMxRgMAOruAs1NxSyXkuAOhN8XfQESEQ+1HUAY=;
        b=fP5fffGn/hVFHyFA3/gvESYOcSjsSveWXBd9sgyanHHyQOkSEskk5W4RywmbKQU14M
         TBpZG8eEdCPdgZwBJ+PFAJy+f76oeGmD6peMDzaGlQjp+6pPZTp202Xyb8Z+yNCjDXiN
         DPejQH5D0ecfpyPohvuruAt4WSXAvw+gVMl5LKUztqf8ulmGgSRoft+PSPB+6ZEdlFmK
         KRWAVyVpcHjDdI2d4sr7sEmlS2bkLfIyHHJNVL3E+Fh0lG7igdtrOhiDuDRWPiDy2V5y
         WSnP1oBBbYKoQTe6IsrS+/VIah99N3Z14LtYi5Xbgd0yRiVaeFK6mIOglHGxzG2uoRl+
         IQZQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tw+pGVXk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x130sor1844361pgx.33.2019.10.01.10.59.57
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Oct 2019 10:59:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Tw+pGVXk;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=SFJLAxMxRgMAOruAs1NxSyXkuAOhN8XfQESEQ+1HUAY=;
        b=Tw+pGVXkUr8Kax3pKrFyWM8P9PqikGEnfYt0p/YEZLpVbAXNN1r9NuGinZ3pHqBAGo
         LDvODXDiSP+Zt8GWEtc3PrjcLFORmD6d11D4CPWkV7muDK6Nck9OE2uXgiiWCgvHkTNQ
         2QyJZxl24erschMiiGqUwni36Tjk36MSvsFYlVizdtbnyObEBepD1MdKvI60wcH2+W6i
         cUuTQnZxs/Mnu3mc5pnGMCMFHcSNdGnjlLJLx2j2XJNJgnQvaP/CL/jVuXHfHpZ0HLq0
         5j0U5z4Xp0DZ1dNz+8qlkYcDM/GLmSSax/y+lm69szleSVVetygseKsmiTE430Mu+pTm
         sx5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=SFJLAxMxRgMAOruAs1NxSyXkuAOhN8XfQESEQ+1HUAY=;
        b=D8dOxBCLpq3BnekDHLARZP4nVSfaCE9Ma5gz7BBmawKeJnpzceLDwktkhqrqmI3eM9
         d+PWON6SCNxtT2V/IpPvb8fYwg+1neaC4tzuB8SBGkdFOnx/Bk6q5X0zS53SyZEhnW06
         2AycMjUHWp4HBusei+1HOwUCYuQwfZ3hBc7tEUC2n8fxBINMSVsRltJX7b+RcuxYdp3K
         Z8hCchyK1HkxCU3xEKTlE/ybYfalDHoUl1rNZn7HF2mf0dXm1ra2pT0LUk+wQqCx099L
         d8JAphiXwfb5LR1ipQOQhSuzEIbHiuQVDN/zU7NGbvpNVrcHrfBNtgp8z6tBwmXjwjmi
         r+fA==
X-Gm-Message-State: APjAAAWW7PF4Oj5/vpLt0RP7xcAvERzeel6Kh151bdOd2Loz+GvLFaE/
	JwCKeVaErZLWHzvfhI+x5g4LXs/h
X-Google-Smtp-Source: APXvYqxbFJE0zV1Q5zAKldLXgPHXpJn8izUHBdtkxCKbvtSKASHiZqlA619G2WbBKnvEILupo6v13Q==
X-Received: by 2002:a63:465c:: with SMTP id v28mr31849646pgk.310.1569952797543;
        Tue, 01 Oct 2019 10:59:57 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
        by smtp.gmail.com with ESMTPSA id f185sm5023192pfb.183.2019.10.01.10.59.56
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 01 Oct 2019 10:59:56 -0700 (PDT)
Subject: Re: [PATCH v5 9/9] target/arm/kvm: host cpu: Add support for sve<N>
 properties
To: Andrew Jones <drjones@redhat.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
Cc: peter.maydell@linaro.org, alex.bennee@linaro.org, armbru@redhat.com,
 eblake@redhat.com, Dave.Martin@arm.com, eric.auger@redhat.com,
 imammedo@redhat.com
References: <20191001125845.8793-1-drjones@redhat.com>
 <20191001125845.8793-10-drjones@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <a4f3be1b-533b-1089-6bdf-1ac3f4da4ef3@linaro.org>
Date: Tue, 1 Oct 2019 10:59:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20191001125845.8793-10-drjones@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: OCYRG2raX+US

On 10/1/19 5:58 AM, Andrew Jones wrote:
> Allow cpu 'host' to enable SVE when it's available, unless the
> user chooses to disable it with the added 'sve=off' cpu property.
> Also give the user the ability to select vector lengths with the
> sve<N> properties. We don't adopt 'max' cpu's other sve property,
> sve-max-vq, because that property is difficult to use with KVM.
> That property assumes all vector lengths in the range from 1 up
> to and including the specified maximum length are supported, but
> there may be optional lengths not supported by the host in that
> range. With KVM one must be more specific when enabling vector
> lengths.
> 
> Signed-off-by: Andrew Jones <drjones@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
