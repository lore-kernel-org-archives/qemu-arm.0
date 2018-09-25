Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp574532wrt;
        Tue, 25 Sep 2018 04:52:52 -0700 (PDT)
X-Google-Smtp-Source: ACcGV63lY0tYHvuunaOxr0pqWA2W+asdyXZH02PBE4khwvQj5yfPHfyc2/uapjyVmgTYAplmVven
X-Received: by 2002:ad4:4188:: with SMTP id e8-v6mr410888qvp.125.1537876371924;
        Tue, 25 Sep 2018 04:52:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1537876371; cv=none;
        d=google.com; s=arc-20160816;
        b=pXB+rjdtghvMNjYGJjI/BqMueiKnLkIMrgDjV3HAyvH1GaCzxmG7PyLhg4bhORUH3X
         ZtT6OPVUJJiMDkQO3hLUh/KhiXZ47XvwCKDJZ3ksdPtYaMPNBBLG452g9nke5hCukjgj
         dRE/L2CQ8wWJWdMjcId44lkSPPtyBO/8kACUwCpKt7TEvP8B0Vzalduo7jwh82hdcQuw
         YjBvJkyk6UH44fja8hmCiVwddOkKdubQXW5iA6F28kuhQ4USNayUAFVQKs4iBwPobKqZ
         2kng+lgMeH+Ui5guxLpjpdxLYF0AIwJxGeAn8LH/YHo/SzJNd1w9XAcozCkChRF5/uxo
         OErg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=liVvgYYqSMlRh+32x1Qrz5rEj6K3TI9qwufVOEazQEQ=;
        b=LtsLOn++ZuvN0oHWI2GGW+ABUKgFg3hvMcDmRmbAPkf/KVgT1+BpffdKLSteC77NB5
         NZ3XwSswDKA+0oHjy27QXiYOz3m83I9Hq4WhGWmjCuMIDHDcBIMccxt5wn97mIPhFcBt
         UMb1+FDJc+iRKQbA94qn2xEpr8nzZYFEj2pR0/u6y5adzeOYmt4tWW381+qsPX0vscwP
         2XYS095+F6qmmGPpgGE/CIBFI+fS/KwlNui/wlno4LzZEUp55QOfZOWatTQ8YBvL0yGg
         wjtfpZHauoCFzYgRgTCHS9bJLPjm8b3JuOqQvJ259KOC2/nnz5iisWshKrxR7Hgt1W76
         c5Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sdwn8VSO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id h16-v6si1775146qvm.145.2018.09.25.04.52.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 25 Sep 2018 04:52:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Sdwn8VSO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52415 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g4ltb-0005dt-Eq
	for alex.bennee@linaro.org; Tue, 25 Sep 2018 07:52:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:34896)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4ltN-0005ct-4X
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 07:52:37 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g4ltL-0000Mq-FF
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 07:52:37 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:36806)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g4ltI-0000KD-B3
	for qemu-arm@nongnu.org; Tue, 25 Sep 2018 07:52:33 -0400
Received: by mail-ot1-x343.google.com with SMTP id c18-v6so6726926otm.3
	for <qemu-arm@nongnu.org>; Tue, 25 Sep 2018 04:52:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=liVvgYYqSMlRh+32x1Qrz5rEj6K3TI9qwufVOEazQEQ=;
	b=Sdwn8VSO/hZq6M93kNVcvmtdSh3qi+U0cRXioI9w/YdKk1lJCOf9KNMXwIHbN3w5xK
	G0h+lJcyqMdTzzZ/+oWl7ssDV60xzJyt4qtcK3mvFZzwu924IqYVuqgDcxpTOimLCixR
	zCI4aeKPbv6bO47swPNGsR62MXrajR2bP0uPY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=liVvgYYqSMlRh+32x1Qrz5rEj6K3TI9qwufVOEazQEQ=;
	b=BPgMaEg1Ip9xkGR2EPCvMpFoIqRhf2NLPRM3o2K3C0RXyDBxIKl+D9Rni5GQm07Nap
	3mZFb3oGapIdU7URW7xXngdu6bgPqfdXXKZSUG4FMXMa6GyBgCEqDVxyB2faBjYuhVpO
	L6PtBvYH/+zrPL7EN+OiCqc226PxS648var2q4M4BqlSq31TGOS6TpwuHWOXFizVSnA0
	hNswR4fN2sy6ghUsbZQ5bCny7ewqp5JZiJDIknJDgaOnEiiqPYZ4fHHCQQWmlE15aC6k
	T465FZTEZnkuG0FdV/aGttJojeEQk3mHcESMD6YWoxWqFvAoDbt6LQIGC7/BlwlPO1el
	J5Lg==
X-Gm-Message-State: ABuFfoj+Q20OiY0f17/nJR4vGwGnQ9bUozyqo6ZYjsNifmFYTAJ+PoeI
	GQufwyZWv2An1ZUExuilLumqxoDS+yWZgYxYy/5N6g==
X-Received: by 2002:a9d:51cc:: with SMTP id
	d12-v6mr413525oth.377.1537876351297; 
	Tue, 25 Sep 2018 04:52:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP; Tue, 25 Sep 2018 04:52:10
	-0700 (PDT)
In-Reply-To: <19d468c3-0f28-c178-1f5e-ac547bee02bf@greensocs.com>
References: <20180917084016.12750-1-damien.hedde@greensocs.com>
	<20180917084016.12750-6-damien.hedde@greensocs.com>
	<CAFEAcA95f0VNWSJf9GFXn791sp3Z5QmYEycm7VUsuwVhSMFPMg@mail.gmail.com>
	<19d468c3-0f28-c178-1f5e-ac547bee02bf@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Sep 2018 12:52:10 +0100
Message-ID: <CAFEAcA8Edqkb81dc8Asiyvsm0a=xNSvfMuvsxw5PgQGBtOstLA@mail.gmail.com>
To: Damien Hedde <damien.hedde@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v4 05/10] docs/clocks: add
 device's clock documentation
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
Cc: Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Alistair Francis <alistair@alistair23.me>,
	Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, qemu-arm <qemu-arm@nongnu.org>,
	Paolo Bonzini <pbonzini@redhat.com>, Luc Michel <luc.michel@greensocs.com>,
	=?UTF-8?B?S09OUkFEIEZyw6lkw6lyaWM=?= <fred.konrad@greensocs.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ZgnOX1r84LzR

On 25 September 2018 at 12:47, Damien Hedde <damien.hedde@greensocs.com> wrote:
>
>
> On 9/25/18 11:36 AM, Peter Maydell wrote:
>> On 17 September 2018 at 09:40,  <damien.hedde@greensocs.com> wrote:
>>> +Outputs must be initialized in the device_reset method to ensure every connected
>>> +inputs is updated at machine startup.
>>
>> device_reset should not set outputs.
>
> How do the initialization then ?
> Only alternative I see is to initialize a clock input when it is
> connected to an output.
>
> If device_reset does not set outputs (which are a direct consequence of
> a internal device state being reset). It means calling device_reset at
> any other point than simulation startup will break things. Is that the
> semantic behind device_reset ?

device_reset's semantics are not great, but basically they are
"power on reset", equivalent to a complete simulation restart.
If a device has some other kind of warm reset triggered by
eg a register write it needs to implement that itself, perhaps
sharing code with the device reset method. A warm reset triggered
by a register write can obviously assert output signals.

I have some thoughts about trying to clean up our reset
semantics which I need to write up later this week.

thanks
-- PMM
