Received: by 2002:a19:ad09:0:0:0:0:0 with SMTP id t9csp543759lfc;
        Wed, 26 Aug 2020 01:05:39 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxn5PhK7CyicziStCfTJy2Xt9Iw3p+4iia+M+XTct1b5AXG0rpt4Hbt5DENBtvhnqKpFWDO
X-Received: by 2002:a50:c8ca:: with SMTP id k10mr13418422edh.255.1598429139053;
        Wed, 26 Aug 2020 01:05:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1598429139; cv=none;
        d=google.com; s=arc-20160816;
        b=Nxie2mccZLL5XA3RKCvhniXoDW6XxfE5cL6A4cNrMQIEO0tpULZojqJ3IemAmWBcLi
         OvUc6r4SpB1zD48tWxJo7uXyq+QMBDiu7nsVeapCmeeP5WTVZhVgmihhehwPNNmwWfSg
         hHeiToCiArqZFDzWWkhriFQuVYmh4NHvjK71FzeYc8cXLwbHpKh+VV+oTNSxpKR3sZiN
         dlncCpqGZoTwLS9oHqUPMORgGaKgwFMNggiSi4RXvlu7i7Wg1HWK+BT3thiOBw/ezQ2p
         udojUWwqihKnADo0IhNuwEf1MmqGqKuXa5h3nkoS0yKVH5pxSiq+SG0XgFSHGECDFx2Y
         yLLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=list-id:precedence:sender:content-transfer-encoding:mime-version
         :message-id:date:reply-to:user-agent:references:in-reply-to:subject
         :cc:to:from:dkim-signature;
        bh=NImKQq5ezsHefkpdy9SfbA9+4hFpj3XxE5AoedYCYBg=;
        b=vXxmT1rXl60o+osdyuMUi6+fNQhKwvwSZNJ6FEYWz34xqKuGXBWeKNErPswTGdHqnL
         Gyu2QH9oR86XJiti8W4siuKgbbypVM1e52ofGSbq9g6Ioc8wES3XIwuxSs0UKwYmNrnu
         OD2dMWTEyGycCvPZK9Dn5NbFdiTxkfCft2nOAIKHBYAXNIe9lmzhcKkD56JePQhW8tO8
         hVcShlQmrRXD5FuclNinuaBpHxSwrdftJReiXdmzF7sOzIgjyZhSCQBFE3q8ryAEmfgS
         GqS8EWSHRVAsp5u8Oi+dDRuLWfN0xTCFRvZxoRM9Yay0g/1NgGbCLb7qT3P9UFeLqu+m
         Afkw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XtFmhAvq;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kvm-owner@vger.kernel.org>
Received: from vger.kernel.org (vger.kernel.org. [23.128.96.18])
        by mx.google.com with ESMTP id d19si985818edx.221.2020.08.26.01.05.38;
        Wed, 26 Aug 2020 01:05:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) client-ip=23.128.96.18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XtFmhAvq;
       spf=pass (google.com: domain of kvm-owner@vger.kernel.org designates 23.128.96.18 as permitted sender) smtp.mailfrom=kvm-owner@vger.kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726747AbgHZIFh (ORCPT <rfc822;naresh.kamboju@linaro.org>
        + 5 others); Wed, 26 Aug 2020 04:05:37 -0400
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:53268 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726016AbgHZIFf (ORCPT <rfc822;kvm@vger.kernel.org>);
        Wed, 26 Aug 2020 04:05:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1598429133;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=NImKQq5ezsHefkpdy9SfbA9+4hFpj3XxE5AoedYCYBg=;
        b=XtFmhAvqxYLPJ8n2TrkUfEv3R5rCJ6FAHtwFX6p0MzqW9SNRTCVTLzMFipodr4HQJZiSoJ
        YcfNEF0frt2bBEWFaPRaP6hqB/2GwOY5PC0paCXCZ1MKoS/XgelWBnarkHWSMHrnREyh5d
        83byfrNW1GS62RJ5gK1RVfLyF0Vxabc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-25-Y3U_pUH2Ob-3gNy2ezJ8lQ-1; Wed, 26 Aug 2020 04:05:31 -0400
X-MC-Unique: Y3U_pUH2Ob-3gNy2ezJ8lQ-1
Received: by mail-wr1-f72.google.com with SMTP id 3so236937wrm.4
        for <kvm@vger.kernel.org>; Wed, 26 Aug 2020 01:05:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:in-reply-to:references
         :user-agent:reply-to:date:message-id:mime-version
         :content-transfer-encoding;
        bh=NImKQq5ezsHefkpdy9SfbA9+4hFpj3XxE5AoedYCYBg=;
        b=a3CbAbYxtp9tZDRFoAiXjZ61CLRtGU3fJlZecJy6RfxvGu93Zu3giSBcAFn0bqLmZi
         HCGqvqq76GLGfEbsvBbZ5HIsEtpFnXzx7joa69hCTde8vR9paBqAkKZWSSxd/CVQd35D
         I6axlNEZXILHxuQu9D4jGyKHvhiyo1A8MRXT3kblNApT4l18wtVptvo6mDoNiwtlirMp
         Tdqk6Zd7xZC3ok7Fme3Ro6m3WIEG8rk6S/1F/pkoeIhyr0sPrJbA6umNJCgti61/pBtE
         cwuzia4rWnP+U1KmzIpX9PRaoRJbjJVZrbrJvl5INJWpV+WQ7NUUbSwUZLXzIZnQ/R0M
         u3Kw==
