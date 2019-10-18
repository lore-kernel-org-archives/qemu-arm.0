Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp995159wrm;
        Fri, 18 Oct 2019 07:31:14 -0700 (PDT)
X-Google-Smtp-Source: APXvYqw1bFl7CQJsXhPjmOCsAw/8MegZEwIb+P66zBVdpTZEQJnOGIZH8YbFdO1qKfMVyjjDHCnw
X-Received: by 2002:aa7:cf8e:: with SMTP id z14mr9994703edx.60.1571409074828;
        Fri, 18 Oct 2019 07:31:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571409074; cv=none;
        d=google.com; s=arc-20160816;
        b=B2JJNbNKmvGmHYCgp4ZFTeiNANStHZ6Iy5ctor7p2rXu/MmzU+fcc2wNNx150GP1fu
         A2KO0OmunztBzba1w3OvTwFgsrJ2ExEC05YWLUX0z+D83JkHiiyEmgtgmLzOlWwdfUVo
         /qDxu2JrSD+inN+CJXS8m+HmRH05tY8xTd9E7yN/q6omSrU3jL3MIv6bw75/aBV1UOD3
         wbE+4QHHxMEtz0MN648b10tri4/LvYnzjq/cHqrr0R7fdAmk7p4pC0O8zT6Uy53VOTs7
         hTjhXMih9v2R4DbtBW4doa1JHOcBqj+bKEsp2WsFuW5fxuQO4Pr1kKTpSOU0SUJxxSc/
         wgaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:openpgp:from:references:to:subject:dkim-signature;
        bh=fU1NueAD/s8135/rW4pdQWedNLJY8vsK60SBCyhq5rA=;
        b=NZtvLGmE3XrNhKdS1kHuGeGtgR/9GYmhQxMxiWc72tWSop6f7ufgsCZxLJoKLUVLoC
         b9ls5DZEbgVg0o8HRWFsDwaEDEWDQ1iauFxJKE+ddgHzMIn27q25WYVixT1EJ3ityrZu
         sECCXeCmGWY67jtmRyT1XSAk55x6AHljiptYqbbZgRLE91q9faHId8s8jj/HIJ4oNAZ0
         HFHE3Tnx4W1sNeSkJJzj4uLKatNQloePJBBROGUaHQsqz4BvCvaudNGJDZWz3WkIP4sf
         v2RKS/lWRWjhnXBc9PpOYBhjlAv/CNCtznEbHas/C59/eCvzG4HWgKohyWlH+kuyxnGv
         FQKg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ZO/d5Yct";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g40si4073135edg.397.2019.10.18.07.31.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 07:31:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="ZO/d5Yct";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40938 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLTHd-0007ra-Tc
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 10:31:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33296)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1iLTHO-0007p9-PN
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 10:31:01 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1iLTHL-0002Ty-RI
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 10:30:56 -0400
Received: from mail-pf1-x441.google.com ([2607:f8b0:4864:20::441]:37864)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1iLTHL-0002RP-0G
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 10:30:55 -0400
Received: by mail-pf1-x441.google.com with SMTP id y5so4011954pfo.4
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 07:30:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=fU1NueAD/s8135/rW4pdQWedNLJY8vsK60SBCyhq5rA=;
 b=ZO/d5YctePpGmfSUHwohzPBgSO0wyT7wggiByGXsIgmrd4AFfMX8Mpo33Wov4Pv8e2
 WXyW6w4aD5/VDEW0UU+9NaV5oMtbPA9yjyyin3ivsHT4A6I6Vu250SIALK4+0Qj21ISE
 557MkMCmu3kZDyX1ql7wxGqhpTjfq21FXsjJprgmi0aym+R8Z6OjU7tmL5UNtgpfnaqS
 kP84KuusKybE1ej6XXfZO6BRr6doukbWWs2EU0QE9ouOgKqFOMQ2eTGl5rQFx3VeTuRf
 vgNTbHFfPyhuFHun8dCZ4NN7HXZCE7ph1cuIZkYRFh8gZktSvLAcF4OG9Phog+/ybnd+
 Oncw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=fU1NueAD/s8135/rW4pdQWedNLJY8vsK60SBCyhq5rA=;
 b=W5dYqASYwP+Ch528s3fOjo6Tpt2X2ObgkyJ7TC+D4fyoJiurzztEkcQBrJgQvNF98W
 7qFCCIJTT+tq0PqFs5AtU+uvWfuC/PrkuWOPQmQvGuI9yD424F9KZpE6VUPqwvSVhZZP
 Zegwso80dfFFlnlvlWPFwwR2ZbDlujMAHd251W7mVyzDPU0Q49zNf58mZ+J5Fm+LBpY8
 eVRDBpEeIJh8eyRI1Hz5VJ4mnGnYSVnO62gIYc+ytbt6ZshRk6iZzbj1BLPBuy6OgVhA
 CgHQRifmElpznEr3OGjoqonQ2bgV3k1j3efY1pEVULwlJ3pdUggRMeGVrA3QpeILnhob
 0TWA==
