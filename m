Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2644724njj;
        Mon, 5 May 2025 11:38:51 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCVahRwfDvVY6cLiVWOtSZ3gW+iNOEYraX5R+1F03+tRoRutSEGoYiquK2kytQ1fD1EHc52q05BMrYm6xg==@linaro.org
X-Received: by 2002:a05:6a00:ab8e:b0:736:bced:f4cf with SMTP id d2e1a72fcca58-74090d018afmr935169b3a.0.1746470331301;
        Mon, 05 May 2025 11:38:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746470331; cv=none;
        d=google.com; s=arc-20240605;
        b=ji0sXdrBf8SqkaFfGiI/yfeEdQamiHP14O038yqPeB4H9T0Xjwfy7fpHITRSquuJ+j
         m3LYDL2fP3BNo7viv/fqBFWnUVgDWXngE3jtZ63BYG12FBny2t5jmQ44OUB94ahe3tSm
         OYw9iQnWiUDAcFioLZK/ZbiwyI3vv4EV18LbeI0tj6OvlfD6UcDgXqfIz0T+4zx2f9kb
         Ugxe9ntPbzHIQO6PsyiG5fEEQqKzirMoZAJBpvCDdoAMSyuPpIQkRufP1rcj0IG0XUKS
         8sBt6ekgp9SKsWbfRVf3PPoFYp6zMVgE83yWXhdvpL8drI6C3uxhJlNCDYeOQ+kD/5R8
         rF2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=nKyzw7dqii7wjo8QpjXm87u+f1HmCj0oWFjoWrILNos=;
        fh=dGFPuodxZgSBS9UeQ9JX4YDPkdcoee4/N1w3lUuMYaw=;
        b=U/Eo4Zruuw7uTEq9KMoL8gTbWIJoUdCy2dTfy7X7+bgPOBWa4cGzKWjA2zHMRMJACb
         7dFoR4DtjPx+5yDj16NtHtVHWAA7N2tRKjzws5N9HLFZOYVazyOwhoI2nbgVT2gW+Onn
         OxB+N37ZYZaf9/pfy3AVkateOdliZOtfdgwLOCmuO3F+bTrVaq9pSRBCur8WtDZ0meJY
         KQZsD3Fbt0b9blU44gBaNtSJxgG8Yy6/1uWMBEt6hdNfiW0h/EvFMDPuQ4maNk7GMQ51
         h3GysRCWT1oS6saxLnkap4/iblliFrLtWSzGpMSW71HyMaCXXoZZi8YJjIXhA2qjfjdq
         RQnQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nl4O31Pi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id d2e1a72fcca58-7404fa380f9sor4553336b3a.6.2025.05.05.11.38.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 05 May 2025 11:38:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Nl4O31Pi;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746470331; x=1747075131; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nKyzw7dqii7wjo8QpjXm87u+f1HmCj0oWFjoWrILNos=;
        b=Nl4O31PiVquO83DlN9kTNFd1YWtnYciaNZNY2gd21EUXO6FGlx7aM3Ghdq0MQhdkJ9
         3WxDuHj9qfp9+V1k5BXSdk+RBfXvsca/qznuLeUpPTgyobCaWS9kAYf/7ahCAl+Z78PM
         Kf3GtVZU3UVszwJVQwhq0bVpsYxCKjhGhA0yAmbi8yC7stFwAD6ZANXSSIkK10kuHtE8
         R3QRZTZanr2LFx/cJ42U+vixfTDDU1Uuj4B+0em+5z6g1eQk4BzVc3uj/t/rRKzZezEO
         7Nv9XH0BJIICRN1muuczDwPupq/KPjyIjIZnAa6TeW4x+BteaXl4lxsdYqj7sUHfiyIA
         Cb3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746470331; x=1747075131;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nKyzw7dqii7wjo8QpjXm87u+f1HmCj0oWFjoWrILNos=;
        b=jN6J6gya0YIsUavIE2bbFGWkDnQbA54RJP81F+nzYQLUB3FjbaH6Ufw3yTHDjUxcsW
         FNrPIfzrFkav75wbSWCEwe4VDiNjgji53+jJ/7CHpYeV0rRmAZDc7Q9DBYWIsBfM/p8N
         qmSsq9Y3VfyHQssI55TK7eYcNiwEfvGggdDd2FI89E7BjemqvJmPb1Tv/KxWuC+DopB2
         9VqQf2ymORRAS9+5c+JgYEAgL3l4yqHPBTQgkYymfQmb+uJGgtQuc4rbqTFHwcL3GOko
         BEe6t5H+f/MMsCIbJG/WKtKWPkaLGjr1ClvOvePSIURlzdqKLO1mV/pQflZD2JhM/iH4
         nP+g==
