Received: by 10.25.77.65 with SMTP id a62csp1733249lfb;
        Mon, 6 Feb 2017 07:06:51 -0800 (PST)
X-Received: by 10.55.95.131 with SMTP id t125mr10665079qkb.279.1486393610955;
        Mon, 06 Feb 2017 07:06:50 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n33si662369qtd.237.2017.02.06.07.06.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 06 Feb 2017 07:06:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:48928 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1caksU-0008GX-3e
	for alex.bennee@linaro.org; Mon, 06 Feb 2017 10:06:50 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58539)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1caksQ-0008GE-FY
	for qemu-arm@nongnu.org; Mon, 06 Feb 2017 10:06:47 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <edgar.iglesias@gmail.com>) id 1caksH-0008B6-Aq
	for qemu-arm@nongnu.org; Mon, 06 Feb 2017 10:06:46 -0500
Received: from mail-lf0-x243.google.com ([2a00:1450:4010:c07::243]:34270)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <edgar.iglesias@gmail.com>)
	id 1caksH-0008Aq-3a; Mon, 06 Feb 2017 10:06:37 -0500
Received: by mail-lf0-x243.google.com with SMTP id q89so4189942lfi.1;
	Mon, 06 Feb 2017 07:06:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Z76zCpR6cMtv1sIUDPZO9MbqLSFC46pACfbTUZ480qo=;
	b=ToyneyIwVIagJ24eweIyf7esd+IxmpwvV8BJG9/z17CltoR26LDvh9ctH4qdtXy4dm
	GIupUZTDmLQVEXoeCFsCcdJFkqQXYcRuIdFW2SQ1IXKnpdYiRPvzmsbAYCi+fPzNNEkp
	NDYPfpxYrsY94FyxCqp6+z1Hq4QGUK9ohEXJEu9aUAdlYEfgZww0Z6qNsaXu6WABlHm6
	occM1hP80ggJ/poZ3I8jnqHIMeyLepMfZXhYtFgUwq6kaaeATVAA3bZaf5xxNque6kqj
	YYPr2P8bUuM3T2kSYN01gS2057vAJ1A/7JxOWv06IRS/tRNZjExgQtQprq14Uh7gLt0c
	QZRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Z76zCpR6cMtv1sIUDPZO9MbqLSFC46pACfbTUZ480qo=;
	b=BRMF/1Ql77mbPkgVbYMk9JOUmXcy4PQ1jdHeI3OvgPjEshO9cKNRPIRaZ8e14pG/xN
	lNVqUg0FPFL/tQHcAcZvjAEt76kioJtqtJIiJ3RMAwHxA1E1fn/nVKPaoXbrmlnIahLM
	X6F9/BtgxRI1uauY9v6YvDzO4t2EFnTpxGXdKGF/rw+hsC6u+31dV+MtPS6K3nxLBRao
	AfYr7mF08/jMrmOeqG094NsA5tCBVJCzAUrM8OEZNZ4shbX9RDpT615c3b2QzWPzlMY0
	1joZYS21YnJbDP/tfVYebxxAlMQ7BPnVTKeMrnUayPjfyBDO8C3Ufsaa9PjGC/fmx2ae
	eQPg==
X-Gm-Message-State: AIkVDXKw7QdXK3nSRwOXfY5SOrfO7tMrxf/84/K9rYVz4i2ZoYyJlvlXDKh6JADQJTlZ7w==
X-Received: by 10.25.21.142 with SMTP id 14mr3943815lfv.138.1486393595134;
	Mon, 06 Feb 2017 07:06:35 -0800 (PST)
Received: from localhost (81-231-233-234-no56.tbcn.telia.com. [81.231.233.234])
	by smtp.gmail.com with ESMTPSA id m18sm350537lfe.45.2017.02.06.07.06.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Feb 2017 07:06:34 -0800 (PST)
Date: Mon, 6 Feb 2017 16:06:33 +0100
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20170206150633.GQ9606@toto>
References: <1486144135-4894-1-git-send-email-peter.maydell@linaro.org>
	<1486144135-4894-3-git-send-email-peter.maydell@linaro.org>
	<20170204143132.GP9606@toto>
	<CAFEAcA9ybZzMPKMUUyrALGq4ufwBbWPFAtZEctHmA1CKnnpLgQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA9ybZzMPKMUUyrALGq4ufwBbWPFAtZEctHmA1CKnnpLgQ@mail.gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:4010:c07::243
Subject: Re: [Qemu-arm] [PATCH v2 2/2] target/arm: A32,
 T32: Create Instruction Syndromes for Data Aborts
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4+qoW9mtfeb5

On Mon, Feb 06, 2017 at 02:53:49PM +0000, Peter Maydell wrote:
> On 4 February 2017 at 14:31, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> > On Fri, Feb 03, 2017 at 05:48:55PM +0000, Peter Maydell wrote:
> >> Add support for generating the ISS (Instruction Specific Syndrome)
> >> for Data Abort exceptions taken from AArch32. These syndromes are
> >> used by hypervisors for example to trap and emulate memory accesses.
> >>
> >> This is the equivalent for AArch32 guests of the work done for AArch64
> >> guests in commit aaa1f954d4cab243.
> 
> >> +static void disas_set_insn_syndrome(DisasContext *s, uint32_t syn)
> >> +{
> >> +    /* We don't need to save all of the syndrome so we mask and shift
> >> +     * out uneeded bits to help the sleb128 encoder do a better job.
> >> +     */
> >> +    syn &= ARM_INSN_START_WORD2_MASK;
> >> +    syn >>= ARM_INSN_START_WORD2_SHIFT;
> >> +
> >> +    /* We check and clear insn_start_idx to catch multiple updates.  */
> >> +    assert(s->insn_start_idx != 0);
> >> +    tcg_set_insn_param(s->insn_start_idx, 2, syn);
> >> +    s->insn_start_idx = 0;
> >> +}
> >
> > Could we move this into translate.h and share it with translate-a64.c?
> 
> Sure; I'll just squash that change into this patch and put the
> results into the target-arm queue, rather than burdening the
> list with a v3 respin, if that's OK.

Sounds good, thanks!

Cheers,
Edgar
