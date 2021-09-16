Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1075354lfp;
        Thu, 16 Sep 2021 05:28:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwPQB3I1FgyZMXxlx8zBgAPIB+E/0HrHtXaQ95G1TqYF7NHsKI1MDgAkRFgLelX9HZrHALW
X-Received: by 2002:a6b:f114:: with SMTP id e20mr4131635iog.41.1631795311540;
        Thu, 16 Sep 2021 05:28:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1631795311; cv=none;
        d=google.com; s=arc-20160816;
        b=iLLJBQLFVUGV9wup4QOP3GQRAJ9ZekCNGOqTFIs6t5nhCFwTORB20jz9lEjNZtiAP8
         rqZmLyWQMHFHe2bpxq0DAVxIWvM9FXsgcNL7YX0OS8lE55003VbaW8NhEv17W4OKWkwT
         NzDtWOZQ7gMQxrp2LIhy6TpVZcvqvg3UL9QCeJsFPICXNt1s7PbIT3G2I5Zc8ERWrBtS
         OMroWOcA33+68pil6S0mL3jt6UXr0gD20XiFdUnSUCsxu8eBf24nCb4EIpsTPrOafg23
         TELAST9O+xLTj7lNOj/5IhYY1pG1Mk0Wen7RzS7s6AbhLeqJLVit4qhyEaNqB6eF2F5u
         pjwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=JYaVzc3bsBvi8u7PdMACZ4Dg2H84QKVVlZpDhjNAW/Y=;
        b=0qpnXkwgtlTXerQc68a1j1eW9k5fHD6o3YKpJab/XfsN1DOsj2RrTHxy5qL8v+HsxW
         +Li6q9QgQ68unQ3XbI4aVPDxpY/HM3XOqeXcjNx35HMxQJktOKvupsLZ1OdIaOcHhw6f
         n2havVaqUKaMNi68qwa1NlSUextIiBTMgm789TTS5dHW0IzGKv2A7+Lr3yaylYeq63Xf
         JoYoppkzRc8wdiEvGNqqitlnlIefE1ZUqNxtUUCmAdNWjaaYfrIacDOqnw9rMfwVpLso
         H0q3vlp36hAMVjOF8mjFMi+X9k8kp6psty95TrHgNomsP0Iw0fYT1405mA8QlNU2ZV4t
         9O3A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mh1HiIHd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g19si2744232ilb.43.2021.09.16.05.28.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 16 Sep 2021 05:28:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Mh1HiIHd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52916 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mQqVC-0000Mg-Tz
	for alex.bennee@linaro.org; Thu, 16 Sep 2021 08:28:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqV1-0000MY-Q5
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 08:28:19 -0400
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430]:46716)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mQqV0-0006rn-93
 for qemu-arm@nongnu.org; Thu, 16 Sep 2021 08:28:19 -0400
Received: by mail-wr1-x430.google.com with SMTP id x6so9151381wrv.13
 for <qemu-arm@nongnu.org>; Thu, 16 Sep 2021 05:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=JYaVzc3bsBvi8u7PdMACZ4Dg2H84QKVVlZpDhjNAW/Y=;
 b=Mh1HiIHdHpcYyd7dMgpWJSBrHJMU94ahWOcXx7h+YKdJfyJcgpqf3ruGneF5pIUeNY
 jHM7ESz5P5f3/Hxv2wyOdMM6aaWL3H2anvBn8ldaYEOZkh0sD0Lc2txtiaWuXzJQC8ZC
 6CTHyY06CoafxZRUdGJ7VvQ7dK/pfNhuKhSWIIIErkN18OhH2MSpR8D0UoDeQEYHYCh1
 Ile+pgUf3y1CsChBmPpK7rz2VoYRJsRAGK068wdx9sSd6fHZTMlPJPG1ZLTnizTFRbEt
 j7/X5a6rAr5i5I2HoH1gnEjxNyDYZTY8IUJqyWXMgfUykw40PfMuhhb6uSD1Ouq60jC6
 NwKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JYaVzc3bsBvi8u7PdMACZ4Dg2H84QKVVlZpDhjNAW/Y=;
 b=tPvrTAlcUiAyRLKId+E8Sb/3hu0SzXUMTEAk2Jggt7PF4bcduMaKeThyFtWCnLB+Zl
 5k2gSYHdKLuW4uQm2uyE1KQos+g5j8OHrGrzVuFheK2V8wpJ4DxWfOTvckhgUYBdDSIA
 SIqj4rYaGfkOklgR7Z5mL1RK1L/RdXwhZ/UoRdCAys+zVtI50snBibBpXV/iPTcTDX2a
 XH/vZElI0nmyh1RzEL+PpzdKqKpM6JvO7ltQNLkeyCaTIiDTS+L6Wnz3epSXP6tyed1T
 OechPJYyQhYN9JEHpuEx6368etG3tE6YzbtfRTcFj0Ci7eeK6ZN3W/m4H+1jyiqGHK7C
 Z0fA==
