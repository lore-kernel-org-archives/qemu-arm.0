Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp4393310ejb;
        Tue, 20 Dec 2022 07:06:07 -0800 (PST)
X-Google-Smtp-Source: AMrXdXtgQHLo0NggWSkqNkfBsFPKTRUAzsyec2pDRnHv5lM7llMj0jvZ3+4OcEvlgCfARRLtUmo4
X-Received: by 2002:ac8:507:0:b0:3a9:7faf:d635 with SMTP id u7-20020ac80507000000b003a97fafd635mr14650968qtg.1.1671548767728;
        Tue, 20 Dec 2022 07:06:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1671548767; cv=none;
        d=google.com; s=arc-20160816;
        b=Bccj6XqZoJr8p6HvY4YgyiaZzd9TvKrw1MdGKkmcgs9FzTNyqIKKuyyLp/jwvY0ReF
         G65+2KUxrELIkGX+Ph7HmWeH8knWwO6nIdtW12yB2Qrod4otcRV6C9k1PbsXO3z9VAl9
         6qYg0gM1m7v1VU97cmG7p+ipTitITeMbGGevh7MxLp/Wq/P9bt6XEdoKciIYSBWXXrkR
         08fzsMJVkjo/qhIGuYUZlp2+CZ3E7oOyESPZLi+WEPta4vq5Lxhwjr71yJuFITlsrvFf
         SAaARLiAAKab6wAa9mctnXJ0JsY2bW/KFVad9YWT1IlznXY5qpjO5igxseM1yTdM8RMt
         ocog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=v3ldk6plhvP/ViIABz50rAc8FDFS41LGc3HDMVl68Ac=;
        b=tvxPrDddyvxM6nyf+FWuZu7BrWvNGvNn6klooVPzkiHl/BN6xKH3ostbvGr+MelPXf
         DglQrmQiykpwhVjE/Qsm2S/XqD2ga/RCdgsqXIeGXGrdn3GlT4NA8/yBHmIjGHSljRHU
         P/KWmUR6OC40r0SUV6D4nHM3FurrO2TRypBHLpJ9b4kWYQbsEpgBA9hPI4ehtYEMaLzL
         DcQevgNSBYy/JDdU/FwfY5dyBdGpY7FII+Ew7jjNZTk1mel5SitE8Gv6AMBItVWVeiAX
         8fuCN+gLkp/5g5X8skRTo5vcg8i+EIwY71GkhtsLBQS30xCS4zi5QZfRp8HxEjDI2SSt
         tlqQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d2sqjOMu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p21-20020ac87415000000b003a7e5493305si5151638qtq.356.2022.12.20.07.06.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Dec 2022 07:06:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=d2sqjOMu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p7eBx-0002PK-18; Tue, 20 Dec 2022 10:06:05 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7eBn-0002IX-Et
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 10:05:55 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1p7eBm-0006dB-01
 for qemu-arm@nongnu.org; Tue, 20 Dec 2022 10:05:55 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1671548746;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=v3ldk6plhvP/ViIABz50rAc8FDFS41LGc3HDMVl68Ac=;
 b=d2sqjOMuSynfTQaLvs1VzCvlx7FOiUd40TgNdNgsTNfccKG7v96FzqlBpZdQLSXuVDIgFG
 jy5X5AxPEpXtNj7HYdO9IFYYMIBtNlkNX1mDxfhqhqmg/1uvZ4w3VMfvQ0JiM+i3FfZaoR
 yQTibc6SJK3Qb9ma0/VFbjj4DcF1xc0=
