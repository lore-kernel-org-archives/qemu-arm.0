Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp6004273lfp;
        Tue, 11 Feb 2020 22:40:00 -0800 (PST)
X-Google-Smtp-Source: APXvYqyKZQA9uxSJCzyzvl6e9y/poLWWyPMmJKVlp6VboYXJkiEAuSXoNGXkgxhO/pbwfY72hm8z
X-Received: by 2002:a0c:e2d1:: with SMTP id t17mr6239461qvl.25.1581489600108;
        Tue, 11 Feb 2020 22:40:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1581489600; cv=none;
        d=google.com; s=arc-20160816;
        b=fwGFmvphhZUnsJMYiBMxZnhi/SsPXcKtabzjVxKEl3VK+WunHv3L7CwAohTiGb/m8c
         aUAEf8B8SZUdCJI6nUwcKQMGxaFhjc9aM3lV/TFmyfUyxc3tIeh1Wsb/CATbbap/RShq
         4phGZ9GPUTB5BOOdpAN2RGkbFAih3CT4pQKVoFguN9OLP7b+jzXptbvi+cVVTmiYVbOp
         PTwcykuOtr15qJievkNs0hVAHoLm8UZDQWO4av0r6m1Od7a1YyXTRsTHIkdKO6aUA6pi
         AyUZAyytZ2liqefx+NeuBJSW/5NGzE3anfcKcEphIWRSP0Zls6JkI0sQvPLzkjmzKmwW
         l5LQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:references:to:from:subject:dkim-signature;
        bh=9357b9GEhhzGix2MX/8lNh81fBlwakg/V0dBaEag0Sw=;
        b=NLrhrdZyJ2P6p8gHvpGGyBjEfr2d73XubCtakh36izGN3gkXK41IhkyWvFGKUSk0DP
         Qt92SM8NJzQNgImNDYBs17qM3+D+M/z6xxSPjEYKFmZAYY+UqRXxtWEb/SWmQiSkLtVb
         pstE+X/4ly8vvahChF16IIe1fUFZ5/kc0HIJTqsxhYZutwHxz34kBAKK5REV2LqwTeLJ
         zBEd3Zx6FQDaVfNzEdKZLfez21Zyya2xtxFeYFx/Of7DsR+4ZswNlT3imoHwCq/m/x0i
         glRM9Veju8XF+FXWjov5ouIAFLSbHk5KpZ9vu92qEzvQIAfNV/8xSwzLPnJhcVfWJu+g
         l1hw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G+UbdToC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p2si3104792qkk.268.2020.02.11.22.39.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Feb 2020 22:40:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=G+UbdToC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:60644 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j1lgl-0005xp-Ix
	for alex.bennee@linaro.org; Wed, 12 Feb 2020 01:39:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48618)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <gshan@redhat.com>) id 1j1lgY-0005wx-JG
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 01:39:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <gshan@redhat.com>) id 1j1lgX-00074r-DM
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 01:39:46 -0500
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:46683
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <gshan@redhat.com>) id 1j1lgX-00074e-9s
 for qemu-arm@nongnu.org; Wed, 12 Feb 2020 01:39:45 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1581489584;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9357b9GEhhzGix2MX/8lNh81fBlwakg/V0dBaEag0Sw=;
 b=G+UbdToCI/qJO1O8pjnovh38U0DHv25J1dvm01c7/Pknp3HOlgNNIsAPnWp/4HB0sp1ghu
 bu5kK0kSEH7IC1amNpUiVLzzeisxVOJ2Cqs/POkljpX3BE7piCHKl9E3L9blx3twzh3ihf
 MEM1nmOQNhxJHhyEIn6Zb5O+xNPglGA=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-uCmCG7nQNdiqskOO2LQBXg-1; Wed, 12 Feb 2020 01:39:41 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
 [10.5.11.13])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 529C2800D4E;
 Wed, 12 Feb 2020 06:39:39 +0000 (UTC)
Received: from localhost.localdomain (vpn2-54-85.bne.redhat.com [10.64.54.85])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 751BA87B34;
 Wed, 12 Feb 2020 06:39:33 +0000 (UTC)
Subject: Re: [RESEND RFC PATCH v2 1/2] target/arm: Allow to inject SError
 interrupt
From: Gavin Shan <gshan@redhat.com>
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
References: <20200205110541.37811-2-gshan@redhat.com>
Message-ID: <8dce7dbe-c6c1-122a-f960-0fc29257dd1c@redhat.com>
Date: Wed, 12 Feb 2020 17:39:31 +1100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.0
MIME-Version: 1.0
In-Reply-To: <20200205110541.37811-2-gshan@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-MC-Unique: uCmCG7nQNdiqskOO2LQBXg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.61
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, jthierry@redhat.com,
 aik@ozlabs.ru, maz@kernel.org, eric.auger@redhat.com, shan.gavin@gmail.com,
 pbonzini@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zonzjLFdS+uW

