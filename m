Received: by 2002:a17:906:dac7:b0:886:babc:7eeb with SMTP id xi7csp1547517ejb;
        Fri, 3 Feb 2023 08:23:20 -0800 (PST)
X-Google-Smtp-Source: AK7set9NGjAL4Fr8wcnWxpTj2oEIkxDlWGsRyR3fEmiA3+zQTQyBhtLQI6xF2xV3uP9dcYg0E5wS
X-Received: by 2002:a0c:f3c3:0:b0:537:7619:58d9 with SMTP id f3-20020a0cf3c3000000b00537761958d9mr15964435qvm.9.1675441400205;
        Fri, 03 Feb 2023 08:23:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1675441400; cv=none;
        d=google.com; s=arc-20160816;
        b=jn+sdoNxKFNGticQ0y11pflpB67joP7x+ti/hUWVPRZV4abNHFwrexBTx1S2zu0RIn
         BXcBgQL4ixgINMaGdWCYsPWeoTLssL/LZzYY8Yi34AlpNgpHLxGtAdchohGVMbF0mWKK
         tonHBnYv2Ra4sc2iOyg3kh56skUZxtO9xM7xCwxYtarrMnOVa4/6O9Ab/zxHm0eXC0I1
         KCEi+F1i65wofUiEWpG86WzRUJqSR9c+TGns+aCehDxTZ0Z5In38YaIA4c9rqijG2DLy
         gcaNLg9XTQDPuOxkKgJOHmMfPzzJl8748LP0br89rwTCMqrkVskfkPH3bLsa5WlDWgI8
         Ir0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=yVYLzflCuzvEpc+kqJmqE83CgoZJv7fJwRTIPBIT+aM=;
        b=oSRNopC5JZ5uHZsFve9CZ0WAmyIoNSle+ZS7JvXiv76XJqhw+n8GvPN74wdpyJvCJ3
         le9ZlEvAq2CRxts55zGHFaQsIC5QWBrER6ZCC+dZAuJNqqbh6jM64ED81xpklE8ZnKNr
         BnFC4XJ1gjBJQ8ovNu6SMW8myxGWbFTi+x5vXCnRzhdD4G9fuensUigkUycBzYuPRQVm
         pCdfstpVG3JeDL7GK9GighLp11fb7rYS2F0kAzyPfloCg1qgzlb7di9Lgg+J6W2NGyPl
         Z9kx5w6/XdWosdq53X+j26GWsZlrhYIDJsUwPkfT8rCOkc6LW+3apS7/i6zg1cl7fRMy
         SraA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e8-20020a056214162800b005393d3f22f4si1907993qvw.52.2023.02.03.08.23.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Feb 2023 08:23:20 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pNyq3-0005yG-Kr; Fri, 03 Feb 2023 11:22:59 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNypz-0005sT-FA; Fri, 03 Feb 2023 11:22:57 -0500
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1pNypx-0005Z2-TR; Fri, 03 Feb 2023 11:22:55 -0500
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id A4350746377;
 Fri,  3 Feb 2023 17:20:23 +0100 (CET)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 6A0C8745712; Fri,  3 Feb 2023 17:20:23 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 685B77456E3;
 Fri,  3 Feb 2023 17:20:23 +0100 (CET)
Date: Fri, 3 Feb 2023 17:20:23 +0100 (CET)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>
cc: qemu-devel@nongnu.org, Markus Armbruster <armbru@redhat.com>, 
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 Eduardo Habkost <eduardo@habkost.net>
Subject: Re: [PATCH v2 12/15] hw/display/sm501: Unify common QOM properties
In-Reply-To: <20230203145536.17585-13-philmd@linaro.org>
Message-ID: <d4127cf0-3006-9143-36c4-e059acf8908d@eik.bme.hu>
References: <20230203145536.17585-1-philmd@linaro.org>
 <20230203145536.17585-13-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-2106383846-1675441223=:20219"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -41
X-Spam_score: -4.2
X-Spam_bar: ----
X-Spam_report: (-4.2 / 5.0 requ) BAYES_00=-1.9, RCVD_IN_DNSWL_MED=-2.3,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: dnTFOu/6Hi6M

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-2106383846-1675441223=:20219
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Fri, 3 Feb 2023, Philippe Mathieu-Daudé wrote:
> Since now PCI and SysBus properties are identical, unify them.
>
> Suggested-by: BALATON Zoltan <balaton@eik.bme.hu>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>

Reviewed-by: BALATON Zoltan <balaton@eik.bme.hu>

> ---
> hw/display/sm501.c | 11 +++--------
> 1 file changed, 3 insertions(+), 8 deletions(-)
>
> diff --git a/hw/display/sm501.c b/hw/display/sm501.c
> index efebd93f1e..98375138b2 100644
> --- a/hw/display/sm501.c
> +++ b/hw/display/sm501.c
> @@ -1975,7 +1975,7 @@ static void sm501_realize_sysbus(DeviceState *dev, Error **errp)
>     /* TODO : chain irq to IRL */
> }
>
> -static Property sm501_sysbus_properties[] = {
> +static Property sm501_common_properties[] = {
>     DEFINE_PROP_UINT32("vram-size", SM501SysBusState, vram_size, 0),
>     DEFINE_PROP_END_OF_LIST(),
> };
> @@ -2004,7 +2004,7 @@ static void sm501_sysbus_class_init(ObjectClass *klass, void *data)
>     dc->realize = sm501_realize_sysbus;
>     set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
>     dc->desc = "SM501 Multimedia Companion";
> -    device_class_set_props(dc, sm501_sysbus_properties);
> +    device_class_set_props(dc, sm501_common_properties);
>     dc->reset = sm501_reset_sysbus;
>     dc->vmsd = &vmstate_sm501_sysbus;
> }
> @@ -2062,11 +2062,6 @@ static void sm501_realize_pci(PCIDevice *dev, Error **errp)
>                      &s->state.mmio_region);
> }
>
> -static Property sm501_pci_properties[] = {
> -    DEFINE_PROP_UINT32("vram-size", SM501PCIState, vram_size, 64 * MiB),
> -    DEFINE_PROP_END_OF_LIST(),
> -};
> -
> static void sm501_reset_pci(DeviceState *dev)
> {
>     SM501PCIState *s = PCI_SM501(dev);
> @@ -2098,7 +2093,7 @@ static void sm501_pci_class_init(ObjectClass *klass, void *data)
>     k->class_id = PCI_CLASS_DISPLAY_OTHER;
>     set_bit(DEVICE_CATEGORY_DISPLAY, dc->categories);
>     dc->desc = "SM501 Display Controller";
> -    device_class_set_props(dc, sm501_pci_properties);
> +    device_class_set_props(dc, sm501_common_properties);
>     dc->reset = sm501_reset_pci;
>     dc->hotpluggable = false;
>     dc->vmsd = &vmstate_sm501_pci;
>
--3866299591-2106383846-1675441223=:20219--
