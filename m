Received: by 2002:a17:505:11ab:b0:1be9:327d:8ee3 with SMTP id so11csp1080016njb;
        Sat, 1 Feb 2025 06:46:48 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVII9N6YSdXgatYEjWvGBgCR4QwYz941A37b8GQCnB5bsdnuGgsu9WxaVdn6BZtHcfLbJ1amV1u9jfK9w==@linaro.org
X-Google-Smtp-Source: AGHT+IGJ8EM/Juo3WNY56qJuY7n4pwZCwXDtuRkNglyQ0nDkjnmGsUfUaFdofp0tyUqTocP3nklz
X-Received: by 2002:ac8:57ce:0:b0:467:6b96:dc5a with SMTP id d75a77b69052e-46fd0bcc544mr250711211cf.47.1738421207966;
        Sat, 01 Feb 2025 06:46:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1738421207; cv=none;
        d=google.com; s=arc-20240605;
        b=jmEvgc93RBquD2TdgWS+Yq8hUIsFsJQgKdgVORh9S11FqgAQMKY4U1iauCH9gKrATz
         p2oDO6KMPF0B3t8AYulkovv201tl0MsnVTjdSpZZDR2iRkHGZQ/aKIPTu8uS9QzDq+IR
         xim0UJTXuXEJxoUnH7ckeqS2e41COS5YQNZuyeSF4YdJytLfcCphtyTBZQQz+9giuZre
         H1n3XRtnVunXoV3jToX3+kbWwYdbKkijCupLBj7IBjaakfCySyz345hMG4OsgiTnO1Dk
         fGoq2nmgs4zittGVPwYUn0EY4P4pc4ivHAqZ4k5QKyDbfGotwqPI/z228uLWbhGnOAn4
         Kndw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:references:in-reply-to:subject:cc:to:from
         :date:dkim-signature;
        bh=dc6T1mf5Ubj6La+wPXu3XB5uKGJhazcpmwJlaVUctho=;
        fh=yuf0l97yyGlXUgOVmHz+B6Eeg9lOpq3vifbBUY4hn/A=;
        b=NOtvARGwfPBDl2T5GRTqwzcjZslTE6gJ+Kpp/iYWk/1fXo3FVCFzKuwhPYMu/RlN6r
         TE4aply3eGTevbXjG3Ra1Cv5p2zpsk6eh+PbXZRbahnxTlV8J9rs03vONSQb9USHOsIW
         bAmbS4Qx9qqa9iE8TCrL1gZeCcfwxX2x9N6rxQXFD8QEGcAvcWP2h/20pcPubOLwImPr
         0raCA8bhWBx94TcgDNxubDSSDnxUYXY86owy2Q4jYJhv+COtEmN+cUSTE9wb29dZXXyr
         WUjAknalbTI6TPEyzb+rSaLCA7PGTT7yKlUN0aT+WfdqqjYVJZlvyPrn14SDJX01Wi3o
         9MGg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="EXby6mr/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-46ff5412acesi23335431cf.180.2025.02.01.06.46.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 01 Feb 2025 06:46:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20230601 header.b="EXby6mr/";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1teEl3-00035x-21; Sat, 01 Feb 2025 09:46:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1teEkx-00035f-8j; Sat, 01 Feb 2025 09:45:59 -0500
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>)
 id 1teEkv-0003Tu-Lm; Sat, 01 Feb 2025 09:45:59 -0500
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-ab68a4ab074so365363066b.0; 
 Sat, 01 Feb 2025 06:45:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1738421155; x=1739025955; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dc6T1mf5Ubj6La+wPXu3XB5uKGJhazcpmwJlaVUctho=;
 b=EXby6mr/0/2hRNoV6gVPbN6Nxkh5D0y95VHFbT/8aCpwyYgun18Gy5czi8D4A/2tO5
 5tTDaqcaekn9sFbJ3/IaJHB+B1exaMKpFpnomSa7xRtfJWCbiPuuehiPemKHWqv4gpE9
 MPI4IcGCYuYRM/Nsw+pYWn71dB7QJATWVJSSFwGioAH0aRwAUtqtYq3lrF8FmmCYfy4v
 dtCEechzdhJd5Y38gBHsS68Rq5Ncc4x8/+atUVCtFbHmMTStQaWMqPxAo7cOK+CycBCx
 nFKTIv5NBmm7JriAdQr8SGbic7kAvlTBdyV4fXLmWuh3kcDRtdMsqlh8wAWE2rv2Wp2c
 GGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738421155; x=1739025955;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dc6T1mf5Ubj6La+wPXu3XB5uKGJhazcpmwJlaVUctho=;
 b=R8rW1eZ8lc6v+g0aj/naeFcUroqTUDEISKxWFeNCYpoT1ml3/PStqRGVz6oBGcd1qV
 JZoteZKdKrVOQrde1EdUTjQacjmwAsI3qF4Nxhthr9awhVcirsAtt21t4OTHMfg6rUix
 C8tJH8EuGcl7yhfBo4nHI50PhZnyl8kW8/2D3U7T4yju3MfcmBjEjJyzzYI5PXv7ed82
 QCvPdtaYOXXIpgZCQQ1sPtZ1j4J4vr3O8xSOGtUMliPrLFxiUMAEi/jPkTLAlDAWbpnD
 lXQJxfPsAFtL5l3yaFIsgax0aGmozqDS7XsbLlvVHq664v2fuyaJZPp9FkIP/mNqwk25
 CTwA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVff/SAETU64OMZbReDVDlNo06kr4mF6wFxae3vC2WhZgfpeStey/8FFMIqyYVZsVt4rsVkmuo4E3X5cQ==@nongnu.org,
 AJvYcCWZgQIAXqiq09eyu0EbrkDTuIh8+QoxL8DG0DVa27NRjBfooPTg1sKjLwIIkkFPyc/zm6dqJHGoZQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz4a//+C0B9gKcM8f9mh+K9teIexINRFAp+Vcoyx3mYfTfJr182
 MJRn7dx+AkbwJf4/WX6nfAhyuyaap2MWE8UX7/6lInM+MNRxsCxf
