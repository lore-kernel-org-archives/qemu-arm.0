Received: by 2002:a17:907:6195:b0:a52:fc6:5c40 with SMTP id mt21csp838001ejc;
        Thu, 11 Apr 2024 02:38:46 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWagIiDsY5VCzpH1TNC9gfyf7tdM6l1G0q7EShG2stfg4uGk/Vgwdtsiv0DkNSYiF3nIdhWQR8v+tZNA4Hiw3RTuJWuvRkn
X-Received: by 2002:ac2:4256:0:b0:513:c593:a634 with SMTP id m22-20020ac24256000000b00513c593a634mr3136237lfl.6.1712828325827;
        Thu, 11 Apr 2024 02:38:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712828325; cv=none;
        d=google.com; s=arc-20160816;
        b=YIl+Qeg6se7jYUcFgdbLPoR+1fKLrxE34qEurHDIzswc6886+Q3LfZg/ZM5gmcWp6M
         SCc6YEdFAqkwfEnxMAu/2tPSEFbeMb0Is8k5bXndlWyl3n7i+xpTsJfmJ6f3Qe0BSPrO
         3dPie4AIJqA/iA8fzFiXr6577F7Zz/1YBIyhWwqXOX/arSH82WFNmWQPNGQ3MaVUsRan
         Iyd6zHbSJqOno4d6Egqesl7MVaVpP/vZsdOyCw3F51NtFomPLg67/NSgkeP18ATjFylK
         q+AaM1UW27muPYRXHtf1gGadkoERO2F3dtHehzEbGAwUMx28zVG4MNIAxambyXM9Dt4T
         kvVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=7fM9cGvwNHjTApymx2jsNglNkNKdGfduqVDjhU9Bvhw=;
        fh=OfBZOp+1dGbqxYStzGQ9HJeu22fDE2rcKceyUzQusnI=;
        b=krbcBEo0wK1YG88DDaOtWQnHUQlOsqZMOKAeljfBgqcLMwUjvbpXB3su7P0KjuDoB4
         fvpGLsMAdR1zQT2HQU/rF6ltTRpmqeYA4K8QG7VSlj5Em2EKa6y7x3DxtydXgZ3JFcsl
         D+C8ZjW303dhWFkgCUe0MnxqrZl0ZMAVyRBxVtMk0+RL1ZBh3gAkt1VvMfFpZfT9eVjY
         RwiRSE9E0wf7FQFMSWvE9vCOV4IgrryHTlHl9YPHq5kLN5Ns6OEbrX4WMVc35gpUPsQ9
         wQJgQaLal7Fmw1Q+FspzYrbHAwTTgI2cn9bKDEqxqrDBD78Y+gm7URCJl5iHZ74332tW
         m3Vg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QQYwdeKM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id dx9-20020a05600c63c900b0041681e7fb76sor245717wmb.8.2024.04.11.02.38.45
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 11 Apr 2024 02:38:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QQYwdeKM;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1712828325; x=1713433125; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7fM9cGvwNHjTApymx2jsNglNkNKdGfduqVDjhU9Bvhw=;
        b=QQYwdeKMuKUl9708m/h+502UUj3CMj8mwJ7Y0LWw/gZddMX1uDyXYd3wKWpej9Bw81
         NJHkJqRaahM6qe7QTS93hJLqcj7sS21WMdN4QsCJvoSOMVOs8OWcJaPZApdtWTySJoy/
         VWE93yI6CZERNRTxJ4PIRkf36wel7SGqZJFKfl2Bn6AbSyCk/lHFyvLHvaErF9Gr0civ
         vovUTKOvDiP7yO8vG6qCcTZRbxfI1G9lvra06fY7ixKYtmMxoS7pdURGuVFEx3iTwkr8
         nSKNhUPbnQLvYxrr8tRjhHqEmE63QFfx28KVG3FFdxqb2YLAyHMdDJILvxUEC/R3C32g
         Lw8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712828325; x=1713433125;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7fM9cGvwNHjTApymx2jsNglNkNKdGfduqVDjhU9Bvhw=;
        b=nuzn2g4Srbek5jkY/BDgpgBJb2kKLjZFTTxRNwVOTUZ66VEtaRFAzSADENiNsxPcET
         YgkUv+xh6UogY5Gjh/mV2et3IJ7Yk4v9oNAGKfKbYbhKZFFdHrcSuVhgTjGo/Ilb3957
         8N6QbF8JZVeV/K3r6DwXW6Q9SoA2aOik4WuMle2TIW2txy1e9CVkne58BRQkDCbWNdp8
         Hhe78yDaPPfASWe/gwR6fCcF2XkuUqNpeqAe17F61eyeVPP7DObLnfRfQCPJBexYHerw
         fX3uuLR6wwHZD3hcq+3YjRHr9E2HejOEHSAFLWmij7qhhL5oyfnrGFE7xbiJaCitBR0y
         DdXw==
