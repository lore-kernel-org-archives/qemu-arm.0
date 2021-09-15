Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1421834lfp;
        Wed, 15 Sep 2021 00:33:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyPzYYN7IeY7Gwhv688LJlDYHqvGLDYtfQJ8E/hWnWEFOAq0KwECXwU7ndS4XqgDKpFNpyb
X-Received: by 2002:a92:bf0b:: with SMTP id z11mr14617800ilh.117.1631691209291;
        Wed, 15 Sep 2021 00:33:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631691209; cv=none;
        d=google.com; s=arc-20160816;
        b=qRiDXcs96fsjr2i7gi2TrGH6mJMYO0fb1T3G+727IkYcmSvpFv8y7rottTc7TjjNFG
         4HSOekT2SDT2TQytz9df6d6TlnOgJ815pDQF5bSp++YDy9oCCRSenb59SXiThsGO7Bys
         s5qPxVBiz3rCPuaKZYCBXv9dZl6uG5bbbi3UCmKMB/wWAyS+JLd/8kqOLT2dvh/wh1/g
         gll/eXZoC6peInploA0Ow3lwmPFQn/zHQLnz7kVFsJI0iFaWkZ16LosJTKdCvyKln32X
         /HS+5SA0Azc+DSSasTmItmkOaxTqHOzpjW1noHrV4RcTv+HY1NtouYAAVXEHhro2rXxW
         7dvw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=F4nkTvjH2+C2DybC5dYtkAVd8MFCngdAUOYYZ14AamA=;
        b=DJCHClpjUXAVJ/iotKTH+lZ8SEbJ0yAzHWf4tlHgdO3eO5o00T/j3WWN0uNxI5nskj
         pNhM0DH8b3xTx5kgUm4Y/ElWaSl/lc6VcUtU504Oqyc/5LvldD2HXZj59CNR3x22fbRN
         F3RAPD8nB8F07Of8JoJ4oZMHOrKUw/sMVTO1g+lv8hU+TfCiSMJtL8iueNy4pDkR4RN6
         YkqzcE9w61lY0YzhdGJwW1SXVANMtepigMBHD3ted6Y8eKmXRiBQhjDy6QUM4JB+n2sL
         GpxvSsoe4RcwRbuR9lr9hehcXso6AjXffFObWe4aey8V7FBGdNMIglEP48wTzlNib0mM
         3C9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=ToSF4DHv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g12si599570ile.52.2021.09.15.00.33.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 Sep 2021 00:33:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20210112 header.b=ToSF4DHv;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:40280 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQPQ8-0000GS-Lv
	for alex.bennee@linaro.org; Wed, 15 Sep 2021 03:33:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56648)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPPS-0000Fi-Dz; Wed, 15 Sep 2021 03:32:46 -0400
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433]:42550)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philippe.mathieu.daude@gmail.com>)
 id 1mQPPQ-0002FP-55; Wed, 15 Sep 2021 03:32:46 -0400
Received: by mail-wr1-x433.google.com with SMTP id q11so2254026wrr.9;
 Wed, 15 Sep 2021 00:32:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=sender:subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=F4nkTvjH2+C2DybC5dYtkAVd8MFCngdAUOYYZ14AamA=;
 b=ToSF4DHvjQLXG1fI8dOGpmRYjgybQu79oWT+ACMaam7MxGfUvyJk0kXtOn2vs6pNEJ
 lo0q5uInV5Ex1fgoZgtiQ+G/hqhwsrdtn/2bbyOFqZuJZZ67tmrt7aEYIBocXkSQTHeb
 BRBsriTIRfvskPNdcSo/Uq3VTAWD175RnJ95u/QGyIfXcBF03eE5XgwtAjzkrP73Q+Sj
 zGl1RgzOGnJKhXOsSzivtDM+4T1oxurALjmoFs9KA2xng80yB4Jg8icXL+5b7aDxUKgD
 D03BSkCIvZ4NrSh113rto5BKG3sCdOUT1TVcTaQQudoqbRmNQmwEx2nuLA5gckZMVDBB
 8riQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:sender:subject:to:cc:references:from:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=F4nkTvjH2+C2DybC5dYtkAVd8MFCngdAUOYYZ14AamA=;
 b=mIFApLmvwTpy79znoZ7u/kw8bucHaIpwnezqty1SMYbcfNshOosuYm2qeXLpKu0rFT
 3+28bT69DHW9RzVKArkQqMETefIvVu+sZPgFvZ+Ebi9lYSqQSSrodMgioqfZ+Mr51Wn4
 q84syC3On7/jhbcSN0V6Qxa4idDJW3NZR/V8v4tPR0gAJIytapABwyARpYMaHUAKt1qZ
 wnvMz2NNHodnPIUEarB0rsjjG8416ldQNnggJErIaxIyK/k8hJ2PaUrt89NGlJi3vtym
 B8lfZmuyM5xngT0e/PsWy6iNEQblhI6Bx9dg373esrq+yQNfekdG0JYfOnRdSi1q+gpr
 ZL5A==
