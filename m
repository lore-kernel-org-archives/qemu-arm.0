Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp9909042wrv;
        Fri, 9 Aug 2019 19:03:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz31G7tphEyJS7px75lJKqbj6ID12BOVuN5ooiHdDza4vpwaY6toyAYNhLL+SW5D1TxKjue
X-Received: by 2002:a50:84e2:: with SMTP id 89mr25271725edq.218.1565402634149;
        Fri, 09 Aug 2019 19:03:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565402634; cv=none;
        d=google.com; s=arc-20160816;
        b=sX0qUZmBShxlGa1f4+eg79JxRrINca8Grv1eUJ067vp9bYGsBEVXW3Wq0Zxv4HfUgp
         EYyZX0YLCw8MSEuk+XQkmRc59PG8Tv9wovNKvcOqy4A93dQkydDEmuEyNIAjIFas1oeE
         Up+fLYQWhwLQMLlQAcCZSOuZ54wQN4GA3F5QILuHIANCj8EHzmDX90gLa8cjOhKli/Lv
         no138gKLlCXqBdK5W4/Zt4p6ccoDIzMpJFUk2GWxVrjnX+7XTlZmx5n0qJ2rmhN5wEe/
         J3cr1F50gd9w2M4tJmQkeCLicNuhqztYkpfJ9cA7pzvijTD7JdokR/W6Hkwo+7udK+x6
         RIBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=G+duk7zj6MtgC/aAwGWmgTHU09nMOBNrTdfA+ShMYzQ=;
        b=HXhJTMpV+Y4k7Ac7iNxCBLjtU4ATcHyTMBrxSNhFHRNIbepbLQY4S53pvBEjLY00ZH
         QAmLJqOsUExDFtJ9eCMFe8C2QdJ0NMk4o2/3Lj/kYbwfbGBkBWOCsT3mNe+Jyqf+5wRC
         pwS6bES/0CxO2rVKxN+U5SdmB1Ju1rNxKMi2gwMRVwy6D8NWEdD6fx4gzTLqzB/MAH83
         mLRyiXF/Bc43BuulB6VazIOZ1Re7awy7zif9+jkg4Oq3zzzErzST4Gdi3bCzDSjWAxGS
         td30uNlSXB7k60Mi4mF7s37wJskA/iJzUb7i/WTDwaoS4rrS3i2Wsd1lzhUEaewqMiD5
         gvOA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ivjwWNzk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g18si40646145eda.145.2019.08.09.19.03.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Aug 2019 19:03:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ivjwWNzk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:34508 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hwGjZ-0005pK-95
	for alex.bennee@linaro.org; Fri, 09 Aug 2019 22:03:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49639)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <alistair23@gmail.com>) id 1hwGjJ-0005jx-3D
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 22:03:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1hwGjH-0005Vc-Ui
 for qemu-arm@nongnu.org; Fri, 09 Aug 2019 22:03:37 -0400
