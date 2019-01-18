Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3084128wrt;
        Fri, 18 Jan 2019 06:14:29 -0800 (PST)
X-Google-Smtp-Source: ALg8bN6YcXJl/DLBH+e3VaotCD+gYoz7jxBNX3es/ungpB9CzMEpNkM9XkMJskfWiTDlBwyX7FFx
X-Received: by 2002:adf:e383:: with SMTP id e3mr16515827wrm.31.1547820869413;
        Fri, 18 Jan 2019 06:14:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547820869; cv=none;
        d=google.com; s=arc-20160816;
        b=Wstc6wrSjr5eFfdFmcnAhVp8Kjh1i3MqcrPHf0hquhurtABZwiNvntwMwz0yt7wQGl
         cFVqHYVA5RsQIMsk7mRKYXwwY4C4HV+Ro/jDBY7UDQ3UwZJQJsD1KCIXxxcV5uyHKdA/
         LkyVZui2Oi5r/uRKMzQw3b5Iy3tVKS9bMrItw5oLgJ61itBpJJYVR1QEBfitaQTDwUID
         RRx0Q65em8qwJoVENUNas1Sf73MxvkbABzc0oDnr6kmmJMEvvib0J0bxa5QOT8uzAhF9
         hfnPYUTn3Es97O6XLgYeyYafpVFfFVxixG76C11FflvRUFezuwcOamWf4ceA1vtJ+3Gc
         5CWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EauYYOja5CW2JuYaTKBLwiDFcpWnSSFeWOdH4MgqOAY=;
        b=jU75ArKUh3oEbWnYGwuqnMH7SyLRLTJNBfVkDde4ZVt8Owq8DQOx64c6sLx0fyVZKa
         yXEmFk9H+ED6dGKEL0e5VnoVxMvo2SZW4Dctpxe8DbPTvl+eumVcU3urnilX/J7CutXG
         Q0kEGgqB/K+mi6k+vV5nyAhyegIQnHTzf3lmPD+Wb8cspSrWupznYeSCccNRf7GStXCn
         tmJyQMim1Wty9ciu5+fXRluStMKDoQ3LC5NPPmCeissXF/ROvu65Cosz03DdEyQMWbyk
         IozIH4adwQEmWuQ4VwjbZSY1GJocq+FlimZMufQoj12AtKWZrfFtPFXurt8Ctmy+zffP
         hFKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ovkil1rX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16si57807813wrt.269.2019.01.18.06.14.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 Jan 2019 06:14:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Ovkil1rX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:40174 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gkUui-0004Cp-Bp
	for alex.bennee@linaro.org; Fri, 18 Jan 2019 09:14:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:59702)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gkUuS-0004AL-FU
	for qemu-arm@nongnu.org; Fri, 18 Jan 2019 09:14:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gkUuQ-0003Op-Ko
	for qemu-arm@nongnu.org; Fri, 18 Jan 2019 09:14:12 -0500
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:43428)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gkUuQ-0003NF-DF
	for qemu-arm@nongnu.org; Fri, 18 Jan 2019 09:14:10 -0500
Received: by mail-oi1-x242.google.com with SMTP id u18so9018075oie.10
	for <qemu-arm@nongnu.org>; Fri, 18 Jan 2019 06:14:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=EauYYOja5CW2JuYaTKBLwiDFcpWnSSFeWOdH4MgqOAY=;
	b=Ovkil1rXQW+kO6vyzSC2xVag+jPiFcHCAMUXGs4amOAD4yjGsmoOhPBL3U4LPk7sz2
	1IKYrDoDXSsXCZ36N+JuXIYzT9rHg6t2I5sBnBcxok3rZfQYrKBRF6yCg7rgoF9lgqDV
	4ar+HLX88W1TX+XEbpuOB34+6VyPkD/v/q/go=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=EauYYOja5CW2JuYaTKBLwiDFcpWnSSFeWOdH4MgqOAY=;
	b=Mag71g8ivLmRDA3pZRnyDGou6WURgPizq3fxlf+fbXyfX0T+K0vSOer1cMfJ/FiJfG
	kxzNEdya0qD2e+FueDK+3qDvUjgXmcGPaQIB7aIUvaVPxeQK/qplflg3L+JL97pGqEHI
	BBrY+pu80BpsAODUifGHdha1JTj579v7P/ckQZHN99QjtErwYisDvxbZSK/yZsGtuwyg
	48qBaqDPcnzNayvjxvpeJgSBF5fT8qzxpuvhXgqYnOofBJXrd1129tPPipDpslEcKY20
	mC+WbqBMYHbYvComM5uDb5jDYILKONrS1eolNbnOHQqsMcXCnjcbqdvNPSJJhZKUvfxv
	1VGA==
X-Gm-Message-State: AJcUukfHrMKC0V/mv+Wosy67TXCDQ0Xj6owqZNxPNvYgn1DUI1JFi3EM
	REkV+8B6tVLoMsJT0JlzbJSbfg83TjLRwwLY+g1+gw==
X-Received: by 2002:aca:2dc9:: with SMTP id t192mr193559oit.325.1547820848966; 
	Fri, 18 Jan 2019 06:14:08 -0800 (PST)
MIME-Version: 1.0
References: <20181211151945.29137-1-aaron@os.amperecomputing.com>
In-Reply-To: <20181211151945.29137-1-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Jan 2019 14:13:58 +0000
Message-ID: <CAFEAcA8Kvx9ATDgj5mOqcJGQf_T-Sw0ut5N6w3CBs9pBA4d1_A@mail.gmail.com>
To: Aaron Lindsay <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v10 00/14] More fully implement ARM PMUv3
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
	Richard Henderson <richard.henderson@linaro.org>,
	"qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	"qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: P+QaMCTyRDdM

On Tue, 11 Dec 2018 at 15:20, Aaron Lindsay
<aaron@os.amperecomputing.com> wrote:
>
> The ARM PMU implementation currently contains a basic cycle counter, but
> it is often useful to gather counts of other events, filter them based
> on execution mode, and/or be notified on counter overflow. These patches
> flesh out the implementations of various PMU registers including
> PM[X]EVCNTR and PM[X]EVTYPER, add a struct definition to represent
> arbitrary counter types, implement mode filtering, send interrupts on
> counter overflow, and add instruction, cycle, and software increment
> events.
>
> Since v9 [1] I have made the following changes:
> * Added a clarifying comment about how the PMU timer's migration is
>   handled
> * Added a check against implementing PMCEID[23] if ID_DFR0.PerfMon ==
>   0xf
> * Added TRACEFILT to the ID_DFR0 field definitions
>
> [1] - https://lists.gnu.org/archive/html/qemu-devel/2018-12/msg00805.html
>

Richard has made some comments on patch 14; since 1-13 have
all been reviewed now I'm going to apply those to target-arm.next.

thanks
-- PMM
