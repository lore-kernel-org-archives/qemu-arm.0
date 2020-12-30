Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp12318780lfq;
        Wed, 30 Dec 2020 15:52:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyg14bon1GyEX3zaVQchB3N7o/tBlnPsV4XeNs1Y7yTkAMi7/js6AEOJWrrYEp2LSIvC3u3
X-Received: by 2002:a5b:990:: with SMTP id c16mr77495926ybq.381.1609372327635;
        Wed, 30 Dec 2020 15:52:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1609372327; cv=none;
        d=google.com; s=arc-20160816;
        b=KLHUmky5TauxNMH/ovPK9tSWq41ohMxxv5nl+aWoaqZBttAxBixC13oQ2OOADJvgtj
         LnxAazJ4yEVHYnDQq0EsF+vod3oKH5gVMB74DUeS3Cll++tx7KrCo6xKJ50fjZQOaDx+
         PoIahxLJGPM8p01HX2+txXHjoXKoNj98tNdS/+Bd1aUurTyocGgsTXIZq+a+Hjl68s/S
         9A+Nsf3a1EVduIMnihzB7LbzQPjdjFMslkcV84vcHKllkle5r75b7iKSsVJuGXqBZgjV
         +5uMfXxyWUwY+w73EdRCyOuJdfdlKbMWxYfIHNOikjYPXRnXKnFTL7mM4IJn0FvI7nQy
         s+og==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ch9dMvJAly31qPYDTMI0/mfe9iwL1UOe3tkM/DKTReU=;
        b=zMyGd75Xek+03n0lCNc6ihgsR/b7OwNTWJdzRKjMBtFcoU6gPGT7P8bkS3WrHpLpOO
         zkrJNgpqXSilRablk+Xbw7iwOTWy8/7iY+gPNuY25v/3IGbqVPUDnUEuecuKkgMcGaK1
         U04V6+77shEIrJpUTdQk8OWdSV5spb1y3yu0shFgYox7k22DZFBN421firexgDZv/wqw
         JwO4QuY6TFItFZLoNbdqzneCsnHzkQYvi5ijf58h3IDZceeJXxZxB/KFxXapjTtM0mok
         LG96wR0fEIPCriagh9xdABjDQwii3NIrgVDhPZ7p/1iyugRRzS1gmwn0RoChOfb1D/Sf
         ENBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=It2CERa+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e197si44002121ybb.269.2020.12.30.15.52.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Dec 2020 15:52:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=It2CERa+;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:46490 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kulGB-0001jK-0x
	for alex.bennee@linaro.org; Wed, 30 Dec 2020 18:52:07 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:39640)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kulG2-0001hx-Vt; Wed, 30 Dec 2020 18:51:58 -0500
Received: from mail-yb1-xb2f.google.com ([2607:f8b0:4864:20::b2f]:40387)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1kulG1-0000jK-Kz; Wed, 30 Dec 2020 18:51:58 -0500
Received: by mail-yb1-xb2f.google.com with SMTP id b64so16124113ybg.7;
 Wed, 30 Dec 2020 15:51:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=ch9dMvJAly31qPYDTMI0/mfe9iwL1UOe3tkM/DKTReU=;
 b=It2CERa+gZ5wnRkLg9BhsAUwadnBvv5bEjfefbuR7WHJXTiOwm0JW9bcfiMQ2XOeKp
 TK8QTpgbzX1Y0/FzTQWIWnHZUneIKWcxb11Ekycu1PjOS5YIxm/9hGN12tvwzXLfLK1N
 r1tYckK1bk7GA638qvQ8ki0+ianZIWByLSIEGwW1uTuDqWDSL6y2PhLA61U4NK2WhiSK
 fE7Gqw4kxOoffqn6FjKw/zCxxv2ME04DSYVvY9beMCrGCQDvB2836PVk3L3RoqCn879B
 AebrBYSQA9MZ68TyzPPJnf0wEpx35VPLBhnsk00ogx4uQ6C4mAiLJdcJ/tTJfpjjZdEu
 U4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=ch9dMvJAly31qPYDTMI0/mfe9iwL1UOe3tkM/DKTReU=;
 b=Dnk7CIXWqiIQy1ej/pNNhSLoFNtCa28zY20tWIhQBx7RzoVO5WOmsp9BP2dCQCSBt2
 G1AX4rJ44v5sAhcPbcvPyEbpR3UGqX3onQzPCJDIAQ7k3NImU6BEl2uuWuzK/LAFanNP
 yOxeGJEpmsSqNmYkEPF6TxlBqSx7rBsfoyR1Om9kDNd5RejJ1xFLhbW2JwR5jm3S9xYA
 867kktYrNGMp4sAo3oVzGNsfRgcufVOWZaITzw2A08G7aMVa+q3c+bCaA35jJTt+VEv/
 eoCtFmnYGPBzEQE0CP+dOA67Cn6JRasJdb8wYXTU8HopdD9V1KmhOt12x97TiHNSpukM
 Y3Mg==
