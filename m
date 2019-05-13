Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp3042165wrg;
        Mon, 13 May 2019 09:53:56 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzK1pRF9kO9YcmHPe0LRPi3GvVzvHh0VjRwwL5EvgsBOPFlTNQNrxsWsblQ4P4Uj8X5FDf9
X-Received: by 2002:a17:907:10d0:: with SMTP id rv16mr10651869ejb.138.1557766436288;
        Mon, 13 May 2019 09:53:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557766436; cv=none;
        d=google.com; s=arc-20160816;
        b=Y7q0WNBMdClqoJ2hyrwugJa4PTJ+XP5mYGpMW/nKdVQaR1q97ALvWkOyPqWwx9mF8b
         MOwoaeoBJZCKBsglhggMSINAlePc3IofGar+1unLnphPfXiJW2JGXg1Ah047hzSYhqJk
         XnatgrodsOxi2fEE/CsrGVa+dOonLm4mjQqq2dZzZMRJ+KOjVRaCvmKewb+EagCGGV9J
         i/NR2m1XLQO4Ee1IMbjgbnHUgOgbpJTGWeP2CQrcG8BzrP0wW/uXow0yUKTHsN5G6HyN
         TkiQHOvZzIhHDMGNf8E/kWW7h1XQH9AW6o6W53JMfDLGJJk1IbUqTfl865Lq0heYkLsV
         vcSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Pb1B8Av39ZPvBs2RJzpF2tUcLswjPPgnNSykVdts5UI=;
        b=A5sdJWuQNuup3uGIo4deTffCTlwWUZnvsIpUWZcGSKyaNf9yTwy5hrtaNm6HQUkUnw
         pFgK2nuj8nZOicpOaIe/GWhC3Ym9sTReg9VUi8NwrnE3/D9hrgsn7ZMdBtO8yWrfGT+N
         RHgnHNoZzdmnVm3n+eEDaCkDrMsLX9Xk06BZQUtO/K7XGjWCr4gbvlm003VkRU5GNGMv
         h5ohUTTMP9WlSqMHpmKi5wrEKajljKZfwceA5Im+8Ia3DPeAQQV4PU5rMAnIin2kI8uo
         VfH9pGw8a/NRJKWaaQFHDS95BxruqlENDYKELtOFt86fu18caem/Ij6MwKdvZm/dUt/p
         YMlA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kb6TcA9R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b25si5408955eje.328.2019.05.13.09.53.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 May 2019 09:53:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=kb6TcA9R;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:60478 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hQED5-0001Dw-Bq
	for alex.bennee@linaro.org; Mon, 13 May 2019 12:53:55 -0400
Received: from eggs.gnu.org ([209.51.188.92]:39280)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hQECn-0001Db-S1
	for qemu-arm@nongnu.org; Mon, 13 May 2019 12:53:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hQECm-0007oL-G5
	for qemu-arm@nongnu.org; Mon, 13 May 2019 12:53:37 -0400
Received: from mail-ot1-x329.google.com ([2607:f8b0:4864:20::329]:34415)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hQECm-0007nL-BG
	for qemu-arm@nongnu.org; Mon, 13 May 2019 12:53:36 -0400
Received: by mail-ot1-x329.google.com with SMTP id l17so12452418otq.1
	for <qemu-arm@nongnu.org>; Mon, 13 May 2019 09:53:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Pb1B8Av39ZPvBs2RJzpF2tUcLswjPPgnNSykVdts5UI=;
	b=kb6TcA9R7yAtnFT4DHiUVUsEVZJxi1zZO6w+g+Zs8Bkg1FCNOwznDUb/p2PZN1EvGw
	Fc6Jk5p6mbke9B1tlpamDVJlDvEc5t7DUrpByyDc1P3o0DNagEebNuU5BMcqU9gbgNEI
	Bje5SdZuKQwkYc8nq8yAY/UmgX35bCNzFdcnEb1wL9pZW3d1ESsMBQwWtNMb96CQc+ud
	azLUKKXDOJsFPV93DzIf/5bFN2Ic5f8iQ/eFr4PITMcWGSoaMqw5ru0ZAfQgl1BeL1G5
	eOfwb+eVXZDPq+2jBWxagulGvh3NDeF06HTy047/i+L3/ASiT9en+q3z8tpxMeavSXk3
	i03w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Pb1B8Av39ZPvBs2RJzpF2tUcLswjPPgnNSykVdts5UI=;
	b=b0p2ehh7sdYlLse4RUFk//9TiCfGSNePErWd+nRY/OdFwCfJAQ5I/BhyigAvbUELBW
	6JV0f46Pipae/I/sqHflAdnRlSh8ABokMHclJyOP89004GS32910QpzepW4nWtuq6M5Q
	Vmj2b7Gv9cwno5qLh7hYRh/IogRs1fTCkaffgaowBhVKRx0NW2oWseluOBvRIf/FR6xO
	XR4xKx01tsYRvef8xEmAVuzZIW+cCQTVl8tbrPHblPLh/LPbWitaiyz4E2JXw+rpCgKb
	R554kOq0Hqlzq3//wmFWy69q5brct1gzEIyCh/eUXnOFFHoVgvnc9WMqpI5EW2N7Uuqb
	+6dg==
X-Gm-Message-State: APjAAAWhBFapgbHPvHdgMyqqydcQmTwhunV1rmnRlGx1j2CCoGAeao9S
	YgLa9GGN3lK0NdMaBHnpV3lktPj4VoxF01RhjNRbkw==
X-Received: by 2002:a9d:2002:: with SMTP id n2mr14169212ota.363.1557766414804; 
	Mon, 13 May 2019 09:53:34 -0700 (PDT)
MIME-Version: 1.0
References: <20190513082940.30295-1-thuth@redhat.com>
In-Reply-To: <20190513082940.30295-1-thuth@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 13 May 2019 17:53:23 +0100
Message-ID: <CAFEAcA-1xskd=p5kWvW=nvm+8O0H=Y55LtQSynvW-1vXRPjdFg@mail.gmail.com>
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::329
Subject: Re: [Qemu-arm] [PULL v3 00/29] Kconfig for Arm
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uUHdBCHfWwme

On Mon, 13 May 2019 at 09:29, Thomas Huth <thuth@redhat.com> wrote:
>
>  Hi Peter,
>
> the following changes since commit efb4f3b62c69383a7308d7b739a3193e7c0ccae8:
>
>   Merge remote-tracking branch 'remotes/stefanha/tags/block-pull-request' into staging (2019-05-10 14:49:36 +0100)
>
> are available in the Git repository at:
>
>   https://gitlab.com/huth/qemu.git tags/pull-request-2019-05-13
>
> for you to fetch changes up to 704d9892561d3b7ac4728296240a1b3ccfa2045a:
>
>   hw/arm: Remove hard-enablement of the remaining PCI devices (2019-05-13 09:36:32 +0200)
>
> ----------------------------------------------------------------
> Kconfig settings for the Arm machines
> (v3: Added the config-devices.mak.d patch to fix the dependencies)


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/4.1
for any user-visible changes.

-- PMM