X-Gm-Message-State: AOAM530QDVlYzn/VSmbbAI3LtjY8BuaQolZNySHDZ5XHfrBZ4xBlA7Iy
 lYAe5WHVKDu9bvEIGhssf0akoa09QvxfstYjdss+Ww==
X-Received: by 2002:adf:f185:: with SMTP id h5mr5869605wro.302.1631795296673; 
 Thu, 16 Sep 2021 05:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210915181049.27597-1-agraf@csgraf.de>
 <20210915181049.27597-8-agraf@csgraf.de>
In-Reply-To: <20210915181049.27597-8-agraf@csgraf.de>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 16 Sep 2021 13:27:25 +0100
Message-ID: <CAFEAcA9JWdh_y4SPtnNOdywLkyN-L4vAqfic_LsxtgCgdTSyPQ@mail.gmail.com>
Subject: Re: [PATCH v11 07/10] hvf: arm: Implement PSCI handling
To: Alexander Graf <agraf@csgraf.de>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::430;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x430.google.com
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
Cc: Eduardo Habkost <ehabkost@redhat.com>, Sergio Lopez <slp@redhat.com>,
 Peter Collingbourne <pcc@google.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Cameron Esfahani <dirty@apple.com>,
 Roman Bolshakov <r.bolshakov@yadro.com>, qemu-arm <qemu-arm@nongnu.org>,
 Frank Yang <lfy@google.com>, Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LzVqYEgfjg50

On Wed, 15 Sept 2021 at 19:10, Alexander Graf <agraf@csgraf.de> wrote:
>
> We need to handle PSCI calls. Most of the TCG code works for us,
> but we can simplify it to only handle aa64 mode and we need to
> handle SUSPEND differently.
>
> This patch takes the TCG code as template and duplicates it in HVF.
>
> To tell the guest that we support PSCI 0.2 now, update the check in
> arm_cpu_initfn() as well.
>
> Signed-off-by: Alexander Graf <agraf@csgraf.de>
> Reviewed-by: Sergio Lopez <slp@redhat.com>

> +    case QEMU_PSCI_0_2_FN_SYSTEM_RESET:
> +        qemu_system_reset_request(SHUTDOWN_CAUSE_GUEST_RESET);
> +        /* QEMU reset and shutdown are async requests, but PSCI
> +         * mandates that we never return from the reset/shutdown
> +         * call, so power the CPU off now so it doesn't execute
> +         * anything further.
> +         */

QEMU coding standard wants the opening "/*" of a block comment on its
own line.

> @@ -898,14 +1011,29 @@ int hvf_vcpu_exec(CPUState *cpu)
>          break;
>      case EC_AA64_HVC:
>          cpu_synchronize_state(cpu);
> -        trace_hvf_unknown_hvf(env->xregs[0]);
> -        /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
> -        env->xregs[0] = -1;
> +        if ((arm_cpu->psci_conduit != QEMU_PSCI_CONDUIT_HVC) ||
> +            !hvf_handle_psci_call(cpu)) {
> +            trace_hvf_unknown_hvf(env->xregs[0]);
> +            /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
> +            env->xregs[0] = -1;
> +        }
>          break;
>      case EC_AA64_SMC:
>          cpu_synchronize_state(cpu);
> -        trace_hvf_unknown_smc(env->xregs[0]);
> -        hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
> +
> +        if (arm_cpu->psci_conduit == QEMU_PSCI_CONDUIT_SMC) {
> +            advance_pc = true;
> +
> +            if (!hvf_handle_psci_call(cpu)) {
> +                trace_hvf_unknown_smc(env->xregs[0]);
> +                /* SMCCC 1.3 section 5.2 says every unknown SMCCC call returns -1 */
> +                env->xregs[0] = -1;
> +            }
> +        } else {
> +            trace_hvf_unknown_smc(env->xregs[0]);
> +            hvf_raise_exception(cpu, EXCP_UDEF, syn_uncategorized());
> +        }

We seem to have ended up with an odd asymmetry in the way the
code for HVC and SMC has been structured.

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
