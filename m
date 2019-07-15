Received: by 2002:a5d:51d0:0:0:0:0:0 with SMTP id n16csp4028880wrv;
        Mon, 15 Jul 2019 04:21:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqztfc6nFd/QjcxVZHGAQdUpj6oym485nxEaxe46NJl0eTEw/ho/TL4lYCZlVui/vLaI5xXJ
X-Received: by 2002:a17:906:3018:: with SMTP id 24mr20474528ejz.187.1563189693951;
        Mon, 15 Jul 2019 04:21:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1563189693; cv=none;
        d=google.com; s=arc-20160816;
        b=0V+IEPjWucqrAPjagBQOaOpy37Mzf+8GwF/rvuN6qSivTR4FXlvK/aPV2tuJD0wcVH
         F83/bvHgqbq+23XC1oDfkNwg4aQ5oQOMTDJgimQHjNNiC7x5IV4Q5VFjcP7zwNJwKlcx
         /zgPiBqwnwrw60E1SBUJDR/UXUzgrLwmmrCPMcpD7b+DJoklP3LZH5FfgJaK6sKV7FaU
         Qyb3nsJyN8268wHCa3R9zb2qFmmI3MoIX4lH+AacfGpxELl4Ov8JC9VFOUltRWoMFqpI
         kv7KaHDMm3ArYdofMaYq1XkKeNn46Kr8oXP+ixgVCY8VHSNndsnFoGKhMmzg6GduRX34
         fQyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=XpM7q5nGE5in8iatsiRuS3mXGEMtUeDV4D74czZCweE=;
        b=AR7ZJlpLTKFvigTJ2f91Nlszsqx6udLw/7whbzyT2JPBYD3ZbquUAMKfGzdfoYYgLX
         nkC0EGm7AGOWWZBfTJlto03grrk0NVdpevtjhGxsPjlKaawUGQoU9ypX69SOmdDGBgHi
         jGa9MjDPo0z8tm6iDvU9eqVXNGlafSNalWu91yGn/FGA220XAWV2D7Cs+Th7tvuiVUw0
         zosIsDCvRNuRPU2B8S8LMjkfZw2q/2UlICfRuQa8wvUyysTQEB6TukmDkRd/I0XfcYQn
         GsQddj0PCTUp9BanrejKHfOhp8UjtdLg9wasTkO3ODSETj603PHqwLp7uINTqiY9R9JE
         MHYg==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y13si9446982eje.259.2019.07.15.04.21.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jul 2019 04:21:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37310 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.86_2)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hmz2y-0003Pj-T4
	for alex.bennee@linaro.org; Mon, 15 Jul 2019 07:21:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48674)
 by lists.gnu.org with esmtp (Exim 4.86_2)
 (envelope-from <pbonzini@redhat.com>) id 1hmz2v-0003Ox-4X
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 07:21:30 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <pbonzini@redhat.com>) id 1hmz2t-0005LN-UM
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 07:21:29 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:39454)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <pbonzini@redhat.com>) id 1hmz2t-0005Kt-Lw
 for qemu-arm@nongnu.org; Mon, 15 Jul 2019 07:21:27 -0400
Received: by mail-wr1-f65.google.com with SMTP id x4so16639934wrt.6
 for <qemu-arm@nongnu.org>; Mon, 15 Jul 2019 04:21:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=XpM7q5nGE5in8iatsiRuS3mXGEMtUeDV4D74czZCweE=;
 b=PIMvG9N3YZ3ZajJOH8W46zfz1GP4pimnA8mwh2e7c9sF7c1P1CxNwXQF/wNadzWgwV
 5JOSFUZAgeUqpQvACtaAO/BQBj2ePl0In/+a6sjYRLLEOJ1Jt8TcFt6Tl9YYRm68PV/4
 tedO0xp1gat4uDRsmfpkZlAcok4ct0wKkBfIcqtiQktELC4eNu0uyH70jrgJ58MTEzwl
 mRVvLXrZ94gIEIhrC88E3DT6Lv2rZukumk1mLGzs7ycpcGmM5G9TZmYglDNdT2lO12b0
 VM1E+/Rfp1zEHI0KnU45pU6csfDgIS+VrPtul6Yo2DtEyMc/zPqYKYDBRm3CkGdwriub
 FZNQ==
X-Gm-Message-State: APjAAAULj5g01ZcLNDg8ftKsAn/vrvGgt8vRQEa+jsWPOjx0V3kZuoGm
 SecCoeY7hhZqLBAChUUCaK8vog==
X-Received: by 2002:a5d:43d0:: with SMTP id v16mr27681990wrr.252.1563189686712; 
 Mon, 15 Jul 2019 04:21:26 -0700 (PDT)
Received: from [192.168.178.40] ([151.20.129.151])
 by smtp.gmail.com with ESMTPSA id p26sm23977275wrp.58.2019.07.15.04.21.25
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Mon, 15 Jul 2019 04:21:26 -0700 (PDT)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
References: <20190715095545.28545-1-philmd@redhat.com>
From: Paolo Bonzini <pbonzini@redhat.com>
Openpgp: preference=signencrypt
Message-ID: <b6d8e256-b6bf-6270-b2db-9d15403f6233@redhat.com>
Date: Mon, 15 Jul 2019 13:21:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <20190715095545.28545-1-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [PATCH 0/3] hw/Kconfig: PCI & USB fixes
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
 qemu-riscv@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Sagar Karandikar <sagark@eecs.berkeley.edu>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Helge Deller <deller@gmx.de>, Palmer Dabbelt <palmer@sifive.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>, qemu-arm@nongnu.org,
 Alistair Francis <Alistair.Francis@wdc.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>,
 Aurelien Jarno <aurelien@aurel32.net>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: p6AmztjOem7x

On 15/07/19 11:55, Philippe Mathieu-Daudé wrote:
> I actually wanted to clean the USB devices (i.e. to not have
> USB3 devices appear on OHCI buses) but this is too late for
> the next release, so let's post the patches accumulated.
> 
> Philippe Mathieu-Daudé (3):
>   hw/Kconfig: PCI bus implies PCI_DEVICES
>   hw/usb/Kconfig: Add CONFIG_USB_EHCI_PCI
>   hw/usb/Kconfig: USB_XHCI_NEC requires USB_XHCI
> 
>  docs/devel/kconfig.rst |  1 -
>  hw/alpha/Kconfig       |  1 -
>  hw/arm/Kconfig         |  4 ----
>  hw/hppa/Kconfig        |  1 -
>  hw/i386/Kconfig        |  1 -
>  hw/pci/Kconfig         |  1 +
>  hw/ppc/Kconfig         |  6 ------
>  hw/riscv/Kconfig       |  1 -
>  hw/sh4/Kconfig         |  1 -
>  hw/sparc64/Kconfig     |  1 -
>  hw/usb/Kconfig         | 11 +++++++----
>  hw/usb/Makefile.objs   |  5 +++--
>  12 files changed, 11 insertions(+), 23 deletions(-)
> 

ACK for 2 and 3.  Gerd is on vacation so I'm picking them up.

Paolo
