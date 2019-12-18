Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp73092lff;
        Tue, 17 Dec 2019 17:03:35 -0800 (PST)
X-Google-Smtp-Source: APXvYqyqHvACcM4aemG4jjN0aee4roj8AHIPXIDOzDsQeyr1DJnLZDFFTZpWUuBHXs9XRpCPy7n0
X-Received: by 2002:a9d:3425:: with SMTP id v34mr99907otb.142.1576631015390;
        Tue, 17 Dec 2019 17:03:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576631015; cv=none;
        d=google.com; s=arc-20160816;
        b=lsI28Ng9UX0ipyk3+Aw3mzSmzYQcln8YaAI3PxwjqqSQ2hz6n9H9FlD/yJLhgScXLH
         klZUhz/O97/XYkQrZ0VuQr6ke5NJkFoqNeQ3pGR9grxyj36L4l9IngLXpSzRh+YAcPA4
         S1UbX9YL5OlIrSzREa2y5enJ+hX0nmMDhkjpnFLIKf2RHg2U5gkXrvRwdDPI5w4DRu+T
         BwUYHyw411AqXfqScpr5QOlrYa/Qqn06gJJUb/fanbZhQK/GYuhX2yd8n9lebTbgkBVw
         GDB7xg9Wop+6NirNJWMcu5JwN2O4JPQznnKkaPe1s2JxGgTRoBAW/XR8VIanZ8q2sP5A
         zAHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=qDktnqJFILHEe9UmAzxJWXQjAQ6RxhjYlF1ehUzBsNk=;
        b=dSH81ZSM0VhTPu+KPByJgzc7XHd0B1kXWEgUj1LMfQSQbNp4XnJuG3J4xxvVelbR6A
         +UfEmSJ2UZSvm6LcKSAVh0M86z4iQmbHm2EFNNoqq3BRJ+F4nyNkh5zhSQUo6EF6kpu1
         pIkynPtUIqh/SULwY+pHSuinG9HOQemjJHyT6KzqelkfVoE2t5+zmpQWPzukGxa7YHaU
         qjR/R/hcosnSNANuoInKkngvNZlGG6r/XU4oHITETRAA5mDqPOZjA0eVtmMLPwz9RQbN
         lb2JCu8F9G8VHoRcMzurtD/G7Myb8VGtr9eVh6pcA5YCpOG7c5ymwUoWgGbwaqMLYTQE
         WkHg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lJUv67jz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m4si270324otq.42.2019.12.17.17.03.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Dec 2019 17:03:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=lJUv67jz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihNkU-0005J6-G9
	for alex.bennee@linaro.org; Tue, 17 Dec 2019 20:03:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:48614)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <richard.henderson@linaro.org>) id 1ihNkL-0005Il-Fi
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 20:03:26 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <richard.henderson@linaro.org>) id 1ihNkI-000059-Bi
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 20:03:24 -0500
Received: from mail-pl1-x641.google.com ([2607:f8b0:4864:20::641]:44121)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <richard.henderson@linaro.org>)
 id 1ihNkI-0008V9-50
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 20:03:22 -0500
Received: by mail-pl1-x641.google.com with SMTP id az3so171968plb.11
 for <qemu-arm@nongnu.org>; Tue, 17 Dec 2019 17:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=qDktnqJFILHEe9UmAzxJWXQjAQ6RxhjYlF1ehUzBsNk=;
 b=lJUv67jzPq4LKQonclJjvnnyhUhhAIy9tGQrdLTOsjQxF7iZbkt84zeRZhP3d1tBcv
 k85ICsohSFopESlOZuQjOItYNN1d94TIG/yKM6l2mIwGYpuSfB2Z6cQOxcBEIZtACicG
 12Ilzr6J7TVL8yLGG29S2Q9Ynpk6q8u/BO2UB6s+k1duiyuZ+4gP4TBOx+tZXL2SOqw8
 ZzksMZvD7bPG4LvzW069p/Ls1+f/6Oo3POaJnVyLU3Pz/nXgAUUJf+yenw5RB+l0JWc7
 eMXC8Jn26fDDq7uqzvXsLQ6IiFuQWdRubbUAMI+FF9vDj8TA+zkDnYn4u7ln9WHeV5d/
 ozwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=qDktnqJFILHEe9UmAzxJWXQjAQ6RxhjYlF1ehUzBsNk=;
 b=lSTlYXns42pnLGrAd4PbROHnZ09GLkHSq0xXQ79E0/OyYgyG8VZzHI1/RJj0RcfeIV
 ojoRpKifHU3xR557ZpUInyKnFxiy3Xx8+jA8KB7GVrjVQyheVzdfh5ujSBSJ1dlteq8G
 ZoZs5v2gjIRCeMH1UI0CEA/6mrqZrUyYVnk/Aq18EoCCoGx2M+yJfCOu6eLTsJkkYmyg
 CAkZqC9Qd5FbwIZlWmMNWDmoM8rg6K8f8hdiTSYnhvqR2Futz3jPH0cPrIU24zdegnkn
 TKdN4sSg722fTCZxUoSSeE1q0hVzYvjZwxtI2X+YhDJJeeTz/rnqaAJOuTWVulFNeXrv
 OBLA==
