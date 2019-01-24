Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1948212wrt;
        Thu, 24 Jan 2019 05:50:20 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5nE2aMhrEasA6247GQ1dBYZAHt8/IvsNpD3gjlxpU/2LW8CDwTseBuoKgGDXzjrJ9CWNgo
X-Received: by 2002:adf:ec50:: with SMTP id w16mr7517835wrn.171.1548337820565;
        Thu, 24 Jan 2019 05:50:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548337820; cv=none;
        d=google.com; s=arc-20160816;
        b=w/Xee4bUwOAuz7ew4jYXUIYg3aakRHyinoNKks1B/fbVfkGfUe/yectIolywumbAaZ
         otJo2oKO9igsyt7kJ2NngDDHnEQ/WPPWbURnWXB1JBJwtanUgTDf0cRkJ+7BbYAsTMOj
         +Pb+glYJAzjyQkNJANNwxzVxbPkfw+boEPslsBVKZLbjxQ4loaUecJcZxlQS38jiGqq/
         JABrTpcrc6iyPpGqiggZbGxyzpfT/r7KicJ1qOiN9QdF6JUwol7qm+epmk/qhsEitrFd
         EgRb/ZchoQij+FXX9xFZWZuu1WaTfbaF/j+e3I2lt31PMGwM0ABO/WQA6XyPt/WEiy7R
         hc+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wQin6yKzkVL174Y6dgvRq/9ziNFpK3fsJcCYnbEs6x4=;
        b=sZ9hYnGr4vI3Vm2Iov217EjVQm/7Xq/l2oyBul74uTrSA/J7aEhRE1yw6uQtuTYkbX
         6c4x8wB+V5Z1i6jK/r9WYyllF8BnnHyddJa3DCXMABTyHQRlcu/LhTjK91GKoaMwdrTg
         FKRLk5h9VTYRKQWwMEfhFTf4MpzrwosfBeeRiPURIy/dKI6ZSHFaLtijbtpiI7p2/4ZE
         /ZYTK6WzPyZ15MvOLHhjY+FxPy/yiVPEwSK0iOjLWsL7H0crGHrNVK2h2UqyED7wSJXJ
         54yspE/FJiJfsWmzzVwZmxQKzk6FhDvbBpa7mNSaohtoOjo+rRtA8+psZGr68vRgLuDh
         VZLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HWFfrsg8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f196si41151932wme.198.2019.01.24.05.50.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 05:50:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=HWFfrsg8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54198 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmfOd-0004l7-KO
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 08:50:19 -0500
Received: from eggs.gnu.org ([209.51.188.92]:58427)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gmfFl-0005hm-UW
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 08:41:11 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gmf1Q-0003QN-Mb
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 08:26:22 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:39321)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gmf1P-0003P4-58
	for qemu-arm@nongnu.org; Thu, 24 Jan 2019 08:26:19 -0500
Received: by mail-ot1-x342.google.com with SMTP id n8so5195576otl.6
	for <qemu-arm@nongnu.org>; Thu, 24 Jan 2019 05:26:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=wQin6yKzkVL174Y6dgvRq/9ziNFpK3fsJcCYnbEs6x4=;
	b=HWFfrsg8JOoT9C+ULO3Ch8bCrf4H9YlQOo2t8SM1XDDdbYWDl/Ahcu8Z65ir50dz31
	qTH92qg1k9H1vHuQ391CR48CN1JFMD5jiK2L3jcqBSEctpL9uqadUu74vaHplOg767K1
	pSCBJla3rLd8AZo4ZT3u/dKHMDHIAESCST1N4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=wQin6yKzkVL174Y6dgvRq/9ziNFpK3fsJcCYnbEs6x4=;
	b=sLoG6p+mvYJJCOtUMiQ+hXmWZjlAYrDzsGFQkRy+mvA9aoMXNjIWV3Llt5PBivB0EZ
	JBbt7E4fwq3nAVm5v/OVsPCAIyEk97YEyqauIsmum01+ikG8dfNFNaV+TReWw2j3F+u3
	hRmXHRC4trnJgcwnmp3COqJpsnGqTvY0C102r5QbeZQyQMC9gludvzKimn64G6ZvUm6q
	HPxf11WIUjDKeC/20MiIaGiY6VU50sS+po1DHz5YmlBTu3vR3IsHK1g6sxtUZIwXVZ7w
	MGzCDsa4z8ln1iowKpVo9GHjq5Yst4FNpVRCNMxLo+ZUD2+1m2D3saJ0IspLOw56ofRq
	ALsw==
X-Gm-Message-State: AJcUukdoiIugmgYHuM05GXGlqQHx+vnybmpB+CmNm253QgHTSn5Oezmp
	/WAp61KNmol+vorxBjeYWpzjNgqzHFbW6vxNiHoQZN+dqdc=
X-Received: by 2002:a9d:5617:: with SMTP id e23mr4036699oti.151.1548336378333; 
	Thu, 24 Jan 2019 05:26:18 -0800 (PST)
MIME-Version: 1.0
References: <20190123195814.29253-1-aaron@os.amperecomputing.com>
In-Reply-To: <20190123195814.29253-1-aaron@os.amperecomputing.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Jan 2019 13:26:06 +0000
Message-ID: <CAFEAcA8F+YdjAMSEFTzmkfNi9dg1nYZXUpi_fKtxUHcaN48+Dw@mail.gmail.com>
To: Aaron Lindsay OS <aaron@os.amperecomputing.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH] target/arm: Don't clear supported PMU events
 when initializing PMCEID1
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
X-TUID: Nw007Jxx9bjv

On Wed, 23 Jan 2019 at 19:59, Aaron Lindsay OS
<aaron@os.amperecomputing.com> wrote:
>
> A bug was introduced during a respin of:
>
>         commit 57a4a11b2b281bb548b419ca81bfafb214e4c77a
>         target/arm: Add array for supported PMU events, generate PMCEID[01]_EL0
>
> This patch introduced two calls to get_pmceid() during CPU
> initialization - one each for PMCEID0 and PMCEID1. In addition to
> building the register values, get_pmceid() clears an internal array
> mapping event numbers to their implementations (supported_event_map)
> before rebuilding it. This is an optimization since much of the logic is
> shared. However, since it was called twice, the contents of
> supported_event_map reflect only the events in PMCEID1 (the second call
> to get_pmceid()).
>
> Fix this bug by moving the initialization of PMCEID0 and PMCEID1 back
> into a single function call, and name it more appropriately since it is
> doing more than simply generating the contents of the PMCEID[01]
> registers.
>
> Signed-off-by: Aaron Lindsay <aaron@os.amperecomputing.com>



Applied to target-arm.next, thanks.

-- PMM
