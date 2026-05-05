Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A530CD3439
	for <qemu-arm@archiver.kernel.org>; Tue,  5 May 2026 19:20:02 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wKLIv-0002hT-OE; Tue, 05 May 2026 15:19:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1wKLIt-0002go-KY
 for qemu-arm@nongnu.org; Tue, 05 May 2026 15:19:35 -0400
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <shentey@gmail.com>) id 1wKLIr-0001ID-GH
 for qemu-arm@nongnu.org; Tue, 05 May 2026 15:19:35 -0400
Received: by mail-wr1-x436.google.com with SMTP id
 ffacd0b85a97d-44c4cc7c1cfso2467119f8f.0
 for <qemu-arm@nongnu.org>; Tue, 05 May 2026 12:19:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1778008772; x=1778613572; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k3qH7igyxx/OIgrHqtsgLKHywtENrA308xZ4BEN3PuI=;
 b=prnjMy+hnnzfpc8JmU9zgvYtUOifkXF9Yfv37nlf0hiEkGGZEyqvVXHE/CTAeGw3vy
 0pZ/AvY10igFh6RrZeWw0uXPJiGkak+WhCaT+bFrxUsKKDAk1XHd1QjQwXTBNEXhwGoZ
 wyszVqFPutWBOPvszCqpR4hV0rgJbK4IYx7/wvCFxMyHFY0CJjIzduDylyxGMgTN7x7+
 KCya0PtUuMUd6xi716KbXq03wBZa46vj1EA0NRvsyX3v+BFmQQE6eCzQRnSaLYfb2O+B
 VJ12cFQqgGfGxs/bnXZKIo6fa6jjgvAbXsEOEmNPMA6MCRRpAPAd1nxq5JW3pdRxR9Qg
 gW7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778008772; x=1778613572;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=k3qH7igyxx/OIgrHqtsgLKHywtENrA308xZ4BEN3PuI=;
 b=Ig7za/C6dumM2AfiAtTuY2gUQy++BnEAesNqP1Cra95rCudYsCvcRy9Jr6Vke4jh4u
 v4OYw1JLHyQj63n3RKpnz5ybrn9bLKf7HR8qGDEg4YEkVQPfZ2GB76rQfeA74y7XeUi3
 3HjGLu8G4dSOkgnZGnZmq8NmY031oOF3xa76nb5GCIV9t9csMfj1zoM7n8IQzpAzcvQf
 CHhy3AfnIt30WyvywocDnHeAWcrr7cfc9RLrKlRhQla3s91dZWB+CKYtSB86BbDKmO5+
 /OnFo2If2N5cUj5tq6Q9vIne7HbfieTtEOHEMD6PvTdtLR9JVYq3vzPcTBec5eEl76fL
 0NgQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ/nFEJFXbZhvn07iMa+qWs5C5SlWmhwtZf4DWWCkNJtBER5N8awkMr01P/Ek4gG9LNr/UaD8Uh9sA==@nongnu.org
X-Gm-Message-State: AOJu0YyazQlf4HYp00KaXrT+ccTHlam+NMHTSuNWCPdK2wyx73XInsoj
 624TTKrhpro6GfdbL+rWBBRT4XGWe3Owjy1bZI1XMUqyOoSlhUhkb4Po
X-Gm-Gg: AeBDieu+X+Xiq+adX8eqnzSpiYlYijCNM/LIPrWZIOovRYQhPrh9bt1Z+ziKF5D3iik
 UcXkcfVClWsPM1J/Tpt7A4aDVfGizEB8qVtWzBQM7ipah18m/exzaThQYd7yWcepkFVYLMxfkGg
 XCpC8Z6ziEusxrlRfqbzAPeAH0TKARnyNYB+QYJmiD7vYowuXcuTnwN/z1B6dIsHW6rFg9W5XOQ
 dT4iSvCxD3sZLTLkDfqvL1ymg94HUm5MCm6WyEoLQ6pIVn6ByOliVAY2nTT/xaF0NZgVXnUCwoG
 zv70ZalrW2Ypid8KjxYyWJ7gHIpd23n4o1PKdfuh3UV/hD66MHsLChkm9KuCXKgPVZev996a1+t
 N1mAKA4uGq9eYfcBvtmhaw4CSYdEgxCZI82UpAw+Jmxn/UuiVuqMOHWNnig/oRpW7nJ+aHqHTKw
 MdMWHeuGUKT5HO+qNDTSmhedxtuprleC6BVmNThfSLQHPGE7W26G8hSHwdlNSY4oZFSiMcicy7D
 plkNkhmpq8llGILpDuprwFgn4oHK5FkrIv3Gryt3G2G+IY5aYHUfrzP
X-Received: by 2002:a05:6000:1ac6:b0:43e:a9ba:b194 with SMTP id
 ffacd0b85a97d-4515d5c6b69mr689827f8f.34.1778008771550; 
 Tue, 05 May 2026 12:19:31 -0700 (PDT)
Received: from ehlo.thunderbird.net
 (dynamic-2a02-3100-2288-5100-c87f-e1c3-d3c0-0c97.310.pool.telefonica.de.
 [2a02:3100:2288:5100:c87f:e1c3:d3c0:c97])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4505238e6e0sm6237878f8f.6.2026.05.05.12.19.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 May 2026 12:19:30 -0700 (PDT)
