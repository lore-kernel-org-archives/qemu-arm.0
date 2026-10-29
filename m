Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751F9606A31A
	for <qemu-arm@archiver.kernel.org>; Thu, 29 Oct 2026 14:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=WDL4As5i
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMQkA-0005c7-Br; Thu, 29 Oct 2026 10:04:38 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMQk7-0005bW-E5
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 10:04:35 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMQk3-0004EB-VF
 for qemu-arm@nongnu.org; Thu, 29 Oct 2026 10:04:34 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-8b0a28a720aso22498147b3.2
 for <qemu-arm@nongnu.org>; Thu, 29 Oct 2026 07:04:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793282670; cv=none;
 d=google.com; s=arc-20260327;
 b=BfGA6vfJNkjma2s1Hp7OCrOCdqOexqsu36LW6nu4CL7GjS47r8Dn2dTmy1ySkQ1j3i
 WQvEGeSHbAj+7Y8TfEKQ2Eth2K9mNfkpiYluZoii+5hddMRBWQhvuqoC3PXHJrJON7nR
 J837dmRBzzci44gGgCONfyIgIQ9OCSr94i20F9YRJpdvS4noWIUYdiRSobFngvv9Hora
 NCNxuTIPnujG+lgemEo64xwdnS/FXXGOrywpZB7poSQhVvTNe3ml3QoclKjcFVPV9Xcp
 bIdfvApBsj7A50twKy/fhxw9m5tP9PwgPO03q87houo8XnSKuir13w2hJMe2xtOKe7hj
 eUPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=6Msv8WnU8v4xKPNjuWlPYWq91lci8T4e3AS7OgMk/Ig=;
 fh=vilMZHA5aZUy93hrLz42PaPzxEGMoj7YD7IxW/YvFIY=;
 b=g5cKa8P0SBKYUdZGfeEMq7ifrNBfeeBZ3r8jWhtbco9T2oqfEiRYxhaG7Uuu41noGn
 jyAey36AR5Ct3GfMLmMh4v8jghAhW54jdA9lOdNRYbpQRdVgE2x0bzbXun5ljxgJGEVm
 fywdRJcmxWyYAsmCMyhtLZeM1RMR5xjvqEl/mz7/UKWe+NurUgLJ5IgRzl3VZu6s9tkz
 uCvtX79nSd2LK2HSGMUhhhun6VvgS89GlLloh+HRxcj2iqRvLtG4l87pyJrV9NRAELZK
 hxx0p/kOd8nCGrJqZZQkvVnrXyCk2DtDch91fhpMSV7GE4MM0U8iaalARtW1qtz29KMx
 4ZlA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793282670; x=1793887470; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=6Msv8WnU8v4xKPNjuWlPYWq91lci8T4e3AS7OgMk/Ig=;
 b=WDL4As5i1tvKhlxR713zOjYggqaiaAMFrYMRbaLaD8nUh0iejvrxc3EiXaX+jQVvn1
 2eGO0LOcKY8A0ag+Ll2bZma57dKrLmmCj8aI0gdmYjc+Ff9IY0tFCppOsUtNWg929zMt
 OirvG+dcCkR4WWx1vx4u2ybWyNdN3Trh9KHH5ZYf7y9clbZigXmQb1eFgX+1uu2s1sIn
 12iRHjYqe+bEHD2rUsFjQArbW7Ic/TECt89R4UUhE72kUi/4xeSdH2An7nQTQKJdyZY0
 wwT6Zy0v8WS7PR2aUIsA32ULzpMTD2P5FRWxrzAEo8MycEmoyu0Ap6KKRVSXK/Rrxp2r
 Fx7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793282670; x=1793887470;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=6Msv8WnU8v4xKPNjuWlPYWq91lci8T4e3AS7OgMk/Ig=;
 b=IQ7qQ4axuVMGE6mzRgGuRlmqCDRQpMHR9CoiNFP2XDouUrgKVHbhCtRUIAbz3mSr+J
 VuJlr1adqLRiGQm4ct2gp979imYXln3BQbd6cBiyjsYE7TcXaDpAbhstYeN8hzTYmOKy
 7TpHkYNY0hD/iXYyBJpcLtmDQLDgCNaiMhRKpfvgfT8+kvNN4dJ2bxBkdYcAL8Tpv7Vt
 /frJJXRZMsGnqxz15MvI991tAy3RmVa2XAfe8TJZM48EXoNuO8Cl14Um/7485XLy4xmP
 yIcZ8ZabqtvdaGGz56UjliDs6BmpN9yUGBMjVs2vXzCcEp3GKlArEtSvFTzhhA7rKGBU
 xhJw==
X-Forwarded-Encrypted: i=1;
 AKwUvByrlAZJ8A3Ez+lhkWlvgF83CPdGp9j8xwpEg+OzK8Es+3sU67dLfoZDphBtUhexeXlXTzsQwyCo7A==@nongnu.org
