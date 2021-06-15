Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp2768897lff;
        Tue, 15 Jun 2021 02:31:59 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxyhLYFYxAwZpp/iFzRHa3d80J4dP3s8tZN+pcaelHGVAj9U9GbbOapnehXsBPXcpm6JAff
X-Received: by 2002:a67:d584:: with SMTP id m4mr3906125vsj.27.1623749519562;
        Tue, 15 Jun 2021 02:31:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623749519; cv=none;
        d=google.com; s=arc-20160816;
        b=ynW1WF4L4XKRdKQEWJ9ZVyhOwz2Y40xTs4YcdIlpK6fXLgiPv1ICr0OQBdWkS6sSX8
         0rAK2A95VHxm8iXoSg4tinC3/bra5UBsaAIucVrPyRqKOTHyRzVs8fxegifQTE2XTb8s
         a+JyHRcPCPSlfZERPcIPOgSKPMDLU4iBLsINkUMYPh8NNaFq0buTrJuiB53YQYPjHeCc
         3bu/3iMQTbP0HQJ2ihR3st44MQ0mEn37Ua5sZi5LPlfjDxxBLJUJEFdqh7P0H+cAe+Ey
         xvlTTEok4mXPBKBj6mgA4GLffAdl+NZMSo/xH9wNfXEfu/t59fc1r43xAG4Uw5SqwPTG
         kpOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RhnyIJSVX8uEKXtyoOSwoavjixcHE5JLLaNhBIG+ZWU=;
        b=tLtjNwtmUVyavS4eAlxiZVopnvo6X2MgA3m/fpgZuDBaWt3iO6Sg8QEBie/LQiep+/
         D05xgeYok+f2crxoEmA6RDYEfHpJcyaBoxCMJgpoNFZk2yItoAKEqb5W282K79goFlCI
         Rkp9aQY9rU6fcLQwuJ/QwxaTPtKEMazoQmz8iGBt0VLF9vgf7l/zPcwxrCLyjmsayM8I
         kSod6YlSglcMKbEVfm0ozbyaevZH/G5R6qOAeW1fl1dXt9+SpzhzWOsBpZX01can9ucI
         NR2x597DRRR4vdSbBlS3jMSBDZjqpiJxT3+0CDYaX4FA0ROjTtgBiSSngdeVhwMyPxRT
         XF/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jLtmpgIO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m11si9203960vsn.382.2021.06.15.02.31.59
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Jun 2021 02:31:59 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=jLtmpgIO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60628 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lt5QM-0002TL-Se
	for alex.bennee@linaro.org; Tue, 15 Jun 2021 05:31:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55698)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt5Q6-0002OE-LS
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 05:31:42 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:34800)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lt5Q4-0001rm-1z
 for qemu-arm@nongnu.org; Tue, 15 Jun 2021 05:31:42 -0400
Received: by mail-ed1-x532.google.com with SMTP id z12so1391153edc.1
 for <qemu-arm@nongnu.org>; Tue, 15 Jun 2021 02:31:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=RhnyIJSVX8uEKXtyoOSwoavjixcHE5JLLaNhBIG+ZWU=;
 b=jLtmpgIOgetNOqQ7SyMso3152gDht20LL5E4mkTyPxhte7B/CVQuhhJn9I2NRehGrr
 gHNeQbG+FwHpe+cKLoSH+8nZN2f6W/E7rIqq04Kep8olqX+HE4sN9hiBLSxoJuwmLEBs
 P5TbmohkKLBNpRIdmK3EXpgvilZneqoLuBoai7Vz0Jb/gaCud6w55VUAyY92CcMPZZgw
 8eMxx8RNv6GpASW1wZ8QcJ+jYM9wsTLafLSEVQxHY4sNCJmoEk9yM2bd9RWd2OXHxmUP
 /MhLu+hcp8QPixTVr8Hs++DiVF/DXLUAnXAWikZqlg+jJxhHq5mXhvQT0Mv9jaHifvB1
 lJGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=RhnyIJSVX8uEKXtyoOSwoavjixcHE5JLLaNhBIG+ZWU=;
 b=bDz4/uxj8lkyByeWrXHvwZcVc3NlOB+RpyL+2FWKmEOKdVGQMq3Nwbvrq0ZrolPe/M
 VxSMJImdDs6tmYKnGNtO5lIb5a7DF+tv8iiWTmM33DLFJsWvJoF4E2UwbFn7IUxZnMbr
 QuJNGLBJPsCoPCp3rPoWH2CQMB4Ikh+IOGe6TRFenqYfMOlndWC0tkLC7jaqOl0leV9N
 5IyTrpSt44I8T4yGtf6gAR5uNCWx8G8HAMUefq8I93Cop36B19OprwG/pGwQuweaWFUt
 EtEfi32rMoaEY+5VAAsO0wCB/xOnYlTBByRFUwZx9Nb3klO3rzV166gMBQy2HnjDwZcU
 8VVA==
X-Gm-Message-State: AOAM531Wcswtmz7P8zW3w+pKuKd7JXst2WbY/5aEPa74xgJXduyc8NS9
 UQQR6OF1iwbt/xI1kyxh3i1qKMvsuAfo+FYWw/INQg==
X-Received: by 2002:aa7:d755:: with SMTP id a21mr22366203eds.146.1623749498257; 
 Tue, 15 Jun 2021 02:31:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210519202253.76782-1-agraf@csgraf.de>
 <20210519202253.76782-20-agraf@csgraf.de>
In-Reply-To: <20210519202253.76782-20-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Jun 2021 10:31:03 +0100
Message-ID: <CAFEAcA880Kgb5GtKEQQpnD=fAwfm1Cs1Sjfc4L5S0ETkjm-CWA@mail.gmail.com>
Subject: Re: [PATCH v8 19/19] hvf: arm: Handle Windows 10 SMC call
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
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
Cc: Eduardo Habkost <ehabkost@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, Frank Yang <lfy@google.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Peter Collingbourne <pcc@google.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6HnP+DnA2L1w

On Wed, 19 May 2021 at 21:23, Alexander Graf <agraf@csgraf.de> wrote:
>
> Windows 10 calls an SMCCC call via SMC unconditionally on boot. It lives
> in the trusted application call number space, but its purpose is unknown.
>
> In our current SMC implementation, we inject a UDEF for unknown SMC calls,
> including this one. However, Windows breaks on boot when we do this. Instead,
> let's return an error code.
>
> With this patch applied I can successfully boot the current Windows 10
> Insider Preview in HVF.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
>
> ---
>
> v7 -> v8:
>
>   - fix checkpatch
> ---
>  target/arm/hvf/hvf.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index 65c33e2a14..be670af578 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -931,6 +931,10 @@ int hvf_vcpu_exec(CPUState *cpu)
>          cpu_synchronize_state(cpu);
>          if (!hvf_handle_psci_call(cpu)) {
>              advance_pc = true;
> +        } else if (env->xregs[0] == QEMU_SMCCC_TC_WINDOWS10_BOOT) {
> +            /* This special SMC is called by Windows 10 on boot. Return error */
> +            env->xregs[0] = -1;
> +            advance_pc = true;
>          } else {
>              trace_hvf_unknown_smc(env->xregs[0]);
>              hvf_raise_exception(env, EXCP_UDEF, syn_uncategorized());

Where can I find documentation on what this SMC call is and what
it's supposed to do ?

thanks
-- PMM
