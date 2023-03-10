Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp2162651ejc;
        Fri, 10 Mar 2023 09:39:37 -0800 (PST)
X-Received: by 2002:a62:6541:0:b0:5a8:d97d:c346 with SMTP id z62-20020a626541000000b005a8d97dc346mr21191975pfb.12.1678469976906;
        Fri, 10 Mar 2023 09:39:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1678469976; cv=none;
        d=google.com; s=arc-20160816;
        b=E1V5kBArRYchEFpr7JLVna6tUO65tMRww1IOtJUVoG+jVnpKwj8uyYwP9NIaAxFo11
         jn9uw3W3zhVufL4VrKg1UR9d5UoNpaV6C3oD1zDu5+OysxPQdd1NPtN2TNQwJ/3mdnTB
         /9Z0QBVzf79dEunGL4FLxYloybMhRG1TEXX+6tlMGFyl+km+acginZZ0bLbVwR1zeogU
         PHLKX8NVx2IV7zD+ncVXyMnPZhmxtrcuhrBOWo3IdIKUsGd3A4jj9OThNSTyo9KW0Rcq
         jrqs4X0ijrkAc8EzfHqf7ObULG8JRtk/SenP2BBYgFSlxo0JcjC2NoZI7mWJC4EmAe7o
         rqNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=2q+OleUgkTS8FkdfeEVa+H+oWb4zIZt8kqU0s5+Pi0E=;
        b=xhTzbs9S+c923BZ8BBzb/0PFCpYnp5/6mF9FHZhvZJcD2OsM7v9K/vyyezPHvuugYb
         gRq9e58g+5C6j5u4SD7WkbzZIpSvNt11XPJEwpVawS0irHI8yppXiw9+tyYtuAc4mxZ0
         AhSK6rjwNwZPx0yodS8uHAVDu33mMA3GFKbKmaMrikdj7skJ7i+WrQdxyD8Hya8W/NOM
         fgXnO+Uz+Yem019rpSJEWUT66pQdPJ1OJlC/8XTluE9q66bCIAknChY0AKjDrIhh+ODl
         i5eMJYOoaPL5wbLs19x2oAgPrjEcMZdvRW8zBEJjrv7UZZxS2Xs97ageqAJk0JPewKDL
         TeAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fl2FDg4e;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <richard.henderson@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id f128-20020a625186000000b005fd25462067sor111765pfb.62.2023.03.10.09.39.36
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 10 Mar 2023 09:39:36 -0800 (PST)
Received-SPF: pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fl2FDg4e;
       spf=pass (google.com: domain of richard.henderson@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=richard.henderson@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678469976;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2q+OleUgkTS8FkdfeEVa+H+oWb4zIZt8kqU0s5+Pi0E=;
        b=fl2FDg4eEmq4si2YA+uPMslW3OdQGHBmhZHXqodHKXHgQdXCqB9ctxMZCRbaCi8FGE
         RgMRpAN+JEyWA4bidSJU8UWZmNCgvPNSFhR3YFWthZ9+fBsce4rwOmYe2Pf0rqtUv+nf
         2qmjzk+rI3PURy44mn179XkjuwvTPq+IXEwvLVBW4W6UgIqirJn3sypBtx8Fq61YMRTJ
         /1bMvHqJVZ2RgjVifqZGxI/9fi+6fzPdkbAgIwqJP/s2O7dlIrWohFsuLcHiO5IhK9dN
         09lU0B/YiNRgt8PQb4jKXpoVhItg6qWvEmfmm9Vn5JKLsk94JhZN/2598djSwwqqeum3
         icAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678469976;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2q+OleUgkTS8FkdfeEVa+H+oWb4zIZt8kqU0s5+Pi0E=;
        b=dIIcWEi2nu5HWXlq0wXALh4isAmLGgD6xtbXhpPwpB8e1n8h2x0Gk7vHaD4adF047J
         f8buHHjQXySx+IM99ELv9IfZHUsntWU0b0zq+s1TPrq1SV7lsY/Mj3VR05x+S23C0Lv2
         MPt8RFhOTJ0Pe9JMisZhj0UFsewqPeMUfHf4E/+2V9rFTsh/4ahAE+khpzLfciJEpKU4
         Urrp+/Yetc6Y2j67wVSOe4rbFONNb7hfbhKnP9aACK3uDQSfYb4w65jgrP0xu7a5zYBq
         puXGgAHJpoBreb8SongUsCvXQ3jrnz/4aF2xMq+znDxB3OELdIcHT/H/Vu9G0WNpx1p+
         qd4g==
X-Gm-Message-State: AO0yUKUUATED4CgAWJSSRQ++lJu4RPw1ezf+jcdJeY8u8+DAv3wqTCfZ
	Tf40LXzgTDucWxpKbywwAJs/udGVK+f/g9YBOQo1Bg==
X-Google-Smtp-Source: AK7set9hbfvUlT7hfDtLop55JRbzuROxhhwka5yN1L+HNmglBhLjzEY/ogNj+BJHvaMqQ/ToLTRlmA==
X-Received: by 2002:aa7:9901:0:b0:5a8:482f:c32e with SMTP id z1-20020aa79901000000b005a8482fc32emr25747811pff.27.1678469976277;
        Fri, 10 Mar 2023 09:39:36 -0800 (PST)
Return-Path: <richard.henderson@linaro.org>
Received: from ?IPV6:2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62? ([2602:ae:154a:9f01:cc1c:ced1:1ec5:bd62])
        by smtp.gmail.com with ESMTPSA id a6-20020aa78646000000b005a8ae0c52cfsm116989pfo.16.2023.03.10.09.39.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Mar 2023 09:39:35 -0800 (PST)
Message-ID: <97cbb69d-eae9-e7e9-cabd-afdba875aed8@linaro.org>
Date: Fri, 10 Mar 2023 09:39:33 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 07/11] tcg: Clear plugin_mem_cbs on TB exit
Content-Language: en-US
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: David Hildenbrand <david@redhat.com>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>, qemu-arm@nongnu.org,
 Peter Xu <peterx@redhat.com>, =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?=
 <philmd@linaro.org>, Peter Maydell <peter.maydell@linaro.org>,
 Cleber Rosa <crosa@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Beraldo Leal <bleal@redhat.com>
