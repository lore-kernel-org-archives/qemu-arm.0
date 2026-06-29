Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE33FC43458
	for <qemu-arm@archiver.kernel.org>; Mon, 29 Jun 2026 14:34:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1weD3h-0004ja-Gy; Mon, 29 Jun 2026 10:34:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1weD3d-0004iY-UP
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 10:33:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1weD3b-0001Av-Pw
 for qemu-arm@nongnu.org; Mon, 29 Jun 2026 10:33:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1782743635;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DPJJh9ooAsty/EOeinLfg4xCLV3st20fsgWC3PF1tPQ=;
 b=SyeuWKBu1K3iOX/VEmpvQBLscPypJaOO4prxJ7yB84fD7wUtLtKCDnkbOvRci+6cbxIMD7
 qnya1GQCxTEK+gQ1Bat+GiSnzOwYPvaTCmF4QiEhrOpPkovHcrP+ltmvw1mAMNp5U3KdeK
 I6/XzMP+ycwQ1+Ldl4w++WYdjxN54iQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-248-TqZ6rC8rNMKbIMsDNW9sKw-1; Mon, 29 Jun 2026 10:33:51 -0400
X-MC-Unique: TqZ6rC8rNMKbIMsDNW9sKw-1
X-Mimecast-MFC-AGG-ID: TqZ6rC8rNMKbIMsDNW9sKw_1782743630
Received: by mail-ed1-f71.google.com with SMTP id
 4fb4d7f45d1cf-6986250d6f7so1395200a12.0
 for <qemu-arm@nongnu.org>; Mon, 29 Jun 2026 07:33:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782743630; x=1783348430;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DPJJh9ooAsty/EOeinLfg4xCLV3st20fsgWC3PF1tPQ=;
 b=K3pUxfGpY6ZrH838TE+U+AAo1mpevbjhlKP+q5uA+/MeNkfCYJ+VW1qD4No1K/Dje+
 eBjRAPQmqW2254FQGnWckdM+BKAgIa0eiI958sHAg485DYgQQWUubGaklyMEuhZhCSsy
 rTHpn3y0kFUJR4Lis/hGur0T3dcKxGcTjb7B5oPsejFwN/dfBt6RKwg97fDsVXVzNPGC
 WEZfMnw8AW/whvgfwimYpPFUj1vYZDsfQFKQ0nhVzK9MpGGFMJFpFyqNrupUd9S9FJfJ
 3q1vZvwklxRHhTvzzDsVaHS3nxVuEPdkf56UPDkULkrAdZsyow2/WvjHdZ2iWBon8f4b
 NmfQ==
X-Gm-Message-State: AOJu0YyiqKuHECe30Zqf2t+qHKvaWpwZKYKhF45tCyQ2/Q0TR3TRJPcP
 qgDmter/6WzOOin9a+3aMeFEiKWj8gA2y0c4gNwAdK3gl192mGA5DQTKlCVvcgvbpTVaz26evNq
 qwMkXD/mzqGS4lfDEw9pI46ci5q819UPGCNX2SwXCLw9wXlC41QtKwQ==
X-Gm-Gg: AfdE7clcW9fzBLsGLJmH+m+DclxSj5Zs7ir91TJJcsl/KYXncA3ULHMwljxxm4OWnte
 1VnrdCvs5Za/6OOT0IfptW3ymvuQemivCeY3s8Vqrld4vh0cySXT6BtKp2jk+tACQ0QpaMBNsy3
 9am4DANuX/M3+SHGoxfrCDKX+VO9Sx5K3pCnRxx4NWoZYG96S+WFvQaOOx5xRUnK7aqQPgAcf0E
 S4voFMObWTK13hoQa3pM5idNUoJeJlRihcxA0qRsOjnZnDCGBEx6flSQ1VE91+jEX1VfjwjhI1p
 Tc3xfnXB4YSJkWfsHBFNX1/m6vM0KIUTAawEbaG0Yt8eP0DZbwLvPhKt9kP8B3ynP3UoBxhfMLm
 XaqA6aUDv2ZTRnxGKPR+cKfACCGuZAzMHAE2U2vcW6hMkg1c/cQFBfw==
X-Received: by 2002:a17:907:c00a:b0:c12:3285:82b3 with SMTP id
 a640c23a62f3a-c1232858734mr493875166b.26.1782743630306; 
 Mon, 29 Jun 2026 07:33:50 -0700 (PDT)
X-Received: by 2002:a17:907:c00a:b0:c12:3285:82b3 with SMTP id
 a640c23a62f3a-c1232858734mr493872666b.26.1782743629627; 
 Mon, 29 Jun 2026 07:33:49 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-c12024deb90sm796925666b.18.2026.06.29.07.33.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 Jun 2026 07:33:48 -0700 (PDT)
Message-ID: <cfced2b4-2de1-4e3e-bfd6-5418d5c41007@redhat.com>
Date: Mon, 29 Jun 2026 16:33:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] arm: handle demuxed ID registers
To: Sebastian Ott <sebott@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alireza Sanaee <alireza.sanaee@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Cornelia Huck <cohuck@redhat.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20260622135627.40573-1-sebott@redhat.com>
 <20260622135627.40573-2-sebott@redhat.com>
