Received: by 2002:a19:ee01:0:0:0:0:0 with SMTP id g1csp315663lfb;
        Mon, 4 May 2020 04:01:33 -0700 (PDT)
X-Google-Smtp-Source: APiQypL+SMKKYn7/sNCDVoLf8fx4ysK7yOAUWX6YEx11IlO9TM6fyyxGcdKkfbnRdKEPCxg4Z0C4
X-Received: by 2002:a37:b5c3:: with SMTP id e186mr14759090qkf.158.1588590093001;
        Mon, 04 May 2020 04:01:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588590092; cv=none;
        d=google.com; s=arc-20160816;
        b=P5/EILyOHGNY5Lv4cDsr8gpn00ls4Ck+UZXgtmgUILlUSILSt34X36rex21ydaCKrP
         A7kpTDL6lqu/wMXDYAr/5GBUwT+KZbSPN8hQVsoYl7Nz90lHxOl3qEqdz72ckpXNs6qc
         2HfJoOv5vG+4NLf26Z3pKzhPYiB/4GsQRhKkHSU/OquaSmVxzd36pGr072cNnUyiotXV
         CLaFZTngBlib8VxxxadmQS1HTvC8XSVNYRIM8myeBxLO6552FQY3zyIiIrYmIMoxDN3i
         Zp1W+YYs1cbCje1DPfdwgD8+OI9ezTNKj6wJmg7Sgmw5E80CmDAXABZ60lkIQWsSnRAi
         sYRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=yVE7OOtaWQAFzH7p9MnmKbIDdEATimu8INHSV0tg5EM=;
        b=cbGHPoEIvtIwd7uXba78nu/0N0KoC9HH4JKCBoabVS9kJT8U/vzziEcs9bM/MqIOHX
         FLY7NlBYrveMN+gg/UN3JscogkhvuIox9CZ6RmtB7E76SSLs2U9b+XWfpG6Y1AQFi69J
         /0+DsYk9qboaLQtvnvOVmmcVn/to8elPEuSx84uSX8uL+mbgvoPxekvHc2Wshpd4CkDL
         RIsugh/EBu1aNsD1GPBDm2y3EYRW3QksJ4o7mR9ziZEgHhfnwba/xEHno3BncgYpCjtc
         CAfNGR8kqzBoxlANZ2aYf+zcqtpUt968jWg66ehp7aHTi+Y7K1UrpZheJMaij6Jng2Eo
         bQkA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PC49UBPR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id d9si6214540qvk.174.2020.05.04.04.01.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 May 2020 04:01:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PC49UBPR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36596 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jVYqq-0002Gj-9w
	for alex.bennee@linaro.org; Mon, 04 May 2020 07:01:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVYqf-0002Eq-OR
 for qemu-arm@nongnu.org; Mon, 04 May 2020 07:01:21 -0400
Received: from mail-oo1-xc44.google.com ([2607:f8b0:4864:20::c44]:39124)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jVYqe-0004DG-He
 for qemu-arm@nongnu.org; Mon, 04 May 2020 07:01:21 -0400
Received: by mail-oo1-xc44.google.com with SMTP id c83so2279520oob.6
 for <qemu-arm@nongnu.org>; Mon, 04 May 2020 04:01:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=yVE7OOtaWQAFzH7p9MnmKbIDdEATimu8INHSV0tg5EM=;
 b=PC49UBPRPHrOUzboVrOATwHK6AmFE70aObSfYq2INQkRmLMV4oFSlxfloWbCdMAY2d
 NiSfPuwdYVgVmyW4zb+r6eSMeaRouLmIociUMAXz8nNLBRJwJXGAQp8DVJethyr6Twib
 w3HNNlI8kCe04rsEZs/X5nulBsYMEWkV4rNf+ABLpe874jdesO10WTziAfq8fIXidSHz
 T7E5pBdp6cfoxegTrqawlDpe0tiN6E+fHR+UJaJl9irveiwsDXaELQ6VZ5Zlp0QVEgoS
 euxdjd3r4Mb+SL57ToK2ek2LaWI2Oih/uZ7MlVIcBLwfVkfHowopFCdviJxWLAYBNpka
 OPTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=yVE7OOtaWQAFzH7p9MnmKbIDdEATimu8INHSV0tg5EM=;
 b=tbizuM+IeB8m7beKJX4pxLQrnuwe6HMsjlhQHq/Ks7mi2u9o1RIcEa7TOYrIoEbFZN
 fDPGf+IdYYFsD7GRJqI8WoFXvZA1irAjwNaEfkQ6gDrAeLKZ03el0Y1RW4/sqd72LGEV
 ZMghyVvbJoA2Rc+5ctrXh13Q97gGyEfENelLCCatXCWlI5LQGVeBlS6Msh4n/SYtZK/M
 Mx6XeXJnX+4JwUsQET6CY2m4u2WHbAjYsm8XaHWPR5otYnk1pvLcPmozQBx5EwS7D8Q4
 p+QBlduVrJy0tkxd10fsK77EjI/PBdoU4aENIUb2yRh/2HEteBj85PU9c6U23I64xHYt
 yCRA==