References: <20230310103123.2118519-1-alex.bennee@linaro.org>
 <20230310103123.2118519-8-alex.bennee@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20230310103123.2118519-8-alex.bennee@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: 4CFAMwsAoZp9

On 3/10/23 02:31, Alex Bennée wrote:
> From: Richard Henderson <richard.henderson@linaro.org>
> 
> Do this in cpu_tb_exec (normal exit) and cpu_loop_exit (exception),
> adjacent to where we reset can_do_io.
> 
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1381
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Message-Id: <20230301024737.1210851-2-richard.henderson@linaro.org>
> [AJB: use plugin_gen_disable_mem_helpers()]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>

This is missing Emilio's comment to remove the two existing calls to 
qemu_plugin_disable_mem_helpers which become duplicate with this change.


r~

> ---
>   accel/tcg/cpu-exec-common.c | 3 +++
>   accel/tcg/cpu-exec.c        | 4 ++--
>   2 files changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/accel/tcg/cpu-exec-common.c b/accel/tcg/cpu-exec-common.c
> index c7bc8c6efa..e5847e9731 100644
> --- a/accel/tcg/cpu-exec-common.c
> +++ b/accel/tcg/cpu-exec-common.c
> @@ -21,6 +21,7 @@
>   #include "sysemu/cpus.h"
>   #include "sysemu/tcg.h"
>   #include "exec/exec-all.h"
> +#include "exec/plugin-gen.h"
>   
>   bool tcg_allowed;
>   
> @@ -65,6 +66,8 @@ void cpu_loop_exit(CPUState *cpu)
>   {
>       /* Undo the setting in cpu_tb_exec.  */
>       cpu->can_do_io = 1;
> +    /* Undo any setting in generated code. */
> +    plugin_gen_disable_mem_helpers();
>       siglongjmp(cpu->jmp_env, 1);
>   }
>   
> diff --git a/accel/tcg/cpu-exec.c b/accel/tcg/cpu-exec.c
> index 56aaf58b9d..e8a48dbd93 100644
> --- a/accel/tcg/cpu-exec.c
> +++ b/accel/tcg/cpu-exec.c
> @@ -39,6 +39,7 @@
>   #include "exec/replay-core.h"
>   #include "sysemu/tcg.h"
>   #include "exec/helper-proto.h"
> +#include "exec/plugin-gen.h"
>   #include "tb-jmp-cache.h"
>   #include "tb-hash.h"
>   #include "tb-context.h"
> @@ -459,6 +460,7 @@ cpu_tb_exec(CPUState *cpu, TranslationBlock *itb, int *tb_exit)
>       qemu_thread_jit_execute();
>       ret = tcg_qemu_tb_exec(env, tb_ptr);
>       cpu->can_do_io = 1;
> +    plugin_gen_disable_mem_helpers();
>       /*
>        * TODO: Delay swapping back to the read-write region of the TB
>        * until we actually need to modify the TB.  The read-only copy,
> @@ -526,7 +528,6 @@ static void cpu_exec_exit(CPUState *cpu)
>       if (cc->tcg_ops->cpu_exec_exit) {
>           cc->tcg_ops->cpu_exec_exit(cpu);
>       }
> -    QEMU_PLUGIN_ASSERT(cpu->plugin_mem_cbs == NULL);
>   }
>   
>   void cpu_exec_step_atomic(CPUState *cpu)
> @@ -1004,7 +1005,6 @@ cpu_exec_loop(CPUState *cpu, SyncClocks *sc)
>   
>               cpu_loop_exec_tb(cpu, tb, pc, &last_tb, &tb_exit);
>   
> -            QEMU_PLUGIN_ASSERT(cpu->plugin_mem_cbs == NULL);
>               /* Try to align the host and virtual clocks
>                  if the guest is in advance */
>               align_clocks(sc, cpu);
