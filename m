Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp387990wrw;
        Thu, 8 Nov 2018 09:09:49 -0800 (PST)
X-Received: by 2002:adf:83e3:: with SMTP id 90-v6mr4906269wre.278.1541696989759;
        Thu, 08 Nov 2018 09:09:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541696989; cv=none;
        d=google.com; s=arc-20160816;
        b=VW6nx1QjI780jASL340G6bIwNxvuOs78jdYWYHinXrtzVHieayTP3c49UxHX25fGj1
         alOBP5Kmpgrj5fJrJL1aUvHatyBypTNTG9y/hgI+buuKRwAV165y4xruTZYPnDHiYoXn
         7kVQCUvVsjGqySmA8m5oZZIzRxOS8Jjq1q+eSz4qHHEILKXI50Pf2FyPYIbZ7ZPinUo/
         QPkscgVTTapjKkoL42OAC3M5M/usXyLg4RvqKX+NB+Q7Z/SmXD7xD7OjgXuSrUC93bIW
         mVTp8kLA7+uDu4pmFErTaJJuK5hsQVtoN8qkeCrpwiaeGuD2hV8gCDswckyoZ+NC9caC
         fPAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=KNnFjwfFfPyn18/caOjWSLZ4hW32XGH2DC7cdiv9/RY=;
        b=FVv4kt8RxFkqVbsHrfQ0Mh516fPyk12QugT2FaD63J1hjg/FIqVZLmKu8GG2eRpiYV
         90jS4H/BpVBywIPrsvtyi9andHZtuncv+d6d4S0eYysCd3ly3yFKiJNIzxNSgtUg6ptc
         cNSsuMvcJyDzFC+RvU2Lu6qvkL0L2W3iXoA/d1YsvU1RvWKQL3lbOxkfsPAzhPEUorIu
         lOZG1RAIyVnp1hTYEld+KbWD0malu8aZfTRX5JZdMGVJUqwyGNEkZV5KZB25oaA+kJgf
         ZlKgod1bpQ9lKVhgwQDd40cglWMYH4/sGLZkOf6iNZX0/WaVK9C3D0auRdKYPHVd0L0Q
         icUw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LIb3ABPX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x18-v6sor3133419wmh.6.2018.11.08.09.09.49
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Nov 2018 09:09:49 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=LIb3ABPX;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KNnFjwfFfPyn18/caOjWSLZ4hW32XGH2DC7cdiv9/RY=;
        b=LIb3ABPXXtmPKC5VJ84l5JD3sjcRo1boM8NFVV/LqXVXYnz/vadus3K8vPIoYW67O6
         K9N0A8JOgpwxm0kqeBMlWm2QhN69uLHCbaJ2u7b6WTQpvT76o9sHSQeyXDsbjaNOJWJB
         trkX7infzdjdGTSbazCtEvIFmFAFmyfLABpPc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KNnFjwfFfPyn18/caOjWSLZ4hW32XGH2DC7cdiv9/RY=;
        b=UCmsorC4YwtM5QO1PbxeE4zPEDWRIIQuLUo3XJvL8Yj/An/rNSjuorxEJRj6FyEoHB
         5kXZoyKbIuPFKaIhWgEAc6rzIN6KGw9FnSdgq0EEXrwN/r55ZzK7JVVk1/FO7FOT9NY0
         4sYqw2brVRQALfPQLw7vhPKYhkE5I7nRyyZlZvDCfwgk1JRcXlAkMk/Nhznb3gsWFdnA
         PdS9PVii501AAMHzlmC3zU7tfTt+WRrnXQvj9Szb6XJB6e8Qm5IvdXH+RDGjJOPmx6VD
         NQmprU0+f58DMc7UHqCN20Z1Y0yKFv4Ju6blyJi9aHLGSyIG9kH+NGO6NZFRSijaici5
         IrIQ==
X-Gm-Message-State: AGRZ1gJJoAlZ2lTGcRUvTLHSpm2yXfUtUg2b9scSsgub4+dBUJq2z3T/
	wDNG2QgSFaoHeZk4PUN7QNepF1yvfd6KoxKj
X-Google-Smtp-Source: AJdET5eIIZv03rbgbf/6x+1zNojwyvO/i0tvzLsWNea+8ZI3cWPgOZXYJ1ZSWAntPm8B31KmoXYOeg==
X-Received: by 2002:a1c:cf02:: with SMTP id f2-v6mr2070390wmg.34.1541696989270;
        Thu, 08 Nov 2018 09:09:49 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (70.red-2-141-114.dynamicip.rima-tde.net. [2.141.114.70])
        by smtp.gmail.com with ESMTPSA id i7-v6sm3520539wrs.55.2018.11.08.09.09.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Nov 2018 09:09:48 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 1/6] target/arm64: properly handle DBGVR
 RESS bits
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20181108163329.19940-1-alex.bennee@linaro.org>
 <20181108163329.19940-2-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <3027e46a-42b2-4c5c-eaec-ce9caa64ecc0@linaro.org>
Date: Thu, 8 Nov 2018 18:09:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181108163329.19940-2-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: gWUn++7SFMdU

On 11/8/18 5:33 PM, Alex Bennée wrote:
> -        .bvr = addr
> +        .bvr = sextract64(addr, 52, 53)

I think you meant sextract64(addr, 0, 53).
What you wrote *should* have asserted, since 52+53 > 64.


r~
