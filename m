Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp803570wrt;
        Wed, 26 Sep 2018 08:23:17 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62aswDaB2ozXpMR4MHK9TcwTpho9RfAL1xzyBJMzQTiMdC0nfNOkGZw7Hef4nyY1+rCMMTu
X-Received: by 2002:a0c:c38e:: with SMTP id o14-v6mr4713250qvi.36.1537975397811;
        Wed, 26 Sep 2018 08:23:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537975397; cv=none;
        d=google.com; s=arc-20160816;
        b=VsyDbLI++STZotAbuL9TtSTwZvYpGVC6VA0qjjXhvhsw9pO/1/xVnODAWfk6r7qKoy
         4bw1VRH4FVZasXpn4kMvSlvEqZCZcSffKEb6hq+RIVhG3ng7BHqhZ8SoJjqALVBxV4G6
         c2tipJNqaLdBNn0edY9Jlsfl/CUAh+biqAiI2Lf6ForwLoCe7chrj2g+oFzSt1NtwZBH
         Y9HFmpNRBgcKm5lvd32vudlMO1iseqHth+7VtK9hZYypJv8R3t6jaeH11wO2pBYq/eYF
         vNAN9BQlkIPjgTE+IwxfzJ8PsxX18MFOELeFqtHEBuXLB87YyTP12z2l347mKl+GrKRw
         /DsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=jcEPqce+PzFi3Zrob4PcMDtI4b+kzWR4b5QbgiPQ0KI=;
        b=htFtKKoXpWQVEy8ygoIucwQDgklBnswyfyL+7WcRdIxHGYWf/1rHzFwaEippAbf0Fs
         ms2FXTcX9F9VEaila5NsL2NasLvllxLgioR2weTVS+ruwipEblYJktVrRadSnfVr9i4y
         dt1Y5KJEehREkMzCJKo8GxJJrwl5IzigXt3sCqLoxDFo8lAemMNpTOr54U6U1xyIb68Q
         LnzDoysLQmqKJbgFq9yBPsE5+ugcF7NCYk9GQXyxs7TN5fccYcn3pOr4WcnLNEfUU+eD
         uSIyZGPgQdwfBTeYwFThImQpF2MQwy815vZm7F5rmRy0GvB/9IzGvd8MN3f+Eob3HkmI
         Hp5g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TnF3TEYV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z17-v6si4975475qkg.75.2018.09.26.08.23.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Wed, 26 Sep 2018 08:23:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=TnF3TEYV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:59328 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g5Ben-00089d-Bz
	for alex.bennee@linaro.org; Wed, 26 Sep 2018 11:23:17 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:48773)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1g5BeY-00089Y-0F
	for qemu-arm@nongnu.org; Wed, 26 Sep 2018 11:23:08 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1g5BeW-0000R5-FP
	for qemu-arm@nongnu.org; Wed, 26 Sep 2018 11:23:01 -0400
Received: from mail-qk1-x741.google.com ([2607:f8b0:4864:20::741]:39954)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1g5BeW-0000QN-7P; Wed, 26 Sep 2018 11:23:00 -0400
Received: by mail-qk1-x741.google.com with SMTP id c126-v6so15914795qkd.7;
	Wed, 26 Sep 2018 08:23:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=jcEPqce+PzFi3Zrob4PcMDtI4b+kzWR4b5QbgiPQ0KI=;
	b=TnF3TEYVRtJ7DH5eH2DZF8FmuODU8+nYHHlkv+BQAYIMugPmBzHqZCT0J4xPHIvg4V
	okQkwS8O9M2zArf/FGxIMMOHSP38GzGgRudgJdHAweYUl5f6M9p4trwehbZ4DXsGNRkh
	6hUyUhjKZTM54WiaYDVXnwJL2RuBMlkjx0qsarM9RfldOyvpr1Cs4zgmaCfUozK7xlX7
	9cSjIwQhDyakaCNhD2q30gzwuLXNvEEmTUhgJE4sZM79MvYo0xSBIjaZK+Z28zFLJkIC
	9URVsJXcK5e/EZSugiLxrxSgfUTF2afQrs/lEcjtxHWVwSu8hbU1Zb6R3xTxSXwD96lL
	ZLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=jcEPqce+PzFi3Zrob4PcMDtI4b+kzWR4b5QbgiPQ0KI=;
	b=LM82pTADy/vSADHrH7iYrVRqeBL3waEzdO4+IdApL35+gbreSZl5AZ6juS4wZiK9CY
	0q90zEZWB+oFA2ZROyJM6sPQ5Uu6xFtQ9aissOfnEN8FqvBQ+4L4QVOQ1iiGAWG5SUxp
	Yh5aeLsSuOVN1D1e7KU3PjN38fX3ev1t4hrAcEEcvueg8ePaHZs5Au40gFHoZirpZU/O
	3D68O9yTU/bE9bTAlsBVj6WA1GnnUV3sOU4+HovizbD71Au+oD0OeVMcVOk54bmqSQyM
	wTUfYD6nQCjmiUM+Smm2kxXRYEb/OCt+KyTEtRXSsPj8bgiZ5q8sixjFnmL6joekQ9jv
	7P8w==
