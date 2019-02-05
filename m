Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5161046wrt;
        Tue, 5 Feb 2019 12:07:19 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbsvBLzWNHd7vS8maWNBdKX/rW+ex0oTuLU8TEfcodmgH4wC4QXRFDnSx9uvaLuV8yyxwfn
X-Received: by 2002:a81:b306:: with SMTP id r6mr5688355ywh.512.1549397239485;
        Tue, 05 Feb 2019 12:07:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549397239; cv=none;
        d=google.com; s=arc-20160816;
        b=KhbOF/tUu9J1Z0/HD8G9r4gkn9d0EhtN0cNogE+EdfgUSwT0ZrbkJ/PFA5YYlTji8O
         5Y/ysRf4vr6Kwr5tUc0U5D4DS/750RsI65H2z84fjTzLsDRqvt+/1SZQXv6L17ltiTHl
         d+Jois+suHqNJWGDf6wYgGF7v3OmQKCP/qW2/sZcNi/h3NzmGJIrQuUlavM9yCQtzfpG
         8HUdjUltZq80zz44WxmALzkX9X6kz7+0187mK3nxn8/0dAczvdgj/RzYK2yQzRryGbPO
         /WZ0p0UOBJrRAeAewWLVLC+bK9+fNv6IFt0cGarqN07l57VqG5PZzDVbHr0JLnrqXglP
         5y9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=eL6paCk0Fox6Ojm1iP+MEnQ9JeBM4sdBPzdP9p5RgBo=;
        b=jvJHiV4Uv8UmH5L3jaNfF/oqYMLfhJGxApVshurYjA8nw15BZiocN8NFmoyeoaUrqB
         hrVBGeDFW7i8CTh5pzahnUheTmWFnIzH3dqWs2mQB3xuO5ikPQJcodwBte1EyJpNvntg
         qXCbx0aQxTWhttZ0vjPoXvePPm3TN86MVzpOd5vfro+9UYltyXm7v3BDy5t4rGF9KQEi
         HaI6cjNjPAjPIOAmvpqV41/VNg9G6Jx+iKTKdqppda+yyPxXgQEOKV7R2tNaiZfdE+Qc
         jbPgieOKPoEDK9vttQeIdSb2KbUfeobO4IFFnhd2qPxYWL/z+HQT4xXziSBAU4gtJyCd
         g/6g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PSwBhOrK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r4si2428354ybf.122.2019.02.05.12.07.19
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 12:07:19 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PSwBhOrK;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:39658 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr702-00018k-Im
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 15:07:18 -0500
Received: from eggs.gnu.org ([209.51.188.92]:54067)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gr63I-0002Iw-Qa
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 14:06:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gr63B-0006AB-HM
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 14:06:33 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:40155)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gr636-00066T-Sf
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 14:06:26 -0500
Received: by mail-ot1-x341.google.com with SMTP id s5so7626787oth.7
	for <qemu-devel@nongnu.org>; Tue, 05 Feb 2019 11:06:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=eL6paCk0Fox6Ojm1iP+MEnQ9JeBM4sdBPzdP9p5RgBo=;
	b=PSwBhOrKe6frG1Asnn5pmYbvp+mz+/hsfNhPO3Jf1iZNDqXTyX3dYyfpQ3/TY8l/6P
	62X/CUFb+eNi52eQ3lrCECZisHooFdwX3AhM5EahDYd5p0h1xHA642ghsmvXkYFZlTvC
	zlaZ7ghKKYSND2fhmLcPI039l7kHT+/XDagM0yJ9043cWqtHQNIk2ug5DEGoobdyuxXH
	Xtf+FPlC7sO1f6I37Bv4EeZxuRE6CokTKLi6LwJPMoIOaqTl39NlKWrUkC/RAmL5xY6c
	naiY+lwEPgekzxpDPK0xXeXA8YwmZq4w1gkK/6h1IbAGNbSKgy68UP1OaQHek7dZK9B5
	IRGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=eL6paCk0Fox6Ojm1iP+MEnQ9JeBM4sdBPzdP9p5RgBo=;
	b=rnqnlNF7OwhJZsDShcL65TTccfq3Y7hfp1fMdvhqpOplrgxWT98qSzPHYmtMsnhMYo
	mi973fggLeazzdOqwyFM6inX68ocI3Lvkt8PDZurbAVJl6swvPjmppt0/jh1yqU+XjbE
	s8Y+/ehRyhUPrT50IpaxVdXNw6RRYsKoXePrMFZN63oWaCAkZHpt78/ybOljxuYPI3SP
	e/df+rQ2rS+kvAuD/etKBLM6b/FjlL/QJiG2YK2Fdbd8iRUjtg0nRrXc/T/s37EzCbUp
	Qp9j2AtkRaSl0H8pwhnRV58E1o6NRm8yhtx23al8HRrt3mqWItvPPrqCKQVXOw6Xpec6
	yWfw==
