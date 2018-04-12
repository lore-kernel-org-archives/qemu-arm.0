Received: by 10.28.71.155 with SMTP id m27csp2131875wmi;
        Thu, 12 Apr 2018 09:54:58 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4//CA3dgXWHMmi3k1CkobFm7+Y0wtesJI8Jo+DpIzPe6cSSUznRdRD8bl+GLw0PxC2pZXl0
X-Received: by 10.55.239.5 with SMTP id j5mr2213474qkk.105.1523552098020;
        Thu, 12 Apr 2018 09:54:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1523552098; cv=none;
        d=google.com; s=arc-20160816;
        b=pZxkdl4mUQVWjSKlvoJnWi1iOPFyvgBZBDTOscu4bevzXR4le+clpKFyNTdbHYnszh
         Z29X6ZWymNTYnapub55CVLmMo78G8/XmC3NCO3Lm/HpkOMyns2+nWub69/s2s5n6kG/0
         39MwB21Lpoe5cyK29FntILizjjQTp7W4EZacEdMZP76cj8iqFPdekKJZJKTfEhWx+AeP
         Uroqv471nL0A8ejnKjTEHUpJNFQARwyU3biynrEWsb5SjvOrRrjyxwYcfUsTFEfH5+VU
         n32Albc/Nzmn7yvJ9wrOKsVAB1S4AtGLQHecRNaCFyoR/YkoyzFeVhrC76b13Yg2qfx3
         4GrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Uzco1iHPnYa21xBymfIHLau9KFhcSShhpADne77MnS0=;
        b=VY1svvSHA3XYXAdtuwkvjd5v8Bwr7cEqcKIA8AmTquq3i+d+++i0tqvfhtt4lvPoFJ
         x36jYr3Je9HUaSspMlSlUtLJkfAh4As6YrJD7ColOrwDB/nVZcvzQdNI+6LSp/kx51dU
         dvzL+tGpP1BwSfbMvowEePB3THyq+O4+1cJvU9bS2LIAcxy+1bSeR3S+w9mclgIFXipp
         ULcb8Iy/StU/0meXsKN7QeFskBIPDTwLm25R3MInf/KnJEhZCqQTJbfAzagh7yEoXkba
         rojT5BxQq7i5o8amvkqDlsIk0tdvGpk0ECPDBRptNYYhM7feFiZRx+eZK5lEVGBUFEVP
         du9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z+0jIzCb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id e94si5587678qkh.27.2018.04.12.09.54.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 12 Apr 2018 09:54:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Z+0jIzCb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54479 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f6fUv-00079J-H7
	for alex.bennee@linaro.org; Thu, 12 Apr 2018 12:54:57 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41239)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6fTt-00061w-KN
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:53:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f6fTs-00019z-KS
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:53:53 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:42177)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f6fTs-00019c-ER
	for qemu-arm@nongnu.org; Thu, 12 Apr 2018 12:53:52 -0400
Received: by mail-oi0-x241.google.com with SMTP id l190-v6so5815297oig.9
	for <qemu-arm@nongnu.org>; Thu, 12 Apr 2018 09:53:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Uzco1iHPnYa21xBymfIHLau9KFhcSShhpADne77MnS0=;
	b=Z+0jIzCbadKRJqubwiIQA3lrrMHWjqIoDPcMi9fCB4U5MNwZyMOyBhO7oo4JRMNWPB
	vsYYv5KYTEMVGrmThr8d94hCEu2/y7vAot4oVbJ900d01M1lFjUx/OGS2GIY+5nnICaK
	fwhUFAmlME5w+gdyEiLKjFsPROVBbH2Mx01wI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Uzco1iHPnYa21xBymfIHLau9KFhcSShhpADne77MnS0=;
	b=UO25DoocO4dKU8kOLvMijqCTJsVn9L3xhztuRYKy4EuLHfYYxjol0eEGtaGtbAZ6JN
	dRTDU+4FAX40oo8CmkHKRKPl5FWYv6q18clKocK3+WXIA6FD3jqqBnio2ITgVT/EuxiV
	PHuH4v2jiyTYF22zoBdbC4OFyOjcMY69PDAfJBJWZ3hlsw4cdXF/DfaCrMrPjhQRwSuY
	wjNKdqLonvgWVQ12BHLIdbgUO3UdLUAjUSXzeI/SZ1m5m4KsBCxi2f9y+HcdGpHrrgSx
	1739Mw9K+zKWM7KDGOF61ivBLMoOBxEcCQK1HhYnoqRgsgMDiOBzdi+m1BMnwpnpUUhp
	lz5A==
