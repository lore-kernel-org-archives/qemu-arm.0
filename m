Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2997312lfy;
        Mon, 17 Aug 2020 08:53:19 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwpROiGj2ha4zHrijON4AC6/j/bf7Axbnnf9qBtLaXgftTnVXDbmnXTqgiNs0eoxEVZ3Gq3
X-Received: by 2002:a25:bec8:: with SMTP id k8mr19513771ybm.38.1597679599588;
        Mon, 17 Aug 2020 08:53:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597679599; cv=none;
        d=google.com; s=arc-20160816;
        b=ONY49/NCECaA0VTCDTAzbfeBTLhAaiBBx0wD+9p28t6v/2wI/QtK1ghQxKBi/OWCaC
         FLml9mzXViPCwRIXsiKKZVJJt2Sg7AMw+VyzP3UHc6mZD6bsTuQsk/7ZVLUS/PVRhIQp
         O1JiJDR1Av/PebMX1jrs29s3TDgT4uXRdxTwLz87ecJ0VgUHy4yXgnmcg5sWp9WCJEHj
         IDS44nFpcBNJYjHW4NRnEhws/oTJ+/yh+pbJhGpXCip6CjKJzMIgYUTKqgh6u3ifLTvA
         D5NHNQDsMSw6wPl0TlSWieQ4TLZaJQUfG0xbi+EK6M1mnmVzycgkwSOT4bVrauvalsmu
         1z9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=h/NJ68guh925CSzplbOgHuSP92wUKyDQ1/XIhfqCZl0=;
        b=s4QjwA+p8IaUP6PbirYaTkqVjG+armQxlzrtajOaOxXkJaKQD1Jf/dEMeWKjwnII7v
         YG4REbxjX8GRmKnCsg4ZrWkgyoxXrNZptQLXGok0UceGQyxU0GD0/wNMBB/894+Taao/
         VoaRJR4PdCoAwV2meoCkvUFKpcz8UA5Xr6Bh8KzkQy/ih4K+DHioY2h3hebSc7xgJcTW
         dIqO5iSc4lelWpLxu98DpXA25JFaN3OQS487zO7TXZcUcWIVi1GgJdtaSsrWKM0NcbXu
         o8koH+b6NgRNokSnWxbvtxHYHxWQvYfBPq9QLWFXWlqvVpgCJKHE86bXsN8u2DAm0LVu
         brwQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Owy8/qTV";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x3si23565039ybt.216.2020.08.17.08.53.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 17 Aug 2020 08:53:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="Owy8/qTV";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46922 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k7hRm-00067C-U4
	for alex.bennee@linaro.org; Mon, 17 Aug 2020 11:53:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32880)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k7hQt-0004cE-Cl
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 11:52:23 -0400
Received: from mail-pg1-x544.google.com ([2607:f8b0:4864:20::544]:41024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1k7hQr-0000kX-4B
 for qemu-devel@nongnu.org; Mon, 17 Aug 2020 11:52:23 -0400
Received: by mail-pg1-x544.google.com with SMTP id s15so8300873pgc.8
 for <qemu-devel@nongnu.org>; Mon, 17 Aug 2020 08:52:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=h/NJ68guh925CSzplbOgHuSP92wUKyDQ1/XIhfqCZl0=;
 b=Owy8/qTVDAp84HTv5OE9BD21xjLAjGHybk/JkLqeBh5ibVO0LvrKJlmSA7kalEU8Cr
 /npQsQlQGU3gmqPptFXLKJaJ9DC8AXV9x+MuIaPpW6LQp1oWvKh/FneXrYnoPZEjUpsN
 Kd0/ApC4cAs3NqvUBftdrDWkO4z/CITem3VkGGaYWysM0uNQwfxSn+V8C6dId+1lnOVq
 CbV2oQNt58ifX73x5h/xtw+sUxcdrm8bTdvL3WoYEjnyns7SeaxB2hZu94//G2Zmnr0a
 CSHKm2IQwDEKFS2J6a/foZzdzfyNAelozWN4tSJMZKJ+l2zVOdgIik6NBZmOS588z2Dr
 hnCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=h/NJ68guh925CSzplbOgHuSP92wUKyDQ1/XIhfqCZl0=;
 b=rwdzVbQenBPtNFi1/P6s8MzhIGuCtV4d4kV5qEoCwx62nhkUzEMlDft7G3UQG7ivt0
 XwT+9U9gfHKCKxZ4n9uO8pQU33dT3JMeLRVM7c71VqceiGEgj2LnBKwHiSlQ6ZbNFJP/
 GVXGq2DoDqwF28Tm5U+u4rpaeXAKGnhuZVOuo+7Vd71aRTVjS+oTJVszcE1GUBbK/c1t
 Uyser+ijmpfFKlJh5EBDmwntSj+D6LOgusc9BI8iAYdcJ2gmprG+WvwRgrcDTVb5g5FR
 Yf79aDkoEJCVtIBm2ueDxdU8SP+bIT+h0aYvChkGzXiZq2C+t9SHD2K5f1BAkoeU7O9k
 SOWQ==
X-Gm-Message-State: AOAM530OhugYRxfXEyTpT8KhjXTCOLfqvHwB+NVJ0Qh3In+VnbNjAgc6
 +9ZdOTqruL5Qdikhd4spSxt/RA==
X-Received: by 2002:a63:ab43:: with SMTP id k3mr9257238pgp.426.1597679539328; 
 Mon, 17 Aug 2020 08:52:19 -0700 (PDT)
Received: from [192.168.1.11] ([71.212.141.89])
 by smtp.gmail.com with ESMTPSA id t25sm19940913pfe.76.2020.08.17.08.52.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 17 Aug 2020 08:52:18 -0700 (PDT)
Subject: Re: [PATCH v1 4/5] target/microblaze: swx: Use atomic_cmpxchg
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-devel@nongnu.org
References: <20200817140144.373403-1-edgar.iglesias@gmail.com>
 <20200817140144.373403-5-edgar.iglesias@gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <c6aebf82-8518-ed06-2b2e-1397f373bedf@linaro.org>
Date: Mon, 17 Aug 2020 08:52:16 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20200817140144.373403-5-edgar.iglesias@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::544;
 envelope-from=richard.henderson@linaro.org; helo=mail-pg1-x544.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: figlesia@xilinx.com, peter.maydell@linaro.org, sstabellini@kernel.org,
 edgar.iglesias@xilinx.com, sai.pavan.boddu@xilinx.com,
 frasse.iglesias@gmail.com, alistair@alistair23.me, frederic.konrad@adacore.com,
 qemu-arm@nongnu.org, philmd@redhat.com, luc.michel@greensocs.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SeTzJsm7a9qe

On 8/17/20 7:01 AM, Edgar E. Iglesias wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
> 
> Use atomic_cmpxchg to implement the atomic cmpxchg sequence.
> 
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  target/microblaze/translate.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
> index c58f334a0f..530c15e5ad 100644
> --- a/target/microblaze/translate.c
> +++ b/target/microblaze/translate.c
> @@ -1075,14 +1075,16 @@ static void dec_store(DisasContext *dc)
>          swx_skip = gen_new_label();
>          tcg_gen_brcond_tl(TCG_COND_NE, env_res_addr, addr, swx_skip);
>  
> -        /* Compare the value loaded at lwx with current contents of
> -           the reserved location.
> -           FIXME: This only works for system emulation where we can expect
> -           this compare and the following write to be atomic. For user
> -           emulation we need to add atomicity between threads.  */
> +        /*
> +         * Compare the value loaded at lwx with current contents of
> +         * the reserved location.
> +         */
>          tval = tcg_temp_new_i32();
> -        tcg_gen_qemu_ld_i32(tval, addr, cpu_mmu_index(&dc->cpu->env, false),
> -                            MO_TEUL);
> +
> +        tcg_gen_atomic_cmpxchg_i32(tval, addr, env_res_val,
> +                                   cpu_R[dc->rd], mem_index,
> +                                   mop);
> +
>          tcg_gen_brcond_i32(TCG_COND_NE, env_res_val, tval, swx_skip);
>          write_carryi(dc, 0);
>          tcg_temp_free_i32(tval);
> @@ -1108,7 +1110,10 @@ static void dec_store(DisasContext *dc)
>                  break;
>          }
>      }
> -    tcg_gen_qemu_st_i32(cpu_R[dc->rd], addr, mem_index, mop);
> +
> +    if (!ex) {
> +        tcg_gen_qemu_st_i32(cpu_R[dc->rd], addr, mem_index, mop);
> +    }
>  
>      /* Verify alignment if needed.  */
>      if (dc->cpu->cfg.unaligned_exceptions && size > 1) {
> 

This is fine as far as the actual swx instruction goes, so
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

However, some notes for dec_store,

There seems to be a large under-decode here.  E.g. rev should never be set for
swx.  But rev is accepted and partially implemented.  E.g. there is no sbx
instruction, but the ex bit is accepted for any store instruction.

Microblaze has a relatively small instruction set.  Would you be open to a
conversion to decodetree?  It should be fairly easy.


r~
