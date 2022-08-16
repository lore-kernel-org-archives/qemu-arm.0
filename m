Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1714020ejf;
        Tue, 16 Aug 2022 03:55:46 -0700 (PDT)
X-Google-Smtp-Source: AA6agR6lyYxK+mKhp7VlIg6rUSlMPRjXlo18FNlpqrqpDpMmXuYx9GsXPvXYAqAsBRZ2fXR/jtOj
X-Received: by 2002:a05:600c:1993:b0:3a4:c0a9:5b6f with SMTP id t19-20020a05600c199300b003a4c0a95b6fmr12829205wmq.79.1660647346306;
        Tue, 16 Aug 2022 03:55:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660647346; cv=none;
        d=google.com; s=arc-20160816;
        b=FEy0XSsSTDhQ8uEiiMbgmbI8Eu10B9konxAPZWwb9qsbu6t5jWfS9/3NhBrMQJcIh+
         uG5xv4L91vEHnkf+8ls1f7+Dri24hQBqcCYpWge2ecXW4NDpFCIA7UPNKrAUV5j2Rhg3
         6/Nt9uGAhPMl83j2X0c/ilBeLCX5sxYRmyG3zJVYSDSyQ1CIUWvInjIjln51eKJv0bRV
         AjRwdG9H2trR3qkSrPXrgf7RumiUXKjcNHJ8P861C/phqp5MyRn+auCqjsgRj4Vxdf/c
         wuZblSFLs7qyFqhES2F1MB2G/p5whR7SG6StaC7JVjnIeRI58qHd/Oclj35PSvLxtx39
         BiUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id;
        bh=/2jf+/PSEjx3A2EFA80z4L+syMnlRHxdyMYAVO36y7M=;
        b=QaBpSc0SKIFueRkmxyDcFpU8d3zRZ0VdqUoO6S2jK9m/QvhXQuePqd8K5nxyuHXkoH
         1veVVITr1b/RlNL1CZ160VFH1td7URGPdm3AKOMc+ydNoHH4HSNYaR83ah+MPY9xXLL/
         bq6TGnp0M7L7jJowUnCOHnF9y18kzCHNhYlGJhV6kaxmAC6p2LWbCoo3iTfiJJVpcZTy
         FZynyUP+omxK781fXxTVybUCT8Er8wTPDdGbUL4WMbE0RYLzdYMziD9UyvjVKzvvKeSh
         1fw9dB/VW+kQ4KoJuEkEMn6gF4bMrbExd7Yto9zUaQ0sIWR20zTgupfZhBO9QcBhVfCL
         FV1Q==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.126.135 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.126.135])
        by mx.google.com with ESMTPS id y4-20020a056000168400b0021d696183aasi6387812wrd.553.2022.08.16.03.55.46
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Aug 2022 03:55:46 -0700 (PDT)
Received-SPF: neutral (google.com: 212.227.126.135 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.126.135;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.126.135 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from [192.168.100.1] ([82.142.8.70]) by mrelayeu.kundenserver.de
 (mreue012 [213.165.67.103]) with ESMTPSA (Nemesis) id
 1MkEdF-1ndXme1UgD-00khPV; Tue, 16 Aug 2022 12:55:41 +0200
Message-ID: <19ca6b92-4bfa-de9d-3f96-f1c008bc42b7@vivier.eu>
Date: Tue, 16 Aug 2022 12:55:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [PATCH 3/7] target/m68k: Honour -semihosting-config userspace=on
Content-Language: fr
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: qemu-riscv@nongnu.org, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <f4bug@amsat.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Stefan Pejic <stefan.pejic@syrmia.com>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Max Filippov <jcmvbkbc@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Furquan Shaikh <furquan@rivosinc.com>
References: <20220815190303.2061559-1-peter.maydell@linaro.org>
 <20220815190303.2061559-4-peter.maydell@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
In-Reply-To: <20220815190303.2061559-4-peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:tY6WgihIAzHHYynSTuPLVLzC5fhUU4qp5OIpiRobmqle3HZM5nQ
 D2BpYvbmaiFKl+D21dzZmmbYgksHgS1b85wH0IJXllS8yNXH8tag3iZU6q2HM3WOYikoYbd
 20xdhT9jnfHuLgTQkdIbQT6llajQGbLzDW+nqZjA0xXTYCa+YtIzPqVswSdvuib/bGyxeNS
 LMijM+UIXwc7BIt2dza1w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:UxH64Jl9SuA=:uOU9d6DfC7MbSWQwl7W25Z
 ROUcy8cn1G983BXxEUWOM0D0OUPUJXww6tP+x1OLhEP106PXLonmSkQHHQ87FaKaF0FioJAYS
 /Q9IKcQ/c0AWP6/VcveiR7IVRsk0pEPfCMgY4514+T88F8qDnWU6b8thM0Ah0IhGixszdUkx2
 hWo+RLfksbpMRKmlh66P5vPqU/bs7pcgWDLqnSIT12V+HBKyhatWXoN28108t1+nn5mW1V2Ex
 dhuFNAJl4JF5zLbInRU3w5Om63pmz+uykHD3ZMhHjjdZOhmU6g44iykYLDCLrm965gdL4VlJ2
 bkDjsAsG6RPrOGpvLoG1PuUCOmVLt5oLFFemwYGJq5ijTqqXzEyz/CgQP7OrG8BUKtMoMh3mN
 xkFvUUCh4jP20seJRf1BObYcTnQg5OW5AzM1bHP5ZqEe0QGVk3bcxeTaNZ1j7R5PBYlXAxxFC
 CLJvEc45djN1pXK3QCmJ1JNeQRNAVgpDF0Lzb3MVN+dxVs2e1ZzOSB1BSM7/gqxv3PNDeW9rp
 wwgjdcsiFhTAHQ4R/2zZfZPG+KXmaWe+RLEKPhBcN2rzfm/3R3ZkXVTmz5jtLe0wukiBDeUkP
 2lBRxkWYPBPLdD5SYUFuoQj025+AfEBB/Jvq7rIXAJ68qM8QF3JnkAN3rfyOtamX8+xEDqzY5
 N9mVgbvkvUnjwrD8VlyoGnH+kIm9M1POjCuKuqeQ/UpWLaP+bmp9PFGumqQssFvpFSO4BQ5K+
 UjkaZEWgYO/w3eOKc7QPJxox3svulLmLNvd88A==
X-TUID: tlERdEcRvhiz

Le 15/08/2022 à 21:02, Peter Maydell a écrit :
> Honour the commandline -semihosting-config userspace=on option,
> instead of never permitting userspace semihosting calls in system
> emulation mode, by passing the correct value to the is_userspace
> argument of semihosting_enabled(), instead of manually checking and
> always forbidding semihosting if the guest is in userspace.
> 
> (Note that target/m68k doesn't support semihosting at all
> in the linux-user build.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   target/m68k/op_helper.c | 3 +--
>   1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/target/m68k/op_helper.c b/target/m68k/op_helper.c
> index 4b3dfec1306..a96a0340506 100644
> --- a/target/m68k/op_helper.c
> +++ b/target/m68k/op_helper.c
> @@ -203,8 +203,7 @@ static void cf_interrupt_all(CPUM68KState *env, int is_hw)
>               cf_rte(env);
>               return;
>           case EXCP_HALT_INSN:
> -            if (semihosting_enabled(false)
> -                    && (env->sr & SR_S) != 0
> +            if (semihosting_enabled((env->sr & SR_S) == 0)
>                       && (env->pc & 3) == 0
>                       && cpu_lduw_code(env, env->pc - 4) == 0x4e71
>                       && cpu_ldl_code(env, env->pc) == 0x4e7bf000) {

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