X-Gm-Message-State: AFq9FYJxDUg4ScQejJxUTQcskFCUELUxK7ApcCgUVFwSefliy9Xj9Wqf
 XhV+Y8s5xhCIKFF4Xpco87rSt5bStZMD7XkIc/E4yr3wCbYXv9JQ6X+DytTE5A3iY1TZA08loW6
 OPL2ae/n6VP/kZE/KvBzoPMqbJ6y2/1VfJfDr/lrlyw==
X-Gm-Gg: AYBFou2meejXOPGLPoz3PBTU2lwtNkNM9D765O3sZJwvWUEoAXZR4caMxVr9L23n4aW
 R5w2SQ+tPLX1X3o/YerJMrY3X+b3+bbvqceMWbYhY/U4DUFA1iSIHplj5PXSDHFiJtzwoW10CP1
 TmYRUYT16OK5itHga/+IczKSVYyT2XrsEcv9uoUgqN540GcKw1Wsh10+AXP/W2JYbyV+iwhc6S5
 KWo3veR18do/eXUTPvhY8iGfCP5taOh/mnDQEi9dQ3JK3gys5cVBRHv0d99ENwBP4Uu0/4ZFR3N
 fJtU/z8J1w3rNGxSwYnq0BJhWMx57tZuvzdjoZHWoCf4Cth7YpqGHICqFNyKwzEuUDVQzuxulLq
 xHbiINrw+8c1kU8MbUZpF42iLmk6YUZbcJ29jm3j6ZCOdq39mbEIHO1DEMCnzrvHNnsWh/E8FdP
 TB2gWC9MWKlFmzzSrifPfT
X-Received: by 2002:a05:690c:9517:b0:8b0:cc24:f7b8 with SMTP id
 00721157ae682-8b1b5ba8243mr32649757b3.69.1793282670125; Thu, 29 Oct 2026
 07:04:30 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261027120135.53048-1-mohamed@unpredictable.fr>
 <20261027120135.53048-6-mohamed@unpredictable.fr>
In-Reply-To: <20261027120135.53048-6-mohamed@unpredictable.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 29 Oct 2026 14:04:18 +0000
X-Gm-Features: AclHuK_TrYWo6XQkouv6VomuD4cP7uBtZoxw3HgBLjRLUwbZDjbUeC3zMuJrp_A
Message-ID: <CAFEAcA9y-AwrGSgeqhL04jFdSUmncNS-RBPmrjyzVi_Wwnn_yg@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] hvf: gic: sync the CPU interface during a vCPU
 reset
To: Mohamed Mediouni <mohamed@unpredictable.fr>
Cc: qemu-devel@nongnu.org, Alexander Graf <agraf@csgraf.de>,
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_PASS,
	SPF_PASS autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, 27 Oct 2026 at 12:01, Mohamed Mediouni <mohamed@unpredictable.fr> wrote:
>
> When a vCPU reset happens, we should also
> reset the state of the GIC CPU interface.
>
> Otherwise, reboots might not work as expected
> during some circumstances.
>
> Signed-off-by: Mohamed Mediouni <mohamed@unpredictable.fr>

> @@ -629,6 +640,7 @@ static void hvf_gicv3_set_irq(void *opaque, int irq, int level)
>  static void hvf_gicv3_icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
>  {
>      GICv3CPUState *c;
> +    run_on_cpu_data data;
>
>      c = env->gicv3state;
>      c->icc_pmr_el1 = 0;
> @@ -649,6 +661,9 @@ static void hvf_gicv3_icc_reset(CPUARMState *env, const ARMCPRegInfo *ri)
>      c->icc_sre_el1 = 0x7;
>      memset(c->icc_apr, 0, sizeof(c->icc_apr));
>      memset(c->icc_igrpen, 0, sizeof(c->icc_igrpen));
> +
> +    data.host_ptr = env->gicv3state;
> +    run_on_cpu(env_cpu(env), hvf_gicv3_put_cpu, data);

This isn't safe to call here. run_on_cpu() has an extremely
nasty beartrap built in, which is that it will unlock the BQL
while it is waiting for the queued work to complete. The
code that calls these register reset functions doesn't
expect to have the BQL dropped underneath it, and there
might be various race conditions that happen if it does.

I think the existing use of run_on_cpu() in hvf_gicv3_put()
is also broken for a similar reason.

Put another way, run_on_cpu() is extremely hard to use
safely; I think you can only really use it if you're calling
it directly from code that was itself called with the BQL
initially not held, and which is therefore dealing with the
BQL directly and can be careful not to assume that state
that it looked at before the run_on_cpu() is still valid
after run_on_cpu() returns; and if you do use it like that
you probably want clear commentary warning about the
potential problems.

thanks
-- PMM

