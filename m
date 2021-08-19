Received: by 2002:a19:e212:0:0:0:0:0 with SMTP id z18csp339410lfg;
        Thu, 19 Aug 2021 06:42:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJza5rTqOyKmXYcg1zhTEf6v9xSqeNIN/WkbswauUfms2Th71VI+R3++zck2Mzl7PXRY9Xww
X-Received: by 2002:a1f:c9c1:: with SMTP id z184mr11215852vkf.7.1629380529826;
        Thu, 19 Aug 2021 06:42:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1629380529; cv=none;
        d=google.com; s=arc-20160816;
        b=Sv07x2AlfFcHaE+/s0YXHoydtPDD9y7MEUX7ESCF9Rh/NUWvXxUN7B93hUGdhSiq2a
         AyjMQZTflfepUdDiFlFC77N37kYeGhdhzFsVhr+at3NKLVAfu4gwUeN/5WW9ys4TfVxd
         5Z2bpsSLVtXhDlSqtmxEfVEvm8pVjvLfrRhE3JSU+xaiy0mq5g79KyekNZhwVcyCVUlW
         CPhEIz5qqDTK6lAVBULkvE7HfAkhHRA6tRVSJt+fKZQ9Jbu8k9Umk7meq+yW68pToRaC
         JN0nEaov+sQ+jbwG2dHxdCovu67hR0VtxOBIRmlVROMEIT7TZv5PZ0PWJpEMnb0rug5Z
         7gdQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7Zfur643o1ACOiDICbxUWdVXA/wTCxhPbgbWj4h2t6s=;
        b=F7lJLiHO9pqlcJDPXtd9AU5ZfNJc8M/iItuv4ePFmuDvOzmwrinoaca5OxXe3A1f+t
         XdVgruO0VuQg2y2L5s1mlzmnQ7Xo2GHl/uGTgLyiQCbSxEp+peMc8Cs+L7aJoBW75G4g
         64o3Ge2ki9L5gkp5PaD6dmp7ZqqWOPmLF9jPuOmOOdQ/0lPeRhWauDE+9guBiuLvXLEW
         gq7URHkJPwvaoqHG/ys3OZDn/u6l01v75XRmIKhvlkxpXoLuGNf17LZtOYvvCFdmAPVn
         m2n+gucGmS4auAxiXVNnaEGf7WFY+ayO4usnZGvAVq1Yq8GklpaC3wB9p3f/cPdiLraG
         PuBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NrjiztVO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u12si1611001vsi.186.2021.08.19.06.42.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Aug 2021 06:42:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=NrjiztVO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:56574 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mGiJ7-00013a-6f
	for alex.bennee@linaro.org; Thu, 19 Aug 2021 09:42:09 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45168)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGiIg-00010c-NU
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:41:42 -0400
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d]:46919)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mGiIe-0005t2-Vr
 for qemu-arm@nongnu.org; Thu, 19 Aug 2021 09:41:42 -0400
Received: by mail-ej1-x62d.google.com with SMTP id gt38so12920923ejc.13
 for <qemu-arm@nongnu.org>; Thu, 19 Aug 2021 06:41:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7Zfur643o1ACOiDICbxUWdVXA/wTCxhPbgbWj4h2t6s=;
 b=NrjiztVOwaWnsRk+3qbVKFClGIyGBJJC8brT1msO3rM7A43DRViEIsaBr6t3F28gaW
 J55ftSR3BCxxeddADnewTvpG4bVMinxGtsBawY5R8zXuNqigA0tdadJKQJ67XSx9qcJU
 vWh4cEwZRxczyZedn++aDX/auURNPS0fLNJxW3/mw6egjbRvyPqQ+wxoyGeTB1y1n8gq
 yF3OQ1Nt9A0aMpeUDghe+EjcS9n/YhLhxqY2haWRSsKGMJ+LWSfyfv2GvSxGKorztqWr
 NBhdu75N+iPXjboW5uOjuRjLsVXs+7MmAfQMZ3rUYaFcHdkWTpKgUf7v1mlN3hnhMPuG
 DR8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7Zfur643o1ACOiDICbxUWdVXA/wTCxhPbgbWj4h2t6s=;
 b=AxmIEpQ4P78QMW6jbUI+fA6ceknszRSU51n0UEJ72Jqh0yAIGqcDiEv0K8hrXBj10p
 QTzxz9TzXO+ZMDfgWiSC2qyRXVtoPV4vBvc3cSRHGQgVWGu7XOp1GZK3UahwGAgnXwJH
 yZw2l7enfX0081jIcXpockhp2DnychqE76t1j3zSZkfDjQN0kQM5a3UWBgaYrPOyl6pD
 IfwnQqpE+R1g2CwQcwwrBSJ9M6TdGBheKeNXdleJfHUtUhZmnzDpJzK4tmelA9MfJNtw
 zhSqKeOQHvYqL/5/JrUzcjfmMHsTObMW2VpQpN4dKyRrPEVomxUeLwVgm+S+oy7G8REl
 YQKw==
