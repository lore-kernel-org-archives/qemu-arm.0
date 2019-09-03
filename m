Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp1044461wrp;
        Tue, 3 Sep 2019 15:55:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzf9wC4KMA6Il3Vtkc9P0L1NzfHNA5MiR2UqT/eHt4949t2sfVHkQXVQit/OUm5QvjjWnc8
X-Received: by 2002:a05:620a:118c:: with SMTP id b12mr183379qkk.336.1567551347742;
        Tue, 03 Sep 2019 15:55:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567551347; cv=none;
        d=google.com; s=arc-20160816;
        b=YJzwSLpMTmf7OgAVKQxOX+IMBQs0yNXBfRxlMv9l48icnThXlWtSaUL8xvAXZd0Mvy
         qVj4RkVrBnAx9Aaa79R9Z6RZrc6Q7+5+qx5S2MUVXBbx+pAQxP0bpNASCnGStHfgMTk3
         60jx2WnxF64xJ8hiu9rDawoeOZOPhBdRvuxzREQDWlVoUuBuBxVzKgd76IBu/lQFIeOZ
         3g835/ysEEbM5HgGev/zLR0LnJ2ut0ShW4ItzR3stRYqeZz8aUozTcfWGcMO6PjPgEgT
         RAAhPQKkMrrh6BRXmkbHBz+2YnSJCItoAEeNMUjSTZIlRjo+zT/o3g7Gux5RlgdOyngH
         alLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=+8Z7lgG57vQ2/yBLQqx76xo0fBYpHJQthGArthUlr+w=;
        b=Q1oy4O8GiN9dEPXPgbTbfqlq2zaQXh3tD/xk2Squlc74kuU/6h6shXke9vrPPn0zAp
         FUSHZ+haOas1SXRW/Sk9rMWiV1kGoNoXCv8EpZQWDTlUQlH6hcmpvdbBWXIIA6fgh93/
         +E0NXiTSsv+fWXIXz2mt2cJhBVJDhgQ56d9JPdJZil1g/rnWnc5n6rHo+qKT0xvBlO+7
         5PYHH7VSEZ+hYgXcsOVvH18smc3F1lloc+fPYR0tciugqGz5w0WC+2p6WHlGCmhhCsDG
         FbqblIrrfqyrLPPN93gqM23hCd+luv+lBNQR8d7AP4dWr8eNEh6SPl9a+dtzavaB3xYD
         dMpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ownyjE0r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c9si10760316qtm.230.2019.09.03.15.55.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 Sep 2019 15:55:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=ownyjE0r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:52224 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5HiF-0008Cr-5H
	for alex.bennee@linaro.org; Tue, 03 Sep 2019 18:55:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44909)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <alistair23@gmail.com>) id 1i5Hhu-0007vL-D9
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 18:55:27 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <alistair23@gmail.com>) id 1i5Hht-0008FA-AL
 for qemu-arm@nongnu.org; Tue, 03 Sep 2019 18:55:26 -0400
Received: from mail-lj1-x244.google.com ([2a00:1450:4864:20::244]:46962)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <alistair23@gmail.com>)
 id 1i5Hhq-0008Bh-Rz; Tue, 03 Sep 2019 18:55:23 -0400
Received: by mail-lj1-x244.google.com with SMTP id e17so6695156ljf.13;
 Tue, 03 Sep 2019 15:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=+8Z7lgG57vQ2/yBLQqx76xo0fBYpHJQthGArthUlr+w=;
 b=ownyjE0r+JBG92A1Qf1f0GxvHa9KhgFOhwhe3OAm9OqCOVowc/T2iTHorzJB47pXNt
 AjuTpd+ShfRN2dB0QNwWLIIwe7DMzLvmvvZiP108Jg6xfhm95DsG/YVtMbbuIqcEIIOP
 vAlFPzA3vuu0C/I4y+i7mSGKnaa8dYZQbj20IpWFiDOL0x4uHwqgpWBGmHyc28Xe3aqm
 0h6DENZfw4CMc85icZeR+dz8hDaT0Dr9wdr5UrExlWNdSin+Fx5ePCnUNBzOPM2CAi8h
 47i12YGvGaC14hjjox4ZhRxjhaQYHZfgytoVew8nSUdVy3k9LD0YKVoJqHEmiGzFRAqe
 WUXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=+8Z7lgG57vQ2/yBLQqx76xo0fBYpHJQthGArthUlr+w=;
 b=NFwWU8zqwc3W3r1iIZ6T3q9KUSU48pnXZ2GJ9GgKoTdqAWA5XCeCW2On6AkzGgfSbn
 3a9Kw/mekEt8wJryHQ8xV0ymIYWSoEPtc+FCbfEYy+JP4jF6+lImkAC9DxQJBKbbF6na
 sWA4DNQoLm17h77tmcqwPwjDVCsLp5m8xz4FQxCIGGfY38uoL5VzZctDIxgeC/fhHxQG
 cLooo++h/1cKr6IxN2HsImy9BN2semxYuctNAO8wYhibaM0uKLebbUNgciEr2M3MY2wS
 F9G0NMLuNBz9TEj3xp2n/Y0kLELfKkd3SM94WFUDUx7ttiLzzNZxCd/ld59xFFe5WXQP
 ekWw==
