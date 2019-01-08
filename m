Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp4502172wrt;
        Tue, 8 Jan 2019 03:56:18 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4bt+v3F2Pt+NspaV0+T8iDMP+AmyhTiOJfJ83itfch53Q73hInmo0foP1J+JtNODVE+SPC
X-Received: by 2002:adf:ae1a:: with SMTP id x26mr1191918wrc.0.1546948578824;
        Tue, 08 Jan 2019 03:56:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1546948578; cv=none;
        d=google.com; s=arc-20160816;
        b=WoIDkr8gJZ3WR/+W+ml8CElNbPprIiNhY/m/fd4T6p+4MnIUM77Xvad5sSA75KdM91
         D6nFDqdB1MI8G/X9p3c8QGwbcYWRQlfFeAvIhORwV2bfTDk6p1LZIrQmqOk8wbLvQ3V/
         E4CEV/LZNCkmULTgy3uAHbvmFBlrZ8KVHPLF+b8Ne4BZoxtweolrGTyWt/NQ4rJn+9wO
         JLreprrnReJnW4bnaCiCt2MwywWCHLZ7Gpf14w8p9l4XmJIIaaZLhz+Zyxg052DeMUIu
         P1N01c939vhhn1DI1h/jdHYi84vobfDCswHHwAxPObLMyotEiBbatagA3PpyyQJCWC8/
         aKog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kBIwDk4Ur1Ksd5McXJbd5pvwNOKTg7ZPuyOp8sUUuTc=;
        b=ovZZiGYcG6WhcODGjKtDvPkurHjs6fG211h/ddzw0ySt2uCOBs1Fw8JswT8Je1isnI
         n2bOZYO/kS16XMwt2+YVjaDpwUHBD9navjLDshDSoOuT59+JhLzAojXsegn4lM9GL/er
         Pu08h+fKnUMRPbeefQ5pkN+Zs2dFyvEwFr4xZSGidzD0etTNiv+qUozGMDVSeOP+OFAv
         rF5UM/PTNMdIa+jC27CcJW9koBkJ5sQhM2aXJTYFQ3s3esQKJ/NC3l3mFdqJKR3E0B8i
         nfEQPlqfMNYWz8mbaPNqARxwf7rpgQC4mqeXFVkAEW6bN3sRknKKEzrtec1hUHdnt4B3
         8MfQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="LfXn6/q3";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e6si38756341wrq.242.2019.01.08.03.56.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 08 Jan 2019 03:56:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="LfXn6/q3";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:49617 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ggpzU-00053W-Rf
	for alex.bennee@linaro.org; Tue, 08 Jan 2019 06:56:16 -0500
Received: from eggs.gnu.org ([209.51.188.92]:40821)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ggpy3-0004D9-PF
	for qemu-devel@nongnu.org; Tue, 08 Jan 2019 06:54:49 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ggpy3-00020D-0n
	for qemu-devel@nongnu.org; Tue, 08 Jan 2019 06:54:47 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:44123)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ggpy2-0001vx-SQ
	for qemu-devel@nongnu.org; Tue, 08 Jan 2019 06:54:46 -0500
Received: by mail-ot1-x344.google.com with SMTP id f18so3208312otl.11
	for <qemu-devel@nongnu.org>; Tue, 08 Jan 2019 03:54:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=kBIwDk4Ur1Ksd5McXJbd5pvwNOKTg7ZPuyOp8sUUuTc=;
	b=LfXn6/q3oKd8XhsFkMCE4Aqfsm5FMSKWgjtyaV5zliiSqxknolz5bowdYl7YEfGO6K
	Ww6pdAhrSlI1kwfR4hRmL3GLVdsjex7bQ5I/wrEB8k4lgF0K5hsbo88fgb5vU55Qd8EZ
	NbaHBmJ++DXNfkA2nKqbkLPduYDsotTQWoviw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=kBIwDk4Ur1Ksd5McXJbd5pvwNOKTg7ZPuyOp8sUUuTc=;
	b=TdmAMvT4mk1rOS7lqd4ytsq/iy2aeBuDGaJYcdk6EMOVGFSTPayhwOf28v9njDGGDY
	qrUfSje15uSx1LCr70Vz3Chyt4/3mnmUP2mh0/In9YQWHEMoznl5l4RA8aF3ht9VeEdt
	9fiVIHDxX6A+zJz1+GYChMZXEtXj7GLbY1SNaFuhtx8pMjN60Nj+jPVbWwClvNSHgT6J
	HxmWQ5jmRM08X1o+YJIax7ag0L3TPhFH/BxMmaAj7h4WI6Hi8V3hoPz1+frilAXGda4a
	pYa1HHyrZxmj0U4H//7jxagcqZnKPnNeJkPmKxwOwSorvH+DbsufsmnZ5nrBfI/NHeQ5
	nf+g==
X-Gm-Message-State: AJcUukdNVqeCADZuNC6YN0Oiq+Lu4IqdAZC1725+4ICxD+lknkENkKbU
	+6Ta+j01CvBitPYD6aE0hSWa+e9NHp9ATm9vsxL32Q==
X-Received: by 2002:a05:6830:1115:: with SMTP id
	w21mr960435otq.316.1546948485210; 
	Tue, 08 Jan 2019 03:54:45 -0800 (PST)
MIME-Version: 1.0
References: <20190107101041.765-1-eric.auger@redhat.com>
In-Reply-To: <20190107101041.765-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 8 Jan 2019 11:54:34 +0000
Message-ID: <CAFEAcA88LBZWk5G+7M370w-u=SspHnM-nE=piHvCCs-M290tSg@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH v3] hw/arm/virt-acpi-build: Set COHACC
 override flag in IORT SMMUv3 node
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
Cc: Andrew Jones <drjones@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AGHoQ62DrhBc

On Mon, 7 Jan 2019 at 10:10, Eric Auger <eric.auger@redhat.com> wrote:
>
> Let's report IO-coherent access is supported for translation
> table walks, descriptor fetches and queues by setting the COHACC
> override flag. Without that, we observe wrong command opcodes.
> The DT description also advertises the dma coherency.
>
> Fixes a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT table")
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>
> Tested-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Reviewed-by: Andrew Jones <drjones@redhat.com>
>
> ---
> v2 -> v3:
> - added cpu_to_le32
> ---



Applied to target-arm.next, thanks.

-- PMM
