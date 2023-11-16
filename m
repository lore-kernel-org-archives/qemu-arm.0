Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3365825ejc;
        Thu, 16 Nov 2023 01:34:10 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFeRRwYEFg1rqd1zMJqx10OO2lAjGhIUogMHr6H9Y7Vn0bK97irk3tFXtqPhUWg0WJJZ0ui
X-Received: by 2002:a05:622a:587:b0:41c:c096:d26f with SMTP id c7-20020a05622a058700b0041cc096d26fmr1157760qtb.34.1700127243731;
        Thu, 16 Nov 2023 01:34:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700127243; cv=none;
        d=google.com; s=arc-20160816;
        b=axGKbx0sd1c3R+xqa9Bh6v/MpaZUmnfXBIVnZnMHlzzQO0C6FKxIotJpvnjZiYwZ3j
         zw2LLQugyaq/epyIwg8TnQo4tMhsmcHwMK9WNEITaYtoIGRl8KlqXQQAk4eZFAs1tRNw
         teLe6iYMdtOagfVBt4M2r+XN2Nz4fou2HCuNIg7HlxZsearhfRiLHk29k51/NBvyGyPm
         54bLq+KQOV+fCkSHd/gi28s0x+FFSMxyG6Tf+9zh3cFTkqn1BVKNLaodB6GQXyA4DXiV
         CjQdeAgvzn9m1oMqkXXrvX5eP4v2P/xRZJ4oG22lMsXxTQE3eloUmRf8tcm65cwVQdTR
         5ZNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=BKHKZOdUPEdAi4OebjmiImqBlPQ23rLgYgjM01kf4k8=;
        fh=MNy/s+eWWV9V6tfmhb2gUwit/2o7TQkLbQD1zQm6hqY=;
        b=YCLmJm8BmLWMrECPC3Ffm110m80vxW4hVS9gwim5eXr8xzaDKa/lOLOxAwHCMZOtPE
         OWfoqW269WaS6RlU74r8XXyDXpVvyZRkXLN1V+M74cLD/ALJnXauyq4jQg0x6rr7DPZR
         vpxt+dU8t0KkaGAswRKKBemd4RbnB3SXvAbAZxzjqT2ttvKdbEE8i+o+o3FgJUqMG6cc
         mTAxYuJLaYLr1vCK/dYR83PfLa0910I2iarO0jF3lGvHalNewWSUj0BKDekKXS93809y
         7A151ptfX9yS3UuSb/ftxgjt74rXQ/T1tuLbO5uLWI+LOW3DyRGE96UVxHVl2yjCDJHL
         v+lw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NEBsSW9L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7-20020ac87dc7000000b00417b8ceb616si10826587qte.403.2023.11.16.01.34.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Nov 2023 01:34:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NEBsSW9L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3Yko-0007gN-HL; Thu, 16 Nov 2023 04:33:42 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3Ykn-0007eF-BZ
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 04:33:41 -0500
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3Ykk-0001zM-IC
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 04:33:41 -0500
Received: by mail-wm1-x331.google.com with SMTP id
 5b1f17b1804b1-4081ccf69dcso10483615e9.0
 for <qemu-arm@nongnu.org>; Thu, 16 Nov 2023 01:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700127215; x=1700732015; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=BKHKZOdUPEdAi4OebjmiImqBlPQ23rLgYgjM01kf4k8=;
 b=NEBsSW9LvXVibOtJaYGptPw6WBex2KYSLRnFixVzqcy0N8Ebprwctip5YxfOzraFdQ
 JooihvsvMtN+nVjlFhBPyUqJDajW717XPVRWT2w8MYJKjXbkvFClu508xPhfEOBwFYdj
 VfW7GGzpD0VFfY0XGCNFe7Swr2FOuXgxQepvdwTiEPfReDMk2Apk2FFJy0tQy0BSZWGv
 rnjXgEO7RPgVL6Sdh4SUYTewwpAvtZ8hMI01cPmViDKguaJimvJVSe6w04gvgfpsDn8t
 sU+SFCHyvWJGpzwxqT68Xi1n1Y53BScKq1P05eocuUhxxWsAwKWXCUcCOk4i2bBQqGNm
 FZLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700127215; x=1700732015;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BKHKZOdUPEdAi4OebjmiImqBlPQ23rLgYgjM01kf4k8=;
 b=BkRDCdifbwQlLURu5Nz9KB23I1+wAY7i5aONslGLWNq6Si0wGeLWBY47FmWsXSKjrF
 jjBtNt4b8NlIjar4E4BgN3sT/zVWAxsdcG4AzT/XWdPw3teB0ivxsfRJy/bm3Jh/zy5K
 PgjQo0j88iGSq4vPEBEnbaepIpG+Hq3IDv7/V7ewSIKPK4M48UvrqiK6sKxU6H464LZx
 q/CUx/mVehkePzCJXzb1f6zzN4ZA7IbtvTdr/TYl93Ia9AJ0O+rl2LQbffuU+69VISdb
 X4CtNQKM88akjCI9RDMHRp0hNECCO3mmqp/uJwTuGUB+djROop+sxY9FSIICQBgEhQDY
 722w==
