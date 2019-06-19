Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp118174wrg;
        Tue, 18 Jun 2019 19:11:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzqIDT7PxUhJ8gpieoXhoaYTbQq7KbDgKdbr5dVQZZMQ8d0QBOpSdlofeFmucu8yNDE94Og
X-Received: by 2002:a50:b178:: with SMTP id l53mr104663021edd.244.1560910261656;
        Tue, 18 Jun 2019 19:11:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1560910261; cv=none;
        d=google.com; s=arc-20160816;
        b=DZbmJdmvsyufao79rkul0E9WTadSxVquRUZhdtbOiUyJXRO96RrC9Khp8pv8gCZvLG
         ZI2C8L+0tzNAsYTmZhkFKqkqLF7ydfid7B/Vx8WZ39Tr9iwBbxcEbL64K5ZzQOeTVGmk
         HXhnmzv+tKesmel+/Xeo8dH9fSOJnBA1ZWBw9iN5VHs+701NuROwgLIaIK0rLISlGlff
         1NHpUNTonezc0LVDYVzDLHhjEcfbnu5r+AjX6PtwUmw5kCw3F8E3nPJ5vTGqJzD1QEWn
         GLsfWDzxekSfzISPR/YzxNJ0gogwnriXFdhMke/0+wlZomsvkJ5cX+UZnWCTlaQZycdZ
         uMUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=6f/vDN8UzYXYAWICSwz3/kaEZ9vcmij1v7RkJ/hDmCQ=;
        b=degjJlvdxtPneCM3LJ6ZYCSFzHd0Ay1skI90vijTbVdW9p3x/8BbPGp0QsnYaWeICa
         16f1mTtLLzvVpzNzRcQrfLaBppEqnpCZGNjlKrkqywc8ArYT+jXx/0oEiByqxw6ktcVY
         Cy9ew32bPBFkXkKdHDACRNBkGIb7+zmULdZg0UK7AogO1/FAYlgqG9xHigVjV5Mps4BP
         NS1OFQ3ksuNtJmwLryb1vhPDbniALFbuf3rAUa5lr5EJ3QRooYOXP6l3aX/JWm/axe/d
         mTgXPJ/74WzxVvfGzfjjdHK3ZvorbxUU6R69HDjvEANVdz4ef+txePIjiLB/rAmvrg0I
         i6OQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=caWR01mH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a17si2881441edd.199.2019.06.18.19.11.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Jun 2019 19:11:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@jms.id.au header.s=google header.b=caWR01mH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:34636 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hdQ3w-0007Lu-LC
	for alex.bennee@linaro.org; Tue, 18 Jun 2019 22:11:00 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:33848)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <joel.stan@gmail.com>) id 1hdQ3i-0007JS-Tt
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 22:10:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <joel.stan@gmail.com>) id 1hdQ3h-0002uI-98
 for qemu-arm@nongnu.org; Tue, 18 Jun 2019 22:10:46 -0400
Received: from mail-qt1-x841.google.com ([2607:f8b0:4864:20::841]:45441)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <joel.stan@gmail.com>)
 id 1hdQ3h-0002t8-0N; Tue, 18 Jun 2019 22:10:45 -0400
Received: by mail-qt1-x841.google.com with SMTP id j19so18011815qtr.12;
 Tue, 18 Jun 2019 19:10:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jms.id.au; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=6f/vDN8UzYXYAWICSwz3/kaEZ9vcmij1v7RkJ/hDmCQ=;
 b=caWR01mHysbKltd9C0umCIG1FEVVP6tAJkmyMX3RqXHn3lR7EOtLMsgz5SJ8FAtrci
 bgF6qaDElmZSYatbzDuCLlsnU4UVFpfCBlWX3Xt0k1WjF69yF8N0NWWjjMHoFLTWfIij
 K4EQjpIpQGvDsUjNa/A23MOaLFcbxj+hR3X4U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=6f/vDN8UzYXYAWICSwz3/kaEZ9vcmij1v7RkJ/hDmCQ=;
 b=U3TiPDEg9snhX0jZIhavd2rYJDk6XeQpdhfKdsF2vFR5pyJoPkM3QsBiXUvR3AKNtZ
 f2VcJZd32sDA321vME8Vi5D9vgLY0wQUdFqo34Zh8YOU5dlfpi3nshXC/zM2wswDOc83
 4A6vfnq3TryzErymyiDneIxKXPo9xWgRm6jUnuRZvxr2lWAHQu+KU8BYeGobgYvNuMzp
 30WlvYphLSrtMoYf/hXR9q2F2+hFYrPOKLaeWsDpgxSmrKQ1UwxsMQ8WMUT/J25Q5ooN
 KCuzyL1JURI9aRpHtxRrF/8Aeyvc1NZy3lzyWTsWWymNzeJujaM+6meXsFtvz4e8VNBu
 O/dg==
X-Gm-Message-State: APjAAAX4d0cCc8l9xv+wzxTpiql8gdzcjIiFOkL35tVTnG6PYbIFJ+Nc
 iNAY1qvWvncvjYDvwLft0ZSkXKts8bK1JF0mO0+1LOJ3
X-Received: by 2002:ac8:2d69:: with SMTP id o38mr89557454qta.169.1560910243508; 
 Tue, 18 Jun 2019 19:10:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190618165311.27066-1-clg@kaod.org>
 <20190618165311.27066-6-clg@kaod.org>
In-Reply-To: <20190618165311.27066-6-clg@kaod.org>
From: Joel Stanley <joel@jms.id.au>
Date: Wed, 19 Jun 2019 02:10:32 +0000
Message-ID: <CACPK8Xcwsf2gshvJxJUtBrPrYsqaa_w7XqC5bmb8wAJRbBhHgA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::841
Subject: Re: [Qemu-arm] [PATCH v2 05/21] aspeed: introduce a configurable
 number of CPU per machine
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
X-TUID: CQJ4ePzq2mGl

On Tue, 18 Jun 2019 at 16:54, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The current models of the Aspeed SoCs only have one CPU but future
> ones will support SMP. Introduce a new num_cpus field at the SoC class
> level to define the number of available CPUs per SoC and also
> introduce a 'num-cpus' property to activate the CPUs configured for
> the machine.
>
> The max_cpus limit of the machine should depend on the SoC definition
> but, unfortunately, these values are not available when the machine
> class is initialized. This is the reason why we add a check on
> num_cpus in the AspeedSoC realize handler.
>
> SMP support will be activated when models for such SoCs are implemented.
>
> Signed-off-by: C=C3=A9dric Le Goater <clg@kaod.org>

Reviewed-by: Joel Stanley <joel@jms.id.au>
