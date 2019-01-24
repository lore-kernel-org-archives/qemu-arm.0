Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1978220wrt;
        Thu, 24 Jan 2019 06:16:58 -0800 (PST)
X-Google-Smtp-Source: ALg8bN5Zv89Rcr4SATIoGmvOw4D9hyPY20dDpwwacjlh/BMksWFAQZYod1gtFFPs3OTKMPlbRHN1
X-Received: by 2002:adf:82a4:: with SMTP id 33mr6971409wrc.252.1548339418648;
        Thu, 24 Jan 2019 06:16:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1548339418; cv=none;
        d=google.com; s=arc-20160816;
        b=nws4EprfaAKXPaU22BbeIX7O12W1ocgSI5mOLMnmyiRLQrsz2ExJxgL+P8+H3lCim/
         /2FZbgllx79rlg1wsMJiAcyyFe9t/snmQV522OUjmhWmFOIqs1hH+eMZp8oBInEoPWH+
         Hkd2HunwfpB4QcI51YvnRi2JENB2faibTAk4YaxB5RsQbdNI/d/fZ+sHK/zW3dGFFbo3
         l2GNS4eu/wDzAK9rtTmy28Fy5rSj+82blSK1c+5l9tm0XpEvGwxrRGCy8100LIq7R5b1
         oZ7SXV5g/XsDIh0wuXoq224SwIaXnfk/L8uuDOdvBqqFEEXsfv5nX14jx1HZgF5/2xBD
         Y+JQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vzDcnFzNo/i9ad2c0jfuNJ7PKa4EHXBhz4151eB1sGU=;
        b=T2byJlMt9fO8n7UlLQuvToMPnNzAWzcRn3unGdvTv60+cqePwlmUV6nVrb4bsHwuwE
         5Gc1tjWVt2BM3c5EKr2sLJyZFAxqBV6yLk+CKqZNf0XOluMh+aOuzudtcsr26aJ5+FIY
         ReaZ5rZuXjY5weydluoyQL12P/rKpzVaPXgYM8WHMFKZOxjm/aqtltiOVLeoeVTsXTnz
         dTZRcUtB4ofaZwmQaMaktMkTMY2NtlBBU9gS/o3OzN3YzdZT6e+7/i+4lX7Wi8d8QXRV
         EedPxXze7wtwb7206CK/j+kQN9kCOlOS5Dj4X1sz/QVeVECu8LbSzGfpBDHjxe6+Iimm
         wYLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XXSsA6Jj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j5si73066617wrs.105.2019.01.24.06.16.58
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 24 Jan 2019 06:16:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=XXSsA6Jj;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:54669 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gmfoP-0006lr-Ma
	for alex.bennee@linaro.org; Thu, 24 Jan 2019 09:16:57 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40337)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gmfkw-0004XY-0j
	for qemu-devel@nongnu.org; Thu, 24 Jan 2019 09:13:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gmfkv-0006vp-BO
	for qemu-devel@nongnu.org; Thu, 24 Jan 2019 09:13:22 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:44911)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gmfkp-0006Uh-SQ
	for qemu-devel@nongnu.org; Thu, 24 Jan 2019 09:13:17 -0500
Received: by mail-ot1-x341.google.com with SMTP id g16so1320875otg.11
	for <qemu-devel@nongnu.org>; Thu, 24 Jan 2019 06:12:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vzDcnFzNo/i9ad2c0jfuNJ7PKa4EHXBhz4151eB1sGU=;
	b=XXSsA6Jj3k9Yhqx/YmRzNr937cbMzyj4zdX9fgjrqgzZSuN1qFq7kA0WV81S41+z+k
	Ih3m7w7HpikkCpj5Oy8WF2pYm26fpC4pFyL4GE+/uRRH2eKvfe7TS+O+/6gcbTRRzfzQ
	nQEi3r15jFWbqhGFF/M/f+8RTE7+LesFPiYzA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vzDcnFzNo/i9ad2c0jfuNJ7PKa4EHXBhz4151eB1sGU=;
	b=aFWGRwdX6iQPCASSnokcpnPVGYRR49qkKDjZA2P6yP+w3/T667uo1DrtdH6ukqjSZ/
	P6B5dL2kTus7nOSzwpr2PZ54BTuBW/Cc+gCqXLyryNk0j3jtv7qEkia7E3r+sCz8mqMl
	Qy9G4hKWzn3N67DRfdfM3C1uTajXCWwngtYICx91J1PIJWdxch+XmolgNzEkpiO9aMPW
	VP3NaUz7EN4mcVM1gxlv2OMlR2G2Oqww2Bh1c45agYndsNsd/mH5GLWlX27/6Z9SUcoe
	BV4CUNzGijf2BlqMgY1X3baMK5XMByurN7ErvKTyjX6tKuhD6OgiHbqyoF0sk/+VG2wb
	wWKg==
X-Gm-Message-State: AJcUukfi9P88PGPYYBufJ2DAjm6CMbwZbKEIPj+P+NBEwwB6+MwmAke9
	bdqVygq0yYem4dukn97pY3UMSoqJXDhZ+xR6+fUocA==
X-Received: by 2002:a9d:7855:: with SMTP id c21mr4178555otm.363.1548339172821; 
	Thu, 24 Jan 2019 06:12:52 -0800 (PST)
MIME-Version: 1.0
References: <20190121184314.14311-1-peter.maydell@linaro.org>
In-Reply-To: <20190121184314.14311-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Jan 2019 14:12:41 +0000
Message-ID: <CAFEAcA9sL7BakhTBPj-TC2iQyZQVhHNvZFxz4Xx8f094tU3tJw@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-devel] [PATCH] xlnx-zynqmp: Don't create rpu-cluster if
 there are no RPUs
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
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Luc Michel <luc.michel@greensocs.com>,
	"patches@linaro.org" <patches@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r7D3HUYwvet4

On Mon, 21 Jan 2019 at 18:43, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> If we aren't going to create any RPUs, then don't create the
> rpu-cluster unit. This allows us to add an assertion to the
> cluster object that it contains at least one CPU, which helps
> to avoid bugs in creating clusters and putting CPUs in them.
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> This is a preparatory patch that is necessary for the series
> "[PATCH v3 0/4] tcg: support heterogenous CPU clusters"
> (20190121152218.9592-1-peter.maydell@linaro.org)
> in order to avoid the xlnx-zcu102 board asserting if started with
> fewer than 5 CPUs.
>
>  hw/arm/xlnx-zynqmp.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/hw/arm/xlnx-zynqmp.c b/hw/arm/xlnx-zynqmp.c
> index 370b0e44a38..16cba433cb7 100644
> --- a/hw/arm/xlnx-zynqmp.c
> +++ b/hw/arm/xlnx-zynqmp.c
> @@ -178,6 +178,11 @@ static void xlnx_zynqmp_create_rpu(XlnxZynqMPState *s, const char *boot_cpu,
>      int i;
>      int num_rpus = MIN(smp_cpus - XLNX_ZYNQMP_NUM_APU_CPUS, XLNX_ZYNQMP_NUM_RPU_CPUS);
>
> +    if (num_rpus == 0) {
> +        /* Don't create rpu-cluster object if there's nothing to put in it */
> +        return;
> +    }

Applied to target-arm.next with a fixup to test for "<= 0".

thanks
-- PMM
