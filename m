Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp5168374wrt;
        Tue, 5 Feb 2019 12:14:39 -0800 (PST)
X-Google-Smtp-Source: AHgI3IbQ6f95YTXpUiiQv+r6fHFCSrzydf3EJ4QT5Bvy11JuG/BE5B0PF2gnm0ywRB9bbQ//Bhi3
X-Received: by 2002:a81:1b55:: with SMTP id b82mr5732670ywb.113.1549397679257;
        Tue, 05 Feb 2019 12:14:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1549397679; cv=none;
        d=google.com; s=arc-20160816;
        b=s5430eB0ciPuSjvk4h4/+teeT+FrOdPhi8vOom43RqY7MWs52nkQ3g/f1sGDRASvSw
         kHSQeOrJcyfvYS4Wu7Q5eMG0rHJHfLshQ66kjOY+YHyIG68Pz3dZFZddQHBIl3A6RP6x
         jgu4s7oZJ8cf43dp7UnpdZ2q7x/e3Jf1Ag9oxdpir3rQy0LuMMSK9hnAGnXX52tv0Vnn
         OjzHjZn3zRAXtaDo4E6nQKkGyUJyFGivH3bwoCEFny9wgkgFjlDnIFWccJHOUiK0nB1Y
         o7O+PgZpNPp2vQgoLCdx9KI4C0mbYv1AWwDrpsvQke0XAGotxULBGnXiMpPrYh79ZJQ3
         wmRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RycCCECxpZFnKO9gB/2L8V5jXuYw+86l2d67mjCdyLU=;
        b=B4Hlarkhc82nzNRz0aPS0g3AmkageZMnuGs0LzvPuDjyQ5jLNkiaNeImm4cQhCYRZk
         8amYnNtCKHyZcROMON5JWn+QXqYu4CfZbsm5CIrBQIrz0BaAcv6LzpOZluZTMg0ppJjK
         nh+xoTI/iKswsig6eBLjbp5SJip14osCGYLKFw1u9d98KF2czk1tpg7/ZMDCJWtzlFYK
         hqpE1o7LlJb4mAL/u/+p+9aoVAZjx9ZWoxZHEWwvo6OUBo4RxQQiV7uE/1rDgb7oZ0Nl
         zOELEyDDQiOwZezoMGApKGn15QqdRxKyA9t0IXyhOGSCeqh5Bvy4djH1aSwqcyBbQ9ga
         faOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vneFwZwg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r130si2518417ywb.399.2019.02.05.12.14.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 05 Feb 2019 12:14:39 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=vneFwZwg;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:39883 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gr778-0007AE-D6
	for alex.bennee@linaro.org; Tue, 05 Feb 2019 15:14:38 -0500
Received: from eggs.gnu.org ([209.51.188.92]:37452)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gr6c4-0006Am-MP
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 14:42:33 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gr6c3-00074N-Go
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 14:42:32 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:41422)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gr6c3-00073N-7T
	for qemu-devel@nongnu.org; Tue, 05 Feb 2019 14:42:31 -0500
Received: by mail-ot1-x342.google.com with SMTP id u16so7805692otk.8
	for <qemu-devel@nongnu.org>; Tue, 05 Feb 2019 11:42:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=RycCCECxpZFnKO9gB/2L8V5jXuYw+86l2d67mjCdyLU=;
	b=vneFwZwggIAK+YP2kGC7tzDCtzp9Cl5HHlfbqiBGGt6DPuh/8Zpurd8R1Wx+pvLvSx
	u2QjTJ/wlLfMeasDwG76id4iqfv/jglUPWl2xtr0BhdinjZkIiv6yW7Y5+GFL6yIo/vZ
	vpR81tqSRNTTFAmeYyeG2Cr5SjuQ97SEd7sSmeeSnjaIO9nC/uuMyraBtgesFJI5hZ1X
	lO/Xu55qdGJV+QPxP403h4kfabaDR7PFE7zffPqAF5/CeBSkasz3NXE8uRXwNgq9bWfA
	S5i7bk4Qg1WmVwVFDuEoFqOcpvOXiHEFVVde2rJsJoGbzNmzuSva+lvabkmYaD0TWKfP
	QC3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=RycCCECxpZFnKO9gB/2L8V5jXuYw+86l2d67mjCdyLU=;
	b=ihIkdUv26mtwwM04wnC5VeWHF9ptgDYKLQzm7sfnPITv0PdBXgYq+p5QA2xTqYTDLY
	Nd1HRBN97gvZ+mhJSWiAPr6yfskpDBfcceN1C/smZOqFjd6RYVLZOkIi1dNmqfhHPw/2
	bMoMrbmh0MVBaE72D2T31hLsOgzEOMpes1YPla5x9Evf0xXuK+rMLSIe/12aEidldhKJ
	Ypf4I8x3QLMO6647rq1PrcV5DGUIt0BRhnsMYwUpqt/WnzY/bF0ESYfWefFCibW3feNK
	xUQyP+qr1Bwrgv6aDfKJvUm2wIkmFTdgNdRq9X62mfVXt4ZbdPyKg7ekh+qNuxr+u9vJ
	TIjQ==
X-Gm-Message-State: AHQUAubrkDA2IFFXyvPGYcystHtG9BgMbzVgp4+anfDsE9y+ea5cUNwl
	AcFTOhzC0jSuj2SvXJVvWu135SeFDKejpEtKPMllxw==
X-Received: by 2002:aca:2dc9:: with SMTP id t192mr3527842oit.325.1549395750022;
	Tue, 05 Feb 2019 11:42:30 -0800 (PST)
MIME-Version: 1.0
References: <20190114011122.5995-1-richard.henderson@linaro.org>
In-Reply-To: <20190114011122.5995-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 5 Feb 2019 19:42:18 +0000
Message-ID: <CAFEAcA8XTc5RTxifOA-cYb2FfRaC5ZMBh3AEcxL8LZqh7qxo7Q@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-devel] [PATCH 00/17] target/arm: Implement ARMv8.5-MemTag
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
Cc: Mark Rutland <mark.rutland@arm.com>, szabolcs.nagy@arm.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will.deacon@arm.com>, QEMU Developers <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>,
	Ramana Radhakrishnan <ramana.radhakrishnan@arm.com>,
	Dave P Martin <dave.martin@arm.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Xw5W7RthZrqV

On Mon, 14 Jan 2019 at 01:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Based-on: 20190110124951.15473-1-richard.henderson@linaro.org
> aka the TBID patch set, which itself is based on the BTI patch set.
>
> The full tree is available at
>
>   https://github.org/rth7680/qemu.git tgt-arm-mte
>
> This extension isl also spelled MTE in the ARM.
>
> This patch set only attempts to implement linux-user emulation.
> For system emulation, I still miss the new cache flushing insns (easy)
> and the out-of-band physical memory for the allocation tags (harder).
>
> From a few mis-steps in writing the test cases for the extension,
> I might suggest that some future kernel's userland ABI for this have
> TCR.TCMA0 = 1, so that legacy code that is *not* MTE aware can use
> a frame pointer without accidentally tripping left over stack tags.
> (As seen in patch 5, SP+OFF is unchecked per the ISA but FP+OFF is not.)
>
> OTOH, depending on the application, that does make it easier for an
> attack vector to clean the tag off the top of a pointer to bypass
> store checking.  So, tricky.

I'm working through review of this, but feel free to rebase on
current master (which has now got a pile of your other patches
in it, since I've just merged target-arm.next) without waiting
for me to finish going through it.

thanks
-- PMM
