Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp5300875lfq;
        Mon, 21 Dec 2020 22:30:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxMNnHmgSnW4pVeAz/elVZUVySh0NHf3twfIjQWsxuGLeGVaHSAtW7kHh6mz4ch+bVrusk4
X-Received: by 2002:a25:af12:: with SMTP id a18mr25125688ybh.189.1608618646580;
        Mon, 21 Dec 2020 22:30:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1608618646; cv=none;
        d=google.com; s=arc-20160816;
        b=V3pPrrhG51QY8cEomaf94sFaI8gkilWJ4vVfvm+ATWXbZ8G6MJnh0zGYdWmCf6MguM
         YiuCJ0s3a9ZR5L69k5XM0xi/hyaQ2/NVvUPj1tZiu9XHPG2clbMHdfOZHrkETEuBjt1F
         2d9oLkdYPIyqNEVBPz72g4nVjrf7+Z035xbbel4RqV1spd6/jxxBu4jNy1duD6XCNbKW
         WPiaAvGGUKJbsy/NMjaCNLn4VJZBBFSHaaLspzd9rJP2GeYHmfZ0P+VleRHMA46lKVub
         Nffye4nhat7QUzZZWLPCClioet9hn2hp4YOqVPeltWyqXpp6L1Y2RSi0LnMjdOXlf9Wf
         nvUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7G2s3L5xZ25ucPAWpXYKzv/tzl4wtBBMp6CQzqlpwh0=;
        b=V5rF8F8WvKuKfGlrLZK/nkpFdgd/F6xACzph2K1HxCS0VfT7cOgA23t+8ymF54D709
         8vr18KRM3c273EoOSWz59hmkVbPqgAxwgS9Ao261rVWm/gqc2bbyfb9kufyTpl7Q4MJ2
         jXE9pGwVsYH/kMN/tM7CbxAH7KF4pSAt1rHVGQ8T0phzEKi9ec73AR1HsIyxvCqlopxj
         ujfOY7m1hLonE0VysmyHtR5cmd0uO3b8viIPxbY2+mUYxGYITZEO3VxGWRfeSOgQj7oc
         aX+xbzEUSE46SiVT5gpnMiVRhE9qDIkAjtZ5w2ow0xUbNJaKZ10xqerUYdamqZDTa5oM
         G2pQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=m674ppLh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q10si18889846ybg.285.2020.12.21.22.30.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Dec 2020 22:30:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=m674ppLh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:45200 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1krbC1-0007tW-Ut
	for alex.bennee@linaro.org; Tue, 22 Dec 2020 01:30:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50066)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krbBs-0007t2-7w; Tue, 22 Dec 2020 01:30:36 -0500
Received: from mail-yb1-xb36.google.com ([2607:f8b0:4864:20::b36]:35281)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <bmeng.cn@gmail.com>)
 id 1krbBq-00034a-LS; Tue, 22 Dec 2020 01:30:36 -0500
Received: by mail-yb1-xb36.google.com with SMTP id u203so10872120ybb.2;
 Mon, 21 Dec 2020 22:30:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=7G2s3L5xZ25ucPAWpXYKzv/tzl4wtBBMp6CQzqlpwh0=;
 b=m674ppLhoiUfOl8/9JyD7487FJRaMRsx69WAj0CUsWGLYLzzG9s9pCHp7wNMdxa/lU
 KjOVRYmiUuwu5iWVOrKGPAHX7oyxDV0rL07q1dFnVosQOiXE8I5Ln2Zx0C1Tw5lHrwvL
 U1P9R8S/gs1Nzx5j/QOwThtzzCDdqUmm+dV0moTNnrvQeC1OS/aqXTJg/ROevbmr/P5Z
 v4AtO/ntwnZF4q9CU4m4rfGRKAb/B81LjbYejD7cK9zL1iYjjItQwgbHrlXgutKgs14A
 q97CLhEYTTkIJ8Y/wGQJC0Y6hRAdX6Of4wABh5hHYBxhIEqY7F7LFVD/LfYUH4MGEaEr
 RpUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7G2s3L5xZ25ucPAWpXYKzv/tzl4wtBBMp6CQzqlpwh0=;
 b=H0lReGVOIP+bPOgZ2+UziuC9hsENkeCwUyscOAujVBeCD+eTSP6xOFYfVux+jhRkwl
 vJMHynVpFdmJ9M0IhZfLgYvycH2DC1hrTQnlDH6G1xeIDxjnCfTfeN05070w41G+6ICu
 Fxzd/BytgRUDEuRvHOGq4IaZOHXe1fd3pSIGgmZN5jgXN/se66p0NS87qaoFc8fd/M4K
 u/YnWDVLzT5YmwFajVTrMEaHVp0qs/gBNZXZCNrBkThFLcYDKJBGWckDhSNFgCYV38oT
 JdLY0zMckTNlORg+oHOadkY8A4sO4CapH78bCkhXeV2+OoYxrZdnG4jnx8cWQ1QGlqs5
 MKbg==
X-Gm-Message-State: AOAM531haOvRm3Hq3tFPiyXpmPIhtApxvrkCbU3aKRZBfgfwgg/BV7qT
 AI0u+cUiWFixHWhtOeOaglLju74yfXe2vNUwqcM=
X-Received: by 2002:a25:ec5:: with SMTP id 188mr29073614ybo.387.1608618633361; 
 Mon, 21 Dec 2020 22:30:33 -0800 (PST)
MIME-Version: 1.0
References: <1608182913-54603-1-git-send-email-bmeng.cn@gmail.com>
In-Reply-To: <1608182913-54603-1-git-send-email-bmeng.cn@gmail.com>
From: Bin Meng <bmeng.cn@gmail.com>
Date: Tue, 22 Dec 2020 14:30:22 +0800
Message-ID: <CAEUhbmXV+e3L0RtmC+qfzoY8wVWPwHXY9ZcBZ=e7RMZ_smuMkw@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/ssi: imx_spi: Correct the burst length > 32 bit
 transfer logic
To: Peter Maydell <peter.maydell@linaro.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, 
 Alistair Francis <alistair.francis@wdc.com>, qemu-arm <qemu-arm@nongnu.org>, 
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b36;
 envelope-from=bmeng.cn@gmail.com; helo=mail-yb1-xb36.google.com
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
X-TUID: YrOmjbkcoDxa

On Thu, Dec 17, 2020 at 1:28 PM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> For the ECSPIx_CONREG register BURST_LENGTH field, the manual says:
>
> 0x020 A SPI burst contains the 1 LSB in first word and all 32 bits in second word.
> 0x021 A SPI burst contains the 2 LSB in first word and all 32 bits in second word.
>
> Current logic uses either s->burst_length or 32, whichever smaller,
> to determine how many bits it should read from the tx fifo each time.
> For example, for a 48 bit burst length, current logic transfers the
> first 32 bit from the first word in the tx fifo, followed by a 16
> bit from the second word in the tx fifo, which is wrong. The correct
> logic should be: transfer the first 16 bit from the first word in
> the tx fifo, followed by a 32 bit from the second word in the tx fifo.
>
> With this change, SPI flash can be successfully probed by U-Boot on
> imx6 sabrelite board.
>
>   => sf probe
>   SF: Detected sst25vf016b with page size 256 Bytes, erase size 4 KiB, total 2 MiB
>
> Fixes: c906a3a01582 ("i.MX: Add the Freescale SPI Controller")
> Signed-off-by: Bin Meng <bin.meng@windriver.com>
> ---
>
>  hw/ssi/imx_spi.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>

Ping?