X-Gm-Message-State: ABuFfoi9sB2hdYqUUIsRvpY588Xt287Tq0dfjkOawX84fNmZj/HG9FgE
	1PrQuI0DqPOImgTy3tfR0uc=
X-Received: by 2002:a37:8742:: with SMTP id
	j63-v6mr4637294qkd.353.1537975379605; 
	Wed, 26 Sep 2018 08:22:59 -0700 (PDT)
Received: from okra.localdomain ([2600:3c03::f03c:91ff:febb:cdda])
	by smtp.gmail.com with ESMTPSA id
	l18-v6sm3710378qtb.2.2018.09.26.08.22.58
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Wed, 26 Sep 2018 08:22:59 -0700 (PDT)
Date: Wed, 26 Sep 2018 11:22:58 -0400
From: Aaron Lindsay <aclindsa@gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Message-ID: <20180926152257.GH3671@okra.localdomain>
References: <1529699547-17044-1-git-send-email-alindsay@codeaurora.org>
	<1529699547-17044-2-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA8601LbuOOARb0KoNLjJep3-ND=Kf44OqW6NXdVtnNocw@mail.gmail.com>
	<20180828200348.GB3671@okra.localdomain>
	<CAFEAcA-mrcrwJF7=QCerrtfDOJhoW1rdcAuGFDatFQ-W4CLn7Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFEAcA-mrcrwJF7=QCerrtfDOJhoW1rdcAuGFDatFQ-W4CLn7Q@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::741
Subject: Re: [Qemu-arm] [PATCH v5 01/13] target/arm: Reorganize PMCCNTR
 accesses
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
Cc: Aaron Lindsay <alindsay@codeaurora.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RDkBAB1zQb8k

On Sep 25 16:18, Peter Maydell wrote:
> On 28 August 2018 at 21:03, Aaron Lindsay <aclindsa@gmail.com> wrote:
> > On Jun 28 17:40, Peter Maydell wrote:
> >> I had a look through the patchset, and I still can't see
> >> anything here which indicates how we're handling migration.
> >
> > I'll admit that I had not previously thought through everything
> > exhaustively, but I think I've convinced myself that *almost* everything
> > is already handled by calling .readfn/writefn on the registers for
> > migration... more below.
> 
> Thanks for writing up this explanation; it's very helpful. Sorry
> it's taken me a while to get to it -- you unfortunately sent it
> just as I was going on holiday...

No problem - I noticed you went quiet on the list right when I sent it
and figured I scared you away!

I've got a v6 staged - If you don't come up with significant design
changes based on my response below, I'll plan to send it in the next few
days.

