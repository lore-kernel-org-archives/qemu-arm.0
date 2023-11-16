Received: by 2002:a17:906:5a52:b0:9d0:bf65:29fa with SMTP id my18csp3338989ejc;
        Thu, 16 Nov 2023 00:36:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH023DKVPd7Dkh1jFdOJNZnT56XXM0bwv3gcgW3oraBM+kp1ZaN3abGebES3SRb/5kvBVX3
X-Received: by 2002:a0c:f807:0:b0:66f:b847:71b7 with SMTP id r7-20020a0cf807000000b0066fb84771b7mr8527393qvn.25.1700123788426;
        Thu, 16 Nov 2023 00:36:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1700123788; cv=none;
        d=google.com; s=arc-20160816;
        b=ozNy8jophu0bqQiGukCXYXYsAq7AF/++dlZ5UtzoF75G5CT5Nv06F29R8ZYh8NMn/L
         PNShY4WD5rUQQ5Sm6U1Kq362CqQETNXKnSznoPh/HZvRf8WL2bn2/iujo9lPumptCKQI
         BtHqjVSmIGAFbCCoRpPUK+rgNe0L+bAOFKg1F/PJoywH+Ns3UdzVnvRqayvH9m/Oypwr
         I0t3vXGlTHnUJ3ttqyvU40a58lKiOkACRI29IGSoCCaJXOI1pHMj74/UTguuXzASpHkW
         OL/fWesm+qepJ0fxF48Ib8M2cqhEdbP19b9S8oAOWbWmR6POq/SmudOWyTQ7Y3FxiHWU
         uepQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=/k/+TnYQqIxdes+6VDeXbii9qAIxGzuuOU3WNy3erFc=;
        fh=MNy/s+eWWV9V6tfmhb2gUwit/2o7TQkLbQD1zQm6hqY=;
        b=ZZAg8Cv4V5sGZbUPG/fmKXK9rg9rnXL1OXCaJ3Nsh+L7OXua6khXWBBg5sM25C4+v4
         8jrDLavDXK9zZGQOL2Xs/PeHDDQoI40dGxG2g6Rcyz9TJlIn55OEAUciHIdeaGhIcfv+
         FO34aD53wZRp7em9NJpHrEbFDfP40rE9vGUqi8a8Cek142+HCRDAHjN+i3SBpKKZnYQG
         5glXv/FYMSR2DN4ZxhvtBE7WAjCwPjqzCfDuETC16GgdNasF4I/1tBR6LcHjg8ZFUe0t
         z8ZvnIf6XEXhwQCgEkVJPZDVdWGR8nz5zjomVP3SBGAZeNWHV+8sm65/6DXZkNz0WxTi
         Z9vQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hoQdYbrO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id pm18-20020ad446d2000000b0065af98fe343si10787421qvb.244.2023.11.16.00.36.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Nov 2023 00:36:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hoQdYbrO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1r3Xr6-0006eD-Qj; Thu, 16 Nov 2023 03:36:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3Xr5-0006dw-EJ
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 03:36:07 -0500
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1r3Xr3-0006Lg-HP
 for qemu-arm@nongnu.org; Thu, 16 Nov 2023 03:36:07 -0500
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-407c3adef8eso4511405e9.2
 for <qemu-arm@nongnu.org>; Thu, 16 Nov 2023 00:36:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700123762; x=1700728562; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=/k/+TnYQqIxdes+6VDeXbii9qAIxGzuuOU3WNy3erFc=;
 b=hoQdYbrOFcpNQ0PjaUCPjMz/Ko81TS9j0DYNHL6fCqMjClr3o7r+89tLVfnMEpRPeW
 s7hbEDUViVhj7XDggwhDi/p0LBP+4dDgkZ4sVqfWmhLJ2guKLqWUG2Z9D2bHci/XQLRR
 /zjsuVlwsLocHz31/pThaLJcD2GvFE5KH6gTkEUsD9/9fNs4r9swdYRs60Kix2Bba+3k
 XBvHlrR//NidkNkwwe6hwY2Bj40xsSU/zvP5IXXsTNo2gzMRk2hWvQqBxlauk8Lo0ld6
 Xhn1I9qFbDsxanHAoLfi+Nt3XlxufhuMtnIagL+UbOQTN2No8uqmupGb5uuC7fKEzfUG
 jJgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700123762; x=1700728562;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/k/+TnYQqIxdes+6VDeXbii9qAIxGzuuOU3WNy3erFc=;
 b=wAOP8tuQltvFITLM7gWwK2ZwDbe5Jvuy96PdiN76nQPbQZx1MiES+DCIVPhhTKjhCU
 fYaaSxdk7lq+jUQ4U7GkEf5o+pjwXarRI6pKaecYaeCxFKfYMNp5avR7ttxb2QACwkr+
 vP9uWVON55kV2Dj6rMoO979RN4nvNHaHNen6YINAFxHYR3eDjK6sWpWMCkCFKvsq5bqT
 +IAdztzjwgCZJxvvBngTBJVY0ivYUM4r+mw0UF7579Iut7ydKYmZp+2BymOEAta5tRjT
 FmjJdMLMzytdoaeS5vH6xV6HihkJ1I2fYRDEXIKILCE5LNhFNBXLMjCt6ztSZ5CKo//2
 TPFA==
X-Gm-Message-State: AOJu0YzkH6+ij1CUHYeoaXJuAimb7uz/bhIJ7LgesnsZwjmYGLpJMvZB
 qN+W8I5NQfy9/wyTr+qFc+3n+A==
