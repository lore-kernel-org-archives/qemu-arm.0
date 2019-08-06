Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp5693670wrv;
        Tue, 6 Aug 2019 13:52:52 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz6hHFDHyJdq2pJ+Tet/kynvnwmZwxSoXNE1bXOOx6E47Qjag6uI61ZrY7TeXP7fg2aHkKz
X-Received: by 2002:a37:c81:: with SMTP id 123mr568085qkm.300.1565124772537;
        Tue, 06 Aug 2019 13:52:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565124772; cv=none;
        d=google.com; s=arc-20160816;
        b=Hi1hgaYdPsEKMUGj1ZR5hiumlySFLMcLTKfb+XS816MRsbFvgZ/aXHr/Fqdhm1cUUr
         Iz53y7bzhhq88E7mz+LSV4ZHRvdMqZ6Y+/wTR5pWhOGTWN8EJwKwG9ccmcBvtHvNw/BS
         ZtMUU1yyIlFirNMZU2HSudUKF4MWF5bX9GG/Y0WoonPm/bX9hn1amFBYjZH3rAgSX+r3
         NXPOS82vvpx2Xd0p/J7ovnHHk7H7b9WYS+i1g1bBsoq9gkpO+VJduP4jjwAxfN4NM3vF
         QufSGRMJaGGfRUzN3lVF2n8+jFmM4DId8CNMSOTBLyW9nJdm6sJNH/mt4t+qYAHcgnGg
         n8rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=u9ApZj2VaEXqX6eILsw6k22KOwSDwU0EqiPTvyHlhuY=;
        b=Fle+k3WAKar9VrOSZszUNWRBYcdXMJ3Mrdq3s680IbTuQj7GqK42693Lstli9LCc6X
         bwPUqIYmWeTENXpUsyX44rOb4MAkk/c36ietoztwpoiUXxMeaFw0DGf92MqEZFRIn+HN
         Y3nRO2lKfPW8IjjFkh3Xl9khKgWNdPQAlYfEVyaktMoDJZahaNc72xtsLGwgAqDUwspx
         +kwx0cxoQgG+9G30M9KndD82HR3iv9zsNPPwT2qLsOxPYyPaG95hKdq51Ub8/8LtV6iQ
         UITV//PlmPbIR1wI9SZnaYiC00uYQaVsluUY/T2Tl7hYrKXurtzgNjSlOGnhO7Bwexs/
         lOkg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t53si52907141qvc.91.2019.08.06.13.52.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Aug 2019 13:52:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:36162 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hv6Rw-0001sK-4H
	for alex.bennee@linaro.org; Tue, 06 Aug 2019 16:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38140)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <philmd@redhat.com>) id 1hv6Ro-0001lN-4q
 for qemu-arm@nongnu.org; Tue, 06 Aug 2019 16:52:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hv6Rm-0001Ya-Oc
 for qemu-arm@nongnu.org; Tue, 06 Aug 2019 16:52:44 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:50560)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hv6Rm-0001XQ-I3
 for qemu-arm@nongnu.org; Tue, 06 Aug 2019 16:52:42 -0400
Received: by mail-wm1-f65.google.com with SMTP id v15so79563502wml.0
 for <qemu-arm@nongnu.org>; Tue, 06 Aug 2019 13:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=u9ApZj2VaEXqX6eILsw6k22KOwSDwU0EqiPTvyHlhuY=;
 b=L8UtyX2q1arl37QBWVMZfihO+Hms12UC/FnaMf4LjTYiuBEwjUpFHDVtP/oBiT2EMn
 MADjgbhVYululRhBC1gcEerZUBx22w67GdZHEYC0Ur95A4HYOflgyI28OgY2FswU7qpm
 jBeJKIGeAaeQDpSha2yLfJvRgZdIBm1cWf+b+lLLQNnrZsFirX6Cx92ULO9RZMNm4Uok
 b6L5F9nr7Pk4W9W7zlpGnCHYQM3PvcMtHVMdbXdL0KSkBjf/Spcd5vsKpwPlnNstJI75
 awFFgRVIfndNMbkutFRhklKcrE0GxXPNiuwvY4p3LrJCzZz1v01k4d9skyDMPcmAKR1X
 2lHg==
