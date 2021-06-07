Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp3918905lfa;
        Mon, 7 Jun 2021 16:33:14 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy0xtpTopfI8Iwzbna7z2WpWXKkPShpQmV5bjcvMCHq3JK4pELzW0ug6lvDUt7y6zwPlNjJ
X-Received: by 2002:aca:d545:: with SMTP id m66mr982938oig.27.1623108794288;
        Mon, 07 Jun 2021 16:33:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623108794; cv=none;
        d=google.com; s=arc-20160816;
        b=cgfSFGvz1Ai6zLf2wUozdPsbxNZVInMWPaTwZmXwZP8yIwhIIyUYkVye5mCsktBIzY
         z1KSoFntyjpVTqOg3tEo5nvpev3HwQT9JD44QFaSF3dIfv54MYRgAxlzKb6gvE4dfP1P
         fgx3TjBhgeoRRSxjpbbL+Lgb6n+f6uK0+JaxN7oP3cd+FbWCgrLpSVl6rO//3Mn275R6
         8Bh44mgrDP+8o3mwdKNoIfOEeisMegFEhBxOah5fWFWkkco23hENorT3yDj94PSedULP
         Gm02qFNxmrKAZl3H+BHVhbEr/9yIRROuo5F/wNelfOFRo/i5T7in2+S2nIRLB8aIMfHQ
         LzTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=kibhoWl62ieWnz0106xsENCYNjBvHQXnyP6B2d2eI7U=;
        b=G+3ZWcyGqLQZb1BdDDNeNgvkuoybCOny6XjshANgosA7VJLsr+OwW6s7zH6KHrzDG7
         oCyoxIl/a4UC9Ua8eDEQ8ft2OZ17cYsyqC6jkdgPQHmCxIhmLQ/jkMgoAHVPEXZ++qpU
         XqpytjAiMOTY7ptgF4OGt83eP9OuSLP/0EhnNhmcyn5DwxtOEys4PxqzG7stWJAepM2L
         0NLo0C20MUHEMcQkW7qH6mvjNGsWWxO/RJbegqyANdjtqRwqv74onHaCPoMMoCxYZXqF
         ldCcTBfQRle6jRJY5nq0sq7CqUD52n6HkbgfwHBmiVmLFkBL3h2N45ySkH2Vy5ZsnB+k
         UBMA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=in2hcb0E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d18si4218021ote.189.2021.06.07.16.33.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Jun 2021 16:33:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=in2hcb0E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60094 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqOk5-0007xx-IS
	for alex.bennee@linaro.org; Mon, 07 Jun 2021 19:33:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:38482)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqOjy-0007xg-0n
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 19:33:06 -0400
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029]:51921)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqOjw-0004gi-7o
 for qemu-arm@nongnu.org; Mon, 07 Jun 2021 19:33:05 -0400
Received: by mail-pj1-x1029.google.com with SMTP id k5so10815765pjj.1
 for <qemu-arm@nongnu.org>; Mon, 07 Jun 2021 16:33:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=kibhoWl62ieWnz0106xsENCYNjBvHQXnyP6B2d2eI7U=;
 b=in2hcb0EcYkR6sqL7aKdoLgcXkE9YZ6zHcSLpG7sywb0/HJnOjw9mzsgPBa2BVRDNd
 f+s4q9hWYCNthozrOQ+DvB6E/GBAECm67vNHvkQXaYZuUvFBA2I+AIzZp/5Ec58Nxiww
 cU8/wpZH8dCLSyNG6cE9lGTWTLxkSn1LlEh5RBhug7whFWx48VNVc/xlq6P1ephoIMdN
 8RHTgBM7+etWRI6UYGHAp0aAbFnYyZPwQtQiPk0JA9ZSurF9mVrUCITXi2A5/P7dBD2N
 yr8B8tOnUSWUB1YsYZEN8G2Xb/0se58iVHa673xFluhCWcEkCvE2mkAqEqxZN/nnKokb
 FmAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=kibhoWl62ieWnz0106xsENCYNjBvHQXnyP6B2d2eI7U=;
 b=fMCbA0PCac+M5tO/j4zAHZdKtgAKToKZCGfUvpNMqMPMqsVBQmNo8MlwYqJ2RO3Bq5
 UqUhD7vMjrQZzFRMDPCk2xMyhcRuWH6A8y8iF7HT0Z4LG19ZNoOqyPNOFdF1D8s98R2p
 OPrTYcRhCrRjXXCU49I1PsVw7WB9BoAjx43zFVR0RcD7zVSOv++I+ea2QByK/AYOzf6+
 ndxCZjQG9/4Ay5mXd9brYYWWzX5GLqRW0C28RAQkLM08pT4eanRfAK35dF4z6STfF7H3
 JxR35STr1wvVvrRYBrKp/UeNAwcrF5EyO6dWRCNRl5UPTothMSLm6fY81xbISS1Hc2nB
 4HJw==