X-Gm-Message-State: ALQs6tA8SbcThn4QH2o38FR8yE38f+Lf3oxoby3d6ikUK8S6L4jopg3S
	yPpVfEyu7ZyJNe569pGKwjxbBsXAhRl5NNUS1JelVA==
X-Received: by 2002:aca:1c7:: with SMTP id 190-v6mr6562174oib.80.1523552031645;
	Thu, 12 Apr 2018 09:53:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Thu, 12 Apr 2018 09:53:31
	-0700 (PDT)
In-Reply-To: <1521232280-13089-11-git-send-email-alindsay@codeaurora.org>
References: <1521232280-13089-1-git-send-email-alindsay@codeaurora.org>
	<1521232280-13089-11-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Apr 2018 17:53:31 +0100
Message-ID: <CAFEAcA8XARzPc-YEoQVQUEoV2gL+ZOLsqzxhh36xzqjXZXniPw@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-arm] [PATCH v3 10/22] target/arm: Allow EL change hooks
 to do IO
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MqQ0XqQ9l78w

On 16 March 2018 at 20:31, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> During code generation, surround CPSR writes and exception returns which
> call the EL change hooks with gen_io_start/end. The immediate need is
> for the PMU to access the clock and icount during EL change to support
> mode filtering.
>
> Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> ---
>  target/arm/translate-a64.c | 2 ++
>  target/arm/translate.c     | 4 ++++
>  2 files changed, 6 insertions(+)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 31ff047..e1ae676 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -1919,7 +1919,9 @@ static void disas_uncond_b_reg(DisasContext *s, uint32_t insn)
>              unallocated_encoding(s);
>              return;
>          }
> +        gen_io_start();
>          gen_helper_exception_return(cpu_env);
> +        gen_io_end();

You don't want to call gen_io_start() or gen_io_end() unless
tb_cflags(s->base.tb) & CF_USE_ICOUNT) is true.

(Ditto in the other cases below.)

>          /* Must exit loop to check un-masked IRQs */
>          s->base.is_jmp = DISAS_EXIT;
>          return;
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index ba6ab7d..fd5871e 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -4536,7 +4536,9 @@ static void gen_rfe(DisasContext *s, TCGv_i32 pc, TCGv_i32 cpsr)
>       * appropriately depending on the new Thumb bit, so it must
>       * be called after storing the new PC.
>       */
> +    gen_io_start();
>      gen_helper_cpsr_write_eret(cpu_env, cpsr);
> +    gen_io_end();
>      tcg_temp_free_i32(cpsr);
>      /* Must exit loop to check un-masked IRQs */
>      s->base.is_jmp = DISAS_EXIT;
> @@ -9828,7 +9830,9 @@ static void disas_arm_insn(DisasContext *s, unsigned int insn)
>                  if (exc_return) {
>                      /* Restore CPSR from SPSR.  */
>                      tmp = load_cpu_field(spsr);
> +                    gen_io_start();
>                      gen_helper_cpsr_write_eret(cpu_env, tmp);
> +                    gen_io_end();
>                      tcg_temp_free_i32(tmp);
>                      /* Must exit loop to check un-masked IRQs */
>                      s->base.is_jmp = DISAS_EXIT;
> --
> Qualcomm Datacenter Technologies as an affiliate of Qualcomm Technologies, Inc.
> Qualcomm Technologies, Inc. is a member of the
> Code Aurora Forum, a Linux Foundation Collaborative Project.
>

thanks
-- PMM
