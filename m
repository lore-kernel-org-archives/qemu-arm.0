Received: by 2002:a19:e8d:0:0:0:0:0 with SMTP id 135csp2009001lfo;
        Sat, 30 Jan 2021 06:48:08 -0800 (PST)
X-Received: by 2002:adf:f307:: with SMTP id i7mr9604162wro.367.1612018088226;
        Sat, 30 Jan 2021 06:48:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1612018088; cv=none;
        d=google.com; s=arc-20160816;
        b=JAFY0U8Q2Dqmdr8YbIoYMH+tNTHbZUkT0pOAET54a9oihvWWgi9tvHh+sek5XR1mHq
         jyQaMuZjC7UiDYZEwS0MqPJv3C4Z3ldX8KqIkw+6T30R2guS76DWSzqbinrnUBIwk6rV
         WVmVXtlyapss9QyQcta9dsDBRsCpaKjr926Ycn002R+q1GfyArWkQyk05kHVhOiJFNWr
         GJD6KHGsw7PHg9EILZ+Y+g//WiH3RL5mECHIERFWATCmk2TCtX/h51F5x+jT+c1BxdTK
         A04i7fC3MSkHfJ/wr1eVVBDvgM0qeVEhJhqJ4qtQvSCCS339h0rXu9J8TQv0v1friVP5
         /2wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject:sender
         :dkim-signature;
        bh=GlgDHR3ZqZqWGwjAMNZSIHStR7gOfs1UN1h7d6dVVjA=;
        b=dh1l/FgiZlg+7ToFAD0D9jQw3AqnhVEkbe6aO9wLq3paRtgl+DHyMYKmxs6DfWQMvs
         7C/UzEcCGPC2oMRhA3dpq5GsGnJVU89mha3z22mzSk4aFhcWjYS7FEqtFTmHo13gndNt
         LCfAAPTerUCmMHoOv/hiCjCrB3NbDLfGAPT6VsRwmrNevxv38XBMv5WNUkCJFGuhm6hv
         D470LKAJYWy7P8n/DDSvib/xjwz7xYOPvU7gSXlSGfVviixhSYDLhsIlti2fXG/EbvEM
         LEAGb/K6MgAl4m5Ie4R3tDVVEV//qe75dgUzUEbPGzO/wCRFnme2r8olqrzpVAJxHinJ
         7AnQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="WVUeCXW/";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id b15sor6385463wrw.62.2021.01.30.06.48.07
        (Google Transport Security);
        Sat, 30 Jan 2021 06:48:08 -0800 (PST)
Received-SPF: pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b="WVUeCXW/";
       spf=pass (google.com: domain of philippe.mathieu.daude@gmail.com designates 209.85.220.41 as permitted sender) smtp.mailfrom=philippe.mathieu.daude@gmail.com;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=amsat.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GlgDHR3ZqZqWGwjAMNZSIHStR7gOfs1UN1h7d6dVVjA=;
        b=WVUeCXW/DrQyxBNC0dV2M+zXhJprCPvF3rX8dxM6GE61Gd9pjyJPsux/WYUSLPsU3f
         brfFGowIJbC1H0wT7zBYlscqqF6lAQBoRvVvfAC+FjmXq8RKrtDy7kaW4Jjpn14qEtsm
         FObrStJiF4166Vpj+I9yzLm8+SMdBorTwUJ3vLxuYg7LriBN0oqmTcAc4rYYkSnRXyXI
         ScxXum9So4d2fVh8nhyHwgXy1T3AILQPEvikuL/+gIdEEGVL9Gdt237B0/v5l2cVhgb2
         DqEG+m+c/fqfuQsrg73OlP2VqbvkoYJxa8+SdU/JLnfe38m0hTg97pW/+aizmGTlhMqC
         C1rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GlgDHR3ZqZqWGwjAMNZSIHStR7gOfs1UN1h7d6dVVjA=;
        b=GsPbG1dTQccXe5sMhNfgLzAXImpXsrWOI/D+MH9x2fUWXCWTHSnG8xXXkz9dKtOsv+
         2jEiI19txYaK4/Nn0NUS4Ba3NBGWnuPT6Z6xhmtaGbgNXtfS4kqlqryDeqrwVyMxYyBw
         I8/ZgCnzrVymNd7x/78PmSXZCssuLkf1x/yMf0boGgWBF21lDjYGCppQyOT4Lk72rQ5/
         Wxo6BNpffbGjRkw06+5qhKWgSGZoEFADKOqF3pu9LhJM2kjyLyg5Y6RI848dbqn1MEWl
         N0xBbk3bSVeQIa1jX8Yktyt5nwK69O5KiAB/JCgKuDx+a9qspAy09CyXJu7yRGdMWktI
         CACw==
