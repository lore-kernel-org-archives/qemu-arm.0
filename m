Received: by 10.223.197.9 with SMTP id q9csp2730539wrf;
        Mon, 9 Oct 2017 11:27:44 -0700 (PDT)
X-Received: by 10.200.43.78 with SMTP id 14mr2480351qtv.72.1507573664496;
        Mon, 09 Oct 2017 11:27:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1507573664; cv=none;
        d=google.com; s=arc-20160816;
        b=wF+/4zTMTHx00bq/fxjnha1WnOdzobBbNNnacPegRXRXj3GBbeRRKcAvYa3/MZCVPS
         9QCBWgVEy/YHkFJ77KO3mm8pkHqVlRVTeEaLkDbAAdz/VFvrJ386jPOZOz6M3r6UEG0Y
         WasZrvkkyydTfexhPB0laCDc9RpnFeyvQgpJP226xhnZWmpW6FlUomnhmAlWEXI/32BA
         rF/Wlb4adrK2L470OabQosNOlyDKLn9WJWMeyH1BORmcV+PhX9njI9Uu6hxioC57VTxn
         2fmcfo7OhYrAiaDJ5eW9eiaq0FUoRDld9Rw75J9Pb5LSK7PVaNM4UKmRHUzAO4mR0pfp
         FVkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=U8u10sKExVXv8kxzADeWS3IfqiR/C2sWqQUG8wzSMFA=;
        b=SlY5lwE/4ayNqr9LcUDWx5PxtLwTYjfeff0iNUfWCe1CTOQyUF7DwCCHuoKwzBiaOu
         jtymzrJPCWgaTbpCrq1YR/pY+0vcfd8B+ne95/69zZsFTU0XfdojcNCEVoJDi/rP+JBX
         I4LNN4UIpJW8Ptg8EhP8V8zVtGfm/3DuTUyq5bGY20Cyg6RLKDrPxvjdLgc2IEvWn4PJ
         +PUTZe+zkE/tEG8kUI93ROVODEdSzj+npUA1coFNd1JMqL9IXcp/DXymZUAUMjEUdHjH
         FV/raXsf0Aj+aPtjeg2krUf2uwCOZG+C1NJWWxNnvN4AUsRZF1yI399U4OrRNOCQ15A2
         BVAQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j2VEbY8W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 34si70877qkt.409.2017.10.09.11.27.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 09 Oct 2017 11:27:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=j2VEbY8W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59246 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e1cmE-0001Ur-98
	for alex.bennee@linaro.org; Mon, 09 Oct 2017 14:27:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39486)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1cm3-0001Ts-TG
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 14:27:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e1cm3-0002Cx-45
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 14:27:31 -0400
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:56434)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e1cm2-0002CO-T8
	for qemu-arm@nongnu.org; Mon, 09 Oct 2017 14:27:31 -0400
Received: by mail-wm0-x233.google.com with SMTP id l68so25846271wmd.5
	for <qemu-arm@nongnu.org>; Mon, 09 Oct 2017 11:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=U8u10sKExVXv8kxzADeWS3IfqiR/C2sWqQUG8wzSMFA=;
	b=j2VEbY8W1hfvPJ1JoTeaZJN+inWZPZRiXShla0hVyVplaePnznBf+/u0lgsoyqMO5e
	ox3WydagOpnOGIlw5iyUhn8CkeX/8aGjC0ZtWOwVnODml6eQE+z1b8N0qVMBLLlo5dw3
	yzVkO7GK2ZKtW5ff54mLXubvidrcofc1TLL8A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=U8u10sKExVXv8kxzADeWS3IfqiR/C2sWqQUG8wzSMFA=;
	b=phtXpY25lqWeiVDOKVY28TXab2mV0MzIaPV4Z0Fw99dCy24WSQ93gxcE6KuVKlJI/J
	hvxDq4tilkmdrqM2v6xoHE+HrnqFkRUp3E8PgF0DiFIViyDxP+N0Vuln097EgvR5PQyZ
	Of4ngJzlUTHf3nCV0MRp0yVva+DTREqdGVWoiSp6FvuNIjn2DEcJTNFShbwnYy0wXemj
	9gJ8Jp8VZaCyaUd3kgXQmfj5xYWDM1M9xXJons8/PsL83F1avSbUYGsCHFGs4S/+ZNJ+
	UMzo8UuRT8SVlj8gck+j3l8Dz8cJXW/vb25ybMcFiHnBeIGBceWQQax5826cjLdiP1rB
	eTeg==
X-Gm-Message-State: AMCzsaWHfjkyM2eJNLLc+zxcuFCcVFqvWlCRwBYQeEmkjcAC3EiEhuU2
	Ey79anHb9VBpferKnJCjj9GI/22LpY1z+I/sFkVmhw==
X-Google-Smtp-Source: AOwi7QArrcU0usQCgWUjPYnmaJORdcyxG9/Q/TQEVi9Etq9WETvw5VO2m+ha0VXY9T0QApDgNg0Ath9RyW2zHdjGnMY=
X-Received: by 10.223.147.166 with SMTP id 35mr11792806wrp.90.1507573649560;
	Mon, 09 Oct 2017 11:27:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.128.207 with HTTP; Mon, 9 Oct 2017 11:27:09 -0700 (PDT)
In-Reply-To: <20171009144641.GA3676@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
	<20171009144641.GA3676@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 9 Oct 2017 19:27:09 +0100
Message-ID: <CAFEAcA9xYJVy2mSo=CmmHDTfELLaEpzbDx=SubsmJQQY9fwxeg@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-arm] [PATCH v2 00/13] More fully implement ARM PMUv3
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: KAsSAx3ax9Np

On 9 October 2017 at 15:46, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> Unfortunately I'm not sure who to add other than the current recipients,
> but I'm eager for feedback and would love to work this into something
> that will allow for using the full ARM PMU.

Hi -- I do have this on my review queue, but unfortunately it's
sitting behind some other fairly chunky hard-to-review patchsets.

As a first quick "is this going in the right direction" review based
pretty much only on the cover letter:

What extra events do you want to try to support in the emulated PMU?
Part of the reason we only support the cycle counter is because
 (1) a lot of the events in a real PMU would be hard to support
 (2) it's not clear to me that exposing events to the guest would be
     very useful to it anyway -- performance profiling of guest code
     running under emulation is fraught with difficulty

Giving more of an idea of what your use case is would help in
evaluating these patches.

Some of what you're doing looks like it's fixing bugs in our current
implementation, which is definitely fine in principle.

I haven't looked at the icount related stuff (and I can never remember
how it works either) but fiddling with can_do_io does sound like it's not
the right approach...

thanks
-- PMM
