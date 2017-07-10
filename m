Received: by 10.25.44.15 with SMTP id s15csp3609742lfs;
        Mon, 10 Jul 2017 09:13:42 -0700 (PDT)
X-Received: by 10.28.34.130 with SMTP id i124mr8428095wmi.116.1499703222468;
        Mon, 10 Jul 2017 09:13:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1499703222; cv=none;
        d=google.com; s=arc-20160816;
        b=RaYrUeO85fHHCVt5B4gPZr5b1WmeqUOSZEANpjuv9S0/Kt55gD3y+BG7O7ZyKUARdS
         AcMqrOn0R4i/+nztwTDI9LsYf6c+T1GB32muYCzh+bDZkkCvU/6mgfoKhxXZKOJao9d9
         aryGSJt+W8iZ+KRjjOHeawkntYHPosaaOcO0yluIaIPyvNFduPzWFqyXWusSHTYAX74i
         KPOhAUFDE94bT6n9ZwIZEszl56urhhtH6G8qHn0IhO8kdnG9b5h5RpWNbHtOAXekqae3
         XFWAyMkhSubz1iQBkLD/jA5VpwGakT7c1RIEmSyuvYZHggMVCMtF07mvqv56wrd8G/KX
         iHcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=l/vQGH4JnM01gXO5nQ3kFk0BUwW/g4qhyYQtxFyjkcM=;
        b=CgdFfFVo88s49OzANvOIP/Gmguakz8TqfMtGPoZNH84huxYjakR/kXMC3SCisQOO3d
         TJEgSf4GsZh2uhz7MHgJ+Uryx6ysqkRIzIlnzEMbO6G5PW+keEFrP2fAsEQV5Eat/K6P
         wpkgnti4NejjSCSWPhuy2zJYDH0EEyKkdqlP2d7x5Q3nB7DH3zHs2abj297Uz2z3bjgz
         +yr38Af04XmG6JSMxSlVBcMHwDsHAxyTvKFc6q4b4qInbSoShkBWktmM7/7SqpoQs4Ka
         vWbWH2WMHsl6oK5jyQ4oYaU2rsnchYYXv2cSP0tr7OqJRGHXqD5kW5hymfSGX+bjTuBW
         ZVQw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.b=Lyz5FZiX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22c as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-wr0-x22c.google.com (mail-wr0-x22c.google.com. [2a00:1450:400c:c0c::22c])
        by mx.google.com with ESMTPS id j69si6667602wmj.91.2017.07.10.09.13.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 09:13:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22c as permitted sender) client-ip=2a00:1450:400c:c0c::22c;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.b=Lyz5FZiX;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 2a00:1450:400c:c0c::22c as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: by mail-wr0-x22c.google.com with SMTP id 77so144990414wrb.1
        for <alex.bennee@linaro.org>; Mon, 10 Jul 2017 09:13:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=l/vQGH4JnM01gXO5nQ3kFk0BUwW/g4qhyYQtxFyjkcM=;
        b=Lyz5FZiXwxQN916S8a7mJB0MdZnMkAkKQUzdPCH/WqH3fRdshuNTMIVYbZQfcmFBrm
         bI3wxRqPwRDiy5zwxErnfkAg2KoLMxEdqPaFRly+Bp+ogI6txr+6i0liFZA23p6GRaS4
         5vR2Nk1F5Sl654ub2idNh4slAPhzot9F43WxU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=l/vQGH4JnM01gXO5nQ3kFk0BUwW/g4qhyYQtxFyjkcM=;
        b=FumX1ogLnc6vUQ4bHxy64EpUHCFmv0r/OFdDObMeuAkjksPAIC9CBrCXBSJa2EbzwI
         WAX9tWppyLmlvnWtR8B0FuV1p5rDQH68P9sroPhInmQZy7TZach0HpWdzZ5wos/Qq/rf
         Awia/QA3EQyC38XvGPAekpF8+dIQ1C69kJn2sln6XyH8OwzAwQtHIErtHoTYKFKIa6L+
         9XTwwDzUU8zOtOMnlvvXJ9CIVrFoD+ZLiFpNiIa9TAo2+LNtM4u6cQOqIlr5fWCp+gKC
         suvc4rqk2dgtfvIVfqbel/802ooIQkhy5NbHM56mPDXt0ezZYRdK2BMx1GyPPm3u5jJ0
         0XCQ==
X-Gm-Message-State: AIVw1103xbYqVbHwbKngdP58lzh8PsvmpumI6oIGUh2vF8lyP5H/kOI1
	0jnSOjjSVcLwgb70NvZUOAArNMMWhABk9mVxtQ==
X-Received: by 10.223.133.239 with SMTP id 44mr8218492wru.177.1499703221880;
 Mon, 10 Jul 2017 09:13:41 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.134.2 with HTTP; Mon, 10 Jul 2017 09:13:21 -0700 (PDT)
