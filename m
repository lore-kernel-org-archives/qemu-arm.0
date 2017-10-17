Received: by 10.223.197.9 with SMTP id q9csp4692824wrf;
        Tue, 17 Oct 2017 08:01:49 -0700 (PDT)
X-Received: by 10.176.86.70 with SMTP id z6mr11050858uaa.103.1508252509557;
        Tue, 17 Oct 2017 08:01:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1508252509; cv=none;
        d=google.com; s=arc-20160816;
        b=tHsd2EMm/lhJRLcfUD1qByTJb+gF+n2EvoNMPWH/8cCvhw+sQUBHcYzn5L71iKMgqU
         opGdyWqkDFnyIVJ3F+0GU5if8aP35QEABP3YHe6PhgbluPddYLkbfBVMInqB4GNMDUGC
         0FvvPYYkmvo5wOUs21bgfvbjnmjcAafn440uhY8gDIHxx+XaqkOQg6uuIWAjdXlWvFLs
         i12DmZGkSl0ulp5aFPO9Dyxj2m/7p/22pZlGH2MynRcj1qAWfVmm4FdiOQ+QElvvNWeN
         4UOtsu0YY+EKUC1MEZdYLPvUIGESB7T4VeSNa0voBiFZWPdJSynJ7Ju9NuScf0ff9RSk
         0isQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=YU59wc8X2R9zGSeviVnOkb7jrI5Hf7UMc0rsau96c4E=;
        b=FkLFFEaT7YmfZVcgnClfCV8mhVhz7FMihB321oVsfDMAntTgyOKgGgCwHMXgyfQSxj
         W9XtHsWNj0WhsolWWikyL100DQlbqJkP9w9zKyKPzfunSqmVs0X0mkFuGsy5j3LDQgdl
         fRaZ7IJ1AcNxMIhBu8VpSwZfaofpoHwHCxUUbH4EKqsw/jVNThoscQjEVGU+nc7OKL6T
         nnlGDhzrs4BPvD9b31nLHwxS9kss1ZYKuwbEiXtTPRGN7Jt5OSliYcEQnm4iSQnwAR5S
         Y3c1EzCQ0gWDw534pOsXBwEWLpx+8LzNW7DO1+SAW6gWBtH2qx8nG3NKgFnFWgC66eBx
         19xA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KCaUFqxo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j33si2528499uad.353.2017.10.17.08.01.49
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 17 Oct 2017 08:01:49 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=KCaUFqxo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39971 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1e4TNK-0005O7-Pc
	for alex.bennee@linaro.org; Tue, 17 Oct 2017 11:01:46 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:45021)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4TMi-0004uC-Vr
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 11:01:09 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1e4TMZ-0001TU-Of
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 11:01:09 -0400
Received: from mail-wm0-x233.google.com ([2a00:1450:400c:c09::233]:51288)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1e4TMZ-0001T8-I3
	for qemu-arm@nongnu.org; Tue, 17 Oct 2017 11:00:59 -0400
Received: by mail-wm0-x233.google.com with SMTP id f4so4580607wme.0
	for <qemu-arm@nongnu.org>; Tue, 17 Oct 2017 08:00:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YU59wc8X2R9zGSeviVnOkb7jrI5Hf7UMc0rsau96c4E=;
	b=KCaUFqxoDC3EIGhd65V2THBGF/g0xDsm+A9mccimB7xxT4ho5vIVlryshmw4dWJkOR
	pAe4SpH22ye3RXpV+9oArTHgVZtbai//LkE0oOfEQy1oGJ7FeQcJi9e8TOEGlE+SGgQQ
	vAnvyCHGDXP1DdJonNCsDqKpjke7tUOmjTrv8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YU59wc8X2R9zGSeviVnOkb7jrI5Hf7UMc0rsau96c4E=;
	b=gpyVtblwL7bPXllpHqM8QXyKilmYcAgcm05eqlgesAoz1UVu0TJ6xvU/MeBu1BZdeZ
	GIFbyQTCoW1e3ILO62Co1dko/nA3uNf7ovnJAmVyPz3629RdPdef17QretsXLrmkXgQr
	vafX6t2gBo3jRx2Kmitfp9Thhah35vd+tf6DUl1nrTJbRtBSm6MlUta9mmswrFN88588
	I+J13QiCHH9tr2p4rAOIgxdnpw3xfz5QwK2cCUH15x/lkJbd2qbHQK7ksDt8pZLA98g+
	iwnjTlmEHDsO8NAplAko2Spzwqsf9BlvhdcBRLtH1QPx1eJnefHBKUz65qtg0ZgfoH0E
	LEbg==
X-Gm-Message-State: AMCzsaXyXXLiPXJDRF9hMQbPbeJhfY5uYwgZUnOsBTjGvGJ47OSGbbdZ
	Yv9653E+3K9S9Nc+00EuTcLVFJc9aPracZiZIfL47g==
X-Google-Smtp-Source: ABhQp+TDfYO+hHwuIGdGY765JFr5V7LghFefZKL44w6+S8nhRgzlVxmSwzVJHTe3kdWACeaoiq76DZgfF8XeC2N9i/M=
X-Received: by 10.28.236.203 with SMTP id h72mr4158818wmi.147.1508252458429;
	Tue, 17 Oct 2017 08:00:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.139.195 with HTTP; Tue, 17 Oct 2017 08:00:37 -0700 (PDT)
In-Reply-To: <20171017145940.GD3676@codeaurora.org>
References: <1506737310-21880-1-git-send-email-alindsay@codeaurora.org>
	<1506737310-21880-3-git-send-email-alindsay@codeaurora.org>
	<CAFEAcA_zwAu4Zt0-2Qy9euBzYQgD19EnnoWwa+ZNzidWwkmEcA@mail.gmail.com>
	<20171017145940.GD3676@codeaurora.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Oct 2017 16:00:37 +0100
Message-ID: <CAFEAcA8U72AL=7mMduf2Bqvh9Tq1TnE_GCkrD7R1F5B-R73j=w@mail.gmail.com>
To: Aaron Lindsay <alindsay@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::233
Subject: Re: [Qemu-arm] [PATCH 02/13] target/arm: Check PMCNTEN for whether
 PMCCNTR is enabled
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
Cc: Peter Crosthwaite <peter.crosthwaite@xilinx.com>,
	Michael Spradling <mspradli@codeaurora.org>,
	Digant Desai <digantd@codeaurora.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: emrDBE2dL/PI

On 17 October 2017 at 15:59, Aaron Lindsay <alindsay@codeaurora.org> wrote:
> On Oct 17 13:49, Peter Maydell wrote:
>> I keep replying to your v1 patchset by mistake -- can you use
>> the git format-patch options to put make the subject prefix
>> be "[PATCH v3]" for the next round in all the patchmails to
>> help keep the versions distinct, please?
>
> Yes, and I apologize for the nuisance. Also, thanks - I didn't know
> about the `-v, --reroll-count` option and must have gotten distracted
> between updating the subject to be 'v2' for the cover letter and the patches.

There's also --subject-prefix if you need more flexibility than -v.

thanks
-- PMM