> >> If this field is only ever used as a temporary while we're
> >> between op_start and op_finish, then we can just return it from
> >> start and take it as an argument to finish, and we're fine
> >> (migration of the PMCCNTR_EL0 register will be done by calling
> >> its readfn on the source and its writefn on the destination).
> >>
> >> If there's a reason for having this be a field in the state struct
> >> (I think you said counter overflow)? then we need to be sure that
> >> migration is going to do the right thing and that we don't for instance
> >> lose overflow indications during a migration.
> >
> > I think we do need additional state for supporting counter overflow
> > during normal operation (more than just between op_start and op_finish),
> > but I don't think sending additional state over the wire is necessary
> > for migration. Let me lay out my reasoning to see if you think it makes
> > sense:
> >
> > I observe that we seem to deal mostly with the following values with
> > respect to PMU counters, and I think it might be easier to discuss this
> > in terms of values rather than variables:
> >
> >         AC = current architectural value of PMCCNTR
> >         AL = architectural value of PMCCNTR when last observed/updated by
> >              the OS
> >         UC = current underlying counter value
> >         UL = underlying counter value when PMCCNTR last observed/updated by
> >              OS
> >         D = difference between underlying counter value and architectural
> >             value
> >
> > At any given point in time, the following should then be true during
> > normal execution (i.e. between OS accesses to the counter):
> >         UL - AL == D == UC - AC
> >
> > The approach taken previous to my patchset was to store D in
> > cp15.c15_ccnt most of the time, updating that variable to hold AC when
> > read (by doing `c15_ccnt = UC - c15_ccnt`... an implementation using `AC
> > = UC - D`, which is a different way to write `D = UC - AC` from above).
> > This operation was reversed after a write completes, so that c15_ccnt
> > again holds a value corresponding to D.
> >
> > Only storing D works well and minimizes memory usage if you don't care
> > about detecting overflows. However, without some frame of reference for
> > what the last observed architectural value was relative to its current
> > value, we have no way to know if the counter has overflowed in the
> > intervening time. In other words, we need to know both AC and AL to know
> > if the counter has overflowed. Assuming we store D and can obtain UC we
> > can calculate AC, but we need to store at least one additional piece of
> > information to obtain AL (either AL itself or UL).
> 
> In this scheme, how do you tell the difference between "AC > AL
> because it hasn't overflowed" and "AC > AL because it has overflowed
> and run all the way round past AL again" ? That is, I'm not sure that
> storing AL helps you to reliably detect overflow.

I wrestled with how to accomplish generic overflow detection in a
foolproof way that fits with the event-driven design. My current
implementation (see [1]) adds a function called ns_per_count for each
counter type, which is used to setup a timer to overflow at the earliest
time a given counter is expected to overflow. My thinking is that even
if this isn't perfect (i.e. if there's a little 'skid'), it is likely to
be close enough to prevent the type of wrap-around double-overflow you
describe. I'm not wedded to this design - please don't hesitate to let
me know if you think of something better. 

> > In my patchset so far, I'm storing AL in c15_ccnt and D in
> > c15_ccnt_delta during normal operation and AL/AC in c15_ccnt, UL/UC in
> > c15_ccnt_delta between op_start and op_finish (note that AL == AC, UL ==
> > UC, and D == 0 during this time). Also note that UL/UC are only stored
> > between op_start and op_finish calls to avoid losing time, and are not
> > needed to maintain architectural state across migrations.
> 
> > Now for migration - The read/writefn's already marshal/unmarshal both
> > the counter value and overflow state to their architectural values in
> > PMCCNTR and PMOVSCLR. I think this would work on its own if we made
> > two big (and wrong) assumptions:
> >         1. PMOVSCLR is read after PMCCNTR on save (ensures all overflows
> >            which have occurred are recorded in PMOVSCLR) and written before
> >            it on load (ensures any overflow bits in PMOVSCLR cause the
> >            interrupt line to be raised)
> 
> There is indeed no guaranteed ordering in which registers are saved/loaded.
> Also, the load function mustn't raise interrupt lines: it has to transfer
> the state just of this device, and trust that the device on the other
> end restores its state into one that matches the current level of the
> interrupt line.

Okay, got it.

> >         2. Time (as measured by `qemu_clock_get_ns(QEMU_CLOCK_VIRTUAL)`) does
> >            not change during the process of saving or loading CP registers
> >            (ensures PMCCNTR can't have overflowed between when it was saved
> >            and when PMOVSCLR was later saved).
> 
> I think this assumption is true, isn't it? (VM migration happens while
> the VM is stopped, and do_vm_stop() calls cpu_disable_ticks() which
> means QEMU_CLOCK_VIRTUAL won't advance.)

Ah, okay. I wasn't aware of this detail.

-Aaron

[1] - http://lists.nongnu.org/archive/html/qemu-devel/2018-06/msg06843.html