On 2/5/20 10:05 PM, Gavin Shan wrote:
> This allows to inject SError interrupt, which will be used on receiving
> QMP/HMP "nmi" command in next patch.
> 
> Signed-off-by: Gavin Shan <gshan@redhat.com>
> ---
>   target/arm/cpu.c    | 11 +++++++++++
>   target/arm/cpu.h    | 12 +++++++++---
>   target/arm/helper.c |  4 ++++
>   3 files changed, 24 insertions(+), 3 deletions(-)
> 

Hi Peter, could you please take a look when you get a chance? I'm not sure
the implementation is good enough to inject SError. If there are somebody
else who can help to review, please let me know so that I can copy her/him
either.

Thanks,
Gavin

> diff --git a/target/arm/cpu.c b/target/arm/cpu.c
> index f86e71a260..24fd77437b 100644
> --- a/target/arm/cpu.c
> +++ b/target/arm/cpu.c
> @@ -461,6 +461,17 @@ bool arm_cpu_exec_interrupt(CPUState *cs, int interrupt_request)
>           }
>       }
>   
> +    if (interrupt_request & CPU_INTERRUPT_SERROR) {
> +        excp_idx = EXCP_SERROR;
> +        target_el = arm_phys_excp_target_el(cs, excp_idx, cur_el, secure);
> +        if (arm_excp_unmasked(cs, excp_idx, target_el)) {
> +            cs->exception_index = excp_idx;
> +            env->exception.target_el = target_el;
> +            cc->do_interrupt(cs);
> +            ret = true;
> +        }
> +    }
> +
>       return ret;
>   }
>   
> diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> index 608fcbd0b7..0bbc46ff6d 100644
> --- a/target/arm/cpu.h
> +++ b/target/arm/cpu.h
> @@ -49,6 +49,7 @@
>   #define EXCP_LAZYFP         20   /* v7M fault during lazy FP stacking */
>   #define EXCP_LSERR          21   /* v8M LSERR SecureFault */
>   #define EXCP_UNALIGNED      22   /* v7M UNALIGNED UsageFault */
> +#define EXCP_SERROR         23   /* SError Interrupt */
>   /* NB: add new EXCP_ defines to the array in arm_log_exception() too */
>   
>   #define ARMV7M_EXCP_RESET   1
> @@ -79,9 +80,10 @@ enum {
>   };
>   
>   /* ARM-specific interrupt pending bits.  */
> -#define CPU_INTERRUPT_FIQ   CPU_INTERRUPT_TGT_EXT_1
> -#define CPU_INTERRUPT_VIRQ  CPU_INTERRUPT_TGT_EXT_2
> -#define CPU_INTERRUPT_VFIQ  CPU_INTERRUPT_TGT_EXT_3
> +#define CPU_INTERRUPT_FIQ    CPU_INTERRUPT_TGT_EXT_1
> +#define CPU_INTERRUPT_VIRQ   CPU_INTERRUPT_TGT_EXT_2
> +#define CPU_INTERRUPT_VFIQ   CPU_INTERRUPT_TGT_EXT_3
> +#define CPU_INTERRUPT_SERROR CPU_INTERRUPT_TGT_EXT_4
>   
>   /* The usual mapping for an AArch64 system register to its AArch32
>    * counterpart is for the 32 bit world to have access to the lower
> @@ -2731,6 +2733,10 @@ static inline bool arm_excp_unmasked(CPUState *cs, unsigned int excp_idx,
>           pstate_unmasked = !(env->daif & PSTATE_I);
>           break;
>   
> +    case EXCP_SERROR:
> +       pstate_unmasked = !(env->daif & PSTATE_A);
> +       break;
> +
>       case EXCP_VFIQ:
>           if (secure || !(hcr_el2 & HCR_FMO) || (hcr_el2 & HCR_TGE)) {
>               /* VFIQs are only taken when hypervized and non-secure.  */
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 19a57a17da..622a1d8796 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -7980,6 +7980,7 @@ void arm_log_exception(int idx)
>               [EXCP_LAZYFP] = "v7M exception during lazy FP stacking",
>               [EXCP_LSERR] = "v8M LSERR UsageFault",
>               [EXCP_UNALIGNED] = "v7M UNALIGNED UsageFault",
> +            [EXCP_SERROR] = "SError Interrupt",
>           };
>   
>           if (idx >= 0 && idx < ARRAY_SIZE(excnames)) {
> @@ -8566,6 +8567,9 @@ static void arm_cpu_do_interrupt_aarch64(CPUState *cs)
>       case EXCP_VFIQ:
>           addr += 0x100;
>           break;
> +    case EXCP_SERROR:
> +        addr += 0x180;
> +        break;
>       default:
>           cpu_abort(cs, "Unhandled exception 0x%x\n", cs->exception_index);
>       }
> 

