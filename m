Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp496666wrp;
        Fri, 6 Sep 2019 03:04:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwdmYNFvsBP69sQflX2Sv0OWbuQ2mrLboFXU//fyKKzhqiDI68ffkdha6r307SPoVyZqpEA
X-Received: by 2002:aed:2da4:: with SMTP id i33mr8015240qtd.320.1567764298102;
        Fri, 06 Sep 2019 03:04:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567764298; cv=none;
        d=google.com; s=arc-20160816;
        b=N7C71Vh6DXeFk0jo7I2h8D/2XYe+Zc7+tLHLXVNeUBAx0udiAouzYVQRIEfsL5o1lX
         jiRCZ/WtO0CtLzJ//L7RpcfkxoLdvzM/DSPD9W7ALJ10vvmzAh2jb3BC5X8DR4dvfJ5S
         0DKclzcS7Zs5Cbf+vJhjqzyrG4pdw6h19K/TBPAV1vaFeu+7PlpCOWGXDTWL1SGYamRT
         8yggsiRkqatNxvqzSJWAsNYPLeD9KdzVD2DWmrcFzjc0+yt/pbkv+azD4HCr5GIko6R7
         nRF7+if4kQIVV+kChrHCFiT7oxl6T299VNNpRrVXSQy+vYpqVFCDP2EgxmPlN4DpqQ5S
         q/MQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=qi9gD9gku4qKxIxAaWTeVq4DOn1k/s0z8YyfHHT7VhE=;
        b=Ik9SX3IQTqE2Itbs+qKVs91ZPSTW50fPGtiR4HPFxrBesazx9BxM9uL7iXmF1xYmCj
         Czm4t5FvWyp4Q9mZpIbrwGk9SG2o8ty2MSWbRjyCbFVuwUJyj2A4ze+Q0/xXx+SDA4s2
         JVmGkAwi0RpmU9q3ULLbAlNmgZAHsNjYV8IQIIfck0SuwEXPS2jTtQjUZpSyofp2jRCh
         t6AfYhppYcNy84Xc4ntXjt5tbLgOGzfYeg0W9XqfSr8paDSDCmpzW8AIc27LR6Pt2aj+
         qhjAyfy1AEktIZPa/COglEYJYYsl+af/hHMy5Xy3ZM9fOKQdPSs9vFMEM3Sp/zpob3Uf
         Hyog==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="nG6RWgE/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w30si3570699qvf.108.2019.09.06.03.04.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Sep 2019 03:04:58 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="nG6RWgE/";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54046 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i6B6v-0005UL-GK
	for alex.bennee@linaro.org; Fri, 06 Sep 2019 06:04:57 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43263)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i6B6m-0005Tm-U1
 for qemu-arm@nongnu.org; Fri, 06 Sep 2019 06:04:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i6B6l-00012f-Nu
 for qemu-arm@nongnu.org; Fri, 06 Sep 2019 06:04:48 -0400
Received: from mail-oi1-x242.google.com ([2607:f8b0:4864:20::242]:45461)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i6B6l-000123-IK
 for qemu-arm@nongnu.org; Fri, 06 Sep 2019 06:04:47 -0400
