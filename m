Received: by 10.25.159.19 with SMTP id i19csp3073432lfe;
        Wed, 20 Jan 2016 04:16:13 -0800 (PST)
X-Received: by 10.140.31.197 with SMTP id f63mr44549030qgf.12.1453292173360;
        Wed, 20 Jan 2016 04:16:13 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t37si767592qgt.88.2016.01.20.04.16.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 20 Jan 2016 04:16:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com;
       dmarc=fail (p=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:42565 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aLrgK-0004p8-IJ
	for alex.bennee@linaro.org; Wed, 20 Jan 2016 07:16:12 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49222)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aLrfh-000469-R3
	for qemu-devel@nongnu.org; Wed, 20 Jan 2016 07:15:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1aLrfd-0001O4-Pe
	for qemu-devel@nongnu.org; Wed, 20 Jan 2016 07:15:33 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:35539)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>)
	id 1aLrfd-0001Nt-Le; Wed, 20 Jan 2016 07:15:29 -0500
Received: by mail-oi0-x241.google.com with SMTP id e195so354134oig.2;
	Wed, 20 Jan 2016 04:15:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=qivA0a9uKemdYuk/KCMLKW/xxwFzA76SPpSlYJhyim8=;
	b=oBD5tfnXSrZMqnBxrRyprawjEciBZnz6UjYTLJm866cfsS9+JhDxjfYaR3njVERVSz
	KglrwaqG599YquLgtfwf3O84nt3ZiMpjyStVz3wTmZ1SJVXVTXEUKeGJZmnEGf9Wz5h1
	udo57mRUUUN/DozZCyvwQya9BCFXJ7ALBjeKB4AkWiwug2ATc48bpBKGwNCMaY7fG2dC
	ulDp5oYSTSctezYiwIUvz01kOqQww2OvkQvUT1SGbRVncFJGir4EvLMEw5egodwSJyAt
	6gDBgmHw8XhLj5gwdsCcSaKfM1WMr5Vdcwo/d1lYXtTFJ/zY1ToAEa4qCSY/A1/oljz4
	H4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	bh=qivA0a9uKemdYuk/KCMLKW/xxwFzA76SPpSlYJhyim8=;
	b=XygL2ycqhTXrRpjnwaWDT4kTzA8hiovWgJqTl/QnHZ7S6wBpKpmT1TcuFCM2YgbTns
	VyC4026o6zdBb1kp8RJyaj+b8hZy5K25dVmOX1VX9Q7yU3VKy4Bt5IUZGRiNPQE+kyNX
	7KqxJYAf4RNvR6IIL1OQDC8zB2obOIZ9AXzFVqdHYuILionts7trw+kt86cpek55ENCk
	O1eTGVAM6IouMQN/EWbB+RKRK+7gLPREnwis5mDeFm1trJ6gtXHg+wcuV5+nl8bjJ0hB
	JjRz8tX62q/E59zAuHljSKJCN4Umj7jrkHGurKrxUAUjEecnB9/dmrjYKdhHU2+07ysk
	pviA==
X-Gm-Message-State: ALoCoQmZ7NnInTwIL09FAMAWiI6IjVNVwXUp8R0IWrjFr008/RHXD0F/Ht7oqjb6RvYlxftQlek/wiFMMocpamN7b9qysSev1Q==
X-Received: by 10.202.209.138 with SMTP id i132mr26426432oig.122.1453292129242;
	Wed, 20 Jan 2016 04:15:29 -0800 (PST)
Received: from localhost (ec2-52-8-89-49.us-west-1.compute.amazonaws.com.
	[52.8.89.49]) by smtp.gmail.com with ESMTPSA id
	wu6sm18083842obb.16.2016.01.20.04.15.28
	(version=TLS1_2 cipher=AES128-SHA bits=128/128);
	Wed, 20 Jan 2016 04:15:28 -0800 (PST)
Date: Wed, 20 Jan 2016 13:15:25 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20160120121525.GU29396@toto>
References: <1453132414-8127-1-git-send-email-peter.maydell@linaro.org>
	<CAFEAcA9CaPT11M=Jdw8zy3XMfnUbm=psgRx+qmxYzG_96bg=Bw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9CaPT11M=Jdw8zy3XMfnUbm=psgRx+qmxYzG_96bg=Bw@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	Patch Tracking <patches@linaro.org>
Subject: Re: [Qemu-devel] [PATCH] target-arm: Implement FPEXC32_EL2 system
 register
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: MRGq/X07ammq

On Mon, Jan 18, 2016 at 04:05:36PM +0000, Peter Maydell wrote:
> Oops, got the qemu-arm email address wrong...

Replied to the wrong email before...

Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> On 18 January 2016 at 15:53, Peter Maydell <peter.maydell@linaro.org> wrote:
> > The AArch64 FPEXC32_EL2 system register is visible at EL2 and EL3,
> > and allows those exception levels to read and write the FPEXC
> > register for a lower exception level that is using AArch32.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > ARM Trusted Firmware expects this to exist (as does your average
> > hypervisor, I expect).
> >
> >  target-arm/helper.c | 16 ++++++++++++++++
> >  1 file changed, 16 insertions(+)
> >
> > diff --git a/target-arm/helper.c b/target-arm/helper.c
> > index 196c111..e8ede3f 100644
> > --- a/target-arm/helper.c
> > +++ b/target-arm/helper.c
> > @@ -2890,6 +2890,17 @@ static void sctlr_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >      tlb_flush(CPU(cpu), 1);
> >  }
> >
> > +static CPAccessResult fpexc32_access(CPUARMState *env, const ARMCPRegInfo *ri)
> > +{
> > +    if ((env->cp15.cptr_el[2] & CPTR_TFP) && arm_current_el(env) == 2) {
> > +        return CP_ACCESS_TRAP_EL2;
> > +    }
> > +    if (env->cp15.cptr_el[3] & CPTR_TFP) {
> > +        return CP_ACCESS_TRAP_EL3;
> > +    }
> > +    return CP_ACCESS_OK;
> > +}
> > +
> >  static const ARMCPRegInfo v8_cp_reginfo[] = {
> >      /* Minimal set of EL0-visible registers. This will need to be expanded
> >       * significantly for system emulation of AArch64 CPUs.
> > @@ -3150,6 +3161,11 @@ static const ARMCPRegInfo v8_cp_reginfo[] = {
> >        .opc0 = 3, .opc1 = 0, .crn = 4, .crm = 2, .opc2 = 0,
> >        .type = ARM_CP_NO_RAW,
> >        .access = PL1_RW, .readfn = spsel_read, .writefn = spsel_write },
> > +    { .name = "FPEXC32_EL2", .state = ARM_CP_STATE_AA64,
> > +      .opc0 = 3, .opc1 = 4, .crn = 5, .crm = 3, .opc2 = 0,
> > +      .type = ARM_CP_ALIAS,
> > +      .fieldoffset = offsetof(CPUARMState, vfp.xregs[ARM_VFP_FPEXC]),
> > +      .access = PL2_RW, .accessfn = fpexc32_access },
> >      REGINFO_SENTINEL
> >  };
> >
> > --
> > 1.9.1
> >
> 
> thanks
> -- PMM
