Received: by 2002:a0c:cd0f:0:0:0:0:0 with SMTP id b15csp2919102qvm;
        Mon, 20 Jan 2020 06:00:07 -0800 (PST)
X-Google-Smtp-Source: APXvYqwKzV8VxHW3LZ6reE+7NOejRQo770oNMSFlIDoscUowgI7Ze3pyWUb4Q04beFo/MdAXHjie
X-Received: by 2002:a0c:9023:: with SMTP id o32mr20786924qvo.110.1579528807019;
        Mon, 20 Jan 2020 06:00:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1579528807; cv=none;
        d=google.com; s=arc-20160816;
        b=pbava6b/A2M8mgRRvNmr6pVg7WSSI+mh5KHlq0WynrD3e8bYgniBKKU4v7B+mdmt1C
         pGOW7PgBD8FxdwPVyxTPAxOWCVFqmysMqb0zpzIi7vk3izWD/5FdKMQNCoidN5L/+C7x
         MyjodWiQoMTEVek9guGJ23A9VjFSi8yhKsfByyKoMzi0N2EFOR2n6njXP3GC9PkrhhbE
         SiPvzLSjMrTcPIQw6eLZV5cxS2QYWNkbjLZ37g6MNohyMeA1Az/1cIEdrPLgaanWZEFa
         cwvQD2nUCCQZsrzAAAU4JnVrXeITQEMHeaHvhjKpdT/ZiMFrtqGOHgftO8Y1hopGJKOI
         ZrcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9C4cxku4EuN276kH2zSsBROBZcYr/SLI9wjT+E0UXR8=;
        b=ZmgE+I2eCnR2td6vPaIboLQf4Aulz8WYw19LN2aBktVN/rf0xWFPX+/qPxWjTMKhJd
         vFM/YW5S7XIH25I5GbGwLOTomxYi8ukK7eZOJ75tph/V0GGyj+tmmgapf49YsVlbE0t6
         W5giEbuHGlei6IVCN6hjXvbMlrPnU20nmaw1FGCirh3DL2Y0+Tvxly1buyDWzmvay3W3
         +facfBuCDib50PO8BxAfKlOTbcaalGsJe9vFasRrqHAsCa8FdmZ+HI6kIjfhjbUidgHJ
         GZ61UKrfqigKuYade0EeQAvlxL/vuvwKKBtUwZvZoZ+Tvc2LH6VmQvtyf/fEQD/FG29T
         mysQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uBUcvIbB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m23si11679587qtn.132.2020.01.20.06.00.06
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Jan 2020 06:00:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=uBUcvIbB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:36972 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1itXb4-00037P-1j
	for alex.bennee@linaro.org; Mon, 20 Jan 2020 09:00:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:37283)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1itXat-00034p-6Q
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 08:59:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1itXar-00077I-4B
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 08:59:55 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:42775)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1itXaq-00076f-Vy
 for qemu-arm@nongnu.org; Mon, 20 Jan 2020 08:59:53 -0500
Received: by mail-oi1-x243.google.com with SMTP id 18so28557819oin.9
 for <qemu-arm@nongnu.org>; Mon, 20 Jan 2020 05:59:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=9C4cxku4EuN276kH2zSsBROBZcYr/SLI9wjT+E0UXR8=;
 b=uBUcvIbBcJnPn9jXudVl9NQEZMpDDdH8JEkC3blzx7aCUgc+GKS0sWopY2F7b8SqOa
 JZV9r1Ua+3Q+Yi8cFkK7aqFT1B8iHGPuA5j36DEGTHF1vSx/yJXwpzoZd386SsQWjXf3
 7eiZKhRVv4yOS+R/7Pg2diTMe5Wy6H5T3CmOBudAJREx8xtOjcqmclgRVjXZpU5UvDEb
 u+ipOMWsZiAJ3pP5aoC5gsm09WvdIzTiTeMcZNCkg7BcN6FMM3UzMtlgMn0NCk0qBIYs
 aH6G+Vudd0wSxGg4ZaraKBmsUCZygFCg8c+Max4rANLk8DemGI4T7yIy5reTB8pO3dpe
 eAAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=9C4cxku4EuN276kH2zSsBROBZcYr/SLI9wjT+E0UXR8=;
 b=s4AVXONRRpN6SKkh2aWorpgL3Vb9f1oW5v1Z5w5v1AmnO+aVoKqKeQwnLZ4Z0WvYPa
 ucDUdnRtE5kkfbG6sWffAKsXKKjelCpYCMIUdYaYIrAkjhVu6mHwwNwnGSHzRlrHxEO9
 0DC9wLVjFkUdxGjHbmpxGWzmI18bkUa/lOIHFxPF9dIBvLGaurhAWJrjbp8nzaTv0gO0
 KP1avGqt4Gr6sqqKFU3DdFJYBmHaOjEZ/l1BLxuB5IRz5XANWjYvsuIIMBYsiFsl97Ka
 fVorAtd56pDRXNDIvWcpOPgDL9t1WZXkiRBwkMK+8AFxPy/mUF5n2K6jb+dzmCRW0wNX
 n4/w==
X-Gm-Message-State: APjAAAUeNxAswAmiN/53hJbQbXwFl4hQ1s2pj3FzhxRks23NTXkQoXJK
 21LtsHe9MwJUYno6ndNaXNf9OmLzFT1HIa9OKDdQXw==
X-Received: by 2002:aca:d78b:: with SMTP id
 o133mr13086702oig.163.1579528792161; 
 Mon, 20 Jan 2020 05:59:52 -0800 (PST)
MIME-Version: 1.0
References: <20200118164229.22539-1-linux@roeck-us.net>
 <20200118164229.22539-8-linux@roeck-us.net>
In-Reply-To: <20200118164229.22539-8-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Jan 2020 13:59:41 +0000
Message-ID: <CAFEAcA9ADoUh+eKXKMTv2x=ubqTiyENNdKxuwVHfP3t6=dZXUg@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] hw/arm/exynos4210: Connect serial port DMA busy
 signals with pl330
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: Igor Mitsyanko <i.mitsyanko@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: CHiuuQAvVkJJ

On Sat, 18 Jan 2020 at 16:42, Guenter Roeck <linux@roeck-us.net> wrote:
>
> The Exynos4210 serial driver uses an interrupt line to signal if receive
> data is available. Connect that interrupt with the DMA controller's
> 'peripheral busy' gpio pin to stop the DMA if there is no more receive
> data available. Without this patch, receive DMA runs wild and fills the
> entire receive DMA buffer with invalid data.
>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
> v2: Context changes; improved description
>     This patch has an outstanding review comment, suggesting that
>     uart and pl330 device states should be kept in Exynos4210State.
>     I did not address this comment for a number of reasons.
>     It looks like the problem is hypothetical, the problem may
>     apply to all devices created in exynos4210_realize(), and I am
>     not sure I understand what would need to be done to fix
>     the problem for good (ie for all devices created in the same
>     function which have the same problem). Overall, I think that
>     handling this situation would be better left for a separate patch.
>
>  hw/arm/exynos4210.c | 42 +++++++++++++++++++++++++++++-------------
>  1 file changed, 29 insertions(+), 13 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