X-Gm-Message-State: AOAM531UEBI8rV6ETSByKl8RdEe3aPaVq+K6MFjIaGjD9yr/OorcgD8X
 XEFs8Q9tCgDIxJS8CjuprjBzPw==
X-Received: by 2002:a17:902:6a87:b029:ef:2942:89fc with SMTP id
 n7-20020a1709026a87b02900ef294289fcmr20449491plk.36.1623108782536; 
 Mon, 07 Jun 2021 16:33:02 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 w2sm9157149pfc.126.2021.06.07.16.33.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 07 Jun 2021 16:33:02 -0700 (PDT)
Subject: Re: [PATCH 04/55] target/arm: Add handling for PSR.ECI/ICI
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-5-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <d54b1117-b25a-ff6f-3166-87fd282b674c@linaro.org>
Date: Mon, 7 Jun 2021 16:33:00 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-5-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1029;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1029.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7hLwsSCIeHNK

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +void clear_eci_state(DisasContext *s)
> +{
> +    /*
> +     * Clear any ECI/ICI state: used when a load multiple/store
> +     * multiple insn executes.
> +     */
> +    if (s->eci) {
> +        TCGv_i32 tmp = tcg_temp_new_i32();
> +        tcg_gen_movi_i32(tmp, 0);

tcg_const_i32 or preferably tcg_constant_i32.


> +    /*
> +     * the CONDEXEC TB flags are CPSR bits [15:10][26:25]. On A-profile this
> +     * is always the IT bits. On M-profile, some of the reserved encodings
> +     * of IT are used instead to indicate either ICI or ECI, which
> +     * indicate partial progress of a restartable insn that was interrupted
> +     * partway through by an exception:
> +     *  * if CONDEXEC[3:0] != 0b0000 : CONDEXEC is IT bits
> +     *  * if CONDEXEC[3:0] == 0b0000 : CONDEXEC is ICI or ECI bits
> +     * In all cases CONDEXEC == 0 means "not in IT block or restartable
> +     * insn, behave normally".
> +     */
> +    if (condexec & 0xf) {
> +        dc->condexec_mask = (condexec & 0xf) << 1;
> +        dc->condexec_cond = condexec >> 4;
> +        dc->eci = 0;
> +    } else {
> +        dc->condexec_mask = 0;
> +        dc->condexec_cond = 0;
> +        if (arm_feature(env, ARM_FEATURE_M)) {
> +            dc->eci = condexec >> 4;
> +        }

This else leaves eci uninitialized.

>       dc->insn = insn;
>   
> +    if (dc->eci) {
> +        /*
> +         * For M-profile continuable instructions, ECI/ICI handling
> +         * falls into these cases:
> +         *  - interrupt-continuable instructions
> +         *     These are the various load/store multiple insns (both
> +         *     integer and fp). The ICI bits indicate the register
> +         *     where the load/store can resume. We make the IMPDEF
> +         *     choice to always do "instruction restart", ie ignore
> +         *     the ICI value and always execute the ldm/stm from the
> +         *     start. So all we need to do is zero PSR.ICI if the
> +         *     insn executes.
> +         *  - MVE instructions subject to beat-wise execution
> +         *     Here the ECI bits indicate which beats have already been
> +         *     executed, and we must honour this. Each insn of this
> +         *     type will handle it correctly. We will update PSR.ECI
> +         *     in the helper function for the insn (some ECI values
> +         *     mean that the following insn also has been partially
> +         *     executed).
> +         *  - Special cases which don't advance ECI
> +         *     The insns LE, LETP and BKPT leave the ECI/ICI state
> +         *     bits untouched.
> +         *  - all other insns (the common case)
> +         *     Non-zero ECI/ICI means an INVSTATE UsageFault.
> +         *     We place a rewind-marker here. Insns in the previous
> +         *     three categories will set a flag in the DisasContext.
> +         *     If the flag isn't set after we call disas_thumb_insn()
> +         *     or disas_thumb2_insn() then we know we have a "some other
> +         *     insn" case. We will rewind to the marker (ie throwing away
> +         *     all the generated code) and instead emit "take exception".
> +         */
> +        dc->eci_handled = false;

This should be done in arm_tr_init_disas_context, I think, unconditionally, 
next to eci.

> +        dc->insn_eci_rewind = tcg_last_op();

I believe that this is identical to dc->insn_start.  Certainly there does not 
seem to be any possibility of any opcodes emitted in between.

If you think we should use a different field, then initialize it to null next 
to eci/eci_handled.


r~
