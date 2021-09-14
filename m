Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1004072lfp;
        Tue, 14 Sep 2021 13:00:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwbciy1quwKSsYpIoXLptkP9etvk/LSWS7405xMz8CUt4TX7UN8l04xewJk97Na7N95FlAF
X-Received: by 2002:ab0:702c:: with SMTP id u12mr6193467ual.94.1631649636249;
        Tue, 14 Sep 2021 13:00:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631649636; cv=none;
        d=google.com; s=arc-20160816;
        b=N5Ko49rlYoGlWZEglIhXQ+PM/VhQ2qH4AJJ/jNyz6mwZxWxDmz+00qDYOU1ScVjzLA
         eN5u1SNhbsrih1WeL0JtFq/00z2S4y16q19dpQbfo6C8hbaJuovO9PfkiOLMqpb9m31K
         fwWSpOOeBE97nt/Tm9iYEhioqBsxBGclmamFqkhWWJiQTEWU4DMOyfNCDyrgp/nDHoKr
         bnDxln6kRQ+7srKhx6RrCh/K2aUB+wy/G9IZ0rwBmuAb/qJB2jSobO57q0twgCFiQGLn
         +pc8S6hhOA9o4Plxms+Lv4lA1bDCmqAM69t0NGd3Xs59X5hXd1IfA28evDJ2iPNjFxof
         nq1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=TpDEVYFVuXtiYuY+XWhjvlTBKVNMVYBrhj7bcq7HQ58=;
        b=mWMUAaNRYVPzJOhSwOk13dezHvHEslUnDlizPKcuqAXmwtS5QXlVnxEpcbhxF89frf
         EYaPbXKQ+g5jZ0MN06GuSHZT5Z+o+Fqlc2l90L7JQLPZGkMfEWaxm/nm+xWXgjT3bAWX
         4BIK0ew9gI4iKqHVadht238H2ly+5UJShGuuOH4gA9vlm0vTes45EmCGwCVJYciGZTOL
         HhMY3orbY/Oy6GVE4UlfP04JSjMU45Drj8qbxfvG5XA1x7r66VgByFyhAy7DMp1UNHb9
         xPJI4JH5wlBAlziV+RjhHm6eTKElG0U4Agj2fHS5qcauQWpbBgHkyAshoM+y+4WpvjbJ
         8oGA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2si4642828uaa.76.2021.09.14.13.00.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 14 Sep 2021 13:00:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:43892 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQEbb-00029o-GT
	for alex.bennee@linaro.org; Tue, 14 Sep 2021 16:00:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47488)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQEap-0001qu-DU; Tue, 14 Sep 2021 15:59:47 -0400
Received: from mout.kundenserver.de ([217.72.192.75]:49109)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <laurent@vivier.eu>)
 id 1mQEan-000401-37; Tue, 14 Sep 2021 15:59:47 -0400
Received: from [192.168.100.1] ([82.142.27.6]) by mrelayeu.kundenserver.de
 (mreue108 [213.165.67.119]) with ESMTPSA (Nemesis) id
 1M5QAt-1mRbcZ3J3N-001UvA; Tue, 14 Sep 2021 21:58:47 +0200
Subject: Re: [PATCH v2 15/53] target/m68k: convert to use format_state instead
 of dump_state
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-16-berrange@redhat.com>
From: Laurent Vivier <laurent@vivier.eu>
Message-ID: <e1133cdd-849c-51ba-f231-355b1862f09d@vivier.eu>
Date: Tue, 14 Sep 2021 21:58:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-16-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: fr
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:oQ8rFflSL7UKxEjcLoo7dNYVHGISlp72iBh0XMtcWNPsNJWm8u1
 vt/ADkNBNsaAMhqnmWMaJ8nFEQrwN0Z5lEAva3Ur7h22zLhKJMpv6klZLfXnjAiIk7+czuk
 phOHRsNvjttg8y8x1fdRGojqJrC0HzlPEWiL2IkWY83FEVW0ZyEG0M7OGTl0JOX2ax0l6Wa
 jyLbg/mpvsn71dNPi1P5w==