X-Gm-Message-State: APjAAAWK1GX3HEendRCRaaQKwme2P/+IuZnio48DYLFKWtwi/EUJ6+6S
 zZlmAOYXhyTrRHPslj8b2qGWBQ==
X-Received: by 2002:a1c:a1c5:: with SMTP id k188mr6312934wme.102.1565124760847; 
 Tue, 06 Aug 2019 13:52:40 -0700 (PDT)
Received: from [10.0.0.124] ([185.102.219.36])
 by smtp.gmail.com with ESMTPSA id g19sm109421077wmg.10.2019.08.06.13.52.39
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Tue, 06 Aug 2019 13:52:40 -0700 (PDT)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20190805130952.4415-1-peter.maydell@linaro.org>
 <20190805130952.4415-2-peter.maydell@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <3b543e16-f6f7-0aa7-0c6b-94871fda62ff@redhat.com>
Date: Tue, 6 Aug 2019 22:52:37 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190805130952.4415-2-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/2] target/arm: Factor out
 'generate singlestep exception' function
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jef36kGohg2d

On 8/5/19 3:09 PM, Peter Maydell wrote:
> Factor out code to 'generate a singlestep exception', which is
> currently repeated in four places.
> 
> To do this we need to also pull the identical copies of the
> gen-exception() function out of translate-a64.c and translate.c
> into translate.h.
> 
> (There is a bug in the code: we're taking the exception to the wrong
> target EL.  This will be simpler to fix if there's only one place to
> do it.)
> 
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  target/arm/translate.h     | 23 +++++++++++++++++++++++
>  target/arm/translate-a64.c | 19 ++-----------------
>  target/arm/translate.c     | 20 ++------------------
>  3 files changed, 27 insertions(+), 35 deletions(-)
> 
> diff --git a/target/arm/translate.h b/target/arm/translate.h
> index a20f6e20568..45053190baa 100644
> --- a/target/arm/translate.h
> +++ b/target/arm/translate.h
> @@ -2,6 +2,7 @@
>  #define TARGET_ARM_TRANSLATE_H
>  
>  #include "exec/translator.h"
> +#include "internals.h"
>  
>  
>  /* internal defines */
> @@ -232,6 +233,28 @@ static inline void gen_ss_advance(DisasContext *s)
>      }
>  }
>  
> +static inline void gen_exception(int excp, uint32_t syndrome,
> +                                 uint32_t target_el)
> +{
> +    TCGv_i32 tcg_excp = tcg_const_i32(excp);
> +    TCGv_i32 tcg_syn = tcg_const_i32(syndrome);
> +    TCGv_i32 tcg_el = tcg_const_i32(target_el);
> +
> +    gen_helper_exception_with_syndrome(cpu_env, tcg_excp,
> +                                       tcg_syn, tcg_el);
> +
> +    tcg_temp_free_i32(tcg_el);
> +    tcg_temp_free_i32(tcg_syn);
> +    tcg_temp_free_i32(tcg_excp);
> +}
> +
> +/* Generate an architectural singlestep exception */
> +static inline void gen_swstep_exception(DisasContext *s, int isv, int ex)
> +{
> +    gen_exception(EXCP_UDEF, syn_swstep(s->ss_same_el, isv, ex),
> +                  default_exception_el(s));
> +}
> +
>  /*
>   * Given a VFP floating point constant encoded into an 8 bit immediate in an
>   * instruction, expand it to the actual constant value of the specified
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index d3231477a27..f6729b96fd0 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -253,19 +253,6 @@ static void gen_exception_internal(int excp)
>      tcg_temp_free_i32(tcg_excp);
>  }
>  
> -static void gen_exception(int excp, uint32_t syndrome, uint32_t target_el)
> -{
> -    TCGv_i32 tcg_excp = tcg_const_i32(excp);
> -    TCGv_i32 tcg_syn = tcg_const_i32(syndrome);
> -    TCGv_i32 tcg_el = tcg_const_i32(target_el);
> -
> -    gen_helper_exception_with_syndrome(cpu_env, tcg_excp,
> -                                       tcg_syn, tcg_el);
> -    tcg_temp_free_i32(tcg_el);
> -    tcg_temp_free_i32(tcg_syn);
> -    tcg_temp_free_i32(tcg_excp);
> -}
> -
>  static void gen_exception_internal_insn(DisasContext *s, int offset, int excp)
>  {
>      gen_a64_set_pc_im(s->pc - offset);
> @@ -305,8 +292,7 @@ static void gen_step_complete_exception(DisasContext *s)
>       * of the exception, and our syndrome information is always correct.
>       */
>      gen_ss_advance(s);
> -    gen_exception(EXCP_UDEF, syn_swstep(s->ss_same_el, 1, s->is_ldex),
> -                  default_exception_el(s));
> +    gen_swstep_exception(s, 1, s->is_ldex);
>      s->base.is_jmp = DISAS_NORETURN;
>  }
>  
> @@ -14261,8 +14247,7 @@ static void aarch64_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>           * bits should be zero.
>           */
>          assert(dc->base.num_insns == 1);
> -        gen_exception(EXCP_UDEF, syn_swstep(dc->ss_same_el, 0, 0),
> -                      default_exception_el(dc));
> +        gen_swstep_exception(dc, 0, 0);
>          dc->base.is_jmp = DISAS_NORETURN;
>      } else {
>          disas_a64_insn(env, dc);
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 7853462b21b..19b9d8f2725 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -282,20 +282,6 @@ static void gen_exception_internal(int excp)
>      tcg_temp_free_i32(tcg_excp);
>  }
>  
> -static void gen_exception(int excp, uint32_t syndrome, uint32_t target_el)
> -{
> -    TCGv_i32 tcg_excp = tcg_const_i32(excp);
> -    TCGv_i32 tcg_syn = tcg_const_i32(syndrome);
> -    TCGv_i32 tcg_el = tcg_const_i32(target_el);
> -
> -    gen_helper_exception_with_syndrome(cpu_env, tcg_excp,
> -                                       tcg_syn, tcg_el);
> -
> -    tcg_temp_free_i32(tcg_el);
> -    tcg_temp_free_i32(tcg_syn);
> -    tcg_temp_free_i32(tcg_excp);
> -}
> -
>  static void gen_step_complete_exception(DisasContext *s)
>  {
>      /* We just completed step of an insn. Move from Active-not-pending
> @@ -308,8 +294,7 @@ static void gen_step_complete_exception(DisasContext *s)
>       * of the exception, and our syndrome information is always correct.
>       */
>      gen_ss_advance(s);
> -    gen_exception(EXCP_UDEF, syn_swstep(s->ss_same_el, 1, s->is_ldex),
> -                  default_exception_el(s));
> +    gen_swstep_exception(s, 1, s->is_ldex);
>      s->base.is_jmp = DISAS_NORETURN;
>  }
>  
> @@ -12024,8 +12009,7 @@ static bool arm_pre_translate_insn(DisasContext *dc)
>           * bits should be zero.
>           */
>          assert(dc->base.num_insns == 1);
> -        gen_exception(EXCP_UDEF, syn_swstep(dc->ss_same_el, 0, 0),
> -                      default_exception_el(dc));
> +        gen_swstep_exception(dc, 0, 0);
>          dc->base.is_jmp = DISAS_NORETURN;
>          return true;
>      }
> 