In-Reply-To: <20170710154749.13624-3-alex.bennee@linaro.org>
References: <20170710154749.13624-1-alex.bennee@linaro.org> <20170710154749.13624-3-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 10 Jul 2017 17:13:21 +0100
Message-ID: <CAFEAcA8OjCS9=UJ6NV2_PgT7zciOmcnvrzpTY6FL55D8x965aw@mail.gmail.com>
Subject: Re: [PATCH v1 2/6] target/arm/translate.c: make DISAS_UPDATE match
 declared semantics
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: Richard Henderson <rth@twiddle.net>, "Emilio G. Cota" <cota@braap.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, "open list:ARM" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: jVICrEqzNknP

On 10 July 2017 at 16:47, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrote:
> DISAS_UPDATE should be used when the wider CPU state other than just
> the PC has been updated and we should therefor exit the TCG runtime
> and return to the main execution loop rather assuming DISAS_JUMP would
> do that.
>
> As some DISAS_UPDATE users may update the PC dynamically via a helper
> we also push the updating to the PC to hhe call sites which set
> ->is_jmp to DISAS_UPDATE.
>
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>
> ---
>  target/arm/translate.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 0862f9e4aa..f9c4aee1b6 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -4430,6 +4430,7 @@ static void gen_msr_banked(DisasContext *s, int r, =
int sysm, int rn)
>      tcg_temp_free_i32(tcg_tgtmode);
>      tcg_temp_free_i32(tcg_regno);
>      tcg_temp_free_i32(tcg_reg);
> +    gen_set_pc_im(s, s->pc);
>      s->is_jmp =3D DISAS_UPDATE;
>  }
>
> @@ -4452,6 +4453,7 @@ static void gen_mrs_banked(DisasContext *s, int r, =
int sysm, int rn)
>      tcg_temp_free_i32(tcg_tgtmode);
>      tcg_temp_free_i32(tcg_regno);
>      store_reg(s, rn, tcg_reg);
> +    gen_set_pc_im(s, s->pc);
>      s->is_jmp =3D DISAS_UPDATE;
>  }
>
> @@ -8058,6 +8060,7 @@ static void gen_srs(DisasContext *s,
>          tcg_temp_free_i32(tmp);
>      }
>      tcg_temp_free_i32(addr);
> +    gen_set_pc_im(s, s->pc);
>      s->is_jmp =3D DISAS_UPDATE;
>  }
>
> @@ -8146,6 +8149,7 @@ static void disas_arm_insn(DisasContext *s, unsigne=
d int insn)
>              /* setend */
>              if (((insn >> 9) & 1) !=3D !!(s->be_data =3D=3D MO_BE)) {
>                  gen_helper_setend(cpu_env);
> +                gen_set_pc_im(s, s->pc);
>                  s->is_jmp =3D DISAS_UPDATE;
>              }
>              return;
> @@ -11619,6 +11623,7 @@ static void disas_thumb_insn(CPUARMState *env, Di=
sasContext *s)
>                  ARCH(6);
>                  if (((insn >> 3) & 1) !=3D !!(s->be_data =3D=3D MO_BE)) =
{
>                      gen_helper_setend(cpu_env);
> +                    gen_set_pc_im(s, s->pc);
>                      s->is_jmp =3D DISAS_UPDATE;
>                  }
>                  break;
> @@ -12076,7 +12081,6 @@ void gen_intermediate_code(CPUARMState *env, Tran=
slationBlock *tb)
>              break;
>          case DISAS_NEXT:
>          case DISAS_UPDATE:
> -            gen_set_pc_im(dc, dc->pc);
>              /* fall through */
>          default:
>              /* FIXME: Single stepping a WFI insn will not halt the CPU. =
*/
> @@ -12095,12 +12099,11 @@ void gen_intermediate_code(CPUARMState *env, Tr=
anslationBlock *tb)
>          case DISAS_NEXT:
>              gen_goto_tb(dc, 1, dc->pc);
>              break;
> -        case DISAS_UPDATE:
> -            gen_set_pc_im(dc, dc->pc);
> -            /* fall through */
>          case DISAS_JUMP:
>              gen_goto_ptr();
>              break;
> +        case DISAS_UPDATE:
> +            /* fall through */
>          default:
>              /* indicate that the hash table must be used to find the nex=
t TB */
>              tcg_gen_exit_tb(0);

I'm not a great fan of this, because we've taken five cases that
all want the same behaviour for ending the TB, and we've made
them handle part of it themselves rather than just letting
the end-of-TB code do it for them.

Also, now the "synchronize the CPU state which we only write at the
end of the TB" code is split up -- we write the PC in the places
that set s->is_jmp, but we write the condexec bits in the end
of TB common code.

thanks
-- PMM
