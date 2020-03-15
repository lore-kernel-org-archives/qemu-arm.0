Received: by 2002:a19:f015:0:0:0:0:0 with SMTP id p21csp2144134lfc;
        Sun, 15 Mar 2020 13:46:19 -0700 (PDT)
X-Received: by 2002:a17:90b:370c:: with SMTP id mg12mr20326373pjb.96.1584305178973;
        Sun, 15 Mar 2020 13:46:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584305178; cv=none;
        d=google.com; s=arc-20160816;
        b=E8EpTIZncSzdt4NFOt9kmJLTVkcPgVKA5REB2IUEP3cnDG6XSKwsO/6BbDGtWrPjUS
         6pAsgrEbnZb7ppKst5gvtt7FVgJLCHsYcmg2WDmcMcX+EYUpi5EftOlfdSEFj3ow0Csv
         eLwM8R/XAY0T7ZRFvdT8HxVV5dJAHDRcMHR9OCtLz4MH303O2vp7dZ3NH+N/Qp2oBTJZ
         oqKTT6skUWGyP77XbvQ5lSqz1+frev+QZITyl1K7U0DOUCQRYGmmwsMYzyZqx5EZ1GOp
         ccGY4Ej84i779HGH28IQqIBd5c0AcrjnQ8kV+UqOUBEqfssCHWpBVYLDfc/P0G/SeLJY
         J3Ow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=iFXp4zNmSDqQKJwjNyZbD2cn17LZUGny+MQasX8s9wk=;
        b=yQf9OpLo9Hsl9351v3ktpNujNYw9zwzOP4BJhjZRO4N8G55dSsdKfmb4PiOAb/tdjI
         lRWUAI0FsjlbUyFoeIWjG/uxrzcvWz4e+Kbwz1+L6Q+jpK79Zm3IZvzQaXcKlvllZhR3
         ZFc+yOrIrqpfgrPpXLXT7d7BsDs6EoFw6uaVZa1yAnb+oT9MjaPwZypTyXfygXCCwSc4
         CN0Cx9Hd5sraiXCqOok9HzMAap+ziovFjwTAMOfowODSqNghuhYrktlj/0lQHd3vKNGu
         mODNHTOjzGmjC6jKy9+MFlrGZyXL0Q6+hf3xil7jBSExCLvELdyDGD8ERyK9V8FF5VlB
         cxmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XCJmfP0i;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id k1sor17354998pje.8.2020.03.15.13.46.18
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Sun, 15 Mar 2020 13:46:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XCJmfP0i;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iFXp4zNmSDqQKJwjNyZbD2cn17LZUGny+MQasX8s9wk=;
        b=XCJmfP0i1fvapM5nqotmFRwsScJCqgbVxhwrUww3l/xWsprL8DCsdbn41PFjOkeuCz
         FvdGWZqiNaC/dMIJOuRoaHuAIgPGO+sKeTVeQCjD0iBD1vVTT7PTfQdcbBYsiOOuiQDM
         Wd69FvdRlO2H234TD2sVWj6pfhsx89AAsaEJ6iysIsNaiJfY4VN8vkBEX4Jusd3bqQjF
         WsUgOVwjrrfyHE0+qsAi+mHbdolKsp/Yaa4uHDj/5G7YcCIlUCym8ofMrolmHltbFWKM
         dfTwxXqP4/j8E7p4VeGRUQvsT1cMBQyK5yAUtGF6rfo70zL+CCCAKZDQx8bMTGFsuTUt
         W/SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iFXp4zNmSDqQKJwjNyZbD2cn17LZUGny+MQasX8s9wk=;
        b=Xshu7n051bfiAllv5096UPKWIDqfjX5ZxGjI4AhN9/S2Tc3ZCtm0k/O4DGLRLamB/j
         zR5B2DCEhb16/auYLbHY/tMvv9Msw07uJZZQ95MXemfQLwnlT0BNNaVhaiO4iahf5j9B
         Bc1CUvUwidFSwE9sNucKa9y39pFXCQoKLIGLtI9dJFFZSt//DWpOFbiFtaLe1Im3UjJa
         dgabXILqtrTSTT0rkY5QlkLy5in1cTezsKUuIDSVYoysi4FuVJHDEiXenHErg14sn2QS
         oC7cpGm0iJ2wTaXKA89minzFfWxrzzhWJT+KP29mlw+RCHh55CZhaHu6yfSLR2PI8kBj
         4/gw==
X-Gm-Message-State: ANhLgQ2QUrGmFIz3sucoEfMxTB6xF5ihyZFqRQSWLSAqgDlQuuL+U5Ia
	kVmIIiiiv8aS8dNA7/7/wQPEgpmQ
X-Google-Smtp-Source: ADFU+vsPw+Ai2GQY8mcs8tJcvUx7H9FxQhMgeeUGIQwJfp1TKTa7gtiZGs139/XFZWCwXXpzH8yRNg==
X-Received: by 2002:a17:90a:d34b:: with SMTP id i11mr20522008pjx.180.1584305178521;
        Sun, 15 Mar 2020 13:46:18 -0700 (PDT)
Return-Path: <richard.henderson@linaro.org>
Received: from [192.168.1.11] (97-126-123-70.tukw.qwest.net. [97.126.123.70])
        by smtp.gmail.com with ESMTPSA id o66sm51279474pfb.93.2020.03.15.13.46.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2020 13:46:17 -0700 (PDT)
Subject: Re: [PATCH 12/14] target/i386: Restrict CpuClass::get_crash_info() to
 system-mode
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 David Hildenbrand <david@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Cornelia Huck <cohuck@redhat.com>, Laurent Vivier <laurent@vivier.eu>,
 qemu-s390x@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Richard Henderson <rth@twiddle.net>
References: <20200313183652.10258-1-philmd@redhat.com>
 <20200313183652.10258-13-philmd@redhat.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <75c44540-a833-4c35-d698-9e919c68c47c@linaro.org>
Date: Sun, 15 Mar 2020 13:46:15 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <20200313183652.10258-13-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: rF0ebFKWn0Dr

On 3/13/20 11:36 AM, Philippe Mathieu-Daudé wrote:
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  target/i386/cpu.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