Date: Tue, 05 May 2026 18:17:38 +0000
From: Bernhard Beschow <shentey@gmail.com>
To: =?ISO-8859-1?Q?C=E9dric_Le_Goater?= <clg@redhat.com>, qemu-devel@nongnu.org
CC: Eduardo Habkost <eduardo@habkost.net>, Paolo Bonzini <pbonzini@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, qemu-trivial@nongnu.org,
 qemu-arm@nongnu.org, Michael Tokarev <mjt@tls.msk.ru>,
 =?ISO-8859-1?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH 5/5] Revert "sysbus: add irq_routing_notifier"
In-Reply-To: <16c03bd7-5db7-43c0-a1ca-0bf904cba03d@redhat.com>
References: <20260308203516.160103-1-shentey@gmail.com>
 <20260308203516.160103-6-shentey@gmail.com>
 <af77b92d-9303-4ed0-942d-6188e00ccdde@redhat.com>
 <DF79ACA2-21B7-47B9-B9C1-0C08E9E50F16@gmail.com>
 <16c03bd7-5db7-43c0-a1ca-0bf904cba03d@redhat.com>
Message-ID: <FE414151-6BE8-4F50-8934-BD6C130B1D14@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::436;
 envelope-from=shentey@gmail.com; helo=mail-wr1-x436.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, FREEMAIL_FROM=0.001,
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



Am 4=2E Mai 2026 09:51:05 UTC schrieb "C=C3=A9dric Le Goater" <clg@redhat=
=2Ecom>:
>On 4/27/26 12:30, Bernhard Beschow wrote:
>>=20
>>=20
>> Am 9=2E M=C3=A4rz 2026 09:19:10 UTC schrieb "C=C3=A9dric Le Goater" <cl=
g@redhat=2Ecom>:
>>> On 3/8/26 21:35, Bernhard Beschow wrote:
>>>> The callback has been introduced in commit 715ca691daca ("sysbus: add
>>>> irq_routing_notifier") for use in VFIO platform=2E Meanwhile, VFIO
>>>> platform has been removed via commit 762c85543948 ("vfio: Remove 'vfi=
o-
>>>> platform'") which was its only user=2E Remove this unused code=2E
>>>>=20
>>>> This reverts commit 715ca691daca081108b33306faa6fa102f0df8d8=2E
>>>>=20
>>>> cc: C=C3=A9dric Le Goater <clg@redhat=2Ecom>
>>>> Signed-off-by: Bernhard Beschow <shentey@gmail=2Ecom>
>>>> ---
>>>>    include/hw/core/sysbus=2Eh | 1 -
>>>>    hw/core/sysbus=2Ec         | 6 ------
>>>>    2 files changed, 7 deletions(-)
>>>>=20
>>>> diff --git a/include/hw/core/sysbus=2Eh b/include/hw/core/sysbus=2Eh
>>>> index c0d18d9e00=2E=2Ef3c4259d29 100644
>>>> --- a/include/hw/core/sysbus=2Eh
>>>> +++ b/include/hw/core/sysbus=2Eh
>>>> @@ -50,7 +50,6 @@ struct SysBusDeviceClass {
>>>>         * omitted then=2E (This is not considered a fatal error=2E)
>>>>         */
>>>>        char *(*explicit_ofw_unit_address)(const SysBusDevice *dev);
>>>> -    void (*connect_irq_notifier)(SysBusDevice *dev, qemu_irq irq);
>>>>    };
>>>>      struct SysBusDevice {
>>>> diff --git a/hw/core/sysbus=2Ec b/hw/core/sysbus=2Ec
>>>> index 3adf2f2faf=2E=2E3e1160ee92 100644
>>>> --- a/hw/core/sysbus=2Ec
>>>> +++ b/hw/core/sysbus=2Ec
>>>> @@ -104,13 +104,7 @@ qemu_irq sysbus_get_connected_irq(const SysBusDe=
vice *dev, int n)
>>>>      void sysbus_connect_irq(SysBusDevice *dev, int n, qemu_irq irq)
>>>>    {
>>>> -    SysBusDeviceClass *sbd =3D SYS_BUS_DEVICE_GET_CLASS(dev);
>>>> -
>>>>        qdev_connect_gpio_out_named(DEVICE(dev), SYSBUS_DEVICE_GPIO_IR=
Q, n, irq);
>>>> -
>>>> -    if (sbd->connect_irq_notifier) {
>>>> -        sbd->connect_irq_notifier(dev, irq);
>>>> -    }
>>>>    }
>>>>      /* Check whether an MMIO region exists */
>>>=20
>>> Reviewed-by: C=C3=A9dric Le Goater <clg@redhat=2Ecom>
>>>=20
>>> Thanks,
>>>=20
>>> C=2E
>>=20
>> Who will pick up this patch?
>I would say this is a qdev related matter, so Paolo ?

Meanwhile, Peter took already care of it by applying the patch to target-a=
rm=2Enext and issuing a pull request -- thanks, Peter!

Best regards,
Bernhard

>
>Thanks,
>
>C=2E
>

