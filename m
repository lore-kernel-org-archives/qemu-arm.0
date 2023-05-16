Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp299908ejq;
        Tue, 16 May 2023 03:04:12 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6ejex0ZgwMlh5IPn+MNv8dtAXSfXz6DrkoypBpJxjJfbOosxZiqZAavnOgoR8wJrJv3acA
X-Received: by 2002:a05:6214:76a:b0:5cc:277c:b4e with SMTP id f10-20020a056214076a00b005cc277c0b4emr52832038qvz.39.1684231452460;
        Tue, 16 May 2023 03:04:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1684231452; cv=none;
        d=google.com; s=arc-20160816;
        b=u6aSLTcaqWlMabvp78gbz8kLic3YnGlEDoWqXdkvrxfeKrwXoIFrPI+E5kxqtLvyVc
         /cI71pDtiazDWYLYTStzUoQ21MGXmNFijTPMnYDBqzknOCgip6tKFqmqmgo0pBPBJPco
         rsgjYpinmUVuxibd++iSbKv6o0zEZrx7+wGgG8AaoCF8j6COIyrELY7tYFiBk+cRp+J8
         djQ5xLyunjy0uz8oXrTZbMVSX0g1Vs1bisplgMcW6WnkwuNXetO9inR8ubt6Yg1nzD+d
         fwRwX4u8eWFHIF6lHtNre/VFzmqnFUD0X1bzbW4zgVN1iws6Mk7RaHe9V/sbzBZSF+Fn
         FVag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=B02yTngxMnAee0/3R997bsusi8j0y7DHL+MtX8Stoeg=;
        b=zDAkUowTj/JjcpeE8LUC+E4nMGTTH1z9rAjmlFjGF4xy+LkVDfhPstBGAYKx+0kXig
         qu7t70zLNWfXVAZP7yN8FrpttX7tPxZFhBvY+mn1fEjt+8DyXD66uqnpoJWSRw641QDS
         xjN3wDQmxv/7C84zTSJrtll1OMOT6B+y+6Bw3v7578roMqNeQNKTt0dav0NBzcRjjuad
         5pokD79PqLLqOOpenRSctgE/E5i7EI81ctzJATaTPwSfd8BMijAKmi4qgxpflxDQ6ROS
         irkzUtG4vqO0YWaIW5ZOehOwmxsYQoF4BTIHp0vksIqtFJkc/8C6nhUUscgEk/VCqUxU
         bxdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FAUuy3BB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id i25-20020ae9ee19000000b0073b76fc912asi847863qkg.762.2023.05.16.03.04.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 May 2023 03:04:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FAUuy3BB;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pyrWu-0000gt-TQ; Tue, 16 May 2023 06:03:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyrWt-0000dl-1d
 for qemu-devel@nongnu.org; Tue, 16 May 2023 06:03:39 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pyrWr-0003Rt-DH
 for qemu-devel@nongnu.org; Tue, 16 May 2023 06:03:38 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-51090206721so178966a12.0
 for <qemu-devel@nongnu.org>; Tue, 16 May 2023 03:03:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684231416; x=1686823416;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=B02yTngxMnAee0/3R997bsusi8j0y7DHL+MtX8Stoeg=;
 b=FAUuy3BBEQmXbHq1UHcDFiJ142lUOZGRVajGUCEsRET+zc6r9bIO9YKsU+jwO12+xW
 Wv3xyV9YpPMlb0hqW6mI7xUkeT/+k8IhLVRpEdjS3gY3lyKV16EghkMTzidyM4eFvM5k
 xpgqHJWJEVcT8CnM43ruMU5RoP3duRTAlGNdtaUBZ+J4JeLPpEmoPiD05paUkzJtk/45
 nHvrIugDnYUn7HHEAHoJ9MAM4+cYUPPTohxHl0GAA9ZnD+TWxJ187XujGgXIuQ/TxVdq
 +FTl/7Osf0mVOaLPZOp3phcaiqzaAXwD1xuLKm7QtwFXbvXSf87PVEqcbyTD/S21K8Cd
 AvIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684231416; x=1686823416;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B02yTngxMnAee0/3R997bsusi8j0y7DHL+MtX8Stoeg=;
 b=DWMg8SpLRX0gg9WBhDdQZHhi+L2cksL7PPawyFWwFD+bqhiAOjsHCmlsWlUmJUpOoW
 kOFHPegKcdYOBts66irDtk1czDIjeGV8w6CvSaLHckOvRdjIMs8p0FUlg15/hym3GILs
 dTcHDKK2ai235Vz6RJVXdRHbryZhXDSSRfG9BJ2D6C6Rc3HLrJP3XAu5OL4uI+ZZBay/
 bipm+gNTmaGsWWHrQn2cgQBLQUCv+X4pUKFqVzSvnpsg3FwVZhN5iPndMAjkceXtG2D8
 w98Hn+Ob720Iw0yPqktujjB4xqiBNX4HLeocmC6jl7zHs7eRFSgtM4X6O8z2r7EcnhqR
 KSow==