X-UI-Out-Filterresults: notjunk:1;V03:K0:re4Eq8JjYLY=:y2LO3H9Cpnpo/+wWxFobdW
 bVsyWW8WgQi8aJQFXpPRwTXfpi8Cp8ORn6G6upGi7vCGLbN9OSWr8zsENz3DXuWNl34TYeAdH
 xV6hDaW6ntUDQYbwgbDzQGdnbKavJ3D/q5a2iP5Gp5QBuqYUV7g/IpiltN2R9WavykqjLXQhI
 Y5fR7lNm7IJ5IdOjcb2YuooWgQgWRTgUVZdIE4bwZJ4lhlBhS5JBhbijwkXZ3a0WQh5dbvCqp
 hSQlShBX/CGdzwTJyhRqqerau2U5RoV3i+YMVxH7yphYrFw0IIjdXkIR+baNwzcWz3CePZkMU
 vKMTb2srKWr/eqwEeoVG5Td3BshZ2CFI3v5pbm5bfrdUF9f3A4hnUIFManJimnWqursurYXid
 GpIKY4IbWtcw5D53BbJVNXflxXh3Uqaufyntg+i1NImhYn6YRmHZvLYFFhMYpiicc+5aDHO3g
 3B9Sr3GMws99eBWA8nYIC57q3or/YJ1CMBYqa3MrT8qRfWHd2MD7vk6OtbYa5gv4TvapE8eu0
 Krn/aieNg/5gLPr2UqTxdazr/kN45HWZsMuFH9lIs+LQlXz8Cgd5eVuOGZop3FgAvBM+jtMjd
 sw6X8hc6RErl8tKdsPCez4XptKNldbVZSIUibOMRO/c8+dVuI0c+TgwaPcjZG4FXA1u1jbvpS
 U2rKFORVVFxy5YqqehKzbu3Gn59S7sbA/9wveUUGzF09+siTLxc8M/Lc7PHrjpsu4Y9ylKsQU
 Mi87TzIYGwxlsHUUbNwtDD05vAhF+1DB+/fP6Q==
Received-SPF: none client-ip=217.72.192.75; envelope-from=laurent@vivier.eu;
 helo=mout.kundenserver.de
X-Spam_score_int: -38
X-Spam_score: -3.9
X-Spam_bar: ---
X-Spam_report: (-3.9 / 5.0 requ) BAYES_00=-1.9, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_NONE=0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Cornelia Huck <cohuck@redhat.com>,
 David Hildenbrand <david@redhat.com>, Bin Meng <bin.meng@windriver.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Yuval Shaia <yuval.shaia.ml@gmail.com>, Peter Xu <peterx@redhat.com>,
 Max Filippov <jcmvbkbc@gmail.com>, Taylor Simpson <tsimpson@quicinc.com>,
 Alistair Francis <alistair.francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Eric Blake <eblake@redhat.com>, Marek Vasut <marex@denx.de>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Markus Armbruster <armbru@redhat.com>, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-ppc@nongnu.org,
 Artyom Tarasenko <atar4qemu@gmail.com>, Laurent Vivier <lvivier@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, Greg Kurz <groug@kaod.org>,
 "Dr. David Alan Gilbert" <dgilbert@redhat.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, Michael Rolnik <mrolnik@gmail.com>,
 Stafford Horne <shorne@gmail.com>, David Gibson <david@gibson.dropbear.id.au>,
 qemu-riscv@nongnu.org, Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Chris Wulff <crwulff@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DVziTrAQlt0c

