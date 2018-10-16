Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp6075271wrt;
        Tue, 16 Oct 2018 08:29:41 -0700 (PDT)
X-Google-Smtp-Source: ACcGV60b/nEeCyCCruYJrX209uwefAe7YUPnmFPMxY8o2yP5e2YiIZG9t8GUlmaf6CLVfAY6oB7J
X-Received: by 2002:a0c:b79c:: with SMTP id l28-v6mr21919371qve.127.1539703780992;
        Tue, 16 Oct 2018 08:29:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539703780; cv=none;
        d=google.com; s=arc-20160816;
        b=v9hiEKrqpD1rYWSzYpuBa+tqa5WLtY8ESBwr8XXBK6x7NciDLGM97+5cVwjMbzwRF9
         qgi2anHWd2pVfZwGhqC0pmLANq7YRgy8I8Vilp8iVTJbaOlJd8hfbqRC8LKO1r3GEs79
         8bPfr/NJpz8FY6U8IX8nxcFxyqRReySOp5+NivP4btDCI5twgNzBk9ZEFjGPHdSH0rRE
         y84caZeNdjB1OFU+nmM/QY0dfm5/ZrOBFjd6ZBssppOuq8ybW/jZHGGs/Z6kibscHsNs
         4Qt/1+YgTFtiiW7GotchtufY++83l6COrxhbHwUOr8zDXZ15LEQOfNhE4bZ6tP+Gh1n/
         6GKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date
         :dkim-signature;
        bh=kGMnFnGCkNWKjgqQD3cBrYViGSEd57xOYESh+flHljY=;
        b=EJQGsusPG8wLRxvt8f+3tOTg9yUSKY/2GGZ1RT97VoaSdV0fAzhpRazy31ZjtlJiZ+
         FSgjKoFpNPtU+nPIZhTN695kTV2HuJ7A4jyXn7AMD2lyu9xhk3BAG0jZ7lk3wul2vj+X
         m14FCHBUBCco1qYZ4zGpeJI189iaQjcE9pWVxB9vHcX1MLATAAd86GW4DBAqDcJX6oK9
         6X73AcjC4yLZ+03pHz2/CG/J9k8zgOKH3F3/0G3sgTAqV1JrElS+y/18y9AMKjpDY4Y+
         O5Axnxhg1f9A1CyVTQuXVkn9qwPYglAv/BL1DZEdci0MZ62rBqLCT3mskLspz1HIvllC
         Hxcg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qbeFyzLS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 55-v6si3509711qty.142.2018.10.16.08.29.40
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 08:29:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=qbeFyzLS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:58691 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCRHw-0006ew-FX
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 11:29:40 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43927)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gCREa-0002zo-I2
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 11:26:15 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <aclindsa@gmail.com>) id 1gCREZ-00048Q-Pm
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 11:26:12 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:41142)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <aclindsa@gmail.com>)
	id 1gCREZ-00047z-Gl; Tue, 16 Oct 2018 11:26:11 -0400
Received: by mail-qk1-x744.google.com with SMTP id 23-v6so14348387qkh.8;
	Tue, 16 Oct 2018 08:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=kGMnFnGCkNWKjgqQD3cBrYViGSEd57xOYESh+flHljY=;
	b=qbeFyzLSucL/Gd1E2RxKdrbLUaSyaBRcFoXgVi7QqCpq8u3j3OWcUBVOtnuSmzth7c
	nxo89WezYn1huQ7AbpXi9AyF7IWFANq6m/4Yvi54kBeNpXOeWHDKF7dt9f6+YXQFqFPP
	aeOSGOz0Q8RHuNU/11AAgGDFeZ65u6/I9g+A/4Mwacf0NFo6E0HPinqZVbqopMFTc9Oi
	cl5Li98V3GzpnkwbhObwm7yHozFXeHU0lFDFZ9hhG3xXjF1053IJpOVJUtG6PJzJY9//
	heuVOIGqJ7caY7iwMgKKPjrmGgAWUnajufxuY/anWN3WsZ/xpcJPqkIzBN6CqS2Dwhan
	owug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=kGMnFnGCkNWKjgqQD3cBrYViGSEd57xOYESh+flHljY=;
	b=JGMGjSMMTnavSkeGHY9RPvY5Nwfm/gOY+5gIOJ7PHwwdIZMTtOdUGypDTTu0KwSje3
	tJkYpxuGgJl8fsn3Ww0cKeuSuA0/NQnBnJO9dd+G/MotdrysuXUewi5F0Wy8q4olhOLq
	ve9eyUR3zYpP0n7XQwVq1gUcb2xCEXZOeN3M8zo9Em3M8epBfxKyTlAKRWTT7+OH88Wn
	WOHRh/0fZJJKcKxta+Fkj9y2IrHWK99xf+Zem4mMJAO3u83imPwAgxhoHdda7BQWMtUI
	A7uorxkmmPel4kZcw7MC0dFT814cSroRBBgof0/TZE7O+ar0CX3Rppc4xvlxPsucKb1L
	XWMQ==
X-Gm-Message-State: ABuFfojHXvYMqaLtlrTgBOPUBxOoK2SBj00IP5xsJusvv5Fsylks1rT4
	FE29pMVVrNYjomAjz8ZSlzA=
X-Received: by 2002:a37:12d1:: with SMTP id
	78-v6mr21034485qks.147.1539703570937; 
	Tue, 16 Oct 2018 08:26:10 -0700 (PDT)
Received: from okra.localdomain ([2600:3c03::f03c:91ff:febb:cdda])
	by smtp.gmail.com with ESMTPSA id
	o41-v6sm10621613qto.38.2018.10.16.08.26.10
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 16 Oct 2018 08:26:10 -0700 (PDT)
Date: Tue, 16 Oct 2018 11:26:09 -0400
From: Aaron Lindsay <aclindsa@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <20181016152608.GQ3671@okra.localdomain>
References: <20181010203735.27918-1-aclindsa@gmail.com>
	<20181010203735.27918-7-aclindsa@gmail.com>
	<b58c1b9d-f3d7-198e-e31e-d276effc42a9@linaro.org>
	<20181016122542.GM3671@okra.localdomain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181016122542.GM3671@okra.localdomain>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::744
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 06/14] target/arm: Filter
 cycle counter based on PMCCFILTR_EL0
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>, qemu-devel@nongnu.org,
	Alistair Francis <alistair.francis@xilinx.com>, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: almFvN2YXt8/

On Oct 16 08:25, Aaron Lindsay wrote:
> On Oct 15 13:51, Richard Henderson wrote:
> > On 10/10/18 1:37 PM, Aaron Lindsay wrote:
> > > --- a/target/arm/machine.c
> > > +++ b/target/arm/machine.c
> > > @@ -584,7 +584,7 @@ static int cpu_pre_save(void *opaque)
> > >  {
> > >      ARMCPU *cpu = opaque;
> > >  
> > > -    pmccntr_op_start(&cpu->env);
> > > +    pmu_op_start(&cpu->env);
> > 
> > Does it make sense to move this patch earlier so that these hooks are modified
> > once?  No big deal if not.

I took another look at this, and I think it makes sense to move the
pmccntr_op -> pmu_op changes into "target/arm: Reorganize PMCCNTR
accesses", independent of the filtering changes.

-Aaron
