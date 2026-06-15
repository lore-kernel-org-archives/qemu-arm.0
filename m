Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76C28CD98C5
	for <qemu-arm@archiver.kernel.org>; Mon, 15 Jun 2026 12:18:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wZ6H5-0003Q8-9t; Mon, 15 Jun 2026 08:18:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZ6H4-0003Pr-HG
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 08:18:42 -0400
Received: from mail-yx1-xb12c.google.com ([2607:f8b0:4864:20::b12c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wZ6H2-0003rs-Sd
 for qemu-arm@nongnu.org; Mon, 15 Jun 2026 08:18:42 -0400
Received: by mail-yx1-xb12c.google.com with SMTP id
 956f58d0204a3-6605c3453f2so3427233d50.1
 for <qemu-arm@nongnu.org>; Mon, 15 Jun 2026 05:18:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781525919; cv=none;
 d=google.com; s=arc-20240605;
 b=FHg+nfQhCVNrQ4KbNmzLRi/N77SaY4DlSl4ZULVdUx7MPDJPKyfj9Lnlr3ab24rQ/2
 fYsUbHEbS/IQaJRuFhg0LV7TeUdCg8D79rMN0RFxc18AzboXAlMjHfvBMTRJVkBvJUnm
 emLAaaznY/En0ip1V9pDXWW8Yxwu8BvLDM40JeemiYG6bXA8/DfTiS45VLClnqdXXpW8
 ZTzHKfD2B1ZcfxAeVTybkKd+RtOHZ6IfDyQu/A9P/UdSdpNeHbaPj5Qp7z2qMaodZnb+
 CIaqvjAjJ6cT86oLNf9tlbVP4qvzJyE/t5bHamYdzeEEGPOBYgDt6HrmaMm8tNcAeZDb
 Xaug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=7SzBF98pEmxkKVc3fcTH2J/ZOuXUs4Wufa6y76QZkwk=;
 fh=R5FmfWn1ipgwl4eatu1ImMA98D8TgxbsuROOoXq8YQI=;
 b=ar0KX/0uawhN23NH+Y1UQ1NnX3CPmNmLfZ7Y1wKR8dKHFhlyj/rMoc5kcopTNkBOkl
 G6IfSZ0ZAApHZWs/1HvuZ0I7sprvZhGMUn8y0WP9DpHckxcU6o/pULzs08KIRMJ7dEyl
 fGlT3CTEim8peCwjlHMvwvQ/L3RUnoqziBDmJHg77OPdHtXjINJsr07AVM5lvIToH9Wk
 RXMwqf4gdg61RbJ62GNJccvTRwC+q5jdh6msnucWANbI9I2cCIJddsCgZdCZpT8slmoB
 xID73kMjpyRGe8RG585mIUocTsep41J3ftP3mG/jejRZphHlabV7HyC/A1Gri4dBSTZ7
 Hqlg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781525919; x=1782130719; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7SzBF98pEmxkKVc3fcTH2J/ZOuXUs4Wufa6y76QZkwk=;
 b=IUPI1AvzQSJ8HZWugVMdtud4PkpxRng2feWgl6xW6EIqYBl6e91jJkHNCO9yP6jjor
 sFL4/kQAPlYfFH/+o775pppGEY114rtPjlST9l5J9ALYkHDUsMVeMM9MEiq6dDcaGxTS
 Q/nr5t9KaQ9h6QL3WIBkPt049e9XmLZG2UZWk1NgMJ41eGDUN+vhkfZLgtOZ/uqTt/F6
 d4sX7jG/OBbFeX6ccL8KiZ9SR5QcKdoOQo6bteFHDIq/Urj2PT07FV5iOc33yb/hfBkV
 x455vKPKsppOvxUDc9thl+4FiVWBYrF2IwdsOaEl5g5EGjkHZi9w5B397+UJtOb+WTFq
 aAag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781525919; x=1782130719;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=7SzBF98pEmxkKVc3fcTH2J/ZOuXUs4Wufa6y76QZkwk=;
 b=T+MqMvqcyOro9X+iRlNTqhlFSCEuHl0YW1q4trh1UJOSWPjiboR1rrgxYJMwDooRMo
 NpdsHWAB8uoO1hiE8lgCM/hHoXBAPyk6S3PXqDRCaTkj5qpnwMVA7eVkP/fUuJDs/jQP
 XabwjkWGbv+UMOh4kDVhStVRcQCYPZADKO1F/E269C/AasTztbN53PHJ33fzv59lLj00
 SWs9yMLFle66V0JW5oBmsF1hMSyR+boRbeybPVR3zhaolwGL7yIWwrrdlkw5CUcks2WW
 pzsfAaY5P4+bHsqQ6iwRaVY/i1fqrKMOnCTUKmhu15A51EjT7eZ3Ci1FNYqVs4Oc1yjC
 pBNw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+jVwv0xlCkdxDx0mywc3jxpVVS71pH3Enwn6lYZbaaiN0pgyN4iGxGMHnFrlXTrOOKuHlr04xMKA==@nongnu.org
X-Gm-Message-State: AOJu0Yy0JgMXattq7isFaxM68qG8uVn7BIqTS6tSPmlMXAZpvHDjBqa7
 sHiTsPfEJke1fxfPn4SHy5GRW5u0tIbzCT3hwgR/yl6LL2SzyuakhfUsFIUE1MjbrYCu5RtKZW3
 tyItL+FJBcxRjlAboHxSHc+GBUw7TUcXKYwW/IJaa9g==
X-Gm-Gg: Acq92OEHd4eyJ77nHVIDM9UxozKxBxzSIPthm2g6FMrCJKr4lH3HYgexAj9TuTgr760
 YyadtErjdZd/TAv8J+CjvUlW9qQ4EYzSWDAMMw5RUcADqXhf4gWFDZOTQjm3/bIs0UTjXhVCfNS
 E3azlaWiHCm2FcRH0ec4LbYX78h6qvzKTpAvsUXOVWp2ZWjASCd0DgIqujltA4yA0hHk37+HXP5
 zs7HPiKwYuO9uX6Rz2HhiHCApWRivAbQgFSD837E+o4qEJ/jlCnEbvoco3A4e8CUfIn6H7Ek27a
 rx75wwzCwsSEnzKhzqaINquThETFt1FsRZkeBPYrj/ITcmrI0P9607/ZyNmCVM7IGU8=
X-Received: by 2002:a05:690e:b4e:b0:660:8e61:1a5f with SMTP id
 956f58d0204a3-66284e3748dmr9011653d50.16.1781525919306; Mon, 15 Jun 2026
 05:18:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1781111270.git.matyas.bobek@gmail.com>
In-Reply-To: <cover.1781111270.git.matyas.bobek@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jun 2026 13:18:28 +0100
X-Gm-Features: AVVi8CcSB1jIm5O4ojDUihCBSn1i3fRmVvzDDlqpEunZgx0Ryu_YRgGyAcDr8sg
Message-ID: <CAFEAcA9aX4nhhGW-CxABO80rja9OG2LdwXyJs37=1eyFwPg_ug@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] hw/arm/sabrelite: Add FlexCAN support
To: =?UTF-8?B?TWF0ecOhxaEgQm9iZWs=?= <matyas.bobek@gmail.com>
Cc: qemu-devel@nongnu.org, Matyas Bobek <bobekmat@fel.cvut.cz>, 
 Pavel Pisa <pisa@fel.cvut.cz>, Bernhard Beschow <shentey@gmail.com>,
 qemu-arm@nongnu.org, Marc Kleine-Budde <mkl@pengutronix.de>,
 Oliver Hartkopp <socketcan@hartkopp.net>, 
 Nikita Ostrenkov <n.ostrenkov@gmail.com>, Andrey Volkov <andrey@volkov.fr>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 15 Jun 2026 at 13:15, Maty=C3=A1=C5=A1 Bobek <matyas.bobek@gmail.co=
m> wrote:
>
> This series adds emulation of the FlexCAN CAN controller, version 2,
> found in NXP i.MX6 series SoCs. The controller is integrated into
> fsl-imx6 and the Sabrelite ARM board.
>
> The chip has two FlexCAN controllers, but the Linux Sabrelite
> device tree enables only one by default. Linux kernel with both
> controllers enabled has been tested to work properly (using a custom
> device tree).
> See docs/system/devices/can.rst for an example of QEMU command line
> invocation.
>
> More information about the implementation can be found in my bachelor
> thesis [1].
>
> Changes from v4:
> - renamed can in fsl-imx6 to flexcan
> - corrected attribution for definitions borrowed from the Linux kernel
> - rebased onto latest master
> - Link to v4: https://lore.kernel.org/qemu-devel/cover.1779986496.git.mat=
yas.bobek@gmail.com/

Have you fixed the clang sanitizer array-overrun bug that
I reported against v4?

https://lore.kernel.org/qemu-devel/CAFEAcA-diz0Bh1Ah87MPXxkDcvxF58tACTcxxJw=
68xtw8pTfLw@mail.gmail.com/

thanks
-- PMM

