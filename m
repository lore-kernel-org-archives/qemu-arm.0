Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp5002059wrg;
        Tue, 11 Jun 2019 18:49:43 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwfllIrX5DaKBuPUzXGzRUs9CDLoD5CZxBnsSJ+aphFqZkH6Dli3IWMd/a8icDS1ctzXWqI
X-Received: by 2002:ac8:30a4:: with SMTP id v33mr68597551qta.249.1560304183390;
        Tue, 11 Jun 2019 18:49:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560304183; cv=none;
        d=google.com; s=arc-20160816;
        b=udIi+HfhhdbUKOfsRfsnXPAXLfq6mAARoDYotPlFeyEqE3BM7BDdW0SHz8A/BfP1N2
         cMS8l8ipdn6udIDHDZf5i4akwHXEbYjtXfNTUk2JR7vBIrQOoJeTxFGOCDCMVBDpCFE4
         bxxZ01smXf89va8hjN9d1ZA93GI0P5TBASRO7dudfUWMXLdFS2lqXs0lcNZPVvCY0hsK
         Zs6lWuZqs6jbw2v+R9N2Rmq5wha/dwZLa809No9KIl2UlZ6nSErh79Nq2X5qI/f8f3zd
         vEKFx/N3Bp+l6LZ/E4H4nEYclJsw+B5rDr2WvPh0B2DUHzxhtQ+Ej4e/hgqMSCq/cehg
         0Ntg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=Vxmca2q3EKXZcvXmBIzcFl5QyFAwVpQHZGukW1tpFX0=;
        b=PhENxv/X//F0VjzbKPgimHwBprZzVcJRr7w56rPi5/6yVDoLZ6CgxTGR1hqk/LGn9f
         QePqZ1lhOTiaLcURC2hQ4BZyPSoVLZE+CWe7ZhoeDFqQsMw44s3aDfq3Ps+7x50R0sKe
         DGs+/LR5i/KfT1iJUDVVEKkU7P3FFj6vWLESIKU+EdpCbMZD3Fq9PsSZUwgV7W5NX3rF
         gb1BKJpxP7nKE760QZvPf+XL2pXSVcNVkbxQvKfRDLnWliboarzFdYXnyFd2d9wgKNmD
         tWj4dKlBezlaJYDIJUzkFm0DlZ9j5tMkneSjK5G9gn/dpubjSMXaCtnhgcE6jH7DZwo6
         ZiZw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=Th8DICMU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9si4951473qvc.108.2019.06.11.18.49.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Jun 2019 18:49:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=Th8DICMU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:56154 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hasOU-0004tJ-RH
	for alex.bennee@linaro.org; Tue, 11 Jun 2019 21:49:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54098)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <joel.stan@gmail.com>) id 1hasOJ-0004YM-IW
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 21:49:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1hasDS-0001mI-Fw
 for qemu-arm@nongnu.org; Tue, 11 Jun 2019 21:38:19 -0400
Received: from mail-qk1-x744.google.com ([2607:f8b0:4864:20::744]:38560)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1hasDS-0001mA-Bj; Tue, 11 Jun 2019 21:38:18 -0400
Received: by mail-qk1-x744.google.com with SMTP id a27so8979221qkk.5;
 Tue, 11 Jun 2019 18:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=Vxmca2q3EKXZcvXmBIzcFl5QyFAwVpQHZGukW1tpFX0=;
 b=Th8DICMUwoqU8QReefe19VdCJnzBWJcubCki0JkbERigeJWcdZ7WJm2JH/2hiSbA5Y
 C+aqLHVy/8ojwX9vmkKAgTcB9PGomEpCHTmg7a2HfE+J2UeUkp0IbVzfZgCaYsQHadq7
 dMja2MZNmb1CkqqDOjyv4tsc6ccM1FHNGyIcU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Vxmca2q3EKXZcvXmBIzcFl5QyFAwVpQHZGukW1tpFX0=;
 b=pnOm/KWzin6H/3lfRuui3Pt6NWbRrb3agNzDyTUoSTZYrJHoS7MPK6+hLi/c4KImRs
 oj1QKd6K+ZjBcuZXzk2ewejeWvC6HfVa3cZ9kkUFzSNcLhGFP7gogsV/5uQ+24PToVMO
 fDRuw0MSntZqX+bJtv17WluaU0VNBhEjklA3458ZPieUihDFKkHTVLmEZI+V8eyCPM3Q
 ve67zFCtPzgQ4DQkeZDii06LTzNYhi5BngS3sm09tGn3N0fjhIrp+WvxfW5YmA4fiYmJ
 2zlmoxG9pMFNGgwqSNklrgEvrG6nw1zaWppCiUdn/orRebrlBCXyHtdpUFdaWkJsm5wc
 7B+w==
X-Gm-Message-State: APjAAAWHhJU/tdrzshHkG/2Cy3CGCyzvgILC0cpZ3ZNDqEwMBKS6ChHv
 i8Q7W/5Ts/kcf/IaQNQdk5vAkQ2xb61N3jExBs8=
X-Received: by 2002:a37:a743:: with SMTP id q64mr62295320qke.236.1560303497735; 
 Tue, 11 Jun 2019 18:38:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190525151241.5017-1-clg@kaod.org>
 <20190525151241.5017-17-clg@kaod.org>
In-Reply-To: <20190525151241.5017-17-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 12 Jun 2019 01:38:06 +0000
Message-ID: <CACPK8XfB7x1tamZa+epxBzwkrfovW6qBrNqokk3jYtLa3dxwFw@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::744
Subject: Re: [Qemu-arm] [PATCH 16/19] aspeed/smc: add support for DMAs
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
Cc: Andrew Jeffery <andrew@aj.id.au>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: l4D4fuTLiZDK

On Sat, 25 May 2019 at 15:14, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The FMC controller on the Aspeed SoCs support DMA to access the flash
> modules. It can operate in a normal mode, to copy to or from the flash
> module mapping window, or in a checksum calculation mode, to evaluate
> the best clock settings for reads.
>
> The model introduces two custom address spaces for DMAs: one for the
> AHB window of the FMC flash devices and one for the DRAM. The latter
> is populated using a "dram" link set from the machine with the RAM
> container region.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

C=C3=A9dric is our flash controller expert. This looks good as far as I can=
 tell.

Acked-by: Joel Stanley <joel@jms.id.au>
