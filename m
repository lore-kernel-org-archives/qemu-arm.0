Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp5704926wrt;
        Tue, 16 Oct 2018 03:53:45 -0700 (PDT)
X-Google-Smtp-Source: ACcGV61i/BsPXrtydtAPIubKaDvd1GWzeYbok9PaxxvVKMi+HAAKRPO2QLiOBYsBw6BO+tyGJEfa
X-Received: by 2002:a37:17e5:: with SMTP id 98-v6mr19438755qkx.42.1539687225842;
        Tue, 16 Oct 2018 03:53:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539687225; cv=none;
        d=google.com; s=arc-20160816;
        b=Vf46uovXLnDg2VMJB0ZJu7qHBzpou9GJFPKpvqBR/2Tlm80bfFg3WcBvFQoBGGRRNs
         o+eIdHqvv5KvId5HoNU8mT/NWWUVDhdNSgIhzGuyoeX2ddw4FdX3YNiKiYwUAgW+KIkQ
         5yBjTxDhYVJUHFHQVgJhtLSXHpNnEZkzHoDQikiZuXh0/wgBrL3oob74kfk6J9LHZCc/
         Ejfn+t8vmXZQiYWctMVWT9kTnIWsAlgmEKblMXcxdZS/Kvqs3j9igIWqK5NOdi1nUDFu
         9AsefcilD4TrC+IOGmP6LiUkkJz+WwXiX3CxKyUsbN0ely/WN7sSZj/5la7W5t0oOxFN
         ZImw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=WKBf2aUD65LGTeUFZOkhOOkFUr6/gaU5DVJqILD1nDE=;
        b=CC7ccWTin5MkIvJ3m8AWCCZT0wsCrP8BMtUvcmmsL/3kuCrBeQ8fSqWV0FkAYSO9st
         ggPdBcqtpAjCdJxrf8rajLjXpnMG2BtiVENZUdoPjjfq9r5H+k2JRuIn6AhMGK3fbken
         gr/l9xWGRkP6JTiyWOx0N4T+6p0Y152Fcw8i2pu66u0ct7gLJUsQetG3Tdxy1e+MHGdp
         W9xl/OA5PahGK1NslTX/i6uLWECAl/OEWGr72irU6vi3ayL5FKljtUC5Oc7ovr4OCRsP
         r6LCkSKY5whTQVSmWWn+tIvjHDhCj4BmVrDslj8dgCQGeqiBXoZGIObWXkTZJz5SyyTk
         4Mcw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JmxGxQSy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c3-v6si2334135qta.188.2018.10.16.03.53.45
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 16 Oct 2018 03:53:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JmxGxQSy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57196 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gCMyv-0003xY-BT
	for alex.bennee@linaro.org; Tue, 16 Oct 2018 06:53:45 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60075)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gCMyj-0003vw-HU
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 06:53:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gCMyi-0006G7-Bw
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 06:53:33 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:33078)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gCMyi-00066a-18
	for qemu-arm@nongnu.org; Tue, 16 Oct 2018 06:53:32 -0400
Received: by mail-ot1-x342.google.com with SMTP id q50so22064770otd.0
	for <qemu-arm@nongnu.org>; Tue, 16 Oct 2018 03:53:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=WKBf2aUD65LGTeUFZOkhOOkFUr6/gaU5DVJqILD1nDE=;
	b=JmxGxQSyBXh1SPJYVW/hS3rBLFvH52npron9ET5WkLg/ggMmdjGiqyJ6xqX3jzvTe+
	p4DfqMNJJ74hwZwvUl+3ZKWK3NjsvfXo0WU9EFkqMpIIeE5lQkzRx2odd0zFa8OcypOr
	UfU6FP+mriLKEoYUs7IVLProWpyri7jBdNjVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=WKBf2aUD65LGTeUFZOkhOOkFUr6/gaU5DVJqILD1nDE=;
	b=Gy3NJ4u4h+kXR6oKhGSjlf6uF3jeTfb7jT78vI0ExpWl4RQ/BTTMclbtpR86bEq9fx
	tsbcKHnoFYzrleLkSsQ91lx/fCPTwUf1zSFhypiWhIUWSNJjmht7VoLgFlYlSlWygfuO
	tyi6vibghqEHaC1N3DwStm5msUa6NCWtzOxrS2Wl+XRSvhjbqfpK+CV/4ZcylHJVR/2o
	r6Bcmzv5VsBSW3S7EwEwpiLjLd5IQxCqf9brge9pSJUywomt+MSYjG0W3J4eGCmF7+pQ
	MFc1dzWf9NaKxH2B6NX/IIm9ZPyD9zKweQzrGQRqRvmLcG2MHbGJt77hlKMc01GwZhKB
	g2Cg==
X-Gm-Message-State: ABuFfohqYsgETKBCK01XxQ5j0Ul30FJQZiogEK3sRNyEswa4+6ZmhWpO
	rsachoZmy2b+T+XD3PxDszdnSIoAFi9WDB5DPd9y1w==
X-Received: by 2002:a9d:2377:: with SMTP id k52mr13789484otd.238.1539687208224;
	Tue, 16 Oct 2018 03:53:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Tue, 16 Oct 2018 03:53:07
	-0700 (PDT)
In-Reply-To: <20181011021931.4249-1-edgar.iglesias@gmail.com>
References: <20181011021931.4249-1-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 16 Oct 2018 11:53:07 +0100
Message-ID: <CAFEAcA8AEakm=zU9OYmreRmA=_J5aBR-E_nHDLh+fVRpHCZQNQ@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v2 00/12] arm: Add first models of Xilinx
 Versal SoC
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ErqXyJR960Nu

On 11 October 2018 at 03:19, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> This patch series adds initial support for Xilinx's Versal SoC.
> Xilinx is introducing Versal, an adaptive compute acceleration platform
> (ACAP), built on 7nm FinFET process technology. Versal ACAPs combine Scalar
> Processing Engines, Adaptable Hardware Engines, and Intelligent Engines with
> leading-edge memory and interfacing technologies to deliver powerful
> heterogeneous acceleration for any application. The Versal AI Core series has
> five devices, offering 128 to 400 AI Engines. The series includes dual-core Arm
> Cortex-A72 application processors, dual-core Arm Cortex-R5 real-time
> processors, 256KB of on-chip memory with ECC, more than 1,900 DSP engines
> optimized for high-precision floating point with low latency.
>
> More info can be found here:
> https://www.xilinx.com/news/press/2018/xilinx-unveils-versal-the-first-in-a-new-category-of-platforms-delivering-rapid-innovation-with-software-programmability-and-scalable-ai-inference.html

> Edgar E. Iglesias (12):
>   net: cadence_gem: Disable TSU feature bit
>   net: cadence_gem: Announce availability of priority queues
>   net: cadence_gem: Use uint32_t for 32bit descriptor words
>   net: cadence_gem: Add macro with max number of descriptor words
>   net: cadence_gem: Add support for extended descriptors
>   net: cadence_gem: Add support for selecting the DMA MemoryRegion
>   net: cadence_gem: Implement support for 64bit descriptor addresses
>   net: cadence_gem: Announce 64bit addressing support
>   target-arm: powerctl: Enable HVC when starting CPUs to EL2
>   target/arm: Add the Cortex-A72
>   hw/arm: versal: Add a model of Xilinx Versal SoC
>   hw/arm: versal: Add a virtual Xilinx Versal board

Hi; this series is still on my to-review queue, but to start with
I'm going to apply patches 1-10 (the cadence_gem fixes and the
target/arm changes) to target-arm.next.

thanks
-- PMM
