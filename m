Received: by 2002:a19:2d51:0:0:0:0:0 with SMTP id t17csp3086118lft;
        Mon, 4 Jul 2022 02:33:57 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uocpdAFvACuAoBiSi+451eNtsuuk62VaBI3ynzW4y7tWhflXS4ulVlR2MZUa6GwxCLZVwe
X-Received: by 2002:a25:b0c:0:b0:66e:4959:c3dc with SMTP id 12-20020a250b0c000000b0066e4959c3dcmr4520965ybl.248.1656927237396;
        Mon, 04 Jul 2022 02:33:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1656927237; cv=none;
        d=google.com; s=arc-20160816;
        b=wn6nv7yHQ7K1YTPl3q3NQZ/JJsZcYj8sm9fef1xn0tgp8m+/ornsNvLK3qu9snH3tl
         NoZm9/F1xyF7l/rCW97ucvVV/4ErIaL8NA1RQa3TGWFasepowgZ5CP5CpYaSuw5bvvSz
         rL8HE71JhFmdvlENGn6nlkaPZEvtfypsJhKMP+SAp8NE7J27WIR/MpJLVCI6MCrDWyLd
         oJBH5Xy+i9szg6tFzmXUo9EoYPgrajThyEJgmRqLXDhfnmeC1zy6QKh7EztiULwTtUJc
         aVk+hBV0G+hE6mIielS6qmWbpd7+b32Cs/naCIZjlt0SYdA3OGJl+qwV39jIAVAgbHpw
         86sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=pTv4013wmrxkqMYmni9wNw5cxkSU6RJOElObGfwMGes=;
        b=c+QOAukD0oN+32nU9JySn5lPdLeMNsy0ivMO5HgTQVGHEsbl3qTx48iFPIWgW6BbpT
         U4U6A+vToqTf7/Xv76SyohHptqH3rO7zx4eF0uT4818P/Sxpeo3MkskwUlIews1E1Mld
         7Z4657O8dH6SVYYk9CQ37M8fEU3j97XTRt/nukqQyXdDA030Lwz4rD4kV50Ms48ZvWpc
         XeoBjyV4HsQwNYgJaNWcgXDQIKCR43EEMIC+5OYTduGuZymU+hqmLrZpimOz+zeqjOZq
         7sMep5iOYxyrT6f5UgwIxTcNraTYUScl02a29z2c33HINU7I677gbUosdP02ASPitSxR
         d90g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aAgksAnH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 141-20020a250d93000000b0066e456d4512si3879777ybn.164.2022.07.04.02.33.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 04 Jul 2022 02:33:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aAgksAnH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54476 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1o8ISq-0007bm-Qv
	for alex.bennee@linaro.org; Mon, 04 Jul 2022 05:33:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42404)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8IR7-0005ni-Op
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 05:32:09 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:34569)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1o8IR5-0004gn-Uh
 for qemu-arm@nongnu.org; Mon, 04 Jul 2022 05:32:09 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id d145so12661415ybh.1
 for <qemu-arm@nongnu.org>; Mon, 04 Jul 2022 02:32:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=pTv4013wmrxkqMYmni9wNw5cxkSU6RJOElObGfwMGes=;
 b=aAgksAnHNC5PK567/NgP4qG8ZqBH/pz74eiIqMpg1yETG9YrCiP6yMIQO/VFR3i7ll
 m6m6TFD0HUeB9J5oklGxJgo9l0kMxhlJmwBLjrCMLl/VCuekaTTvTzHIHbTAfkOnxcNy
 gJ78ZH7/MN+CNXY1qDjT2BNoYJRmwNrhjZFXuL4reihJA5gW3v/llGB+fXlkE03fENgq
 ulHsqASoosQ58/quYgzRV4Snet8chKISeOkWf7e0+0AvuaHjZmtxxiJ4ONY3VVUtOk/I
 dcdKwtb2vmstH/LpAkaWLo9B5R8Z5QYFyIUlUbeOxRz5XRtC75Nz+/L7z7XZOl8UTuWh
 CgQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=pTv4013wmrxkqMYmni9wNw5cxkSU6RJOElObGfwMGes=;
 b=bjwWRyCq8SwA2vxkX11W1AcmjTs7TXjlXcNegPEryWTGdtmCp0QUET2fAt/PZCX91M
 DoY1T3C0Oax7vX1XXF7tpZPayiLSJs/l4tK6CvXx2vfHyKelXGfIdK0MVwOtlydkQcgX
 XAgGPNkqApFzjvJeFlgbi833H44/aDrZh1hLYRVBllAA1Tl2+ZuOGT3GiwlD/kzgeww4
 yFF6x3eebzvv/4+RIsCL5S/+oIuTbEz+lifV317oucPzO7yLVpnkVY5GVwBj5tZxT5p0
 ZcFzLPS7HBDtjL9TOQGgeeQO+cF0kgM4VqISBnaafirRkEguHjFJCSpLHWLTilqMIV8R
 KSQA==
