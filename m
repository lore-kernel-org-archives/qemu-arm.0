Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1897748ejt;
        Tue, 28 Nov 2023 05:59:56 -0800 (PST)
X-Received: by 2002:a05:6870:e982:b0:1f4:aed0:3b6d with SMTP id r2-20020a056870e98200b001f4aed03b6dmr8780960oao.17.1701179996639;
        Tue, 28 Nov 2023 05:59:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701179996; cv=none;
        d=google.com; s=arc-20160816;
        b=BZpEZYkfzpx+LVmGq0dg4vmxcDzfiDZnpXHJZwf/MREpYY9GdNXsBH+6ZB37JvahTv
         u2uj6y6JhjwWILCb9OxLQJ6w0bxGFzrRR/e5z85Ww8u57hYpUXDRqTMRHz2nQEhaeqVL
         UUR7kaYbWBc6o5I1YtULHjzJ3Ktupc1kDWy2RgfXTMW4W9BK3Hfp8FZ9JK7mDUuY0g5q
         hBEePhfDkGOFDi1NtnZO+AQ5ZhNFhWPcurGhQ27RlNLJmR3BU93IcESpICbZb9eYkp/f
         U9a1ADFwwZaRbXVLIM98bsEw2mbs5nABHUJVjkfTcwpnWoSAe3M1Fp9QH7IATWfmBdF6
         S16Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=3SjKfuFYTY/mxOG+u2Dtw248AAIeHfRAB7xWDJc9Dec=;
        fh=j47SlpSDusZ2mmWrSbVW2DB7/ZZUDU/502C3FK4P+uA=;
        b=zViCWrWTnqgNW6qOyCX3QJu7P0nQyhaY35DNyWpo1m9ej84y3PbFqAr3g+afkJj4KX
         LPrlH3fbIFF5JUacAt6aBu1tViG+jwtee41rI9VC5SSNycrRYfMF5GtOMuR27o5jsDJv
         A9O5HygP2rZxRJkaMpBUgB7ayBrYfaXlRvt0ZkkCxXp7Lj2kJ57V8ibqOj3numF+wCyk
         rIBdELBLHpsUTmDfRNZti/QkxtHCtmu2jHrFmbckBY/IWdsvuccY6traXs1xOLiw3tQM
         yJUTrzIG0OXcq0x3Nat9bTDEe8z2XCEN4/zmLcyGarIgumVJ7FTJly0BsOxeuzTufFpK
         eLbA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZHC+rewy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ob14-20020a056871760e00b001fa2fe4960bsor1774889oac.3.2023.11.28.05.59.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 28 Nov 2023 05:59:56 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZHC+rewy;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701179996; x=1701784796; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3SjKfuFYTY/mxOG+u2Dtw248AAIeHfRAB7xWDJc9Dec=;
        b=ZHC+rewy8Kmp8CPsQFcrUOPVcz0Xf2gWHniAnFqtEQgTTCSw4IW0OtRg8t1s7eOSmz
         XgIrUgMdhvoRJI5eR+oHiboKGRrw8Xf0y+W5MsypUvrD5JfxqtdAs5+3ecCSwydNSXDZ
         YudbjN0EiTy1fhFnsFQMS7r6xjvV/NuiDvLzuZWuHFMll7hhg+JEnCFYhqQMDDhAnkiO
         f7+8gXouFJ6BFaS4/P+1hNx/wNo6L85W0Wp2CXNYi0iKmFCE1pLnhAjIjJy7yU80H0Vs
         DmoRdmUzZZSjqO/N/pt2vA1zom4U1PUNRZpVSj8UAFSs4Pjdip/dxeu82m5k3HmlzwDb
         Nm9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701179996; x=1701784796;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3SjKfuFYTY/mxOG+u2Dtw248AAIeHfRAB7xWDJc9Dec=;
        b=GL2N3u7hof3GHwISEbfhrTz9Rqeqjyt3EpyfqgT8Dzu3A5iENEqvl0v9WS7zWCm/O4
         sOb/8nhZuNySVeVkFjuVxHDullwcmuwCZZY3AIHpwKnlnJ6BHtDqXMwIzBVVQC+BACgt
         1gy3r8AkAHd0TqugL+ajxVHwg7YoYPg2fsJV1IR62/kaEis1P7AhQPH5KizO6R/TZ3rE
         nJ/YJmQbskKJxwXt9amFt6bYgXTfZre9nW4KW8PJEDHV1kk6+XnucZd1TdGtoxbiQ/4t
         u996GKmVRVr7v++1HwQ8y2VF8jIT9oV2ChZQGTEG4pFHrdYvwsceXGPlsTLBKJlP9qQG
         fOEQ==
X-Gm-Message-State: AOJu0YzX4YExKrt28Z1MPDW4Aw3b4ZNwVukawJiLOegjPR6rsMG44QiW
	dv1ZLddpEo2pN25MGwsthnApWz9B
X-Google-Smtp-Source: AGHT+IHJTLTGV5zkPcsqTcvMES7nj8znt++o6Y2jWEqkx0qOT6SdX9eKNkZxXctb4Hv3vAd0u+biug==
X-Received: by 2002:a05:6871:e803:b0:1fa:2cee:bb1f with SMTP id qd3-20020a056871e80300b001fa2ceebb1fmr5346811oac.20.1701179996237;
        Tue, 28 Nov 2023 05:59:56 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from [172.20.7.39] ([187.217.227.247])
        by smtp.gmail.com with ESMTPSA id h14-20020a056830164e00b006ce2e1a6cb2sm1678579otr.44.2023.11.28.05.59.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Nov 2023 05:59:55 -0800 (PST)
Message-ID: <e96c8677-5cf8-489b-b27d-9d8c1c30e2a9@linaro.org>
Date: Tue, 28 Nov 2023 07:59:52 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-9.0 03/11] target/arm: Declare
 ARM_CPU_TYPE_NAME/SUFFIX in 'cpu-qom.h'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Eduardo Habkost
 <eduardo@habkost.net>, Peter Maydell <peter.maydell@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
 qemu-arm@nongnu.org, =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20231122183048.17150-1-philmd@linaro.org>
 <20231122183048.17150-4-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231122183048.17150-4-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: xDMOz59OKp9g

On 11/22/23 12:30, Philippe Mathieu-Daudé wrote:
> Missed in commit 2d56be5a29 ("target: Declare
> FOO_CPU_TYPE_NAME/SUFFIX in 'cpu-qom.h'"). See
> it for more details.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> ---
>   target/arm/cpu-qom.h | 3 +++
>   target/arm/cpu.h     | 2 --
>   2 files changed, 3 insertions(+), 2 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
