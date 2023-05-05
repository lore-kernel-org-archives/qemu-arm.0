Received: by 2002:a17:906:4810:b0:965:a47e:1721 with SMTP id w16csp411928ejq;
        Fri, 5 May 2023 06:18:29 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ76hkAMebu1CE15CAusxpXgDnSwVr2z2zFoO6QgDcCt2T44RBSNPjoz8tWze0/aCUVFRyE4
X-Received: by 2002:a05:622a:14f:b0:3ef:1289:9478 with SMTP id v15-20020a05622a014f00b003ef12899478mr2517204qtw.8.1683292709476;
        Fri, 05 May 2023 06:18:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683292709; cv=none;
        d=google.com; s=arc-20160816;
        b=GVOQXBO7X9VsXrbHr9DiQ4H8gX43vClLgZnwGjUz5BlYg3wmfXQEzgX5JWuYrFi4NV
         Z36d/nbEZurb3WsioF7WrlTWXGLz9RuaPd6CPsvOk/fk9a5EZI789QuYGQyuMDO+M+u6
         HWSWnbMStF5UUWoC+LNfyspWmGOaQtvmZNM7X4LHyedwmK119bWDk0eFeMLJ76KSa6MP
         669OahH0JnjiNkHIpn5+9NpVmAN1vrWAspBCmGs3xBhpEnJ8Ts4sQE0ZZjNTvUq6psuV
         Agu0qX/HEupiX+lrUtJr+ZJjK6K4rfaRL5FzhlA4M4R030agjsVg4+qf5wC9mGHD66SM
         sjyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5tVPVNzDALYzakMPqGGCIzYb1I80NK4X5006/rlAVmI=;
        b=vKuP+jeozLuset6VFUV36akER+NQcQdMCDJqVyMoFKYAjskG8zCkEBz59ilpLNqyWY
         +4a1FTovHnmTYnhb1Fh4FaySO70L1BTIguvAKy+ayc/bE5i/AQp1mDhCBFr5w1YUxPi0
         Slb70+EFCpFCUkD/ScZ+QTy0gwsBSFgS++iYjxfog+4f6lGyAbVwiwpwackxfmnK1rR3
         ZBpkYcgQRlQ7geHONxfPb/O3JKMxhAPwbvcUEVV0KpojtsINTLWsTQ/ROcV7VmE88BhT
         ccF+Drzp5JjHMVnK3iclBLmS94b4FA1WKAd6qFm0qpVfka/40rhDzX6uV+L86SklqwcF
         HkXg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=frvP9ZHm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17-20020a05620a01f100b0074f1ff2e0b1si644428qkn.356.2023.05.05.06.18.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 05 May 2023 06:18:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=frvP9ZHm;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1puvK0-0008Dg-QE; Fri, 05 May 2023 09:18:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvJu-0008CS-6h
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:17:59 -0400
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1puvJs-000625-Eq
 for qemu-devel@nongnu.org; Fri, 05 May 2023 09:17:57 -0400
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-50be0d835aaso3159704a12.3
 for <qemu-devel@nongnu.org>; Fri, 05 May 2023 06:17:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1683292675; x=1685884675;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5tVPVNzDALYzakMPqGGCIzYb1I80NK4X5006/rlAVmI=;
 b=frvP9ZHmoHETgJ7sufxxO5AlcqpyGRT4YfxFqQCD/p2vY3YbnaMipfdizOrjj7kVP6
 +Kd70NJ0xUMTIpiBmsu9mGsg41g/syixPnakhTe48J35hC00j8KLJaOBt/oOwEaITkX7
 4x1vQ1xqzTtwTpt+HN9QxV5yi7GtajLJKkG/+udrR7CmM91DVujoMVPmeNuxBTd3lZCf
 IFrFlC0+jiy7DEXVdZilZFP1WPPs6EJ22ea2BE5YxUUgdKeq4DCv2wbgadxLqvxfZHpO
 rZ/ny1AiYYbHPQ8G5uSl2iO85l08uKUQ9IdbacaReGpIEgkS8EIozQEhOdYK67iICv43
 ggDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683292675; x=1685884675;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5tVPVNzDALYzakMPqGGCIzYb1I80NK4X5006/rlAVmI=;
 b=CWfOpPVGgKTewIC0i+Nqc4AAngKYm8Otj4Z2OhgHT9ECYiTZZVyjijss6zQAmlv4iX
 bv2BG1+Kj7FTiowD4kd99VqFWLOrxfFibW4x/VDKpr2Puvw7qx36kS/NBv30OWHsUtTA
 A3IWBBYbXsZYmYkzzaSMMyUWfTfuJy2WbMN+tggzTbv45zWbLjZ2GK9XOT2Y4xwTDzwt
 +Y22oZB39yimP3zzXUgBtkztzx0IUlnIIk7ofTUPfavTgtAKhIF4H/LqQE7v3WPw93YT
 OsS4V781xq3B0ZaQi1lE1IELTSfJjl48VX1kJfCNP6fTMAZCBA7/o5XWls3Fo/o7CrNb
 gYdw==