Received: from mail-yb1-f198.google.com (mail-yb1-f198.google.com
 [209.85.219.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-670-H-MdTfyAMBKD_EWlProfBg-1; Tue, 20 Dec 2022 10:05:43 -0500
X-MC-Unique: H-MdTfyAMBKD_EWlProfBg-1
Received: by mail-yb1-f198.google.com with SMTP id
 b4-20020a253404000000b006fad1bb09f4so14314052yba.1
 for <qemu-arm@nongnu.org>; Tue, 20 Dec 2022 07:05:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v3ldk6plhvP/ViIABz50rAc8FDFS41LGc3HDMVl68Ac=;
 b=e6PX7e5ladDbHXYXMCDvwQUBU2VooFV0QAodzfWkPQqlz2i3pdsVtXlxbj4a2YJUp+
 tFZM4E/JCETGUaqYK2Qze2vNBgpp5rWnni9wSZhwbbZ+SLblMIRuL8k7wzdBFU84IGkQ
 F3jOsLKBna04eV6AuoCKBl2VSBMugcbu36D7I0vZMsmGT9fqH4YNnMXPs6s8PGdHZZXY
 fKfI14KJNATnGk/KICV1d5iKQGWDj9/lQ2Nd9QL0SHCIAgrnUFDtrE9sjYI7/TttODxA
 scF0W4xJOKxYpp2JpyENLdT73t0TJICRuZLRjto3VMpIhd5q86SgmDTdb7g8G070LXMO
 BFww==
X-Gm-Message-State: ANoB5pknHKZviVw9dxDKFp6D/sJCS8YgroGR3E2Qs52CRClL3uGlRQWX
 YCCWFIhPGbK/sHk3OcTB6ZzpAs6c1GyhjfeKFL/rDar6MM8IMMet57IZxYS6emeGLVklSbawIOk
 M1MIYM7KpnQdT
X-Received: by 2002:a05:7500:2d9a:b0:ea:78bf:c0de with SMTP id
 er26-20020a0575002d9a00b000ea78bfc0demr4152235gab.56.1671548740718; 
 Tue, 20 Dec 2022 07:05:40 -0800 (PST)
X-Received: by 2002:a05:7500:2d9a:b0:ea:78bf:c0de with SMTP id
 er26-20020a0575002d9a00b000ea78bfc0demr4152191gab.56.1671548740307; 
 Tue, 20 Dec 2022 07:05:40 -0800 (PST)
Received: from redhat.com ([37.19.199.118]) by smtp.gmail.com with ESMTPSA id
 q20-20020a05620a0d9400b006eeca296c00sm9108385qkl.104.2022.12.20.07.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Dec 2022 07:05:38 -0800 (PST)
Date: Tue, 20 Dec 2022 10:05:28 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, laurent@vivier.eu,
 edgar.iglesias@gmail.com, Alistair.Francis@wdc.com,
 bin.meng@windriver.com, palmer@dabbelt.com,
 marcel.apfelbaum@gmail.com, yangxiaojuan@loongson.cn,
 gaosong@loongson.cn, richard.henderson@linaro.org, deller@gmx.de,
 jasowang@redhat.com, vikram.garhwal@amd.com,
 francisco.iglesias@amd.com, clg@kaod.org, kraxel@redhat.com,
 marcandre.lureau@redhat.com, riku.voipio@iki.fi,
 qemu-arm@nongnu.org, qemu-riscv@nongnu.org, qemu-ppc@nongnu.org,
 crwulff@gmail.com, marex@denx.de
Subject: Re: [PATCH 1/2] include/hw/virtio: Break inclusion loop
Message-ID: <20221220100515-mutt-send-email-mst@kernel.org>
References: <20221210133915.4104305-1-armbru@redhat.com>
 <20221210133915.4104305-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221210133915.4104305-2-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
X-TUID: G7erx5si7hfL

On Sat, Dec 10, 2022 at 02:39:14PM +0100, Markus Armbruster wrote:
> hw/virtio/virtio.h and hw/virtio/vhost.h include each other.  The
> former doesn't actually need the latter, so drop that inclusion to
> break the loop.
> 
> Signed-off-by: Markus Armbruster <armbru@redhat.com>

Reviewed-by: Michael S. Tsirkin <mst@redhat.com>


feel free to merge

> ---
>  include/hw/virtio/virtio.h | 1 -
>  hw/virtio/virtio.c         | 1 +
>  2 files changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
> index a973811cbf..8b68b69e00 100644
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
> diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> index eb6347ab5d..faedf886da 100644
> --- a/hw/virtio/virtio.c
> +++ b/hw/virtio/virtio.c
> @@ -26,6 +26,7 @@
>  #include "qemu/module.h"
>  #include "qom/object_interfaces.h"
>  #include "hw/virtio/virtio.h"
> +#include "hw/virtio/vhost.h"
>  #include "migration/qemu-file-types.h"
>  #include "qemu/atomic.h"
>  #include "hw/virtio/virtio-bus.h"
> -- 
> 2.37.3
> 
> 
> 

