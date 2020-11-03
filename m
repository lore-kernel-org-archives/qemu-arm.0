Received: by 2002:a19:6b17:0:0:0:0:0 with SMTP id d23csp5046100lfa;
        Tue, 3 Nov 2020 10:49:18 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyETZB8xsVu41Li8zww4akKKebFWh5+Jyq7OnZuoSbtP4OV+LTDF/IJD+qe8P11ZXoTmH7T
X-Received: by 2002:a05:6214:1586:: with SMTP id m6mr28653532qvw.15.1604429358341;
        Tue, 03 Nov 2020 10:49:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1604429358; cv=none;
        d=google.com; s=arc-20160816;
        b=KqoeIFY8aDFb49XVe6xkskJHGzr0pXFFq1GXIwm0SBq4LIv5eAEMfsWkxJNwmwWXYe
         FXouOCaSL8M6wH2gNACtE3MAkQmhrPYlUB3DNCtfQiD/B6u984mmXUcmaO3eSgP7vDot
         EfgcKnGGrOzhGSBrHwC5iLhveRR7N/jquqnJlzX/GcFcIP62cVItYfTIbRnf2xCXCH+0
         f/cuK9jiuVK8EBEDxNpGRZDdd8ARean4GDop3QrAhHtoR1GOkkENg2QzYBhwZC7w4EIR
         cpB8n1+ZOpwuL0cVfBaSZbAsc4C7ZGHJt5p2ytbzYmdS0AqDQUrXwsd245+2eaqqistv
         rMdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:organization:message-id:date
         :subject:to:from;
        bh=NWLPUclJ0cIFseZYK8+VeQFaqYOcTn3iA4bvnD0WD0I=;
        b=0vF0WS8mAB7UKXssxNJQcnnBm7xrtG+HDezXZmLwYv6CKvu5krT30LrzFnK4MJCXQg
         FqC9IYvUtHazBjxL1jOY4wvrGeb8zCiNRLGSmGDX/8Ctl9fyeixcon1c3nIDe5OyNxmH
         PKCA0bkXpOVheEzIU85psHuhmMqnvnElKiPQy/EP0gUDPnWQiPv6SOAHohnQRquKW/Jl
         R0E5pF2CbZXlE6uY96ljDHx6mH3A0tFW+lYUu0bw7a30YWTGmZtlI7E/LTpYE4ex7DCp
         s+lING1tN28Ll/jElUO9RajHcFLjvvf3o6r5EzxOe8CV2d2XNNZprplTDTy8HY8pfd6t
         D2qA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e187si10820968qkb.129.2020.11.03.10.49.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Nov 2020 10:49:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:58560 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ka1Mr-0007KC-Qy
	for alex.bennee@linaro.org; Tue, 03 Nov 2020 13:49:17 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49682)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <remi@remlab.net>)
 id 1ka1Mj-0007Jc-4W; Tue, 03 Nov 2020 13:49:09 -0500
Received: from poy.remlab.net ([2001:41d0:2:5a1a::]:56268
 helo=ns207790.ip-94-23-215.eu)
 by eggs.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <remi@remlab.net>)
 id 1ka1Mg-0001JJ-4K; Tue, 03 Nov 2020 13:49:08 -0500
Received: from basile.remlab.net (dzyqn8ypzhx7l91mxjsvy-3.rev.dnainternet.fi
 [IPv6:2001:14ba:a01a:be01:9434:f69e:d553:3be2])
 (Authenticated sender: remi)
 by ns207790.ip-94-23-215.eu (Postfix) with ESMTPSA id BE0F95FAAA;
 Tue,  3 Nov 2020 19:49:00 +0100 (CET)
From: =?ISO-8859-1?Q?R=E9mi?= Denis-Courmont <remi.denis.courmont@huawei.com>
To: qemu-arm@nongnu.org
Subject: Re: [PATCH 08/14] target/arm: add MMU stage 1 for Secure EL2
Date: Tue, 03 Nov 2020 20:49:00 +0200
Message-ID: <1674144.VLH7GnMWUR@basile.remlab.net>
Organization: Huawei Technologies, Finland
In-Reply-To: <e1bca2e0-d926-02cb-c462-5e9d64a51999@linaro.org>
References: <2172054.ElGaqSPkdT@basile.remlab.net>
 <20201102105802.39332-8-remi.denis.courmont@huawei.com>
 <e1bca2e0-d926-02cb-c462-5e9d64a51999@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2001:41d0:2:5a1a::; envelope-from=remi@remlab.net;
 helo=ns207790.ip-94-23-215.eu
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/11/03 13:49:01
X-ACL-Warn: Detected OS   = ???
X-Spam_score_int: -15
X-Spam_score: -1.6
X-Spam_bar: -
X-Spam_report: (-1.6 / 5.0 requ) BAYES_00=-1.9,
 HEADER_FROM_DIFFERENT_DOMAINS=0.25, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=no autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lC+MOBtr/5Gu

