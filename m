Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp3216708wrv;
        Mon, 29 Jul 2019 07:26:55 -0700 (PDT)
X-Received: by 2002:a05:6830:1653:: with SMTP id h19mr27056492otr.232.1564410415083;
        Mon, 29 Jul 2019 07:26:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1564410415; cv=none;
        d=google.com; s=arc-20160816;
        b=xtlD1k+ATEA47wI3EM5Dx1BGzhtwNebkFuqCdck6GJHWHIrMf24uDLG1UjGLqc7iHg
         NUTMqA7s9muM3ryJ/HBscsEdFm/hfJC4FYklyzTM83O2fRSm5p6HHWVpHEneKmHdOC6g
         CRLjhOJZM0Mz9CMSlLg8s6JBj7hg6bdIHOWCj17H2ls7/HETy//Tq9oT6xPxPSxAbqkT
         pKcQjFv4Rac4sZrthE0tCJjg8mY/I5O1iZFBgieaVgdP/AEe1wbMbfXOnwdHOAcEtnnG
         Urn4exX7Xgyuxejny6xVnStCd5jfu9AYn/AOCBDyBVUTLzx+f4MsS2c0VnChW5Sgvk8r
         LD+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=WDo+MdWnXv2rn0jkx3UgOUpQoU5HO3vfEk+x0LJuISw=;
        b=vNVPbEt0P0xiSaA5wo5P6WtioTJrP0VL3MvLkg+rrH2U9oEjIeXiZAPuEDwtzYqDHQ
         ceZ2do6dd3WYzI1jk8SymFMT+e1a5lQO4QTC7iJT+NnC8suPl1PLRALGLiBai5WOmoQJ
         vbISjRqMweu9oSB3ZJ4Kc5wuOMDMaz+TrGQ2qThGwgSlOPCYx4Tmf0Z70z5pKL817+4Q
         EgqKQjK7pN3QqNBgYFsK1B/5K9JQGpL1bPtXbGbt64YbgsMduvvow1y9JcPJ2+yNreL9
         bR5fdFPRcWeWPOw3TuhhszMjhs7gDMcnLW8o4Wr2AOR/4297qIhTtwdAVgnoOsqJE1ER
         8Dmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z2GDvN8E;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id p129sor26692993oig.120.2019.07.29.07.26.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 29 Jul 2019 07:26:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Z2GDvN8E;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=WDo+MdWnXv2rn0jkx3UgOUpQoU5HO3vfEk+x0LJuISw=;
        b=Z2GDvN8ESQLeUCoAie3A+zs/932fJkIuxy8z1wdxfj5N88v2oMNWSJjz/suicfWLWm
         64v1GAFqVP3w5EQVEKn1UGz1HohqoW0LD57LozBDXQ5tMzTKtYmvFuQbeC/GwdP8J0Tv
         uuZpWQ+238vJXZ9ETG5zO4r+giQwZjglKz25AMCc2jrul0rkORvksyEnE55hT8e7CHIA
         XvF5Pou3hQltsq35P6gkLK4Mu24riRBOFSUvWVuEah0PPHB6qVChDq76C6Fh0Ag7Tqqr
         qgYUMxIBSEjQuJu1l+lB8K+cB+jlCZJcckHSdKOnJigREZqIYQz1lp8XpBDjAOi4fsuj
         r0Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=WDo+MdWnXv2rn0jkx3UgOUpQoU5HO3vfEk+x0LJuISw=;
        b=SSHEhhEqFphxDC3hHOk+zF9WpKUHYx53fDyD+VtDEr3bmPzvkx5pZXEiuMwm+5exHt
         IbF1MhaalbdULcsozH5iptkHkNgmyg4F4QGUAUja2JCeslMShFrb3w359CagzcTAdAad
         RjUpzRc9WeT4uAN7h0hLkiAq1Z2bgSdFL9KLuG4hAaRvTCvn7r/SYgrwY4nfnWfpMboc
         ykM4CcmwxQCnOEMpBzBT+NwaW5qYgqfCRBnv9ZGkjoUj16SMaYC2pS9/ULmzUw2308zy
         cJWbC4jl7cbsGVez1s7S+soMgAMeGP9M1OL/3zuyXRidRbRR3KQm5FgE4ETAt2I+aOjA
         TBMw==
X-Gm-Message-State: APjAAAVoniPH1omcECWmTSOdl58BxwGWnQf7ydf8KJPGsjsaJYylZYlf
	eJsCklda+W0KkINkXJ/Fzz+M/yIFwxORODJAf2gkO714SwU=
X-Google-Smtp-Source: APXvYqykypGIxzp1UmbsUjLs5TNa7ACnuL6WGhhC6U59zGJeZU7Z/RjjuKB8DopQCRFP//9xJ4XJbbo4y668d7WNvFw=
X-Received: by 2002:aca:5cd7:: with SMTP id q206mr49146229oib.146.1564410414592;
 Mon, 29 Jul 2019 07:26:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190726175032.6769-1-richard.henderson@linaro.org> <20190726175032.6769-9-richard.henderson@linaro.org>
In-Reply-To: <20190726175032.6769-9-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 29 Jul 2019 15:26:43 +0100
Message-ID: <CAFEAcA9twN1i6GLORiu0ygpxcjCUQB2Srm6g7-TcWSXXTyRbwA@mail.gmail.com>
Subject: Re: [PATCH 08/67] target/arm: Use store_reg_from_load in thumb2 code
To: Richard Henderson <richard.henderson@linaro.org>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: v7U6Ebt5WEm9

On Fri, 26 Jul 2019 at 18:50, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is an extra always-true ARMv5 test, but this will
> become more obvious once we start unifying the
> implementation of A32+T32.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 12 +++---------
>  1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 5e2dd8bb16..e316eeb312 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -9773,13 +9773,11 @@ static void disas_thumb2_insn(DisasContext *s, uint32_t insn)
>                          /* Load.  */
>                          tmp = tcg_temp_new_i32();
>                          gen_aa32_ld32u(s, tmp, addr, get_mem_index(s));
> -                        if (i == 15) {
> -                            gen_bx_excret(s, tmp);
> -                        } else if (i == rn) {
> +                        if (i == rn) {
>                              loaded_var = tmp;
>                              loaded_base = 1;
>                          } else {
> -                            store_reg(s, i, tmp);
> +                            store_reg_from_load(s, i, tmp);
>                          }
>                      } else {
>                          /* Store.  */

I thought at first this would change behaviour if rn == 15
but in practice it doesn't because 15 is the end of the loop
anyway. (This is an UNPREDICTABLE case, but if they get in our
way it might be better to explicitly make them UNDEF rather than
just behaving like whatever falls out from the implementation.)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
