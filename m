Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp80847ejb;
        Thu, 22 Dec 2022 18:59:08 -0800 (PST)
X-Google-Smtp-Source: AMrXdXuMquNNaZa8LPlTA/sLCRnwTPACV47j+pCm3H6xe1TiUTgsOhQi6b/4guLBym/U7Ma/I+rA
X-Received: by 2002:a05:6214:3c09:b0:52d:e201:c3d2 with SMTP id nt9-20020a0562143c0900b0052de201c3d2mr3716326qvb.33.1671764348800;
        Thu, 22 Dec 2022 18:59:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671764348; cv=none;
        d=google.com; s=arc-20160816;
        b=aKcHhEDVJ+P9Dk2X58RWBoaiRsq+Ce+lH7tvyfokKMycu8x43cyW6agdUV98LXyWJ4
         ff5U8j0EBiZec6fS5phonCNAbkEaPio15cp1e08LRLuY1HO1mpCOcGiZlOqKN95N2FSs
         U/3bnGGMtSltpVaJ3WgMk95EAXc4n8AzG5S/qokUvJyzOQ1hCUAcejRMmPQo3uGOAYFQ
         77xk0jeQFhaihFnmc0HN/ZohxhPLGR7x62TUUUfK6GsJYq+FKzr9LCnQCvbz/6EKofUN
         01UQ6tWEbwfGd+s3v/iPUtXL2Ehj327ssD2mDO6jKq5XKbtS5lQMTaZqgodLPuGMZ5LU
         UmyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=37T1Ua6f16ASCKshtuVi6SLKoblBpsm65cEzKCjvKw4=;
        b=IzDhrOVr27bjxFdQQIXe/2lxmEOkB0hfGatiSSDfv1nAzSQw9eRMjQ7wR6YiJPpTNa
         6MR9aiwOU8yOhC2hTpn3PB1il/VtcdJTaxjrglFqNHwNMQlcKR5YamjZI+2oC5r/Mf55
         YE/3N6yYGlerO6qjhZFsaC3nzBBCI16ciyWy5eNMPLut69LBkcvwRpb2w/xZrx8iHok6
         nFU32nYvg8LD0L0Fn0nphTWrRwzojFekvg0wgAk1Zxb6x0EYD4sE9566lQHN+oDFTpWx
         G8stwG8m//VYfiGfR3dMSNc/qz8vta3Mushi0Kr2hcwxe2I06gV9Sb+oRbZX4TP76ia1
         75cQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SInsW16k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p5-20020ad45f45000000b0052462cedd72si838217qvg.554.2022.12.22.18.59.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 22 Dec 2022 18:59:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=SInsW16k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p8YGR-0000z6-Vf; Thu, 22 Dec 2022 21:58:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p8YGP-0000yH-TE
 for qemu-arm@nongnu.org; Thu, 22 Dec 2022 21:58:25 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <jasowang@redhat.com>)
 id 1p8YGO-0000RL-1c
 for qemu-arm@nongnu.org; Thu, 22 Dec 2022 21:58:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671764303;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=37T1Ua6f16ASCKshtuVi6SLKoblBpsm65cEzKCjvKw4=;
 b=SInsW16kg1Tv0HlnYxA6ChPIgKTaL3TezhTdoptBKQo/7/DNib5sQI/AM1AY12VURg4Obk
 YBTy0ETDhDVxmw6FKSEGMSBZKhrycyJqp6fnoXRVYoAxqhJARxgLRQBr/V5UMymTt/jNXk
 Ux819aLpZ7O/dREwcnHmWbZLD9QbBy8=
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com
 [209.85.167.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-201-h5o_b4wxNsenUjf6GptOYA-1; Thu, 22 Dec 2022 21:58:19 -0500
X-MC-Unique: h5o_b4wxNsenUjf6GptOYA-1
Received: by mail-oi1-f198.google.com with SMTP id
 l15-20020a54450f000000b0035e4dc7f325so766418oil.20
 for <qemu-arm@nongnu.org>; Thu, 22 Dec 2022 18:58:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=37T1Ua6f16ASCKshtuVi6SLKoblBpsm65cEzKCjvKw4=;
 b=vbKSoKtm4rO2NkjXkTwlwyWt51tP3AdZIbYx2QCgTV8OxxVzNExHa5XuqWcIhu2sbh
 M/voT7uMxU3X5ASxh/oxkE5D7i+n75Es61QtwH2spBbZncpwHOyha67hXnq5OdnIlRnN
 b2FHFg+vhja746z+bCGP57A943bC55cquZpRm58FqWMxrmClPwP2QASJnjo0EiGKImxz
 Z+M2jOOn+mGi3it6qZRzIzLa9JbvBcOvxnoABy6FFuOLu8taONl8nmhk/UGY6dbXUCPo
 lYHHexgNkisfxc4TNR/Dq/YoueYrO2wLaMdtYSGbEAHVP8HgNJCgY2rp4FJ/6HVRyoaB
 hQww==
X-Gm-Message-State: AFqh2kqzWVTRR78E6M881OJ9A6UKw0kh7lEwlfdKVSAhVNI3Xp9AN++g
 crUV+R84JB4aANWpvAQoCmuPrE2yMcuoNlVGHeJYScnpUNrmplzXX0WAW3Deaz8XMCUqkQhRZXI
 vNBQx3DSYxzFvjMZD7PuYrjlUslPo
X-Received: by 2002:a4a:d287:0:b0:49f:449a:5f6c with SMTP id
 h7-20020a4ad287000000b0049f449a5f6cmr356530oos.93.1671764298485; 
 Thu, 22 Dec 2022 18:58:18 -0800 (PST)
X-Received: by 2002:a4a:d287:0:b0:49f:449a:5f6c with SMTP id
 h7-20020a4ad287000000b0049f449a5f6cmr356504oos.93.1671764298212; Thu, 22 Dec
 2022 18:58:18 -0800 (PST)
MIME-Version: 1.0
References: <20221222120813.727830-1-armbru@redhat.com>
 <20221222120813.727830-2-armbru@redhat.com>
In-Reply-To: <20221222120813.727830-2-armbru@redhat.com>
From: Jason Wang <jasowang@redhat.com>
Date: Fri, 23 Dec 2022 10:58:06 +0800
Message-ID: <CACGkMEs6R45JkYm294ms33yWJheD0oB6Zs3gvC1d7sv+-oHufA@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] include/hw/virtio: Break inclusion loop
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, imammedo@redhat.com, 
 ani@anisinha.ca, peter.maydell@linaro.org, laurent@vivier.eu, 
 edgar.iglesias@gmail.com, Alistair.Francis@wdc.com, bin.meng@windriver.com, 
 palmer@dabbelt.com, marcel.apfelbaum@gmail.com, yangxiaojuan@loongson.cn, 
 gaosong@loongson.cn, richard.henderson@linaro.org, deller@gmx.de, 
 vikram.garhwal@amd.com, francisco.iglesias@amd.com, clg@kaod.org, 
 kraxel@redhat.com, marcandre.lureau@redhat.com, riku.voipio@iki.fi, 
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org, 
 crwulff@gmail.com, marex@denx.de, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Stefano Garzarella <sgarzare@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=jasowang@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: shp3qMGA8hgy

