Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp703219wrq;
        Fri, 13 Jul 2018 06:43:47 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeBFgQOA1IrhnL1wVHfVETZrZLyVvqu7i+ucV3q/56OHVJlOFKAf2MBfCyxpHBcbiMHZHL6
X-Received: by 2002:a37:2990:: with SMTP id p16-v6mr5592283qkp.386.1531489427552;
        Fri, 13 Jul 2018 06:43:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531489427; cv=none;
        d=google.com; s=arc-20160816;
        b=AsebhQWED8xfY4wCDf7TauqRwn9VppebsVMDNICfXVNIzENaATBaidetPO5KS95thz
         sjNeh0YTdQZKa+JHMztxBOTUKfwBQIzAR7g1A3hV0wUQ56a4/OHUIlsy8Xk9A+3HwazM
         ZFGSfCny7lKxih3FfuSPuKA3MJ9aygeQxi+KEyjoppOFHd0j/VMHq1d4XywGN7fjhqaJ
         RuyxJdq6hFEHi3636ABbqp5gga0Ls3JSc4UuHgBRTPIokOrW9hQPHV9U3HL/2hDRDdeA
         TmcENK8EXuu9Q5QmcdPtOKmTZ45gmi826ajvQlznQ7uh8C9Mrb4ZY1vbc8TlWoNnw5/6
         ZyXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=6+5/WlBqceFrd8m2254j6yxFKda32z5npOSj6qKKa0A=;
        b=Otl1kvkxGNdvT0V3i31Rypcc+8wniC5TPeM01nT6v1D5c+ElVuuOtc0K8ZUyB/QcM/
         v9BVCzBRrWUsg7I5/snOV2gOSF0SZ7kmBwSIx62fPdWp92B7F4c1utIoZFbQlsgmdqi3
         wtBBj92mGuNCTV44b7U+dcnfo6Jbd9GlGZMVn5e+FmP3VX0FVmleXiTp9vogZbmcSI03
         fX9sR+dUVlEEarAnZaT6iUx3HQTqUSBxCu6Ue9vz0HjbCXXre3Wp0CXkbHyMFE+BNvFq
         YN97+e8QxuhL4oRBCsjgFofixJeZhKa8WPFmDbuC0vPNf/I8oGNdOPmvYIAXdheQmbj8
         btUA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="RFhMqDw/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 2-v6si5820646qvu.77.2018.07.13.06.43.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 13 Jul 2018 06:43:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="RFhMqDw/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37469 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fdyMM-0004la-VT
	for alex.bennee@linaro.org; Fri, 13 Jul 2018 09:43:47 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:50695)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdyKy-0004CX-A7
	for qemu-devel@nongnu.org; Fri, 13 Jul 2018 09:42:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fdyKx-0001Rl-Cg
	for qemu-devel@nongnu.org; Fri, 13 Jul 2018 09:42:20 -0400
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:41213)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fdyKx-0001R7-7i
	for qemu-devel@nongnu.org; Fri, 13 Jul 2018 09:42:19 -0400
Received: by mail-oi0-x241.google.com with SMTP id k12-v6so62242271oiw.8
	for <qemu-devel@nongnu.org>; Fri, 13 Jul 2018 06:42:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=6+5/WlBqceFrd8m2254j6yxFKda32z5npOSj6qKKa0A=;
	b=RFhMqDw/d7cK6srHcGYFAJoGU2vgV2Mj8zQYNKs9mc0Lp0INDMDPoysRsRNVyvNb1C
	ldeIegqL1zHICCo+J4dpBi2IL9TrX0pcdTEG/0aw4g5grIlLQ4RcmLVrR08framuI76f
	1GHD76r4qqRDi8EEbAtobhJnU4guEsHIUHeYU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=6+5/WlBqceFrd8m2254j6yxFKda32z5npOSj6qKKa0A=;
	b=k0mA2SuUQJfO7aRnwELpjZTBRozRTDTXrTVqPAClFfFsZchTr8lPUoemTOKUyksO1I
	fmCQIxaDMoAJ7XWhQiVZmAq3O3Ji/CITeOYS3lb5svLrmK8/F7bhet7QIgcrePM9UQpd
	JKsGsI4Z9IVe4JBi/WUM41O7ITGqNpVgmfF23RscrXGJGNIm2jGIuhmQ5P2aYL8aCrtf
	OkAMANkxLHhprnU6lcYixxl8x+O4mlr5uUiwrOx9rk8tGIhu8Hy52TcTW50BMkSqz8Bp
	U+MUJrlUL8Y8qiLB+s/hTSkorLutfM9d/99hqSSBrPFqQtz5iKnVYzzZmNtEkzQug6Ry
	uBGw==
