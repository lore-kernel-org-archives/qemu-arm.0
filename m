Received: by 10.223.161.27 with SMTP id o27csp1974353wro;
        Wed, 25 Oct 2017 11:51:39 -0700 (PDT)
X-Google-Smtp-Source: ABhQp+ST/0+dlG95RtNHcXjAhMdlZJSZ/MdkR0z19Ntca/944Y+YpBzmZJyJxqFMigTtw0ODUCyi
X-Received: by 10.129.67.22 with SMTP id q22mr13347642ywa.439.1508957499353;
        Wed, 25 Oct 2017 11:51:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508957499; cv=none;
        d=google.com; s=arc-20160816;
        b=YK3Q+3IHa3tXgpTOfTnE5waCmOdDzeepcxjL+JcLCVLhUG2wbaazSe7ePTUJgIB9Uc
         JdYl0pwse0Fk+Qb+q1xwK269fdEDcj4IRk/AbtDppDi0/iV0awm/uCjvslEDo8E976sD
         AE0+HhmhRdoDenQM7xWlvg6mq/CchGwUbh4aSanYaCbkkHjNRNNJrjtQBKy9eKmJcLBe
         AaxVl7yiRpjLr0Y0+XSFU79CxSYoa8TN54eQbqKNpyeMhxN5g0SeAsUREs1HbVMvXK0n
         qmzEJeufMTLzU7gDNdZD/+tK3biLfVScWmU7YhdHKjF4Z3UqVsE3aKp6tix2bqPIZh0w
         3caw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:mime-version:user-agent
         :references:message-id:in-reply-to:to:from:date:dmarc-filter
         :arc-authentication-results;
        bh=ZDdA3gC5jbUerQj+EZAJhtUr/f149OmaTgCc1xIM3FI=;
        b=HHVeKjaB9R1yMf70/MZ8oIyoEWMLzmUpOQwU54wL8YsVFkDVNfFzBMcZtIWJ56TAOM
         05Fak8ZfHeWXh+7ggmdZZBqK5WI99PVG/w1zJITJKhxoHFnYb+4K2lmX/r3k17wvisfm
         +B5S6J/cS+f5lMgL5ytM2x2U6ZFDRQgvIGdp6A5SgyHyqhpAWuMyQrW1HaURxLA/McMs
         o/3id3qbGmxJOvKpzWngYJaTqikCjVZPDWjnf//OhUUQOGsRk1yHcjwn+wu2rv3YcHL+
         jUgsVmIBowqAxiErEK3EqEDbPQADUmrnwJ55SFkoH2kMpM0jDHxD5oWVZxzGgd1HF7V1
         2/ng==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id o71si155437ybc.151.2017.10.25.11.51.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 25 Oct 2017 11:51:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:49641 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e7QmA-0001gX-Re
	for alex.bennee@linaro.org; Wed, 25 Oct 2017 14:51:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51867)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e7Qm2-0001fT-8h
	for qemu-arm@nongnu.org; Wed, 25 Oct 2017 14:51:31 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <sstabellini@kernel.org>) id 1e7Qlx-0000SK-Bo
	for qemu-arm@nongnu.org; Wed, 25 Oct 2017 14:51:30 -0400
Received: from mail.kernel.org ([198.145.29.99]:53606)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <sstabellini@kernel.org>)
	id 1e7Qlx-0000RK-67; Wed, 25 Oct 2017 14:51:25 -0400
Received: from [10.149.184.130] (162-198-228-33.lightspeed.wlfrct.sbcglobal.net
	[162.198.228.33])
	(using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPSA id BE469214F0;
	Wed, 25 Oct 2017 18:51:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org BE469214F0
Authentication-Results: mail.kernel.org;
	dmarc=none (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org;
	spf=none smtp.mailfrom=sstabellini@kernel.org
Date: Wed, 25 Oct 2017 11:51:22 -0700 (PDT)
From: Stefano Stabellini <sstabellini@kernel.org>
X-X-Sender: sstabellini@sstabellini-ThinkPad-X260
To: Peter Maydell <peter.maydell@linaro.org>
In-Reply-To: <CAFEAcA_M2Y+Qv==YJtuA32ZZO78+nKG+uwr_+sJv++HC9NtmuQ@mail.gmail.com>
Message-ID: <alpine.DEB.2.10.1710251150470.574@sstabellini-ThinkPad-X260>
References: <alpine.DEB.2.10.1710241055160.574@sstabellini-ThinkPad-X260>
	<CAFEAcA_M2Y+Qv==YJtuA32ZZO78+nKG+uwr_+sJv++HC9NtmuQ@mail.gmail.com>
User-Agent: Alpine 2.10 (DEB 1266 2009-07-14)
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 198.145.29.99
Subject: Re: [Qemu-arm] [PATCH v3] fix WFI/WFE length in syndrome register
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Stefano Stabellini <sstabellini@kernel.org>,
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 6zjAtIRUWnYb

On Wed, 25 Oct 2017, Peter Maydell wrote:
> On 24 October 2017 at 18:59, Stefano Stabellini <sstabellini@kernel.org> wrote:
> > WFI/E are often, but not always, 4 bytes long. When they are, we need to
> > set ARM_EL_IL_SHIFT in the syndrome register.
> >
> > Pass the instruction length to HELPER(wfi), use it to decrement pc
> > appropriately and to pass an is_16bit flag to syn_wfx, which sets
> > ARM_EL_IL_SHIFT if needed.
> >
> > Set dc->insn in both arm_tr_translate_insn and thumb_tr_translate_insn.
> >
> > Signed-off-by: Stefano Stabellini <sstabellini@kernel.org>
> 
> > diff --git a/target/arm/translate.c b/target/arm/translate.c
> > index 4da1a4c..0a7b67c 100644
> > --- a/target/arm/translate.c
> > +++ b/target/arm/translate.c
> > @@ -12124,6 +12124,7 @@ static void arm_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
> >      }
> >
> >      insn = arm_ldl_code(env, dc->pc, dc->sctlr_b);
> > +    dc->insn = insn;
> >      dc->pc += 4;
> >      disas_arm_insn(dc, insn);
> >
> > @@ -12191,6 +12192,7 @@ static void thumb_tr_translate_insn(DisasContextBase *dcbase, CPUState *cpu)
> >      }
> >
> >      insn = arm_lduw_code(env, dc->pc, dc->sctlr_b);
> > +    dc->insn = insn;
> >      is_16bit = thumb_insn_is_16bit(dc, insn);
> >      dc->pc += 2;
> >      if (!is_16bit) {
> 
> This isn't quite in the right place, because it's before we load the
> second half of a 32 bit Thumb insn, so it won't give dc->insn the
> correct full width insn value in that case.
> 
> I'm going to take this patch into target-arm.next and fix it up locally
> rather than making you spin a v4.

Thank you! :-)
