Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp851126wrm;
        Fri, 18 Oct 2019 05:33:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyk2ne6xP47WL1AFXSbhgOp2nyQ8yvtjUIkk4YTXR92HyZDgZOkBVLgpTAbLhgGO71GxMAs
X-Received: by 2002:a37:624a:: with SMTP id w71mr8571609qkb.456.1571402013401;
        Fri, 18 Oct 2019 05:33:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571402013; cv=none;
        d=google.com; s=arc-20160816;
        b=ORkn3DjRKUvmJLqiN84leOqItiZ5uWtlo7ynjzmBYGvXkuu/8C+wrx4pavCdBCH8bP
         M3SzQWdD/nNSVs9C5G9+/EGH40OYnRXrQST0580gnSe3QFPDQkG+g1wcAMfFAWGvDzbT
         GrZso/oV7qDVVYEDryVR9cYDXKNS2rJ7jRa1vV4Q67q4qLSMu3UY8w7w3OZDJ5E5UAm2
         9mabGzUtD/Rh8WkEt4OWZKKjSAMlEkc4+vl0YCm1sXXtAtcVnhmOJDrM8CZ3K5uiM8KS
         b5y+3iw5Xkc4kpvVmOp5hHGx0pK3+PxZ/0RholDUrzQfmBIurK697sta6sYBrBsnC4m/
         YExQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=78OJkJ4IhTQipG9ELDS8c/fdUHRcaCtnkATcqPXAcbI=;
        b=OY6KilyWeqVfnJlimwkQ8P9VYeJd6ljFoY3C49tDce7Peb8czpz6l84VvhGf0DdN7k
         gJzQ1ydo8wD8rbu2wLXIz2Lq54FGY9xLAO7wKpbOdoe8vFuRf5YPG9U/0rRYY3Q8rnjq
         CTf9E5C94F/e7CFYKeeXn6gLLLLcPLBt/9XM1Ip0gYkpC6It0wmi65WPiXhINZJ0aHwa
         okuTFioGBPwcuoEQcricEWBW0wxf8PN/NKMZw7Wklpfqa21iKNLsYUwO/4YJ7kqE+C9D
         ivoCxRmDL0h3ukkQp54QR9zXVGITjNMu4R7EpJFiUvohzt9dUV1BK154ZSHS6T8UNwXe
         g41g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sVZx+vdO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y2si6283430qvl.203.2019.10.18.05.33.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Oct 2019 05:33:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=sVZx+vdO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39298 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iLRRk-0001YW-T5
	for alex.bennee@linaro.org; Fri, 18 Oct 2019 08:33:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41823)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iLRRX-0001YH-7F
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 08:33:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iLRRT-0003aU-9h
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 08:33:17 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:41120)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iLRRP-0003Xs-J8
 for qemu-arm@nongnu.org; Fri, 18 Oct 2019 08:33:13 -0400
Received: by mail-oi1-x243.google.com with SMTP id g81so5043765oib.8
 for <qemu-arm@nongnu.org>; Fri, 18 Oct 2019 05:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=78OJkJ4IhTQipG9ELDS8c/fdUHRcaCtnkATcqPXAcbI=;
 b=sVZx+vdOBBt8GNbzfXyHRYR7DUo4MQpQgPR9rKeLIox/6/g0jZ7UCNEPzCunWASjYG
 /D3Od5FkQudtwG595RlTczzyvaId7jOQ9e/shGKNPweh58SmRlTMu9g/SRNJBZxb2aP9
 adfp1wg1dgRQQ4E8iwCv1lMTk79y+vrfHxDl9AYwNs35PYG3DMdcdBbuam56PdROeU3t
 EJXThIV4JVz6CGgWBhPgr7abZzFCi2+qNBqXifzr8Y5QV8feJhyDs6EQmTDAF/A2uYbU
 AX1xcEfvl19HK2egzCHqwbQ7lospyvbaUNrCKLqyT0aNPTVuMmIYy3U2S/UGYdZt3DO1
 sgSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=78OJkJ4IhTQipG9ELDS8c/fdUHRcaCtnkATcqPXAcbI=;
 b=XeSknPoiAvE04ApJUCo9SOgOdkcWs3WGcCDNJC2ZHAHqPlipyah72NpgmhvIFqxHyr
 gaDB2XP+3aMN4U9Drx8GM2fp/HlFMQrN6Z48C7JXV8pbToMjgsEAVTB31SCoTcDwXNl/
 pKVYzkg6vqXIDfsjjLvvuGaJq4og+7jv+HFxPJUBsDoKSt5CnpzyrdOdMWoCknSeRD5W
 iGIjrKcYLgWtSWpqOiwDjQqGIBounnX0Wc4qaSjMY23kaahlx4Q9LoZoAZLq7o070zeo
 YsgyF8RJf7W6nUOh6KYGZ+RVPkFaBPjvIjP8hVU1oZhtAr/laBwDqfYTmUGxkOwVx+zu
 n18g==
