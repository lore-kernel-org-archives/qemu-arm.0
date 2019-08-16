Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp602079wrs;
        Fri, 16 Aug 2019 03:06:33 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwDAN1fHg6yM8Jz2bz56APCYQL0TKNZHRfCZSs0h8lPRsN8FjzKQjrb9fsfcriqm7SZHljF
X-Received: by 2002:a37:a58a:: with SMTP id o132mr8188378qke.86.1565949993556;
        Fri, 16 Aug 2019 03:06:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565949993; cv=none;
        d=google.com; s=arc-20160816;
        b=i02rNHkSPxhC7MDnC99VHLW2g7xOGyBnComW6HSRzPr/Rdeyo5nSFWBdE1sECffQaA
         +tdcyWrsceY7WF8FoVE+BNAB4AH0z1JE1tyVBEyaiIr5lSm5UfAD3QAJwB7JXihMAeCO
         P2ANI3piTX4dTbKebKSL+yF9ihCikN5Pf2v+gTnGUW6ssd438tbmelZ1T6I0c4ajYPcU
         EUiPbZzsrM9BVXx9bU6y5XkI6rPkzVoOag+gOAyL0cZ4KQWbdC4NJYb0GRnEZxjp1WCS
         3cERJ77IYgQKMFaeJ48CaQGgZs+6tjKfV7reRIn624xclERFWoFOCFukSCjwhrH7+2T2
         47oQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=4nmllPcEhYaEJs68tgHuQ5qqmn++ZDafoOXvJZcokHk=;
        b=NxK+l0low+22u495KTb3EVdVDcXwAB9DX28rWqJjnLimf4KQbQU0jlYe1ySDEfsZY8
         +aZgCGcYX4XZVFe8gHjrWOHDyh0uSS6Jxxv8JaQz8t7wtBsPjtZ91g/pQ1q0vQrVvl8J
         5GpOQCpJCspAk+9bem8DNO2J9KFXROdUVuluiXZvOeouBKFKnQR2vu+Ku6l3C9Qegz+N
         PVNKzKmHJGNf/FFIER/PBYWqXjGDu2BLxFDwEsf7XzUc4tkrrVBFArwE6q48cyBa7dK3
         vsSlc/M18nMrq2kU3lcWDONgr2VOfbeZGfbH1z/Otvuz7RKjShSFzrCTsXdmmE0ahVkd
         833A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u18si3255361qvg.137.2019.08.16.03.06.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 03:06:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52942 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyZ7x-00008n-04
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 06:06:33 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35431)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1hyZ7a-0008Am-2U
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 06:06:11 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hyZ7Y-0003CI-Fg
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 06:06:09 -0400
Received: from mail-wr1-f65.google.com ([209.85.221.65]:35811)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hyZ7Y-0003BE-8g
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 06:06:08 -0400
Received: by mail-wr1-f65.google.com with SMTP id k2so1012996wrq.2
 for <qemu-arm@nongnu.org>; Fri, 16 Aug 2019 03:06:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=4nmllPcEhYaEJs68tgHuQ5qqmn++ZDafoOXvJZcokHk=;
 b=hfWWCJd7runNr3KpDCmTbN8nA5oZoptUmEVVX0sKxCuiHXQEKNQ+mR93qlJeF71rEx
 wfC/FvhFbUmwAoaB0473Jb6jg+7dvxgT6S9e5rdo3KaFkEq6aQQy8pDawGxhOYiupq4b
 LcKQQeckz0QjEE8sHShsAN/92PbpiLeNmZvbrYUa8QJYqlJDcQm7cWpz+tg3ywNE1TVV
 /RNcQIBTyLXCk937Q0YLM/wVWuz9MV3QZbS6lYQcjW5+0D1w8mTeXw68rEjlAfMBgtKu
 N5v9zJHDQwPZ0Y86OQbXRrW1JRVugQaT7pQSYukt5/F8shtp64v+EU6pf4OZZF7PX4bD
 NrWA==
X-Gm-Message-State: APjAAAU6m0Dsr/YTrwwF5HqnJKkfjJ9rhg4x7LTbjYUvMxSGeQOXFDDL
 YDYeCwUpvXFOM5Kdn6ObqPi/yw==