X-Gm-Gg: ASbGncv10bYHVKbyo7U3jynm89UoxfAtRNRZA7N6DNbewfel83d6z9J9Bw6dQ3M5Mx1
 RISoEIbmg3XL2AQ243TMXK4fm0tpVrlr3ts9k3/+X6zyOlCypZ9uynGJG4y8BoWy5q84ITx3Jrw
 G1DQEXhLFNfpzyx8+rkQyHhgZDohxnjrDomn/fZy87Na4oMaktP/RToqsH/uQnjcmI+kMVkyXYC
 KvugAKe9fjTxQhiNV4aSdn6ozjcbkh6yK8/vifuRstoEjIoL/VzMWi3h3ykaXU+mwvyoXlMfWJb
 xmNf/xa0INRD74BORrlItjMSZznpgjWd/809cGUGg3ZSe5TQ42Md/ItiTZaqvNdLeZE=
X-Received: by 2002:a05:6402:2546:b0:5d0:cfad:f71 with SMTP id
 4fb4d7f45d1cf-5dc5effe67amr37097466a12.32.1738421154701; 
 Sat, 01 Feb 2025 06:45:54 -0800 (PST)
Received: from [127.0.0.1] (dynamic-077-183-083-158.77.183.pool.telefonica.de.
 [77.183.83.158]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ab6e47d1014sm452549866b.66.2025.02.01.06.45.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 01 Feb 2025 06:45:54 -0800 (PST)
Date: Sat, 01 Feb 2025 14:45:52 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: BALATON Zoltan <balaton@eik.bme.hu>
CC: Peter Maydell <peter.maydell@linaro.org>, qemu-devel@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Subject: Re: [PATCH 09/21] hw/arm/fsl-imx8mp: Add PCIe support
In-Reply-To: <f2172469-5935-414e-b4a9-bf61055b6fff@eik.bme.hu>
References: <20250120203748.4687-1-shentey@gmail.com>
 <20250120203748.4687-10-shentey@gmail.com>
 <CAFEAcA9efWMDxaTCfa6t8MiCgFUEU+nsyurNOqVDxAa9=KS=-Q@mail.gmail.com>
 <137C0579-19AB-4D92-82DC-6CBE2422AD6A@gmail.com>
 <f2172469-5935-414e-b4a9-bf61055b6fff@eik.bme.hu>
Message-ID: <9FB95B89-404D-49BA-961A-7F860E9C0F95@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=shentey@gmail.com; helo=mail-ej1-x62f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: qjwM6NbwfZ7I



Am 29=2E Januar 2025 17:54:46 UTC schrieb BALATON Zoltan <balaton@eik=2Ebm=
e=2Ehu>:
>On Tue, 28 Jan 2025, Bernhard Beschow wrote:
>> Am 28=2E Januar 2025 14:33:14 UTC schrieb Peter Maydell <peter=2Emaydel=
l@linaro=2Eorg>:
>>> On Mon, 20 Jan 2025 at 20:38, Bernhard Beschow <shentey@gmail=2Ecom> w=
rote:
>>>>=20
>>>> Linux checks for the PLLs in the PHY to be locked, so implement a mod=
el
>>>> emulating that=2E
>>>>=20
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>=20
>>>> diff --git a/docs/system/arm/imx8mp-evk=2Erst b/docs/system/arm/imx8m=
p-evk=2Erst
>>>> index 1514bc5864=2E=2E8d48580cb4 100644
>>>> --- a/docs/system/arm/imx8mp-evk=2Erst
>>>> +++ b/docs/system/arm/imx8mp-evk=2Erst
>>>> @@ -14,6 +14,7 @@ The ``imx8mp-evk`` machine implements the following=
 devices:
>>>>   * Generic Interrupt Controller (GICv3)
>>>>   * 4 UARTs
>>>>   * 3 USDHC Storage Controllers
>>>> + * 1 Designware PCI Express Controller
>>>>   * Secure Non-Volatile Storage (SNVS) including an RTC
>>>>   * Clock Tree
>>>>=20
>>>> @@ -62,3 +63,15 @@ Now that everything is prepared the newly built im=
age can be run in the QEMU
>>>>        -dtb imx8mp-evk-patched=2Edtb \
>>>>        -append "root=3D/dev/mmcblk2p2" \
>>>>        -drive file=3Dsdcard=2Eimg,if=3Dsd,bus=3D2,format=3Draw,id=3Dm=
mcblk2
>>>> +
>>>> +Using PCI Devices
>>>> +-----------------
>>>> +
>>>> +The PCI Express controller spawns two PCI buses, of which only one c=
an be used=2E
>>>> +By default QEMU assigns the wrong bus, so the correct one has to be =
specified
>>>> +manually by adding ``bus=3Ddw-pcie``=2E For example, when adding an =
Intel e1000
>>>> +network card, the command line looks like:
>>>> +
>>>> +=2E=2E code-block:: bash
>>>> +
>>>> +  $ qemu-system-aarch64 -M imximp-evk =2E=2E=2E -device virtio-net-p=
ci,bus=3Ddw-pcie
>>>=20
>>> Why does this happen? Isn't there some way to make QEMU default to
>>> using the right bus? Otherwise there's likely to be a lot of
>>> user confusion because PCI "doesn't work"=2E=2E=2E
>>=20
>> Yeah, this is really confusing and I forget about it myself=2E I'd appr=
eciate any hints here=2E
>
>I'm not sure but I think the PCI bus created last will be used by default=
 so maybe swapping the order these are created may help=2E

Turns out there is BusClass::max_dev which is respected when a parent bus =
for a user-created device is sought=2E I'll draw inspiration from pnv_phb4=
=2E

Best regards,
Bernhard

>
>Regards,
>BALATON Zoltan
>
>> Best regards,
>> Bernhard
>>=20
>>>=20
>>> thanks
>>> -- PMM
>>=20
>>=20
