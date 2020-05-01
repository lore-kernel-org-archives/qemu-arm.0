Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp817943lfm;
        Fri, 1 May 2020 08:55:05 -0700 (PDT)
X-Google-Smtp-Source: APiQypJfx71um+w6aT5M0rhaBpQsiKCT/uk3x95Qkeu0QvxQj34xAezaVCacxURzNzdVHPJj/vXn
X-Received: by 2002:a37:e214:: with SMTP id g20mr4235416qki.374.1588348505126;
        Fri, 01 May 2020 08:55:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1588348505; cv=none;
        d=google.com; s=arc-20160816;
        b=ClvRKYRnRNfSQ2zG7UMbrOUvTQSn1vwxBFN8nVrF9M93251vTqumxSo7qgCcizyS7/
         GmxJXrpmSlKh//SD2luSg9gSWPw96SRiqj0AJpncN84qrKwNRIGVy1PN1sQ53bWMBLBa
         Q/+LbzEyNFGRa8tzR2FW8RuhPMgnVUFsuLZsKt0/p/vRpR5xch/l7vVPRSxVODwAVKjK
         AJsV1Z4wqvuwv95mJAof6wZ0DQ7HhYTfisiBJCc7biuyIs/ti7Y/Qx8oSWRx6As1NzSG
         KOjJBO2fOGBEBlz/MtUQx3gDKFf942QM585HxZXbVVz1uadXcRpIBjWmj7UWgI0pTLcD
         4VOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Zm1Gkqv2rY1Z2i0K0zq+IyASfM+aLDKV0+p2jpsiqX4=;
        b=OBs9s9IwSgaf/HyQ6E2bwu3wqP3Hpj4/da4nLZwwLf1ZK8JUkD2Fd/jOkIWxgAFSvU
         h20xPxjGZ136xpTAgTTdZEIXjadB/GsYKz+IIGYdarT9C0kTrVLDr1gqT+JiBMAISQ9J
         4KXM4IkqP25isBQtoBcPuPPp1Oiuh+x8sZBCyHMhVH7TSFToFCS/A1FmGp096Z4J3lrB
         t3DGJnCSnvhVRo0Kd+BdEiA3LolhbT8qa212gyRDT4aSkR1gyhAKP3dKoDgazxebLMV9
         Ekf2w86Xc4LnA7BBgnXwuqk1bq1vE/IljMA7eCxo0teLJV4649uYljo29OMIrLAF7LSh
         gH4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="urs/xAh5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:470:142::17])
        by mx.google.com with ESMTPS id t17si2102158qvz.71.2020.05.01.08.55.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 01 May 2020 08:55:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) client-ip=2001:470:142::17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="urs/xAh5";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:470:142::17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50798 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jUY0G-0003M7-Ij
	for alex.bennee@linaro.org; Fri, 01 May 2020 11:55:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:32834)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUXzx-00037i-7H
 for qemu-arm@nongnu.org; Fri, 01 May 2020 11:54:45 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1jUXzv-0001j4-OZ
 for qemu-arm@nongnu.org; Fri, 01 May 2020 11:54:44 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40115)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jUXzv-0001iV-8B
 for qemu-arm@nongnu.org; Fri, 01 May 2020 11:54:43 -0400
Received: by mail-ot1-x342.google.com with SMTP id i27so2876358ota.7
 for <qemu-arm@nongnu.org>; Fri, 01 May 2020 08:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Zm1Gkqv2rY1Z2i0K0zq+IyASfM+aLDKV0+p2jpsiqX4=;
 b=urs/xAh5NWvp6iUey/zgkvjqKc7sSnRsNARMGSG97NZP5jKIM6BVYXwDGZhLULXddw
 1yJbY98slkgb2r8InB1fU9eOLOIkEHY2AWw0UDaC91Xl1A9CEWtJ/1tLYpVZG5RJZ104
 NKh4nAT989nSGV9EXoWwxszfw5ylZngxBiEIvkF5PiKvcXfu/ESxIqPoNNTJqAOMRMs4
 GqxlK42AXcULU919jo7dNKYnDkDB2N5peqyheliWqsvcfSwCgozoyb6DOTFOdDn0eZEY
 Nepug9ZzR7sr7NN4CwV5HTMsTinlOBnoNkXRJQ63foLA6KyOvz+zVp0qM+ciFsWyBjEg
 QghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Zm1Gkqv2rY1Z2i0K0zq+IyASfM+aLDKV0+p2jpsiqX4=;
 b=Cs9kiA081kkZ2PeODR2geW1N44woMDzDSjHZMatLpMmr/fB8ULTRCS7j2voRAcWkpA
 D4b6R9HuLrcFVL4QPi1UMIoKJzWhrKOrFRrTfvYEDnx8g1m+bSBJTKA6BLS37/F0hfmR
 DrQthU0z88nts8CrJK2253jv/I2cFXe56p8QLRopJ+W/izDKVesATl7Py/h8hbM4oHVj
 8l7uy6MMhRs/UpRyELJPy1vbLzvuMVfORVLXlh+2vFhRrlv59QgdHysBypzUTAK3UU9H
 eghMoH2rb29BhGhgoA5JIc8sLc2Se0jIsMfGciui3LuagcoCQ1cRK+wdGC4dEY4AJg2V
 FfPw==
