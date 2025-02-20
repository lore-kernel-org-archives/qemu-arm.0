Received: by 2002:a17:504:f96:b0:1be9:327d:8ee3 with SMTP id oa22csp1863819njb;
        Thu, 20 Feb 2025 00:28:44 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWLcqe9QRByFekz35z4VW+c9dAu7ZNGvYTLeVwjtwmoEiiRzD0Xn2b7Srjm4m2od2UGAUkrNnfKBzcdSw==@linaro.org
X-Received: by 2002:a05:600c:510f:b0:439:3d5c:8c19 with SMTP id 5b1f17b1804b1-439a3d07b0bmr13525775e9.24.1740040124549;
        Thu, 20 Feb 2025 00:28:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740040124; cv=none;
        d=google.com; s=arc-20240605;
        b=aZ7o/5mgwxkYrpEt5PkJ+saRfs8nLst0Kd0ZRgmBMDBBpppXdqw+zkifmHMyfqzXlq
         uCaAfdx/PeVsOqTnZYcqSmchK7q1zwrwQFMl/zaOkPbqJtR8WdkqjKPPNJCUjkECHttA
         eQP/XIr6MdDIQwejPUIfpkZg+ELmcuQHNKxmjxuVU5ieA2mBJbViH6eafPmmt7Sd0AYI
         fxWwR8/2wHRQ2FrMIKC4ZvLXkfxWg4+Bo3Oymwu/KM086C1XP52WdETfb1JLm0D8wgup
         vfbeyK/nsHiZUY+Uot68hmhKFbfOJJRYiIdIjZZlNZuVnRR5VTqlCWDizZGDZVoS1jDD
         Y/uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=o42TVScMkWBRcW50EFj59vXpjFTmKfRrsrDbs3gtzaI=;
        fh=SRpyw3P4U2nefHxyOAjUsNZXZNS3SSzkEBF6DxAncoI=;
        b=BgdaQHV1TCZH5YI5OxRUJE8OHPORHoXZZDy55BY+FPsw8pVwSpzaru65mNTLHaQDK/
         ldxmx7cLcfsi1hp9I0WfaBkNzK0OTsT5XA+b5VQgruDRS7dC/lCh8niEjAuPxFEhe2yp
         HPSYEMw2NCcId8g/rls2MXVukxns3Ado9Nf6PhPIYWTDIeGWzDvJVl9b02L2OWa0owGW
         NBVcYiTYZqonF8y2++ujQ5VByw8sqbmssbi4eQTR2fEGSt1inBcWZifAEnpaftIa6cww
         PjxgLDHiyiFlX+Va6awrchl7XgZIJ4RpVtG1x30BG/dMgvHZay2BUehj3ScXiMwOpb/m
         zaLw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NQBrdxs/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 5b1f17b1804b1-439a74e62dbsor2358715e9.4.2025.02.20.00.28.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 20 Feb 2025 00:28:44 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="NQBrdxs/";
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740040124; x=1740644924; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o42TVScMkWBRcW50EFj59vXpjFTmKfRrsrDbs3gtzaI=;
        b=NQBrdxs/3G5JkQ8UP+dXmI+rv/XeAo0tD49V13HiSOZ3IMtJIQO2aQ948f4KcgRmRT
         OMY0UBCcUc/ajIDxhKveBFCBtwb0s6k+0lKkQfkXOChinoUZrqhST4N5gUbSkkNWwnDY
         YnGE/dErcM7yINSXpDbpZn7eM8dWbeWQ47umPuRrqgLQiqFMUho+gw3h8On/kbkit5Qs
         kHUmDrqpyFb0QZixoYqXqlM4UgFsVZo03NGZlej07npR9rVpIgYG4+8kiyHwp0Yx2eh1
         uN9ti/IgBXmkixfOvRBfw5+uVM0ZMezsTiRgfvpkFVnr81VurEqXlrZoQNxNKUA7PuPs
         kuGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740040124; x=1740644924;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o42TVScMkWBRcW50EFj59vXpjFTmKfRrsrDbs3gtzaI=;
        b=mHKRBJFKak4W69m9pl6dbcly6uihzNK5Df9ITwakd+tsydKkdujsygXIwptP2WZidO
         3VJHE/6SyCDo8ZjhMcHzis6/VS8uSD7AXi3YKNU9T3m+7KkkwdvHXUvGoduzovkM7xQj
         oCudUi/uFUqqPgkTOfxif54ZBm7JuFUYt+2PlCkcDXvjzJkX0aZGoJ/6YyPEbZEg/W7C
         sRtWvMTmZe5YCDZDB1NPpJ62tsZF1EOprVMOi7/78iapxPeMpQtDLw7fvad0S30IsUSL
         GhrH8YsFcU9nuLK5VaoyveUuEaoRbz8jrT439Mv3gf5PIH2d+KQ69JjvOpsAz+JFgfrr
         iVnA==
