Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp613771wrp;
        Thu, 5 Sep 2019 03:48:28 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzOuUhr0a2Gt/b12YN05mIgsjdIogVQWnLDSx53W/VM6Qa2rBdK6iRYOtrkhvOOlZ57PfPM
X-Received: by 2002:aa7:ce89:: with SMTP id y9mr2862354edv.255.1567680508644;
        Thu, 05 Sep 2019 03:48:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567680508; cv=none;
        d=google.com; s=arc-20160816;
        b=eBTAsI4V+IlmWD7a6vWUFy2kNaGLc3HB5GFys9AJsIC4IssnH1Y1caTdRb2ex0J7hz
         E6j6A1NqYntwYJMNEGm8zHaF7JsHrBefviP6JTpQC6BWFxftGTMJYBxtJcVx8Efl05Cm
         cxM3Xq5LESg3IF73RPrWnPF7rnnlrDKuIs1NfOB86Uw02TD9X/RWbeIRM5M/2URNXccv
         QbGk4ieg6m3M59tqMGChzoZF9ckgKy/XRuCibx1oqre0itkVixIrrTBoW3SAx0aLEziz
         dCIrom/Drlwc8khapYeME0ANgaeEz7Ulg1KTsu87g9x2lbMvjoGCwq67SXGZn4GknjAo
         86WA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=fznO7xak1he7ih5w1+Mo/uajJiBQg/mmQ1GFsr2hBcc=;
        b=ABEsXLbQVqj4gzbFph5sNkdEgMLftBrt/0eUVmniGpr8zpzVRE6lpxbC0Bdud/jQq6
         43xnN6sIyvyp7jIGJzUPKRU7n30XceN6raXNoK+dGmV8SzpuQyxl2wOBV63p3+5mKm/S
         fihHC5O/1vXyAT/pWe7/1nZak9D8Kb6zzpzzjvmXhPK+oVcGicuSNdzV3fBNWzy/yuMo
         jWY5SzTt8vWNvVyw1yZT/UfZJJ6BeH1EBqv1YIFTkUHXv/ssmm9ETGQakzKkHVxlLCnp
         hALY/y2IMSLFyTxU9TkPolIQ8iBDebftLN5WR7H8veR1i9sUgVtD4Mt0LNYLC5ytpA/N
         nWPg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s41si966932eda.207.2019.09.05.03.48.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2019 03:48:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44542 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5pJT-0001X2-Ku
	for alex.bennee@linaro.org; Thu, 05 Sep 2019 06:48:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:39314)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1i5pJK-0001W9-GW
 for qemu-arm@nongnu.org; Thu, 05 Sep 2019 06:48:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1i5pJI-0004DF-4b
 for qemu-arm@nongnu.org; Thu, 05 Sep 2019 06:48:18 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41058)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1i5pJE-0004BY-0u
 for qemu-arm@nongnu.org; Thu, 05 Sep 2019 06:48:13 -0400
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 13506C05168C
 for <qemu-arm@nongnu.org>; Thu,  5 Sep 2019 10:48:10 +0000 (UTC)
Received: by mail-wr1-f70.google.com with SMTP id z2so812107wrt.6
 for <qemu-arm@nongnu.org>; Thu, 05 Sep 2019 03:48:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=YiJ7qMxZZrpWWgP5whvFQXJ+AM92m75a5pQYG7z5M2o=;
 b=YV09P3iEqmv0JH34/xtW4DOTMsb9ud64DA/qezAdQzaq2plHJGqzqtm+SdRMdbZHnO
 ezUTW8j45C4Ko5HxtFq5Rq7Q59wLie9eK0yeBI9surZSY7DYM4GJEzmp5IXMvNdDSD7M
 1aEJ/yd5VfeQkd8b5fWHnjA5DxGU3KBc7rsMKqL8GvuL7nVjfSdgcFjOM6+HoEu2vCow
 hAFvPwo5TkOIqWlnRRyfuXnkVWUW6rV2k3X4/qjDYentAN44KxSCz1PHpDaeDcQkOMF9
 JxWhrwA9PDR2jPMOILZD9k9D4mCoiXnDb/MVRza7kNIWQWFJnTl47JOsUjYeV/Af5/aH
 b1Cw==
X-Gm-Message-State: APjAAAXcBcQRUPQBP4pFi9+AGkUjsPXYJ7AYNnCsrKI9rRXIorX0hUi5
 58NizS9k68Ky9x1FbGvIRLdYCWBZek1Q8b+JJanU7YzB33r1I6Vizn6O+uwMtFpubGCud8lfGcX
 QSCkIwWeQQef9
X-Received: by 2002:a1c:ca02:: with SMTP id a2mr2587667wmg.127.1567680488414; 
 Thu, 05 Sep 2019 03:48:08 -0700 (PDT)
X-Received: by 2002:a1c:ca02:: with SMTP id a2mr2587648wmg.127.1567680488115; 
 Thu, 05 Sep 2019 03:48:08 -0700 (PDT)
