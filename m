Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp1439887lfc;
        Fri, 28 Aug 2020 06:05:41 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxQVKMgVN1+17/omZsKR1lkPBKXR5mW1lTAQC5mDIrF2LTvCQqD0MUjLX3QnkHesZh+2Bg0
X-Received: by 2002:a25:34c9:: with SMTP id b192mr2512716yba.74.1598619941688;
        Fri, 28 Aug 2020 06:05:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598619941; cv=none;
        d=google.com; s=arc-20160816;
        b=NuRK8iM3+ydjC3lsmMjQBnVUJU8+7NWjInTGS1trz4czvYqcFYum5xSVvVwpxvM5ps
         40lnxD+w9px/zAF7eWVoCklEyPzyGs4noqB5LQIgMivaGJJ59y03TKG5TRYUJDXq8inB
         YQU/EqdNyDwhD01raXT6V5VphpHP1/VtBZiYu6568kTLgnkPzWmZS8Lh20fq9p3fgTqL
         BHztNgJ8xoxn45o583R8KQnx+0gMIV1Bv4nnRrr50IzF1KLh+OXrU+f2fPiYahIDS1+Q
         wKAh1I3nhtieLEkgoFM6ambsjFdJEBcwDM4Q/E0b6WdVhrpZYVE4gatfnVG87M3wzskI
         7I2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=dkagsWIsZBw1oCC7bYzRxd0xR1useDjExiqvrjcDQxA=;
        b=R0kXiaq6GFY98P7Dyc7OrbhjKXraFUmU6nkDHUOkjkPompr4vZOY67jDHfRICxmpl4
         neYoX3USsprHey0tQ6Krn6RBPejnUqyJEY7DWxLuAPl39U86qOU7AAgnZZTLRZ+GjIeT
         T5XmRaklzyXOpwzuX5dxpmNyJz/CW087cKuHkEiC5ksocLqXXe0FHKKx8shSkBykhkWE
         GfYk59mVpbB9S9J/xriDTgK2bf/6T6zQBhFmFTsKXbjFfRiU+E5AqwlxmN6EcqhqC1DJ
         ANKnfwgYWfLtUa+R20kkkwZkTzRS7JtMDu+p4q8TDqR/qLPfh/K9SfapSoJ4LjYjguoH
         3S0w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=MH6IPxQ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s12si814543ybm.342.2020.08.28.06.05.41
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Aug 2020 06:05:41 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@greensocs.com header.s=mail header.b=MH6IPxQ9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:53182 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kBe4a-0006xh-UQ
	for alex.bennee@linaro.org; Fri, 28 Aug 2020 09:05:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46920)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kBe2z-0005xu-Ee; Fri, 28 Aug 2020 09:04:01 -0400
Received: from beetle.greensocs.com ([5.135.226.135]:38558)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <luc.michel@greensocs.com>)
 id 1kBe2x-0000Xt-O7; Fri, 28 Aug 2020 09:04:01 -0400
Received: from [172.17.10.10] (unknown [172.17.10.10])
 by beetle.greensocs.com (Postfix) with ESMTPSA id 0B85D21C7B;
 Fri, 28 Aug 2020 13:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=greensocs.com;
 s=mail; t=1598619837;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dkagsWIsZBw1oCC7bYzRxd0xR1useDjExiqvrjcDQxA=;
 b=MH6IPxQ94rWODkCGIQ3QPLJDkwPzZNxbSkIjxTFHqSVnuf3n10jjaTiMTkMSjzTce+qyNK
 ziSOD1wTU9Bt2IpYyHW9H09KlpgHy6eZv0gt8NFL4mGNkxGXu8LEaO9/fj1TYuBQMh+yGw
 aC9ndpMiI8xQyu7IfpOSr+fr/ZShba0=
Subject: Re: [PATCH v1 2/2] target/microblaze: Improve transaction failure
 handling
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200828113931.3252489-1-edgar.iglesias@gmail.com>
 <20200828113931.3252489-3-edgar.iglesias@gmail.com>
From: Luc Michel <luc.michel@greensocs.com>
Message-ID: <5a284482-68ed-32f5-0c82-73d2f98795f0@greensocs.com>
Date: Fri, 28 Aug 2020 15:04:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.11.0
MIME-Version: 1.0
In-Reply-To: <20200828113931.3252489-3-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=5.135.226.135;
 envelope-from=luc.michel@greensocs.com; helo=beetle.greensocs.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/08/28 09:02:55
X-ACL-Warn: Detected OS   = Linux 3.11 and newer
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.809,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me,
 richard.henderson@linaro.org, frederic.konrad@adacore.com, qemu-arm@nongnu.org,
 philmd@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CHYhhxOFqLkF

On 8/28/20 1:39 PM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> When the CPU has exceptions disabled, avoid unwinding CPU
> state and clobbering registers if we're not going to raise
> any exception.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

Reviewed-by: Luc Michel <luc.michel@greensocs.com>

> ---
>   target/microblaze/op_helper.c | 19 +++++++------------
>   1 file changed, 7 insertions(+), 12 deletions(-)
> 
> diff --git a/target/microblaze/op_helper.c b/target/microblaze/op_helper.c
> index 13ac476199..190cd96c6a 100644
> --- a/target/microblaze/op_helper.c
> +++ b/target/microblaze/op_helper.c
> @@ -483,22 +483,17 @@ void mb_cpu_transaction_failed(CPUState *cs, hwaddr physaddr, vaddr addr,
>       cpu = MICROBLAZE_CPU(cs);
>       env = &cpu->env;
>   
> -    cpu_restore_state(cs, retaddr, true);
>       if (!(env->sregs[SR_MSR] & MSR_EE)) {
>           return;
>       }
>   
> -    env->sregs[SR_EAR] = addr;
> -    if (access_type == MMU_INST_FETCH) {
> -        if (cpu->cfg.iopb_bus_exception) {
> -            env->sregs[SR_ESR] = ESR_EC_INSN_BUS;
> -            helper_raise_exception(env, EXCP_HW_EXCP);
> -        }
> -    } else {
> -        if (cpu->cfg.dopb_bus_exception) {
> -            env->sregs[SR_ESR] = ESR_EC_DATA_BUS;
> -            helper_raise_exception(env, EXCP_HW_EXCP);
> -        }
> +    if ((access_type == MMU_INST_FETCH && cpu->cfg.iopb_bus_exception) ||
> +        (access_type != MMU_INST_FETCH && cpu->cfg.dopb_bus_exception)) {
> +        cpu_restore_state(cs, retaddr, true);
> +        env->sregs[SR_ESR] = access_type == MMU_INST_FETCH ?
> +                             ESR_EC_INSN_BUS : ESR_EC_DATA_BUS;
> +        env->sregs[SR_EAR] = addr;
> +        helper_raise_exception(env, EXCP_HW_EXCP);
>       }
>   }
>   #endif
> 