X-Forwarded-Encrypted: i=1; AJvYcCX/aw4H8qdPiECc0NJPptdW/ee5AM331J08C/l0vCjKRE+yEiyIOA6xnJjkUP9XF1pIP4unf5OorbILUSFh8oEi1A2G4XSF
X-Gm-Message-State: AOJu0Ywuh5k81BXj+YKCft/v42Wa7B+t3Mrx/Vifg6xmTTLoc2P5kqbu
	16+c/DHgAMA6jBGhDdKLYUEM1Pz1nj1g0FrlmUm0qtVcKNven5S2HS62ZxYSmB/Z6A==
X-Google-Smtp-Source: AGHT+IGmgXHhfflvf0dubM3y4Nv+twYLjm6a5XwL5rW7Zuc9wvRyiAcb9ryQprRl55G+uECrJQTGZQ==
X-Received: by 2002:adf:fe44:0:b0:33e:6f9b:7abc with SMTP id m4-20020adffe44000000b0033e6f9b7abcmr3072525wrs.65.1712828325341;
        Thu, 11 Apr 2024 02:38:45 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.202.175] (137.red-88-29-174.dynamicip.rima-tde.net. [88.29.174.137])
        by smtp.gmail.com with ESMTPSA id h18-20020a5d4312000000b003455e5d2569sm1395827wrq.0.2024.04.11.02.38.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Apr 2024 02:38:44 -0700 (PDT)
Message-ID: <1c6cc7f0-a0c7-43c1-aadd-d4c8d76354d2@linaro.org>
Date: Thu, 11 Apr 2024 11:38:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/12] misc: Remove sprintf() due to macOS deprecation
To: BALATON Zoltan <balaton@eik.bme.hu>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-arm@nongnu.org,
 qemu-block@nongnu.org
References: <20240410160614.90627-1-philmd@linaro.org>
 <c4c8f2b8-7ef2-4b2f-a9d4-8c1e64668570@linaro.org>
 <220fddca-0017-79c9-ec1f-23bb8a68728c@eik.bme.hu>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <220fddca-0017-79c9-ec1f-23bb8a68728c@eik.bme.hu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: AlBz4kC36vdq

On 11/4/24 00:27, BALATON Zoltan wrote:
> On Wed, 10 Apr 2024, Richard Henderson wrote:
>> On 4/10/24 06:06, Philippe Mathieu-Daudé wrote:
>>> Hi,
>>>
>>> sprintf() is deprecated on Darwin since macOS 13.0 / XCode 14.1,
>>> resulting in painful developper experience.
>>
>> Is snprintf also deprecated?
>> It might be easier to convert some of these fixed buffer cases that 
>> way, if allowed.
> 
> I had the same thought as some of these might also have performance 
> implications (although most of them are in rarely called places).

I thought GLib/GString was recommended for formatting (IIRC some
previous discussion with Alex / Daniel), so I switched to this
API for style, rather than thinking of performance. Anyway, I'll
respin using sprintf() when the buffer size maths are already done.

> 
> Regards,
> BALATON Zoltan
