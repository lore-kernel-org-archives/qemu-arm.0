Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp829358wrv;
        Thu, 11 Jul 2019 07:59:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy9TZXMi20DQLUdga6xUO3LSjhIhMH3uAanvWN8oQi2jZ6yAQBn/oj/KTHufOcUD8nGCom4
X-Received: by 2002:a17:906:4a10:: with SMTP id w16mr3608391eju.299.1562857141625;
        Thu, 11 Jul 2019 07:59:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1562857141; cv=none;
        d=google.com; s=arc-20160816;
        b=A/L1HkKD+U1iCrGL2ZK7RTLxJniv9q+62cqrPdM9yu7md80KVj5EXdOB5VHypiwhA8
         VTEPVBT04lyEZxhHbDA7yomWWF51PpcCPFigdwi/6NIZy60aeNMH5pNQ7EiUqzkF6vkJ
         geOM+HfBc6HJRXNfh7IcEZLNog+Y/S2e9nWEHVAtlrFNm6EaUDISiowlG/FQ/SejDKvu
         LKCRZrzhW95v2lR+pzzxhXnTscqKqvuIbfPkQcCwWxqm9Ej30xFWQxlnSTPFdzesTD5t
         LINHxNDcyCGW0soqBSe+1mQiSaJwvlTQC5Xw0rnU+9HJZu3i0BzTE0BtuI8XJMce8q3j
         xXZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2++xkrP6CNKv5dyr9XhKnyb0crOiXsr2FXISi8XGwX0=;
        b=kcUEsckRknVSmKuGW0OrowLtYGbdBaUchpro1HgHqeEIzYPwO2OmN42lc2ZCsEIuMg
         RBF4dSWlB7ZM0OBHrVOSyZ/DvAFQTWrHGLuONO5ja1Rt/kNAf+myaHGS01Ot2sN2PsfB
         KFrAtXZjDCs7m7GGdT9BX5CwFafK94VWKBEe6wKGtZznZNW3Ka+ymL/lk0eU7UAd5P5x
         ZUcyxzOamWy4GEyEi8hxIDW1vMypVS6UIBadS3EvE0cXVotS/Rp0wXjFoTfPZR3H613A
         7E1Z5mMm0D4nbwXfxuVQvHDARej23elPvIf4KTEh6hZFculfFgfpv3RI53dnDlmS3bRj
         SLeg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MXlMcnWT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n20si3331065ejs.169.2019.07.11.07.59.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2019 07:59:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=MXlMcnWT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hlaXE-0008IP-Nk
	for alex.bennee@linaro.org; Thu, 11 Jul 2019 10:59:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43321)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hlaX6-0008Gs-9m
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 10:58:53 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hlaX5-0006PO-2h
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 10:58:52 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:42049)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hlaX4-0006O8-Rk
 for qemu-arm@nongnu.org; Thu, 11 Jul 2019 10:58:51 -0400
Received: by mail-ot1-x343.google.com with SMTP id l15so6142709otn.9
 for <qemu-arm@nongnu.org>; Thu, 11 Jul 2019 07:58:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=2++xkrP6CNKv5dyr9XhKnyb0crOiXsr2FXISi8XGwX0=;
 b=MXlMcnWTiqxWAz4a7sYA2gGHSUMHwruCRYYmlkPxrWvj6G31Vc0xb5xrGlrEGjtAg8
 yhZxL8ljPCz5CtxCcFAtzfhlqMsglYrOT4H6tWRDXhSBF2Ka43ojKUsfmCW2vXnGY1Wl
 dAhBEMzP9upy4U0eEQp9erHIBQiJHIx+Vw84eZXYH6BUtJOULpzTgAfrOTeXuSdkd7yb
 TQ+ZllJ+9uRjpB9MijI2CUwbbfgbRAQ1NKyzKWcZAv5iIxGyjXIBU41fvj6Vc8tMYk0z
 8DhIjJ78YECNzqg/nRkJ26Pb0YbFLZp0Q1JwOulCmahdtJNnVfE/PrRjmcqsznvdbfcM
 Nk2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=2++xkrP6CNKv5dyr9XhKnyb0crOiXsr2FXISi8XGwX0=;
 b=PnPnv9s1OizcZRfKsUa4T+VFozvzPEpMUJ+0UP5k4BYxOq8yHa4B6zC5xyKSBt/Ndm
 FpjvnIHthMTiAuXeZ1/NeyMqfhI0tiVrLTPe9jpcGNlMsB5pCmrR8jbBBPl7NLqtd88C
 lZriPabWy8Hw7cD6JRfC4deKP1nWmh1Qxr7TOlgVCJ//CE74v9xETX0kubJXAbb+UZwI
 opkBs5oqa3DkV8RH9LlN8bBq3oNdKfo0aXPOKot1LXwR6eVQpUMC//Qokw4rf87fqfcR
 7GdKNGZOFt5sWy7+mPId0oTh38mXVBXh0ujFqTAP7kjNxZiJin27Ma43c01nPw44lLkI
 N7mw==
