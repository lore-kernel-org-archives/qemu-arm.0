Received: by 10.223.159.74 with SMTP id f10csp635954wrg;
        Sun, 3 Dec 2017 07:12:04 -0800 (PST)
X-Received: by 10.99.66.68 with SMTP id p65mr11660524pga.339.1512313924863;
        Sun, 03 Dec 2017 07:12:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1512313924; cv=none;
        d=google.com; s=arc-20160816;
        b=yaHB3ZGfcUI4BUmT3fnQ/C0gmbKecEoZsD+rQwHkhPino7yTfIcrpwGqaPjf5w75iZ
         7ItzjrHdS3gZRgKpT8d/kw7WmYZSKEvG7vMnJpl21uUi4kFzgzsFosA3KMi6jM3fYHUw
         JZAOwLESdvwtuxbD8Q/IJhS2FQonSZEh0A9s7NUysOHUD+8qNWpxqxEKU2BiRIwLLBju
         33VsIBhnmpk3XtF6+TyUXDpN9iJ+YxA/PHSwrh8ky0hA77UayVTP3BhVsM2hnu9AAPn0
         4hebNNasWm2osER2mtS9wRLBEym6TKCB2tK1IwI3PaGYZuCL33HkPMbzefQ/awiTOdnr
         A33A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature:arc-authentication-results;
        bh=hB1BEz0zeBulcufyHuRzpVC7yNX4xRvENpajFukFudw=;
        b=LW+TTr/v4vyIw+BwBbC0gjGZVMNuNDRInRzEdtbj55pU7nY7r+Pn1aGGhKSwmEQddx
         7ergKYAgZ7JaGJFzu6I3Mf4PfciBnAgYLUsdRs3cjGSDlIbTjE6PZklb4wGVXC2aiNAw
         bI5cYo1DtVnwCwg04sGc2vR/hmmQ5IViN/xdm1mbgdiXFmwETvIS0ifGqTb7Kw9v2Vgs
         ASDWMf9LPEd3zQq15PfcP6p8clmMGvU5jZSpElL/lf5cxnuCMKgdK5YjoFLwAGSuBfgv
         en+HAYKa83tR9v3oeIb0ndyzmjwDZ7AfN2A80u4y6qGpt9f9IpYYQuUlRlQgukbHINIi
         POzw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WYhzN8L5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id a4sor3266893pfl.118.2017.12.03.07.12.04
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 03 Dec 2017 07:12:04 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WYhzN8L5;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hB1BEz0zeBulcufyHuRzpVC7yNX4xRvENpajFukFudw=;
        b=WYhzN8L5injFI+moTS5Nrw5B+4TprCPmm6O+N0mD6RlQ2MFyBj0v1BNmP7sm4rPQFd
         GK3a1B/oIawePEPeYCxdglZdwDpZgubpyu/mCv0HYWkdT4wCp1as8PoZnQYpNetrB2cO
         FGbc6Bfp3j+RTXw1AC5y8WPKsOpoGyPk0lXPg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=hB1BEz0zeBulcufyHuRzpVC7yNX4xRvENpajFukFudw=;
        b=VvQwtQ1fqjzp7wezu5U+z+66QiKHLU1/uFYHxy5s7b2P9FTWzcJ43q6dcojYS9RELX
         tL3fVVClYA5SolSWw3TJWaOC0KwAJyVN77ap2rpGuDxrQ0+/LkVaZACKifJN3gieKZUl
         TE+qXJ9rjfV2MTRXyWDxlSGNqizyrGhp20p7W/W493TF0f5C2phEDMMWXYH4RldK9Rpj
         J9BliF2B58XY+axlqI+KIuFKeh6+twJyCosXmOPclLw9ARxEVhMc68X6U35rb/rYS/AH
         X/l8777SgFdB5nFaY84/PJD28XiyM782WyOy4GAvF9yYdcNvY5YMTIGFonYI4BCF1NWz
         mr4w==
X-Gm-Message-State: AJaThX5eDHtqtFzYuT6RHClc+gtbTjwzDynHfi8fa9xcu1LciLL10fzZ
	zdJaH0IwZHa6pLA02oP0RuiKazISpfEF/w==
X-Google-Smtp-Source: AGs4zMZsKdDPD5JTa1s2Xm7kp4udEMUQE3zM31JlLR1I1V3sOPIKOQGP42MKtl4QUoSs/nqqdOHd+g==
X-Received: by 10.98.58.208 with SMTP id v77mr12238259pfj.150.1512313924002;
        Sun, 03 Dec 2017 07:12:04 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (97-126-111-33.tukw.qwest.net. [97.126.111.33])
        by smtp.gmail.com with ESMTPSA id q24sm14246633pfk.168.2017.12.03.07.12.02
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 03 Dec 2017 07:12:03 -0800 (PST)
Subject: Re: [PATCH 5/7] target/arm: Create new
 arm_v7m_mmu_idx_for_secstate_and_priv()
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <1512153879-5291-1-git-send-email-peter.maydell@linaro.org>
 <1512153879-5291-6-git-send-email-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <1712a666-876d-a174-aaf4-94a85ee71d22@linaro.org>
Date: Sun, 3 Dec 2017 07:12:01 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <1512153879-5291-6-git-send-email-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-TUID: k2n2NInb4VWJ

On 12/01/2017 10:44 AM, Peter Maydell wrote:
> The TT instruction is going to need to look up the MMU index
> for a specified security and privilege state. Refactor the
> existing arm_v7m_mmu_idx_for_secstate() into a version that
> lets you specify the privilege state and one that uses the
> current state of the CPU.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/cpu.h | 21 ++++++++++++++++-----
>  1 file changed, 16 insertions(+), 5 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
