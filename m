Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp6208077lff;
        Tue, 17 Dec 2019 08:04:09 -0800 (PST)
X-Google-Smtp-Source: APXvYqytPEbxI2LeKRtikoUo8zvv2ZUifFxQF6Ap8mlUba3VbvOuEhaW7qpByhcfwGY8yMMyY1rO
X-Received: by 2002:aca:1c0d:: with SMTP id c13mr1816659oic.44.1576598649390;
        Tue, 17 Dec 2019 08:04:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576598649; cv=none;
        d=google.com; s=arc-20160816;
        b=kskok02QYKlLo6W90e2rnJfZoMDNL6ETtAMioHUU7YEv4JSvKsUdBJAfz3dxNKj3iW
         LMzo0sZKV8mO7ujFxfFdTw52Mjb7bl/mTUhFeiS8HTaMTWcW1MvdHKsFHg8irju9YcnG
         wXyUA5jEhcI32ldiaENjZ/a5iopchFRAaX/+lAMGzrs+gX/+kUFZOif/MZcc1t37Zk3W
         Ve8CNbPfjgt5hY91jfqovEr7T6AaXtFy9WVmc0hTd+4a6asHahox3U8qFQB+EJ634ev4
         QukQez4GGzhsU1xua91mKpgCBF37wphNxZE4ZeR8UEPNBOBwS/fV0ZNduywb4RPz6RzU
         H/Nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q/JxMM3NAomx6ykwazS1RjvqreMPIS0r/3fmUpKXorI=;
        b=DSPNBEEQKa13qhkk4xyPWGdybRDbduNfnDiK6et29eAfG9XMR8dJPsssX7RJWSoHe6
         DdsQCAEiDbgfCNQdU2COc/gaKb79EoBARoqC8oZiqikKRl2Th6LexgSr/CnZ4JX17QH0
         lphyt65UoFD5VSTgQH1aYq3WjLFNIDAVFpNQMVF8Anqu2pdXzBf2EOeMIDWf8NcjwAcQ
         f0C1KmLWHsJvRhr95RmgEHxQKr51nf7NxhfvCFc25KJ8KaZJSqAjKOFNE+TD/P+2PwlJ
         5YdB36qxBnVOfayYp6iBnQV8U2N1EFcZlYqjwZ00L0p1MCncEDSZZMSIBy3aavHCY3OH
         RxJQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=axWRYFef;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v19si8222834otr.50.2019.12.17.08.04.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 17 Dec 2019 08:04:09 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=axWRYFef;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihFKS-0004NC-LQ
	for alex.bennee@linaro.org; Tue, 17 Dec 2019 11:04:08 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:38016)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ihFKF-0004Lt-Nk
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 11:03:56 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ihFKE-0002F1-GL
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 11:03:55 -0500
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342]:34853)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ihFKE-0002EQ-B4
 for qemu-arm@nongnu.org; Tue, 17 Dec 2019 11:03:54 -0500
Received: by mail-ot1-x342.google.com with SMTP id f71so4738555otf.2
 for <qemu-arm@nongnu.org>; Tue, 17 Dec 2019 08:03:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Q/JxMM3NAomx6ykwazS1RjvqreMPIS0r/3fmUpKXorI=;
 b=axWRYFefeye5FfP+zMd5OTAmZRPvQUMATaOUIjVCy01y/g02z276Dwd+UP+AvBEYUh
 j4W2isW0KUNnTOZVYJo3QUorypyQwhQnzY1sEd7OtkJXHxeWlDhu1hlNsUylknMhyQWD
 vij+TnOdp29T+M5Q+zZnE/JqXRWcgv2Lhwt3HpquviOOcIAE5yz7fECqTNplInIoJKJ0
 u0YLGk8y+LU4GtJyyWutVF8/u00Jsb6mKbuBo9avs7IDzarVL68TQXXAw7A5QazbArDA
 IDPDIYaSAC3oi1wwPAMQjttLyHJF4kD3gq1dyRlGoUY6hlCTfyq/S+0DjOzt51gehsju
 wqOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q/JxMM3NAomx6ykwazS1RjvqreMPIS0r/3fmUpKXorI=;
 b=aOd6Vt8RCN3ls4BeBVVh8XmCp6mVqhMFlKp5uUO+QJ5ay7yLbBzQtlnxMw2zOItlqL
 CNBU3MpmKl8TfYn7v9BmjWsUVssZP9P6S7BBm0F1XLV3hIedFy5b3+G5bTP/iTUSCeA4
 mLycDY0fnSZDf22JvQQYlgTG8fhzqmpGlsOlxMBPstB3J+UiNzIhLm2ipMCSAbsQCDw/
 a9zheZL8KSPn8zXbSXBC9W93X4+GWmThTSY90F16oJtUx2rlxKEStpwAP9NjPNluxlSp
 /8LxPQUDu9qXMYpOBknrF6p75gRBjI4LM/eMZquXKztnm4KtrXwHrKHYxHyW7WnT0oOp
 LJ+g==
X-Gm-Message-State: APjAAAWiFPFJTy1LrVSMRYoesRY9pEEn31XWDyxIzFUGD39TxxNMo3H0
 96oajUSRaCBSTwkS4nktkQubwU4vawb5Qy9aBlnCLg==
X-Received: by 2002:a05:6830:4a4:: with SMTP id
 l4mr38999964otd.91.1576598633324; 
 Tue, 17 Dec 2019 08:03:53 -0800 (PST)
MIME-Version: 1.0
References: <cover.1576227325.git.alistair@alistair23.me>
 <40f97ae32a6f21d8184c1cc46fad2defb302238d.1576227325.git.alistair@alistair23.me>
In-Reply-To: <40f97ae32a6f21d8184c1cc46fad2defb302238d.1576227325.git.alistair@alistair23.me>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Dec 2019 16:03:42 +0000
Message-ID: <CAFEAcA8rZtJQsUXJ1E1gOAXzrHihzYvMoodgHhpro1Jd7jkVUg@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] hw/arm: Add the Netduino Plus 2
To: Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::342
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
Cc: Alistair Francis <alistair23@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IxE8N8GkgJ4C

On Sat, 14 Dec 2019 at 02:44, Alistair Francis <alistair@alistair23.me> wrote:
>
> Signed-off-by: Alistair Francis <alistair@alistair23.me>
> ---
>  MAINTAINERS            |  6 +++++
>  hw/arm/Kconfig         |  3 +++
>  hw/arm/Makefile.objs   |  1 +
>  hw/arm/netduinoplus2.c | 52 ++++++++++++++++++++++++++++++++++++++++++
>  4 files changed, 62 insertions(+)
>  create mode 100644 hw/arm/netduinoplus2.c
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 7bfdc3a7ac..881e7f56e7 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -105,6 +105,9 @@ config NETDUINOPLUS2
>      bool
>      select STM32F405_SOC
>
> +config NETDUINOPLUS2
> +    bool
> +
>  config NSERIES
>      bool
>      select OMAP

Something odd has happened here -- your patch 1/4 already
had a stanza:

+config NETDUINOPLUS2
+    bool
+    select STM32F405_SOC

so either that should be in this patch or this fragment here
should just be deleted.

Assuming you sort that out,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