X-Gm-Message-State: APjAAAX1cybFkaGNnevAK6eM03CqyE7FpGud8OWEep/XjCyu05dBJ5Dv
 TfVZTKdyr5UiB5aQ/FBsdcehfMHolb7n2JBS8nC+Ird0dvU=
X-Received: by 2002:a9d:4d81:: with SMTP id u1mr3610111otk.221.1562857129351; 
 Thu, 11 Jul 2019 07:58:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190705094823.28905-1-peter.maydell@linaro.org>
In-Reply-To: <20190705094823.28905-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jul 2019 15:58:38 +0100
Message-ID: <CAFEAcA8wWwh7C6KN2YbWs0=Nb_ZxihVBFbSeFpMFKEnx5vQ9fw@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH v2 for-4.1] target/arm: NS BusFault on vector
 table fetch escalates to NS HardFault
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
Cc: Richard Henderson <richard.henderson@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: hlsEW77P/cgv

Ping for code review, please?

thanks
-- PMM

On Fri, 5 Jul 2019 at 10:48, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> In the M-profile architecture, when we do a vector table fetch and it
> fails, we need to report a HardFault.  Whether this is a Secure HF or
> a NonSecure HF depends on several things.  If AIRCR.BFHFNMINS is 0
> then HF is always Secure, because there is no NonSecure HardFault.
> Otherwise, the answer depends on whether the 'underlying exception'
> (MemManage, BusFault, SecureFault) targets Secure or NonSecure.  (In
> the pseudocode, this is handled in the Vector() function: the final
> exc.isSecure is calculated by looking at the exc.isSecure from the
> exception returned from the memory access, not the isSecure input
> argument.)
>
> We weren't doing this correctly, because we were looking at
> the target security domain of the exception we were trying to
> load the vector table entry for. This produces errors of two kinds:
>  * a load from the NS vector table which hits the "NS access
>    to S memory" SecureFault should end up as a Secure HardFault,
>    but we were raising an NS HardFault
>  * a load from the S vector table which causes a BusFault
>    should raise an NS HardFault if BFHFNMINS == 1 (because
>    in that case all BusFaults are NonSecure), but we were raising
>    a Secure HardFault
>
> Correct the logic.
>
> We also fix a comment error where we claimed that we might
> be escalating MemManage to HardFault, and forgot about SecureFault.
> (Vector loads can never hit MPU access faults, because they're
> always aligned and always use the default address map.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is the one remaining patch from my earlier 'minor M-profile
> bugfixes' series; the rest are in master now.
>
> Changes v1->v2:
>  * rebased on master (function has moved to m_helper.c)
>  * fixed logic bug pointed out by rth
> ---
>  target/arm/m_helper.c | 21 +++++++++++++++++----
>  1 file changed, 17 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/m_helper.c b/target/arm/m_helper.c
> index 1867435db7d..84609f446e6 100644
> --- a/target/arm/m_helper.c
> +++ b/target/arm/m_helper.c
> @@ -624,7 +624,11 @@ static bool arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets_secure,
>          if (sattrs.ns) {
>              attrs.secure = false;
>          } else if (!targets_secure) {
> -            /* NS access to S memory */
> +            /*
> +             * NS access to S memory: the underlying exception which we escalate
> +             * to HardFault is SecureFault, which always targets Secure.
> +             */
> +            exc_secure = true;
>              goto load_fail;
>          }
>      }
> @@ -632,6 +636,11 @@ static bool arm_v7m_load_vector(ARMCPU *cpu, int exc, bool targets_secure,
>      vector_entry = address_space_ldl(arm_addressspace(cs, attrs), addr,
>                                       attrs, &result);
>      if (result != MEMTX_OK) {
> +        /*
> +         * Underlying exception is BusFault: its target security state
> +         * depends on BFHFNMINS.
> +         */
> +        exc_secure = !(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK);
>          goto load_fail;
>      }
>      *pvec = vector_entry;
> @@ -641,13 +650,17 @@ load_fail:
>      /*
>       * All vector table fetch fails are reported as HardFault, with
>       * HFSR.VECTTBL and .FORCED set. (FORCED is set because
> -     * technically the underlying exception is a MemManage or BusFault
> +     * technically the underlying exception is a SecureFault or BusFault
>       * that is escalated to HardFault.) This is a terminal exception,
>       * so we will either take the HardFault immediately or else enter
>       * lockup (the latter case is handled in armv7m_nvic_set_pending_derived()).
> +     * The HardFault is Secure if BFHFNMINS is 0 (meaning that all HFs are
> +     * secure); otherwise it targets the same security state as the
> +     * underlying exception.
>       */
> -    exc_secure = targets_secure ||
> -        !(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK);
> +    if (!(cpu->env.v7m.aircr & R_V7M_AIRCR_BFHFNMINS_MASK)) {
> +        exc_secure = true;
> +    }
>      env->v7m.hfsr |= R_V7M_HFSR_VECTTBL_MASK | R_V7M_HFSR_FORCED_MASK;
>      armv7m_nvic_set_pending_derived(env->nvic, ARMV7M_EXCP_HARD, exc_secure);
>      return false;
> --
> 2.20.1