On Thu, Dec 22, 2022 at 8:08 PM Markus Armbruster <armbru@redhat.com> wrote=
:
>
> hw/virtio/virtio.h and hw/virtio/vhost.h include each other.  The
> former doesn't actually need the latter, so drop that inclusion to
> break the loop.
>
> Signed-off-by: Markus Armbruster <armbru@redhat.com>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Acked-by: Jason Wang <jasowang@redhat.com>

Thanks

> ---
>  include/hw/virtio/virtio.h | 1 -
>  hw/virtio/virtio-qmp.c     | 1 +
>  hw/virtio/virtio.c         | 1 +
>  3 files changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index 24561e933a..48ab2117b5 100644
> --- a/include/hw/virtio/virtio.h
> +++ b/include/hw/virtio/virtio.h
> @@ -22,7 +22,6 @@
>  #include "standard-headers/linux/virtio_config.h"
>  #include "standard-headers/linux/virtio_ring.h"
>  #include "qom/object.h"
> -#include "hw/virtio/vhost.h"
>
>  /*
>   * A guest should never accept this. It implies negotiation is broken
> diff --git a/hw/virtio/virtio-qmp.c b/hw/virtio/virtio-qmp.c
> index 8e7282658f..3d4497da99 100644
> --- a/hw/virtio/virtio-qmp.c
> +++ b/hw/virtio/virtio-qmp.c
> @@ -11,6 +11,7 @@
>
>  #include "qemu/osdep.h"
>  #include "hw/virtio/virtio.h"
> +#include "hw/virtio/vhost.h"
>  #include "virtio-qmp.h"
>
>  #include "standard-headers/linux/virtio_ids.h"
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index 289eb71045..0ec6ff9ae4 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -25,6 +25,7 @@
>  #include "qom/object_interfaces.h"
>  #include "hw/core/cpu.h"
>  #include "hw/virtio/virtio.h"
> +#include "hw/virtio/vhost.h"
>  #include "migration/qemu-file-types.h"
>  #include "qemu/atomic.h"
>  #include "hw/virtio/virtio-bus.h"
> --
> 2.38.1
>

