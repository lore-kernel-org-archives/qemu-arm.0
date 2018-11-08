Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp395730wrw;
        Thu, 8 Nov 2018 09:15:24 -0800 (PST)
X-Received: by 2002:a7b:c393:: with SMTP id s19-v6mr1975628wmj.142.1541697324725;
        Thu, 08 Nov 2018 09:15:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541697324; cv=none;
        d=google.com; s=arc-20160816;
        b=mIEsJ34Me7ckcxuPFSbLPltz/Kty4IG+ovD4PWWI65paVOuEPygysdwUwPHthgSZy+
         RlCMn+AvJ9FH6Uq93O51KrETaBUdGYdFU3dEdVNUW3hNIB5K7HCbjfSYy0PcsDwqeukD
         QjLiol2W96gs301kBybhTwfwmiH94Sqilrel6W6MrlovqA6jo8Sx9YZOx3zTLlPEDRxR
         P3eGjZRejyoSuDk8CBbdRJcu97bHAP0VgfvaJ64GMvHc1M2hdXymYPgslKgBx0/uzYxi
         RQSjJAyBUxrVO/WUYhhJy2i4LxtiuHI1iHsvklCItkrSeVxxNqdL5nkDZULvc9JBv/yK
         JS6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=N7TFwOOZpQiMe9+d26KfuC5M2KiPnp3SxHmbwZxpOK4=;
        b=SZxwXuBLR9JOLRmU2idUUGM5GOwYxjFcPryGEa5A6/Ky30zTX5M2+7x8lAT8aFfYqP
         IRPpcAtmjH++yWMNFferoZgs+MV5Bn3AKxYnspnQrIt5ICqnqHn3T/CEOYsv/AATE9aZ
         k3qvyV9FoZy8hwzQ05Odzd4vt2KeZ3ZQo7zplBk6/cRZe9yD8BW1cQp1jsVUqFLQUx/j
         EdfGNt7LAyYUXo3RMgzYJIRzWfv+IvazcmBia1mDCmYNAdUjiJwd11QbjEFQVBmxYUjS
         36XBqL1kHF+P1WX3g4fN+EvaAPawBD6dwG54y1sJiCjvJDEVWeBkwaKt8VSaL7g4vuWA
         T1NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RZRg+jq1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id q138-v6sor3150299wmg.29.2018.11.08.09.15.24
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Nov 2018 09:15:24 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RZRg+jq1;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=N7TFwOOZpQiMe9+d26KfuC5M2KiPnp3SxHmbwZxpOK4=;
        b=RZRg+jq1r13jND0ESapLc1R74yCDfEP7eBY202wfLBOaC1fPrUkLEZUuv24GUYBneo
         ta4w2WoIoawx5Ke7YFykMQnXVsOEPxJOGoNLh8wTy/UdFyyaphcNoA8/d0xKkGWYnhpT
         Uc36lA5VVx2g4CDq7cxNWuZRJcF5Qvzu/WWOY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=N7TFwOOZpQiMe9+d26KfuC5M2KiPnp3SxHmbwZxpOK4=;
        b=INelk1pSkFxpLSISLO8NxNfMUS3EBMH8EabDe+Ulv0IktfEPpBMmXnTWrgPG2p6sPy
         MHBY9DKayRl2h4xGXMk2SVb8y5UjHyCxxGjA9Sdd/LZoneQm1D7imB69W/Yfi4vLdv0A
         fMay63YxZNxJYPOeP7P3DJgfcwrAbVDEU/UGYxxKkiaj05/aNW8EURHX35jHtQewRh0i
         3HO3mJ8JeXMsMtRyORGcGf0xfNhGnjPLTuViHIOG9Apxak2if3sbFL1umACnzrID4d9U
         aWSfJQGLnBbx886qQJvLCgi8a7UGPizoGeYcNXpbE1uoky3fReC/RKanebgpmm6cszSO
         J0Jw==
X-Gm-Message-State: AGRZ1gI1pxTlse2e0zfHywrb4BZS3SkemsvnIzo9bAh7NYLdhVTtEDB6
	tzEpuDjUDbQwhk6qB0KN08D4PPCrB+wEnUua
X-Google-Smtp-Source: AJdET5fVBUtlAvbwym7qFMcVMC3YyRdE6lzShfBLy/9E/lRdiOR3OqGoPy1mCQ8bRfONLoVZPMzdGA==
X-Received: by 2002:a1c:5f42:: with SMTP id t63-v6mr1920661wmb.59.1541697324307;
        Thu, 08 Nov 2018 09:15:24 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (70.red-2-141-114.dynamicip.rima-tde.net. [2.141.114.70])
        by smtp.gmail.com with ESMTPSA id h5-v6sm7895831wrs.51.2018.11.08.09.15.23
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Nov 2018 09:15:23 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 5/6] arm: use symbolic MDCR_TDE in
 arm_debug_target_el
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20181108163329.19940-1-alex.bennee@linaro.org>
 <20181108163329.19940-6-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <1fabdfca-32fc-b66d-ba46-eed8fafb4f96@linaro.org>
Date: Thu, 8 Nov 2018 18:15:21 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181108163329.19940-6-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: I8bMNVV3pd6Y

On 11/8/18 5:33 PM, Alex Bennée wrote:
> We already have this symbol defined so lets use it.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  target/arm/cpu.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
