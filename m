Received: by 2002:a19:690d:0:0:0:0:0 with SMTP id e13csp6038229lfc;
        Mon, 15 Feb 2021 16:19:36 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyGhzJwn7kGQiGjEI+q+oh82fVayEVlKPRWPTn7CIFpZyqBCtddmxT9NX5/H3aXafwy9Zy0
X-Received: by 2002:a25:807:: with SMTP id 7mr25345704ybi.503.1613434776181;
        Mon, 15 Feb 2021 16:19:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1613434776; cv=none;
        d=google.com; s=arc-20160816;
        b=hBKD2xjpAX9YzXBL81HC3wBfBMtIBMYnFME6/yb08nYRVsR3sms4OJrSswa6V0PFLp
         JMwJp35EnQyzRX66LQOg13INIrfmrtuE1D+QNebreJ3huf+zTGIkmp0P1yJwVBWVv7Su
         i+f//ibZkH9OB2eFRa5Qj+Ws3Cqpzycwkk2EsAEyTOeA6KSWmuQpGe3n6jS/p1cCcBTc
         We4A/O5R7J9ESOKF+xSwc9VyAf2/8BztSah+4vsCCAGKiS4xqGWXK7WReC4QkrMHjD58
         a3NlLliEwSKChTEF94KLfYpdproJoxiRA4XkJIuAaSHjkdZMl1gGt8YjRyrjlnYhn5Bu
         iAlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=sJS81q6FaiDnXy/WNv7DiZYjDDLJO5pUW1sgH/dlk4o=;
        b=KVtR1zQ3rdh9EPYwtWRF16FXNaEA0HPlvVYLdjp/iNPzsiOdglmYF07mncXLgB/s8H
         VLW5AvEia++w2dvsf4bX+WWhkVbqUU+RhdhpMABlS3/dgKmImn2REIM195UGSBsEmsCK
         9bP4r2B6ob2FGoAU0C+x1+5EvMChBhaVXuACbOpIYl/yoz10AUimabqzTSh/ZP/N/Tns
         /vs4zd3VTFP9nMxApRHou4f3mq7Wf7eS/Ew7EUb/3riAzqYoJc8mNfP7D3j2ntOcLpRF
         o86qS62d3yYSloijgR8KokQzYtI04FY/OLLbBzH+v3LyOe4Uuck1TSklty5jN1Io0ueV
         skRg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zRHqTV+Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s72si19683778ybc.482.2021.02.15.16.19.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Feb 2021 16:19:36 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zRHqTV+Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54260 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lBo5X-00071m-Ef
	for alex.bennee@linaro.org; Mon, 15 Feb 2021 19:19:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55040)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBo5O-00070z-Ur
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 19:19:26 -0500
Received: from mail-pg1-x534.google.com ([2607:f8b0:4864:20::534]:34822)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lBo5M-0008KO-IF
 for qemu-arm@nongnu.org; Mon, 15 Feb 2021 19:19:26 -0500
Received: by mail-pg1-x534.google.com with SMTP id t25so5176993pga.2
 for <qemu-arm@nongnu.org>; Mon, 15 Feb 2021 16:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=sJS81q6FaiDnXy/WNv7DiZYjDDLJO5pUW1sgH/dlk4o=;
 b=zRHqTV+ZefPnr6+2bGh8Iq7QmgtaEBe0IO69+27dgoUvNmsKrDsJkfMu9aF+KsoSTT
 j1dpFBIojJuKU5pIqecuc0SURINCU0sGDxOR8p2YS6IJo/5nzTD02FPBvGmRsDLUijzj
 Sg6kpvzzmEZoBd5Dgy9XIOunNb7AVFQV0RbRNYNZUjygc2V9Os5N+enG3PGjnamhoh46
 DVfyiykgzUkiNWhz0abJaPU6Uamm1quJeUF/ZOm8eWqKl76A73Fvn0dpaoEP9bm9RBaX
 GwUm/SJZkjSrWw8FonaQ1kRvBkimm78eCh3uPGaJaaRqqzWe/0leSCnbl9/RUaiZ4neO
 TFAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sJS81q6FaiDnXy/WNv7DiZYjDDLJO5pUW1sgH/dlk4o=;
 b=nG/itiVfPMThdcFwH4DFi6DM/5dN3WnpgIkRCvbTVTvGRMCVf4KmRKqQtkwGcqPpf+
 K1hni3tcAOVxz+kPvHu4/mCG4Z5xCvY3Ms4DsSaB8+Mf2m/ZRPE7WxPmGHT2uQJHHLbJ
 0B055Xcu9VRuBcCBZ5MLX1q0M45Ddsr9vtnkuqgcW1TGPplJ4ILJnAjSCWLK7ZBDz13k
 ++DTEJ4DpNQlEefTSDs952zKYtKPJ3ZxfkK2LmKAkEgeGzlYjGlluwfKMOHOiIyl5fxQ
 Vc8ll4a8g/gXND2oEl/O41rUeHL+iXFtDaU/vSCV42izLEe+/yvD564ftBVQyfk64ikp
 Jk7w==
