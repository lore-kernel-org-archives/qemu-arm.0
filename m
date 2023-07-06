Received: by 2002:a17:906:b10c:b0:992:abd5:50eb with SMTP id u12csp4397924ejy;
        Thu, 6 Jul 2023 09:10:37 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFqTmn2AP4KhLK8ualFJhNxOoyh+1qHw6kxhN9v39BOVgOd68viBK8zhoYbrG1+ZnckaIBg
X-Received: by 2002:a05:6358:7245:b0:134:f28f:aa47 with SMTP id i5-20020a056358724500b00134f28faa47mr2907448rwa.23.1688659837144;
        Thu, 06 Jul 2023 09:10:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688659837; cv=none;
        d=google.com; s=arc-20160816;
        b=fsEVoKcPp89cPwmRDtIZ+oKW5y3/2tgboduhbn4Cjag85LEpmUyP+l1nUOIF+LKSxx
         +NqwZlFcy+5C+SPz37Dmc0lxJGrEh4MA1H2C+sdtD7N46OgfhmstvY4B51QOZMSK6ffu
         uDshKClsELvTPkPAJ9+6KYDqXZ1ecPP44WR4hbWkhw+NijMYqeP1XKcsLGaYHdtMz4cF
         VJkeQPfWXLxaedgjs1BikgdgtDjnlgADBCcqgL0GnTe0k0+Wfn1j4Hgw7ckVy+2YQfuM
         8WUbvABNWNUDaLHJ7dNh4s6U+x1KLYsVCylLWJKOsKRAVdjBVavJ02ZEsNrjjd6QJ2XY
         +7cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=fVV2P3ORYTTwwdksQG8K0+Ko50GiJWJUDwAHa4aH9y4=;
        fh=AUWhDBBcQJl/cpkEHjYZxji9DdAuAu9jPeTYApU/3e0=;
        b=XH22CP4KkHKRgAVK66skRJkUOCuFmkeNmBbNB3e+EDfeUGzeIDs/uUdA3/70IvKLZq
         hZvEEGzRjrzXBbbJuEAkEdBbq09PBcWDl4nwBxyKa7h5ZGw9d7/+Hd9piiTkVepBBVeF
         HjGffySy1H8nP90VyR8Q0Tlsa3YxctPoAKcWxYipQ6Khhw0Aw267UO+m9/X+AmUQCtcg
         gBU8V7k+d9kFozHioJyHP/HF3/MbShcu169nl4DOjiJswPUhGgQjiYUQvmR44+u47QmS
         0kjfXczXErEaXflFEXM6QN58Fz6CpwoSBfBMOA35djuYPBAyPLGuTfhn0aD6s8uB8w8x
         qBTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WPNtr+sU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j18-20020a0cf512000000b005f97bebca20si1151456qvm.59.2023.07.06.09.10.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Jul 2023 09:10:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WPNtr+sU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qHRYk-0008BR-Pe; Thu, 06 Jul 2023 12:10:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qHRYj-000872-6B
 for qemu-arm@nongnu.org; Thu, 06 Jul 2023 12:10:21 -0400
Received: from mail-wm1-x335.google.com ([2a00:1450:4864:20::335])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <jean-philippe@linaro.org>)
 id 1qHRYh-0001iI-0g
 for qemu-arm@nongnu.org; Thu, 06 Jul 2023 12:10:20 -0400
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-3fbc6ab5ff5so9845095e9.1
 for <qemu-arm@nongnu.org>; Thu, 06 Jul 2023 09:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688659817; x=1691251817;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=fVV2P3ORYTTwwdksQG8K0+Ko50GiJWJUDwAHa4aH9y4=;
 b=WPNtr+sUUL/EXCPUNFGCi9Kr5Xhl4qZ/qZIsHVwg7+ClTohK1372u2ros0lyFpwj8k
 gDrrqKRDjL4hJ4K9y8djD8TbHQ9G+3327Ab5G6SwmrnUJPtLd1Nd5AV8xdYRHT65d4dV
 jZNf2bDhgscvTa4LG6eMKB9+n+HGiR3U8C6/OvHH0jF0ujMYNWFwqSkIz6XTu9nSMuld
 2kHeN1gRO8O3/LqJjekR7aGTxrC8UEhv0xKioMiPiuydzAswiaxcT8hiM53JS92O7c8N
 C72QafBIlNHwYnnQUnT/QoZG6Az8x74qrjNYYDjo4i+aCqgMHopcL+1nRu4jaqR7eg81
 T01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688659817; x=1691251817;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fVV2P3ORYTTwwdksQG8K0+Ko50GiJWJUDwAHa4aH9y4=;
 b=IwT4uHObM8vaIf/IlqxCwSnlHmVMPfymKLtztv0BjcSlLHNZmbo7XYxkgGrUYpHBET
 FAVsELCdi81hU0pXdPy+3thjPzgwX9ug7vOnl52JMllljhtcQKEjWKKnTWdZsrCKIkT2
 QsXZknArlsf5vYGXyPmU/WAYmAE+JwPAQO0ZfKdq8+6kokcBozeIoeY+SMjZkAeQz10b
 iVSrXdO34rlh+gEvEFnvHD4c8qQUA6wWJs2F9NGSqdBe/NbEKOBNvnMqQNUrCUgi6CiT
 npdMFqERFgGfCOVZJ/ghD+6JZse/ugrCBu7A5fx6fjBNwQHdvt0cqIwdsenQHC4RHNOd
 a/7A==
X-Gm-Message-State: ABy/qLaFzt5JCX3NlMYhm280cbZTUFrZhXpCAZI9C9ENrRl1YiPJf8mA
 eAqO/+MMJSfbYpuaX3K80EH1sPAgZkyM1of9TLk=