Received: by mail-oi1-x242.google.com with SMTP id v12so4440952oic.12
 for <qemu-arm@nongnu.org>; Fri, 06 Sep 2019 03:04:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=qi9gD9gku4qKxIxAaWTeVq4DOn1k/s0z8YyfHHT7VhE=;
 b=nG6RWgE/FYUhvLo5x9Dd3UZIWNmGNrs+wEH/gDm/4uMl3FsnSmZOylW8jw/Env5gk3
 lHC+LTyMu3xRZuoInvEdeNA72OuyzR9yJrGI41JDoOuKuDVLBNxQIaF0Q1NMCe9IulD0
 fVRjq5dr0cn8pVhSqPrRUyvurjwQvRrxruaNBDY3xhkkfeWga1gLW1LLyW7kG9CHJYyS
 VwKuPQZA8cTj3dEeauthB5B+gqwiqX6U38wBIVa+oNncHIAgs8CMPnUGKVz3UaHOBloB
 NLScG1xrgc/D8W0ZqDrcDN84HdufsKzCnWIeMCL6PVsxWE6dZHSKp16AWVM5vgM+uWMT
 5h/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=qi9gD9gku4qKxIxAaWTeVq4DOn1k/s0z8YyfHHT7VhE=;
 b=GRETELAE0q5JEdu4trHSEaX3VHIYPfciYiUkBaqmZ+fsY3cguKqmdp0ebmjgOMbjpu
 UNXMI2xnwkVCkMC+9XpW9Q/103W4Cv51KFnQTq0QIyNQCLn3nE9f0KFaupQ1Q4NS42iF
 OSS6mttLiChcIRCx2aiMMqsv5M8G2N4C6CV13TmT/NNIKOKMOgARIyN3fdjxMI0a5iCv
 9opdsiix8qjyWRQF59ih1H9F7pvT/qMse8e54cY7kj5u4tJCcopk5xyvpCGkg4P5A0h+
 NM8Yh03AJgKHZnyC+s09ICk4dPIZI/QWuEh1UP6QOsDnMeKPVrXVHpWzATXO5kYkY3NW
 BsIQ==
X-Gm-Message-State: APjAAAUoLXzDUKgLegfOtvyfpXN+7R/BUO9Ta+wSyzCeCyK/pjzCv9A8
 C9s0cK3cBMkrTBmPe9NLwY6hGUOsWRmUAnEMIpnkmg==
X-Received: by 2002:aca:50d8:: with SMTP id e207mr5962101oib.48.1567764286680; 
 Fri, 06 Sep 2019 03:04:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190823143249.8096-1-philmd@redhat.com>
In-Reply-To: <20190823143249.8096-1-philmd@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Sep 2019 11:04:35 +0100
Message-ID: <CAFEAcA8DVw8gei9MLbkTExXaSRY5EnSDGXkbCZ1i+mBBR6_6Ng@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::242
Subject: Re: [Qemu-arm] [PATCH v2 0/6] hw/arm: Use ARM_CPU_TYPE_NAME() and
 object_initialize_child()
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
Cc: Thomas Huth <thuth@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>, Jason Wang <jasowang@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Beniamino Galvani <b.galvani@gmail.com>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Peter Chubb <peter.chubb@nicta.com.au>,
 Antony Pavlov <antonynpavlov@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: V4+xJ45DO3qk

On Fri, 23 Aug 2019 at 15:33, Philippe Mathieu-Daud=C3=A9 <philmd@redhat.co=
m> wrote:
>
> First we use ARM_CPU_TYPE_NAME() when we should.
>
> Then is follow up of [1]:
>
>   This series looks at Eduardo suggestions from [2]
>   and Thomas commit aff39be0ed97 to replace various
>   object_initialize + qdev_set_parent_bus calls by
>   sysbus_init_child_obj().
>
> Finally, some devices are declared orphean while they have a parent,
> let them be together again.
>
> Since v1 [3]:
> - addressed Peter Maydell review comments
>
> [1] https://lists.gnu.org/archive/html/qemu-devel/2019-05/msg01492.html
> [2] https://patchwork.ozlabs.org/patch/943333/#1953608
> [3] https://lists.gnu.org/archive/html/qemu-devel/2019-07/msg00135.html
>
> Philippe Mathieu-Daud=C3=A9 (6):
>   hw/arm: Use ARM_CPU_TYPE_NAME() macro when appropriate
>   hw/arm: Use object_initialize_child for correct reference counting
>   hw/arm: Use sysbus_init_child_obj for correct reference counting
>   hw/arm/fsl-imx: Add the cpu as child of the SoC object
>   hw/dma/xilinx_axi: Use object_initialize_child for correct ref.
>     counting
>   hw/net/xilinx_axi: Use object_initialize_child for correct ref.
>     counting

This series is now in master (but I forgot to mention that I'd
applied it to target-arm.next when I did that).

thanks
-- PMM
