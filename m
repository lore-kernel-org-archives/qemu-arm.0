Received: by 2002:ac2:5937:0:0:0:0:0 with SMTP id v23csp2709062lfi;
        Mon, 30 Mar 2020 06:07:27 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vvD0BVOQC+l4g9YRidntRcbuhngNXyIl9Rb1T7TZYy5jFLxl9htmcRHew0+lC48+B3pEUxA
X-Received: by 2002:a0c:b617:: with SMTP id f23mr11438247qve.134.1585573647216;
        Mon, 30 Mar 2020 06:07:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1585573647; cv=none;
        d=google.com; s=arc-20160816;
        b=deBbBFZ3YSD3Ocg1go+BZOeBVN0nT+7UzQPihXumn+8lEs37l29inDkrHD+4mdsoe8
         lHPtLCQQkndwQek4YpsvI/jhYqLP2OKYFSavl6ibaTy3+VYeNwSMqMNBVkTSdsCEOFAN
         Ui6+7setw5TpiVXciSqS5OyV/IzA6A9wt0B5+RJeHSeUQPqJ+9ISqL6cQFAuaoNYp0z4
         UIX6siu1ZR4AOR2CGJsq3KMAUOgS8JU4wBUZkhle0Y5a7fh51W6+UFzFs44uib8n96Qj
         KF6lZImBqvEo/OAosRQKl2pgaNDJ+m6vHHf1zjt1sTHLp5OesyW1udPzmkvIRjKQAWio
         eiQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=N9kafDzItByaOJgeiXXAocdwy9zkWyh6uH03myYBXi8=;
        b=nuKlU7ncHNz7V9R1krrJyh6CO/qu8GeuJqFfCCi4FVP2I+d7+DvlbBxdOJQWa4zchd
         fe/6a55ONozzPQX2z6qK1m3YKLh0XrVNeDCWeqkOrSN9SZmEyMy8NoMAXMZ92zmIwaPp
         zcztYx/Ki+hplItq3DRPu2pnoWghtKPgJnrY/vjZyECi3J+qvho1G22nscoRD/ZjHwXx
         IIiDfxEATTpJIk98NgbEF1CCHQOQGPdmlo4qWZ9+dnkb7wzA2p+ZXXCgm81uBYS0+E0W
         VVea+e/M6XrSdgVABuEftH0FSItoR7/Kr+J9jTIz9XSzk4JPGs4qyrtYdYEKbhA96hqv
         l43A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q2DRcg00;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v55si8102974qtc.309.2020.03.30.06.07.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 30 Mar 2020 06:07:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=q2DRcg00;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49456 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jIu8U-0001Bc-Fz
	for alex.bennee@linaro.org; Mon, 30 Mar 2020 09:07:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44415)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jIu8L-0001B5-OB
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 09:07:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1jIu8K-0003kr-C3
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 09:07:17 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:40673)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1jIu8K-0003jz-2J
 for qemu-arm@nongnu.org; Mon, 30 Mar 2020 09:07:16 -0400
Received: by mail-oi1-x242.google.com with SMTP id y71so15561278oia.7
 for <qemu-arm@nongnu.org>; Mon, 30 Mar 2020 06:07:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=N9kafDzItByaOJgeiXXAocdwy9zkWyh6uH03myYBXi8=;
 b=q2DRcg003lIzIt4qr4qLLzhprWqRI72/HbDgA7X060z0UO53Yyd7qoCk5w/Dz1sfyE
 hYLNCETWlHSTapt6kLIZWvqwYdyhSxKEck6RSovl0orEeGuhDIvB5py0E2VEN0yl57bX
 XwSMuYBqto++M7gAF3kib4Q7h+bZhXxesfzAQPbyam9RTd+jWALgGHoj62HIgqvpcEsY
 D9NRtAn9Boshc80WG/AWhtlRdldQL5qfhAgUzW8vTmESTdDHic+ZXe4baYmt1DKV/mRi
 mHEds3aR/F0PMRj5CUWtRUY3jIPa1gQ0Gzu2QM32vvAcifwWZMSncAmJ64sznE3VEVle
 SwAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=N9kafDzItByaOJgeiXXAocdwy9zkWyh6uH03myYBXi8=;
 b=MzZHhlsHzGXdCv4JllvpDkcwv7ND4tYYIpZ5pLJ62Keg12APnbNAYtdQrylVR6T0mu
 K5C9ms35QaijT2M85p6ypKBOQ0iZrNUO/BwurxWaomqUA9zcsJf59WwVcYX74QF2fk+r
 4ODfEfA7SwA/8pF3GjBCkAbvI3lACMqV3fUmVmiLrBemFYkqTXRTe5Z98Xx8ea7nqIhx
 DKcHU5qaPaj26MvPBI8CywijCJPFOHE8ddXHsbEiDXExOTEObnHvGHqOqEe5VP+r9Y14
 z4sJJ6bHwTOzC8TgZ6BdMDVeJ/H6CIqkl023Qrj0H/uLqPo4sMClYj4Uf3MCL0y852cV
 6KEA==
X-Gm-Message-State: ANhLgQ2m4Ujmkpit7q9BfFN0l6rAP1lBjnqHOdj/vU1hprp9R6pmngum
 hn3Ge4ao7AooDe8Ft/fwWG95j4m/pelEgBnHWBb4Tg==
X-Received: by 2002:a05:6808:64c:: with SMTP id
 z12mr7187724oih.146.1585573634743; 
 Mon, 30 Mar 2020 06:07:14 -0700 (PDT)
MIME-Version: 1.0
References: <20200328140232.17278-1-changbin.du@gmail.com>
In-Reply-To: <20200328140232.17278-1-changbin.du@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 30 Mar 2020 14:07:03 +0100
Message-ID: <CAFEAcA8B=WB9ow3ZU4jcf7Z+dXizPRpsGp_BB7KPG4hfhH-cUw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: fix incorrect current EL bug in aarch32
 exception emulation
To: Changbin Du <changbin.du@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
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
X-TUID: 9zgtIGPELYQz

On Sat, 28 Mar 2020 at 14:02, Changbin Du <changbin.du@gmail.com> wrote:
>
> The arm_current_el() should be invoked after mode switching. Otherwise, we
> get a wrong current EL value, since current EL is also determined by
> current mode.
>
> Fixes: 4a2696c0d4 ("target/arm: Set PAN bit as required on exception entry")
> Signed-off-by: Changbin Du <changbin.du@gmail.com>
> ---
>  target/arm/helper.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/helper.c b/target/arm/helper.c
> index b7b6887241..163c91a1cc 100644
> --- a/target/arm/helper.c
> +++ b/target/arm/helper.c
> @@ -9172,7 +9172,6 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
>
>      /* Change the CPU state so as to actually take the exception. */
>      switch_mode(env, new_mode);
> -    new_el = arm_current_el(env);
>
>      /*
>       * For exceptions taken to AArch32 we must clear the SS bit in both
> @@ -9184,6 +9183,10 @@ static void take_aarch32_exception(CPUARMState *env, int new_mode,
>      env->condexec_bits = 0;
>      /* Switch to the new mode, and to the correct instruction set.  */
>      env->uncached_cpsr = (env->uncached_cpsr & ~CPSR_M) | new_mode;
> +
> +    /* This must be after mode switching. */
> +    new_el = arm_current_el(env);
> +
>      /* Set new mode endianness */
>      env->uncached_cpsr &= ~CPSR_E;
>      if (env->cp15.sctlr_el[new_el] & SCTLR_EE) {
> --
> 2.25.1



Applied to target-arm.next, thanks.

-- PMM