X-Gm-Message-State: AGi0PuaYSUSgawAawTcsnSJLMPB3e+JwXinkyT3VT9DF287EWAMfig62
 KK7uFXmJFgHru/X+DAEteBs0+ejEOC5klMMTUmYQkg==
X-Received: by 2002:a4a:8253:: with SMTP id t19mr14372489oog.69.1588590078678; 
 Mon, 04 May 2020 04:01:18 -0700 (PDT)
MIME-Version: 1.0
References: <20200428160350.10030-1-edgar.iglesias@gmail.com>
 <20200428160350.10030-2-edgar.iglesias@gmail.com>
In-Reply-To: <20200428160350.10030-2-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 May 2020 12:01:07 +0100
Message-ID: <CAFEAcA97vRE9yEPHFEBA8tw_K6Zzv0O9K=reHHP41T2GtKj44A@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] target/arm: Drop access_el3_aa32ns()
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::c44;
 envelope-from=peter.maydell@linaro.org; helo=mail-oo1-xc44.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_PASS=-0.001,
 URIBL_BLOCKED=0.001 autolearn=_AUTOLEARN
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
Cc: Laurent Desnogues <laurent.desnogues@gmail.com>,
 Edgar Iglesias <edgar.iglesias@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: SsdkCrxSRAPj

On Tue, 28 Apr 2020 at 17:03, Edgar E. Iglesias
<edgar.iglesias@gmail.com> wrote:
>
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Calling access_el3_aa32ns() works for AArch32 only cores
> but it does not handle 32-bit EL2 on top of 64-bit EL3
> for mixed 32/64-bit cores.
>
> Fold access_el3_aa32ns() into access_el3_aa32ns_aa64any()
> and replace all direct uses of the aa32 only version with
> access_el3_aa32ns_aa64any().
>
> Fixes: 68e9c2fe65 ("target-arm: Add VTCR_EL2")
> Reported-by: Laurent Desnogues <laurent.desnogues@gmail.com>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>

So, this is definitely a bug, but I think we could be
clearer about what we're fixing.

For all these registers, the way the Arm ARM pseudocode phrases
this access check is:
 * for the AArch64 view of the register, no check
 * for the AArch32 view of the register:
      ...
   elsif PSTATE.EL == EL2 then
      return VTTBR;
   elsif PSTATE.EL == EL3 then
      if SCR.NS == '0' then
          UNDEFINED;
      else
          return VTTBR;
(similarly for the write path). We don't implement the HSTR.T2
traps, so for us these registers are all .access = PL2_RW and
we just UNDEF for all EL0/EL1 accesses.

So what we're really trying to check for is "current EL is EL3
and we are AArch32 and SCR.NS == '0'". Because it's not possible
to be in AArch32 Hyp with SCR.NS == 0, the check we make in
your function is an equivalent test, but we could improve
the comments:
> ---
>  target/arm/helper.c | 34 ++++++++++------------------------
>  1 file changed, 10 insertions(+), 24 deletions(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index 7e9ea5d20f..888f5f2314 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -504,29 +504,15 @@ void init_cpreg_list(ARMCPU *cpu)
>  /*
>   * Some registers are not accessible if EL3.NS=0 and EL3 is using AArch32 but
>   * they are accessible when EL3 is using AArch64 regardless of EL3.NS.

This could be rewritten as:
   Some registers are not accessible from AArch32 EL3 if SCR.NS == 0.

> - *
> - * access_el3_aa32ns: Used to check AArch32 register views.
> - * access_el3_aa32ns_aa64any: Used to check both AArch32/64 register views.
>   */
> -static CPAccessResult access_el3_aa32ns(CPUARMState *env,
> -                                        const ARMCPRegInfo *ri,
> -                                        bool isread)
> -{
> -    bool secure = arm_is_secure_below_el3(env);
> -
> -    assert(!arm_el_is_aa64(env, 3));
> -    if (secure) {
> -        return CP_ACCESS_TRAP_UNCATEGORIZED;
> -    }
> -    return CP_ACCESS_OK;
> -}
> -
>  static CPAccessResult access_el3_aa32ns_aa64any(CPUARMState *env,
>                                                  const ARMCPRegInfo *ri,
>                                                  bool isread)
>  {
> -    if (!arm_el_is_aa64(env, 3)) {
> -        return access_el3_aa32ns(env, ri, isread);
> +    bool secure = arm_is_secure_below_el3(env);
> +
> +    if (!arm_el_is_aa64(env, 3) && secure) {

We could either rephrase this as
       if (!is_a64(env) && arm_current_el(env) == 3 &&
           arm_is_secure_below_el3(env)) {

or just have a comment
       /*
        * This access function is only used with .access = PL2_RW
        * registers, so we are in AArch32 EL3 with SCR.NS == 0
        * if and only if EL3 is AArch32 and SCR.NS == 0, because
        * if SCR.NS == 0 we cannot be in EL2.
        */

depending on how much you proritize a more efficient test
over a more clearly correct test :-)

> +        return CP_ACCESS_TRAP_UNCATEGORIZED;
>      }
>      return CP_ACCESS_OK;
>  }

Also, once we don't have a distinction between two different
flavours of this access function we should use the simpler
"access_el2_aa32ns", rather than ending up using the longer
name for the one version of the function we're keeping.

thanks
-- PMM