X-Gm-Message-State: AHQUAubcqwfmSUXomLyysOiI7brbeuw9w9brI0FLpa44G71Jnk2ex01P
	Wg+cIpR9lWohrP9uE2mEJa3JOov5Khj0/SW3kVXn/vW8PE0=
X-Received: by 2002:a9d:5a81:: with SMTP id w1mr3622362oth.317.1549393576105; 
	Tue, 05 Feb 2019 11:06:16 -0800 (PST)
MIME-Version: 1.0
References: <20190114011122.5995-1-richard.henderson@linaro.org>
	<20190114011122.5995-2-richard.henderson@linaro.org>
In-Reply-To: <20190114011122.5995-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Feb 2019 19:06:04 +0000
Message-ID: <CAFEAcA9Kj5fXB6fe_hJAGbqG0ftjh9+VrqQQEy4bEQ6iFB508A@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH 01/17] target/arm: Add MTE_ACTIVE to
 tb_flags
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HRfqqVMhUknf

On Mon, 14 Jan 2019 at 01:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> When MTE is fully enabled, i.e. access to tags are enabled and
> tag checks affect the PE, then arrange to perform the check
> while stripping the TBI.
>
> The check is not yet implemented, just the plumbing to that point.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> @@ -0,0 +1,32 @@
> +/*
> + * ARM v8.5-MemTag Operations
> + *
> + * Copyright (c) 2019 Linaro, Ltd.
> + *
> + * This library is free software; you can redistribute it and/or
> + * modify it under the terms of the GNU Lesser General Public
> + * License as published by the Free Software Foundation; either
> + * version 2 of the License, or (at your option) any later version.

Do you mean LGPL version 2.1 here, or GPL version 2?

> + * This library is distributed in the hope that it will be useful,
> + * but WITHOUT ANY WARRANTY; without even the implied warranty of
> + * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> + * Lesser General Public License for more details.
> + *
> + * You should have received a copy of the GNU Lesser General Public
> + * License along with this library; if not, see <http://www.gnu.org/licenses/>.
> + */
> +
> +#include "qemu/osdep.h"
> +#include "cpu.h"
> +#include "internals.h"
> +#include "exec/exec-all.h"
> +#include "exec/cpu_ldst.h"
> +#include "exec/helper-proto.h"
> +
> +
> +uint64_t HELPER(mte_check)(CPUARMState *env, uint64_t ptr)
> +{
> +    /* Only unchecked implemented so far.  */
> +    return sextract64(ptr, 0, 55);

Are you sure this is right? I think that unchecked accesses
should work the same as if MTE isn't active at all, ie
do all the stuff gen_top_byte_ignore() does. If you look
at the pseudocode for AArch64.MemSingle[]:
https://developer.arm.com/docs/ddi0596/b/shared-pseudocode-functions/aarch64-functionsmemory-pseudocode#AArch64.MemSingle.write.4

the address (hidden inside 'memaddrdesc' passed down to the
_Mem[] accessor isn't changed by any of the code guarded by
the "if HaveMTEExt()" conditional.

In fact both checked and unchecked accesses ought to do this to
get the vaddr to use from the input vaddr.

> +}
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index ee6f71c98f..0286507bae 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -339,7 +339,13 @@ static void gen_a64_set_pc(DisasContext *s, TCGv_i64 src)
>  static TCGv_i64 clean_data_tbi(DisasContext *s, TCGv_i64 addr)
>  {
>      TCGv_i64 clean = new_tmp_a64(s);
> -    gen_top_byte_ignore(s, clean, addr, s->tbid);
> +
> +    /* FIXME: SP+OFS is always unchecked.  */
> +    if (s->tbid && s->mte_active) {
> +        gen_helper_mte_check(clean, cpu_env, addr);
> +    } else {
> +        gen_top_byte_ignore(s, clean, addr, s->tbid);
> +    }
>      return clean;
>  }

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
