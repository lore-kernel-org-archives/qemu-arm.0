Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp2315037lfq;
        Sat, 3 Oct 2020 02:13:20 -0700 (PDT)
X-Received: by 2002:a9d:600a:: with SMTP id h10mr4937065otj.170.1601716400365;
        Sat, 03 Oct 2020 02:13:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1601716400; cv=none;
        d=google.com; s=arc-20160816;
        b=I1/wD0C30rdKFUosW8GDXBR4g3TDbS5qvKDOliCj9ED3+F2my4+yeZTYKrXpZbqJC8
         hwq0w3MOyOj8h3s4tvG/zxf6dvNsz8r/AkFzdPbpdrwUejDzEExUc8d7lP5HPBY4ui4V
         J4BPYxYeONHrQKZQ8cweB0iri/o0Uju4vtTzCDRbZ2IAZH8HEGeOvhmH7G8Ct2FFY0LC
         XnWXignCd2O8UW9bZiOUFdiNsVddK7JvLiSC7xW9E1Zcms5OyTUPrgPTe+2gijtKi21d
         FrupRRBh9ROJoJbx6vpTfEIVFPDC2NpbBXCmNqSbXkbqZwBGeqqZjX8TEpmb5RAT95kf
         JqxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=V+N6roBMczoEkvPQ/1usVDxzLXsrnEaEaI6P98ExkN8=;
        b=HYoKjrYztZdBdPSyB9mxY5ZHmKD2zoy7G1SPByzeG0rLV1BDrnsFMVz/pimq47guZE
         UGGOP64cPzpH3UgJx9phfbyWac+bfCCPBmHaL3951gBnMok0ALC2/NvH0FIlVtKtl0hi
         Hprs/KWe8Ad4rWXLVDF/BdnZX87T8Ckj9VPtlWpwMiSYEXzRnAs9qLlnSUv71qwPODyu
         WAKio1PhShvTwoq8POHWdy4YXYkYjL+YLmBMQzUHNt/zftgdxQCz1QtK2fkL/lOjRd+q
         hZpkHzLmb9HV9BtaOWLDHdfEzqoAU8piWK46u0qfCgd4b/w2vWsIaqf+BHsDHCoiWGIh
         P5vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=awPMnOdq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id d25sor1833289ooh.1.2020.10.03.02.13.20
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sat, 03 Oct 2020 02:13:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=awPMnOdq;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=V+N6roBMczoEkvPQ/1usVDxzLXsrnEaEaI6P98ExkN8=;
        b=awPMnOdq1T4kpdut+GKLndz1VMH3tU2JmzebXVpH05JbWXk7EoVLkSYl8ZnXq6eU48
         bDayG73Ko/u7QHfYe6uxBIoDoX7Nbigndip70Vq5hmz46vDAhcNGmdn/z5iXMTvYggbf
         3pLgIHGCxbBRAIc+CH8Ais12lN9xMhbBPYEZNOZk2yAmXy5F2ezPQtpdG0aOsKFjgSC8
         imSOaI9gf4lF+cYjtC4xyUXIPpG7/DhHd9wO0WhVZ2FWV4NY+yGOVBTUipZEDGSDjsdn
         nrOVgO7gImyrafJVHirXd+QwElxd4DGscn38ywe0xXikkZYkyU36V1tInwbz9V93vO9Q
         LiJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=V+N6roBMczoEkvPQ/1usVDxzLXsrnEaEaI6P98ExkN8=;
        b=LoT3TGO5UR7y77pzbyq1fr92QPAPh5e0FY+k7Gwq+YvjzklJnYhk3YTT1VetMRpZyP
         0f5yjAMLZyITOKbaUZ0xr3KA3BruoytvrDtzmRyQZRSZHf6jrGDX72/XUZDb9MdvBknq
         xXTaKLK7jnyKdNVwsUaknkKQJu6Eu/9EBq0m+T68TcG4VE8qfrDgbLgrL0LIgDHLiz78
         K9V6UDNfFqskUK4vpqg0J2qFBvoGjZJ3xsFD3k4Vtho0I/fLzSzfQPvlbP/ai1MuNVvd
         mL2TXxOSJ6/v+IynyggO1LcEjJG9rmZNlKiLLQ2x6ZVoTlEBunatoASZ35MfudS1Z1uQ
         fwZQ==
X-Gm-Message-State: AOAM532jXbV2tXXYOTf7iUIb3Ef95XsqimCrjo+1l9CBGsWXh2i/+YWl
	ilhvkPzktquD0ynX8XR6GhKOC3uH
X-Google-Smtp-Source: ABdhPJwDyS+3vQCCE/z6hQPZsQUkioDfS81B5I/mwT+QjHwuP7aEz8vec/vBRXJPG9lK5OrPrnuzEg==
X-Received: by 2002:a4a:d38c:: with SMTP id i12mr5006756oos.81.1601716399988;
        Sat, 03 Oct 2020 02:13:19 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [10.10.73.179] (fixed-187-189-51-144.totalplay.net. [187.189.51.144])
        by smtp.gmail.com with ESMTPSA id n23sm132277oon.14.2020.10.03.02.13.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2020 02:13:18 -0700 (PDT)
Subject: Re: [PATCH v4 02/12] meson: Allow optional target/${ARCH}/Kconfig
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Fam Zheng <fam@euphon.net>, Peter Maydell <peter.maydell@linaro.org>,
 kvm@vger.kernel.org, =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-arm@nongnu.org, Richard Henderson <rth@twiddle.net>,
 Claudio Fontana <cfontana@suse.de>
References: <20200929224355.1224017-1-philmd@redhat.com>
 <20200929224355.1224017-3-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <31a173bf-6aa3-1ce8-7d14-5e8f11e2a279@linaro.org>
Date: Sat, 3 Oct 2020 04:13:16 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200929224355.1224017-3-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: p3czuQl6hNza

On 9/29/20 5:43 PM, Philippe Mathieu-Daudé wrote:
> +++ b/meson.build
> @@ -529,6 +529,7 @@ kconfig_external_symbols = [
>  ]
>  ignored = ['TARGET_XML_FILES', 'TARGET_ABI_DIR', 'TARGET_DIRS']
>  
> +fs = import('fs')

Note that I have this in the capstone update, and I placed it closer to the top
of the file with some other imports.


>  foreach target : target_dirs
>    config_target = keyval.load(meson.current_build_dir() / target / 'config-target.mak')
>  
> @@ -569,8 +570,13 @@ foreach target : target_dirs
>      endforeach
>  
>      config_devices_mak = target + '-config-devices.mak'
> +    target_kconfig = 'target' / config_target['TARGET_BASE_ARCH'] / 'Kconfig'
> +    minikconf_input = ['default-configs' / target + '.mak', 'Kconfig']
> +    if fs.is_file(target_kconfig)

Missing a meson.current_source_dir()?
Leastwise that was a comment that Paolo had for me.


r~
