Received: by 2002:adf:b2b8:0:0:0:0:0 with SMTP id g53-v6csp6818173wrd;
        Tue, 28 Aug 2018 13:36:16 -0700 (PDT)
X-Google-Smtp-Source: ANB0VdY5rixRqwMkOMu81k921WxjvFpvp8kP6BLjMWnbhqc01JUtVoPwMJNFlxCTf3yyMvU5HH9g
X-Received: by 2002:ac8:2b0f:: with SMTP id 15-v6mr3543400qtu.119.1535488576692;
        Tue, 28 Aug 2018 13:36:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1535488576; cv=none;
        d=google.com; s=arc-20160816;
        b=d32nEq6jsy1uyb2+X+3Z6yNxwV3XWbaM9wD2kEhdntv7e+olawJ9vgLhSi/jew2Yhg
         UMggXTFmibnY25mP8IZe0FDWlgtX4KMNxct05sXKf8AFkjgmIfNhPPt3xfs0aalv/2d7
         D9cYZRsq9nGtuh8sSfDWf/VaFuTV28GTO6ElAbR/ph6jcfXOyC64wCZtYHtNySN9aIlX
         jtu6nd/zH5YWyTsIK15mQU6PtCMueLaEF4C84ageK9NxqhC/Hp2/NRkpf/CXKgGpmCNT
         0FH3FcAAx8YVEQ9QjYfLCK3L9Phghxc6LypwS/+qkLqbcDl1Cw0zPthVa6TtVoc/VVQR
         Hqfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature:arc-authentication-results;
        bh=vZAsRMa5DvEWR5mQ+8pKUX8O85vbIkGjKMOd3t8Qixo=;
        b=owWO6r0utMNummNoBA8Pr7znK4tN+/HikQr0eaFMGkZ48uutVwhzKrSw0RN8rVSM45
         8DtP08p1pN/7CerLtj/sgwHHZvxgLE3HqxHIRRd6hCvsgDl5H/NFZsEvSPsH/azMZa0J
         Vu/Wgum3vayA7zjgEt+CuZEPsQ0UmFMsDDVQHCu+SMFMkJmFYfHSD6WbnaV/CdEEJsU4
         6YkKUs6XgvaH5woY7ABtaoXfNT6jsM+aqDzhwUsVvmnBDhExVDjNmfjHnQKZ9L3+aVA3
         C2zfFjjlTnUTomVmbQ/3tX5gR7pCNuIhRojUpYx0+C7jj/2bJr0ilOdpwmlxlZ6LDGKo
         +z+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RTG7G2RR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id f24-v6si1768598qkm.396.2018.08.28.13.36.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 28 Aug 2018 13:36:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=RTG7G2RR;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:39917 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fukim-0006zS-6b
	for alex.bennee@linaro.org; Tue, 28 Aug 2018 16:36:16 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50091)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1fukhk-0006Xz-52
	for qemu-devel@nongnu.org; Tue, 28 Aug 2018 16:35:13 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1fukcj-0005Lf-Dp
	for qemu-devel@nongnu.org; Tue, 28 Aug 2018 16:30:02 -0400
Received: from mail-qt0-x244.google.com ([2607:f8b0:400d:c0d::244]:43021)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1fukci-0005Iy-8e; Tue, 28 Aug 2018 16:30:00 -0400
Received: by mail-qt0-x244.google.com with SMTP id g53-v6so3287989qtg.10;
	Tue, 28 Aug 2018 13:30:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=vZAsRMa5DvEWR5mQ+8pKUX8O85vbIkGjKMOd3t8Qixo=;
	b=RTG7G2RRcZAwhZ23ZM6x/PIuDMJXB0lZY8/jiMEVYDMaNzjF2wG+7r5eJtt7F8wKKG
	gzscM9XmB5FTWiMo+iGyGl7xNqwyy/xmcNp4XIIFfx3MtNAe9byzDfLP/2DuC+P317pQ
	Rk9j6XwQ0L1THAk99BVSXVPIvIJ/TpSxTwkUO2Rv2sio+9LxfEe233uZqFTLLPwesY1I
	VRRGj1py8lIwyvUIIP0526eAmQl/ElEXn17UGztodYGYaJ0p/V2NqOneXr/9hGUZ9/Ro
	VXSxTKhpmtKI6PPgVNxlTfUeeNX415dw3UknYzxdehcclgrhGRGgIYyU5VcNztwfnR7a
	kXIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=vZAsRMa5DvEWR5mQ+8pKUX8O85vbIkGjKMOd3t8Qixo=;
	b=kdIQSIevOesrNsqu5dZPMsslMv/Cg8HeEXM4H6GL8FPg/2TEZhmNZBhihmYLzSOUdP
	+nEHBGlKTAmrBFrRNLqSuPv2m6kPQH6X14FJ1gEeSTgmhN7A1QZugh3CuR/CtMagrdu4
	krrfkgJoesHkPVf0Tq7HaJhwJsY8ysG85CNdKHIlqyhAkTHyI+jrlZiW3wrrBR5SM4qA
	FER0i9Jd6LjI0/thmcgo2kMw5G+fG2qrbCojolw6sfcoyxXBRXVG+0Wv1oSaU59M0DQO
	QO3z0WBWg2Xay4KD0WqrwpkwbO2QpF7hRtJKgdRThjdTrSXay194doxDRaPpPuDrxUaE
	ucMQ==
