Received: by 10.28.4.212 with SMTP id 203csp603092wme;
        Fri, 20 Apr 2018 03:41:43 -0700 (PDT)
X-Google-Smtp-Source: AIpwx4+egStKHyf4BstIL44IpN0RRxGeHrpnTj5Di1sJUfDhrk1tfGrQ9bq8dU2ZZZlAd4YCZ+V+
X-Received: by 10.55.41.149 with SMTP id p21mr10263641qkp.397.1524220902966;
        Fri, 20 Apr 2018 03:41:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1524220902; cv=none;
        d=google.com; s=arc-20160816;
        b=msPElOMUp6UbvKFiZRVOmw7Yv0hB+f49PUiB9IrHkHBp/d7W6j4GHgoQutjPcHet8l
         q2KT5jdgOGjwth4bQvzt1DWyiYXk+AQ+yJpsSoxf04EykeySuRodEJwB3PB15BPvUMbD
         dfwvixykEkWP0rjRegUxvuUK4ranUOFLQD7uCaPG5SmqpPwNngJpqv967Lw+bTbAfdVM
         pY+0GeltYRu29Tehc1Q3bUFebiWqVk1lCT09MLAW9XDjn6idDoLHpNHsBVge/SmLuUV3
         R1sUEaeLigCMD0KEgyvIUeSmjjt6onPWKmjFjrzog8L+VBcKal0WXTYwzNxTEHUnQ4Lu
         MyMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Krr7K82K9sHRohpIhxcSVhF7wvAn58wWV4LnEKlIGmg=;
        b=IqrsxlUz72pPy89wwCsgasOks+x4iwD+EDdsbes+0hlzzGcd4xoKb3EW+pkf/4Gw6i
         2B4wxPXKGlSUnYiT5p4IB+mMtQR4h6/Q4UkGfNcjvauO6L1FQezgcWPrl2dHI0hTlSqH
         p7/sbmQ3yOukQ7g4gezK39XnijhrUoI3KI+NeYt1Mbb61IZw6AEABDn86vUpVmEoficO
         XSXoIKVBsYlIvrKg0yeP5BJfaosika7gTFlhkgznVhZH1MpROKSnnXdSLQ3a13+RehLG
         pxu112tNNjYRJGU5sXhh03f/1Uo5RPcmAE8nwZ8ETmF6JNEJx5wYq/OaLoSi/HT4uAN8
         qS2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h5oZ3TXH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u72si7030530qku.141.2018.04.20.03.41.42
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 20 Apr 2018 03:41:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h5oZ3TXH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46280 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1f9TU6-0007ui-HT
	for alex.bennee@linaro.org; Fri, 20 Apr 2018 06:41:42 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:56082)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f9TTr-0007u7-W9
	for qemu-arm@nongnu.org; Fri, 20 Apr 2018 06:41:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1f9TTr-00084d-4j
	for qemu-arm@nongnu.org; Fri, 20 Apr 2018 06:41:28 -0400
Received: from mail-ot0-x232.google.com ([2607:f8b0:4003:c0f::232]:33886)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1f9TTq-00083s-VS
	for qemu-arm@nongnu.org; Fri, 20 Apr 2018 06:41:27 -0400
Received: by mail-ot0-x232.google.com with SMTP id i5-v6so9126061oth.1
	for <qemu-arm@nongnu.org>; Fri, 20 Apr 2018 03:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Krr7K82K9sHRohpIhxcSVhF7wvAn58wWV4LnEKlIGmg=;
	b=h5oZ3TXHihACVzChSHbjRxnsYHs0psBJlQ2XxoEaMMSW0M/EGZYfJypdYPjn84Eji9
	MFiZzUluqRnJDfjHpfR0kLgHjUGh45PNmQSg427CGmutaXt/P4cozk0usIhqrA9/mrXZ
	EERi61XW0QKJRkXHM0QvA9iyRb+VoTPuaCWxk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Krr7K82K9sHRohpIhxcSVhF7wvAn58wWV4LnEKlIGmg=;
	b=lZwssseX3Obx1nN9xrsoT94nyvLdfMlf4cKzrglpMNDtpBPhgcm0eO3N3e4IaC33SE
	L1xthAOxQEKGuR3HVTLA5QeDGKwbXa5ZfH6ReFjFq7xE3Nv6ts0A1PXI2b6Ep2ulwp7P
	0PTZ/xHT0lk8O1TlGXdQkc35DtVYqoPcjSNNLh7AsUgP2rclHE/hxRly4Oai4bOXuqap
	O6WnPXey9X6OcEbNPt6q/20qEFiqZzUPOfx4GN4WH1yrfQcxhYmzabu0qT4OcmBelPKC
	lQw0H9iIAuNlew5adCZ5sj16LUsAf1Ko3PerJg4oA1kM3m4OoBp5EUcRXo80viADr9iz
	36hg==
X-Gm-Message-State: ALQs6tDbrT0K/UBXvwSyyFQUIlAhlev2QakAUPQpfDSgRW1pMoXXYbD9
	DK/A3GPZlvFqZds1vifjpXp0KgKHsumDaLNHFqBhJg==
X-Received: by 2002:a9d:429c:: with SMTP id
	r28-v6mr3840748ote.126.1524220886294; 
	Fri, 20 Apr 2018 03:41:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:40fb:0:0:0:0:0 with HTTP; Fri, 20 Apr 2018 03:41:05
	-0700 (PDT)
In-Reply-To: <1523997485-1905-4-git-send-email-alindsay@codeaurora.org>
References: <1523997485-1905-1-git-send-email-alindsay@codeaurora.org>
	<1523997485-1905-4-git-send-email-alindsay@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 20 Apr 2018 11:41:05 +0100
Message-ID: <CAFEAcA-zeQ8T7_ngYm_q+MBJKk6ueMtg5ekLTBJS94tzqTyGkw@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::232
Subject: Re: [Qemu-arm] [PATCH v4 03/21] target/arm: Reorganize PMCCNTR
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
Cc: Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AKSHTgSbXez0

On 17 April 2018 at 21:37, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> pmccntr_read and pmccntr_write contained duplicate code that was already
> being handled by pmccntr_sync. Consolidate the duplicated code into two
> functions: pmccntr_op_start and pmccntr_op_finish. Add a companion to
> c15_ccnt in CPUARMState so that we can simultaneously save both the
> architectural register value and the last underlying cycle count - this
> ensure time isn't lost and will also allow us to access the 'old'
> architectural register value in order to detect overflows in later
> patches.

Can we handle the overflow case by setting up a timer that will
expire when the counter would overflow? We'll want that anyway
to be able to signal an interrupt on overflows. That would avoid
the need to have an extra field in the CPU state structure, I think.
Since PMCCNTR_EL0 is 64 bits it's not going to overflow very often
so the slight overhead of a timer firing is not going to be a
problem...

thanks
-- PMM
