Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp1532981wrq;
        Wed, 23 Oct 2019 16:03:09 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzwI/cra/l3oOb2XRzUpmTmIgKOPXdEQRZc2DylUUIjNKwFe7pyujNKaaApJjdbMpWO7OuR
X-Received: by 2002:a37:9d96:: with SMTP id g144mr11322461qke.93.1571871789064;
        Wed, 23 Oct 2019 16:03:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571871789; cv=none;
        d=google.com; s=arc-20160816;
        b=hO0b9laEWoK8Yp2PWCmTj7PUvu3/BlJG5F7rbUh5pmE7XFLaYNuh3D1j9mulBESsDc
         iD3fXJEHH1VMLBFsr20jRuxDfeUyuw34Vv5pB5CC68HilpswXMXXzlPIlB/TKdl0w7aG
         x48I6ZY0dBiLWnEJinVmm4aYc8l5hd2VC2hRZxbm8fKPgykyR/uJuVDmp6/AIsJxncL2
         U7Y6HSgu4ed8szdwEuQYmqYi6CGbh5LCDToRqUkqDjmc/Jm5CGTmbrcLtx5mScp2kbSb
         5xbyN0w9BB3i5xWjT9Z4mXphsaKU31HQIoC4eHZeponsz+XgcNGuvUxcNQtQlN0/icbk
         NZTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject;
        bh=jiA49xxLooCeZCELNWktRrVaV5liu190QCoiSuwIj24=;
        b=MTu3CxJm+UOSoiGQeJyhxT3vRscyQ6CnrFGBxrKLWh8QXeuz1c06WsO585DIJ3EcFE
         hZsI8btBYydSQ+TNlRidm0Y+NTaGBYk7MIr3i5BpXL20ouwezXAXO/ub/QAgDND8GJ1a
         C68EVLACaZ72Oh1u4pqfPZanZ8REmM4VC1zYAT4e1BzUMv2oeQAggGTOytIYBVcgc3SK
         Yx0nXAOdPx2jcRYNNeVIXatrUC776PahaCDHeeBlCVRwYtrUxLBWeQxASHf2IQEtyaT/
         51dcwUgekK6XVy8MayDwHAPRp0laoqVKBXjUzV0UwyCBML8YO6KraBUDx/4qsHqwctwb
         1yaw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x64si22976qte.289.2019.10.23.16.03.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Oct 2019 16:03:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52156 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNPel-0002Z6-SX
	for alex.bennee@linaro.org; Wed, 23 Oct 2019 19:03:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60757)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1iNPeS-0002SU-O7
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 19:02:49 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1iNPeR-0000TT-HF
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 19:02:48 -0400
Received: from mx1.redhat.com ([209.132.183.28]:50924)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1iNPeR-0000TA-9c
 for qemu-arm@nongnu.org; Wed, 23 Oct 2019 19:02:47 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 3ECE785550
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 23:02:46 +0000 (UTC)
Received: by mail-wr1-f71.google.com with SMTP id 67so11770400wrm.18
 for <qemu-arm@nongnu.org>; Wed, 23 Oct 2019 16:02:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=NbN8nXL/7OUD5AseCS8Rxjxq6seb8+nEYKYOUhNwpgY=;
 b=NKm5C1J3QZID2ap/thEY69xzZTtVYQNCUjE5GqvkQSdw3Yo1D38uxQmFjWQr5ifbW6
 9l12VS3RfcKC4atMUL+U8eaUMDJB/hKOWmNY1H1S8AbJE3VkARuz5pf7LnpcYBnO2EFd
 NH3xYOTufXIfGZcTRImWrdDxyvtzzC6AoESgCgf1IFXNmwtXf6TxN6u+iKQZsgq+O9Yh
 gwuMIAidvtZBfm7J8aaqEVIDR7Z/B9qTafPv7jNqtKOik+TUyFABFb9C+inHId/Y2XH/
 Nh7KEM7rwgJFuGDyAz2Mx2oSEp2TB/78Mh8o450SPzXPpkncKnqImAzB98dM2Xgdv7CF
 jZVw==
X-Gm-Message-State: APjAAAWX29KbtuEFNcYp5rduLS2wlc+WXAddcCPyA70NnEFLQ70H5nAQ
 0UmvDQz6J8Bctn7Okke/0qACTSCk2tEolBHtpyD1oV3aCDjY74MC+dA9Rjz+BzmzSO9+gmhPRpa
 2lEEocdn7bj9J
X-Received: by 2002:adf:e28f:: with SMTP id v15mr917939wri.130.1571871764871; 
 Wed, 23 Oct 2019 16:02:44 -0700 (PDT)
X-Received: by 2002:adf:e28f:: with SMTP id v15mr917920wri.130.1571871764660; 
 Wed, 23 Oct 2019 16:02:44 -0700 (PDT)