Le tiistaina 3. marraskuuta 2020, 20.32.21 EET Richard Henderson a =C3=A9cr=
it :
> On 11/2/20 2:57 AM, remi.denis.courmont@huawei.com wrote:
> > From: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> >=20
> > This adds the MMU indices for EL2 stage 1 in secure mode.
> >=20
> > To keep code contained, which is largelly identical between secure and
> > non-secure modes, this patch introduces a secure bit for all new and
> > existing stage 1 translation regimes.
> >=20
> > Signed-off-by: R=C3=A9mi Denis-Courmont <remi.denis.courmont@huawei.com>
> > ---
> >=20
> >  target/arm/cpu-param.h     |   2 +-
> >  target/arm/cpu.h           |  22 ++++--
> >  target/arm/helper.c        | 143 ++++++++++++++++++++++++-------------
> >  target/arm/internals.h     |  12 ++++
> >  target/arm/translate-a64.c |   4 ++
> >  5 files changed, 127 insertions(+), 56 deletions(-)
> >=20
> > diff --git a/target/arm/cpu-param.h b/target/arm/cpu-param.h
> > index 6321385b46..0db5e37c17 100644
> > --- a/target/arm/cpu-param.h
> > +++ b/target/arm/cpu-param.h
> > @@ -29,6 +29,6 @@
> >=20
> >  # define TARGET_PAGE_BITS_MIN  10
> >  #endif
> >=20
> > -#define NB_MMU_MODES 11
> > +#define NB_MMU_MODES 16
> >=20
> >  #endif
> >=20
> > diff --git a/target/arm/cpu.h b/target/arm/cpu.h
> > index 724b11ee57..3fbb70e273 100644
> > --- a/target/arm/cpu.h
> > +++ b/target/arm/cpu.h
> > @@ -2944,6 +2944,9 @@ bool write_cpustate_to_list(ARMCPU *cpu, bool
> > kvm_sync);>=20
> >  #define ARM_MMU_IDX_NOTLB 0x20  /* does not have a TLB */
> >  #define ARM_MMU_IDX_M     0x40  /* M profile */
> >=20
> > +/* Meanings of the bits for A profile mmu idx values */
> > +#define ARM_MMU_IDX_A_S      0x8
> > +
> >=20
> >  /* Meanings of the bits for M profile mmu idx values */
> >  #define ARM_MMU_IDX_M_PRIV   0x1
> >  #define ARM_MMU_IDX_M_NEGPRI 0x2
> >=20
> > @@ -2967,10 +2970,17 @@ typedef enum ARMMMUIdx {
> >=20
> >      ARMMMUIdx_E20_2      =3D  5 | ARM_MMU_IDX_A,
> >      ARMMMUIdx_E20_2_PAN  =3D  6 | ARM_MMU_IDX_A,
> >=20
> > -    ARMMMUIdx_SE10_0     =3D 7 | ARM_MMU_IDX_A,
> > -    ARMMMUIdx_SE10_1     =3D 8 | ARM_MMU_IDX_A,
> > -    ARMMMUIdx_SE10_1_PAN =3D 9 | ARM_MMU_IDX_A,
> > -    ARMMMUIdx_SE3        =3D 10 | ARM_MMU_IDX_A,
> > +    ARMMMUIdx_SE10_0     =3D ARMMMUIdx_E10_0 | ARM_MMU_IDX_A_S,
> > +    ARMMMUIdx_SE20_0     =3D ARMMMUIdx_E20_0 | ARM_MMU_IDX_A_S,
> > +
> > +    ARMMMUIdx_SE10_1     =3D ARMMMUIdx_E10_1 | ARM_MMU_IDX_A_S,
> > +    ARMMMUIdx_SE10_1_PAN =3D ARMMMUIdx_E10_1_PAN | ARM_MMU_IDX_A_S,
> > +
> > +    ARMMMUIdx_SE2        =3D ARMMMUIdx_E2 | ARM_MMU_IDX_A_S,
> > +    ARMMMUIdx_SE20_2     =3D ARMMMUIdx_E20_2 | ARM_MMU_IDX_A_S,
> > +    ARMMMUIdx_SE20_2_PAN =3D ARMMMUIdx_E20_2_PAN | ARM_MMU_IDX_A_S,
> > +
> > +    ARMMMUIdx_SE3        =3D 15 | ARM_MMU_IDX_A,
>=20
> Hum.  So, we're adding 4 new mmu_idx, and increasing the mmu_idx count by=
 5.
> The unused index would be 7 -- no non-secure el3.
>=20
> Is it worth reversing the S bit to NS, so that index 15 becomes the one t=
hat
> is unused, and so we don't actually have to add it to NB_MMU_MODES?

Possible. It would save a few hundred bytes from a quick glance.

It could also be argued that E2 and E20_2 should be one and the same. The=20
regimes are distinct but they cannot coexist. The mode's TLB mode could be=
=20
flushed when HCR.E2H is flipped, I guess.


=2D-=20
R=C3=A9mi Denis-Courmont


