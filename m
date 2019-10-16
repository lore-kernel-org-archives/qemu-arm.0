Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp7010224wrm;
        Wed, 16 Oct 2019 04:26:32 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwFkuN2xbjdeMBHwE/h6LpuYhbrEigwiRG//HJzxE/F5mbwLOANifoGGVLAgwmfVvY0cxxT
X-Received: by 2002:a0c:eb89:: with SMTP id x9mr22234449qvo.87.1571225192169;
        Wed, 16 Oct 2019 04:26:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571225192; cv=none;
        d=google.com; s=arc-20160816;
        b=XFj/qkLnMRns++VwIQ4Zjk0LwzHt7XcVusDuWg9mrLvE2sbNiwOYBNcNcH5JJJMUVd
         tjw3XW/8KMy69I2SSrjJMPpCTqu+Cb3KCZ7ukielz+Fp0H0H3EAb4vJWjAZPs3Va1jls
         Z81XNJQUqzAqti2mo6/7uzGpZtkK/enx/h0KNz1J82H3StEThXvjzSmkWJ4lWS/c0SHm
         t+apIUV343SPnKjvx0TaS9FCiRmKfGiZW5OTyWHGJao+Sk9McLa0+z/CuDiWYDH/eVPo
         5q3S++lmArj9j6048BLCiypW8hKIWgCSoLM+20ldmgGW0/OKZ+v3AP9fgoEtRrd+kBiq
         QiHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=cl/I+V8biwfMluFTh5F5IRiQu90LJCJeh5Z+3MiwiHQ=;
        b=ArLW74dNkOkAgoLL/6oMWt83fki+2wAS1wHnhggPEyrhzxuox6clsnvZGT0WkO0GhT
         SWPrWdccJFD3m4YxAIqTuHMdBY3rh3c3RIiPyndNe7l4DY4g0NQfj7F0T2wCouybaPYd
         84Cr/W3wgSq3ExrxiQyj5bzawE2oRBJJC1UTbtzmkhgodo4wN3x65MubWzcRVQ2i9L7t
         dlH2thbxAe1LIwgauJm9yxAR1stmCcrFEOV4HL9VESk7PUEuFXT60kR+1o20JBbcV51b
         wP7z8wXjUni9bNiKMcncok7ChzvGSI0vRvHKCgODhlQ40Ws6ZqEI7IoUH36wdFL0H7QL
         sWNg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=PGe0yM5W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id o2si24007376qkc.141.2019.10.16.04.26.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Oct 2019 04:26:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=PGe0yM5W;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:41168 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iKhRn-0005xw-II
	for alex.bennee@linaro.org; Wed, 16 Oct 2019 07:26:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42242)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <joel.stan@gmail.com>) id 1iKhQ9-0005v1-HK
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 07:24:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1iKhQ8-0003kG-Lw
 for qemu-devel@nongnu.org; Wed, 16 Oct 2019 07:24:49 -0400
Received: from mail-qt1-x844.google.com ([2607:f8b0:4864:20::844]:32833)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1iKhQ5-0003gg-PP; Wed, 16 Oct 2019 07:24:45 -0400
Received: by mail-qt1-x844.google.com with SMTP id r5so35555085qtd.0;
 Wed, 16 Oct 2019 04:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=cl/I+V8biwfMluFTh5F5IRiQu90LJCJeh5Z+3MiwiHQ=;
 b=PGe0yM5Wi8/f8EcBmTdhs+ABdM4noPfe8zNXd2fOqvD6zbITDAabblpzHJ7EyEz5ZC
 pj9JeQ+nRrKsXt11HdsJ9/Pu4paNcNdLBxjF4RlqzjYhqrAxiw/O5aHJY5doMxg41uKQ
 UxZcnXO4MYVlrez18o421X+Yd/VJpflH9usNE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=cl/I+V8biwfMluFTh5F5IRiQu90LJCJeh5Z+3MiwiHQ=;
 b=AUcq+Z+sb5qGxpjdltF3ZWdStHf4rn7omjSL3U8Euz6ACjOTsKjvtPVoGeZZ8AoHy7
 Q+LNz/n7Xmp+/TWmnvKAA+dSfkziBNWaEYZUZhpYa+24qgSJFQBraqS37WRAffheV3Cq
 8XIBqNxqeWQNeDmcni+w+xlklB+9ih6xDnBkJ6pHnkPNRmM4E8zsqypAyJYLv9532G8Y
 Be0Dy8VE+6wSyNtQSnWuc/AuB8l6UojziqjDqem7LGaC8R175FKot16dDyqy5g3TPW6N
 lH6GKnXjy+3JAfGvYBM3PWBZqX1bXTRjGcQg5EZkFiBeB5/a3qfx/jAn6LRdKtyqS36y
 AirQ==
X-Gm-Message-State: APjAAAVS0Y+Pze/B+Bu9Z+FP0/3yeyDoIYk0lR0zKx1BUjE9zJCOmAqd
 HkVEAlnuCl4MsCdpD2qrcIlO3CNU2/PKH1WNEFs=
X-Received: by 2002:ac8:5252:: with SMTP id y18mr44129384qtn.220.1571225084835; 
 Wed, 16 Oct 2019 04:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20191016085035.12136-1-clg@kaod.org>
 <20191016085035.12136-3-clg@kaod.org>
In-Reply-To: <20191016085035.12136-3-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 16 Oct 2019 11:24:32 +0000
Message-ID: <CACPK8XfbUmzu+swDuGm8jNLRUWysVqMEcox26QcEhY1xQDYg5w@mail.gmail.com>
Subject: Re: [PATCH 2/5] aspeed/i2c: Check SRAM enablement on A2500
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::844
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
 Eddie James <eajames@linux.vnet.ibm.com>,
 QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RwFL3Zrk0ONX

On Wed, 16 Oct 2019 at 08:50, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The SRAM must be enabled before using the Buffer Pool mode or the DMA
> mode. This is not required on other SoCs.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