X-Received: by 2002:a5d:4d02:0:b0:314:1d88:f072 with SMTP id
 z2-20020a5d4d02000000b003141d88f072mr1703901wrt.25.1688659817273; 
 Thu, 06 Jul 2023 09:10:17 -0700 (PDT)
Received: from myrica ([2.219.138.198]) by smtp.gmail.com with ESMTPSA id
 f17-20020adfe911000000b0031416362e23sm2272329wrm.3.2023.07.06.09.10.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Jul 2023 09:10:16 -0700 (PDT)
Date: Thu, 6 Jul 2023 17:10:16 +0100
From: Jean-Philippe Brucker <jean-philippe@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Subject: Re: [PATCH] target/arm: Fix ptw parameters in S1_ptw_translate() for
 debug contexts
Message-ID: <20230706161016.GC2570588@myrica>
References: <20230706140850.3007762-2-jean-philippe@linaro.org>
 <CAFEAcA8h-VXZkD0SBrjOYg-FFVk5AW0RrAs4AL4w6RXWZzWUsQ@mail.gmail.com>
 <20230706152543.GB2570588@myrica>
 <CAFEAcA8crpS3SBoCsmxaj4isMcGYrExOTDU=m5u8-gOkrrjERA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA8crpS3SBoCsmxaj4isMcGYrExOTDU=m5u8-gOkrrjERA@mail.gmail.com>
Received-SPF: pass client-ip=2a00:1450:4864:20::335;
 envelope-from=jean-philippe@linaro.org; helo=mail-wm1-x335.google.com
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
X-TUID: crVeKjZCh26+

On Thu, Jul 06, 2023 at 04:42:02PM +0100, Peter Maydell wrote:
> > > Do you have a repro case for this bug? Did it work
> > > before commit fe4a5472ccd6 ?
> >
> > Yes I bisected to fe4a5472ccd6 by trying to run TF-A, following
> > instructions here:
> > https://github.com/ARM-software/arm-trusted-firmware/blob/master/docs/plat/qemu.rst
> >
> > Building TF-A (HEAD 8e31faa05):
> > make -j CROSS_COMPILE=aarch64-linux-gnu- BL33=edk2/Build/ArmVirtQemuKernel-AARCH64/DEBUG_GCC5/FV/QEMU_EFI.fd PLAT=qemu DEBUG=1 LOG_LEVEL=40 all fip
> >
> > Installing it to QEMU runtime dir:
> > ln -sf tf-a/build/qemu/debug/bl1.bin build/qemu-cca/run/
> > ln -sf tf-a/build/qemu/debug/bl2.bin build/qemu-cca/run/
> > ln -sf tf-a/build/qemu/debug/bl31.bin build/qemu-cca/run/
> > ln -sf edk2/Build/ArmVirtQemuKernel-AARCH64/DEBUG_GCC5/FV/QEMU_EFI.fd build/qemu-cca/run/bl33.bin
> 
> Could you put the necessary binary blobs up somewhere, to save
> me trying to rebuild TF-A ?

Uploaded to:
https://jpbrucker.net/tmp/2023-07-06-repro-qemu-tfa.tar.gz

Thanks,
Jean

> 
> 
> > > > ---
> > > >  target/arm/ptw.c | 6 ++----
> > > >  1 file changed, 2 insertions(+), 4 deletions(-)
> > > >
> > > > diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> > > > index 9aaff1546a..e3a738c28e 100644
> > > > --- a/target/arm/ptw.c
> > > > +++ b/target/arm/ptw.c
> > > > @@ -465,10 +465,8 @@ static bool S1_ptw_translate(CPUARMState *env, S1Translate *ptw,
> > > >          S1Translate s2ptw = {
> > > >              .in_mmu_idx = s2_mmu_idx,
> > > >              .in_ptw_idx = ptw_idx_for_stage_2(env, s2_mmu_idx),
> > > > -            .in_secure = s2_mmu_idx == ARMMMUIdx_Stage2_S,
> > > > -            .in_space = (s2_mmu_idx == ARMMMUIdx_Stage2_S ? ARMSS_Secure
> > > > -                         : space == ARMSS_Realm ? ARMSS_Realm
> > > > -                         : ARMSS_NonSecure),
> > > > +            .in_secure = is_secure,
> > > > +            .in_space = space,
> > >
> > > If the problem is fe4a5472ccd6 then this seems an odd change to
> > > be making, because in_secure and in_space were set that way
> > > before that commit too...
> >
> > I think that commit merged both sides of the
> > "regime_is_stage2(s2_mmu_idx)" test, but only kept testing for secure
> > through ARMMMUIdx_Stage2_S, and removed the test through ARMMMUIdx_Phys_S
> 
> Yes, I agree. I'm not sure your proposed fix is the right one,
> though. I need to re-work through what I did in fcc0b0418fff
> to remind myself of what the various fields in a S1Translate
> struct are supposed to be, but I think .in_secure (and now
> .in_space) are supposed to always match .in_mmu_idx, and
> that's not necessarily the same as what the local is_secure
> holds. (is_secure is the original ptw's in_secure, which
> matches that ptw's .in_mmu_idx, not its .in_ptw_idx.)
> So probably the right thing for the .in_secure check is
> to change to "(s2_mmu_idx == ARMMMUIdx_Stage2_S ||
> s2_mmu_idx == ARMMMUIdx_Phys_S)". Less sure about .in_space,
> because that conditional is a bit more complicated.
> 
> thanks
> -- PMM
