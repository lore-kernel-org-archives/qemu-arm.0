Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4877197wrt;
        Tue, 8 Jan 2019 10:15:20 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6du8PgsY9URmf+UTLqIY2DgbxET9P/FzbpFx9G5zkeRmvA0Wqi5Mgbbau6w5MEez/hrNik
X-Received: by 2002:a5d:6105:: with SMTP id v5mr2199960wrt.63.1546971320849;
        Tue, 08 Jan 2019 10:15:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546971320; cv=none;
        d=google.com; s=arc-20160816;
        b=xV99PkU7OvWxQtc7VdGtllVHKW98jAIlpl1V81v1TEyNV7CMdQolIqElx/g+uJ+XR/
         Tne1YLcxisVP64Gao/hlm8lslWmyXlR4ku6/cc4402HfkzDsCttCfteEqJjGyitNooII
         FBx4BqnquRvw2+95zQZlVOdnTaz8OkrAa+JEGzaxzcXzJ1ka17VIXtMynmBgcxlAATlp
         3u2EpMflZcVDorwhgt7dr45JVJ3PNL50F+tXKpNzvVjM/a5SVIacS3u8LSHWKR9aUmt5
         G0YEbC+7Fl9B4LynKf3HIKU5HIOIaaNarocstvmM2ccd9mmGTfTDJ5EAJi18wKjZ1Kvf
         VZ0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9SQVTLmxpa7dCYYRffVFUwLH2d9/TWSZH8g9tXK342I=;
        b=ZhekWUY8YnOZwYDNgKMvx1bz6Av+eYEmS/UuFUs0n7ldkAcJhKRXZVtk/B7QTgFBoF
         WqCMF+SuIKfaDTSovwQNi0uHJXkpz4plApgDfcBVWeay6CsM/UX9NMKiMpDKJYUe1ey5
         8b4li5kxvBv0KauIcUZCs/s9qkMCYuQHAEaDAfa4pund9twoPRE02JKU8GqTL/6Nq+LF
         v9NVzTM9UJO9AIMJmY3kTPAiCEJcpBpbQc/X++INYGIX+mJjKNAX2PatPZprTP4WsqsX
         bK0jnstUPNDaH07oeQ7fVxO8KkEjA3jF5jWUbTkBS7cMFvQCU1n0oxiuvH3xtA3Lafj1
         XIeA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HEz9tfR+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 68si2977360wra.172.2019.01.08.10.15.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Jan 2019 10:15:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HEz9tfR+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:39126 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggvuH-0002EJ-0Y
	for alex.bennee@linaro.org; Tue, 08 Jan 2019 13:15:17 -0500
Received: from eggs.gnu.org ([209.51.188.92]:42824)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ggvu5-0002C9-N0
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 13:15:06 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ggvty-0006Ra-VC
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 13:15:04 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:46677)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ggvty-0006O8-Nc
	for qemu-arm@nongnu.org; Tue, 08 Jan 2019 13:14:58 -0500
Received: by mail-oi1-x241.google.com with SMTP id x202so4069090oif.13
	for <qemu-arm@nongnu.org>; Tue, 08 Jan 2019 10:14:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=9SQVTLmxpa7dCYYRffVFUwLH2d9/TWSZH8g9tXK342I=;
	b=HEz9tfR+ofjRsRQIX2kcGBtyv/MB9OvwcdXNKmNxJUjouvF2GFL4sbmu/wB8D+MrQR
	nJqgqXvaVMTS3N929RDDZxVjAeTkeNhKhC0sE9kTQ2ffI/0EvmUNj+c+BCcLVljvcFUE
	cWBr92Z9k/C4TVrGOKywKgqMTtvBNtoxUiTbc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=9SQVTLmxpa7dCYYRffVFUwLH2d9/TWSZH8g9tXK342I=;
	b=DSsHDQl1m1qqJ9ulbv79QuVS0YKmErmbgSFmxm1ubIphuHu8zPaBf5F2Z4o7Eqhh+S
	yU8MNkwnzC2evAbsRY5KGTyDMIcTHyefoAMS/G7NYvoXvC2RAxmNwrLbNwzcQj3PUYb5
	106U863nvYku0VahxuNm7O6xePfdqJJrIEbD/kjrPq1PvxC2PuM1se6hX3Pi/jaapSCG
	Nec/zA5g142kLUM1/p7g2mwSYJEVm0qsH4R4IcjXO+mQnB2UdeOcPMMHGolmQxg5B1BE
	TUSa/pvW/34hsZ3rkorIfILhLNESVUrcX04pOLZdCgcqu+74wZmSrve5lu5nxZR2OU/D
	mFyA==
X-Gm-Message-State: AJcUukdn6bLia08Z222TZycoBrgGlJ5iooMcVVWm6R0if0Anho0OGfEv
	09GJrNCx8YGPjIE0jpowUqZmIz4KktuPPQT/P7A4vg==
X-Received: by 2002:aca:c501:: with SMTP id v1mr1731199oif.48.1546971297567;
	Tue, 08 Jan 2019 10:14:57 -0800 (PST)
MIME-Version: 1.0
References: <20190106225035.5671-1-richard.henderson@linaro.org>
	<20190106225035.5671-4-richard.henderson@linaro.org>
In-Reply-To: <20190106225035.5671-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jan 2019 18:14:46 +0000
Message-ID: <CAFEAcA_Qp4t7xOrprhhjPSMDiPH5HNkJuVm57AfvTu53ZYOK8w@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH 3/3] target/arm: Use vector minmax expanders
 for aarch32
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vziCnriYRBle

On Sun, 6 Jan 2019 at 22:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 25 +++++++++++++++++++------
>  1 file changed, 19 insertions(+), 6 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 33b1860148..f3f172f384 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -6368,6 +6368,25 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
>              tcg_gen_gvec_cmp(u ? TCG_COND_GEU : TCG_COND_GE, size,
>                               rd_ofs, rn_ofs, rm_ofs, vec_size, vec_size);
>              return 0;
> +
> +        case NEON_3R_VMAX:
> +            if (u) {
> +                tcg_gen_gvec_umax(size, rd_ofs, rn_ofs, rm_ofs,
> +                                  vec_size, vec_size);
> +            } else {
> +                tcg_gen_gvec_smax(size, rd_ofs, rn_ofs, rm_ofs,
> +                                  vec_size, vec_size);
> +            }
> +            return 0;
> +        case NEON_3R_VMIN:
> +            if (u) {
> +                tcg_gen_gvec_umin(size, rd_ofs, rn_ofs, rm_ofs,
> +                                  vec_size, vec_size);
> +            } else {
> +                tcg_gen_gvec_smin(size, rd_ofs, rn_ofs, rm_ofs,
> +                                  vec_size, vec_size);
> +            }
> +            return 0;
>          }
>
>          if (size == 3) {
> @@ -6533,12 +6552,6 @@ static int disas_neon_data_insn(DisasContext *s, uint32_t insn)
>          case NEON_3R_VQRSHL:
>              GEN_NEON_INTEGER_OP_ENV(qrshl);
>              break;
> -        case NEON_3R_VMAX:
> -            GEN_NEON_INTEGER_OP(max);
> -            break;
> -        case NEON_3R_VMIN:
> -            GEN_NEON_INTEGER_OP(min);
> -            break;
>          case NEON_3R_VABD:
>              GEN_NEON_INTEGER_OP(abd);
>              break;
> --

This leaves the helpers neon_max_[su]{8,16} unused and deletable,
I think? neon_max_[su]32 is used only via the #defines of
neon_pmax_[su]32 so could be renamed to pmax. Similarly min/pmin.

thanks
-- PMM