X-Forwarded-Encrypted: i=1; AJvYcCXKMslNHQzjKRAjVB2k0RNDehJjXqqu/6zqCNk+uL6yT7FoAo/3JBZ9H3gpRWp89dWEVUlvAmXNq9nzlQ==@linaro.org
X-Gm-Message-State: AOJu0Yzwjo+3z5JgkJ1cFsIsG+/VOGx670Rmv3c0e+XURku4BdkWsbsX
	cuZ7ddkzPYevhAM22lclRN2jkOcCHebJiaYIQUGQUCF+hijnZnuEBRa6g1fKdGRszGflkjKE2AO
	Vqtk=
X-Gm-Gg: ASbGncsfy/ixlW8AQp5E17Ro+2khmNimCMQLwXvi1bbvPy6WPy0rayaVi9YqxYbqXU4
	9kqErA4bBnLfyea45y/2TxzC5O+IGRaeqNPyNSW6Ww1zRYSFhGkP+NbBj4OL7mx+AZkLYGQy+jc
	TAsUmxiO2c/jvYefqGnEzzo07CHATWFgRhroGtPQgGK4Qh6B/lqoPtMg6VH9Vb045F/GbdTs+oh
	pwNsP0V8q1hJnab5aRSG4QJKlF9kPNQGpd+ETeHPExuZzgj3EuPUQ9IItqX0zu7rXWCfiLeLXf8
	gJwZqnYnkoSUUF+CyWW0MacJlxJxy4mz2xctxwbmMTP5hyObrFgA71yn2+YTSnPqhLunUbNejVW
	UQ70mmjQ=
X-Google-Smtp-Source: AGHT+IGAAUCgJ+qHs+CPl3wY0lI93EZysTDceyPncdEvx0HUi2ww0QZf26oq01DkkIYwwBVPPIR4oA==
X-Received: by 2002:a05:6a00:3908:b0:732:706c:c4ff with SMTP id d2e1a72fcca58-74090f149f9mr821065b3a.7.1746470330721;
        Mon, 05 May 2025 11:38:50 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.0.4] (71-212-47-143.tukw.qwest.net. [71.212.47.143])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7405905d029sm7366657b3a.134.2025.05.05.11.38.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 May 2025 11:38:50 -0700 (PDT)
Message-ID: <79916f8d-2793-40a7-b769-ee109c52ef63@linaro.org>
Date: Mon, 5 May 2025 11:38:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 41/48] target/arm/tcg/crypto_helper: compile file twice
 (system, user)
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 alex.bennee@linaro.org, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, anjo@rev.ng,
 =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
References: <20250505015223.3895275-1-pierrick.bouvier@linaro.org>
 <20250505015223.3895275-42-pierrick.bouvier@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20250505015223.3895275-42-pierrick.bouvier@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: ojXvKsOK0uEO

On 5/4/25 18:52, Pierrick Bouvier wrote:
> --- a/target/arm/tcg/meson.build
> +++ b/target/arm/tcg/meson.build
> @@ -30,7 +30,6 @@ arm_ss.add(files(
>     'translate-mve.c',
>     'translate-neon.c',
>     'translate-vfp.c',
> -  'crypto_helper.c',
>     'hflags.c',
>     'iwmmxt_helper.c',
>     'm_helper.c',
> @@ -63,3 +62,10 @@ arm_system_ss.add(files(
>   
>   arm_system_ss.add(when: 'CONFIG_ARM_V7M', if_true: files('cpu-v7m.c'))
>   arm_user_ss.add(when: 'TARGET_AARCH64', if_false: files('cpu-v7m.c'))
> +
> +arm_common_system_ss.add(files(
> +  'crypto_helper.c',
> +))
> +arm_user_ss.add(files(
> +  'crypto_helper.c',
> +))

Could this use arm_common_ss?  I don't see anything that needs to be built user/system in 
this file...


r~