Received: from mail-lf1-x142.google.com ([2a00:1450:4864:20::142]:43533)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1hwGjF-0005UM-E9; Fri, 09 Aug 2019 22:03:33 -0400
Received: by mail-lf1-x142.google.com with SMTP id c19so70820110lfm.10;
 Fri, 09 Aug 2019 19:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G+duk7zj6MtgC/aAwGWmgTHU09nMOBNrTdfA+ShMYzQ=;
 b=ivjwWNzk8ipDxC3VQYTvmMt+zfdmN0iS+KPv8c9iEJ2HTt6ck7wYgnFelZwwqH+u/e
 TbFLrONgrU+pKmcTgT+ipVp6Oq8sXKZIRAs7n4N2HXi7yABvBcoZApzvHE4LXBQ3mkp8
 TuhJoczaH5cxEyFMavgSr4MEl3bxpEG0dKk9KZ5Gw77lmjTevD+ts8XODOlhgxbuZVea
 04R2AlZkU2a0RPfiz3e9KGo1MLQXE2SdxrRlrGhV5LpsgLMEwGxIz5jkw0/v/rrR+ZNO
 Rr11DEAGuW0kbnMY5ydq/lb6xN103BncbyeL2OObkJukycpmWf8fNEjYs4J3Y8kQ+OYv
 sERQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G+duk7zj6MtgC/aAwGWmgTHU09nMOBNrTdfA+ShMYzQ=;
 b=lJ+EiJPq955CBnzX0pq/0JkmGCoOx/sFSOa0+D2QD9X6pVOxBvmzE236CxHu8hLYCk
 zZm2Zqh3EUBv1XhHskCkaSz0ydvhgDpb7CrGFCmbCOQk+XOVLd13D8BqyUlP7qTrDEf9
 i1HJhmTAKS7++8dTXosJG/mQzbYL0BTpixoQO9e0srxxobut/W14I7Yq9ziqYnLQbBcp
 aI1QdTPoL/oGBq+dinA3s2Y1nN3n1HjQuCbwl3nQ1uhx1f8fguJScYwBFZRtjTPl9llI
 hVz9hYSw6T7brfL/hkSmFtT7MKsc8ppuWFaKJcdOfSWREsQRA+WW0z9hp6NBpWN+nRqL
 qXmg==
X-Gm-Message-State: APjAAAVddYoYPgh92dO5+e5EH3fHchtF/rHF3yNv7LxomRhkYO14GnIM
 QJi/Ap83uD9XwOJlSoBMCRxxuz1k0CwLm3Qbad4=
X-Received: by 2002:a19:ed11:: with SMTP id y17mr14331811lfy.141.1565402612044; 
 Fri, 09 Aug 2019 19:03:32 -0700 (PDT)
MIME-Version: 1.0
References: <20190809154153.31763-1-richard.henderson@linaro.org>
 <20190809154153.31763-4-richard.henderson@linaro.org>
In-Reply-To: <20190809154153.31763-4-richard.henderson@linaro.org>
From: Alistair Francis <alistair23@gmail.com>
Date: Fri, 9 Aug 2019 19:03:05 -0700
Message-ID: <CAKmqyKP7DU0ZAB9ruOxVQxCLevw0XO8378oZc+diQAxpmqifWg@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::142
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 3/3] target/riscv: Remove
 redundant declaration pragmas
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 "open list:RISC-V" <qemu-riscv@nongnu.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <Alistair.Francis@wdc.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e7fOPZ2RGGBL

On Fri, Aug 9, 2019 at 8:43 AM Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> These are now generated by decodetree itself.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  target/riscv/translate.c | 19 +------------------
>  1 file changed, 1 insertion(+), 18 deletions(-)
>
> diff --git a/target/riscv/translate.c b/target/riscv/translate.c
> index 8d6ab73258..adeddb85f6 100644
> --- a/target/riscv/translate.c
> +++ b/target/riscv/translate.c
> @@ -708,26 +708,9 @@ static bool gen_shift(DisasContext *ctx, arg_r *a,
>  #include "insn_trans/trans_rvd.inc.c"
>  #include "insn_trans/trans_privileged.inc.c"
>
> -/*
> - * Auto-generated decoder.
> - * Note that the 16-bit decoder reuses some of the trans_* functions
> - * initially declared by the 32-bit decoder, which results in duplicate
> - * declaration warnings.  Suppress them.
> - */
> -#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
> -# pragma GCC diagnostic push
> -# pragma GCC diagnostic ignored "-Wredundant-decls"
> -# ifdef __clang__
> -#  pragma GCC diagnostic ignored "-Wtypedef-redefinition"
> -# endif
> -#endif
> -
> +/* Include the auto-generated decoder for 16 bit insn */
>  #include "decode_insn16.inc.c"
>
> -#ifdef CONFIG_PRAGMA_DIAGNOSTIC_AVAILABLE
> -# pragma GCC diagnostic pop
> -#endif
> -
>  static void decode_opc(DisasContext *ctx)
>  {
>      /* check for compressed insn */
> --
> 2.17.1
>
>