X-Received: by 2002:adf:dd01:: with SMTP id a1mr9597279wrm.12.1565949967319;
 Fri, 16 Aug 2019 03:06:07 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id u130sm8566224wmg.28.2019.08.16.03.06.03
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 16 Aug 2019 03:06:06 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565940916012.8169@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <22d6f51c-c734-3976-2fc1-34c9c74a075e@redhat.com>
Date: Fri, 16 Aug 2019 12:06:02 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1565940916012.8169@bt.com>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.221.65
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 27/42] hw/pci-host: Declare
 device little or big endian
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
Cc: frederic.konrad@adacore.com, berto@igalia.com, qemu-block@nongnu.org,
 arikalo@wavecomp.com, pasic@linux.ibm.com, hpoussin@reactos.org,
 anthony.perard@citrix.com, xen-devel@lists.xenproject.org, balrogg@gmail.com,
 jasowang@redhat.com, jiri@resnulli.us, ehabkost@redhat.com,
 b.galvani@gmail.com, eric.auger@redhat.com, alex.williamson@redhat.com,
 stefanha@redhat.com, jsnow@redhat.com, rth@twiddle.net, kwolf@redhat.com,
 andrew@aj.id.au, claudio.fontana@suse.com, crwulff@gmail.com,
 laurent@vivier.eu, sundeep.lkml@gmail.com, michael@walle.cc,
 qemu-ppc@nongnu.org, kbastian@mail.uni-paderborn.de, imammedo@redhat.com,
 fam@euphon.net, peter.maydell@linaro.org, david@redhat.com, palmer@sifive.com,
 balaton@eik.bme.hu, keith.busch@intel.com, jcmvbkbc@gmail.com, hare@suse.com,
 sstabellini@kernel.org, andrew.smirnov@gmail.com, deller@gmx.de,
 magnus.damm@gmail.com, marcel.apfelbaum@gmail.com, atar4qemu@gmail.com,
 minyard@acm.org, sw@weilnetz.de, yuval.shaia@oracle.com, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, jan.kiszka@web.de, clg@kaod.org, shorne@gmail.com,
 qemu-riscv@nongnu.org, i.mitsyanko@gmail.com, cohuck@redhat.com,
 amarkovic@wavecomp.com, peter.chubb@nicta.com.au, aurelien@aurel32.net,
 pburton@wavecomp.com, sagark@eecs.berkeley.edu, green@moxielogic.com,
 kraxel@redhat.com, gxt@mprc.pku.edu.cn, robh@kernel.org,
 borntraeger@de.ibm.com, joel@jms.id.au, antonynpavlov@gmail.com,
 chouteau@adacore.com, lersek@redhat.com, Andrew.Baumann@microsoft.com,
 mreitz@redhat.com, walling@linux.ibm.com, dmitry.fleytman@gmail.com,
 mst@redhat.com, mark.cave-ayland@ilande.co.uk, jslaby@suse.cz, marex@denx.de,
 proljc@gmail.com, marcandre.lureau@redhat.com, alistair@alistair23.me,
 paul.durrant@citrix.com, david@gibson.dropbear.id.au,
 xiaoguangrong.eric@gmail.com, huth@tuxfamily.org, jcd@tribudubois.net,
 pbonzini@redhat.com, stefanb@linux.ibm.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: jtMjPViZ7ewH

On 8/16/19 9:35 AM, tony.nguyen@bt.com wrote:
> For each device declared with DEVICE_NATIVE_ENDIAN, find the set of
> targets from the set of target/hw/*/device.o.
> 
> If the set of targets are all little or all big endian, re-declare
> the device endianness as DEVICE_LITTLE_ENDIAN or DEVICE_BIG_ENDIAN
> respectively.
> 
> This *naive* deduction may result in genuinely native endian devices
> being incorrectly declared as little or big endian, but should not
> introduce regressions for current targets.
> 
> These devices should be re-declared as DEVICE_NATIVE_ENDIAN if 1) it
> has a new target with an opposite endian or 2) someone informed knows
> better =)
> 
> Signed-off-by: Tony Nguyen <tony.nguyen@bt.com>
> ---
>  hw/pci-host/q35.c       | 2 +-
>  hw/pci-host/versatile.c | 4 ++--
>  2 files changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index 0a010be..fd20f72 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -288,7 +288,7 @@ static void tseg_blackhole_write(void *opaque,
> hwaddr addr, uint64_t val,
>  static const MemoryRegionOps tseg_blackhole_ops = {
>      .read = tseg_blackhole_read,
>      .write = tseg_blackhole_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,

OK.

>      .valid.min_access_size = 1,
>      .valid.max_access_size = 4,
>      .impl.min_access_size = 4,
> diff --git a/hw/pci-host/versatile.c b/hw/pci-host/versatile.c
> index 791b321..e7017f3 100644
> --- a/hw/pci-host/versatile.c
> +++ b/hw/pci-host/versatile.c
> @@ -240,7 +240,7 @@ static uint64_t pci_vpb_reg_read(void *opaque,
> hwaddr addr,
>  static const MemoryRegionOps pci_vpb_reg_ops = {
>      .read = pci_vpb_reg_read,
>      .write = pci_vpb_reg_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
>      .valid = {
>          .min_access_size = 4,
>          .max_access_size = 4,
> @@ -306,7 +306,7 @@ static uint64_t pci_vpb_config_read(void *opaque,
> hwaddr addr,
>  static const MemoryRegionOps pci_vpb_config_ops = {
>      .read = pci_vpb_config_read,
>      .write = pci_vpb_config_write,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,

Eh hard to say, PCI is not clear about endianess...

>  };
>  
>  static int pci_vpb_map_irq(PCIDevice *d, int irq_num)
> -- 
> 1.8.3.1
> 
> ​
> 
> 
