Received: by 2002:a17:504:17c4:b0:1be9:327d:8ee3 with SMTP id o4csp4420578njd;
        Fri, 25 Apr 2025 07:42:35 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWYDpcIeR/7nX5/yF8K4JJT7eF09NtthKW9o6ZlC1031hFcR43vu8SGjTCR7Fm+/2zfjI5HMf8mGaJkWg==@linaro.org
X-Received: by 2002:a05:6000:402c:b0:39c:dcc:f589 with SMTP id ffacd0b85a97d-3a074e1f5e8mr2316062f8f.20.1745592155610;
        Fri, 25 Apr 2025 07:42:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1745592155; cv=none;
        d=google.com; s=arc-20240605;
        b=KTLtGDzruauUs17F9JuOmNcVLcqESrzbcVSC1GT7r3eotFErjtZHfWG8zsgLIts1q0
         RJelxxCxBG/DCq332tjJwur+2/DVv2asBmGncNR/3ScUYGEU5y/2M8+jy4kR7tWjebbU
         Yo8qDoniYbLmMDEo1Qgd0l3DXgSVMsH+sBlLBZLk4DOGM7r/52ISETU/8Wy1dVUShHI6
         1ZGKqihI+0yvCqhrGIY00rrvpTTHMUDPw8kXseLNiTOO7YcyRLPradxMRurduSe4VejB
         oYf7gmjbmb7tpdsxznB13vRmf0VffzcNl5ZVqWQzMjOWNDJwTC4jGjAkylh6V1EaapNE
         xJ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=WlA1P3UYiP5nqEUfWorUtHT++/4e9WdbRP9cK6FMuUk=;
        fh=egtSApDwEQkOS0AX6/iQuHP+EIA0vIkUFh9U3mOlmv8=;
        b=Z4X3y604sa3AxM4+d3rfZQXb/0fa+GRTW/86q1wCok7iPeDksUafM89AUExRY3AFbb
         5vYsHq59WkatdGyte+yHwb84fKyFfAZ0ynz5yZN+lVG8giiEHFy3HAIjQUZbUBhwIeyZ
         EGmJhMBX8Bd+uCpdv/NlJ4c/9G16/+qS+3yusT3UN+urfTrTw+aFfVJLVl3kH5p8uqvN
         PQt725x2hijNUvpc3uOmy/HCa9HRZJwv+DKK3yrO0whkaIIb8aydaus0t4MR4ooGrOtb
         JJGlhVeXe8QhHkU5JJkydHT3eNXiB/jESNfHin/kLptSNVGl43mCuZs0KtGH7TR/zq1V
         R8xA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=quWrJ2HH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id ffacd0b85a97d-3a06d4a90b3sor1185555f8f.2.2025.04.25.07.42.35
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 25 Apr 2025 07:42:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=quWrJ2HH;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1745592155; x=1746196955; darn=linaro.org;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WlA1P3UYiP5nqEUfWorUtHT++/4e9WdbRP9cK6FMuUk=;
        b=quWrJ2HHjoTNqCq7pFdK0nmNoXyCPN/9jlDjzxaMd+KId1c2GuyHnto4mCAWbF5iMz
         yrm6dT0JoOd6Gh+hjV0lEOgv6LUsuerGw/5IvwVln49Y6n2hsSofgP9CBol5tfFUzpnr
         sfT6W7dtpmL0rapTqdQxUFoEZaJ4TVnv/X8rlhazAiXzUe1IoOpYehyr2WSg9b4R0FMx
         20b/jf5JsjdTTfZ2sli6CjTwBv4TMCyZwCEc6n7JBM87A11Z1Z4gI0n1wPT5S5/DDPXb
         +G0X8zaSFTACYP5tgA47IL4K2lNdVmIJSPl7yTcsxXaWIH7L/yJZwYrDe3Bazel9Jevg
         jrFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745592155; x=1746196955;
        h=content-transfer-encoding:in-reply-to:cc:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WlA1P3UYiP5nqEUfWorUtHT++/4e9WdbRP9cK6FMuUk=;
        b=lAnPhgV8IQ8Ngr9WR8XTrauNlCRHcmaQK5yK2O50sXjqS5UIyq/ZfJpjmYEMtUKOZf
         GMpz7OwCEB/xbQ7CTtj5FoCmwD0HYdkfQalHrImXK7vKgjpYYDO34C7wyEavKYKN+1X6
         sb6IsAk8zZrkHPE/CrZ8hDv8u2kspFPSY0MuPmKLDvIjiMXw+wOPTACaSPCCzz5CuuM4
         8++ETCILmZj81L2ljrKp3mEj+ZYAMTwivSyASGggiunQSb1zqE0/HOyE92F62U8BAjrG
         559loievt83mHo6dDR3QH+u/bsDooJ72TZhmdeNE20wjtB1HgspZFbdw/cl/gJ0qW9sa
         Goeg==
X-Forwarded-Encrypted: i=1; AJvYcCW3yBFZv75eCWLcaQL8JIOlv/kfiue3tN1BQd6SqCKjsJhevVWBoI3iquU/RRQxXtp6/68h49G8nu2epw==@linaro.org
X-Gm-Message-State: AOJu0YxX+KEVSg0iKuWKNxnG0ftw6DJm6rrLuKgxI9CTp1bC4VC/caZF
	E/6hQlhRSUUb5qcx6wehMeOAki5BDM+YtaD1Wn+iHyUBF7NQQl6TO86OYA2C6rL5zCXjs8bSQ8u
	Tjxw=
