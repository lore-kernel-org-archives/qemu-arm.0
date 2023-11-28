Received: by 2002:a17:906:494d:b0:a0d:e0d9:b5bf with SMTP id f13csp1748364ejt;
        Tue, 28 Nov 2023 01:38:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH0WJeIJUOuYu6AlDe+4nLy0EYEOo5Q9Oqz+ARBqT9hxYfkihrzRkFUnfTdbW+MFGlS4aOS
X-Received: by 2002:a05:622a:11d3:b0:418:1f52:1421 with SMTP id n19-20020a05622a11d300b004181f521421mr19070149qtk.9.1701164330922;
        Tue, 28 Nov 2023 01:38:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1701164330; cv=none;
        d=google.com; s=arc-20160816;
        b=iCym7gXcZtIfP08nf2oEFBJYMFdCQEygSjOKGH3HZP1uc+QC17XMRtvTblq4eQRJdO
         O9sVDj5NdY6nXxWS2UJYUmjZJLM0fbt/CsE/2DGvdpZv9o6Ok273BsvdZGC3Qp3lAWCG
         q74a/Xawvh1GuRh42wkTMGi1W6o3erlXC28sodQHdA3njoPDlkt1galCu1CkfkWpZDqg
         9yDpnef7q5ADvUjOJ0SQ8aP9p0vXFpAIszwWSjfZsHPcYLlFF6XpEJoikQQ3+Wv7ixIa
         0GKQF2bYF7fkOgV4hq0/CWzvej1VTUXXoBCuxirMa2QBTPt9UPPVMoSrCAjG9XtUjk9W
         LtXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=ntZh4VUyoyATGSlDTwaEMS64+Qw/HW3Uvdla6A8b9/Y=;
        fh=JevbGINOdgzHpobPeY6a5NX8AdTsHIkhwelypfplB/Q=;
        b=pdME14S2jA/qYQDYg/UMXxYWuuvH/TNgQQUWYP21UNMrsf6EGx2zq2zW1XX7Tnz2G1
         yL5CZWRKE3liOi9PASHJp/ik7wjoTJ6rkXGhyqXMNT3Zs4B9Q+XPpcPw9OjXM6B1Mcve
         3rnt4LhW6mtN8kQp3pOOxRLgMFQOrjW3R9bw6cquehFsFM0eQ1RRPZ1+QvEbww3D5iyJ
         f90i/gU3OZKCHvldC3W/IJK84nqX4itKmL+EmKaVJrLquRkZ49X55nWpL640MePMUj3F
         VefcsXMgq3R+Z41t4O+LzM6Uk+tgkqWxjL9VvztrK6VeVQU1Iz9hB/7cM/zha2U8qVIm
         x+/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VFUvULtM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t3-20020a05622a148300b00423804bdaadsi11215227qtx.10.2023.11.28.01.38.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Nov 2023 01:38:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VFUvULtM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r7uY5-0007Sx-UF; Tue, 28 Nov 2023 04:38:33 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r7uY4-0007SL-1A
 for qemu-arm@nongnu.org; Tue, 28 Nov 2023 04:38:32 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r7uY2-0002HW-85
 for qemu-arm@nongnu.org; Tue, 28 Nov 2023 04:38:31 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-54af61f2a40so5127419a12.3
 for <qemu-arm@nongnu.org>; Tue, 28 Nov 2023 01:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701164308; x=1701769108; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ntZh4VUyoyATGSlDTwaEMS64+Qw/HW3Uvdla6A8b9/Y=;
 b=VFUvULtMe9A/YoEIDkbseppvG/wRtLhDqELVEQuLIxmlcmPTMxMkyD0SxwwcUW84aS
 XYdfs+tgwawNkW6ocoLSuAewc6ytt8v5tDM39eeeuJlcS8P5IzKqdnmAmKFM/aN5xWQS
 7tuV0Yqrw79drsRoiuqDJb3VpLAOGqVGMZshGx2MvMOVpRfPd+tauv3pwIJByH2eQ9tv
 9IHPStIHowcNO42fY7lG0ZPc2kQ7VKfFUh8jKWGAoo2GfbMlWAbsKbEvdu8MwhdqQahA
 jOTbZDOfVEvoVtTqlg0gboEzRaysEb4YGjpepmLfpwwHXhmzPLHwQIDfCAJvHNl3R/41
 IRcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701164308; x=1701769108;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ntZh4VUyoyATGSlDTwaEMS64+Qw/HW3Uvdla6A8b9/Y=;
 b=CT4l9+GVHKR1LRM2+xeMmrezU7/o59m/Ev+fGj7wkNsk2A7UWRZAWzfo1Ff1BtIzG5
 2lMeqLY5eTIJGlQyO/yEXB1eAFGS6kvOZ5sJ/bWYgUmacSt7yg+IagW+xvrvccUdbTrT
 sjpAwKZiCcI/ziSbYDfs+JsusXH0l1oe9X+VMRUQXsiIy++cENX7mK7NGy1ERBYyJXSj
 jjFoWlgLPsDOuIR0seMlDz1wrp2xvavn+wVjA3JgtVsZgwFIftBupkC/3Qxutt3bgO9f
 GHvfipfCktIYlW1HiKvNsIh1AmdI4czRPLp33QgetzovCBNZXF9AAxGT3DPB8iFCa059
 8ptA==
X-Gm-Message-State: AOJu0Yy4saWn2Lxiecu0l2Se+ieOw476wtzZSfpTU3G6zZpUCkhvxwKk
 C09rr7pLpZIpUZrlJI9yXCbMoA==
