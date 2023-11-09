Received: by 2002:a17:906:5615:b0:9d0:bf65:29fa with SMTP id f21csp816463ejq;
        Thu, 9 Nov 2023 15:15:09 -0800 (PST)
X-Received: by 2002:a05:6e02:1a65:b0:351:5b43:5ecd with SMTP id w5-20020a056e021a6500b003515b435ecdmr8086157ilv.14.1699571709210;
        Thu, 09 Nov 2023 15:15:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699571709; cv=none;
        d=google.com; s=arc-20160816;
        b=cdmFWhOwy/ruTsgMrqaiUihw9AiKj/K8RueNAw1B816Tdww0vzpo4Bj5AK1rQIHB/+
         b/ZUs5QLVUsK6D8YF5y38ZZ2otoI5GERT0q7v1vM2WTwe+HQh+kwLZHrrar3M9utgU3D
         XSKMj2LGnFj/wT8ala93ueUmEIWU/G8E3dbOq9aU47ZvCgPwH4IMqsfPn/p3ahttvnsT
         4jXqQjkOAJnP9Ph3Yy14A6kD1qijtJFoCBXrsaJ3SM3ITxdUJJLzHRLHcc6Ixq1JjLWG
         YPAW5JeEM5GVnSSbi9cnqh11j4WzV03BwCgRZWm1aiZbI2Q7hitLkzZQ/bZG0KfPe9B0
         8KXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2yWdT/Z4cWLzUryLTqY6tt1ohWW/kvwoOTeU0FO6Fjc=;
        fh=vAoDokjqrynz8jAbtK1xh4Iyk9vBbPhDk9aIWpnLxQQ=;
        b=jYbPuXS1VAaoEHIU6hCP55C18pOHTzSLc6T+nCFHaFuTwJ7VVRmxRmd9kaEW7Yp7Dn
         kLiTzMgZtDpxMx5T743zCiBbJD93YRjSh1A2ygtu84hamHcZh/RDqKLpLeTE76LSU2Nn
         yqNrmwp4GtmppOQZxF8WDMm2f0dGurv6STE1/V7a8EQfgu1RAtiXEIaIRQ63sdZMlSVY
         0bm3kmnQ2kMaQ6FFNGMiSx3nFw3eEaKU2yzCpmk2Rz88u8aJxqBj2a2pkZk5LUZT7se2
         W1X+U+gIty1c0/IQ8eitu24hB0plzD/d+DI3lm4ZZDlIto3Wo8/UX0kzdvnhC3FJQ0HC
         7m4A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VwPNPd9f;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k3-20020a056e0205a300b00357aeb62316sor3812275ils.15.2023.11.09.15.15.09
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 09 Nov 2023 15:15:09 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VwPNPd9f;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1699571709; x=1700176509; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2yWdT/Z4cWLzUryLTqY6tt1ohWW/kvwoOTeU0FO6Fjc=;
        b=VwPNPd9fjQGC3XVa8T/Z6TC/Rhb18pXrmuYZKcJdkJhfUizhqJ4hz+GEPcaedE9Trc
         9h2VrNh4yljc4QnAE62G5ocFXtBHArxzYYSPZipaUN4Fgr+IygkNKULz0+GzEojNFHdq
         vhNtp1fiju8z5X2BF1E/ydap4xpO2jGSbtCtLHAN2okR5rAQCZwpv7Cq22rETrAedCTU
         L+RCcMci9s0WoLXe2kp5iU7eN+Q4UINnuquoFaNa4OafWnJ4Eve6qBxFVQzFe5so41Br
         +9S25D26QBRwOKlQyBiXBKjXcOJ4+AQSaNbE2sUlcnUOG42RtkmvGZYjMkAfVvPO/Qxz
         L2dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699571709; x=1700176509;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2yWdT/Z4cWLzUryLTqY6tt1ohWW/kvwoOTeU0FO6Fjc=;
        b=IO7hMFDWF1Eohjeeg3P2jRqIiQG74eDakGIbR3Sua9Q9PX9PaZAzaJIYev2eUlcExf
         wS/mj0dvScZ7+p08JhUpX0G6+DveXTJWAGk7ORm5/48sz5ZGblHQHzAmP1d8EBLlOAnL
         a4sLpjM0evZKnpybXtJDEYx7DZoci2mnynIgJFP3L1goE1v+JFtQL7KTN3w72R0FBp5c
         EuQcXq1UvZE2xdhNZ9ghKGQbFaL6uFK/He4+F0IMmeBUHXXV/YgyZCN0ZCmmF5Va63Bx
         yRTk3wrHI3gn4w7/9sujphVDhB7M3eKEB04b+OZzsgz9c3WyhaAUxS6dgfIib2IZUjBc
         QUpg==
X-Gm-Message-State: AOJu0Yx6BynVAZqX8iKiH2Ek5X+8MuNGiYiSlSrKYoVFG8pAWuB+kj+n
	Pv8/k2gh5G4Wa0sCfs/KcZ+Ca0d/
X-Google-Smtp-Source: AGHT+IHn7ZmlJ4OeUYZmBb6LdgW1RlA7RrStuxah7FNK4uOoClvf5g6j0X09bGxk0CLwtGOmiyYxiw==
X-Received: by 2002:a05:6e02:1d92:b0:352:a73a:16f9 with SMTP id h18-20020a056e021d9200b00352a73a16f9mr7353933ila.18.1699571708615;
        Thu, 09 Nov 2023 15:15:08 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2607:fb91:1ee6:29b:6626:64c4:1b48:c565? ([2607:fb91:1ee6:29b:6626:64c4:1b48:c565])
        by smtp.gmail.com with ESMTPSA id y16-20020aa78550000000b0068e49cb1692sm11237476pfn.1.2023.11.09.15.15.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Nov 2023 15:15:08 -0800 (PST)
Message-ID: <0be4199e-cb05-4735-949f-bc4e2ad18f9e@linaro.org>
Date: Thu, 9 Nov 2023 15:15:04 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-for-8.2 v4 02/10] util/fifo8: Introduce fifo8_peek_buf()
Content-Language: en-US
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>,
 Gavin Shan <gshan@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Peter Maydell <peter.maydell@linaro.org>,
 Evgeny Iakovlev <eiakovlev@linux.microsoft.com>, qemu-arm@nongnu.org,
 Francisco Iglesias <frasse.iglesias@gmail.com>
References: <20231109192814.95977-1-philmd@linaro.org>
 <20231109192814.95977-3-philmd@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20231109192814.95977-3-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: dHej2BODm91Z

On 11/9/23 11:28, Philippe Mathieu-Daudé wrote:
> To be able to peek at FIFO content without popping it,
> introduce the fifo8_peek_buf() method by factoring
> common content from fifo8_pop_buf().
> 
> Reviewed-by: Francisco Iglesias <frasse.iglesias@gmail.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>   include/qemu/fifo8.h | 27 +++++++++++++++++++++++++++
>   util/fifo8.c         | 22 ++++++++++++++++++----
>   2 files changed, 45 insertions(+), 4 deletions(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
