Received: by 2002:a5d:6844:0:0:0:0:0 with SMTP id o4-v6csp390325wrw;
        Thu, 8 Nov 2018 09:11:27 -0800 (PST)
X-Received: by 2002:a1c:954b:: with SMTP id x72-v6mr1903209wmd.14.1541697087746;
        Thu, 08 Nov 2018 09:11:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1541697087; cv=none;
        d=google.com; s=arc-20160816;
        b=vUY9Ed5ViNPov7MihDG8fr7lSLxkjcskHAT/9eZeUVK7s56oiaqNgyBm1PHyDo6urJ
         eW1VF3Lnq0tp3atT7XH1Ix/7oaaZHpOieue2l98OJmRWvlQT0FOg7x4coK1k8D452kTz
         pT8z2svIy35IrLXFSeOpSkZCK86atByPsU9tlYnpMAbcWqyaGJoATrMem3ehox+JjwaW
         SmoHVcG62XbjpPHqTnle2IyLetoiwl0J6e6T4h39v95B3wvhIPB7EF6Kxo7GWO0c5o0f
         M+RSPw+nGO3TMfh2Vvt9DrYqAv3BxhRgDcVZxUx23yNp1MoCv6w9XdPcagqNZWcjTTbJ
         dc2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:cc:to:subject
         :dkim-signature;
        bh=1EEgk5XZ1uA+wqsDTW1xD5vr6qwGI2MZEcvk4W4d1bE=;
        b=kdJFUdKIY6jeyAecC6j9mPTQfO5LfK+4NXLUwce1NuxAhL5WH75xPsnKqTNVv2K+cO
         6IzhtQ6mSwwoXd3hYfM7OC2O1kOaWaXZWlT6Sem8c4x5E76PwhHvZEkCvLn5B18qVDxU
         NN17TSvAwI7wOAY2SxyjRPRogXqIIyAPNT2FgvE+jpzt9A8Zhs+eGS/35CuU5htL8/M5
         3bz3910dOR1+oad9uOJyVjDnOsMIXWI7Stb128JDOANYsr8rQPZalJUBeh/RsIFWhb7A
         Zvb4+KaflEBg6nevE+lnKuSU1gNuFM6unQdsWvR2mQgnaq7zDH8vfWvaTqSw3/Qt9IeO
         /r6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DyrUVI1C;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id r2-v6sor3133478wma.5.2018.11.08.09.11.27
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 08 Nov 2018 09:11:27 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DyrUVI1C;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=1EEgk5XZ1uA+wqsDTW1xD5vr6qwGI2MZEcvk4W4d1bE=;
        b=DyrUVI1CKiInhlqGmETBjFvfJJpByzaarGnEQwvYfw7Zmw6kF+CQ6HlMuDhbIiFvFN
         A5X84+hAeuwLxv2eN30eSZ7tzNHVWd3JiQBr0/qZNbdB5PKQpLCEPfhgxKoutRF6EAlu
         Kt3jAu+OuGKO0wvawBB2bpqQkbS2P4688PTYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=1EEgk5XZ1uA+wqsDTW1xD5vr6qwGI2MZEcvk4W4d1bE=;
        b=FZRsz4vnSNHCB/iOaGwmtvjWnp0xwG+7SaT2j+XVGKZSrM4EZYYd1nG+gYLMAR2V68
         o5E+Htjq+T8sydr+7Y7a8ywuegej1yD1LaVqhoXIgKio3tVMqzGVHJYcSKEBd/b1SbZ1
         xLwr3cpdnKaSTMpq5WuyYS60Q+pRWVTnojBtrmJky0Mkg6fZiB644kjEZhzQ/ZMoB461
         pE0WwnLRf4WXtmVu3ffslHF2Ed//EnT7otenl0dDpkm5RS41aLC8dEKTVsDZApSZ+V9Z
         x02AQl0JsSWVwBx79XnBB5uCY4gfUnZRPEEWeq2GSYwwpfZ0t6LET7aPHTybl9XW5Lew
         eQhA==
X-Gm-Message-State: AGRZ1gKnouInTSUxc+UkfsuCY6JOXkLjmYNVvmUTtE8/nY4NbNFltScT
	cQJMO1fkSZckc2IwXiFGWREgzjN7
X-Google-Smtp-Source: AJdET5dGfhkZXzbZ5PVEzst68/CpDXw1EpIeIP3xUlLJ8gnef5+yo/xMkBQJ4smBXuXL1u3qLisDRg==
X-Received: by 2002:a1c:bc82:: with SMTP id m124-v6mr1904909wmf.76.1541697087343;
        Thu, 08 Nov 2018 09:11:27 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from cloudburst.twiddle.net (70.red-2-141-114.dynamicip.rima-tde.net. [2.141.114.70])
        by smtp.gmail.com with ESMTPSA id q2sm5580066wrx.77.2018.11.08.09.11.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Nov 2018 09:11:26 -0800 (PST)
Subject: Re: [Qemu-devel] [PATCH v2 2/6] target/arm64: hold BQL when calling
 do_interrupt()
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
References: <20181108163329.19940-1-alex.bennee@linaro.org>
 <20181108163329.19940-3-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <36e79569-1e58-503b-c2fb-e9b1df0353e6@linaro.org>
Date: Thu, 8 Nov 2018 18:11:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181108163329.19940-3-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: xUeDTlShAtha

On 11/8/18 5:33 PM, Alex Bennée wrote:
> Fix the assertion failure when running interrupts.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>  target/arm/kvm64.c | 2 ++
>  1 file changed, 2 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>


r~
