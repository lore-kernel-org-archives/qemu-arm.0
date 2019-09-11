Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp684244wrp;
        Wed, 11 Sep 2019 03:31:27 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz2nKweiEyBSCIZgUQ1zpQKD9/pnFQCm2oPQgXd3QLk+4BznZ6Cm3UVtCIOv+2/RgagLkKs
X-Received: by 2002:a50:e701:: with SMTP id a1mr29730849edn.108.1568197887760;
        Wed, 11 Sep 2019 03:31:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1568197887; cv=none;
        d=google.com; s=arc-20160816;
        b=MoKOKM4tXyf73HXJDWv4aF1uUBmCGE2Z0YkBkaqnFpluHhAK71vwavTo3GPfCgZLSn
         BEhUG1A5h0JZyGpX9aQ1MPomxm/K7tsfNS9zbe/9qPQl28rmH+VqdDmz3F/UNoqJCZYe
         fcC6cGoq+h19t7JfElBJhgbilZZKtT3Y0Ro/53lGnwR8T7q6RU2e0j5g6TW5Okax3b4G
         6nm8lKUkjGc2MBOrT/g9wV4g/A23i0q+ja6kww9thn080FatyvIWke4fHhSPRcBEqvMy
         ykxCgExcLJ7i88ynBEml6cG7fLARFHm87N7a/Jo79Vruj3Y3/to6C3Kk8LVuOKQr2xgR
         GHDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=9gJ2FWRKLN27Ge6JM2F8ps8I6Cl1NUkfZtdNCQG6NF0=;
        b=0DN9kOMk/cUJQoXRSpiy7NVKO4p/ZSnqQxlcHsTd1uw0E3o0E8v4yJts20gPYELeTD
         obtbJsJ2Dfb5Q4jSgtRjNmPmDIeZMN4kClJrDO/x3n6PhKl4lfCAZk+TFiOIWesC6bno
         217POs9rZEqEomaPyc0sl5rYTHb1bLdnzWKK+tF105tEF+0hJ5ROhVM84g43XtikaiMV
         9pLKpydDjRitRRPdPciUuwxa+XXZGZIdoKS6ebIsYmARuFiJmsZnS9z+a2KFL+xdnGBj
         LIT7n7Sl5P+WU7ejZOIUbMKtOfc8fHXkLEer+33QSfG5y+rQgMRZ/+aj1MrsUi3a4A3m
         nKpw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bpx+NqfG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w55si13549900eda.15.2019.09.11.03.31.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 11 Sep 2019 03:31:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=bpx+NqfG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49278 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i7zuI-00067c-ML
	for alex.bennee@linaro.org; Wed, 11 Sep 2019 06:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53921)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i7zty-00067I-13
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 06:31:06 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i7ztw-00081r-NC
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 06:31:05 -0400
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:46663)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i7ztw-00081S-GW
 for qemu-arm@nongnu.org; Wed, 11 Sep 2019 06:31:04 -0400
Received: by mail-ot1-x343.google.com with SMTP id g19so22007268otg.13
 for <qemu-arm@nongnu.org>; Wed, 11 Sep 2019 03:31:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=9gJ2FWRKLN27Ge6JM2F8ps8I6Cl1NUkfZtdNCQG6NF0=;
 b=bpx+NqfGle3+MQSSGEeUZG2RJpQAL7wJkuTpljtmu0p+ztAcFOByU/fDr97u/xoF8V
 K/nMGMdR8QDR4X1Xjp4pr2JgwVonigkl/mwOw1V2p5SZXcX5FcPL10V0ZMiGVOWc+5Fk
 oabZ9RrqEGHuOu1Nn/sDuTgw4JY5hiRFw7iVR6aiFrbDcm3vsa8EEoBdQHG22L/W/zXL
 XjgvDYHu/n2jTzbsqfh+DjqAwcqWvLvE4HVcFHkOJXuZBcGSzsvScJhj6ttPTFlP4FMB
 nreBY1z/c39Pb2to1KALIs7WHlIP7bpJLp/kKqLnMf5q9gzxv05bW72EqmXEhq42U/td
 Xp7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=9gJ2FWRKLN27Ge6JM2F8ps8I6Cl1NUkfZtdNCQG6NF0=;
 b=pDjOcwhTmHY0fwaWS0eW02O/DDOSgSbPCPMfoiLWen04nXP30ckdbP57zAFTRW8mtw
 mkGB8Xe0Rl6MUusnPB6wcrxt/Zdf484qOAbs4X8ix2aTT897md1XsAG5OI0tBqHW40G2
 rL4uR/vdxuKupT7HowBcS/b0XEFZv1IVxqeWINFzvZswpucVqje5iSqZtceBLgViuFro
 vtZ+R+o3QYMGd5AR21YzlpuD5Vwz7xhF1j8MWBeVfcfGso4/O3ScMc3BMVXQbE/ygKlt
 m7u5294xDNj6MlX3XNUvUL199njBmXr3DwroHZIN5xQbPPwtQEtFuHk29eVh1YAy2Fdg
 lNOQ==
X-Gm-Message-State: APjAAAWNJusLL2XyEquGPvhoZr0RbgFHXU5nA4+aMWoKZ1nZE592Jo4d
 4w2fauzssY3DQ/4HANkgtMD2LzYiquZCBOz5jlKZAQ==
X-Received: by 2002:a9d:6a8a:: with SMTP id l10mr26025117otq.97.1568197862908; 
 Wed, 11 Sep 2019 03:31:02 -0700 (PDT)
MIME-Version: 1.0
References: <20190904070506.1052-1-clg@kaod.org>
In-Reply-To: <20190904070506.1052-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 11 Sep 2019 11:30:51 +0100
Message-ID: <CAFEAcA9AJVBqfy1MFEdekz66vrR_8Wcm7LMEoBhU3xje6Zo1gA@mail.gmail.com>
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH 00/10] Aspeed: machine extensions and fixes
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Joel Stanley <joel@jms.id.au>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9pqgLVn/lZat

On Wed, 4 Sep 2019 at 08:05, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> Hello,
>
> This series improves the current models of the Aspeed machines in QEMU
> and adds new ones. It also prepares ground for the models of the
> Aspeed AST2600 SoC by calculating the model typenames using the SoC
> name.
>
> You will find patches for :
>
>  - DMA support for the SMC controller, now using address_space_stl/ldl_le
>  - GPIO v5 model from Rashmica
>
> Thanks,
>
> C.
>
> Christian Svensson (1):
>   aspeed/smc: Calculate checksum on normal DMA
>
> C=C3=A9dric Le Goater (7):
>   aspeed: Remove unused SoC definitions
>   aspeed: Use consistent typenames
>   aspeed/smc: Add support for DMAs
>   aspeed/smc: Add DMA calibration settings
>   aspeed/smc: Inject errors in DMA checksum
>   aspeed/scu: Introduce per-SoC SCU types
>   aspeed/scu: Introduce a aspeed_scu_get_apb_freq() routine
>
> Rashmica Gupta (2):
>   hw/gpio: Add basic Aspeed GPIO model for AST2400 and AST2500
>   aspeed: add a GPIO controller to the SoC



Applied to target-arm.next, thanks.

-- PMM
