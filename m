Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp669596lfg;
        Thu, 20 Feb 2020 07:05:25 -0800 (PST)
X-Google-Smtp-Source: APXvYqwkIbTM1/Nu+vBUC1jqkg8BO7NH1OyLNWrLC5B9J5EY59EuQjY5dQL9tHPXipYgRaxgoKyt
X-Received: by 2002:ac8:42cd:: with SMTP id g13mr27106798qtm.168.1582211124730;
        Thu, 20 Feb 2020 07:05:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582211124; cv=none;
        d=google.com; s=arc-20160816;
        b=j13lv+hUq8Zd2ZujNUi6vWfhQXEDX94XvsL2geGHZ7/e6E5S/IXTx+4JqEozWqjUIm
         DIT9AA2bjrNbtoENA5USKwIxl30cyXZsQquaodNQW8X7+z6W2+evo7p4+BHjE3CYThb/
         z6ueKIieibF9Kbq8tIv7SHI4IQHrfWNf3fbeqEt98TIzzWvJDRi7LaICGH9wHDfyrC4m
         PfM2OTmb4Spjtajx6lmYHW7CWaqjGKwimqoLkrXCjqL56aCxK+VfoKrfaTPOLwpt2r2Y
         ClTXZdl17lmxxxqoATza2QY1TU48KNYD/gJoaLbYS5dOCyCEGH5y0TXv7nSdQErrQE/o
         MFlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ha7WNp34FymPkhMtZXsI3NKdYl16Zvgi/+5I5PPeEq8=;
        b=aKbdMP+D6TdXyxYsvhcPPR7eilWCraGlkUghENahdhwGhVk1g8w+W/Y0oX+2gElgff
         R1cWeY7DVVDx10vakpxGObjaTjmMdVkQvvSNLuNVRKrZk/5MbBMDXU05rDln3d6P35l+
         CqRok0YxnSUtHVDPPFgqPffQWkmVO9hwLNYxiqlnsKe6+7sVsIUS8Q21igbqGOgAB/PP
         wHhL9n9d4+4CVjvtuenFtcmn/3lHh2iSSXlqoeqGW96C5yI/uTRneI/OLwzm8kL+txZh
         ujk5fm0lrsgx5bfh0wtz9ItOlNlagEyZ+l+KFOfMFBURcs9h0D2UttxlwQPb5H53bkRs
         Po1w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="p0hK/2mF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l184si1627106qkc.220.2020.02.20.07.05.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2020 07:05:24 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="p0hK/2mF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43928 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4nOG-0006cs-4J
	for alex.bennee@linaro.org; Thu, 20 Feb 2020 10:05:24 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:46088)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j4nO5-0006Xm-Uz
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 10:05:14 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j4nO4-0002tF-Rz
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 10:05:13 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:41003)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j4nO4-0002sf-MN
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 10:05:12 -0500
Received: by mail-oi1-x244.google.com with SMTP id i1so27793598oie.8
 for <qemu-arm@nongnu.org>; Thu, 20 Feb 2020 07:05:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ha7WNp34FymPkhMtZXsI3NKdYl16Zvgi/+5I5PPeEq8=;
 b=p0hK/2mFOUGwjvy8WVTEvKpNn8dP1JiIbfxdhoSU71vtH0+3M/S89rLv2rMKquO4JD
 B9sz8UX5o7ZroSjG60TKGXphm6uLNbQ1ennHZht73WDFt8Hd0jPfV4NoG3G5XyAeYMQ8
 pMeOzG2k8a1kkFUXUPVPOfimLCpiFqjdgr+snhjJ1g2ScWd1N05Y5TH79FJiJqi7/sOp
 AkU7CalO5jHMIC8Utr85QGlRJZsbKrbq3KjSCECK2mMEmSYJpx0slHZieRFOn9A+XF86
 dMlhVKkDbQUKW0G0VSMOoAaRYIAmLixmUp7OCASeK9n8a5se2ykeSvGAYwr31W0bqqhB
 R9CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ha7WNp34FymPkhMtZXsI3NKdYl16Zvgi/+5I5PPeEq8=;
 b=r1PRsDq4T5q6u1ffs9jH2dfOUMaN1cMNcOO8iF1Y8f0v8xDxMJ54AC1cuFtcBqkl2B
 NNIxCelqUQ0fO5mEy38UFQyN4qY97B9sVup/72OW8xhN7GSQrp33Hs2DSAdydFHVmYm/
 sZ0HkyRMZNMgwVlLkI3tpKiv4GPwOzS0DNNHzSnlRgZX2CEdNSEmkPl37zKBWlnibRHH
 AbGkWU7C7DjfC99RlSlDNYuLoLoOJJ+77riLGLLmURJEB4VdP41y7K/km1trB6pYTbtj
 JuyhjijHz9lirZjIGTQ82DCvkLi/Pw11ZES7MI7yZPqZQF8cy/lsmEIzqHmXPQeTPT9x
 Ls+w==
X-Gm-Message-State: APjAAAVDEt1TcSMGfG+ifBJfB3dlus7NtimsoPh7LkdWJIF0nOcQtp7F
 HWS5aBzh7r3B3s8oUisxVnESrlJsX2GEFgwVT5R/oQ==
X-Received: by 2002:a54:4f16:: with SMTP id e22mr2432193oiy.170.1582211111909; 
 Thu, 20 Feb 2020 07:05:11 -0800 (PST)
MIME-Version: 1.0
References: <20200215122354.13706-1-linux@roeck-us.net>
In-Reply-To: <20200215122354.13706-1-linux@roeck-us.net>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Feb 2020 15:05:00 +0000
Message-ID: <CAFEAcA-u=j3MYu-Ck0UbMzXXEoB41dx6UbGw15QBEnqBBX988g@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] hw/arm/xilinx_zynq: Fix USB port instantiation
To: Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::244
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Gerd Hoffmann <kraxel@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ayWq0MiRVzFd

On Sat, 15 Feb 2020 at 12:23, Guenter Roeck <linux@roeck-us.net> wrote:
>
> USB ports on Xilinx Zync must be instantiated as TYPE_CHIPIDEA to work.
> Linux expects and checks various chipidea registers, which do not exist
> with the basic ehci emulation. This patch series fixes the problem.
>
> The first patch in the series fixes the actual problem.
>
> The second patch removes the now obsolete explicit Xilinx
> support from the EHCI code.
>
> v2: Introduced summary
>
> ----------------------------------------------------------------
> Guenter Roeck (2):
>       hw/arm/xilinx_zynq: Fix USB port instantiation
>       hw/usb/hcd-ehci-sysbus: Remove obsolete xlnx,ps7-usb class

Xilinx folks -- could you provide a reviewed-by or acked-by
for this series, please?

thanks
-- PMM