X-Gm-Message-State: AOUpUlGKJQJaBD2DehbkExARMrWA5PozOmWLgHC4O5WIg5xaowv5z9nB
	3C4Fxb1v+wz1sDXs54jxF61SCRi5XFR9Fs7nmFk5iA==
X-Received: by 2002:aca:7247:: with SMTP id
	p68-v6mr7296778oic.252.1531489338449; 
	Fri, 13 Jul 2018 06:42:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Fri, 13 Jul 2018 06:41:57
	-0700 (PDT)
In-Reply-To: <f32095a2-72b7-662d-ee58-670c2b322218@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
	<20180629132954.24269-17-luc.michel@greensocs.com>
	<CAFEAcA_fFsqwr316OLcZVwBs72ESLob1AKDZN24JfFo78zQ=AQ@mail.gmail.com>
	<f32095a2-72b7-662d-ee58-670c2b322218@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jul 2018 14:41:57 +0100
Message-ID: <CAFEAcA-UGEW7GkfeRDfxv6PzAE8dkiqHEpYc+Z3OMW0yZ7ynSA@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-devel] [PATCH v3 16/20] intc/arm_gic: Implement
 gic_update_virt() function
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tyyftJW4+Pfe

On 13 July 2018 at 14:33, Luc Michel <luc.michel@greensocs.com> wrote:
>
>
> On 07/12/2018 03:56 PM, Peter Maydell wrote:
>> On 29 June 2018 at 14:29, Luc Michel <luc.michel@greensocs.com> wrote:
>>> Add the gic_update_virt() function to update the vCPU interface states
>>> and raise vIRQ and vFIQ as needed. This commit renames gic_update() to
>>> gic_update_internal() and generalizes it to handle both cases, with a
>>> `virt' parameter to track whether we are updating the CPU or vCPU
>>> interfaces.
>>>
>>> The main difference between CPU and vCPU is the way we select the best
>>> IRQ. This part has been split into the gic_get_best_(v)irq functions.
>>> For the virt case, the LRs are iterated to find the best candidate.
>>>
>>> Signed-off-by: Luc Michel <luc.michel@greensocs.com>
>>> ---
>>>  hw/intc/arm_gic.c | 170 +++++++++++++++++++++++++++++++++++-----------
>>>  1 file changed, 130 insertions(+), 40 deletions(-)
>>
>>
>>> +
>>> +/* Return true if IRQ signaling is enabled:
>>> + *   - !virt -> from the distributor to the CPU interfaces,
>>> + *              for the given group mask,
>>> + *   -  virt -> from the given virtual interface to the CPU virtual interface.
>>> + */
>>> +static inline bool gic_irq_signaling_enabled(GICState *s, int cpu, bool virt,
>>> +                                    int group_mask)
>>> +{
>>> +    return (virt && (s->h_hcr[cpu] & R_GICH_HCR_EN_MASK))
>>> +        || (!virt && (s->ctlr & group_mask));
>>> +}
>>
>> For a real CPU interface we test the GICC_CTLR EnableGrp0/1 bits here.
>> For a virt CPU interface shouldn't we test the GICV_CTLR bits ?
> This test is still done in gic_update_internal() (we test
> s->cpu_ctlr[cpu_iface], with cpu_iface being the index of a vcpu when
> virt is true). I can move it in this function if you think it's clearer?

Oh, I see, you put it in the outer condition:

+        if (!gic_irq_signaling_enabled(s, cpu, virt,
+                                       GICD_CTLR_EN_GRP0 | GICD_CTLR_EN_GRP1)
+            || !(s->cpu_ctlr[cpu_iface] &
+                 (GICC_CTLR_EN_GRP0 | GICC_CTLR_EN_GRP1))) {

Yes, I think if we're going to abstract the check into a function
we should put it all in the function, not have half of it
in the function and half not.

(The purpose of the function is "identify configurations of the
GIC where it cannot possibly generate either an IRQ or a FIQ
regardless of the individual interrupt or list register state,
so that we can early-exit without doing a complete scan of
all interrupts/list registers".)

thanks
-- PMM
