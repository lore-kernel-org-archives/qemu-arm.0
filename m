Received: by 2002:a5d:6790:0:0:0:0:0 with SMTP id v16csp2567777wru;
        Mon, 1 Jul 2019 04:57:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzjFcv9+hUrm8JSo4lbRn4Jzzu7fkW5CnNswWbrNDl/lEmKkAgX86D0xb2IGp+Hn5YTWTDo
X-Received: by 2002:a50:a48a:: with SMTP id w10mr28784847edb.1.1561982252981;
        Mon, 01 Jul 2019 04:57:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1561982252; cv=none;
        d=google.com; s=arc-20160816;
        b=lMvEjM3pp5zRUgvksUroyv0MtGh6KoBFasCUKS1b+wCJXx8niOq+5HrQhBUxNiO8vt
         5PBKLcup5gswqY0SB7+gIRSc6P3TsO/A3tvm6nMb14S82/S9XnqsQ0ZV3kUjR1nKmPBs
         AKpO4wfgoaUWNRan/WPB+pLJgNBk1MKOGJ/78RQGV+WprmtnGIfGGOGJ6mSV35jHtbI0
         gsA8InLG6EmHY5/zxDqfX33G8IZTl3gmIhpJipDDwu4SObVee3kSkIODXouPgWbi/+f+
         vcxQEm01B85Ln2Q0AN/rnEUFbDMiftvHw21H0rNaO/uqiQ3hjH6dJo6x+RLYFnz/5ZSA
         KYBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fM83QGm0HZFZIT205rVupzbm0V7pt4s+8qOZpv9c5nw=;
        b=nrgI/rsstSVtX2OQkBpZCgmXPqjhOYIFxFnvOfc7Kv6zkqQZ82TE1/i+6+Hjl2B9WA
         7NK5W0yG+LML2mu0+3S5w0S/BvVkGY8yIzhtpmLY2dhMMoaJn0KQADrRszR4sAuZTYu/
         ZJ7AyReVvGPql30PMIfT8ycrdtAA//YbNpKlL4t41oXR5XB/Gerk2uRe7dUaFfYypjPK
         l35b7wxLBKOfLmxmjjUxpKnSaMuGZrVWrxZ45chzkN1dTykxHQwHkjX6HcgbQu0afqnv
         i9t41IrqlE1OkKsT2ycBN6/D5vIs93rYPPm2RGFXytb0R5zJnj/6cY/SEuUR/gajCeXT
         M+Tg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Cs1mIuWD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z2si8363343edh.303.2019.07.01.04.57.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Jul 2019 04:57:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Cs1mIuWD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57566 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hhuw8-00066W-34
	for alex.bennee@linaro.org; Mon, 01 Jul 2019 07:57:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50836)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <peter.maydell@linaro.org>) id 1hhuvH-00058j-6F
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 07:56:40 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1hhuvG-0003mN-9y
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 07:56:39 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:39075)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1hhuvG-0003ld-4Y
 for qemu-arm@nongnu.org; Mon, 01 Jul 2019 07:56:38 -0400
Received: by mail-ot1-x341.google.com with SMTP id r21so12520788otq.6
 for <qemu-arm@nongnu.org>; Mon, 01 Jul 2019 04:56:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=fM83QGm0HZFZIT205rVupzbm0V7pt4s+8qOZpv9c5nw=;
 b=Cs1mIuWDF+DI5imKO20y6f2YpAxNiKFA7j/8c2W+N73CvtIwPQimnZcMCarzbKXs67
 +KZedhjzJ01vGtoGdvKW57m5b0DYYPvnSSNLkfWuBkmMSHqYjxQJTCIrFjHrUhEnTe8w
 stOWgrFwitmPK09hi+ys6MtN86nhc83kD7aSie+dt/Vnl1Xwl2VGp59Z1sNI+VFJ6FAZ
 C8BIe9bmTHCGpPzwVTtihoE3omA7E91I6pBJM/yuaqwX+3XgvJeRdApRPl32vU+cUHrF
 /noJKVwdu5nD+rsceClZD0lMxa8RAtTeaqgNiiIkmBi594/spyFW4sbjUSi+RXBgBwq1
 EYBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=fM83QGm0HZFZIT205rVupzbm0V7pt4s+8qOZpv9c5nw=;
 b=uISa3WOM61vYnMcZd70rPczW2md1MaG6TjQzzt43EaDTUTMkz7OrBNk4286b0zGQ15
 /87CmtCiWcVI0cbbeZpaLwXHvO3xvEgPQK/s73dpaTnrwmucqCNOIOpHhmMfjrs9Ebtq
 O6d+hhMh8T/0BQv5SzOWpP5ykIkCC1wwZQjacp0Rs6ko2mcfBqPlyrkjAOdLQ9R8j5cO
 Iu536rIgkMPcOGK1D+U9KHvk4ercBkfd+3p9vPTBlPDBFvoi+pJg7vZqg6Dg+A85amlb
 SxF3jMY3d9MJCXt5irFeR7KHtmW6pdg4GreXn1J42YDtEOn2q0K1Y9q64TvsJ/i1qg9t
 egng==
X-Gm-Message-State: APjAAAWa5Hrjg0n423gF0XkD3C6XMXXU9CfF0UfdXm0Rpfyv0PWHl7OQ
 2lB7+VrwSic+4M+aqMr6fB/NB0bl/yuPFthBs5+r4g==
X-Received: by 2002:a9d:711e:: with SMTP id n30mr18251401otj.97.1561982197082; 
 Mon, 01 Jul 2019 04:56:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190416013902.4941-1-andrew.smirnov@gmail.com>
 <20190416013902.4941-5-andrew.smirnov@gmail.com>
In-Reply-To: <20190416013902.4941-5-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 1 Jul 2019 12:56:26 +0100
Message-ID: <CAFEAcA_eGUy5y+e_8buBy3yCB78BeyAxZawMFU2j-h0TOF98PQ@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
Subject: Re: [Qemu-arm] [PATCH 4/5] pci: designware: Update MSI mapping when
 MSI address changes
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 "Michael S . Tsirkin" <mst@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HukKxVexRnqK

On Tue, 16 Apr 2019 at 02:39, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
>
> MSI mapping needs to be update when MSI address changes, so add the
> code to do so.
>
> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
> Cc: Peter Maydell <peter.maydell@linaro.org>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: qemu-devel@nongnu.org
> Cc: qemu-arm@nongnu.org
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
