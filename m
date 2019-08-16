Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp596992wrs;
        Fri, 16 Aug 2019 03:02:19 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy5Fly4jAmjSGLHSM0qIj9g4YgSpF8eVJYDJeiCHli8kX4vWizgayU3C5bf4WMWR9aWz5Iu
X-Received: by 2002:ac8:42c4:: with SMTP id g4mr7894604qtm.228.1565949739226;
        Fri, 16 Aug 2019 03:02:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565949739; cv=none;
        d=google.com; s=arc-20160816;
        b=wQQegbSiZjPe9q67Upad9gqAyeWxTgRoPRMYaJeqmQlK/qqvU6nQwBP01pVmY5A8ZN
         zSBxYUA5q0K0OHRjp2HUduvA9NotVOJJqbOe9+yn05tWNQjjZy0i8xrelOMOKzVvCS8L
         oegx1OANtyAeo9d750cZrV2bFB0+3d9QAvpyXyEQ/Nw9JRzu8JInUrbLT3WBvhrQ8USi
         TvHVwP/9s5/qCN79VJ2XoJYqoHj5HrZM77uGiLCZ5QutQtmOHKbdldA/CKypFDFotPGe
         gaBObph05qIvcW0ndSfeN67gRT0cln6S489vLM0Ms3hhcetq0c50i8u5C5o2CfUTc9GJ
         DKnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=GI/EzkhAlPTCaafFlruhK2NwuW2KBxYpRI4/Zpxnrmg=;
        b=urVPOw/ApZYcV9wOaFP4ZXzO7kXNfSXrI3d21FIqCstupgQVUwsEWYah548KaX/FLV
         A700SS+OQxbCBa78gbXECUe7NMNSSwLjZRYFRKaldmicKgrAiK2juSqMVpNEDBdNLwIl
         xgKdPiJhlA6WJiz/YGbXrZu1Z/iHFINE1umOdZK39pPhznjQMsz/AwPDv5R6bvXuaJ9m
         9cB9NCGUDAuucy6Fyu0WhTjQkvBfK39DuyZgasNpQvcK7U9PoWQOOk3lekjq9WbIlvd0
         J9sdUC2JM4Nw5GI61YUYTDCV8w0TI2CIjsWsrHX6NKt/eSIjx2l4crt3DJd265kYD7Pf
         Un6A==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w35si3287090qvc.133.2019.08.16.03.02.19
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 16 Aug 2019 03:02:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52782 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hyZ3q-0005D4-J7
	for alex.bennee@linaro.org; Fri, 16 Aug 2019 06:02:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34662)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1hyZ3Y-0005CK-To
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 06:02:02 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1hyZ3X-0000xF-Ob
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 06:02:00 -0400
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53281)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hyZ3X-0000wO-EC
 for qemu-arm@nongnu.org; Fri, 16 Aug 2019 06:01:59 -0400
Received: by mail-wm1-f68.google.com with SMTP id 10so3583342wmp.3
 for <qemu-arm@nongnu.org>; Fri, 16 Aug 2019 03:01:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
 :date:user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=GI/EzkhAlPTCaafFlruhK2NwuW2KBxYpRI4/Zpxnrmg=;
 b=HHkaGhpS4P+MfpM0XI9hxaA0KPzW6LAO7V4KzPnT2sqKUdRZBy5drwhPNgZW3pS7hi
 TcQLMS4YlHnS2z+T4gC2vmkj/rynHywyrSC9j7Brm9nW7/lAo0WyNpn/U7id8WRPksZR
 XghIOGH5oCJ8RcLJEf3TxQLg+UNaA/nex6wmB9l6jW/qHdECAmFSQnfjr8UvthZ/48qM
 8GSI2tCIxPKH0AFCMEe0PDy01T/35+hUwaAlV9cNNcKIe/UbtFLSV5vAefcnHHUUvmNF
 l2BLWD6WtoFZ/Tyv5FEs8BUV6MChxmaSFtqHu3xaVkLh4n0p4SpbFrpKXQtL9/U0dVYr
 QVjA==
X-Gm-Message-State: APjAAAVLtwZ7T0DfBDIQnNybHMSHlHEZaSPdkAmuA+VTVGy2q7vvJNAG
 SX+4MvUtGrlxjOQV8BiCeCsugg==
X-Received: by 2002:a7b:c4d5:: with SMTP id g21mr6485221wmk.149.1565949718440; 
 Fri, 16 Aug 2019 03:01:58 -0700 (PDT)
Received: from [192.168.1.39] (251.red-88-10-102.dynamicip.rima-tde.net.
 [88.10.102.251])
 by smtp.gmail.com with ESMTPSA id x6sm5463863wrt.63.2019.08.16.03.01.54
 (version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
 Fri, 16 Aug 2019 03:01:57 -0700 (PDT)
To: tony.nguyen@bt.com, qemu-devel@nongnu.org
References: <43bc5e07ac614d0e8e740bf6007ff77b@tpw09926dag18e.domain1.systemhost.net>
 <1565940869312.41180@bt.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
 url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <64d9f983-31e3-6921-4e0f-cd630581ec61@redhat.com>
Date: Fri, 16 Aug 2019 12:01:47 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1565940869312.41180@bt.com>
Content-Type: text/plain; charset=UTF-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.85.128.68
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v7 24/42] hw/isa: Declare device
 little or big endian
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
X-TUID: /rQHyl0MNgBq

On 8/16/19 9:34 AM, tony.nguyen@bt.com wrote:
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
>  hw/isa/vt82c686.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/isa/vt82c686.c b/hw/isa/vt82c686.c
> index 12c460590..adf65d3 100644
> --- a/hw/isa/vt82c686.c
> +++ b/hw/isa/vt82c686.c
> @@ -108,7 +108,7 @@ static uint64_t superio_ioport_readb(void *opaque,
> hwaddr addr, unsigned size)
>  static const MemoryRegionOps superio_ops = {
>      .read = superio_ioport_readb,
>      .write = superio_ioport_writeb,
> -    .endianness = DEVICE_NATIVE_ENDIAN,
> +    .endianness = DEVICE_LITTLE_ENDIAN,

Being ioport, one is probably OK.

>      .impl = {
>          .min_access_size = 1,
>          .max_access_size = 1,
> -- 
> 1.8.3.1
> 
> ​
> 
