Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3531631wrt;
        Mon, 8 Oct 2018 07:36:06 -0700 (PDT)
X-Google-Smtp-Source: ACcGV621xxljEMCTZQsJXhs27xOnxJyFEhWCr0UeRA5BvqWmKUM48nqHluDANEi30goOMaZKN12E
X-Received: by 2002:a37:cf88:: with SMTP id v8-v6mr17496612qkl.355.1539009366114;
        Mon, 08 Oct 2018 07:36:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539009366; cv=none;
        d=google.com; s=arc-20160816;
        b=q+9oPZwX7LHpx+SYY8hNoj/+Hjw2R4OirEH5p8wsfcFlLYUQGMSD3+58NbaK265SjV
         jZ0QankNMfTpCzJojTN9Ni3nFa/NpsquPOaSoCbMqIKtcaQQG+TucTatzDwTREaNEqiY
         orbOCDlF/NmXvjhKVYhgmK9WGZ0CuTRRkB4fmmHlzC+DNKxO7rAVa/Hs2v0ecFDepQMP
         hRtOWiLtaEk63rRPAbCFLSQvYXkHCMNBjzqdXnq+2ggIwR5saos+sMgdxAPgU1E0VvHH
         SrxsTZRL3DYtz8bb3xB0nCrhrQXAU4kJC0i+R3Jarhc2AbOM6f7dG2Mv0uqiEGoJMeSx
         OebA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=cX9cIAjfn70HQlnpx4sP+PbqTjrOiIXAWqrYpl5J17k=;
        b=Hjm3TujsoeUbD5VcUzdhlhiPJha1biRN0+OEwR2ZzSv1IQOGV0VSHlNFXwcX91vwDW
         JAzM+HDvGbW4OSexfmf620CdEIQ/Dz+LJpOvgRVMrOb/QA19M7ZXwdIZDpFdSwqgn9iH
         8saDpraiw0R9mVJ0Vuu9Dz5skhAp5MdrPrgjDCzus21UIpYELfbg+C5QEoUHfC0/H+NW
         febuE3dZs6EEukNvivqPQsg0lNHVUt4TKduV/2SdvtRAs4zsPC6JyyjAswB9MhaVr99j
         0Qi3tM+LpF+K8+Dw1nB303zeqtUVmaArn9SHRRUK/1pDmc73daW21j68SreGMunBIBQN
         GACQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JUC8m4SL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 22-v6si12001879qvr.163.2018.10.08.07.36.05
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 08 Oct 2018 07:36:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=JUC8m4SL;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:46557 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1g9Wdh-0003Im-F4
	for alex.bennee@linaro.org; Mon, 08 Oct 2018 10:36:05 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49203)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g9WD7-0006sy-Fe
	for qemu-devel@nongnu.org; Mon, 08 Oct 2018 10:08:38 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1g9WD6-0003yl-HJ
	for qemu-devel@nongnu.org; Mon, 08 Oct 2018 10:08:37 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38872)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1g9WD6-0003yV-6E
	for qemu-devel@nongnu.org; Mon, 08 Oct 2018 10:08:36 -0400
Received: by mail-oi1-x241.google.com with SMTP id u197-v6so15855821oif.5
	for <qemu-devel@nongnu.org>; Mon, 08 Oct 2018 07:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=cX9cIAjfn70HQlnpx4sP+PbqTjrOiIXAWqrYpl5J17k=;
	b=JUC8m4SLUfQvsit5wDNI19I0EuhZXiUHxeoYvbneuky2F6fN3b30Yfznk7d1nmFRCQ
	pN9uKTp9W4krTjhC5sgEw1nffv3CwDn5YLRGPIWPX3mHxZMgK+vFIBpg23HmusAizzyM
	Uy5XZzmO98QoXDyXGakvKNXe55LcsEeXzxMdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=cX9cIAjfn70HQlnpx4sP+PbqTjrOiIXAWqrYpl5J17k=;
	b=MvxaHXkqW3stXIuLSGIwK5Yf3JCEiAWMp4zGjgtBoFapJ1VMDPzWXPkTI5ewYi5+ip
	d0otvaozsnp4dP79HNdZaGytyqCC4l6C+NilPlAzJ41eQ80Ydh5N73RZOcyWWEPFD5o4
	skItFxAC7a36D2TuoVl+/nPQALDFkSiOuqIzV/i56c3h7ofrJkYDc44kaUOZO3jzuBK5
	Gu0ptmmNUensCglTsEWFZcxGNg7n/W8coTbVawF/wGoH4Il2/SDU3PpH35nHQMCDcd8/
	F3UlFG/xm0sJGYupQIDw1nMKyrMoMlCUerAxVgNzSH3bYtXjnceS3q5py2uzK1G0vQMu
	Vxnw==
X-Gm-Message-State: ABuFfoj3mqPi77d8zV622jwY+otFKltfGoFB2W34Q457QDApoT5daJwS
	IivIhaujXBgq8BeaUl7pX7SKyWR3WGD1Q2j8TA0p5A==
X-Received: by 2002:aca:e7d0:: with SMTP id
	e199-v6mr5183304oih.187.1539007715353; 
	Mon, 08 Oct 2018 07:08:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:20e3:0:0:0:0:0 with HTTP;
	Mon, 8 Oct 2018 07:08:14 -0700 (PDT)
In-Reply-To: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
References: <1538579266-8389-1-git-send-email-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Oct 2018 15:08:14 +0100
Message-ID: <CAFEAcA8PHLZGfYpwU=zsG8eZ==hWu-b9CLJ_7Z+8+C5YvgZfuQ@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH v1 00/12] arm: Add first models of Xilinx
 Versal SoC
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: b9+k//5SPvqj

On 3 October 2018 at 16:07, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> In QEMU we'd like to have a virtual developer board with the Versal SoC
> and a selected set of peripherals under the control of QEMU.
> We'd like to gradually extend this board as QEMU gains more support
> for Versal hardware components. QEMU will generate a device-tree
> describing only the components it supports and includes in the virtual
> dev board.

So, the SoC implementation and the GEM and HVC bugfix patches
here are straightforward. What I'm less sure about is the "virtual"
nature of the board model. What do we gain doing this rather than
just modelling some particular Versal dev board?

At the moment we have a fairly clear distinction:
 * most machine models are models of real hardware, and the
   real hardware is the litmus test for how things are supposed
   to work (and, like real hardware, the user provides the DTB)
 * the "virt" board is special, because it is purely virtual and
   contains only a few specific devices, so it can run Linux guests

This would seem to be an odd hybrid, with an SoC that's a model
of real hardware but also some virtual "QEMU controls what's
present and creates the dtb" aspects.

thanks
-- PMM