Received: from [192.168.1.41] (129.red-83-57-174.dynamicip.rima-tde.net.
 [83.57.174.129])
 by smtp.gmail.com with ESMTPSA id a4sm521075wmm.10.2019.10.23.16.02.43
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Oct 2019 16:02:44 -0700 (PDT)
Subject: Re: [PATCH v3 23/33] dp8393x: replace PROP_PTR with PROP_LINK
To: =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 qemu-devel@nongnu.org
References: <20191023173154.30051-1-marcandre.lureau@redhat.com>
 <20191023173154.30051-24-marcandre.lureau@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <06288994-a5d3-038d-794e-ed63acdadd95@redhat.com>
Date: Thu, 24 Oct 2019 01:02:42 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191023173154.30051-24-marcandre.lureau@redhat.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
Cc: Corey Minyard <cminyard@mvista.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Magnus Damm <magnus.damm@gmail.com>,
 Jason Wang <jasowang@redhat.com>, qemu-ppc@nongnu.org,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Fabien Chouteau <chouteau@adacore.com>,
 Aleksandar Rikalo <arikalo@wavecomp.com>,
 KONRAD Frederic <frederic.konrad@adacore.com>, qemu-arm@nongnu.org,
 =?UTF-8?Q?Herv=c3=a9_Poussineau?= <hpoussin@reactos.org>,
 Aurelien Jarno <aurelien@aurel32.net>,
 Aleksandar Markovic <amarkovic@wavecomp.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Paul Burton <pburton@wavecomp.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /Z66gMwQl0JM

On 10/23/19 7:31 PM, Marc-Andr=C3=A9 Lureau wrote:
> Link property is the correct way to pass a MemoryRegion to a device
> for DMA purposes.
>=20
> Sidenote: as a sysbus device, this remains non-usercreatable
> even though we can drop the specific flag here.
>=20
> Signed-off-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>
> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
> ---
>   hw/mips/mips_jazz.c | 3 ++-
>   hw/net/dp8393x.c    | 7 +++----
>   2 files changed, 5 insertions(+), 5 deletions(-)
>=20
> diff --git a/hw/mips/mips_jazz.c b/hw/mips/mips_jazz.c
> index 8d010a0b6e..878925a963 100644
> --- a/hw/mips/mips_jazz.c
> +++ b/hw/mips/mips_jazz.c
> @@ -284,7 +284,8 @@ static void mips_jazz_init(MachineState *machine,
>               dev =3D qdev_create(NULL, "dp8393x");
>               qdev_set_nic_properties(dev, nd);
>               qdev_prop_set_uint8(dev, "it_shift", 2);
> -            qdev_prop_set_ptr(dev, "dma_mr", rc4030_dma_mr);
> +            object_property_set_link(OBJECT(dev), OBJECT(rc4030_dma_mr=
),
> +                                     "dma_mr", &error_abort);
>               qdev_init_nofail(dev);
>               sysbus =3D SYS_BUS_DEVICE(dev);
>               sysbus_mmio_map(sysbus, 0, 0x80001000);
> diff --git a/hw/net/dp8393x.c b/hw/net/dp8393x.c
> index a5678e11fa..946c7a8f64 100644
> --- a/hw/net/dp8393x.c
> +++ b/hw/net/dp8393x.c
> @@ -173,7 +173,7 @@ typedef struct dp8393xState {
>       int loopback_packet;
>  =20
>       /* Memory access */
> -    void *dma_mr;
> +    MemoryRegion *dma_mr;
>       AddressSpace as;
>   } dp8393xState;
>  =20
> @@ -922,7 +922,8 @@ static const VMStateDescription vmstate_dp8393x =3D=
 {
>  =20
>   static Property dp8393x_properties[] =3D {
>       DEFINE_NIC_PROPERTIES(dp8393xState, conf),
> -    DEFINE_PROP_PTR("dma_mr", dp8393xState, dma_mr),
> +    DEFINE_PROP_LINK("dma_mr", dp8393xState, dma_mr,
> +                     TYPE_MEMORY_REGION, MemoryRegion *),
>       DEFINE_PROP_UINT8("it_shift", dp8393xState, it_shift, 0),
>       DEFINE_PROP_END_OF_LIST(),
>   };
> @@ -936,8 +937,6 @@ static void dp8393x_class_init(ObjectClass *klass, =
void *data)
>       dc->reset =3D dp8393x_reset;
>       dc->vmsd =3D &vmstate_dp8393x;
>       dc->props =3D dp8393x_properties;
> -    /* Reason: dma_mr property can't be set */
> -    dc->user_creatable =3D false;

Patch is OK except this user_creatable change I don't understand.

>   }
>  =20
>   static const TypeInfo dp8393x_info =3D {
>=20
