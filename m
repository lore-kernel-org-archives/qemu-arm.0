Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp412527ejq;
        Fri, 5 May 2023 06:19:24 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ59sgBKd6SMnmaJXEYWfamytyFvltnrhCgsnKJyN5bY3ZI6+IuKzsnVcHOO+r7n62pKsrYo
X-Received: by 2002:ad4:5f0a:0:b0:5e6:798f:a7c3 with SMTP id fo10-20020ad45f0a000000b005e6798fa7c3mr2239531qvb.39.1683292764485;
        Fri, 05 May 2023 06:19:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683292764; cv=none;
        d=google.com; s=arc-20160816;
        b=RB+jtIpiBHTC/JfIxgBly+OjI3p7e6jFDD/Wq5Cx3qmDeu8co6nU5rKRU5lxBbENUX
         hCkUD+4gzMERgZSbN1Pe1OULgUwdZDykGPCL8WhRlZo2XI1DA84EyyFxDb2suGUN20dd
         NM+ibcuy3cJtUxyFWBqXUcEZQTAAV68nXDjKUbcYS7QnXH6qeZPuGNovNrSWrRusjEW2
         pvrUYz5kHooDC3BF9Swyem0TF2VVfkrcf5gE44QohSJP8LJNFZuCayY3VSz4Pueu4DW4
         q9LQxTHAth+UB6lOEFwAtZZtqnjL+6Bp6er87iRdQVJltn2BGPpLhuWLZtWsWzwu0AKp
         O6zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1iJg/In4kVZIJb5M1mlBGflolji94+DeBxWhy9kvlPs=;
        b=AnZnn0LHAhef5ueU5zd7lAjcYau8fdPhxUM6B6E8geGPTuhiVYzguhDFs3zWs8drJf
         Hst7Yh+rLvt43PqAoHR6EEVW7VR/nfqZCb9hPMcLuqTdyqEwhSHj0PZ5sXa175mGlCu5
         f0T5DA4HCAZqXDm+k5/zSpLPXk96ORYFVe7f8Zh3q+3BnUUxqp2HgpLYiaJ2neXvhQfa
         rSyOW4qqwY9A1pC42ygOUw0m6oZIXD3B2g35FEon55NVEDMGurrTFP1Ar+qnVQGkMA3o
         lMxwCCG2X9Su2Mv/b9NvwRlmnj2QD62+lj5dkXZ/S3a+rKK4t1+I9IQqt2l629qmtjda
         /uRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VIJPxRZI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h20-20020a05620a10b400b00745e3f7670dsi645555qkk.353.2023.05.05.06.19.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 06:19:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VIJPxRZI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1puvL0-0001HK-IZ; Fri, 05 May 2023 09:19:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvKz-0001G8-5o
 for qemu-arm@nongnu.org; Fri, 05 May 2023 09:19:05 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvKx-0006Lh-Hw
 for qemu-arm@nongnu.org; Fri, 05 May 2023 09:19:04 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-50bd875398dso2682504a12.1
 for <qemu-arm@nongnu.org>; Fri, 05 May 2023 06:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683292742; x=1685884742;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=1iJg/In4kVZIJb5M1mlBGflolji94+DeBxWhy9kvlPs=;
 b=VIJPxRZIaTDhIhZpK1UEGjVGZ1ORFIv2QT1s8gBCZqq6kv7JorqY31UKHpU3PDD+iU
 Ekk3F3KE6G37rG6TVdOXgjMOlQXiZewbUHCEluTsBqsTVHIIerPn+tFY8ygJ3v2qJTzE
 2o9K705IByIJnBEarJQFWjkMR4dBEXNgcLAmoLZzgAYnKMsaRr95J3SEYbrft6bQ4h4k
 9TD8TzQGPFQiWwdY+r7/vhYoUbHR7C+rrJGz5U2MPZmiwpPkcv+k2kPtt5AUTFvmxteb
 z+/Q5vTfxtne/yHH/AozILSvMRN63DSCRZee3PP6PkQ2n+fLg6hJ3omtI0nuWJMgeqUr
 vxAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683292742; x=1685884742;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1iJg/In4kVZIJb5M1mlBGflolji94+DeBxWhy9kvlPs=;
 b=atorrTJ2HKMRQFR6HUvXt8OPkY5pGmhujwsCIv46RiauIGb7fo4IQtHKJElT22Ep55
 VZbxkN44FyE7u8HFeNQlTbUPcPILdCzXQ5x6yNf6rt/sp0l4KMnjoW/FbZfBDZ4oQhuV
 m4iqv98kbg4GuK1srtu0011Y1o0owxkWL7BZx6bEDCRiNKOdLPP2cMtJRJTXX2AFf9Vn
 Hvvvc+KWMeBhXmsCRsfcqkaEmggxSg5mQcYJ04+eCgAzqeseryhbjL4JlMInR+q0yKda
 0Lf3ZIPo3gzEx3ZBdhtuLVlmapoG2PO20nHVXA4DYn9lpFNfkkBK/h/kjriAQl1EuAby
 W5Tw==
X-Gm-Message-State: AC+VfDwlKsNubDVP8wigrR8H1S6wDVwCBFQBAyQqQ9f7QprnTiyE9Y1/
 v313ZiU4OzDfCrWR/6npUnvFqeUFBzRGXKV/pwyv3A==
X-Received: by 2002:a05:6402:31f4:b0:50b:c370:4967 with SMTP id
 dy20-20020a05640231f400b0050bc3704967mr1666027edb.19.1683292742207; Fri, 05
 May 2023 06:19:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-49-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-49-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:18:51 +0100
Message-ID: <CAFEAcA8G_AAmPuNhX9k3AqAFStJ7mnMftoEH6N08abRz8i-ZSQ@mail.gmail.com>
Subject: Re: [PATCH v4 48/57] tcg/ppc: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: x49UW38nqDcE

On Wed, 3 May 2023 at 08:13, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/ppc/tcg-target.c.inc | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
>
> diff --git a/tcg/ppc/tcg-target.c.inc b/tcg/ppc/tcg-target.c.inc
> index f0a4118bbb..60375804cd 100644
> --- a/tcg/ppc/tcg-target.c.inc
> +++ b/tcg/ppc/tcg-target.c.inc
> @@ -2034,7 +2034,22 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
>  {
>      TCGLabelQemuLdst *ldst = NULL;
>      MemOp opc = get_memop(oi);
> -    unsigned a_bits = get_alignment_bits(opc);
> +    MemOp a_bits, atom_a, atom_u;
> +
> +    /*
> +     * Book II, Section 1.4, Single-Copy Atomicity, specifies:
> +     *
> +     * Before 3.0, "An access that is not atomic is performed as a set of
> +     * smaller disjoint atomic accesses. In general, the number and alignment
> +     * of these accesses are implementation-dependent."  Thus MO_ATOM_IFALIGN.
> +     *
> +     * As of 3.0, "the non-atomic access is performed as described in
> +     * the corresponding list", which matches MO_ATOM_SUBALIGN.
> +     */
> +    a_bits = atom_and_align_for_opc(s, &atom_a, &atom_u, opc,
> +                                    have_isa_3_00 ? MO_ATOM_SUBALIGN
> +                                                  : MO_ATOM_IFALIGN,
> +                                    false);
>

Why doesn't this patch have changes to a HostAddress struct
like all the other archs ?

-- PMM