X-Gm-Message-State: AJIora/nL+aXe73TA/4JZVsdf5ooVYsvVsAF7Rz2U/H3bOcv2F8Av1V4
 6LLxLVr//uLgdlrzuzhtmdrbcds8BsxikWL5kV2YwA==
X-Received: by 2002:a25:6b48:0:b0:66e:3703:7df2 with SMTP id
 o8-20020a256b48000000b0066e37037df2mr7898072ybm.193.1656927124144; Mon, 04
 Jul 2022 02:32:04 -0700 (PDT)
MIME-Version: 1.0
References: <20220628042117.368549-1-richard.henderson@linaro.org>
 <20220628042117.368549-20-richard.henderson@linaro.org>
 <CAFEAcA-v6_atdSMggO7mAfW0H96F8s2fZWLD3biHLjsFnbzYgQ@mail.gmail.com>
 <6176e126-60ae-7de5-1b22-dcfa585f4de6@linaro.org>
In-Reply-To: <6176e126-60ae-7de5-1b22-dcfa585f4de6@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Jul 2022 10:31:53 +0100
Message-ID: <CAFEAcA98kHvZbh0n+sAYSVo8EFkjbL0n9q+-HMsmSyssLLraFA@mail.gmail.com>
Subject: Re: [PATCH v4 19/45] target/arm: Implement SME MOVA
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H/EiflN0e/g2

On Mon, 4 Jul 2022 at 10:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/1/22 21:49, Peter Maydell wrote:
> > On Tue, 28 Jun 2022 at 05:40, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> We can reuse the SVE functions for implementing moves to/from
> >> horizontal tile slices, but we need new ones for moves to/from
> >> vertical tile slices.
> >>
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>


> >> +void HELPER(sme_mova_cz_q)(void *za, void *vn, void *vg, uint32_t desc)
> >> +{
> >> +    int i, oprsz = simd_oprsz(desc) / 16;
> >> +    uint16_t *pg = vg;
> >> +    Int128 *n = vn;
> >> +    Int128 *a = za;
> >> +
> >> +    for (i = 0; i < oprsz; i++) {
> >> +        if (pg[H2(i)] & 1) {
> >> +            a[i * sizeof(ARMVectorReg)] = n[i];
> >
> > Is it really OK to do this with an Int128 store? That is
> > in host-order, but the two halves of a 128-bit quantity
> > in the ZA array are in architectural order. I suppose the
> > source also will have them in the architectural order, but
> > it does look odd, especially uncommented.
>
> Would memcpy be better for you?

I guess that means we end up doing it all as byte-pointer
arithmetic, which might look worse. I think with a comment
that the two halves of the Int128 might be swapped but this
is OK because we are only copying it will be fine.

> >> +    /* Resolve tile.size[index] to an untyped ZA slice index. */
> >> +    t_index = tcg_temp_new_i32();
> >> +    tcg_gen_trunc_tl_i32(t_index, cpu_reg(s, rs));
> >> +    tcg_gen_addi_i32(t_index, t_index, index);
> >
> > This code isn't doing what the comment says; it's just calculating
> > the (not-yet-taken-MOD-dim) slice index, which does depend on the type.
>
> I guess the comment applies to a larger section than just these two lines.
>
> >
> >> +
> >> +    len = ctz32(streaming_vec_reg_size(s)) - esz;
> >
> > What is this the length of ?
>
> The length of the extract, aka the mod.
>
> >> +        /* The tile slice offset within env->zarray is the column offset. */
> >> +        offset = tile;
> >
> > I don't understand why we can just add the tile index
> > (which is going to be an integer 0, 1, 2..) to a byte offset.
> > In the horizontal case we add tile * sizeof(ARMVectorReg),
> > which makes more sense to me.
>
> Hmm.  I think you're right this should be tile * column width, or
>
>    offset = tile << esz;
>
> I wish I could compare vs FVP...

> >> +        /*
> >> +         * For big-endian, adjust the column slice offset within
> >> +         * the uint64_t host words that make up env->zarray.
> >> +         * This must wait until index and offset are combined.
> >
> > Why? Neither the byte-offset of the start of the tile nor
> > the byte offset of zarray in CPUARMState ought to be non-8-aligned.
>
> Columns will not be 8-aligned.  On page 38 of 0616A.a, see the illustration of ZA0V.B[22],
> which is 6 mod 8.

Yes, but the column slice number isn't part of offset, it's
in index, so (contra the comment) you could do the xor before
the "add offset to index" if you wanted (ie it doesn't matter
which order we do these things).

thanks
-- PMM