X-Gm-Message-State: AOAM533EidPfoG33J2lPS7UiIVoqDuuIqARXAUkI5BO87AwiXWqv7d94
	MKvf1OWyKfDsIwq5r3hO0l8=
X-Google-Smtp-Source: ABdhPJyXHSQk9hGaa07ZqC3MAbMC1wI3kpYj4cKTrV66w37uTSTBJ2RNMrzGc4nxVNR1fl9GP0/TVw==
X-Received: by 2002:adf:ed45:: with SMTP id u5mr9773679wro.358.1612018087373;
        Sat, 30 Jan 2021 06:48:07 -0800 (PST)
Return-Path: <philippe.mathieu.daude@gmail.com>
Received: from [192.168.1.36] (7.red-83-57-171.dynamicip.rima-tde.net. [83.57.171.7])
        by smtp.gmail.com with ESMTPSA id a17sm14650465wrx.63.2021.01.30.06.48.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Jan 2021 06:48:06 -0800 (PST)
Sender: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philippe.mathieu.daude@gmail.com>
Subject: Re: [PATCH v5 03/11] target/arm: Restrict ARMv4 cpus to TCG accel
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>, kvm@vger.kernel.org,
 Peter Maydell <peter.maydell@linaro.org>, Fam Zheng <fam@euphon.net>,
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <rth@twiddle.net>, Claudio Fontana <cfontana@suse.de>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>, qemu-arm@nongnu.org
References: <20210130015227.4071332-1-f4bug@amsat.org>
 <20210130015227.4071332-4-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <e8502280-5c49-a81a-a1f1-b677adb8d8b3@amsat.org>
Date: Sat, 30 Jan 2021 15:48:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210130015227.4071332-4-f4bug@amsat.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: QaYziytUPjVX

On 1/30/21 2:52 AM, Philippe Mathieu-Daudé wrote:
> KVM requires a cpu based on (at least) the ARMv7 architecture.
> 
> Only enable the following ARMv4 CPUs when TCG is available:
> 
>   - StrongARM (SA1100/1110)
>   - OMAP1510 (TI925T)
> 
> The following machines are no more built when TCG is disabled:
> 
>   - cheetah              Palm Tungsten|E aka. Cheetah PDA (OMAP310)
>   - sx1                  Siemens SX1 (OMAP310) V2
>   - sx1-v1               Siemens SX1 (OMAP310) V1
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  default-configs/devices/arm-softmmu.mak | 2 --
>  hw/arm/Kconfig                          | 8 ++++++++
>  2 files changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/default-configs/devices/arm-softmmu.mak b/default-configs/devices/arm-softmmu.mak
> index 341d439de6f..8a53e637d23 100644
> --- a/default-configs/devices/arm-softmmu.mak
> +++ b/default-configs/devices/arm-softmmu.mak
> @@ -14,8 +14,6 @@ CONFIG_INTEGRATOR=y
>  CONFIG_FSL_IMX31=y
>  CONFIG_MUSICPAL=y
>  CONFIG_MUSCA=y
> -CONFIG_CHEETAH=y
> -CONFIG_SX1=y
>  CONFIG_NSERIES=y
>  CONFIG_STELLARIS=y
>  CONFIG_REALVIEW=y
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 223016bb4e8..7126d82f6ce 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -1,3 +1,7 @@
> +config ARM_V4
> +    bool
> +    depends on TCG
> +
>  config ARM_VIRT
>      bool
>      imply PCI_DEVICES
> @@ -31,6 +35,8 @@ config ARM_VIRT
>  
>  config CHEETAH
>      bool
> +    default y if TCG

This doesn't work as being added to all targets...

> +    select ARM_V4
>      select OMAP
>      select TSC210X