X-Gm-Message-State: AC+VfDwcamPZfnandGTigxTQUvNvSaTI56FxlpAaqge5yxSA1ElancXV
 fcxZc0/NnZpqi9TdnE+qG+BB39/2yXLHAZpZlDexag==
X-Received: by 2002:a50:fb96:0:b0:504:b511:1a39 with SMTP id
 e22-20020a50fb96000000b00504b5111a39mr1416085edq.12.1683292674989; Fri, 05
 May 2023 06:17:54 -0700 (PDT)
MIME-Version: 1.0
References: <20230503070656.1746170-1-richard.henderson@linaro.org>
 <20230503070656.1746170-48-richard.henderson@linaro.org>
In-Reply-To: <20230503070656.1746170-48-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 5 May 2023 14:17:44 +0100
Message-ID: <CAFEAcA9X_JreK4mQ=f3opPhL1+PkmJHJZSEZTrzTpyomfb2wxA@mail.gmail.com>
Subject: Re: [PATCH v4 47/57] tcg/mips: Use atom_and_align_for_opc
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, git@xen0n.name, gaosong@loongson.cn, 
 philmd@linaro.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org, 
 qemu-s390x@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: 8+DtXrpUCNlF

On Wed, 3 May 2023 at 08:41, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  tcg/mips/tcg-target.c.inc | 11 ++++++++---
>  1 file changed, 8 insertions(+), 3 deletions(-)
>
> diff --git a/tcg/mips/tcg-target.c.inc b/tcg/mips/tcg-target.c.inc
> index cd0254a0d7..43a8ffac17 100644
> --- a/tcg/mips/tcg-target.c.inc
> +++ b/tcg/mips/tcg-target.c.inc
> @@ -1139,6 +1139,7 @@ static bool tcg_out_qemu_st_slow_path(TCGContext *s, TCGLabelQemuLdst *l)
>  typedef struct {
>      TCGReg base;
>      MemOp align;
> +    MemOp atom;
>  } HostAddress;
>
>  bool tcg_target_has_memory_bswap(MemOp memop)
> @@ -1158,11 +1159,16 @@ static TCGLabelQemuLdst *prepare_host_addr(TCGContext *s, HostAddress *h,
>  {
>      TCGLabelQemuLdst *ldst = NULL;
>      MemOp opc = get_memop(oi);
> -    unsigned a_bits = get_alignment_bits(opc);
> +    MemOp a_bits, atom_u;
>      unsigned s_bits = opc & MO_SIZE;
> -    unsigned a_mask = (1 << a_bits) - 1;
> +    unsigned a_mask;
>      TCGReg base;
>
> +    a_bits = atom_and_align_for_opc(s, &h->atom, &atom_u, opc,
> +                                    MO_ATOM_IFALIGN, false);
> +    h->align = a_bits;
> +    a_mask = (1 << a_bits) - 1;
> +
>  #ifdef CONFIG_SOFTMMU
>      unsigned s_mask = (1 << s_bits) - 1;
>      int mem_index = get_mmuidx(oi);

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(For a set of functions so new they're not even in master yet
these do seem to have a surprisingly large variance in how
they're setting up these HostAddress structs...)

thanks
-- PMM
