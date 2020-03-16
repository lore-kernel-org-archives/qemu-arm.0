Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp480556lfe;
        Mon, 16 Mar 2020 12:46:17 -0700 (PDT)
X-Received: by 2002:a05:6e02:10d3:: with SMTP id s19mr1416998ilj.220.1584387977400;
        Mon, 16 Mar 2020 12:46:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584387977; cv=none;
        d=google.com; s=arc-20160816;
        b=vZbLi/aioAMKBsDIdZW5HS/hl37fpC7WyyMBh7CzC4HA0crnkM/l5vcpBpxm7RuqG7
         tBsMU9ewcCZFEqp+RaJFT93qIdBTB665JwrVhjNB86GsrRpmwyI7xRPBCRRwaspDi7Fv
         +Ew2WTlrYKf0wE3veQH8chWbwBjxzqwISO4mSb/yCyn0b+/MlrirKn2pUcoRr1EYkKMD
         u3JQPCS017IbyN0d29Dfqn6jQIhyMB/KdzUpQ+dt3vsHH9oLb0AUnMLZHCTLesjxKPcT
         JQ0yt/Y5IciGc+VJLcqTx5ZJTAWcC/JYCZj36XP6l+Uv+5JABb9m/VEjTqp8LlMGnKbE
         lxFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=Fg2dIkWCB/O1LDCS9geq5EAQZZnI+9IQOwUr+ztmSSo=;
        b=sP9u8Wj4nBLxqWjRZ5clqFSlk6Eheip58CCrB86yrREvMYUojPFuv9O2Ml32RJaiC6
         Q0rEaQKEsCoGdrfABoGMTbSlKsxjzyoazoIcWzoZ+RBVKjd5kLBfygfGXODPFrd+jqg1
         KU6wVsey52bCkHMzbu4wzJ/ciJ2qvmPK4QP80ME8AGmWCqQyAtwOegPz9GJ6vr8s8yRz
         yFkhwgND0+3rlr+vmSb4r0vVvRVk6zjPzcqAqdUAm6A1U2XKigi/dHtjAZs/MV6tdMY0
         7+aul1ZgJ5NdMvmoT5Rub6GTYYOaLIR+ClZI4v/pNeHyAlFJbTw3SEjAz7+HxXLsBktJ
         W3Ww==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mGKIQ3rE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id s76sor1056470ild.5.2020.03.16.12.46.17
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 16 Mar 2020 12:46:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mGKIQ3rE;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Fg2dIkWCB/O1LDCS9geq5EAQZZnI+9IQOwUr+ztmSSo=;
        b=mGKIQ3rE/W8YR3Tzqn81ilyK3CO1Ckuz06TR4oE12XPjyGjnVygcOSBCEyTP/ur6wK
         ZhZSaPC3s5+Ajp8rFzkY1Mcl68rlCzQf4AbCKoUhdl5++AWnjsrEXDI8shYLaXRJACCm
         ZMrewNmmoGQEYKPq044ZuJMeddaSyT+h/V0puTLnwSZ0RP99deWKvo8uuJ8dlvQdkZrk
         n6W2JHtyS+NLry3j+lRtQznf6WtI8/dgD3OoVRPRvu38VnItydo87odGkP22hDsIghqa
         772EEJQPrVqPlmr3rrabk/n15X6Kwod4NPjAJFArFpcZPoAic684k9ktoYHlQQq3NLIO
         F0eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Fg2dIkWCB/O1LDCS9geq5EAQZZnI+9IQOwUr+ztmSSo=;
        b=Pll2jgNYKUwYuoJVRxTHRAzAjF9rezQNYcp7c9Nww4y/Kw086DQ3iXi0vIxtK5Gnv1
         Uz0HLAWxZCdDil4/Wx6QZ/MTMjBP8bS60hPiAXaO5HwbSyKnVxoMsbfbGi36CHmQr2ow
         IMLNrnbU4ntEEy+boq7T6tKYChWSQbGgamjD9eEstzNCIAy26byhKyb29dXc6AovZ5Pk
         EugH44opgkjN7Rz+p/iuyVCimnPnmfhMjXh74w/ZXGTIcFRqu4/OOLGC6gxjqjRh/ofX
         arHLTqAhapZ6EwnJklxbGPRAXh2gjlKEG+SNON2NTfM0zYbRpk0BYN+MqsgeZhMVJf9f
         dE3g==
X-Gm-Message-State: ANhLgQ0m9iOFL34mjaIdTpwXWU5Youk6juxBTLgKxut87reQrXmGx6hg
	UrOhlre73WKgkXQPTz+P+utp47bq
X-Google-Smtp-Source: ADFU+vuJRnVHlZ/NwMSs1hoyK2nwN/EKxc3cwui5H4fXByD28JtCPHowfGZeHQezFemq4Tc7M7mueg==
X-Received: by 2002:a17:90a:2489:: with SMTP id i9mr1069737pje.183.1584387976837;
        Mon, 16 Mar 2020 12:46:16 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id u41sm335812pgn.8.2020.03.16.12.46.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Mar 2020 12:46:16 -0700 (PDT)
Subject: Re: [PATCH v3 08/19] target/arm: Add semihosting stub to allow
 building without TCG
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 kvm@vger.kernel.org, Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org,
 Fam Zheng <fam@euphon.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
References: <20200316160634.3386-1-philmd@redhat.com>
 <20200316160634.3386-9-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <a0aba55b-61d7-c0f4-9fc7-bf6b5675281f@linaro.org>
Date: Mon, 16 Mar 2020 12:46:14 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200316160634.3386-9-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: g/Y9nm8L/Fob

On 3/16/20 9:06 AM, Philippe Mathieu-Daudé wrote:
> Semihosting requires TCG. When configured with --disable-tcg, the
> build fails because the 'do_arm_semihosting' is missing. Instead
> of adding more few more #ifdeffery to the helper code, add a stub.
...
>  ifeq ($(CONFIG_TCG),y)
>  
> -obj-y += arm-semi.o
> +obj-$(CONFIG_SEMIHOSTING) += arm-semi.o
> +obj-$(call lnot,$(CONFIG_SEMIHOSTING)) += arm-semi-stub.o
>  
>  endif # CONFIG_TCG

This code doesn't match the comment.

Why isn't this

obj-$(call land,$(CONFIG_TCG),$(CONFIG_SEMIHOSTING)) += arm-semi.o
obj-$(call lnot,$(call land ...)) += arm-semi-stub.o


r~
