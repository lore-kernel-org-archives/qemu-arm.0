Received: by 10.28.91.67 with SMTP id p64csp2450751wmb;
        Mon, 19 Mar 2018 03:46:35 -0700 (PDT)
X-Google-Smtp-Source: AG47ELv/Qa/8hffv3yvriNLGbXMnTd00JRMoomkzWeDdlUlCLsBnvEMAo46yF62+FTVaF5ib0xA5
X-Received: by 10.237.32.66 with SMTP id 60mr17468882qta.332.1521456395426;
        Mon, 19 Mar 2018 03:46:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1521456395; cv=none;
        d=google.com; s=arc-20160816;
        b=GNzQJgauKgbkaKhF36/RmtoeQp5Vil/hIcJIfN9IIXDsvwseO4+rh+bVMag2dQBp9P
         N4jyFXBRruZcdyJRj6JwirtHw7J3OhVw+D9mfY+dzys80YloN+89T5Wq1H6u8/KC92vm
         iYJF6BsCXrC9qJqMXdyZx2Yh9ViXCb+TZImdsuvWcuKilZ+r2IHQByrAA7vsiX10/Dyx
         m8Uz72JUFkyxdsaiKoKoqe+uIexTl0xbFfpNcHOIqNBHyEkN4iPKF/nGAZ214f4C2laJ
         iXcF6pZuAhyqqmusiXnaiccfgCUKlJL8QriFcjvjnH6wCVGTjbb2vecEpR52EvW6jNs5
         pRFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=Lw9tq4APZv36aCqCB/govz79l19aX8jFzclxL/FVZb4=;
        b=Jva12zwtZR4+xwu12Nh1Q4PvrAJ14t3uYpeWKbTFsiCvVswp37HSPuSavkvbrkKyMh
         T0fb5qaTcIOedjrgRAgHYOtCA5FbmEQTjLWv9+OQQ9KnAMvW4aFGMIcKfjksNFMLzHvc
         CirxP4GSY05wU0yiBFC1wptSl95sH9z3g+qPzmQ6WOHzNvzS7TYzsiV170MYd2NQl7gs
         UpHnelVsRV0ReavQP1KPEqdBSxl9kDZLYl6VRK+ugZxp8oGllK06ym3XNfgQZfJkY1Kx
         EjQnNFyEo/x3572U8y/y+X+GkCp6hV6hJaCElXGdYsdGLeAaClZot8/kQUyuVs6pPeYg
         4gxw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WbZmIR5h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v53si8993935qth.165.2018.03.19.03.46.35
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 19 Mar 2018 03:46:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=WbZmIR5h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41230 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1exsJG-0004la-Vh
	for alex.bennee@linaro.org; Mon, 19 Mar 2018 06:46:35 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51166)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1exsJ1-0004l7-MW
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 06:46:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1exsIz-000379-RJ
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 06:46:19 -0400
Received: from mail-oi0-x233.google.com ([2607:f8b0:4003:c06::233]:35378)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1exsIz-00036q-LN
	for qemu-arm@nongnu.org; Mon, 19 Mar 2018 06:46:17 -0400
Received: by mail-oi0-x233.google.com with SMTP id a189so6909544oii.2
	for <qemu-arm@nongnu.org>; Mon, 19 Mar 2018 03:46:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Lw9tq4APZv36aCqCB/govz79l19aX8jFzclxL/FVZb4=;
	b=WbZmIR5hmV4HxWlfAial+Qb7OwM3W52M4ZGos6NgM6XGoZZWdgkUIb4Qte5gwGxnVQ
	nL8uST3aivgm/Fya7Y0026Np+UblkBrf7JNSkPVyt5IIGGREQQ/vCNViHktvIFMg37or
	tE+mQ4onOsydtdq8Hn7GzmyK0ZlrTGy9vntFc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Lw9tq4APZv36aCqCB/govz79l19aX8jFzclxL/FVZb4=;
	b=f+Qph2GF5lpzj7hcVNHV09iNGDE+bLcTAgLTY3eA30b7wXDjCHAYl3qjpSBOjpWn9l
	+FFm/LoBp5Kd8Mx+YmykJjmd4tNahw/7bDteWki0Mu/Cv3drWZUBfywhF3Ukv5BIy/Kz
	i3cIEAXav0Cmy/xGqBgeVcN8iyyUHIRAM6fJEaEN6pD9eVchc98FpEL9p7ilvvraOFEF
	c/lZRocz1VRAV+nTyU+8FjNaWHGQsLZgEhHzMry73mzI0x6G1MnCgcMLxdcwgvfEc+Me
	snCeq0EKKwoqXDfljuxxJ8oXE/UIlIOVtg0W95e8Gi3ZDXbLK5J7g+OC3WjiHjYwevpu
	qz2w==
X-Gm-Message-State: AElRT7FY2/9IsHoF0QMGK91qlwHvYkJhAGQI097PvEcg8nm9VSHmHLol
	mStwAjQC95Z3OaBmQlefH0C+DbPWhx2LdFQtW1yGdw==
X-Received: by 10.202.63.85 with SMTP id m82mr5213856oia.252.1521456376891;
	Mon, 19 Mar 2018 03:46:16 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:2286:0:0:0:0:0 with HTTP; Mon, 19 Mar 2018 03:45:56
	-0700 (PDT)
In-Reply-To: <20180315191141.6789-1-andrew.smirnov@gmail.com>
References: <20180315191141.6789-1-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Mar 2018 10:45:56 +0000
Message-ID: <CAFEAcA8D8avtZxney3dRXED_PCq81EAuiaBcMt_BHtLW6pF0Zg@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::233
Subject: Re: [Qemu-arm] [PATCH 1/2] char: i.MX: Simplify imx_update()
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
Cc: Bill Paul <wpaul@windriver.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: K5mogFXN1qAr

On 15 March 2018 at 19:11, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> Code of imx_update() is slightly confusing since the "flags" variable
> doesn't really corespond to anything in real hardware and server as a
> kitchensink accumulating events normally reported via USR1 and USR2
> registers.
>
> Change the code to explicitly evaluate state of interrupts reported
> via USR1 and USR2 against corresponding masking bits and use the to
> detemine if IRQ line should be asserted or not.
>
> NOTE: Check for UTS1_TXEMPTY being set has been dropped for two
> reasons:
>
>     1. Emulation code implements a single character FIFO, so this flag
>        will always be set since characters are trasmitted as a part of
>        the code emulating "push" into the FIFO
>
>     2. imx_update() is really just a function doing ORing and maksing
>        of reported events, so checking for UTS1_TXEMPTY should happen,
>        if it's ever really needed should probably happen outside of
>        it.
>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> Cc: Bill Paul <wpaul@windriver.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> ---
>  hw/char/imx_serial.c | 24 ++++++++++++++++--------

Thanks; I've applied this patch and patch 2 to target-arm.next.
As bugfixes they'll go into 2.12.

PS: if you could provide cover letters for patchsets that have
more than one patch in them that would help me in finding and
processing them.

thanks
-- PMM