X-Gm-Message-State: APjAAAUCkdLG+5hJ+jAPnimZwJBMxqLXQJBe+LSS86I8cspiwmFXI+UC
 4cCFiWvAoKNEvpnnAJIWZ0Bi3raT+czmAulI1IoWwg==
X-Received: by 2002:aca:2b08:: with SMTP id i8mr7479583oik.146.1571401984190; 
 Fri, 18 Oct 2019 05:33:04 -0700 (PDT)
MIME-Version: 1.0
References: <20191017185110.539-1-richard.henderson@linaro.org>
 <20191017185110.539-18-richard.henderson@linaro.org>
In-Reply-To: <20191017185110.539-18-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Oct 2019 13:32:53 +0100
Message-ID: <CAFEAcA8h9CN_qarQdfXRonE8KYO2=s+Jh_o+LFs9qk9M20pweA@mail.gmail.com>
Subject: Re: [PATCH v7 17/20] target/arm: Rebuild hflags at MSR writes
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
X-TUID: +2zec9u9moY6

On Thu, 17 Oct 2019 at 19:51, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Continue setting, but not relying upon, env->hflags.
>
> Reviewed-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate-a64.c | 13 +++++++++++--
>  target/arm/translate.c     | 28 +++++++++++++++++++++++-----
>  2 files changed, 34 insertions(+), 7 deletions(-)
> @@ -7068,14 +7070,30 @@ static int disas_coproc_insn(DisasContext *s, uin=
t32_t insn)
>              }
>          }
>
> -        if ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) && (ri->type & ARM_C=
P_IO)) {
> -            /* I/O operations must end the TB here (whether read or writ=
e) */
> -            gen_lookup_tb(s);
> -        } else if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
> -            /* We default to ending the TB on a coprocessor register wri=
te,
> +        /* I/O operations must end the TB here (whether read or write) *=
/
> +        need_exit_tb =3D ((tb_cflags(s->base.tb) & CF_USE_ICOUNT) &&
> +                        (ri->type & ARM_CP_IO));
> +
> +        if (!isread && !(ri->type & ARM_CP_SUPPRESS_TB_END)) {
> +            /*
> +             * A write to any coprocessor regiser that ends a TB

(typo: "register")

> +             * must rebuild the hflags for the next TB.
> +             */
> +            TCGv_i32 tcg_el =3D tcg_const_i32(s->current_el);
> +            if (arm_dc_feature(s, ARM_FEATURE_M)) {
> +                gen_helper_rebuild_hflags_m32(cpu_env, tcg_el);
> +            } else {
> +                gen_helper_rebuild_hflags_a32(cpu_env, tcg_el);
> +            }
> +            tcg_temp_free_i32(tcg_el);

Why only rebuild hflags if !ARM_CP_SUPPRESS_TB_END ?
For instance on the Xscale CPUs we set SUPPRESS_TB_END for the SCTLR,
but some of the SCTLR bits are cached in hflags, right? Do we somehow
arrange to rebuild the hflags when the TB does eventually end ?

> +            /*
> +             * We default to ending the TB on a coprocessor register wri=
te,
>               * but allow this to be suppressed by the register definitio=
n
>               * (usually only necessary to work around guest bugs).
>               */
> +            need_exit_tb =3D true;
> +        }
> +        if (need_exit_tb) {
>              gen_lookup_tb(s);
>          }

thanks
-- PMM
