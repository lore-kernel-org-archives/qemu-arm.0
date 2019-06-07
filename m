Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp92494wrg;
        Fri, 7 Jun 2019 04:37:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxZz/kJ97YOqTxXlSPbgXSufnYjQCjhe/303Q93JZQhl7X47DnvLNJ5Z/eDep91BLrbt6dp
X-Received: by 2002:a37:6258:: with SMTP id w85mr30597013qkb.40.1559907440757;
        Fri, 07 Jun 2019 04:37:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1559907440; cv=none;
        d=google.com; s=arc-20160816;
        b=ElfemBq5wI7gGhh6fn2Aj4gt1/nSxc5EaYSzwB2aGyD0la8IIjVNGNgccKdm+C47K2
         GvpyNegT79v+qZEe+gtTi0ms3PphBteDle/5up46sPenSq3cOJ9cTm1m3lAN4aYq4RyK
         FyN2VYBUwM8EslqfUlzh48DA6a148RwflEnSTXIYZanYnAht2qbjzwtiC8yL+qMAPqO1
         SABcnzVxz4j+CDKAU9RUBkNiq1zvbvawSYFtZsW+2daD1yOVZ2y9bT6xnQLn2IfxVZ61
         2kRlD2qBHFPLYP1Fmm+P0f8fw5trDcWwg55OTDbZeMnWZURN2iohz8f6ASNjIif0ek+B
         SIrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=lwVsP3q3Na9chJgbRd91xhzekVCplSdN5e5V061lESs=;
        b=RJkA/BrXbsTa9sDZKJ1LW1lDO8mtpvAZLCS5dKyUgQl3iB3Mer3T5MYwIjVH7XK3Y3
         4BJBkxA8TnvjB9uwdSdoUNozYciG6CaDvFHvodxL6oFW2NEg/5kcGSgHlm168mpPUCYA
         5XTm2RdUqRgnmmo2z+ybP+eDC83OL1e94KUauAm092tpEG2cb69FvH71dx3OiBXntcIO
         NAiKkvzZxab75TyPdimMRb1ou1VZ6EsgvwG0RUJflhq3UtBsmE9s4DaA2M5fR1attaqg
         1lnhXTg0Dd44uSr2ZMalb9osoo+1eVD2anw7D96y/vimZtH7KM92Hg3Jh2Ti9f8BzJhJ
         apRw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pueavyNx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.47])
        by mx.google.com with ESMTPS id w2si224852qkf.216.2019.06.07.04.37.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Jun 2019 04:37:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) client-ip=209.51.188.47;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=pueavyNx;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.47 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48698 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hZDBQ-0005jm-8o
	for alex.bennee@linaro.org; Fri, 07 Jun 2019 07:37:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33144)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hZBq8-00084N-7B
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 06:11:18 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hZBq1-0000MI-9h
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 06:11:11 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:44393)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hZBpz-00009S-00
 for qemu-devel@nongnu.org; Fri, 07 Jun 2019 06:11:08 -0400
Received: by mail-oi1-x241.google.com with SMTP id e189so1027133oib.11
 for <qemu-devel@nongnu.org>; Fri, 07 Jun 2019 03:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=lwVsP3q3Na9chJgbRd91xhzekVCplSdN5e5V061lESs=;
 b=pueavyNxCQl3ytqWJooZczOtjzWX4cIRp7FhCcfSYnTHudZ8CRaShY9fbkmvFOLC/q
 WMVdAEtb9cl8wV7mHmCfJDmvaQGbQLvYNSXuTEtE5T0UGbyThTe6TxJQYpKGwhZGzkRz
 0y8gthfMG7ouRti87iglTn+204s4PPFRRJfbi0M6pdeZVnydDuiOhd/QtjhMn1GD8xWj
 NjYdofF4FFnDNbO+tffwtsqTXHpI087G1K4FZLuMxHVXvV4FN+RJCZEZB5SbMIbiW+Gw
 TIVUglwKEE/5AkNYJefaxSBNXU319e0GJOyy4Z1GT5QXm1/xtgB89RXTMVdf70gijJeL
 CneA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lwVsP3q3Na9chJgbRd91xhzekVCplSdN5e5V061lESs=;
 b=hiFIk6Xrtm7eYR2fgP1e7dQl4R/KUwSXkwDKU//UUuKyquRV+Et+N9nQpMI2Mq5p8d
 ZGhOxcrjzlyS0mGnOFEkgPhDNHWnxFzovDlPi6OAV4kV1I6jNDvPD3PLNq6hMpzv9OiP
 vRxg8eQJK4hU0uKahGPp2fUKtjIP2gyH6/nxCqXVmvy2TQpifugpupDW5NAVyP/OcX2N
 Pq0kUDmururpaDBnSpgZFeaYz3fjuMpicSxpVH2U4ERVM6Ll5zWyRmK6D+eZvXHFpAif
 uyb84f6kZ6wKg0A41q8cIgQQDLot9FcENMwthyLrkx+o1v4FUjFEjCzp2UJIygezHh2v
 1lRQ==
X-Gm-Message-State: APjAAAUP4TmX9pm/ohgnmjEmIMNnOm7pplb+9fh/OvD7tQ2cAuJ0q9b0
 RajTEti47tqF8FGMP7wyTpJsrjnzwxcGHz9J8xVdIQ==
X-Received: by 2002:aca:c786:: with SMTP id x128mr3153673oif.146.1559902262487; 
 Fri, 07 Jun 2019 03:11:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190525151241.5017-1-clg@kaod.org>
In-Reply-To: <20190525151241.5017-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 7 Jun 2019 11:10:51 +0100
Message-ID: <CAFEAcA_JQLEWdmFuDivD5YwyqQGcFzr_tDr0H4p7fvwZFGj4Jw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-devel] [PATCH 00/19] aspeed: machine extensions and fixes
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: iTyN+WpeTe2i

On Sat, 25 May 2019 at 16:12, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello,
>
> This series improves the current models of the Aspeed machines in QEMU
> and adds new ones. It also prepares ground for the future Aspeed SoC.
> You will find patches for :
>
>  - per SoC mappings of the memory space and the interrupt number space
>  - a RTC model from Joel
>  - support for multiple CPUs and NICs
>  - fixes for the timer model from Joel, Andrew and Christian
>  - DMA support for the SMC controller, which was reworked to use a RAM
>    container region as suggested by Peter in September 2018
>
> It is based on Eduardo's series" Machine Core queue, 2019-05-24"
>
>   http://patchwork.ozlabs.org/patch/1105091/
>
> I have included Philippe's patch (comes first) in this patchset for
> reference only.

...I'm hoping some of the other folks interested in Aspeed
are going to review this series.

thanks
-- PMM
