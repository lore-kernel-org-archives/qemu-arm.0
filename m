Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp2806865wrt;
        Mon, 14 Jan 2019 00:44:29 -0800 (PST)
X-Google-Smtp-Source: ALg8bN4B2c1LJaD95kZ+JrbzeXoXnnB2nqrRqyYlI49mTTMeAEgqrN/avhKSmgcZTB9r1dD3neGQ
X-Received: by 2002:adf:e284:: with SMTP id v4mr22393889wri.26.1547455469496;
        Mon, 14 Jan 2019 00:44:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547455469; cv=none;
        d=google.com; s=arc-20160816;
        b=Zo2/uUn3KtJqCbJptITMeOK8UN+BmtDbziB5KCwW1RzTtfISp1zgBJcgnwqCKJyh8d
         BEKoYInRqMKkC/a4KdYGUkDCd07WK1vlir2Vg6/2e9RCWbfL5ceeP/pkQqnQUdtMNfdJ
         /46SIeIoftcgTVJ3K3a+2ZJ7gQH14PCC5OTsZuN64OLyQWOUFW4nXISm2zWUUgN/8S7I
         RAGFcqelFi0ToEnjFhBB1vfFXEkvm6X1AT0ru7RVOkLtKu8Edj6HsG0m0mIVAC3vfvgB
         eZ5O80F/z04Qaot/clPmoiaarML2kCOmEU7dV/F9fOLoCSkcNo8VRM2yGr6k+DXmey5W
         3c9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:to;
        bh=jj4vd0xmr5dgpPB+BU/ZoXW4xa/mSyUUPJuSY8Xve9k=;
        b=zelUgty5VPE2ds94iB5GCVQl+YsQdbq6vxwbmRaTCJZUIoizpEcXEz1NaO+osQFnbD
         jmFFfAwIeixWtJROC+xHIKPeB03Cb6wrkB0UotShk+NErkWw5W+drLAkelyZp//Pj7dj
         fpBT0HbB14RnR6IpbJmw6SA3vkHyWqKErCTr5VoBWaip1z6V/kaMTkfWlwdN69U04m9H
         WCbs3Z+NLAM6akY5jsXFD9rC3303af6ATNGQRhxx9QDpXzNwcP1640v2I+UnSfXGT02l
         n/zf90yJ070HJS/AJN7TnR6tXrtzr15pgJWadl7VavfFVmO5aM3k81dclEYNzSayLFTt
         Rimw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y191si17755182wmc.97.2019.01.14.00.44.29
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 14 Jan 2019 00:44:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:40302 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gixrA-0005vO-Hl
	for alex.bennee@linaro.org; Mon, 14 Jan 2019 03:44:28 -0500
Received: from eggs.gnu.org ([209.51.188.92]:55492)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gixr1-0005v3-S2
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 03:44:22 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thuth@redhat.com>) id 1gixr0-0000j9-P3
	for qemu-arm@nongnu.org; Mon, 14 Jan 2019 03:44:19 -0500
Received: from mx1.redhat.com ([209.132.183.28]:45816)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <thuth@redhat.com>)
	id 1gixr0-0000ii-FG; Mon, 14 Jan 2019 03:44:18 -0500
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com
	[10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 57FDF6147B;
	Mon, 14 Jan 2019 08:44:17 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-190.ams2.redhat.com [10.36.116.190])
	by smtp.corp.redhat.com (Postfix) with ESMTP id E65DE608E5;
	Mon, 14 Jan 2019 08:44:05 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, qemu-devel@nongnu.org
References: <20190111140857.4211-1-philmd@redhat.com>
	<20190111140857.4211-4-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
	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
Organization: Red Hat
Message-ID: <0ab7861d-9be4-49ac-76bb-6786b8b18546@redhat.com>
Date: Mon, 14 Jan 2019 09:44:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190111140857.4211-4-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.39]);
	Mon, 14 Jan 2019 08:44:17 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 03/15] hw/ssi: Remove SSIBus from
 "qemu/typedefs.h"
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alistair Francis <alistair@alistair23.me>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	=?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
	qemu-arm@nongnu.org, Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: wCRQNurxaZxR

On 2019-01-11 15:08, Philippe Mathieu-Daud=C3=A9 wrote:
> From: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>=20
> There are only three files requiring this typedef, let them

s/files/header files/

Reviewed-by: Thomas Huth <thuth@redhat.com>

> include "hw/ssi/ssi.h" directly to simplify "qemu/typedefs.h".
>=20
> To clean "qemu/typedefs.h", move the forward declaration
> to "hw/ssi/ssi.h".
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  hw/arm/strongarm.h      | 1 +
>  include/hw/arm/pxa.h    | 1 +
>  include/hw/ssi/pl022.h  | 1 +
>  include/hw/ssi/ssi.h    | 1 +
>  include/qemu/typedefs.h | 1 -
>  5 files changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/hw/arm/strongarm.h b/hw/arm/strongarm.h
> index e98840b461..ae51a1ae34 100644
> --- a/hw/arm/strongarm.h
> +++ b/hw/arm/strongarm.h
> @@ -3,6 +3,7 @@
> =20
>  #include "exec/memory.h"
>  #include "target/arm/cpu-qom.h"
> +#include "hw/ssi/ssi.h"
> =20
>  #define SA_CS0          0x00000000
>  #define SA_CS1          0x08000000
> diff --git a/include/hw/arm/pxa.h b/include/hw/arm/pxa.h
> index f6dfb5c0cf..f184349f02 100644
> --- a/include/hw/arm/pxa.h
> +++ b/include/hw/arm/pxa.h
> @@ -13,6 +13,7 @@
>  #include "exec/memory.h"
>  #include "target/arm/cpu-qom.h"
>  #include "hw/pcmcia.h"
> +#include "hw/ssi/ssi.h"
> =20
>  /* Interrupt numbers */
>  # define PXA2XX_PIC_SSP3	0
> diff --git a/include/hw/ssi/pl022.h b/include/hw/ssi/pl022.h
> index a080519366..1cf16f1539 100644
> --- a/include/hw/ssi/pl022.h
> +++ b/include/hw/ssi/pl022.h
> @@ -22,6 +22,7 @@
>  #define HW_SSI_PL022_H
> =20
>  #include "hw/sysbus.h"
> +#include "hw/ssi/ssi.h"
> =20
>  #define TYPE_PL022 "pl022"
>  #define PL022(obj) OBJECT_CHECK(PL022State, (obj), TYPE_PL022)
> diff --git a/include/hw/ssi/ssi.h b/include/hw/ssi/ssi.h
> index 6a0c3c3cdb..bdbf3c51f5 100644
> --- a/include/hw/ssi/ssi.h
> +++ b/include/hw/ssi/ssi.h
> @@ -13,6 +13,7 @@
> =20
>  #include "hw/qdev.h"
> =20
> +typedef struct SSIBus SSIBus;
>  typedef struct SSISlave SSISlave;
>  typedef struct SSISlaveClass SSISlaveClass;
>  typedef enum SSICSMode SSICSMode;
> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
> index 3bd9215d55..c026229573 100644
> --- a/include/qemu/typedefs.h
> +++ b/include/qemu/typedefs.h
> @@ -108,7 +108,6 @@ typedef struct Range Range;
>  typedef struct SerialState SerialState;
>  typedef struct SHPCDevice SHPCDevice;
>  typedef struct SMBusDevice SMBusDevice;
> -typedef struct SSIBus SSIBus;
>  typedef struct uWireSlave uWireSlave;
>  typedef struct VirtIODevice VirtIODevice;
>  typedef struct Visitor Visitor;
>=20

