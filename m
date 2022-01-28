Received: by 2002:ac2:54ba:0:0:0:0:0 with SMTP id w26csp65951lfk;
        Thu, 27 Jan 2022 19:12:55 -0800 (PST)
X-Received: by 2002:a17:90b:1d0c:: with SMTP id on12mr7585818pjb.10.1643339575125;
        Thu, 27 Jan 2022 19:12:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1643339575; cv=none;
        d=google.com; s=arc-20160816;
        b=T6hrgZdgLg6V9R1xWAWQV80DprNAShujCKOtShu6+w9tyTrxTDVR8qIguGfBu8T3u7
         c3ypA7bK22UfyZd5Iw5u6o2qvqCZP27lRMLeCodJkOhp0EEucOPmNLYqC9rUUmm4V5nr
         avNRYbvSjIZ4jJtY8BJ6w3XnGOH9Du3d9kdYruDdXDx6QJJpNhFKiTRW9tu8VmOhwPCh
         /3ROe8AKE0M/m8rzzbPPYQ9HzRRdXnuPzPEGOQKyeCN0qKaR5EgBwXzp4KDrKCs8jaBy
         hNkKvu56LhtQ0MhkoAf97SKNVAKjqCWgZ1+CZJC7x6w5SvW2q+Gdd+svvcvL2e4odka1
         DDqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=0gx2La73i55guNFbmZkkQPmzp3blHiSd9YakpQX/jTc=;
        b=Lr3LMmEm/BkTpVU+8V5PGlkRMSAkdtbCBHZA+YU+bhI85IoW5GiIX/qTFAIpZieTJO
         oCsOr6bhKaG3/zYTm7LkifgBtiAMhE3ksGpPY7U082xS2dWzHzUVRKZ5CTUPnP3XkCLI
         NSL9sS6kCVLKAuYWk6fEwgdkoS6Gku6Z2lMgHBOh+0M9nAv1EjG8SdYvk8Zpjlk7KA1C
         xQPiIzznmnZXiAZQFPmB5J4IJDOKgP27F1Awj3YoAchW8Arvwciakez282swt9kXCbf3
         dw4Ich/gpw/ZHi0qijANqYmroPwN3cScz9Ho6J6taL/KC7XCFx5smsx8cLY/Bk54/dKr
         fiSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="esU6/7bO";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 4sor1944476plo.135.2022.01.27.19.12.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 27 Jan 2022 19:12:55 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="esU6/7bO";
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=0gx2La73i55guNFbmZkkQPmzp3blHiSd9YakpQX/jTc=;
        b=esU6/7bOBkQlt4vhO5juIt1ViSG9PRHVD4fgcl5fRimhzpu1DqxoEhjsWWZDx7oXlW
         V/dVBe4kvqygEoPoNfhAL9/Ckfkvv0h3/UfnlIgaFgFfS8p/0QnizuuS3BhF1rm5ogGb
         r+IU4BKYqYH/1sKNI3mPGHkrytNFTYlsJYENDCqolIVTNo7wL59O09ckPLsIlPNiS8VU
         cXGpYRDjXWsmouMJHytsfDz8gVK9LyMJgHzJCEtekRXtJAHJ3NbvqLlOImbdOy0DQq7y
         YDvUpBiHICaAHUUK0SBLmISkcIIMzJwSCCx/mHICkLcZYpdExoUY1cH9woQP3Yo2mt0t
         r65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=0gx2La73i55guNFbmZkkQPmzp3blHiSd9YakpQX/jTc=;
        b=6qAcWD0Skn/YK1NE03qbyJsjdR4a2HK82H1s9mFsHrBSRT7nrz1o7SCrzt3lORbGe9
         IXoipNmgHOhxMSvdFdr9E3wygNh1q3UMbeVk3bo6Uwn25ThMC8ayQScJwJojXUN2serD
         Y9FPQpcQ79s79QNeo3gw4BmZE2oa7O4DPu5EHD/sWvYqN1VcZlY/9Qvm4VzxIfXcI3uM
         5B3WaxddD9SweyEEpwNzDyHknVqCeuzw5a6ydEGvqonpwy9dIFhTYkoXsthCqGJA336e
         retla9Eaumwt+rstzppcwDmWjDSVktVCCi6Frwd7C3n92q53ZBJN+s+tJ75EYd5irfco
         FhEA==
X-Gm-Message-State: AOAM531A1VzfMkBgsO2lXkXULCPtCfSo4yebDVySLx7wnwcBHp/FbRV1
	BScBZduAoUJAa7U+DXDwJPP68GzzCB1lgkAWevg=
X-Google-Smtp-Source: ABdhPJz0rnuRDSFXaNqFT/SkfnOUtffxT79f3n/LEwxWoAyd4XxFKEZ1Pt48piQ8qFSBhlbzdW20Dw==
X-Received: by 2002:a17:902:d2c2:: with SMTP id n2mr6448441plc.57.1643339574658;
        Thu, 27 Jan 2022 19:12:54 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.15.44] (alanje.lnk.telstra.net. [120.151.179.201])
        by smtp.gmail.com with ESMTPSA id mn2sm632223pjb.38.2022.01.27.19.12.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 27 Jan 2022 19:12:54 -0800 (PST)
Message-ID: <70fdabac-f73a-e3b1-cd98-44b67f26aff1@linaro.org>
Date: Fri, 28 Jan 2022 14:12:48 +1100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH 04/14] hw/intc/arm_gicv3_its: Don't clear GITS_CREADR when
 GITS_CTLR.ENABLED is set
Content-Language: en-US
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: Shashi Mallela <shashi.mallela@linaro.org>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>
References: <20220122182444.724087-1-peter.maydell@linaro.org>
 <20220122182444.724087-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20220122182444.724087-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: vxJZFxsG/1vq

On 1/23/22 05:24, Peter Maydell wrote:
> The current ITS code clears GITS_CREADR when GITS_CTLR.ENABLED is set.
> This is not correct -- guest code can validly clear ENABLED and then
> set it again and expect the ITS to continue processing where it left
> off. Remove the erroneous assignment.
> 
> Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> ---
>   hw/intc/arm_gicv3_its.c | 1 -
>   1 file changed, 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