Received: from [192.168.1.48] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id t203sm2781008wmf.42.2019.09.05.03.48.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 05 Sep 2019 03:48:07 -0700 (PDT)
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org
References: <20190904193059.26202-1-richard.henderson@linaro.org>
 <20190904193059.26202-61-richard.henderson@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <4ca91971-bfdd-976a-5b9d-d38b42f826a7@redhat.com>
Date: Thu, 5 Sep 2019 12:48:06 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190904193059.26202-61-richard.henderson@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 60/69] target/arm: Split
 gen_nop_hint
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: YM54hLih+lt9

On 9/4/19 9:30 PM, Richard Henderson wrote:
> Now that all callers pass a constant value, split the switch
> statement into the individual trans_* functions.
>=20
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/translate.c | 67 +++++++++++++++---------------------------
>  1 file changed, 24 insertions(+), 43 deletions(-)
>=20
> diff --git a/target/arm/translate.c b/target/arm/translate.c
> index 69092c12c3..d076c962ea 100644
> --- a/target/arm/translate.c
> +++ b/target/arm/translate.c
> @@ -3061,46 +3061,6 @@ static void gen_exception_return(DisasContext *s=
, TCGv_i32 pc)
>      gen_rfe(s, pc, load_cpu_field(spsr));
>  }
> =20
> -/*
> - * For WFI we will halt the vCPU until an IRQ. For WFE and YIELD we
> - * only call the helper when running single threaded TCG code to ensur=
e
> - * the next round-robin scheduled vCPU gets a crack. In MTTCG mode we
> - * just skip this instruction. Currently the SEV/SEVL instructions
> - * which are *one* of many ways to wake the CPU from WFE are not
> - * implemented so we can't sleep like WFI does.
> - */
> -static void gen_nop_hint(DisasContext *s, int val)
> -{
> -    switch (val) {
> -        /* When running in MTTCG we don't generate jumps to the yield =
and
> -         * WFE helpers as it won't affect the scheduling of other vCPU=
s.
> -         * If we wanted to more completely model WFE/SEV so we don't b=
usy
> -         * spin unnecessarily we would need to do something more invol=
ved.
> -         */
> -    case 1: /* yield */
> -        if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
> -            gen_set_pc_im(s, s->base.pc_next);
> -            s->base.is_jmp =3D DISAS_YIELD;
> -        }
> -        break;
> -    case 3: /* wfi */
> -        gen_set_pc_im(s, s->base.pc_next);
> -        s->base.is_jmp =3D DISAS_WFI;
> -        break;
> -    case 2: /* wfe */
> -        if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
> -            gen_set_pc_im(s, s->base.pc_next);
> -            s->base.is_jmp =3D DISAS_WFE;
> -        }
> -        break;
> -    case 4: /* sev */
> -    case 5: /* sevl */
> -        /* TODO: Implement SEV, SEVL and WFE.  May help SMP performanc=
e.  */
> -    default: /* nop */
> -        break;
> -    }
> -}
> -
>  #define CPU_V001 cpu_V0, cpu_V0, cpu_V1
> =20
>  static inline void gen_neon_add(int size, TCGv_i32 t0, TCGv_i32 t1)
> @@ -8194,19 +8154,40 @@ DO_SMLAWX(SMLAWT, 1, 1)
> =20
>  static bool trans_YIELD(DisasContext *s, arg_YIELD *a)
>  {
> -    gen_nop_hint(s, 1);
> +    /*
> +     * When running single-threaded TCG code, use the helper to ensure=
 that
> +     * the next round-robin scheduled vCPU gets a crack.  When running=
 in
> +     * MTTCG we don't generate jumps to the helper as it won't affect =
the
> +     * scheduling of other vCPUs.
> +     */
> +    if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
> +        gen_set_pc_im(s, s->base.pc_next);
> +        s->base.is_jmp =3D DISAS_YIELD;
> +    }
>      return true;
>  }
> =20
>  static bool trans_WFE(DisasContext *s, arg_WFE *a)
>  {
> -    gen_nop_hint(s, 2);
> +    /*
> +     * When running single-threaded TCG code, use the helper to ensure=
 that
> +     * the next round-robin scheduled vCPU gets a crack.  In MTTCG mod=
e we
> +     * just skip this instruction.  Currently the SEV/SEVL instruction=
s,
> +     * which are *one* of many ways to wake the CPU from WFE, are not
> +     * implemented so we can't sleep like WFI does.
> +     */
> +    if (!(tb_cflags(s->base.tb) & CF_PARALLEL)) {
> +        gen_set_pc_im(s, s->base.pc_next);
> +        s->base.is_jmp =3D DISAS_WFE;
> +    }
>      return true;
>  }
> =20
>  static bool trans_WFI(DisasContext *s, arg_WFI *a)
>  {
> -    gen_nop_hint(s, 3);
> +    /* For WFI, halt the vCPU until an IRQ. */
> +    gen_set_pc_im(s, s->base.pc_next);
> +    s->base.is_jmp =3D DISAS_WFI;
>      return true;
>  }

Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>


