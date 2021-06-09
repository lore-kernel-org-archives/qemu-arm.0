Received: by 2002:a19:4310:0:0:0:0:0 with SMTP id q16csp4940710lfa;
        Tue, 8 Jun 2021 18:06:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx9pT26OBHfSTaPYZaYJSmBrojnE8jqgv3Y67lRoLizNM/ZUOtCK8smPNEMxIEwoejDlzbS
X-Received: by 2002:a67:dd09:: with SMTP id y9mr3119870vsj.36.1623200763965;
        Tue, 08 Jun 2021 18:06:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623200763; cv=none;
        d=google.com; s=arc-20160816;
        b=WZZmj0nPhYGB+g/ReQHmi2Ymyk4NMTTuYU0UJ/OGMFnEMA31cMJi6MyMGQCmoUoXi7
         MmXaIH2zZrzsCeRZio/gXyI8dElrfftNFREpafckgNkMczvf+ZXGAC/W1DUy3pRTidHo
         YjMpvgjk6OySE56XBBJuJWSL/i1oAmDC6h9TxRyseoy+HMAcdMlTVoYfC8kHohhXDMkc
         SnMWrTfuVLGm6VDWCAJee8ICc66HN6RcyiNP9UDidD4BX16FROZK/MKT7RWbOvpD7t77
         JpaICx6UCp6aGCruAuzBLOp2PZVW0oaJvZkbIJOfVZs54O8fYsTLuf6YIwlJHtIqYnDM
         xGHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=EeVrr4AEboVATcF3XpcHFIKof1+wOaT0mQCL24NqF1U=;
        b=ppsO8crA2w0NFKmQqda8mfelgiyUAzckpoYL/vWuuWBthpiXP4Xfb2uCIAEqeSlqb4
         vQXPjSxwRgUaQUFNxRa1nDAR9eD7361q1GDv8D6iftMio03JVfnch4A9W0j0fgAueKNr
         gU2S/lv5pOEpdG6+MtxI2Qxf8HsYdsR9sTCqJMT/nSQP0Wnyk6boOFV4CVMJcHjCeX22
         TpesZskc4q1YMs0PFKYigbr8rejJgW7JRLbj5cMbxMsCIPEnM84vSXAj6+DO8oycLx8b
         Df7zCdtsP9JJ86+cGS8vIRBrP3k+hSJ2Jd59pZvaJi717xmFICR+JbpvTiPYW74YnOR7
         BHeQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h+7Cyw0d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11si4162713uap.1.2021.06.08.18.06.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 08 Jun 2021 18:06:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h+7Cyw0d;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49406 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lqmfT-00036f-6D
	for alex.bennee@linaro.org; Tue, 08 Jun 2021 21:06:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41036)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqmeg-0002K6-03
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 21:05:14 -0400
Received: from mail-pj1-x1034.google.com ([2607:f8b0:4864:20::1034]:35537)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1lqmed-0004Oj-7E
 for qemu-devel@nongnu.org; Tue, 08 Jun 2021 21:05:13 -0400
Received: by mail-pj1-x1034.google.com with SMTP id
 fy24-20020a17090b0218b029016c5a59021fso423127pjb.0
 for <qemu-devel@nongnu.org>; Tue, 08 Jun 2021 18:05:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:references:from:message-id:date:user-agent:mime-version
 :in-reply-to:content-language:content-transfer-encoding;
 bh=EeVrr4AEboVATcF3XpcHFIKof1+wOaT0mQCL24NqF1U=;
 b=h+7Cyw0dGf5wAxpUcOETmWo7QHrqShh70aaquqa1KiAGm5AJEg1tM9g1G23j3fuzLa
 16kxpa5hih8pPLZzmm4/YAJd9GfBjpWsEFSAQSZVGuxhwN1Pd3RWdn+MWfe4qFh92vDY
 DJdsqwJhlDfaVD8FvMZdks81I0fIKHMiMz1pCL0XkRpPsNN6Oi+FjRyph7tUwpNYMZkc
 vn+RCLrbDm+NOTlPZdvNIQ0VDwcSPSxsH1ok9ryvEuRAs/XArh43S4K0Px/AxRIpg4Wm
 vIIEgnpeirlCd+AuN3CUQXevAciLMbgRtztPpzWPOH0/qsz4OLeqYMiSAgElVA2PwCBD
 ppsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=EeVrr4AEboVATcF3XpcHFIKof1+wOaT0mQCL24NqF1U=;
 b=eoHGAU223qys53UYW7mBNYf21kLFMKT0hgksHSCAwxIqzBNE5Ex8y6+U19tFi4Oehv
 nI4komewBHIkT+CzOoTZNxbHGRR7AjOuC+QwVkvI+YtjcIl/gW1PITdgB9PDOp3hOgsF
 0fNal0aIm93q+WUDphUoFVkdhRVgSDC/22YW+vqGcqvEsCzzfM/QM4zT1hqzqaFd6Qfk
 W8aIT5ROj5t5Cc/Gp29ZAOxAasxO+M9GH+eUXbk+SYNEbtBHBipbYm1GTWBDll3W7MDi
 Y/gU0pJzOfa98CQPuUPr5p9DOKkoPhx2nKYRnF9O6aASIgnAbD5o+tWXg3en2mVseVW3
 xwfg==
X-Gm-Message-State: AOAM530OBGVIakSgQgbYmuXSQ/CPnCxx2ITBEYXNDbdfiBDFqNFxgVUX
 UzgeZd0D0rGuF7W5UkG4VhbTVsdGFRauAw==
X-Received: by 2002:a17:90a:e60d:: with SMTP id
 j13mr28040837pjy.112.1623200709352; 
 Tue, 08 Jun 2021 18:05:09 -0700 (PDT)
Received: from [192.168.1.11] (174-21-70-228.tukw.qwest.net. [174.21.70.228])
 by smtp.gmail.com with ESMTPSA id
 o9sm12653074pfh.217.2021.06.08.18.05.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Jun 2021 18:05:08 -0700 (PDT)
Subject: Re: [PATCH 32/55] target/arm: Implement MVE VRMLALDAVH, VRMLSLDAVH
To: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-33-peter.maydell@linaro.org>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <ff13c13a-0014-4930-5a8f-813818d6fcf1@linaro.org>
Date: Tue, 8 Jun 2021 18:05:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210607165821.9892-33-peter.maydell@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::1034;
 envelope-from=richard.henderson@linaro.org; helo=mail-pj1-x1034.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: +GuRL+6l+B11

On 6/7/21 9:57 AM, Peter Maydell wrote:
> +#define DO_LDAVH(OP, ESIZE, TYPE, H, XCHG, EVENACC, ODDACC, TO128)      \
> +    uint64_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vn,         \
> +                                    void *vm, uint64_t a)               \
> +    {                                                                   \
> +        uint16_t mask = mve_element_mask(env);                          \
> +        unsigned e;                                                     \
> +        TYPE *n = vn, *m = vm;                                          \
> +        Int128 acc = TO128(a);                                          \

This seems to miss the << 8.

Which suggests that the whole thing can be done without Int128:

> +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
> +            if (mask & 1) {                                             \
> +                if (e & 1) {                                            \
> +                    acc = ODDACC(acc, TO128(n[H(e - 1 * XCHG)] * m[H(e)])); \

   tmp = n * m;
   tmp = (tmp >> 8) + ((tmp >> 7) & 1);
   acc ODDACC tmp;

> +static bool trans_VRMLALDAVH_S(DisasContext *s, arg_vmlaldav *a)
> +{
> +    MVEGenDualAccOpFn *fns[] = {

static const, etc.


r~