From: Eric Auger <eauger@redhat.com>
In-Reply-To: <20260622135627.40573-2-sebott@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: zjM5TBdw9QF5Q4SMnOLKioJ_w2dspcUZiQBnElfkJW4_1782743630
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org



On 6/22/26 3:56 PM, Sebastian Ott wrote:
> From: Cornelia Huck <cohuck@redhat.com>
> 
> For some registers, we do not have a single ID register, but actually
> an array of values (e.g. CCSIDR_EL1, where the actual value is
> determined by whatever CSSELR_EL1 points to.) If we want to avoid
> using a different way to handle registers like that for every
> instance, we should provide some kind of infrastructure. Therefore,
> add accessors {GET,SET}_IDREG_DEMUX that are similar to the accessors
> we already use for regular ID registers.
> 
> Tested-by: Alireza Sanaee <alireza.sanaee@huawei.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Sebastian Ott <sebott@redhat.com>

With actual implementation
Suggested-by: Richard Henderson <richard.henderson@linaro.org>


Reviewed-by: Eric Auger <eric.auger@redhat.com>

Eric

> ---
>  target/arm/cpu-sysregs.h |  9 +++++++++
>  target/arm/cpu.h         | 12 ++++++++++++
>  target/arm/cpu64.c       |  8 ++++++++
>  3 files changed, 29 insertions(+)
> 
> diff --git a/target/arm/cpu-sysregs.h b/target/arm/cpu-sysregs.h
> index 7877a3b06a..a4b9621a7e 100644
> --- a/target/arm/cpu-sysregs.h
> +++ b/target/arm/cpu-sysregs.h
> @@ -20,20 +20,29 @@
>  
>  #define DEF(NAME, OP0, OP1, CRN, CRM, OP2) NAME##_IDX,
>  
> +#define DEF_MUX(NAME, OP0, OP1, CRN, CRM, OP2, NUM)     \
> +    NAME##_IDX,                                         \
> +    NAME##_IDX_LAST = NAME##_IDX + NUM - 1,
> +
>  typedef enum ARMIDRegisterIdx {
>  #include "cpu-sysregs.h.inc"
>      NUM_ID_IDX,
>  } ARMIDRegisterIdx;
>  
>  #undef DEF
> +#undef DEF_MUX
>  #define DEF(NAME, OP0, OP1, CRN, CRM, OP2) \
>      SYS_##NAME = ENCODE_ID_REG(OP0, OP1, CRN, CRM, OP2),
>  
> +#define DEF_MUX(NAME, OP0, OP1, CRN, CRM, OP2, NUM)     \
> +    DEF(NAME, OP0, OP1, CRN, CRM, OP2)
> +
>  typedef enum ARMSysRegs {
>  #include "cpu-sysregs.h.inc"
>  } ARMSysRegs;
>  
>  #undef DEF
> +#undef DEF_MUX
>  
>  extern const uint32_t id_register_sysreg[NUM_ID_IDX];
>  
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 31a5567c95..fe0046b02e 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -919,6 +919,18 @@ typedef struct {
>          i_->idregs[REG ## _EL1_IDX];                                    \
>      })
>  
> +#define SET_IDREG_DEMUX(ISAR, REG, INDEX, VALUE)                        \
> +    ({                                                                  \
> +        ARMISARegisters *i_ = (ISAR);                                   \
> +        i_->idregs[REG ## _IDX + INDEX] = VALUE;                        \
> +    })
> +
> +#define GET_IDREG_DEMUX(ISAR, REG, INDEX)                               \
> +    ({                                                                  \
> +        ARMISARegisters *i_ = (ISAR);                                   \
> +        i_->idregs[REG ## _IDX + INDEX];                                \
> +    })
> +
>  /**
>   * ARMCPU:
>   * @env: #CPUARMState
> diff --git a/target/arm/cpu64.c b/target/arm/cpu64.c
> index 2816735577..48a0421674 100644
> --- a/target/arm/cpu64.c
> +++ b/target/arm/cpu64.c
> @@ -42,14 +42,21 @@
>  #define DEF(NAME, OP0, OP1, CRN, CRM, OP2)      \
>      [NAME##_IDX] = SYS_##NAME,
>  
> +#define DEF_MUX(NAME, OP0, OP1, CRN, CRM, OP2, NUM)     \
> +    DEF(NAME, OP0, OP1, CRN, CRM, OP2)
> +
>  const uint32_t id_register_sysreg[NUM_ID_IDX] = {
>  #include "cpu-sysregs.h.inc"
>  };
>  
>  #undef DEF
> +#undef DEF_MUX
>  #define DEF(NAME, OP0, OP1, CRN, CRM, OP2) \
>      case SYS_##NAME: return NAME##_IDX;
>  
> +#define DEF_MUX(NAME, OP0, OP1, CRN, CRM, OP2, NUM)     \
> +    DEF(NAME, OP0, OP1, CRN, CRM, OP2)
> +
>  int get_sysreg_idx(ARMSysRegs sysreg)
>  {
>      switch (sysreg) {
> @@ -59,6 +66,7 @@ int get_sysreg_idx(ARMSysRegs sysreg)
>  }
>  
>  #undef DEF
> +#undef DEF_MUX
>  
>  void aarch64_cpu_sve_finalize(ARMCPU *cpu, Error **errp)
>  {