X-Gm-Gg: ASbGncvzAg2qKM8Zl0H19x445oaiTyAlKq5NV12p/LYL4SDXygEfPj/H9VdrGuOZqj4
	F5UxKhd2CmNDUHRz0/axCX1Wc/mod+B1xSCiej+V8knZYxfejkmMlZcvDs8O/4G1TTJ3cZinCjv
	8S/d/zwgV2rptHhP6rza9s6bRh+uPWvb5xRBOmi7padN8yr9jYLvA5gHIbHzirtGkNMhuYzGsQH
	0nje1PW/7Up80C+2SCNEHn5sv6dolJYf7NdZw0xy9QhYzdHNfQhjWFeLfRM4Q2K1ebmrHmyvCw+
	4hwjsXTX1YaoOAVBgeHQXUdXaCKWV0jLYnAKQB1cUEM3Vs1R9COuJHue7uOL743iupSvMP5S4Ik
	qhoEciO39N5JwrRMc/10=
X-Google-Smtp-Source: AGHT+IFD+Tgcw+N2OZdydhTGME0xCuO5L6z7HZ4zFveTRLvgao2+spK6go/9aqM1WoC0+B+fZp2JUA==
X-Received: by 2002:a05:6000:40ce:b0:391:4674:b136 with SMTP id ffacd0b85a97d-3a074e3cfc1mr1917795f8f.29.1745592154971;
        Fri, 25 Apr 2025 07:42:34 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.226] (88-187-86-199.subs.proxad.net. [88.187.86.199])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073cbedc4sm2502026f8f.47.2025.04.25.07.42.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 07:42:34 -0700 (PDT)
Message-ID: <ca432cc8-31a6-4b22-81e7-4c620a9f199f@linaro.org>
Date: Fri, 25 Apr 2025 16:42:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH for-10.1 6/9] target/arm: Present AArch64 gdbstub based on
 ARM_FEATURE_AARCH64
To: Peter Maydell <peter.maydell@linaro.org>,
 =?UTF-8?Q?Alex_Benn=C3=A9e?= <alex.bennee@linaro.org>
References: <20250317142819.900029-1-peter.maydell@linaro.org>
 <20250317142819.900029-7-peter.maydell@linaro.org>
Content-Language: en-US
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: Akihiko Odaki <akihiko.odaki@daynix.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org
In-Reply-To: <20250317142819.900029-7-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TUID: 1ffEpzwjij1x

Hi Peter,

On 17/3/25 15:28, Peter Maydell wrote:
> Currently we provide an AArch64 gdbstub for CPUs which are
> TYPE_AARCH64_CPU, and an AArch32 gdbstub for those which are only
> TYPE_ARM_CPU.  This mostly does the right thing, except in the
> corner case of KVM with -cpu host,aarch64=off.  That produces a CPU
> which is TYPE_AARCH64_CPU but which has ARM_FEATURE_AARCH64 removed
> and which to the guest is in AArch32 mode.
> 
> Now we have moved all the handling of AArch64-vs-AArch32 gdbstub
> behaviour into TYPE_ARM_CPU we can change the condition we use for
> whether to select the AArch64 gdbstub to look at ARM_FEATURE_AARCH64.
> This will mean that we now correctly provide an AArch32 gdbstub for
> aarch64=off CPUs.
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/arm/internals.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/arm/internals.h b/target/arm/internals.h
> index a14c269fa5a..a18d87fa28b 100644
> --- a/target/arm/internals.h
> +++ b/target/arm/internals.h
> @@ -1694,7 +1694,7 @@ void aarch64_add_sme_properties(Object *obj);
>   /* Return true if the gdbstub is presenting an AArch64 CPU */
>   static inline bool arm_gdbstub_is_aarch64(ARMCPU *cpu)
>   {
> -    return object_dynamic_cast(OBJECT(cpu), TYPE_AARCH64_CPU);
> +    return arm_feature(&cpu->env, ARM_FEATURE_AARCH64);

Unfortunately this doesn't work well: while a Aarch64 CPU is of type
TYPE_AARCH64_CPU right after being instantiated (not yet QOM realized),
the features are only finalized during arm_cpu_instance_init():

static void arm_cpu_instance_init(Object *obj)
{
     ARMCPUClass *acc = ARM_CPU_GET_CLASS(obj);

     acc->info->initfn(obj);
     arm_cpu_post_init(obj);
}

void arm_cpu_post_init(Object *obj)
{
     ARMCPU *cpu = ARM_CPU(obj);

     /*
      * Some features imply others. Figure this out now, because we
      * are going to look at the feature bits in deciding which
      * properties to add.
      */
     arm_cpu_propagate_feature_implications(cpu);
     ...
}

The GDB feature checks are done earlier:

   object_init_with_type
    -> cpu_common_initfn
        -> gdb_init_cpu
           -> gdb_get_core_xml_file
              -> arm_gdb_get_core_xml_file
                 -> arm_gdbstub_is_aarch64

At this point the feature set is empty, triggering the
assertion in gdb_find_static_feature():

$ ./build/qemu-aarch64 build/tests/tcg/aarch64-linux-user/semihosting
**
ERROR:../../gdbstub/gdbstub.c:494:gdb_find_static_feature: code should 
not be reached
Bail out! ERROR:../../gdbstub/gdbstub.c:494:gdb_find_static_feature: 
code should not be reached
Aborted (core dumped)

I suppose gdb_init_cpu() needs more splitting work. For now I'll drop
this patches 5+ from my queue.

Regards,

Phil.