X-Gm-Message-State: AOAM5327WI/4x6LxV80nu1WWOgJuuwYPA7IdU71hDeRQzog/ev2UlFDZ
        ywQlLr+S0bx7eLWAtsSSH44ExUEP3kQsBKTn22deBpk2uCIp2KltNa87z8Gbd123WxM44zwceS3
        j1HXUATXr6vTO
X-Received: by 2002:adf:eec4:: with SMTP id a4mr14022210wrp.325.1598429130568;
        Wed, 26 Aug 2020 01:05:30 -0700 (PDT)
X-Received: by 2002:adf:eec4:: with SMTP id a4mr14022174wrp.325.1598429130323;
        Wed, 26 Aug 2020 01:05:30 -0700 (PDT)
Received: from localhost (trasno.trasno.org. [83.165.45.250])
        by smtp.gmail.com with ESMTPSA id d11sm4063512wrw.77.2020.08.26.01.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2020 01:05:29 -0700 (PDT)
From:   Juan Quintela <quintela@redhat.com>
To:     Eduardo Habkost <ehabkost@redhat.com>
Cc:     qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-block@nongnu.org,
        qemu-s390x@nongnu.org, qemu-ppc@nongnu.org, kvm@vger.kernel.org,
        xen-devel@lists.xenproject.org, qemu-riscv@nongnu.org
Subject: Re: [PATCH v3 64/74] [automated] Move QOM typedefs and add missing includes
In-Reply-To: <20200825192110.3528606-65-ehabkost@redhat.com> (Eduardo
        Habkost's message of "Tue, 25 Aug 2020 15:21:00 -0400")
References: <20200825192110.3528606-1-ehabkost@redhat.com>
        <20200825192110.3528606-65-ehabkost@redhat.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.3 (gnu/linux)
Reply-To: quintela@redhat.com
Date:   Wed, 26 Aug 2020 10:05:28 +0200
Message-ID: <87o8mxygqf.fsf@secure.mitica>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Sender: kvm-owner@vger.kernel.org
Precedence: bulk
List-ID: <kvm.vger.kernel.org>
X-Mailing-List: kvm@vger.kernel.org
X-TUID: nqD+9YoQvXtK


[dropped people from CC]

Eduardo Habkost <ehabkost@redhat.com> wrote:
> Some typedefs and macros are defined after the type check macros.
> This makes it difficult to automatically replace their
> definitions with OBJECT_DECLARE_TYPE.
>
> Patch generated using:
>
>  $ ./scripts/codeconverter/converter.py -i \
>    --pattern=3DQOMStructTypedefSplit $(git grep -l '' -- '*.[ch]')
>
> which will split "typdef struct { ... } TypedefName"
> declarations.
>
> Followed by:
>
>  $ ./scripts/codeconverter/converter.py -i --pattern=3DMoveSymbols \
>     $(git grep -l '' -- '*.[ch]')
>
> which will:
> - move the typedefs and #defines above the type check macros
> - add missing #include "qom/object.h" lines if necessary
>
> Reviewed-by: Daniel P. Berrang=C3=A9 <berrange@redhat.com>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>
> ---
> Changes v2 -> v3:
> * Removed hunks due to rebase conflicts: hw/arm/integratorcp.c
>   hw/arm/versatilepb.c hw/arm/vexpress.c hw/sd/pl181.c
>   include/hw/ppc/xive.h
> * Removed hunks due to conflicts with other patches in this
>   series: include/hw/block/swim.h include/hw/display/macfb.h
>   include/hw/rdma/rdma.h migration/migration.h
>   target/rx/cpu-qom.h
> * Reviewed-by line from Daniel was kept, as no additional hunks
>   are introduced in this version
>
> Changes v1 -> v2:
> * Re-ran script after moving a few macros and typedefs.  Now the
>   patch also changes:
>   - SysbusAHCIState at hw/ide/ahci.h
>   - VhostUserGPU at hw/virtio/virtio-gpu.h
>   - I8257State at hw/dma/i8257.h
>   - AllwinnerAHCIState at hw/ide/ahci.h
>   - ISAKBDState at hw/input/i8042.h
>   - PIIXState at hw/southbridge/piix.h
>   - VFIOPCIDevice at hw/vfio/pci.h
>   - missing include at hw/net/rocker/rocker.h
>   - missing include at hw/scsi/mptsas.h
>   - missing include at include/hw/arm/pxa.h
>   - missing include at include/sysemu/kvm.h
>
> Signed-off-by: Eduardo Habkost <ehabkost@redhat.com>

> diff --git a/migration/rdma.c b/migration/rdma.c
> index 15ad985d26..e3eac913bc 100644
> --- a/migration/rdma.c
> +++ b/migration/rdma.c
> @@ -35,6 +35,7 @@
>  #include <arpa/inet.h>
>  #include <rdma/rdma_cma.h>
>  #include "trace.h"
> +#include "qom/object.h"
>=20=20
>  /*
>   * Print and error on both the Monitor and the Log file.
> @@ -397,10 +398,10 @@ typedef struct RDMAContext {
>  } RDMAContext;
>=20=20
>  #define TYPE_QIO_CHANNEL_RDMA "qio-channel-rdma"
> +typedef struct QIOChannelRDMA QIOChannelRDMA;
>  #define QIO_CHANNEL_RDMA(obj)                                     \
>      OBJECT_CHECK(QIOChannelRDMA, (obj), TYPE_QIO_CHANNEL_RDMA)
>=20=20
> -typedef struct QIOChannelRDMA QIOChannelRDMA;
>=20=20
>=20=20
>  struct QIOChannelRDMA {

Reviewed-by: Juan Quintela <quintela@redhat.com>
