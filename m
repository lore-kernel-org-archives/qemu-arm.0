Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1635392lff;
        Fri, 18 Jun 2021 07:55:07 -0700 (PDT)
X-Received: by 2002:a17:902:b409:b029:114:afa6:7f4a with SMTP id x9-20020a170902b409b0290114afa67f4amr5078296plr.56.1624028107428;
        Fri, 18 Jun 2021 07:55:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624028107; cv=none;
        d=google.com; s=arc-20160816;
        b=P6Tu7oAKkDj8g7Dm+B6HzVOTxHVrmtvKtjQIFZXzO3nmabFdrR4Kt3EzjTcO9WQzKD
         zHcpKZKamUrNW9CGt1CHiiOSV/JwJUr9BvPyc9wvfWfbejc0U8SAUlYKc8kWt/o4X3JP
         4RYpkIjmXFtCLNVyyDjTzYxB/cWfHTNmmnvnLqkhLyt4JO3IA8IovI7ay759AMGN3cii
         kAohaTzo5FZA/uy5aL/4ONEU8PYv3o2aI35s1iD2gZsGHawE+CYHE/FrVvrU/rj27g7I
         IzQb4vz8OHkEVb4YnrhBNX7rF+72NXCGsXpIQ7asGc6a3DmhSoCIw+onI/7LdyrqJzAb
         Vjtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=3Bo9n4pUebtWAcFpUbCKk/O7cgPLx6wOGF0jEVYOu+E=;
        b=QDL1IoG0kkMjVl0SW7EmneMUziH3+B8JNpnRaifjWMfWEUXPIY+O6lAOQCv4SXXss/
         qe31ws9fueHQkOmazOwtRGHD8p/ux0iJvILOiIpixGM1zRLSkBBQVcWykj9uncovcgPf
         fRzdpseIdjnwdxeW3laPekq1xqjdNQDfGjAs5eKoyW0kAspym7g08lXo3reoMGUY8TPa
         l/PJxs5Z2q3J6jqurf3ykEW+kfTM1UH1EVxgOtm+DK5BuUZ4GPsiot5BTSzpMEpMLCln
         C73H1IXAZ0lEbzx/HM4SIaoxP5yuzNpqZ7Ao85jdpDTXZj0Y5RGma0p0UFuIxCcdoX8A
         QZbw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m1AlGpIM;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id i37sor4800348pgi.44.2021.06.18.07.55.07
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 18 Jun 2021 07:55:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=m1AlGpIM;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=3Bo9n4pUebtWAcFpUbCKk/O7cgPLx6wOGF0jEVYOu+E=;
        b=m1AlGpIMnIT8qS8fvJPJWotLgoMzJwiiXvnJqep2MRqEiM0cGCQ9q6A+38qyDUicTr
         Vf9hBWGxc8ZiDNfpGXzCtystMyjph63qc0lQtCfMd5Wuf5Gkey9CRgknC8wG3jBBTMK+
         CYym27tt5ZZlbbTiM9Szko0G72q5+2iHotwxhThkxB0f2KH//uIep4TTdY/SoQtDWnrb
         WNk0wFUnmIdOh1H7wgd4nEkLHuDVYBsTbxyOMA3OQrXf9Cs/TEQWtZij9qA/UXYt9Gwi
         bsMV53BAM5OSqUCfs98mbLSFTcRVEOs3DGy8rVWCLEIL0vQfzcEcbddZ2u8BRyhDcNUw
         ysOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=3Bo9n4pUebtWAcFpUbCKk/O7cgPLx6wOGF0jEVYOu+E=;
        b=LUqG9ibD/uZexLKbBrfeBnZdbnHkt95N4qc+k6XG+VM5AvLRaBucrcgIm64FFkvE7U
         qS+9u2iC49SmeK4+S3LqSKMJCkX7FI6mIVZwvfggCH4v5n506LlvpM3WJECyFAtFgcUp
         eveXHI0nkM+BXqTa6uZMNOvv6XmNg6aPTK3755A0fJfb/nqNG5Tzg1vIIWkU8ybu+WPD
         yPZ24yIGWA5exxrihKITNBHHtH2YVgcjaac6+WPI1gOeTKt/Fy8mUFiiBemKYLJOxbF8
         VJjYgMilSzBceOi0fFZOlvNGQx9PmPXbAEY+2k9Eqglx4AHEbuuvRFogRhWngjZEkfh1
         uXNw==
X-Gm-Message-State: AOAM533ePIutl6HRjTbjtG7K4+uUFunDt1+yvXmVJmYDa2C21v2APHbU
	i3rFowDeCa5yZ68puRuM3PcET1/MZ65IMuAC
X-Google-Smtp-Source: ABdhPJw4Q384ruO6qIb/4iE3FQ9BpNSBXkUxJizEFk1bYtgnf0zlGkxP28rBRVPwxnpmcp0o2rncYQ==
X-Received: by 2002:a63:5b21:: with SMTP id p33mr10537383pgb.402.1624028106880;
        Fri, 18 Jun 2021 07:55:06 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] ([71.212.149.176])
        by smtp.gmail.com with ESMTPSA id j9sm7964742pjy.25.2021.06.18.07.55.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Jun 2021 07:55:06 -0700 (PDT)
Subject: Re: [PATCH v2] docs/system/arm: Document which architecture
 extensions we emulate
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20210617140328.28622-1-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <3bdcb6f3-420a-c0a1-7a8c-63729d1d8cfc@linaro.org>
Date: Fri, 18 Jun 2021 07:55:04 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210617140328.28622-1-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: cnBANmOdzyW2

On 6/17/21 7:03 AM, Peter Maydell wrote:
> These days the Arm architecture has a wide range of fine-grained
> optional extra architectural features. We implement quite a lot
> of these but by no means all of them. Document what we do implement,
> so that users can find out without having to dig through back-issues
> of our Changelog on the wiki.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> Reviewed-by: Alex Bennée<alex.bennee@linaro.org>
> ---
> v1->v2:
>   * sorted A-profile list into alphabetical order
>   * listed the component features of the cryptographic
>     extension (FEAT_AES, FEAT_PMULL, FEAT_SHA1, FEAT_SHA256)
>     separately rather than as one "Cryptographic Extension" item
>   * added missing "SVE2" line
> ---

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