X-Gm-Message-State: AOJu0YwQZpSQsQJRKZYrXnbtgxOrO6FELBKp2IDsWiPPYA/wxHhCmBKf
 GC00cx0vCPavv7kxPUMXA6ZDJw==
X-Received: by 2002:a5d:6da4:0:b0:32d:9d03:29e6 with SMTP id
 u4-20020a5d6da4000000b0032d9d0329e6mr905695wrs.27.1700127215562; 
 Thu, 16 Nov 2023 01:33:35 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 j7-20020a5d6187000000b0032dc74c093dsm13044830wru.103.2023.11.16.01.33.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 01:33:35 -0800 (PST)
Message-ID: <25571924-3569-48f4-8b60-17f14e8261ea@linaro.org>
Date: Thu, 16 Nov 2023 10:33:30 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 25/31] machine: Introduce helper is_cpu_type_supported()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 imp@bsdimp.com, kevans@freebsd.org, richard.henderson@linaro.org,
 pbonzini@redhat.com, peter.maydell@linaro.org, imammedo@redhat.com,
 b.galvani@gmail.com, strahinja.p.jankovic@gmail.com, sundeep.lkml@gmail.com,
 kfting@nuvoton.com, wuhaotsh@google.com, nieklinnenbank@gmail.com,
 rad@semihalf.com, quic_llindhol@quicinc.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 laurent@vivier.eu, vijai@behindbytes.com, palmer@dabbelt.com,
 alistair.francis@wdc.com, bin.meng@windriver.com, liwei1518@gmail.com,
 dbarboza@ventanamicro.com, zhiwei_liu@linux.alibaba.com, mrolnik@gmail.com,
 edgar.iglesias@gmail.com, bcain@quicinc.com, gaosong@loongson.cn,
 aurelien@aurel32.net, jiaxun.yang@flygoat.com, aleksandar.rikalo@syrmia.com,
 chenhuacai@kernel.org, shorne@gmail.com, npiggin@gmail.com, clg@kaod.org,
 ysato@users.sourceforge.jp, kbastian@mail.uni-paderborn.de,
 jcmvbkbc@gmail.com, shan.gavin@gmail.com
References: <20231114235628.534334-1-gshan@redhat.com>
 <20231114235628.534334-26-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-26-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::331;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x331.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: I17W7PLIEIva

On 15/11/23 00:56, Gavin Shan wrote:
> The logic, to check if the specified CPU type is supported in
> machine_run_board_init(), is independent enough. Factor it out into
> helper is_cpu_type_supported(). machine_run_board_init() looks a bit
> clean with this. Since we're here, @machine_class is renamed to @mc
> to avoid multiple line spanning of code. The comments are tweaked a
> bit either.
> 
> No functional change intended.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/core/machine.c | 82 +++++++++++++++++++++++++----------------------
>   1 file changed, 44 insertions(+), 38 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index 5b45dbbbd5..49e0bc874d 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1387,13 +1387,51 @@ out:
>       return r;
>   }
>   
> +static void is_cpu_type_supported(MachineState *machine, Error **errp)

'const MachineState *'.

> +{
> +    MachineClass *mc = MACHINE_GET_CLASS(machine);
> +    ObjectClass *oc = object_class_by_name(machine->cpu_type);
> +    CPUClass *cc;
> +    int i;
> +
> +    /*
> +     * Check if the user specified CPU type is supported when the valid
> +     * CPU types have been determined. Note that the user specified CPU
> +     * type is provided through '-cpu' option.
> +     */
> +    if (mc->valid_cpu_types && machine->cpu_type) {
> +        for (i = 0; mc->valid_cpu_types[i]; i++) {
> +            if (object_class_dynamic_cast(oc, mc->valid_cpu_types[i])) {
> +                break;
> +            }
> +        }
> +
> +        /* The user specified CPU type isn't valid */
> +        if (!mc->valid_cpu_types[i]) {
> +            error_setg(errp, "Invalid CPU type: %s", machine->cpu_type);
> +            error_append_hint(errp, "The valid types are: %s",
> +                              mc->valid_cpu_types[0]);

This hint could be clearer if only an unique CPU is allowed.

> +            for (i = 1; mc->valid_cpu_types[i]; i++) {
> +                error_append_hint(errp, ", %s", mc->valid_cpu_types[i]);
> +            }
> +
> +            error_append_hint(errp, "\n");
> +            return;
> +        }
> +    }
> +
> +    /* Check if CPU type is deprecated and warn if so */
> +    cc = CPU_CLASS(oc);
> +    if (cc && cc->deprecation_note) {
> +        warn_report("CPU model %s is deprecated -- %s",
> +                    machine->cpu_type, cc->deprecation_note);
> +    }
> +}