X-Gm-Message-State: AGi0PuYElW13ebnwTsFyvov0MzaDqkI5IP4flrKQI1v8dlstnVtafymb
 1FlDrhoRpWey5UQkwgm+2DlHcIWHvwH3tmwVOlAYfA==
X-Received: by 2002:a05:6830:22dc:: with SMTP id
 q28mr3910923otc.221.1588348481543; 
 Fri, 01 May 2020 08:54:41 -0700 (PDT)
MIME-Version: 1.0
References: <20200430181003.21682-1-peter.maydell@linaro.org>
 <20200430181003.21682-24-peter.maydell@linaro.org>
 <366a2e79-d963-bfdc-fcc6-2a63026fa1db@linaro.org>
In-Reply-To: <366a2e79-d963-bfdc-fcc6-2a63026fa1db@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 1 May 2020 16:54:30 +0100
Message-ID: <CAFEAcA9kb2fpMcd-eLvdTD8dVjk=Ed9nKv2iHr_u_tpbBCa5HA@mail.gmail.com>
Subject: Re: [PATCH 23/36] target/arm: Convert Neon 64-bit element 3-reg-same
 insns
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::342;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x342.google.com
X-detected-operating-system: by eggs.gnu.org: Error: [-] PROGRAM ABORT :
 Malformed IPv6 address (bad octet value).
 Location : parse_addr6(), p0f-client.c:67
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: EVEvqDr5SHgV

On Thu, 30 Apr 2020 at 21:54, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/30/20 11:09 AM, Peter Maydell wrote:
> > +
> > +    rn = tcg_temp_new_i64();
> > +    rm = tcg_temp_new_i64();
> > +    rd = tcg_temp_new_i64();
> > +
> > +    for (pass = 0; pass < (a->q ? 2 : 1); pass++) {
> > +        neon_load_reg64(rn, a->vn + pass);
> > +        neon_load_reg64(rm, a->vm + pass);
> > +        fn(rd, rm, rn);
> > +        neon_store_reg64(rd, a->vd + pass);
> > +    }
> > +
> > +    tcg_temp_free_i64(rn);
> > +    tcg_temp_free_i64(rm);
> > +    tcg_temp_free_i64(rd);
> > +
> > +    return true;
> > +}
> > +
> > +#define DO_3SAME_64(INSN, FUNC)                                         \
> > +    static bool trans_##INSN##_3s(DisasContext *s, arg_3same *a)        \
> > +    {                                                                   \
> > +        return do_3same_64(s, a, FUNC);                                 \
> > +    }
>
> You can morph this into the gvec interface like so:
>
> #define DO_3SAME_64(INSN, FUNC) \
>     static void gen_##INSN##_3s(unsigned vece, uint32_t rd_ofs,
>                                 uint32_t rn_ofs, uint32_t rm_ofs,
>                                 uint32_t oprsz, uint32_t maxsz)
>     {
>         static const GVecGen3 op = { .fni8 = FUNC };
>         tcg_gen_gvec_3(rd_ofs, rn_ofs, rm_ofs,
>                        oprsz, maxsz, &op);
>     }
>     DO_3SAME(INSN, gen_##INSN##_3s)
>
> The .fni8 function tells gvec that we have a helper that processes the
> operation in 8 byte chunks.  It will handle the pass loop for you.

This doesn't quite work, because these are shift ops and
so the operands are passed to the helper in the order
rd, rm, rn. Reshuffling the order of arguments to
tcg_gen_gvec_3() fixes this, though.

I guess I should call the macro DO_3SAME_SHIFT64, I hadn't
noticed it was shift specific because the only thing we do
with it is shifts.

thanks
-- PMM