X-Gm-Message-State: AOAM533UQuUm0Lcl12MnG6iz5RTi/4NX0cXpo+qmnxrTECD/VTYjTAJv
 cvr3EgQDHBgPbIlgpFBr160=
X-Received: by 2002:a5d:4b42:: with SMTP id w2mr3138017wrs.273.1631691161316; 
 Wed, 15 Sep 2021 00:32:41 -0700 (PDT)
Received: from [192.168.1.36] (14.red-83-35-25.dynamicip.rima-tde.net.
 [83.35.25.14])
 by smtp.gmail.com with ESMTPSA id b188sm2560520wmd.39.2021.09.15.00.32.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Sep 2021 00:32:40 -0700 (PDT)
Subject: Re: [PATCH v2 27/53] target/xtensa: convert to use format_state
 instead of dump_state
To: =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 qemu-devel@nongnu.org
References: <20210914142042.1655100-1-berrange@redhat.com>
 <20210914142042.1655100-28-berrange@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Message-ID: <1cb38e8f-cc05-461a-c722-efb18519f6fe@amsat.org>
Date: Wed, 15 Sep 2021 09:32:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210914142042.1655100-28-berrange@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::433;
 envelope-from=philippe.mathieu.daude@gmail.com; helo=mail-wr1-x433.google.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FORGED_FROMDOMAIN=0.249,
 FREEMAIL_FROM=0.001, HEADER_FROM_DIFFERENT_DOMAINS=0.25, NICE_REPLY_A=-1.969,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
 Chris Wulff <crwulff@gmail.com>, Laurent Vivier <laurent@vivier.eu>,
 Palmer Dabbelt <palmer@dabbelt.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Aurelien Jarno <aurelien@aurel32.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: aL3Wmdock+G7

On 9/14/21 4:20 PM, Daniel P. Berrangé wrote:
> Signed-off-by: Daniel P. Berrangé <berrange@redhat.com>
> ---
>  target/xtensa/cpu.c       |  2 +-
>  target/xtensa/cpu.h       |  2 +-
>  target/xtensa/translate.c | 45 ++++++++++++++++++++-------------------
>  3 files changed, 25 insertions(+), 24 deletions(-)