Le 14/09/2021 à 16:20, Daniel P. Berrangé a écrit :
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  target/m68k/cpu.c       |  2 +-
>  target/m68k/cpu.h       |  2 +-
>  target/m68k/translate.c | 92 ++++++++++++++++++++++-------------------
>  3 files changed, 51 insertions(+), 45 deletions(-)
> 
> diff --git a/target/m68k/cpu.c b/target/m68k/cpu.c
> index 72de6e9726..4ccf572a68 100644
> --- a/target/m68k/cpu.c
> +++ b/target/m68k/cpu.c
> @@ -536,7 +536,7 @@ static void m68k_cpu_class_init(ObjectClass *c, void *data)
>  
>      cc->class_by_name = m68k_cpu_class_by_name;
>      cc->has_work = m68k_cpu_has_work;
> -    cc->dump_state = m68k_cpu_dump_state;
> +    cc->format_state = m68k_cpu_format_state;
>      cc->set_pc = m68k_cpu_set_pc;
>      cc->gdb_read_register = m68k_cpu_gdb_read_register;
>      cc->gdb_write_register = m68k_cpu_gdb_write_register;
> diff --git a/target/m68k/cpu.h b/target/m68k/cpu.h
> index 997d588911..b0641f6d0d 100644
> --- a/target/m68k/cpu.h
> +++ b/target/m68k/cpu.h
> @@ -168,7 +168,7 @@ struct M68kCPU {
>  
>  void m68k_cpu_do_interrupt(CPUState *cpu);
>  bool m68k_cpu_exec_interrupt(CPUState *cpu, int int_req);
> -void m68k_cpu_dump_state(CPUState *cpu, FILE *f, int flags);
> +void m68k_cpu_format_state(CPUState *cpu, GString *buf, int flags);
>  hwaddr m68k_cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
>  int m68k_cpu_gdb_read_register(CPUState *cpu, GByteArray *buf, int reg);
>  int m68k_cpu_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg);
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index c34d9aed61..951bbed6bf 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -6316,75 +6316,81 @@ static double floatx80_to_double(CPUM68KState *env, uint16_t high, uint64_t low)
>      return u.d;
>  }
>  
> -void m68k_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> +void m68k_cpu_format_state(CPUState *cs, GString *buf, int flags)
>  {
>      M68kCPU *cpu = M68K_CPU(cs);
>      CPUM68KState *env = &cpu->env;
>      int i;
>      uint16_t sr;
>      for (i = 0; i < 8; i++) {
> -        qemu_fprintf(f, "D%d = %08x   A%d = %08x   "
> -                     "F%d = %04x %016"PRIx64"  (%12g)\n",
> -                     i, env->dregs[i], i, env->aregs[i],
> -                     i, env->fregs[i].l.upper, env->fregs[i].l.lower,
> -                     floatx80_to_double(env, env->fregs[i].l.upper,
> -                                        env->fregs[i].l.lower));
> -    }
> -    qemu_fprintf(f, "PC = %08x   ", env->pc);
> +        g_string_append_printf(buf, "D%d = %08x   A%d = %08x   "
> +                               "F%d = %04x %016"PRIx64"  (%12g)\n",
> +                               i, env->dregs[i], i, env->aregs[i],
> +                               i, env->fregs[i].l.upper, env->fregs[i].l.lower,
> +                               floatx80_to_double(env, env->fregs[i].l.upper,
> +                                                  env->fregs[i].l.lower));
> +    }
> +    g_string_append_printf(buf, "PC = %08x   ", env->pc);
>      sr = env->sr | cpu_m68k_get_ccr(env);
> -    qemu_fprintf(f, "SR = %04x T:%x I:%x %c%c %c%c%c%c%c\n",
> -                 sr, (sr & SR_T) >> SR_T_SHIFT, (sr & SR_I) >> SR_I_SHIFT,
> -                 (sr & SR_S) ? 'S' : 'U', (sr & SR_M) ? '%' : 'I',
> -                 (sr & CCF_X) ? 'X' : '-', (sr & CCF_N) ? 'N' : '-',
> -                 (sr & CCF_Z) ? 'Z' : '-', (sr & CCF_V) ? 'V' : '-',
> -                 (sr & CCF_C) ? 'C' : '-');
> -    qemu_fprintf(f, "FPSR = %08x %c%c%c%c ", env->fpsr,
> -                 (env->fpsr & FPSR_CC_A) ? 'A' : '-',
> -                 (env->fpsr & FPSR_CC_I) ? 'I' : '-',
> -                 (env->fpsr & FPSR_CC_Z) ? 'Z' : '-',
> -                 (env->fpsr & FPSR_CC_N) ? 'N' : '-');
> -    qemu_fprintf(f, "\n                                "
> -                 "FPCR =     %04x ", env->fpcr);
> +    g_string_append_printf(buf, "SR = %04x T:%x I:%x %c%c %c%c%c%c%c\n",
> +                           sr, (sr & SR_T) >> SR_T_SHIFT,
> +                           (sr & SR_I) >> SR_I_SHIFT,
> +                           (sr & SR_S) ? 'S' : 'U', (sr & SR_M) ? '%' : 'I',
> +                           (sr & CCF_X) ? 'X' : '-', (sr & CCF_N) ? 'N' : '-',
> +                           (sr & CCF_Z) ? 'Z' : '-', (sr & CCF_V) ? 'V' : '-',
> +                           (sr & CCF_C) ? 'C' : '-');
> +    g_string_append_printf(buf, "FPSR = %08x %c%c%c%c ", env->fpsr,
> +                           (env->fpsr & FPSR_CC_A) ? 'A' : '-',
> +                           (env->fpsr & FPSR_CC_I) ? 'I' : '-',
> +                           (env->fpsr & FPSR_CC_Z) ? 'Z' : '-',
> +                           (env->fpsr & FPSR_CC_N) ? 'N' : '-');
> +    g_string_append_printf(buf, "\n                                "
> +                           "FPCR =     %04x ", env->fpcr);
>      switch (env->fpcr & FPCR_PREC_MASK) {
>      case FPCR_PREC_X:
> -        qemu_fprintf(f, "X ");
> +        g_string_append_printf(buf, "X ");
>          break;
>      case FPCR_PREC_S:
> -        qemu_fprintf(f, "S ");
> +        g_string_append_printf(buf, "S ");
>          break;
>      case FPCR_PREC_D:
> -        qemu_fprintf(f, "D ");
> +        g_string_append_printf(buf, "D ");
>          break;
>      }
>      switch (env->fpcr & FPCR_RND_MASK) {
>      case FPCR_RND_N:
> -        qemu_fprintf(f, "RN ");
> +        g_string_append_printf(buf, "RN ");
>          break;
>      case FPCR_RND_Z:
> -        qemu_fprintf(f, "RZ ");
> +        g_string_append_printf(buf, "RZ ");
>          break;
>      case FPCR_RND_M:
> -        qemu_fprintf(f, "RM ");
> +        g_string_append_printf(buf, "RM ");
>          break;
>      case FPCR_RND_P:
> -        qemu_fprintf(f, "RP ");
> +        g_string_append_printf(buf, "RP ");
>          break;
>      }
> -    qemu_fprintf(f, "\n");
> +    g_string_append_printf(buf, "\n");
>  #ifdef CONFIG_SOFTMMU
> -    qemu_fprintf(f, "%sA7(MSP) = %08x %sA7(USP) = %08x %sA7(ISP) = %08x\n",
> -                 env->current_sp == M68K_SSP ? "->" : "  ", env->sp[M68K_SSP],
> -                 env->current_sp == M68K_USP ? "->" : "  ", env->sp[M68K_USP],
> -                 env->current_sp == M68K_ISP ? "->" : "  ", env->sp[M68K_ISP]);
> -    qemu_fprintf(f, "VBR = 0x%08x\n", env->vbr);
> -    qemu_fprintf(f, "SFC = %x DFC %x\n", env->sfc, env->dfc);
> -    qemu_fprintf(f, "SSW %08x TCR %08x URP %08x SRP %08x\n",
> -                 env->mmu.ssw, env->mmu.tcr, env->mmu.urp, env->mmu.srp);
> -    qemu_fprintf(f, "DTTR0/1: %08x/%08x ITTR0/1: %08x/%08x\n",
> -                 env->mmu.ttr[M68K_DTTR0], env->mmu.ttr[M68K_DTTR1],
> -                 env->mmu.ttr[M68K_ITTR0], env->mmu.ttr[M68K_ITTR1]);
> -    qemu_fprintf(f, "MMUSR %08x, fault at %08x\n",
> -                 env->mmu.mmusr, env->mmu.ar);
> +    g_string_append_printf(buf, "%sA7(MSP) = %08x %sA7(USP) = %08x "
> +                           "%sA7(ISP) = %08x\n",
> +                           env->current_sp == M68K_SSP ?
> +                           "->" : "  ", env->sp[M68K_SSP],
> +                           env->current_sp == M68K_USP ?
> +                           "->" : "  ", env->sp[M68K_USP],
> +                           env->current_sp == M68K_ISP ?
> +                           "->" : "  ", env->sp[M68K_ISP]);
> +    g_string_append_printf(buf, "VBR = 0x%08x\n", env->vbr);
> +    g_string_append_printf(buf, "SFC = %x DFC %x\n", env->sfc, env->dfc);
> +    g_string_append_printf(buf, "SSW %08x TCR %08x URP %08x SRP %08x\n",
> +                           env->mmu.ssw, env->mmu.tcr,
> +                           env->mmu.urp, env->mmu.srp);
> +    g_string_append_printf(buf, "DTTR0/1: %08x/%08x ITTR0/1: %08x/%08x\n",
> +                           env->mmu.ttr[M68K_DTTR0], env->mmu.ttr[M68K_DTTR1],
> +                           env->mmu.ttr[M68K_ITTR0], env->mmu.ttr[M68K_ITTR1]);
> +    g_string_append_printf(buf, "MMUSR %08x, fault at %08x\n",
> +                           env->mmu.mmusr, env->mmu.ar);
>  #endif
>  }
>  
> 

Acked-by: Laurent Vivier <laurent@vivier.eu>