X-Gm-Message-State: APjAAAXPZau40/eFDcCLdIrUi76KvrY7TunFuK9e7ZBrXnSWJ+yedIoz
 cvZ9tVnM/k1OhZ1rIQMrC0eUOZJRYwc=
X-Received: by 2002:a63:c1:: with SMTP id 184mr10515080pga.224.1571409053273; 
 Fri, 18 Oct 2019 07:30:53 -0700 (PDT)
Received: from [192.168.1.11] (97-113-7-119.tukw.qwest.net. [97.113.7.119])
 by smtp.gmail.com with ESMTPSA id n23sm6180925pff.137.2019.10.18.07.30.51
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 18 Oct 2019 07:30:52 -0700 (PDT)
Subject: Re: [PATCH v7 17/20] target/arm: Rebuild hflags at MSR writes
To: Peter Maydell <peter.maydell@linaro.org>
References: <20191017185110.539-1-richard.henderson@linaro.org>
 <20191017185110.539-18-richard.henderson@linaro.org>
 <CAFEAcA8h9CN_qarQdfXRonE8KYO2=s+Jh_o+LFs9qk9M20pweA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Openpgp: preference=signencrypt
Message-ID: <16af4176-3acd-14bf-5399-31e5bb882120@linaro.org>
Date: Fri, 18 Oct 2019 07:30:49 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8h9CN_qarQdfXRonE8KYO2=s+Jh_o+LFs9qk9M20pweA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::441
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4pONt3mjNn9J

On 10/18/19 5:32 AM, Peter Maydell wrote:
> On Thu, 17 Oct 2019 at 19:51, Richard Henderson
> <richard.henderson@linaro.org> wrote:
>>
>> Continue setting, but not relying upon, env->hflags.
>>
>> Reviewed-by: Alex Bennée <alex.bennee@linaro.org>
>> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>> ---
>>  target/arm/translate-a64.c | 13 +++++++++++--
>>  target/arm/translate.c     | 28 +++++++++++++++++++++++-----
>>  2 files changed, 34 insertions(+), 7 deletions(-)
>> @@ -7068,14 +7070,30 @@ static int disas_coproc_insn(DisasContext *s, uint32_t insn)
>>              }
>>          }
>>
>> -        if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_CP_IO)) {
>> -            /* I/O operations must end the TB here (whether read or write) */
>> -            gen_lookup_tb(s);
>> -        } else if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
>> -            /* We default to ending the TB on a coprocessor register write,
>> +        /* I/O operations must end the TB here (whether read or write) */
>> +        need_exit_tb = ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) &&
>> +                        (ri->type & ARM_CP_IO));
>> +
>> +        if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
>> +            /*
>> +             * A write to any coprocessor regiser that ends a TB
> 
> (typo: "register")
> 
>> +             * must rebuild the hflags for the next TB.
>> +             */
>> +            TCGv_i32 tcg_el = tcg_const_i32(s->current_el);
>> +            if (arm_dc_feature(s, ARM_FEATURE_M)) {
>> +                gen_helper_rebuild_hflags_m32(cpu_env, tcg_el);
>> +            } else {
>> +                gen_helper_rebuild_hflags_a32(cpu_env, tcg_el);
>> +            }
>> +            tcg_temp_free_i32(tcg_el);
> 
> Why only rebuild hflags if !ARM_CP_SUPPRESS_TB_END ?
> For instance on the Xscale CPUs we set SUPPRESS_TB_END for the SCTLR,
> but some of the SCTLR bits are cached in hflags, right? Do we somehow
> arrange to rebuild the hflags when the TB does eventually end ?

No, we don't.  I assumed that all registers which change TB flags would in fact
end the TB.

Why did we suppress tb end for Xscale?


r~