X-Gm-Message-State: AOAM530l4t6DNzxVtlymGQTxen4mkT1lUqOw4AX0fDt0Bz+Skm8HWAk0
 eXsOLzLfwiqziEpsE5aNAITnMl4+3ZNZTIGyVM0=
X-Received: by 2002:a05:6902:210:: with SMTP id
 j16mr81419046ybs.122.1609372316416; 
 Wed, 30 Dec 2020 15:51:56 -0800 (PST)
MIME-Version: 1.0
References: <1608182913-54603-1-git-send-email-bmeng.cn@gmail.com>
 <CAEUhbmXV+e3L0RtmC+qfzoY8wVWPwHXY9ZcBZ=e7RMZ_smuMkw@mail.gmail.com>
In-Reply-To: <CAEUhbmXV+e3L0RtmC+qfzoY8wVWPwHXY9ZcBZ=e7RMZ_smuMkw@mail.gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Thu, 31 Dec 2020 07:51:45 +0800
Message-ID: <CAEUhbmWcjrNie2uwq1SWb1dOZsi9wD+ScLVm+vQeBTK_F_Lagw@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/ssi: imx_spi: Correct the burst length > 32 bit
 transfer logic
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2f;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb2f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: Bin Meng <bin.meng@windriver.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 5QzNXp/kIMrJ

On Tue, Dec 22, 2020 at 2:30 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> On Thu, Dec 17, 2020 at 1:28 PM Bin Meng <bmeng.cn@gmail.com> wrote:
> >
> > From: Bin Meng <bin.meng@windriver.com>
> >
> > For the ECSPIx_CONREG register BURST_LENGTH field, the manual says:
> >
> > 0x020 A SPI burst contains the 1 LSB in first word and all 32 bits in second word.
> > 0x021 A SPI burst contains the 2 LSB in first word and all 32 bits in second word.
> >
> > Current logic uses either s->burst_length or 32, whichever smaller,
> > to determine how many bits it should read from the tx fifo each time.
> > For example, for a 48 bit burst length, current logic transfers the
> > first 32 bit from the first word in the tx fifo, followed by a 16
> > bit from the second word in the tx fifo, which is wrong. The correct
> > logic should be: transfer the first 16 bit from the first word in
> > the tx fifo, followed by a 32 bit from the second word in the tx fifo.
> >
> > With this change, SPI flash can be successfully probed by U-Boot on
> > imx6 sabrelite board.
> >
> >   => sf probe
> >   SF: Detected sst25vf016b with page size 256 Bytes, erase size 4 KiB, total 2 MiB
> >
> > Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
> > Signed-off-by: Bin Meng <bin.meng@windriver.com>
> > ---
> >
> >  hw/ssi/imx_spi.c | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
>
> Ping?

Ping?