X-Gm-Message-State: APjAAAWT/nTX45lILJU8DcDGNJi69Pdr0n3xUyDi1kKOD7WH0uvZ7EC7
 qAMHoALC2Z0TUIEaifI413bnn2Z869gHW+xCYStT1dX5Ya8=
X-Received: by 2002:a05:651c:109:: with SMTP id
 a9mr21100413ljb.33.1567551320702; 
 Tue, 03 Sep 2019 15:55:20 -0700 (PDT)
MIME-Version: 1.0
References: <20190903114729.3400-1-philmd@redhat.com>
 <20190903114729.3400-4-philmd@redhat.com>
In-Reply-To: <20190903114729.3400-4-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Tue, 3 Sep 2019 15:54:54 -0700
Message-ID: <CAKmqyKNdbbhc+knpetPvsHxHV=tNvNsvvzBCkijgSsGju1QSgw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v2 3/5] hw/arm: Restrict
 pre-ARMv7 cpus to TCG
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 "qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JGzYiZTrjNBS

On Tue, Sep 3, 2019 at 4:48 AM Philippe Mathieu-Daud=C3=A9 <philmd@redhat.c=
om> wrote:
>
> A KVM-only build won't be able to run pre-ARMv7 cpus, disable them.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
> v2: - "depends on !KVM" -> "depends on TCG" (rth)
>     - do not modify default-configs/arm-softmmu.mak (thuth)
> ---
>  hw/arm/Kconfig | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/hw/arm/Kconfig b/hw/arm/Kconfig
> index 76a2a6bcbf..1c359a6f47 100644
> --- a/hw/arm/Kconfig
> +++ b/hw/arm/Kconfig
> @@ -1,3 +1,15 @@
> +config ARM_V4
> +    depends on TCG
> +    bool
> +
> +config ARM_V5
> +    depends on TCG
> +    bool
> +
> +config ARM_V6
> +    depends on TCG
> +    bool
> +
>  config ARM_VIRT
>      bool
>      imply PCI_DEVICES
> @@ -23,6 +35,7 @@ config ARM_VIRT
>
>  config CHEETAH
>      bool
> +    select ARM_V4
>      select OMAP
>      select TSC210X
>
> @@ -32,6 +45,7 @@ config CUBIEBOARD
>
>  config DIGIC
>      bool
> +    select ARM_V5
>      select PTIMER
>      select PFLASH_CFI02
>
> @@ -61,6 +75,7 @@ config HIGHBANK
>
>  config INTEGRATOR
>      bool
> +    select ARM_V5
>      select ARM_TIMER
>      select INTEGRATOR_DEBUG
>      select PL011 # UART
> @@ -86,6 +101,7 @@ config MUSCA
>
>  config MUSICPAL
>      bool
> +    select ARM_V5
>      select BITBANG_I2C
>      select MARVELL_88W8618
>      select PTIMER
> @@ -99,6 +115,7 @@ config NETDUINO2
>
>  config NSERIES
>      bool
> +    select ARM_V6
>      select OMAP
>      select TMP105   # tempature sensor
>      select BLIZZARD # LCD/TV controller
> @@ -121,6 +138,7 @@ config OMAP
>
>  config PXA2XX
>      bool
> +    select ARM_V5
>      select FRAMEBUFFER
>      select I2C
>      select SERIAL
> @@ -232,10 +250,12 @@ config COLLIE
>
>  config SX1
>      bool
> +    select ARM_V4
>      select OMAP
>
>  config VERSATILE
>      bool
> +    select ARM_V5
>      select ARM_TIMER # sp804
>      select PFLASH_CFI01
>      select LSI_SCSI_PCI
> @@ -327,6 +347,7 @@ config XLNX_VERSAL
>
>  config FSL_IMX25
>      bool
> +    select ARM_V5
>      select IMX
>      select IMX_FEC
>      select IMX_I2C
> @@ -334,6 +355,7 @@ config FSL_IMX25
>
>  config FSL_IMX31
>      bool
> +    select ARM_V6
>      select SERIAL
>      select IMX
>      select IMX_I2C
> @@ -349,6 +371,7 @@ config FSL_IMX6
>
>  config ASPEED_SOC
>      bool
> +    select ARM_V5
>      select DS1338
>      select FTGMAC100
>      select I2C
> --
> 2.20.1
>
>