X-Forwarded-Encrypted: i=1; AJvYcCU/7tNKpcWEGj3r6xmxs3Koj3eJZkEHx2kRAyFri0MbKpsKqdPGviuV5CxqzDaJNiv11RZCQBJ4uUTF6A==@linaro.org
X-Gm-Message-State: AOJu0YzyquIsZ6vOzHIpyJJ7PNBe+xs4Pb58bbHtu/i3lvd+T3hr74MM
	i0MreD+cEUvYHYcQB6CVjaYiA0HOjgGVBNNdUo0Yyu7HDpDv9RsaZF3MxlN3D55Fsw==
X-Gm-Gg: ASbGncsdW/7xCNH+sHkNAJJ3BjE3HbI5YQFqAHxtJodV2pOexKAvSn3eblXCCUmuulH
	a72/mDKa5Nc6LBn/vARKDIhbra8WyEbADyyecoWsg9PyWHXqxD1N35CK9PspVK8OIJfqng52E4y
	IDcMc1Rf7gLQLI/HjT3XGoGEfTGhVPOd801cswSFJADEgqkhBYN5eYXIwyxsD6QAnAzb+C9Z3b0
	ImlI9KfRHdBRX7qHm+MJyuXpZA0voTXj1qIGVk73TIqhzImxBoX0Dzhwg2YMKtBvCCZnLmIHLLU
	8o3MvC2QbSLZhxVUWt8jivi26eKkLMr35W2wgc3wffs5anJC4q3X1i2mDAM=
X-Google-Smtp-Source: AGHT+IHPTG0euoZqI2s0iNfGxqPzS5bcoKsS+brkfAysI0y2548v3uJvhG9NAadqPKFq839NR+HfeQ==
X-Received: by 2002:a05:600c:5246:b0:439:9d75:9e92 with SMTP id 5b1f17b1804b1-4399d75b257mr49033445e9.28.1740040122491;
        Thu, 20 Feb 2025 00:28:42 -0800 (PST)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.196] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f258ddbe0sm20155678f8f.39.2025.02.20.00.28.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 20 Feb 2025 00:28:42 -0800 (PST)
Message-ID: <d159a860-21b2-46e8-a74f-cd6be14ea525@linaro.org>
Date: Thu, 20 Feb 2025 09:28:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/9] hw/char/bcm2835_aux: Really use RX FIFO depth
To: Luc Michel <luc.michel@amd.com>
Cc: =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org, Evgeny Iakovlev <eiakovlev@linux.microsoft.com>,
 Rayhan Faizel <rayhan.faizel@gmail.com>, Paolo Bonzini
 <pbonzini@redhat.com>, Yoshinori Sato <ysato@users.sourceforge.jp>,
 Magnus Damm <magnus.damm@gmail.com>, Peter Maydell
 <peter.maydell@linaro.org>, =?UTF-8?Q?Alex_Benn=C3=A9e?=
 <alex.bennee@linaro.org>, Thomas Huth <huth@tuxfamily.org>,
 Shin'ichiro Kawasaki <shinichiro.kawasaki@wdc.com>, qemu-arm@nongnu.org
References: <20250219210841.94797-1-philmd@linaro.org>
 <20250219210841.94797-6-philmd@linaro.org>
 <Z7bmAqE4z2y_kNse@XFR-LUMICHEL-L2.amd.com>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <Z7bmAqE4z2y_kNse@XFR-LUMICHEL-L2.amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: wGYGyPCmrzw6

On 20/2/25 09:21, Luc Michel wrote:
> On 22:08 Wed 19 Feb     , Philippe Mathieu-Daudé wrote:
>> While we model a 8-elements RX FIFO since the PL011 model was
>> introduced in commit 97398d900ca ("bcm2835_aux: add emulation
>> of BCM2835 AUX block") we only read 1 char at a time!
> 
> I'm not sure I get why in this patch and the subsequent ones you keep
> mentioning the PL011 model while you modify other UARTs. I guess you
> mean "the BCM2835 AUX model" here?

Oops too much copy/pasting...

> 
> In any case:
> 
> Reviewed-by: Luc Michel <luc.michel@amd.com>

Thanks!

> 
>>
>> Have the IOCanReadHandler handler return how many elements are
>> available, and use that in the IOReadHandler handler.
>>
>> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
>> ---
>>   hw/char/bcm2835_aux.c | 6 ++++--
>>   1 file changed, 4 insertions(+), 2 deletions(-)
