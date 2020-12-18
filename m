Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp2218864lfq;
        Fri, 18 Dec 2020 03:59:38 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzU/kYEQkfcdBypSlC0UctF1fxax6UyYLi0KhXusMRfYBEk0jBlE9EcXitHGngJFr8AkcJD
X-Received: by 2002:adf:ab45:: with SMTP id r5mr4042351wrc.99.1608292778168;
        Fri, 18 Dec 2020 03:59:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608292778; cv=none;
        d=google.com; s=arc-20160816;
        b=pek5lbjtagycrHckmbD+/qm7XURZoJznAfOetuXORYmgzzyYadEhe3RJPaYkTUBo8K
         8atDCvkCuPPJ8AQVzgdhanTCa/7PuwBPVV4mXZJae9oNLm4mIrPBUr2tXPyu7Hdp72QG
         ZhYtkPQ5fkNxDLUZiYhReXCuyPrhwBLQjcukjLnq9H8D1T1VmOePmO61uLo8JzpQ4j8t
         5XxaAYCNdrjXnoAfEf75HpihSjwHHRkxCKuBoa8LR1AYTCU2Wn2R4L6Epbm+Pdnd5kCu
         zIecNgAgDpV3F11FRMa5Fqz8r7Lt2Qjby7iCR7BFSyy3jiKCRIbKBEym1YAR6doPrw+w
         bsaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject;
        bh=cHL3JJnW72uQ7uXDTADl9eRTFjbf2EA3ajyiGAi4dHo=;
        b=KXfVVXToqaLeJp9xlR4D5Oxd4WIujpIz45RE05P/EeSXz2/9DLOUcsrSmY0k69B8zw
         kyl4VF5HAJ6Lcdv9O4hT6iW30rzdwOhABBU8UJY0/d5RdJmOT1vr/t2E7XddFs6GGg+T
         WrK2ecTulBP12aRkxrdK+CuJ7gclXLU4NVw+p4EXIAS6MD03V4fwUl+W5kg5hhMoHf2p
         L69qOA4Pa/GWo0X90KZNwsG9SQPeFE3GhoR4uhZWAxFyglUrD1xm7G9RJJh9jbMUEggf
         68cFkVFMdF9s3nnljWE83PD+pofX8dtU3FtCiLzh7nu22+a2onDsos89P+b/RGjsKpx1
         CN5g==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=neutral (google.com: 212.227.17.10 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Return-Path: <laurent@vivier.eu>
Received: from mout.kundenserver.de (mout.kundenserver.de. [212.227.17.10])
        by mx.google.com with ESMTPS id m5si7905296wrs.298.2020.12.18.03.59.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Dec 2020 03:59:38 -0800 (PST)
Received-SPF: neutral (google.com: 212.227.17.10 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) client-ip=212.227.17.10;
Authentication-Results: mx.google.com;
       spf=neutral (google.com: 212.227.17.10 is neither permitted nor denied by best guess record for domain of laurent@vivier.eu) smtp.mailfrom=laurent@vivier.eu
Received: from [192.168.100.1] ([82.252.144.198]) by mrelayeu.kundenserver.de
 (mreue107 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1MHFwM-1kueGP0WuW-00DFlt; Fri, 18 Dec 2020 12:59:37 +0100
Subject: Re: [PATCH v2 6/9] gdbstub: drop CPUEnv from gdb_exit()
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Chris Wulff <crwulff@gmail.com>,
 Marek Vasut <marex@denx.de>, "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
References: <20201218112707.28348-1-alex.bennee@linaro.org>
 <20201218112707.28348-7-alex.bennee@linaro.org>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <3dc57d93-fe80-9562-be88-cbf86af6bfea@vivier.eu>
Date: Fri, 18 Dec 2020 12:59:35 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.5.0
MIME-Version: 1.0
In-Reply-To: <20201218112707.28348-7-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:cwws3PKH0n/LHeZy2tGBJGFljYv5c/SLwFWhTnRGM/+L409EojT
 akoxqCR44vsRkKDQRzhR9jDMfJM0Zu4evnEG/MXx4DWsQD2mo6v7lQqxVhHzQPAHDYPwNK7
 qjz8dpZth2jFQZ6/xOeQv1+ZbS1VEKOziYi/LI49Rn4SL3Lv5WlIYCkIC4BKnDi5S6GHYOh
 RGLoFccyhgVc6bO7+F98w==
X-Spam-Flag: NO
X-UI-Out-Filterresults: notjunk:1;V03:K0:29TTJlhp5EQ=:wyauKb+ddqcumaDJRoTBqW
 UMBHpx30UvcR+XNg6tnd9E5irsAsEms7AS2YbDzoc74SlPhsut7vODdfrY67I4cegaEeBmATo
 oImV2WnqL/AdZZewDLx9D2Ix07xBNU5ETCcWNFez0JgkH+/snphQnvFwZCMmuvlT9/8ByFLUQ
 FRI1mXSKIzdxaDlbBmJycEddGfvqXbaSpqjxbB9NlJaYz3964tZPe0ClmxtDmNvi+eZJCeOqn
 /uB7bCA/E9Zqx6ytopeNEtc8SsNKmsi4RGxaCASEtF4Q5BeHS5PdBPN+J9uTUhvP/TcltVqUe
 3jCbslq0HLfl8TdTRvIbozVtJGapf39biwWbZKjgBpS67Bc9uoXgWJoWWxERBHO2HE/miww8q
 VaKAyO0tc18uXVn0vJtmxJcypupcWIYexwGWT58daZOTE0NTSJIUcrX41jiyv
X-TUID: dkZPHeWCZo6p

Le 18/12/2020 à 12:27, Alex Bennée a écrit :
> gdb_exit() has never needed anything from env and I doubt we are going
> to start now.
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20201214153012.12723-5-alex.bennee@linaro.org>
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  include/exec/gdbstub.h    | 2 +-
>  bsd-user/syscall.c        | 6 +++---
>  gdbstub.c                 | 2 +-
>  linux-user/exit.c         | 2 +-
>  target/arm/arm-semi.c     | 2 +-
>  target/m68k/m68k-semi.c   | 2 +-
>  target/nios2/nios2-semi.c | 2 +-
>  7 files changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/include/exec/gdbstub.h b/include/exec/gdbstub.h
> index 94d8f83e92..492db0f512 100644
> --- a/include/exec/gdbstub.h
> +++ b/include/exec/gdbstub.h
> @@ -46,7 +46,7 @@ void gdb_do_syscall(gdb_syscall_complete_cb cb, const char *fmt, ...);
>  void gdb_do_syscallv(gdb_syscall_complete_cb cb, const char *fmt, va_list va);
>  int use_gdb_syscalls(void);
>  void gdb_set_stop_cpu(CPUState *cpu);
> -void gdb_exit(CPUArchState *, int);
> +void gdb_exit(int);
>  #ifdef CONFIG_USER_ONLY
>  /**
>   * gdb_handlesig: yield control to gdb
> diff --git a/bsd-user/syscall.c b/bsd-user/syscall.c
> index d38ec7a162..adc3d21b54 100644
> --- a/bsd-user/syscall.c
> +++ b/bsd-user/syscall.c
> @@ -333,7 +333,7 @@ abi_long do_freebsd_syscall(void *cpu_env, int num, abi_long arg1,
>  #ifdef CONFIG_GPROF
>          _mcleanup();
>  #endif
> -        gdb_exit(cpu_env, arg1);
> +        gdb_exit(arg1);
>          qemu_plugin_atexit_cb();
>          /* XXX: should free thread stack and CPU env */
>          _exit(arg1);
> @@ -435,7 +435,7 @@ abi_long do_netbsd_syscall(void *cpu_env, int num, abi_long arg1,
>  #ifdef CONFIG_GPROF
>          _mcleanup();
>  #endif
> -        gdb_exit(cpu_env, arg1);
> +        gdb_exit(arg1);
>          qemu_plugin_atexit_cb();
>          /* XXX: should free thread stack and CPU env */
>          _exit(arg1);
> @@ -514,7 +514,7 @@ abi_long do_openbsd_syscall(void *cpu_env, int num, abi_long arg1,
>  #ifdef CONFIG_GPROF
>          _mcleanup();
>  #endif
> -        gdb_exit(cpu_env, arg1);
> +        gdb_exit(arg1);
>          qemu_plugin_atexit_cb();
>          /* XXX: should free thread stack and CPU env */
>          _exit(arg1);
> diff --git a/gdbstub.c b/gdbstub.c
> index 15d3a8e1f5..afa553e8fc 100644
> --- a/gdbstub.c
> +++ b/gdbstub.c
> @@ -3068,7 +3068,7 @@ static void gdb_read_byte(uint8_t ch)
>  }
>  
>  /* Tell the remote gdb that the process has exited.  */
> -void gdb_exit(CPUArchState *env, int code)
> +void gdb_exit(int code)
>  {
>    char buf[4];
>  
> diff --git a/linux-user/exit.c b/linux-user/exit.c
> index 1594015444..70b344048c 100644
> --- a/linux-user/exit.c
> +++ b/linux-user/exit.c
> @@ -34,6 +34,6 @@ void preexit_cleanup(CPUArchState *env, int code)
>  #ifdef CONFIG_GCOV
>          __gcov_dump();
>  #endif
> -        gdb_exit(env, code);
> +        gdb_exit(code);
>          qemu_plugin_atexit_cb();
>  }
> diff --git a/target/arm/arm-semi.c b/target/arm/arm-semi.c
> index f7b7bff522..93360e28c7 100644
> --- a/target/arm/arm-semi.c
> +++ b/target/arm/arm-semi.c
> @@ -1101,7 +1101,7 @@ target_ulong do_arm_semihosting(CPUARMState *env)
>               */
>              ret = (args == ADP_Stopped_ApplicationExit) ? 0 : 1;
>          }
> -        gdb_exit(env, ret);
> +        gdb_exit(ret);
>          exit(ret);
>      case TARGET_SYS_SYNCCACHE:
>          /*
> diff --git a/target/m68k/m68k-semi.c b/target/m68k/m68k-semi.c
> index 27600e0cc0..d919245e4f 100644
> --- a/target/m68k/m68k-semi.c
> +++ b/target/m68k/m68k-semi.c
> @@ -195,7 +195,7 @@ void do_m68k_semihosting(CPUM68KState *env, int nr)
>      args = env->dregs[1];
>      switch (nr) {
>      case HOSTED_EXIT:
> -        gdb_exit(env, env->dregs[0]);
> +        gdb_exit(env->dregs[0]);
>          exit(env->dregs[0]);
>      case HOSTED_OPEN:
>          GET_ARG(0);
> diff --git a/target/nios2/nios2-semi.c b/target/nios2/nios2-semi.c
> index d7a80dd303..e508b2fafc 100644
> --- a/target/nios2/nios2-semi.c
> +++ b/target/nios2/nios2-semi.c
> @@ -215,7 +215,7 @@ void do_nios2_semihosting(CPUNios2State *env)
>      args = env->regs[R_ARG1];
>      switch (nr) {
>      case HOSTED_EXIT:
> -        gdb_exit(env, env->regs[R_ARG0]);
> +        gdb_exit(env->regs[R_ARG0]);
>          exit(env->regs[R_ARG0]);
>      case HOSTED_OPEN:
>          GET_ARG(0);
> 

Reviewed-by: Laurent Vivier <laurent@vivier.eu>
