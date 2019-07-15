Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4028106wrv;
        Mon, 15 Jul 2019 04:20:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqytDEzgAsy3yO6UbX/FAvq5aVE3CTOsjzWa2eBhJJ4svilGEBz2Gm2LIyfg6w2BHz28mdVb
X-Received: by 2002:a17:906:1599:: with SMTP id k25mr19507946ejd.281.1563189654028;
        Mon, 15 Jul 2019 04:20:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563189654; cv=none;
        d=google.com; s=arc-20160816;
        b=0MEH0/DNTpzl10yLkiNXJXjc7DL5K6WYK95qm6r8VWqCbK1JluUANKNVJZbjUogLFB
         +p8kiNu7NY+kr2I1Pzg6AHWKUHhoY2UhTKuVM9ZO5pxcxrQBa6lLoRxySNiwdQr/EhVm
         M3Rcwowmn/tpjJWtvfV36GKyOk2CVW+4z8iSgUMr7qMWIlOmqncubEch47WTUVUWWMbg
         y0IkUSZU4FY/tKP18PzoEmO/6R64y0Xi7HeFIi2SLMbHuP1C+SX6ymvidSUnpbJPaPhL
         95mEwDJJGGTOjXUhWiBb8zsNg9xERjRFXDCLnE051yLjcoaEAjLQzBdOIffjSmL5qQjU
         rOuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=xuZ17Wl+Vo820DgCe+PNldumzhl2p89ckdeUukJIQlA=;
        b=AInB/rXHJDOG2zrOVNCLIhpOQgJqfnvUZSVInP7daV35f/13vMmuLiSHqfEFKZzRjz
         f8jNard6BBeFmxJz6jvGqt5gqQCz98936zshFJH/shJM9mrGoDyO4nFjVWSxXFiItYE+
         wteFyFoYG7Th7XUn19Td9+vHZCMIVwbmT57s8t0oZT4WZtuTKgwJQn7iJ7d0UhuuMTPl
         y3iCt3IDcpb7xMUKROjmErP0pcaOHHIihW9mnk1DhhcIgckDJITKWiW+jrHk8dGUnAdW
         l2yVlk4H+5U7EZs/9fbrTxGBvqfTIptObh31q7mWINStDRKMynhArcKChYZpb8vnpZqn
         IriA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g6si8681014ejs.57.2019.07.15.04.20.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jul 2019 04:20:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37296 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hmz2K-0002Lk-KC
	for alex.bennee@linaro.org; Mon, 15 Jul 2019 07:20:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48526)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hmz2F-0002L3-DF
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 07:20:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hmz2E-00054i-Fe
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 07:20:47 -0400
Received: from mail-wr1-f46.google.com ([209.85.221.46]:37347)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hmz2E-000541-9I
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 07:20:46 -0400
Received: by mail-wr1-f46.google.com with SMTP id n9so16676100wrr.4
 for <qemu-arm@nongnu.org>; Mon, 15 Jul 2019 04:20:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=xuZ17Wl+Vo820DgCe+PNldumzhl2p89ckdeUukJIQlA=;
 b=KT3qCaJBkjFnWQ6N6jm7WHDnHae28kmHRn/R/c5orX1Hk3Z5oXUlwEokBKpNIsszfi
 7gBzwZzf3A/6vEPXW/xBw8ZOuRbNlRKbvRjgVojnZ7PI4PIqvA3tTBFkDuj8NH+Gcj9H
 Ps72oaVdB3usuOsIgT3yrmVBV8DJE51Ek9B00nnOSzoQbEM1MCAKfoE7F4fEwuP0rDPY
 fXL80hq90wq1eiQW3OrUOE0jmgKesrQlUnihttsYIXsqU3/yHyzKtuFNfijYTsf6xuaQ
 y4+5u30jO14OC4xqr1bOAQkKjrmin0UqiTNN6z2g52zoXbdqIBJSRLTRa8iuG3m0rUvy
 /Tcw==
X-Gm-Message-State: APjAAAUT+8K2vNXwSiODyOUPBO7vZxff6K8likzpZDwgaS5iifCwR1te
 AGkFIgAtgyroZ69usco1K7TMZQ==
X-Received: by 2002:adf:f60a:: with SMTP id t10mr16037835wrp.258.1563189645214; 
 Mon, 15 Jul 2019 04:20:45 -0700 (PDT)
Received: from [192.168.178.40] ([151.20.129.151])
 by smtp.gmail.com with ESMTPSA id t13sm18616243wrr.0.2019.07.15.04.20.43
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 04:20:44 -0700 (PDT)
To: BALATON Zoltan <balaton@eik.bme.hu>, Thomas Huth <thuth@redhat.com>
References: <20190715095545.28545-1-philmd@redhat.com>
 <20190715095545.28545-3-philmd@redhat.com>
 <alpine.BSF.2.21.9999.1907151251210.6546@zero.eik.bme.hu>
 <64dd9cd5-8599-b157-3ba2-0ec565cee709@redhat.com>
 <alpine.BSF.2.21.9999.1907151309190.6546@zero.eik.bme.hu>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <8a6e23a6-2101-3aaa-21b2-a724fea160ac@redhat.com>
Date: Mon, 15 Jul 2019 13:20:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <alpine.BSF.2.21.9999.1907151309190.6546@zero.eik.bme.hu>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.46
Subject: Re: [Qemu-arm] [Qemu-ppc] [PATCH-for-4.2 2/3] hw/usb/Kconfig: Add
 CONFIG_USB_EHCI_PCI
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
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-riscv@nongnu.org,
 Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@sifive.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Alistair Francis <Alistair.Francis@wdc.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2gEVK9iQGmlo

On 15/07/19 13:10, BALATON Zoltan wrote:
>>
>> If you want to compile without USB_EHCI_PCI and without USB_EHCI_SYSBUS,
>> but with USB (e.g. due to XHCI), I think we should not include
>> hcd-ehci.o file in the build. So I think it's fine that we have a
>> separate config switch for this file.
> 
> So shouldn't build depend on either USB_EHCI_PCI or USB_EHCI_SYSBUS
> selected then?

No, USB_EHCI is never selected by the user.  The board or default-config
file selects either USB_EHCI_PCI or USB_EHCI_SYSBUS, which brings in
USB_EHCI, which brings in USB, which (optionally) brings in the USB devices.

Paolo
