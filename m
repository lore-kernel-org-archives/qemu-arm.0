Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2679856wru;
        Mon, 1 Jul 2019 06:55:51 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwAZpp7VUowY6BSMiYfHjW4cNwZFfo5G4x986HPY9e9C4D/HSePwJ6mw9dAcvq7SLRI8aHH
X-Received: by 2002:a50:b147:: with SMTP id l7mr29194970edd.65.1561989351812;
        Mon, 01 Jul 2019 06:55:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561989351; cv=none;
        d=google.com; s=arc-20160816;
        b=aEHnh1UkRVv5j+hpviU7hRwcyIhPyoMnX7SnO1yyFiSinU55T8qDD+/23FgsIGGEbH
         EhrGgD9BMGsxUc1YKO8uRuk8sQhFz3wCg38AjY4WpKJ4B3op2vim+TUF7DqjaXSYaH0f
         h8DneYKL9prEpcp6MSVpxChJ73U30l2CdJRQmSdrB+cpKTrinjZyZW8+XVVszd0P7XUy
         YrEVNogVpFMdppe3Wei0pr3oj3xpVW6cS/p/pKFcfKMSvtCf3KVMZhU6YeEmzzkq2vEq
         3GjPGVfW3byj6KanXDL6M0QIi+vAisZj8S8SxvUY30/v2fY4uF3irO5u1S7Iev7P79uo
         Wkuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=lsxdKIp0KRdDGBO5xr+B1ObOvZXz2S2vdZY9/WBbxvg=;
        b=m/4R5uUY4IQcf+ba+00nF7EXmEVUWGgwat3Tpn2iRmBBcA7fqTlLvMD3jYWSGe1CjV
         wjozp8+CeB5FtzNaRhGhK/+hsd3jvL/9sYyXOe+5pKzgKgfXF3zLLUDLrQ9jJ0+0OGtq
         6Pp+iUWw4W+7P2I+oRZkKMLJcB3nIqXdks2FILk9g6zGnSDPpLWaMw/hPPu+fyO1dyFJ
         8K7oTqfqcIyvwkanh1nm6gzaawwvS9bKmjHQfACM7nzV2AGcyKvFrvhKWtTkQA8VW5ja
         fit2CJoVlyyHddFqGwyt3eL98/FAjMvLum3N9aX/zmwe/wxSnrXvkD7FPii0EglDr7+h
         WL+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Tp+bSCgx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n13si9052219edd.387.2019.07.01.06.55.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 06:55:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Tp+bSCgx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:59066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhwmb-0004UC-1L
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 09:55:50 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43240)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hhwSy-000269-FF
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 09:35:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hhwSx-000871-8B
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 09:35:32 -0400
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:40932)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hhwSx-000800-1r
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 09:35:31 -0400
Received: by mail-ot1-x342.google.com with SMTP id e8so13458450otl.7
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2019 06:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lsxdKIp0KRdDGBO5xr+B1ObOvZXz2S2vdZY9/WBbxvg=;
 b=Tp+bSCgx+xXG/9Ttw37vG+RC3SxemU+33TLgbiPkwTX56VO1ME45E9fHv1ErXwlUV2
 qGrk7cVjxcthSTKZzlBGtQpIiuhwysRBn1+qESS/wX7ued7Rii7+xJHfUPAHzUXK+LqP
 FMBhTgKZs3sDHOI7SXPEgYyiSXkjePa53AiHY5OQ6JrCnj5t65j8MlRXSfv8mpZ7lXiy
 L24PgYlkgXZszsuXhg8nkLAV4StjVDD4WkNOO8RgLrYI5MasRGbBaQwnjch33hrtqVTc
 LcULKBLfnuFuxlNN+Xc4jwvw0iPhrn9C/KdCyfP9IAxh+aMY+WfE5pVMS9yhu/P8CLok
 /ZQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lsxdKIp0KRdDGBO5xr+B1ObOvZXz2S2vdZY9/WBbxvg=;
 b=pPLRwQdQ2mU4Uv5Jh+SsDjWNqq1C9RIwu7J+UgXuMRpIhdBvmTe/XBBXWANtZNdeS8
 jOtzjlnLZ/gFh1/JVmFDIyJ4Ogj22nYHFThjecmTrhUHWiFwbQ315WbAMj8oQUQgQITx
 jz+/QXShpznz3HrFOw0wBhyKaNkEoBDcPwKi02UyEuHLctiUvIlLMYADPWlk+JaH1q9H
 9yse6Ec81Un24x0zVblWgdlzSyojuaFgp1P61H6DC/ukXpdRL6w2jyKr2P6FpfimsRfK
 43EAWYzxwh6pPDMXmYpmnO5GYKOg9MRkcBRVigryQEw4+K/pC/siFsEKyzLw6mouik91
 z96w==
X-Gm-Message-State: APjAAAVKpt8JcIL59I378bkrFqQ5/ZnkRR949Hp1gEFP7jHdRYyOHOPZ
 P3K6Fz6dJ6kERHwftOtx6a9ilikdNHZh37EMKzzVDw==
X-Received: by 2002:a9d:4d81:: with SMTP id u1mr8632671otk.221.1561988125442; 
 Mon, 01 Jul 2019 06:35:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190618165311.27066-1-clg@kaod.org>
In-Reply-To: <20190618165311.27066-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 14:35:14 +0100
Message-ID: <CAFEAcA8+e1ADZqgnaR0T5TCdKa4qTtt_ny4r_KFndhGEcDaCKA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
Subject: Re: [Qemu-arm] [PATCH v2 00/21] aspeed: machine extensions and fixes
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: L6ItdlImYwUT

On Tue, 18 Jun 2019 at 17:53, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello,
>
> This series improves the current models of the Aspeed machines in QEMU
> and adds new ones. It also prepares ground for the future Aspeed SoC.
> You will find patches for :
>
>  - per SoC mappings of the memory space and the interrupt number space
>  - support for multiple CPUs (improved)
>  - support for multiple NICs
>  - a RTC model from Joel
>  - a basic XDMA model from Eddie
>  - support for multiple CPUs and NICs
>  - fixes for the irq and timer models from Joel, Andrew and Christian
>  - DMA support for the SMC controller, which was reworked to use a RAM
>    container region as suggested by Peter in September 2018
>  - new swift-bmc machine from Adriana (P9' processor)

Hi; I've left review comments on some of the patches.
I'm going to take patches 1-9, 11, 12, 13, 14, 19, 20, 21
into target-arm.next (since we're nearly at softfreeze);
the others I either had comments on or they were dependent
on earlier patches in the series.

thanks
-- PMM
