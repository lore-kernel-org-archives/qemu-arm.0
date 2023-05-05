Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp373614ejq;
        Fri, 5 May 2023 05:19:43 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6MYYVqWaWx+WkOU3MS+ADay/j74BfXurrlZREOHas+G3tsMhBz0wIoDOgCX9S94/UL5qgd
X-Received: by 2002:a05:622a:134a:b0:3ef:612c:5877 with SMTP id w10-20020a05622a134a00b003ef612c5877mr2122869qtk.58.1683289183660;
        Fri, 05 May 2023 05:19:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683289183; cv=none;
        d=google.com; s=arc-20160816;
        b=rPbzEfb8B4zoWOTGsXDV1QVP+qDWx6lsKx/Et72p15zARb1gd+P1N2JhGrlYqbYkox
         YTsKyiBkp4ZUjXGBS+12DrFxdbIfApQaA8TxNcMO6xsARhySqK5t3wm7zT+Tk9jaiZ/X
         zsQeb4nqcVfbDzSPkVLI+rDWwkdskoD6bDQb1QUPZwf/3i61F0K55vshM5Ok/umBjT4n
         FFVKECW9hRd6qad7XHh5+B1H1Pi8n7FECIyMbDuyTMTsr+PJ+mX6nv/j0Tjaho5/Rdkd
         1uqWMy9CgcZ41T2tsK1bLfQMTd5BjSTm1KENmajDZN4D5mLqWEOcWzbRd9SwYp+1z5ed
         ziUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9F9nrHIqT4cHL2HPKkO52PNi9k2pPqn6K/rFeFi5Ry4=;
        b=MUQJYa5njjAA9oAKLChegcLZSt8UVva8GkT+lPO8LWyKgUSK0PSLbBRtD7E/nDilCX
         VGu8eYFbbieG74Yh8a/ekm7f1LhSAcClGULL9eIs7BBG47fSakg/BNW8VNSIt/Y1FvtB
         yjaeoc4wArQ+nL3ZBgH8qjfPGTNF9b+a1J3y2uKVQm/0IWsKMNexHFfDfsXAQzzu62kb
         fscaM0pvsIxwetcZtUC84hX1Jl6JHIssGK194ToGOssRgRJdNn2TLaqdoZATe4zs0NYW
         XyBYIJvX9o/R8DhgraRjRRLY6kDt58A46wYgVlEwWsJyA4iI6P7npVY5okiA8ibFQzzp
         MTXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HGMtyuoL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p26-20020a05620a113a00b0074fc9129321si607931qkk.321.2023.05.05.05.19.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 05:19:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HGMtyuoL;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puuPH-0002xj-Ri; Fri, 05 May 2023 08:19:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuPG-0002wm-AJ
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:19:26 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puuPE-0008U6-LS
 for qemu-arm@nongnu.org; Fri, 05 May 2023 08:19:26 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-50bdd7b229cso3295810a12.0
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 05:19:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683289163; x=1685881163;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9F9nrHIqT4cHL2HPKkO52PNi9k2pPqn6K/rFeFi5Ry4=;
 b=HGMtyuoLL2+O/0f+8+w50i63tj0yXTMCLP2v3JPX7nJC9FCfGcpA4KjJpA+1vIb6QR
 E9nTKpdB0i1TcaNrvpIjFZVCWH9Y6xVET6pPJqPeIkLT6mQn6j8idScb8ormzNtYNbbP
 3ublb9KCEIidaaaSQ2DOaYbtnVJRBBgE9SSdtXQBooXp6GI2NVATSxJLLjRoRWaWiPUm
 QHY/gmmifpyJEFXb1sGs7kr15vQ0du1U7qkL8JhSJcpLPNyqWGxOj0WfCbhInu59Az3F
 Lnbic9lNYNFZiWnEecgRno57jmfFHDIGp7fkib7xo+uCVh78fU5kHPQGbJD+pcqlTBic
 uo9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683289163; x=1685881163;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9F9nrHIqT4cHL2HPKkO52PNi9k2pPqn6K/rFeFi5Ry4=;
 b=V2lTAEBr3+ufgtO7wibmsyCCEEKQYYi429wRSJ/vSVJtfzy5xHEbBf3obdmj3prdji
 sS+t1vkcsZQ8lC2FeI0Acb0RYjSqA28CsS10ye4cq/ZuDyU1jAk3Snrw1I6kH/n3pgyj
 NpeQuXCGHYAdB3Iu+1F9BK/hKCGOBfGOQmBTVGgoZB2wtQ8U5qGyj93cHMjZMsXh6evX
 ESB4kOg6iZi6bxhinDhcwP9NcSlU+Ni1cOEeZQMwMPxqZ8sSdalygaTr/syOczGGHGVQ
 +UQ+U8dtZDiZGlFyUhzb2Q906sTmT/r+XtTkWB1NWNmIlAU6GfRn4EAJ4ne+ZPLueW5B
 jOsA==
