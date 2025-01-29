Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp3935111njk;
        Wed, 29 Jan 2025 09:55:35 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUzTUXdKEz+SPXuA4NeIu0e404IhKjb/MZGDNHWLGVJ8x/AKjwxxboFwov0AreW1e9zrUtgtzvX9u6KGQ==@linaro.org
X-Google-Smtp-Source: AGHT+IFIRLkHNNOfiDlW05GgksMZyJNN9CU5avz+iryHOPNB7Xyx7khKTKWXmJ5iQIYwMOdMRRgw
X-Received: by 2002:a05:6102:fa4:b0:4af:c5c8:bb4c with SMTP id ada2fe7eead31-4b9a5272b50mr3902496137.16.1738173335238;
        Wed, 29 Jan 2025 09:55:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738173335; cv=none;
        d=google.com; s=arc-20240605;
        b=DWLEz/9Kh8iB06eGhUH49WyloVFCg/iCBIDdJDyUpx3tnZoXvFseXA8rNp0pGfkRuJ
         SMVoRKPrSPgAx5DvCIjjDsF0+B+OR0PWSfeCoyr+az+WcafxW2J5y/8OVM6ZBUPHm+qA
         qSV2keRuRb9svWSyGBF6oVx/pHtZlKBLVIKDcm3OHn9hyHwJ3Wqk09ppo60bEcnBEmES
         dywsph6NphuQUykUrbr9wLM3wfE3kLt59BjJDrkPZG60cc4eh7jk34UcFyp/GxLWyxtV
         anrBab0UA983STDciv7CKt2ae2UjY7U/nYKcqfUowcSWxwRovCFV7Gfjb26OtAtkvWts
         IY4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=4N5FAUM8Ca+sG1njUGdBzUIccLeUzGXBii7clp0dWBE=;
        fh=if0Ke6TknvgYgABzFhYLOe92SFm81IMISIMQW1LWb8g=;
        b=RKwPZ6IAUemuFZ3B3LZlDUYK8pKT1l0GOnO3Lk5aKRfybxS9G4dOBmi4+y40rSZtCe
         AE5rvUOCvmswqcP1m7BJ9mDLnYT8hoGnzPp1ZUOb8+3NZe+8LxCCToq56vENvE6dGqKI
         7/qvhmEc7wv5bMa1JEi7q03tww8OUntcHQ0DUyDgXO6VbsxfEWAvtWOcruRtF+H74WyM
         nw1EEbrUNvTS7UGxR9FdUt+akv3Rms6JpLG6RM+34aKzReP7sQHGPtoScinIqQiNGXgv
         IMhU+m6NbrR6R39UjIYn4UVUeaFp9m3BtK2keu39kZRfiqntBwUOD7UjATi2c7WoHGfv
         uR+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4b709754ab4si4064780137.108.2025.01.29.09.55.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Jan 2025 09:55:35 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tdCHD-0004l4-Bk; Wed, 29 Jan 2025 12:54:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1tdCH8-0004ke-Pz; Wed, 29 Jan 2025 12:54:55 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1tdCH5-0005ys-Tv; Wed, 29 Jan 2025 12:54:54 -0500
Received: from zero.eik.bme.hu (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 7A3114E6027;
 Wed, 29 Jan 2025 18:54:48 +0100 (CET)
X-Virus-Scanned: amavisd-new at eik.bme.hu
Received: from zero.eik.bme.hu ([127.0.0.1])
 by zero.eik.bme.hu (zero.eik.bme.hu [127.0.0.1]) (amavisd-new, port 10028)
 with ESMTP id T1c9ff6ZTSRK; Wed, 29 Jan 2025 18:54:46 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6C4F14E6014; Wed, 29 Jan 2025 18:54:46 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 6A41A74577C;
 Wed, 29 Jan 2025 18:54:46 +0100 (CET)
Date: Wed, 29 Jan 2025 18:54:46 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: Bernhard Beschow <shentey@gmail.com>
cc: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, 
 =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH 09/21] hw/arm/fsl-imx8mp: Add PCIe support
In-Reply-To: <137C0579-19AB-4D92-82DC-6CBE2422AD6A@gmail.com>
Message-ID: <f2172469-5935-414e-b4a9-bf61055b6fff@eik.bme.hu>
References: <20250120203748.4687-1-shentey@gmail.com>
 <20250120203748.4687-10-shentey@gmail.com>
 <CAFEAcA9efWMDxaTCfa6t8MiCgFUEU+nsyurNOqVDxAa9=KS=-Q@mail.gmail.com>
 <137C0579-19AB-4D92-82DC-6CBE2422AD6A@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII; format=flowed
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: mIamqEwUUEqw

On Tue, 28 Jan 2025, Bernhard Beschow wrote:
> Am 28. Januar 2025 14:33:14 UTC schrieb Peter Maydell <peter.maydell@linaro.org>:
>> On Mon, 20 Jan 2025 at 20:38, Bernhard Beschow <shentey@gmail.com> wrote:
>>>
>>> Linux checks for the PLLs in the PHY to be locked, so implement a model
>>> emulating that.
>>>
>>> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
>>
>>> diff --git a/docs/system/arm/imx8mp-evk.rst b/docs/system/arm/imx8mp-evk.rst
>>> index 1514bc5864..8d48580cb4 100644
>>> --- a/docs/system/arm/imx8mp-evk.rst
>>> +++ b/docs/system/arm/imx8mp-evk.rst
>>> @@ -14,6 +14,7 @@ The ``imx8mp-evk`` machine implements the following devices:
>>>   * Generic Interrupt Controller (GICv3)
>>>   * 4 UARTs
>>>   * 3 USDHC Storage Controllers
>>> + * 1 Designware PCI Express Controller
>>>   * Secure Non-Volatile Storage (SNVS) including an RTC
>>>   * Clock Tree
>>>
>>> @@ -62,3 +63,15 @@ Now that everything is prepared the newly built image can be run in the QEMU
>>>        -dtb imx8mp-evk-patched.dtb \
>>>        -append "root=/dev/mmcblk2p2" \
>>>        -drive file=sdcard.img,if=sd,bus=2,format=raw,id=mmcblk2
>>> +
>>> +Using PCI Devices
>>> +-----------------
>>> +
>>> +The PCI Express controller spawns two PCI buses, of which only one can be used.
>>> +By default QEMU assigns the wrong bus, so the correct one has to be specified
>>> +manually by adding ``bus=dw-pcie``. For example, when adding an Intel e1000
>>> +network card, the command line looks like:
>>> +
>>> +.. code-block:: bash
>>> +
>>> +  $ qemu-system-aarch64 -M imximp-evk ... -device virtio-net-pci,bus=dw-pcie
>>
>> Why does this happen? Isn't there some way to make QEMU default to
>> using the right bus? Otherwise there's likely to be a lot of
>> user confusion because PCI "doesn't work"...
>
> Yeah, this is really confusing and I forget about it myself. I'd appreciate any hints here.

I'm not sure but I think the PCI bus created last will be used by default 
so maybe swapping the order these are created may help.

Regards,
BALATON Zoltan

> Best regards,
> Bernhard
>
>>
>> thanks
>> -- PMM
>
>