X-Gm-Message-State: APzg51DSkNE/0op33M7uL+g+fa1CKfUD3wF8s+lwHL0cjZ2mvKCq7bxU
	u1TqnhbRfdwnreL+6B2FrRc=
X-Received: by 2002:ac8:2c72:: with SMTP id
	e47-v6mr3584623qta.60.1535488199778; 
	Tue, 28 Aug 2018 13:29:59 -0700 (PDT)
Received: from okra.localdomain ([2600:3c03::f03c:91ff:febb:cdda])
	by smtp.gmail.com with ESMTPSA id
	o68-v6sm1133298qkf.9.2018.08.28.13.29.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 28 Aug 2018 13:29:59 -0700 (PDT)
Date: Tue, 28 Aug 2018 16:29:58 -0400
From: Aaron Lindsay <aclindsa@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180828202957.GC3671@okra.localdomain>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
	<1529699547-17044-7-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA-0_PQdFXo_vY-cxkeC_HwxsKhCe7VNy7+4iCX-NqtOqw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-0_PQdFXo_vY-cxkeC_HwxsKhCe7VNy7+4iCX-NqtOqw@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::244
Subject: Re: [Qemu-devel] [PATCH v5 06/13] target/arm: Implement PMOVSSET
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
Cc: Wei Huang <wei@redhat.com>, Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Aaron Lindsay <alindsay@amperecomputing.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: s6pXXOtRHgOE

On Jun 28 17:23, Peter Maydell wrote:
> On 22 June 2018 at 21:32, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> > Add an array for PMOVSSET so we only define it for v7ve+ platforms
> >
> > Signed-off-by: Aaron Lindsay <alindsay@codeaurora.org>
> > ---
> >  target/arm/helper.c | 28 ++++++++++++++++++++++++++++
> >  1 file changed, 28 insertions(+)
> >
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index 7d63bb2..5d83446 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -1293,9 +1293,17 @@ static void pmcntenclr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >  static void pmovsr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >                           uint64_t value)
> >  {
> > +    value &= pmu_counter_mask(env);
> >      env->cp15.c9_pmovsr &= ~value;
> >  }
> 
> This change doesn't look like it should be in this patch ?

This has been appropriately split off into a separate patch for v6. I
must've seen "pmovsr" and staged it here by accident.

> >
> > +static void pmovsset_write(CPUARMState *env, const ARMCPRegInfo *ri,
> > +                         uint64_t value)
> > +{
> > +    value &= pmu_counter_mask(env);
> > +    env->cp15.c9_pmovsr |= value;
> > +}
> > +
> >  static void pmxevtyper_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >                               uint64_t value)
> >  {
> > @@ -1645,6 +1653,23 @@ static const ARMCPRegInfo v7mp_cp_reginfo[] = {
> >      REGINFO_SENTINEL
> >  };
> >
> > +static const ARMCPRegInfo pmovsset_cp_reginfo[] = {
> > +    /* PMOVSSET is not implemented in v7 before v7ve */
> > +    { .name = "PMOVSSET", .cp = 15, .opc1 = 0, .crn = 9, .crm = 14, .opc2 = 3,
> > +      .access = PL0_RW, .accessfn = pmreg_access,
> > +      .fieldoffset = offsetoflow32(CPUARMState, cp15.c9_pmovsr),
> > +      .writefn = pmovsset_write,
> > +      .raw_writefn = raw_write },
> 
> This should be marked ARM_CP_ALIAS, beacuse its underlying
> state in c9_pmovsr is just an alias into PMOVSR, and that
> register is handling reset and migration.

Thanks for catching this, too!

-Aaron
