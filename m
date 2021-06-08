Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4816721lfa;
        Tue, 8 Jun 2021 14:33:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxL9in3BaW7Gwff2GPnDXXllOpLNKjdZbni4PxACtmeNkdnS5k/2hBdZJFuqKv2WoOi9ukZ
X-Received: by 2002:a02:294e:: with SMTP id p75mr22518725jap.34.1623188005271;
        Tue, 08 Jun 2021 14:33:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623188005; cv=none;
        d=google.com; s=arc-20160816;
        b=hTgMCBS/uoeAs7PUEfeY5R9L5eIUcGD3x389I/z4pz5bINT6FSvlFZGxGQIo/CN7sE
         zyUlfk74+MFGVbTACqMlNuUx8QRp226c5AdPk0NdsOuSFw1CxnQXZCmXsFj/cGyLWYKX
         FQlOO3O9DJACF/PktV+tqREF0jmLCi/8E5ryINUAMIPKpOEf7bIcFN72cxLNYmQ/MAiG
         ooC4h+qfuo0j4uZgLJI4VSXiz9kNFd9jFqP4T/8tELYRk7lRcfPmAVeB1PzBmNsu8ff8
         BH2CPvlsfs+dCcLsQDV6oWafN8UU/Jpo01tnCbt/QUlnBIUaOv/2jNzWTNqZBkL8xMEo
         6kBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=2Xe1Z8SuFDERsT04b3rhXb5qnWkWynznPba8HgCcZ/o=;
        b=rSQZ5shQObL7r73lfCHqkcXXIy4zLFuKWsS7u3cGnlWKEMP0U7QKIHJ16yLywdfy1L
         sypDIm85D6o2cTsLvI7W2sjCHslEiUQXkVfZ9iOyGnImjXyqvq5t2N67jvbMak6djSde
         etka3TqCGCnrwcJ81REZwC4aT9v2anobAXjvgeKv5hJSdKUw5AVTTRqGCbci/8LwK2WL
         fD6jIP4b87kmYSSGOP4mdSniTUyxZkiczDkP5VQmxLv5pecoKMCf1zyvKu7RPzfZaS9l
         Fdk4TGRdWKNAD1MR7TXt9fh7RfNYutslcc/73urHobj07110sV20KH7MU/u+gkavv2sE
         IigA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ARcBJoVD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m3si1065183ild.74.2021.06.08.14.33.25
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 14:33:25 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ARcBJoVD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43386 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqjLg-0003Pm-Jm
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 17:33:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37272)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqjLX-0003PV-KO
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 17:33:15 -0400
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b]:43821)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqjLV-0000SJ-QS
 for qemu-arm@nongnu.org; Tue, 08 Jun 2021 17:33:15 -0400
Received: by mail-pf1-x42b.google.com with SMTP id m7so3814381pfa.10
 for <qemu-arm@nongnu.org>; Tue, 08 Jun 2021 14:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=2Xe1Z8SuFDERsT04b3rhXb5qnWkWynznPba8HgCcZ/o=;
 b=ARcBJoVDwhW4l4BwKtMvucPM6Zk8O/szRD2doMYPlxuTqpE8qlS4Z32cgB174K4/+w
 nzL4qWPOa2BLkBIQu2QdO3E6plVY/GfSdbM0XaG2PGKwJFPUKrXmdbg9LmQQicMmMpqr
 CwSHtJdDhVyLsHhefD02rQf9jDxo8C6bnECktiBLjHQX7C17ZAcKu/JH+XL5EqtrMnmI
 Ur4u0gt+Nl+5fQZpTHMDT1lWCZB815aD4w3QUC2Op2r5GKH5F12clK5DRKddOClCgePl
 fDFsKt/tWDnVxsKM75T+aPSVm6yoH5ojx+m9sMoPXA01RjiZrgALUA0g8fKaVTDe1jcm
 sBRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=2Xe1Z8SuFDERsT04b3rhXb5qnWkWynznPba8HgCcZ/o=;
 b=l9aZUXetJETsItYfvg7K2naKBfqIBz29hT4FRjRkwOEHfnN9peegGrohTzObB+RmTG
 Pve5BFOuG2BmxiAYQHTzZ+UQQT0OJKhPGmeCO3g3r1GMsN3RRPcNRQZr1h+ZWTYY6I+8
 WsvrVmlj8WmUeEp4Buq5ma4YT7+JTagaJ7fGqZwnHkAW7OtL2+aLy9orx4ElmyHR9uWn
 0QwA9e8Eeq7VJXhgZBxbn6tBaBbzX3X8fqoCDcAbE61RUBYVNNR2cSQj0PNsNA81OXGc
 yC+kLK9bm7AXCSclZbLWYs9UD7JMCdxtFbe4POwnAbdMD3e/FrofTCMgysiG1tRt95Dt
 BHig==