X-Gm-Message-State: AOAM532FfIxM5/u/a41NGUwvKuHI6nQecnWVKDtPe2SFcmeftwXDMnXA
 wzN4YXSIijT/C6QjpIez/N+lvwNe/OhRQvLJzkS5KQ==
X-Received: by 2002:a17:906:aac7:: with SMTP id
 kt7mr15835594ejb.4.1629380499314; 
 Thu, 19 Aug 2021 06:41:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210818010041.337010-1-richard.henderson@linaro.org>
 <20210818010041.337010-4-richard.henderson@linaro.org>
In-Reply-To: <20210818010041.337010-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Aug 2021 14:40:53 +0100
Message-ID: <CAFEAcA-v6z9UTbmdHqMugbtqv1n92SJ7EFGM8Gnk+_90FMyoBg@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/arm: Take an exception if PC is misaligned
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62d.google.com
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bD4fqLV6k3lk

On Wed, 18 Aug 2021 at 02:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For A64, any input to an indirect branch can cause this.
>
> For A32, many indirect branch paths force the branch to be aligned,
> but BXWritePC does not.  This includes the BX instruction but also
> other interworking changes to PC.  Prior to v8, this case is UNDEFINED.
> With v8, this is CONSTRAINED UNDEFINED and may either raise an
> exception or force align the PC.
>
> We choose to raise an exception because we have the infrastructure,
> it makes the generated code for gen_bx simpler, and it has the
> possibility of catching more guest bugs.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
>  static void arm_post_translate_insn(DisasContext *dc)
>  {
>      if (dc->condjmp && !dc->base.is_jmp) {
> @@ -9500,7 +9504,25 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      CPUARMState *env = cpu->env_ptr;
>      unsigned int insn;
>
> -    if (arm_pre_translate_insn(dc)) {
> +    /* Singlestep exceptions have the highest priority. */
> +    if (arm_check_ss_active(dc)) {
> +        dc->base.pc_next += 4;
> +        return;
> +    }
> +
> +    if (dc->base.pc_next & 3) {
> +        /*
> +         * PC alignment fault.  This has priority over the instruction abort
> +         * that we would receive from a translation fault via arm_ldl_code
> +         * (or the execution of the kernelpage entrypoint).
> +         */
> +        gen_exception_insn(dc, dc->base.pc_next, EXCP_UDEF,
> +                           syn_pcalignment(), default_exception_el(dc));
> +        dc->base.pc_next = QEMU_ALIGN_UP(dc->base.pc_next, 4);
> +        return;
> +    }
> +
> +    if (arm_check_kernelpage(dc)) {
>          dc->base.pc_next += 4;
>          return;
>      }
> @@ -9570,7 +9592,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
>      uint32_t insn;
>      bool is_16bit;
>
> -    if (arm_pre_translate_insn(dc)) {
> +    if (arm_check_ss_active(dc) || arm_check_kernelpage(dc)) {


Is it not possible to get a misaligned PC in the Thumb case ?

>          dc->base.pc_next += 2;
>          return;
>      }

-- PMM