X-Gm-Message-State: AOAM533Rk+7oEd+ckxsJbfI3rHUnMwvWqRkN3V84/aVUeS/OzAeJzu1A
 ueAG9pNWxBJ09J09c1siiTy6CQ==
X-Received: by 2002:a63:1561:: with SMTP id 33mr17013265pgv.13.1613434762899; 
 Mon, 15 Feb 2021 16:19:22 -0800 (PST)
Received: from [192.168.1.11] (174-21-84-25.tukw.qwest.net. [174.21.84.25])
 by smtp.gmail.com with ESMTPSA id k5sm19476000pfi.31.2021.02.15.16.19.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Feb 2021 16:19:22 -0800 (PST)
Subject: Re: [PATCH 1/3] target/arm: Add support for FEAT_SSBS, Speculative
 Store Bypass Safe
To: Rebecca Cran <rebecca@nuviainc.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
References: <20210215215819.1142-1-rebecca@nuviainc.com>
 <20210215215819.1142-2-rebecca@nuviainc.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <e4233ca8-72a2-5213-1832-b326db071b49@linaro.org>
Date: Mon, 15 Feb 2021 16:19:19 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210215215819.1142-2-rebecca@nuviainc.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::534;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x534.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 31ZKWiiIKNcW

On 2/15/21 1:58 PM, Rebecca Cran wrote:
> @@ -960,6 +960,12 @@ static void cpsr_write_from_spsr_elx(CPUARMState *env,
>          val |= CPSR_DIT;
>      }
>  
> +    /* Move SSBS to the correct location for CPSR */
> +    if (val & PSTATE_SSBS) {
> +        val &= ~PSTATE_SSBS;
> +        val |= CPSR_SSBS;
> +    }

Incorrect.  SPSR_ELx leaves this at the same position as CPSR: bit 23.

>          }
> +
> +        if (cpu_isar_feature(aa32_ssbs, env_archcpu(env))) {
> +            if (env->cp15.sctlr_el[new_el] & SCTLR_DSSBS_32) {
> +                env->uncached_cpsr |= CPSR_SSBS;
> +            } else {
> +                env->uncached_cpsr &= ~CPSR_SSBS;
> +            }
> +        }

Hoist this so that it can be shared with the HYP branch (hsctlr is mapped to
sctlr_el[2] and HYP maps to el=2).

> @@ -9809,6 +9846,13 @@ static uint32_t cpsr_read_for_spsr_elx(CPUARMState *env)
>          ret &= ~CPSR_DIT;
>          ret |= PSTATE_DIT;
>      }
> +
> +    /* Move SSBS to the correct location for SPSR_ELx */
> +    if (ret & CPSR_SSBS) {
> +        ret &= ~CPSR_SSBS;
> +        ret |= PSTATE_SSBS;
> +    }

Incorrect, like in cpsr_write_from_spsr_elx.

> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 1c4b8d02f3b8..2372d55ea18b 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -1712,6 +1712,18 @@ static void handle_msr_i(DisasContext *s, uint32_t insn,
>          /* There's no need to rebuild hflags because DIT is a nop */
>          break;
>  
> +    case 0x19: /* SSBS */
> +        if (!dc_isar_feature(aa64_ssbs, s)) {
> +            goto do_unallocated;
> +        }
> +        if (crm & 1) {
> +            set_pstate_bits(PSTATE_SSBS);
> +        } else {
> +            clear_pstate_bits(PSTATE_SSBS);
> +        }
> +        /* Don't need to rebuild hflags since SSBS is a nop */
> +        break;

Put this above DIT (0x1a) to keep the numbers in order.


r~