> -void xtensa_cpu_dump_state(CPUState *cs, FILE *f, int flags)
> +void xtensa_cpu_format_state(CPUState *cs, GString *buf, int flags)
>  {
>      XtensaCPU *cpu = XTENSA_CPU(cs);
>      CPUXtensaState *env = &cpu->env;
>      xtensa_isa isa = env->config->isa;
>      int i, j;
>  
> -    qemu_fprintf(f, "PC=%08x\n\n", env->pc);
> +    g_string_append_printf(buf, "PC=%08x\n\n", env->pc);
>  
>      for (i = j = 0; i < xtensa_isa_num_sysregs(isa); ++i) {
>          const uint32_t *reg =
> @@ -1340,55 +1340,56 @@ void xtensa_cpu_dump_state(CPUState *cs, FILE *f, int flags)
>          int regno = xtensa_sysreg_number(isa, i);
>  
>          if (regno >= 0) {
> -            qemu_fprintf(f, "%12s=%08x%c",
> -                         xtensa_sysreg_name(isa, i),
> -                         reg[regno],
> -                         (j++ % 4) == 3 ? '\n' : ' ');
> +            g_string_append_printf(buf, "%12s=%08x%c",
> +                                   xtensa_sysreg_name(isa, i),
> +                                   reg[regno],
> +                                   (j++ % 4) == 3 ? '\n' : ' ');
>          }
>      }
>  
> -    qemu_fprintf(f, (j % 4) == 0 ? "\n" : "\n\n");
> +    g_string_append_printf(buf, (j % 4) == 0 ? "\n" : "\n\n");
>  
>      for (i = 0; i < 16; ++i) {
> -        qemu_fprintf(f, " A%02d=%08x%c",
> -                     i, env->regs[i], (i % 4) == 3 ? '\n' : ' ');
> +        g_string_append_printf(buf, " A%02d=%08x%c",
> +                               i, env->regs[i], (i % 4) == 3 ? '\n' : ' ');
>      }
>  
>      xtensa_sync_phys_from_window(env);
> -    qemu_fprintf(f, "\n");
> +    g_string_append_printf(buf, "\n");

g_string_append_c(); pre-existing but better to move it before
xtensa_sync_phys_from_window().

>  
>      for (i = 0; i < env->config->nareg; ++i) {
> -        qemu_fprintf(f, "AR%02d=%08x ", i, env->phys_regs[i]);
> +        g_string_append_printf(buf, "AR%02d=%08x ", i, env->phys_regs[i]);
>          if (i % 4 == 3) {
>              bool ws = (env->sregs[WINDOW_START] & (1 << (i / 4))) != 0;
>              bool cw = env->sregs[WINDOW_BASE] == i / 4;
>  
> -            qemu_fprintf(f, "%c%c\n", ws ? '<' : ' ', cw ? '=' : ' ');
> +            g_string_append_printf(buf, "%c%c\n",
> +                                   ws ? '<' : ' ', cw ? '=' : ' ');
>          }
>      }
>  
>      if ((flags & CPU_DUMP_FPU) &&
>          xtensa_option_enabled(env->config, XTENSA_OPTION_FP_COPROCESSOR)) {
> -        qemu_fprintf(f, "\n");
> +        g_string_append_printf(buf, "\n");

g_string_append_c(); simpler to move it before this if() statement.

>  
>          for (i = 0; i < 16; ++i) {
> -            qemu_fprintf(f, "F%02d=%08x (%-+15.8e)%c", i,
> -                         float32_val(env->fregs[i].f32[FP_F32_LOW]),
> -                         *(float *)(env->fregs[i].f32 + FP_F32_LOW),
> -                         (i % 2) == 1 ? '\n' : ' ');
> +            g_string_append_printf(buf, "F%02d=%08x (%-+15.8e)%c", i,
> +                                   float32_val(env->fregs[i].f32[FP_F32_LOW]),
> +                                   *(float *)(env->fregs[i].f32 + FP_F32_LOW),
> +                                   (i % 2) == 1 ? '\n' : ' ');
>          }
>      }
>  
>      if ((flags & CPU_DUMP_FPU) &&
>          xtensa_option_enabled(env->config, XTENSA_OPTION_DFP_COPROCESSOR) &&
>          !xtensa_option_enabled(env->config, XTENSA_OPTION_DFPU_SINGLE_ONLY)) {
> -        qemu_fprintf(f, "\n");
> +        g_string_append_printf(buf, "\n");

Ditto (move out).

>          for (i = 0; i < 16; ++i) {
> -            qemu_fprintf(f, "F%02d=%016"PRIx64" (%-+24.16le)%c", i,
> -                         float64_val(env->fregs[i].f64),
> -                         *(double *)(&env->fregs[i].f64),
> -                         (i % 2) == 1 ? '\n' : ' ');
> +            g_string_append_printf(buf, "F%02d=%016"PRIx64" (%-+24.16le)%c", i,
> +                                   float64_val(env->fregs[i].f64),
> +                                   *(double *)(&env->fregs[i].f64),
> +                                   (i % 2) == 1 ? '\n' : ' ');
>          }
>      }
>  }
> 