X-Gm-Message-State: APjAAAWcu1D2GAdYghYRxiI/TTuVii0aa2a+I0kSlXY8gGNQPuVXb4uf
 I35KviDDs+iPnGmC6VQma5Nkew==
X-Received: by 2002:a17:90a:26ec:: with SMTP id
 m99mr279651pje.130.1576631000487; 
 Tue, 17 Dec 2019 17:03:20 -0800 (PST)
Received: from ?IPv6:2605:e000:c74f:dc00:6838:d2b2:17e2:8445?
 ([2605:e000:c74f:dc00:6838:d2b2:17e2:8445])
 by smtp.gmail.com with ESMTPSA id o8sm177926pjo.7.2019.12.17.17.03.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 17 Dec 2019 17:03:19 -0800 (PST)
Subject: Re: [PATCH] target/arm: fix IL bit for data abort exceptions
To: Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20191217210230.99559-1-jeff.kubascik@dornerworks.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <7a274247-e593-5828-73f8-2042971e8633@linaro.org>
Date: Tue, 17 Dec 2019 15:03:16 -1000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20191217210230.99559-1-jeff.kubascik@dornerworks.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::641
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jWmHQH3Kq2fR

On 12/17/19 11:02 AM, Jeff Kubascik wrote:
> diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> index 5feb312941..e63f8bda29 100644
> --- a/target/arm/tlb_helper.c
> +++ b/target/arm/tlb_helper.c
> @@ -44,7 +44,7 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
>          syn = syn_data_abort_with_iss(same_el,
>                                        0, 0, 0, 0, 0,
>                                        ea, 0, s1ptw, is_write, fsc,
> -                                      false);
> +                                      true);
>          /* Merge the runtime syndrome with the template syndrome.  */
>          syn |= template_syn;

This doesn't look correct.  Surely the IL bit should come from template_syn?

> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index d4bebbe629..a3c618fdd9 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -14045,6 +14045,7 @@ static void disas_a64_insn(CPUARMState *env, DisasContext *s)
>      s->pc_curr = s->base.pc_next;
>      insn = arm_ldl_code(env, s->base.pc_next, s->sctlr_b);
>      s->insn = insn;
> +    s->is_16bit = false;
>      s->base.pc_next += 4;

Should not be necessary, as the field is not read along any a64 path.  (Also,
while it's not yet in master, there's a patch on list that zero initializes the
entire structure.)

> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 2b6c1f91bf..300480f1b7 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -8555,7 +8555,7 @@ static ISSInfo make_issinfo(DisasContext *s, int rd, bool p, bool w)
>  
>      /* ISS not valid if writeback */
>      if (p && !w) {
> -        ret = rd;
> +        ret = rd | (s->is_16bit ? ISSIs16Bit : 0);
>      } else {
>          ret = ISSInvalid;
>      }
> @@ -11057,6 +11057,7 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      dc->pc_curr = dc->base.pc_next;
>      insn = arm_ldl_code(env, dc->base.pc_next, dc->sctlr_b);
>      dc->insn = insn;
> +    dc->is_16bit = false;
>      dc->base.pc_next += 4;
>      disas_arm_insn(dc, insn);
>  
> @@ -11126,6 +11127,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      dc->pc_curr = dc->base.pc_next;
>      insn = arm_lduw_code(env, dc->base.pc_next, dc->sctlr_b);
>      is_16bit = thumb_insn_is_16bit(dc, dc->base.pc_next, insn);
> +    dc->is_16bit = is_16bit;
>      dc->base.pc_next += 2;
>      if (!is_16bit) {
>          uint32_t insn2 = arm_lduw_code(env, dc->base.pc_next, dc->sctlr_b);
> diff --git a/target/arm/translate.h b/target/arm/translate.h
> index b837b7fcbf..c16f434477 100644
> --- a/target/arm/translate.h
> +++ b/target/arm/translate.h
> @@ -14,6 +14,8 @@ typedef struct DisasContext {
>      target_ulong pc_curr;
>      target_ulong page_start;
>      uint32_t insn;
> +    /* 16-bit instruction flag */
> +    bool is_16bit;
>      /* Nonzero if this instruction has been conditionally skipped.  */
>      int condjmp;
>      /* The label that will be jumped to when the instruction is skipped.  */

The rest of this looks both correct and necessary.


r~