X-Gm-Message-State: AC+VfDzNkgkhD3Y5R6RsYeLZO3zCB6ooOMcImbwTnNUUT2PMPsxg8kGU
 KWIqnK06zbN/bRfFHoKcG5g+bJa0qDDpOrB6KEVMttIbwY+hl0Oq
X-Received: by 2002:a05:6402:793:b0:506:bcd6:b125 with SMTP id
 d19-20020a056402079300b00506bcd6b125mr27607641edy.40.1684231415879; Tue, 16
 May 2023 03:03:35 -0700 (PDT)
MIME-Version: 1.0
References: <20230515143313.734053-1-richard.henderson@linaro.org>
 <20230515143313.734053-37-richard.henderson@linaro.org>
In-Reply-To: <20230515143313.734053-37-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 May 2023 11:03:25 +0100
Message-ID: <CAFEAcA9QxgOuzhQn7=9rXcMTtFiyL2vXtUni0ypSzMy+a2BuzA@mail.gmail.com>
Subject: Re: [PATCH v5 36/54] tcg: Introduce tcg_out_movext3
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x529.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 5CSyNERWCltW

On Mon, 15 May 2023 at 15:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> With x86_64 as host, we do not have any temporaries with which to
> resolve cycles, but we do have xchg.   As a side bonus, the set of
> graphs that can be made with 3 nodes and all nodes conflicting is
> small: two.  We can solve the cycle with a single temp.
>
> This is required for x86_64 to handle stores of i128: 1 address
> register and 2 data registers.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>



>  static void tcg_out_helper_load_regs(TCGContext *s,
>                                       unsigned nmov, TCGMovExtend *mov,
> -                                     unsigned ntmp, const int *tmp)
> +                                     const TCGLdstHelperParam *parm)
>  {
> +    TCGReg dst3;
> +
>      switch (nmov) {
> -    default:
> +    case 4:
>          /* The backend must have provided enough temps for the worst case. */
> -        tcg_debug_assert(ntmp + 1 >= nmov);
> +        tcg_debug_assert(parm->ntmp >= 2);
>
> -        for (unsigned i = nmov - 1; i >= 2; --i) {
> -            TCGReg dst = mov[i].dst;
> -
> -            for (unsigned j = 0; j < i; ++j) {
> -                if (dst == mov[j].src) {
> -                    /*
> -                     * Conflict.
> -                     * Copy the source to a temporary, recurse for the
> -                     * remaining moves, perform the extension from our
> -                     * scratch on the way out.
> -                     */
> -                    TCGReg scratch = tmp[--ntmp];
> -                    tcg_out_mov(s, mov[i].src_type, scratch, mov[i].src);
> -                    mov[i].src = scratch;
> -
> -                    tcg_out_helper_load_regs(s, i, mov, ntmp, tmp);
> -                    tcg_out_movext1(s, &mov[i]);
> -                    return;
> -                }
> +        dst3 = mov[3].dst;
> +        for (unsigned j = 0; j < 3; ++j) {
> +            if (dst3 == mov[j].src) {
> +                /*
> +                 * Conflict. Copy the source to a temporary, perform the
> +                 * remaining moves, then the extension from our scratch
> +                 * on the way out.
> +                 */
> +                TCGReg scratch = parm->tmp[1];
> +                tcg_out_movext3(s, mov, mov + 1, mov + 2, parm->tmp[0]);
> +                tcg_out_movext1_new_src(s, &mov[3], scratch);

Isn't this missing the "copy the source to a temporary" part?
I was expecting an initial tcg_out_mov() like the old code has.

> +                break;
>              }
> -

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

-- PMM
