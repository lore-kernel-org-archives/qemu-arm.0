Received: by 10.25.0.147 with SMTP id 141csp11012lfa;
        Mon, 20 Feb 2017 05:52:47 -0800 (PST)
X-Received: by 10.237.37.165 with SMTP id x34mr8339676qtc.0.1487598767562;
        Mon, 20 Feb 2017 05:52:47 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id k2si6001606qtg.29.2017.02.20.05.52.47
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Feb 2017 05:52:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38670 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cfoOV-0002gu-3R
	for alex.bennee@linaro.org; Mon, 20 Feb 2017 08:52:47 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42378)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cfoNz-0002gY-1m
	for qemu-devel@nongnu.org; Mon, 20 Feb 2017 08:52:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cfoNx-00085b-Pn
	for qemu-devel@nongnu.org; Mon, 20 Feb 2017 08:52:15 -0500
Received: from mail-wm0-x22f.google.com ([2a00:1450:400c:c09::22f]:33206)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cfoNx-00085K-JJ
	for qemu-devel@nongnu.org; Mon, 20 Feb 2017 08:52:13 -0500
Received: by mail-wm0-x22f.google.com with SMTP id t18so22594645wmt.0
	for <qemu-devel@nongnu.org>; Mon, 20 Feb 2017 05:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=N9wkn/fP5c1jp1dmSWg7oUmN2nfJ2AAiGPkdfoMKK3I=;
	b=Sb196YKIqMU02BkDXqgL853Z6uSi9Lw9kznToFxMw0OKAO6mt9WGIVJnYzjZJmdNKp
	QBzhaB1tb65XP9nGljAw94X4KrLpRyTGDkQXyiIBPBP+wGm8wqXlfH5AJbKK6GYEUQMl
	d1xC/4aXqRqplqwYbe5VXvBcqxbccgbDJKP8M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=N9wkn/fP5c1jp1dmSWg7oUmN2nfJ2AAiGPkdfoMKK3I=;
	b=LJb3r5wfGvI5Oqe/bi6Wdon2WNigWL3iu9NOKGBdDUKMF57r/5uUY+IWU3AEoKgiau
	IQcBawWdCG5OnXBE2riBK8XXStS0rXtSp6xoDFeDHT0VNFq5u5HOuKGrvPGXQH4bpXQ1
	ePSasRLOrXHJ/NGXSNDv2lsLgIeJGb/O4cNukR75kuucw+2moGFiR6qFRaVfI1aYv59h
	utymP0lRT10lVjfxLcyekOIIgQ6FEHf1E5DTJQ0qg1oguTIAXszoqWWYNzBEJ/dwsluL
	edK8Pa2LINeuUW/7OFKNfbTZL17666//GnExKuH2YgQHckajqaIUxr+/Bw5MUT9569h4
	Sfog==
X-Gm-Message-State: AMke39nHc2qJrM/KtPKhnBSPyyEQqmXcIFlBZAEr9ejK1hRSR+oyhYNRNjoiM13TWeqkgi0Me6ZYqxpy8S3eB32e
X-Received: by 10.28.55.199 with SMTP id e190mr18251813wma.92.1487598732402;
	Mon, 20 Feb 2017 05:52:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Mon, 20 Feb 2017 05:51:51 -0800 (PST)
In-Reply-To: <1486997062-23227-2-git-send-email-clg@kaod.org>
References: <1486997062-23227-1-git-send-email-clg@kaod.org>
	<1486997062-23227-2-git-send-email-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2017 13:51:51 +0000
Message-ID: <CAFEAcA-q-VSup75PO-To9N11+0WCm=LNiFQ-SQXaTQMroyHFbw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22f
Subject: Re: [Qemu-devel] [PATCH 1/2] aspeed/smc: add a 'sdram_base' property
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
Cc: Paolo Bonzini <pbonzini@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OOGOKp8qVNem

On 13 February 2017 at 14:44, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
> The setting of the DRAM address of the DMA transaction depends on the
> DRAM base address of the SoC. Let's add a property to give this
> information to the SMC controller model.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>
> Reviewed-by: Joel Stanley <joel@jms.id.au>
> Reviewed-by: Andrew Jeffery <andrew@aj.id.au>
> --

This seems a bit weird -- what does it actually do in hardware?
(Does it really have the ability to dma anywhere in the
address space and just use an odd base address, or is it
DMA'ing to a more restricted address space?)

thanks
-- PMM
