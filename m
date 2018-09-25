Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp721868wrt;
        Tue, 25 Sep 2018 07:09:44 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62942/jrZYOeHPfRpt9JGBnW6pqxxPYmjudQRTrEt/Hz6t8BlMyP8yu0QBT4s0SOP5IwHv8
X-Received: by 2002:a0c:f446:: with SMTP id h6-v6mr888058qvm.208.1537884584713;
        Tue, 25 Sep 2018 07:09:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537884584; cv=none;
        d=google.com; s=arc-20160816;
        b=NV0xxHL5MASJ9e6UjXOKTxn82jBaMFXmV1UfMK3uY3XBfpS3ImSK0YzM7X9vdbaQeD
         2gIb6Cp6adVZh3B9QlajVbiuJDz7nVFBGRZMVdAezY2FmItY4OJtLFSJ7qVtJsgKpvCU
         sKZsuIm3L0+LTTK4TDZKqu1IuGdD44Qprl751EFYf/9cxMLGSfZM/w3EL2Y+w7FwiChg
         wWgIjDaNPivRWhWa4WjpmFPS0lMzFnQvyeSX5m3PY5upOXQ31Ies/9wRPDh22ZuaEUp7
         YGQ9uaoNlRk3A0JQvdMZ9uHHtPoqScX2SU0ZVRsuYLlSsTsyxsStJjQjoYE35SVNstUB
         6VbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=il20ph/QDCP1VFlNx8IovEltBvww8tMWzWYFyb6Z3qk=;
        b=o/bWsopGmUgqNIiaq2siwTH7EQ4JAfQWPzOEQnqcITIadyspmGeuu8txyEdacGi6gQ
         7yj+H8mLowpywVLvvg1WKACWQDUeR5Ydg5C7BfAQvMLULFOJBPvDn682BnVRU8LamjQ6
         xxgaX54Rf3k3aFFEHCuWvHH4usENY4Y6AjmqanzjLUVNX8SPTnAuF/hg+5zFv5RkyEjX
         DSDsdLJqOS3s1DancrukQW0M+4DRoh1TMPiJgyKQH2GK1eiXo1KEBKhw4fg6SkI/Osk2
         ptX8LQvPz1yA52nulhATURE/LjkxbgZ6s3gW6TjYZCtGcxQWFrFjo0oE8cJOyh1rRa9E
         jPVg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ESYdvvV3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g20-v6si1730886qtr.323.2018.09.25.07.09.44
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 07:09:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ESYdvvV3;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53304 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4o23-0005CJ-Kt
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 10:09:43 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44881)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4ntw-0006mM-Aw
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 10:01:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4ntu-0000HN-0h
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 10:01:20 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:45276)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4nts-0000Ff-1j
	for qemu-devel@nongnu.org; Tue, 25 Sep 2018 10:01:16 -0400
Received: by mail-oi1-x241.google.com with SMTP id d63-v6so1561873oic.12
	for <qemu-devel@nongnu.org>; Tue, 25 Sep 2018 07:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=il20ph/QDCP1VFlNx8IovEltBvww8tMWzWYFyb6Z3qk=;
	b=ESYdvvV3sHVO0AvgmOTBdRly7zKUWpDOBeZ5MICJDt61mN/bMP1IEgqXCr6x+T380L
	pBDP5Td+WIQGQzAMc01olC0WlHihPe1OgtVOw3Gvu1WjyTHgfX0JIgyyQmXHABwqyVMH
	ZgFOg6gaXW89wFVcdrDyMo5N4JErmXUiz4888=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=il20ph/QDCP1VFlNx8IovEltBvww8tMWzWYFyb6Z3qk=;
	b=Vy5jh4xMNkbe/HGVWeC4Bi3UnQmV1ic/2ZWfMY8Ks17iKvs8/ql/k8wabEwtoD4dXO
	L0qzh+0gjvsUm9Fcfp8nUK6gezu+nCOlpe/hqxNrFpJylP+F/zObByTCzSQG8Yrg13in
	Z/Ca5u1IVeK+wk+zTRw0uKFyQdV7L9n+SXn0lXp5iQhnR18fHxMgQSMmFhIIxfS5L00h
	BvfuOf4P7R0xYw93+bl1MoM/w2zmJJCZX0XycbsxrrirLUCCdG5vc1JRqSRwikqxMyTk
	MDE2W87knknzAidzJMgVqJSC9AG0FgoF3FzagfmFm6s91FRfIrByOKf5bpUsoi2VBQC+
	Lbbg==
X-Gm-Message-State: ABuFfogXUcRVBLTIKtUVR9QnUNyzhY/LDr5DxeEAJIPFiSZEZcUU+tVd
	IzOQNjFn0vPMRaqDL4RL7fhuij3NOMSNuTaVT9lMIg==
X-Received: by 2002:aca:40d6:: with SMTP id
	n205-v6mr697027oia.35.1537884074418; 
	Tue, 25 Sep 2018 07:01:14 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 07:00:53
	-0700 (PDT)
In-Reply-To: <7cac68bf-4047-c20a-dee5-2764ee595795@greensocs.com>
References: <20180917084016.12750-1-damien.hedde@greensocs.com>
	<20180917084016.12750-2-damien.hedde@greensocs.com>
	<CAFEAcA9M1MDcbx9CA60zaHnFbtHQD2G_HAWFdPimWhyn==_jqA@mail.gmail.com>
	<7cac68bf-4047-c20a-dee5-2764ee595795@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Sep 2018 15:00:53 +0100
Message-ID: <CAFEAcA8oekUL3XEnwDYbAbzwSfUQ74xQxRvb0gZ3cgmm_nF_PA@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH v4 01/10] hw/core/clock-port: introduce
 clock port objects
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: W8jCxQ1ZGTKS

On 25 September 2018 at 14:59, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
>
> On 9/25/18 11:42 AM, Peter Maydell wrote:
>> Having a ClockPort which ClockIn and ClockOut are derived
>> from seems a bit heavyweight. When would you want to operate on
>> a generic ClockPort rather than either a ClockIn or ClockOut ?
>> Why would you want the name (canonical_path) to be different
>> at the input and output ends -- is it possible to simplify
>> to just having the output end keep the name string ?
>
> Here the canonical path is the full qom's canonical path. It is cached
> in the state to avoid recomputing it when needed. It is only used for
> log/trace purpose (without it, log is useless and calling
> object_get_canonical_path at every log seemed too costly to me).
> A connected ClockOut and ClockIn do not have the same (qom) parent,
> their canonical path is different.
> For example, in the zynq platform, there are 2 uarts, each one having a
>  "refclk" input. There is also a clock controller (slcr) having 2
> outputs "uart0_ref_clk" and "uart1_ref_clk". We end up with something
> like this concerning canonical path:
> + output "[...]/slcr/uart0_ref_clk" drives input "[...]/uart0/refclk"
> + output "[...]/slcr/uart1_ref_clk" drives input "[...]/uart1/refclk"
>
> Right now, I log a line for every end (output and input) when the clock
> frequency change, which lead to a kind-of-duplicate log line (names
> differ, but clock frequencies are obviously the same). I could only log
> at the output end and drop the canonical path for the input or pust the
> path in both objects.
>
> Anyway it is easily possible to drop the ClockPort common ancestor. A
> user never operates on it.

I think that would be preferable -- having the debug logging
drive the object hierarchy setup seems like the tail wagging
the dog to me.

thanks
-- PMM
