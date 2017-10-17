Received: by 10.223.197.9 with SMTP id q9csp4688660wrf;
        Tue, 17 Oct 2017 07:57:44 -0700 (PDT)
X-Received: by 10.55.119.70 with SMTP id s67mr17675870qkc.294.1508252264388;
        Tue, 17 Oct 2017 07:57:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508252264; cv=none;
        d=google.com; s=arc-20160816;
        b=wkQhFkxMOnFckHeVZ8CKKWRus0uOKHicoFIW5fhOXMqNqXjhKkM6e/o2l3V/tMykjI
         fHkI9nOT6ddL5H1zWveLB6ljtblNYAnZN1nLNa8VcX1nsY2IrRGFu+uBmsfa6cwpVnMB
         ZQwrhXraiR1yuCRhjKSCRpLLWdYWq8eCIN1FHxXOybX6Jq/MQAKtkYl5xbJB8rh9pcB+
         P/wn8aCq4IxJovLMB7fltE25nLSaM9CMZUyduZwt+85ACJOQVEQGyfE7ATMwruN7gzBC
         ZIRCztN9LjJHcfYC5x5GBU9ARZdinfc8J4iNBY2k094KpUIi/A7aEHn68xdOff33EE+D
         kdFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=OXWWae5uL6p7SaD4MK+MDBuN4Y68l2/L9YIMkpFXmN0=;
        b=rVzCy8sB0ZTnkUYvHY1NXbWzbKCgF2tlForQN3scTUjXjIPdlb6rPsVrlaR3mlNqgG
         VqXAp340kuGDjOqS/jdmyGDqM6/fI+cRTFolog9OksxSSsngISuneUnSMP7XPPlMopQa
         joD3PHLWxyaXAFdBnlRTF+7CzfCMRl9NHo2UUL5ZmtNttuktc4rlmnxTzSaPRpnCXA0K
         +vR9uhMGPscTvWeUutu4yg1Vi7aAVEB8dgcFCXstuYONnl4uWbfYNMdpaY4ND7kZlYJA
         ASTOdhjFg3FFUZqy2S1zDNB7osnJo0soQYdeFQ9BKOjtmgvCLERyrrUo1lqJdgGdsowH
         5oHw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QoHWe7mS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t56si3516130qte.286.2017.10.17.07.57.43
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 07:57:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=QoHWe7mS;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39944 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4TJO-00021S-7Z
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 10:57:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:43658)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4TJH-000217-Fd
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 10:57:36 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4TJG-0008M8-4r
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 10:57:35 -0400
Received: from mail-wr0-x22c.google.com ([2a00:1450:400c:c0c::22c]:50895)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e4TJF-0008LQ-VY
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 10:57:34 -0400
Received: by mail-wr0-x22c.google.com with SMTP id q42so2003878wrb.7
	for <qemu-arm@nongnu.org>; Tue, 17 Oct 2017 07:57:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=OXWWae5uL6p7SaD4MK+MDBuN4Y68l2/L9YIMkpFXmN0=;
	b=QoHWe7mSa/BZFf58G8Ywep//Ad/59fZjH3auSbZiTg01PaGIh6M2c2Bb46aOUZc3O9
	84xma4CZrQQTJqF4l2moPoUlXvg2dAQUwVpMT3xsMNtsFdVMd/2gw4z13Z04OfLLYnB9
	dBMSrfbbG+n0DnqmliUkeHhdBWC8dMFKWbR7Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=OXWWae5uL6p7SaD4MK+MDBuN4Y68l2/L9YIMkpFXmN0=;
	b=NRYRv3mJel/dfV6VCZ4VWecq40+tY6pin84HkkCFio+pj1FHz7bBFpUXtdtKdEIUEi
	ZCrMyXXukii7YCrFs3rnZAyYH7WtN9yJTu55guTRb6NGRv74Vwjn87hgVmBbAHPPHlF0
	wlnmBNEjnb9ISbJwq+dliq2bNPNl4CeVwh47A0WVZI0ahzh+HbX3j1wKoAicYAhn950Z
	KFEjSVM4ZvCFaccjoZoOxLwyMxjfyqdjEm8UsZ4zjuK/6/4BBMRfEGL8gbr0Pwzhcblj
	cMITKAK1X6gnSeNoU0bXmjM5ioGRyvC8FdMOPMCeO/xHoRoN9RLQSB1uv9tBraW5thBg
	l0PA==
X-Gm-Message-State: AMCzsaWuINIXkeWYGR2NXSHvnkdVHaiZzZm62UGeuDkYnPqE9ZgJlmVn
	vADPwXiQYMTGsscLvCKt+av9w4VxR4YZCnKqock9gg==
X-Google-Smtp-Source: ABhQp+TQ66Pje40X2x3pwOlJ42eLhGa6kdKlxeWXgmh9mD3/vjn0TPSEgM1ilONsffvsh1hhNx1qQtne7u6zeMl30bY=
X-Received: by 10.223.197.19 with SMTP id q19mr4309623wrf.272.1508252252429;
	Tue, 17 Oct 2017 07:57:32 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.195 with HTTP; Tue, 17 Oct 2017 07:57:11 -0700 (PDT)
In-Reply-To: <1506737310-21880-7-git-send-email-alindsay@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
	<1506737310-21880-7-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2017 15:57:11 +0100
Message-ID: <CAFEAcA8H-Zv0HRiMTSYFqkR0Wx7npB_N_ze9h0oovVa1tMHDRQ@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c0c::22c
Subject: Re: [Qemu-arm] [PATCH 06/13] target/arm: Filter cycle counter based
 on PMCCFILTR_EL0
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
X-TUID: BPAOyF+vLF/V

On 30 September 2017 at 03:08, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> The pmu_counter_filtered and pmu_sync functions are generic (as opposed
> to PMCCNTR-specific) to allow for the implementation of other events.
>
> RFC: I know that many of the locations of the calls to pmu_sync are
> problematic when icount is enabled because can_do_io will not be set.
> The documentation says that for deterministic execution, IO must only be
> performed by the last instruction of a thread block.

Yes. You need to arrange that gen_io_start() and gen_io_end()
are called around the generation of code for operations that might
do IO or care about the state of the clock, and that we end the TB
after gen_io_end().

> Because
> cpu_handle_interrupt() and cpu_handle_exception() are actually made
> outside of a thread block, is it safe to set can_do_io=1 for them to
> allow this to succeed? Is there a better mechanism for handling this?

From my reading of the code, can_do_io should already be 1
when these functions are called. It's only set to 0 just
before we call tcg_qemu_tb_exec() and then set back to 1
immediately after (see cpu_tb_exec()).

In general, the approach you have here looks like it's going to
be pretty invasive and also hard to keep working right. I think
we can come up with something a bit better.

Specifically, the filtering criteria effectively only change
when we change exception level, right? (since you can only
change security state as part of an exception level change).
We already have a mechanism for getting a callback when the EL
changes -- arm_register_el_change_hook(). (We would need to
upgrade it to support more than one hook function.)

You still need to get the io-count handling right, but there
are many fewer places that need to change (just the codegen
for calls to exception-return helpers, I think) and they already
end the TB, so you don't have the complexity of trying to end the
TB in places you didn't before, you just need the gen_io_start/end.

thanks
-- PMM
