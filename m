Received: by 10.28.173.206 with SMTP id w197csp3756106wme;
        Tue, 9 Jan 2018 06:26:00 -0800 (PST)
X-Google-Smtp-Source: ACJfBotM+4ERNrQlZVrzCbWM/5TARE+YsJm1zkqkq48KRV7kjUuPQKkeTyEFEk0sXwumVs35/1kC
X-Received: by 10.37.223.149 with SMTP id w143mr239342ybg.68.1515507960893;
        Tue, 09 Jan 2018 06:26:00 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515507960; cv=none;
        d=google.com; s=arc-20160816;
        b=tfhclx9Wdgt3gRAFeK2FQxpMZ58VUARASuh9uhIb1X1aJmVzgSqgbwVVx/mTifbcnc
         cz0dwGTk7EQY9zHDxP5J8L7lwT54yCIRZWcbzh6aJiv33q4ahJPoUe3kdML/ZNcAo0vV
         LhFw3qVFvKf016htPukZpW4pDsxT8bs/ytFqGAgudrQ9Pv4zPys02GrxLx6AJk5JS7AC
         4pCkPwjKQWYVGLmQMccONPNpOK1sCD3AyXOO/kRT8tjFixNoNvsRiOTQp+yabAWW3Jbn
         PM2gSPMKirdVRBU2TxYNq6nYBSdu4b1CTedhJgTpaasN6bA2/IWRpuZyI2uyRwuN3gxK
         hB6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=qG2Z6qlyohB5JxW2eccv6AHB+GgLZmzEc0jzurHRXgs=;
        b=tMHozdJ9GX1SscXOUtdlFTSLManzhT575Q/aotvJ8JLHqeSDNEiYM6aFqJIUkcwX9W
         BGxybW3HbRUDArs2YtIpGYGgDPZhcvqLigUATXkfOGAxs8NUHzr6M6zDy64G3IQ3oqGp
         hUVzU0I4v/bH2zxnNFpSLnCB/7jq2RcqVUmCNqzA2H2hsLjHDOfvTymo1+u9WpyTMlz4
         fJcK4cLPVMrnA8PEXVZesFQRRWrFg3AmbCNZ3etIF+5MNV0RiWlFuf6000vPy6HB1zRa
         rBDO40zj9uFXYWmHn3/46XBcbPI8ZToHoEGgJxrbunSlVmuUteyfxW1g1m+ClU57hC+h
         WsOQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cY+LDdgY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d8si744955yba.382.2018.01.09.06.26.00
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 09 Jan 2018 06:26:00 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cY+LDdgY;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55373 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eYuqm-0002pz-EG
	for alex.bennee@linaro.org; Tue, 09 Jan 2018 09:26:00 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42414)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYupY-0001yX-LJ
	for qemu-devel@nongnu.org; Tue, 09 Jan 2018 09:24:45 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eYupX-0008Tx-IY
	for qemu-devel@nongnu.org; Tue, 09 Jan 2018 09:24:44 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:33639)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eYupX-0008Tm-DK
	for qemu-devel@nongnu.org; Tue, 09 Jan 2018 09:24:43 -0500
Received: by mail-ot0-x242.google.com with SMTP id x15so11456627ote.0
	for <qemu-devel@nongnu.org>; Tue, 09 Jan 2018 06:24:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=qG2Z6qlyohB5JxW2eccv6AHB+GgLZmzEc0jzurHRXgs=;
	b=cY+LDdgY5vdaOE8OZ+oZ62F4k5BM//QoFM3L/ciYW0c1pWy6WX24k8wfLvHyELB0TW
	96Iih6/UR/c17SXygu3CEQT5AhA9X2gQv6SQY84yuwCT8P2Uq9PGWjvqFQJ0sdnH1zkg
	e3787LOZGDCVUSBt37jZeV8mUhbvtvz97sL2o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=qG2Z6qlyohB5JxW2eccv6AHB+GgLZmzEc0jzurHRXgs=;
	b=jWuzH7TAyqLloBItTRI31/acD7uBfXZQpnD1lx4Ub4EVv3Z8Z7MZKl2AslZ8bciOUm
	tWExcC5EA48R4yLjYx1/F2oO3UrIYQBhc0OA0TgByFD+BAsHSBjAyf42CbK8xRCsNszO
	B/dJN4++1YIndrj4f23O3AtDAKtTEodZPNqDBdCqSVs3UtswZO4hbCK+aITVohP6ptgQ
	7t+SgCmG19X6FpeXOnQFaKj0aZ8EfikHdxNDmapK5wvieJhVtlDV4EKmK9QFprgMx1Zq
	/xZ4i9CPQg5flIvvQgFg9+l8B+3c7wOzPIyZkWDIa39RXYVf5LagQydNZvxMUdyRZuVN
	RiDA==
X-Gm-Message-State: AKwxyteNSlLE4gHDjaC7r+GYFhvSMd4FMgio4ZVevSOyA/k/E4RBJvPU
	ZCy259R0X3PiVukpoQAcqBY11J1HTQxTxysoz03NptG5
X-Received: by 10.157.29.73 with SMTP id m67mr9051497otm.91.1515507882830;
	Tue, 09 Jan 2018 06:24:42 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.15.71 with HTTP; Tue, 9 Jan 2018 06:24:22 -0800 (PST)
In-Reply-To: <1513183941-24300-1-git-send-email-peter.maydell@linaro.org>
References: <1513183941-24300-1-git-send-email-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jan 2018 14:24:22 +0000
Message-ID: <CAFEAcA8NbL7ROZs99hWhpAF2Rdi2qEiWLNo3hr_9W7gmgXyw4A@mail.gmail.com>
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH 0/2] GICv2 & GICv3: RAZ/WI
 reserved addresses rather than aborting
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
Cc: "patches@linaro.org" <patches@linaro.org>, Laszlo Ersek <lersek@redhat.com>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: sC+xv/o/8EBb

Ping for code review?

thanks
-- PMM

On 13 December 2017 at 16:52, Peter Maydell <peter.maydell@linaro.org> wrote:
> The GICv2 and GICv3 specifications say that reserved register
> addresses should RAZ/WI.  This means we need to return MEMTX_OK, not
> MEMTX_ERROR, because now that we support generating external aborts
> the latter will cause an abort on new board models.
>
> In particular, at least some versions of UEFI try to
> access a reserved address in the GICv3 redistributor
> (at SGI_base + 0x184) and fail to boot on the virt board
> without this.
>
> thanks
> -- PMM
>
> Peter Maydell (2):
>   hw/intc/arm_gicv3: Make reserved register addresses RAZ/WI
>   hw/intc/arm_gic: reserved register addresses are RAZ/WI
>
>  hw/intc/arm_gic.c              |  5 +++--
>  hw/intc/arm_gicv3_dist.c       | 13 +++++++++++++
>  hw/intc/arm_gicv3_its_common.c |  8 +++-----
>  hw/intc/arm_gicv3_redist.c     | 13 +++++++++++++
>  4 files changed, 32 insertions(+), 7 deletions(-)