X-Gm-Message-State: AOAM530odee890imIR1GCHI2cDj/R7/7C3Vpq/TsgET0Xa9SWqfRrRSX
 x3/h7qFl43rzaaAUEqj8VZM1/Q==
X-Received: by 2002:a63:6284:: with SMTP id w126mr262777pgb.284.1623187991178; 
 Tue, 08 Jun 2021 14:33:11 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 t1sm12559141pgl.40.2021.06.08.14.33.10
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 14:33:10 -0700 (PDT)
Subject: Re: [PATCH 11/55] target/arm: Implement MVE VLDR/VSTR (non-widening
 forms)
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-12-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <fef05b3a-eb23-fea7-0230-a69207b48e11@linaro.org>
Date: Tue, 8 Jun 2021 14:33:09 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-12-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42b.google.com
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
X-TUID: ySIeyv9MfZDg

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +static uint16_t mve_element_mask(CPUARMState *env)
> +{
> +    /*
> +     * Return the mask of which elements in the MVE vector should be
> +     * updated. This is a combination of multiple things:
> +     *  (1) by default, we update every lane in the vector
> +     *  (2) VPT predication stores its state in the VPR register;
> +     *  (3) low-overhead-branch tail predication will mask out part
> +     *      the vector on the final iteration of the loop
> +     *  (4) if EPSR.ECI is set then we must execute only some beats
> +     *      of the insn
> +     * We combine all these into a 16-bit result with the same semantics
> +     * as VPR.P0: 0 to mask the lane, 1 if it is active.
> +     * 8-bit vector ops will look at all bits of the result;
> +     * 16-bit ops will look at bits 0, 2, 4, ...;
> +     * 32-bit ops will look at bits 0, 4, 8 and 12.
> +     * Compare pseudocode GetCurInstrBeat(), though that only returns
> +     * the 4-bit slice of the mask corresponding to a single beat.
> +     */
> +    uint16_t mask = extract32(env->v7m.vpr, R_V7M_VPR_P0_SHIFT,
> +                              R_V7M_VPR_P0_LENGTH);

Any reason you're not using FIELD_EX32 and and FIELD_DP32 so far in this file?

> +#define DO_VLDR(OP, ESIZE, LDTYPE, TYPE, H)                             \
> +    void HELPER(mve_##OP)(CPUARMState *env, void *vd, uint32_t addr)    \
> +    {                                                                   \
> +        TYPE *d = vd;                                                   \
> +        uint16_t mask = mve_element_mask(env);                          \
> +        unsigned b, e;                                                  \

esize is redundant with sizeof(type); perhaps just make it a local variable?

> diff --git a/target/arm/translate-mve.c b/target/arm/translate-mve.c
> index c54d5cb7305..e8bb2372ad9 100644
> --- a/target/arm/translate-mve.c
> +++ b/target/arm/translate-mve.c
> @@ -1,6 +1,6 @@
>   /*
>    *  ARM translation: M-profile MVE instructions
> -
> + *
>    *  Copyright (c) 2021 Linaro, Ltd.

Is this just diff silliness?  I see that it has decided that helper-mve.h is a 
rename from translate-mve.c...

> +static bool do_ldst(DisasContext *s, arg_VLDR_VSTR *a, MVEGenLdStFn *fn)
> +{
> +    TCGv_i32 addr;
> +    uint32_t offset;
> +    TCGv_ptr qreg;
> +
> +    if (!dc_isar_feature(aa32_mve, s)) {
> +        return false;
> +    }
> +
> +    if (a->qd > 7 || !fn) {
> +        return false;
> +    }

It's a funny old decode,

   if D then UNDEFINED.
   d = D:Qd,

Is the spec forward looking to more than 7 Q registers?
It's tempting to just drop the D:Qd from the decode...

> +static bool trans_VLDR_VSTR(DisasContext *s, arg_VLDR_VSTR *a)
> +{
> +    MVEGenLdStFn *ldfns[] = {

static MVEGenLdStFn * const ldfns

> +    MVEGenLdStFn *stfns[] = {

Likewise, though...

> +    return do_ldst(s, a, a->l ? ldfns[a->size] : stfns[a->size]);

... just put em together into a two-dimensional array, with a->l as the second 
index?


r~