X-Received: by 2002:a05:600c:d9:b0:402:cc5c:c98 with SMTP id
 u25-20020a05600c00d900b00402cc5c0c98mr11513539wmm.13.1700123761733; 
 Thu, 16 Nov 2023 00:36:01 -0800 (PST)
Received: from [192.168.69.100] ([176.187.220.205])
 by smtp.gmail.com with ESMTPSA id
 d34-20020a05600c4c2200b0040a48430837sm2551449wmp.13.2023.11.16.00.35.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 16 Nov 2023 00:36:01 -0800 (PST)
Message-ID: <67796dee-ddc1-48db-b127-1969319ea9e3@linaro.org>
Date: Thu, 16 Nov 2023 09:35:57 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 30/31] hw/arm: Check CPU type in
 machine_run_board_init()
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
 <20231114235628.534334-31-gshan@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>
In-Reply-To: <20231114235628.534334-31-gshan@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: Z/TtznRWxK3r

Hi Gavin,

On 15/11/23 00:56, Gavin Shan wrote:
> Set mc->valid_cpu_types so that the user specified CPU type can
> be validated in machine_run_board_init(). We needn't to do it by
> ourselves.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>   hw/arm/bananapi_m2u.c   | 12 ++++++------
>   hw/arm/cubieboard.c     | 12 ++++++------
>   hw/arm/mps2-tz.c        | 20 ++++++++++++++------
>   hw/arm/mps2.c           | 25 +++++++++++++++++++------
>   hw/arm/msf2-som.c       | 12 ++++++------
>   hw/arm/musca.c          | 13 ++++++-------
>   hw/arm/npcm7xx_boards.c | 13 ++++++-------
>   hw/arm/orangepi.c       | 12 ++++++------
>   8 files changed, 69 insertions(+), 50 deletions(-)


> diff --git a/hw/arm/mps2-tz.c b/hw/arm/mps2-tz.c
> index 668db5ed61..1c88e76a22 100644
> --- a/hw/arm/mps2-tz.c
> +++ b/hw/arm/mps2-tz.c
> @@ -191,6 +191,16 @@ OBJECT_DECLARE_TYPE(MPS2TZMachineState, MPS2TZMachineClass, MPS2TZ_MACHINE)
>   /* For cpu{0,1}_mpu_{ns,s}, means "leave at SSE's default value" */
>   #define MPU_REGION_DEFAULT UINT32_MAX
>   
> +static const char * const valid_cpu_types[] = {

Generic variable name,

> +    ARM_CPU_TYPE_NAME("cortex-m33"),
> +    NULL
> +};
> +
> +static const char * const mps3tz_an547_valid_cpu_types[] = {

then specific, is a bit confusing.

Better declare the array in the machine_class_init() methods ...

> +    ARM_CPU_TYPE_NAME("cortex-m55"),
> +    NULL
> +};
> +
>   static const uint32_t an505_oscclk[] = {

>       40000000,
>       24580000,
> @@ -813,12 +823,6 @@ static void mps2tz_common_init(MachineState *machine)
>       int num_ppcs;
>       int i;
>   
> -    if (strcmp(machine->cpu_type, mc->default_cpu_type) != 0) {
> -        error_report("This board can only be used with CPU %s",
> -                     mc->default_cpu_type);
> -        exit(1);
> -    }
> -
>       if (machine->ram_size != mc->default_ram_size) {
>           char *sz = size_to_str(mc->default_ram_size);
>           error_report("Invalid RAM size, should be %s", sz);
> @@ -1325,6 +1329,7 @@ static void mps2tz_an505_class_init(ObjectClass *oc, void *data)

... here. See for example
https://lore.kernel.org/qemu-devel/20231115232154.4515-2-philmd@linaro.org/.

>       mc->max_cpus = mc->default_cpus;
>       mmc->fpga_type = FPGA_AN505;
>       mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
> +    mc->valid_cpu_types = valid_cpu_types;
>       mmc->scc_id = 0x41045050;
>       mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
>       mmc->apb_periph_frq = mmc->sysclk_frq;
> @@ -1354,6 +1359,7 @@ static void mps2tz_an521_class_init(ObjectClass *oc, void *data)
>       mc->max_cpus = mc->default_cpus;
>       mmc->fpga_type = FPGA_AN521;
>       mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
> +    mc->valid_cpu_types = valid_cpu_types;
>       mmc->scc_id = 0x41045210;
>       mmc->sysclk_frq = 20 * 1000 * 1000; /* 20MHz */
>       mmc->apb_periph_frq = mmc->sysclk_frq;
> @@ -1383,6 +1389,7 @@ static void mps3tz_an524_class_init(ObjectClass *oc, void *data)
>       mc->max_cpus = mc->default_cpus;
>       mmc->fpga_type = FPGA_AN524;
>       mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m33");
> +    mc->valid_cpu_types = valid_cpu_types;
>       mmc->scc_id = 0x41045240;
>       mmc->sysclk_frq = 32 * 1000 * 1000; /* 32MHz */
>       mmc->apb_periph_frq = mmc->sysclk_frq;
> @@ -1417,6 +1424,7 @@ static void mps3tz_an547_class_init(ObjectClass *oc, void *data)
>       mc->max_cpus = mc->default_cpus;
>       mmc->fpga_type = FPGA_AN547;
>       mc->default_cpu_type = ARM_CPU_TYPE_NAME("cortex-m55");
> +    mc->valid_cpu_types = mps3tz_an547_valid_cpu_types;
>       mmc->scc_id = 0x41055470;
>       mmc->sysclk_frq = 32 * 1000 * 1000; /* 32MHz */
>       mmc->apb_periph_frq = 25 * 1000 * 1000; /* 25MHz */