X-Gm-Message-State: AC+VfDxb+pVc1mb8akEM5Uq3IxB2pzGVWDWU1EPivKjYzLvq0px4QgYw
 8KGfUDA3ukJ1El96q+aa/2pAiDCainNflks70OtPi3aMoIqndpkY
X-Received: by 2002:a05:6402:685:b0:50b:f7b2:79d0 with SMTP id
 f5-20020a056402068500b0050bf7b279d0mr1284208edy.31.1683289163158; Fri, 05 May
 2023 05:19:23 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-31-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-31-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 13:19:12 +0100
Message-ID: <CAFEAcA9dOpZUeCnkHxmSAPTs20ZuUW++kFEtp2icmmST=yGPvA@mail.gmail.com>
Subject: Re: [PATCH v4 30/57] tcg/sparc64: Allocate %g2 as a third temporary
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: emMgxk0oSLwt

On Wed, 3 May 2023 at 08:17, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/sparc64/tcg-target.c.inc | 15 +++++++--------
>  1 file changed, 7 insertions(+), 8 deletions(-)
>
> diff --git a/tcg/sparc64/tcg-target.c.inc b/tcg/sparc64/tcg-target.c.inc
> index e997db2645..64464ab363 100644
> --- a/tcg/sparc64/tcg-target.c.inc
> +++ b/tcg/sparc64/tcg-target.c.inc
> @@ -83,9 +83,10 @@ static const char * const tcg_target_reg_names[TCG_TARGET_NB_REGS] = {
>  #define ALL_GENERAL_REGS     MAKE_64BIT_MASK(0, 32)
>  #define ALL_QLDST_REGS       (ALL_GENERAL_REGS & ~SOFTMMU_RESERVE_REGS)
>
> -/* Define some temporary registers.  T2 is used for constant generation.  */
> +/* Define some temporary registers.  T3 is used for constant generation.  */
>  #define TCG_REG_T1  TCG_REG_G1
> -#define TCG_REG_T2  TCG_REG_O7
> +#define TCG_REG_T2  TCG_REG_G2
> +#define TCG_REG_T3  TCG_REG_O7
>
>  #ifndef CONFIG_SOFTMMU
>  # define TCG_GUEST_BASE_REG TCG_REG_I5
> @@ -110,7 +111,6 @@ static const int tcg_target_reg_alloc_order[] = {
>      TCG_REG_I4,
>      TCG_REG_I5,
>
> -    TCG_REG_G2,
>      TCG_REG_G3,
>      TCG_REG_G4,
>      TCG_REG_G5,
> @@ -492,8 +492,8 @@ static void tcg_out_movi_int(TCGContext *s, TCGType type, TCGReg ret,
>  static void tcg_out_movi(TCGContext *s, TCGType type,
>                           TCGReg ret, tcg_target_long arg)
>  {
> -    tcg_debug_assert(ret != TCG_REG_T2);
> -    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T2);
> +    tcg_debug_assert(ret != TCG_REG_T3);
> +    tcg_out_movi_int(s, type, ret, arg, false, TCG_REG_T3);
>  }

Why do we need to change this usage of TCG_REG_T2 but not
any of the others ?

thanks
-- PMM