X-Received: by 2002:a17:906:348c:b0:9e7:133a:5787 with SMTP id
 g12-20020a170906348c00b009e7133a5787mr9700088ejb.38.1701164308594; 
 Tue, 28 Nov 2023 01:38:28 -0800 (PST)
Received: from [192.168.69.100] (crb44-h02-176-184-13-61.dsl.sta.abo.bbox.fr.
 [176.184.13.61]) by smtp.gmail.com with ESMTPSA id
 gg6-20020a170906e28600b00a090b36d618sm5418130ejb.60.2023.11.28.01.38.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 28 Nov 2023 01:38:28 -0800 (PST)
Message-ID: <c3e8f22b-c03e-4803-a960-699489afb92b@linaro.org>
Date: Tue, 28 Nov 2023 10:38:24 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/8] machine: Introduce helper is_cpu_type_supported()
Content-Language: en-US
To: Gavin Shan <gshan@redhat.com>, qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org, qemu-riscv@nongnu.org, peter.maydell@linaro.org,
 imammedo@redhat.com, richard.henderson@linaro.org,
 quic_llindhol@quicinc.com, b.galvani@gmail.com,
 strahinja.p.jankovic@gmail.com, kfting@nuvoton.com, wuhaotsh@google.com,
 nieklinnenbank@gmail.com, rad@semihalf.com, marcin.juszkiewicz@linaro.org,
 eduardo@habkost.net, marcel.apfelbaum@gmail.com, wangyanan55@huawei.com,
 vijai@behindbytes.com, palmer@dabbelt.com, alistair.francis@wdc.com,
 bin.meng@windriver.com, liwei1518@gmail.com, dbarboza@ventanamicro.com,
 zhiwei_liu@linux.alibaba.com, shan.gavin@gmail.com
References: <20231126231210.112820-1-gshan@redhat.com>
 <20231126231210.112820-3-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231126231210.112820-3-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: /fgZlJrat6d8

Hi Gavin,

On 27/11/23 00:12, Gavin Shan wrote:
> The logic, to check if the specified CPU type is supported in
> machine_run_board_init(), is independent enough. Factor it out into
> helper is_cpu_type_supported(). machine_run_board_init() looks a bit
> clean with this. Since we're here, @machine_class is renamed to @mc
> to avoid multiple line spanning of code. The error messages and comments
> are tweaked a bit either.
> 
> No functional change intended.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   hw/core/machine.c | 90 +++++++++++++++++++++++++++--------------------
>   1 file changed, 51 insertions(+), 39 deletions(-)
> 
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index b3ef325936..05e1922b89 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -1387,13 +1387,57 @@ out:
>       return r;
>   }
>   
> +static void is_cpu_type_supported(const MachineState *machine, Error **errp)

Functions taking an Error** last argument should return a boolean value.

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
> +            if (!mc->valid_cpu_types[1]) {
> +                error_append_hint(errp, "The only valid type is: %s",
> +                                  mc->valid_cpu_types[0]);
> +            } else {
> +                error_append_hint(errp, "The valid types are: %s",
> +                                  mc->valid_cpu_types[0]);
> +            }
> +
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

Why did you move the deprecation warning within the is_supported check?

> +    }
> +}
>   
>   void machine_run_board_init(MachineState *machine, const char *mem_path, Error **errp)
>   {
>       ERRP_GUARD();
>       MachineClass *machine_class = MACHINE_GET_CLASS(machine);
> -    ObjectClass *oc = object_class_by_name(machine->cpu_type);
> -    CPUClass *cc;
>       Error *local_err = NULL;
>   
>       /* This checkpoint is required by replay to separate prior clock
> @@ -1449,43 +1493,11 @@ void machine_run_board_init(MachineState *machine, const char *mem_path, Error *
>           machine->ram = machine_consume_memdev(machine, machine->memdev);
>       }
>   
> -    /* If the machine supports the valid_cpu_types check and the user
> -     * specified a CPU with -cpu check here that the user CPU is supported.
> -     */
> -    if (machine_class->valid_cpu_types && machine->cpu_type) {
> -        int i;
> -
> -        for (i = 0; machine_class->valid_cpu_types[i]; i++) {
> -            if (object_class_dynamic_cast(oc,
> -                                          machine_class->valid_cpu_types[i])) {
> -                /* The user specified CPU is in the valid field, we are
> -                 * good to go.
> -                 */
> -                break;
> -            }
> -        }
> -
> -        if (!machine_class->valid_cpu_types[i]) {
> -            /* The user specified CPU is not valid */
> -            error_setg(&local_err, "Invalid CPU type: %s", machine->cpu_type);
> -            error_append_hint(&local_err, "The valid types are: %s",
> -                              machine_class->valid_cpu_types[0]);
> -            for (i = 1; machine_class->valid_cpu_types[i]; i++) {
> -                error_append_hint(&local_err, ", %s",
> -                                  machine_class->valid_cpu_types[i]);
> -            }
> -            error_append_hint(&local_err, "\n");
> -
> -            error_propagate(errp, local_err);
> -            return;
> -        }
> -    }
> -
> -    /* Check if CPU type is deprecated and warn if so */
> -    cc = CPU_CLASS(oc);
> -    if (cc && cc->deprecation_note) {
> -        warn_report("CPU model %s is deprecated -- %s", machine->cpu_type,
> -                    cc->deprecation_note);
> +    /* Check if the CPU type is supported */
> +    is_cpu_type_supported(machine, &local_err);
> +    if (local_err) {
> +        error_propagate(errp, local_err);

This becomes:

        if (!is_cpu_type_supported(machine, errp)) {

> +        return;
>       }
>   
>       if (machine->cgs) {

