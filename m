Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp3242221ejb;
        Mon, 12 Dec 2022 03:34:44 -0800 (PST)
X-Google-Smtp-Source: AA0mqf7nO3J8IWmbrkDPBWhCvv3ERGnHwSc3uzRkd5lMQQPi549BUJfv7ENZfxJKG8VfogqhX8RV
X-Received: by 2002:a05:6214:3c9b:b0:4c6:e22d:1329 with SMTP id ok27-20020a0562143c9b00b004c6e22d1329mr27265819qvb.52.1670844883738;
        Mon, 12 Dec 2022 03:34:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670844883; cv=none;
        d=google.com; s=arc-20160816;
        b=CZmWJilM2AAsCY0VMfotzuJq8TspQ/PQkkvBmsw6bpgXRGxZVzGsLsCqLjY+YMElbC
         HUk8NKffzo7k9IljOWyrgQlXEb9LJpkmVN1AR7zB8igsYFD7AmXQkZ/TAGNEox4nGlZC
         Tg1F+ogc4hxBADnJiLzIEA8fx8AZcIDbG9XSwHTHc8U2qQrCCpBRQU+rXB4HXhDMqrKu
         Uy9ukV2XEAmPFLKES/C7bb9iVLrQtt7ZQoQv50zoZRcfJwAdPSPXLeO7ddJR0WokuaMF
         CKadBD4Ggoh6nCeQ7i563OLoSsapJ7eiBjnghipSUFtol/EP4JwQoHGhhuqWNwLsU23M
         mAhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=uQ7SSTzAKZAEPuOo+VRMk0f7LfqYIwBRz+115mwrcDw=;
        b=CSmZwjIiFlCUhT+ki+RKLNHp8gConD9YQQVCf919Ct5kZwM0jFHb6n9PlGQL7PzPwJ
         zXoiDYuOlFYGpokAxY6627C+tuLm47F9HLc0T4yE48tBIkMHT2O16XzSUwqa3Dv8Kex8
         /H8QJzVL20C1NdWP4P+ELXtkE9/HYtsAYSYbgOvi/MPTnnfjpRmYfuHDmt4MnX5BCrqx
         LuvHdC/D3GCEntjusffhRlz0McioTojbvLw5mOvBBgSIcZUvPB4xJ8aeD4FjeM0jOEmc
         UTocT6mRPoagsokjiKw/X1l0J/nUf2bxF4JcHxQQ0fL5dKg84fdqaI4BMA74bTsiBPiD
         YNbg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KQtDH3Xo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi7-20020a05620a318700b006ebcaee80a0si3056399qkb.385.2022.12.12.03.34.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 12 Dec 2022 03:34:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=KQtDH3Xo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1p4h3u-000110-QA; Mon, 12 Dec 2022 06:33:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1p4h3l-0000zb-3r
 for qemu-arm@nongnu.org; Mon, 12 Dec 2022 06:33:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <sgarzare@redhat.com>)
 id 1p4h3i-0000QR-7U
 for qemu-arm@nongnu.org; Mon, 12 Dec 2022 06:33:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1670844800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=uQ7SSTzAKZAEPuOo+VRMk0f7LfqYIwBRz+115mwrcDw=;
 b=KQtDH3XoxnBL3FpEUL6f4C9Gufw6UH0IPLhjjG2BPcsi5ikT8uuXSuPWcemxB4our2Gs+L
 8cVtqVStly00RFTfOU4Gn8C8A19J3P8lnQfUF18IUqA6GgloTOyXdrYQhGiuaHcwxuT9JD
 5cA9u41PmK3Bn9PIcDJOUDaMKOPos6E=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-262-ac65gxIEOgCddR8bcusEUg-1; Mon, 12 Dec 2022 06:33:19 -0500
X-MC-Unique: ac65gxIEOgCddR8bcusEUg-1
Received: by mail-wm1-f70.google.com with SMTP id
 g9-20020a7bc4c9000000b003d214cffa4eso1904657wmk.5
 for <qemu-arm@nongnu.org>; Mon, 12 Dec 2022 03:33:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uQ7SSTzAKZAEPuOo+VRMk0f7LfqYIwBRz+115mwrcDw=;
 b=w5sYM6My8H3JOOiRaL3xcG3wt3Qa4td5fzy5IwyV5nW1d9OjUKw73DpVaqgKr6Ev8e
 Vt6y8pmvFDc4UxX/cIW331wAYzVK0ysiPJjy/d87VvwwsaFCVTn/IoyzcWwx0ioTsyGS
 +Y+bkFpNJgVpbGWTSy7LmWh82H/h7bl0sii+n4IKpitgHSSoc2I3QPp/wQ0GG3cWqW1u
 wyKbmwH7apI7S+9ZEl0oXGPfRDXz6ORjmb4MGKln1/VqGxOLTMGHnaUN024E0/IdX9Yg
 l+Bs2RpdciSoRhTHG1pQsGk5okbon09frlVw4wmOEvJg2V9DhCpC79UeYgZZNxwZPy1t
 BjLA==
X-Gm-Message-State: ANoB5pnkTKo0l8rHyFEDEFqLC5Jgz1iybExAzJhlz2iZjuu4bnsknMr5
 VvMnIcMG+bRajSbeIFitW5/5z2hxPxZS3wZ25yqwTG3O+gaeSUbQO2vGCABlu2lfWVGz/8Yv1LC
 y6PM2WApquIzp
X-Received: by 2002:a05:600c:3d11:b0:3cf:4d3e:c237 with SMTP id
 bh17-20020a05600c3d1100b003cf4d3ec237mr12442639wmb.27.1670844798073; 
 Mon, 12 Dec 2022 03:33:18 -0800 (PST)
X-Received: by 2002:a05:600c:3d11:b0:3cf:4d3e:c237 with SMTP id
 bh17-20020a05600c3d1100b003cf4d3ec237mr12442597wmb.27.1670844797748; 
 Mon, 12 Dec 2022 03:33:17 -0800 (PST)
Received: from sgarzare-redhat (host-87-11-6-51.retail.telecomitalia.it.
 [87.11.6.51]) by smtp.gmail.com with ESMTPSA id
 be12-20020a05600c1e8c00b003cf6c2f9513sm9121594wmb.2.2022.12.12.03.33.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Dec 2022 03:33:17 -0800 (PST)
Date: Mon, 12 Dec 2022 12:33:13 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Markus Armbruster <armbru@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, imammedo@redhat.com,
 ani@anisinha.ca, peter.maydell@linaro.org, laurent@vivier.eu,
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
Message-ID: <20221212113313.ex6owi6ricvcnm5c@sgarzare-redhat>
References: <20221210133915.4104305-1-armbru@redhat.com>
 <20221210133915.4104305-2-armbru@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20221210133915.4104305-2-armbru@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=sgarzare@redhat.com;
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
X-TUID: sZQcYpBSqljL

On Sat, Dec 10, 2022 at 02:39:14PM +0100, Markus Armbruster wrote:
>hw/virtio/virtio.h and hw/virtio/vhost.h include each other.  The
>former doesn't actually need the latter, so drop that inclusion to
>break the loop.
>
>Signed-off-by: Markus Armbruster <armbru@redhat.com>
>---
> include/hw/virtio/virtio.h | 1 -
> hw/virtio/virtio.c         | 1 +
> 2 files changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

>
>diff --git a/include/hw/virtio/virtio.h b/include/hw/virtio/virtio.h
>index a973811cbf..8b68b69e00 100644
>--- a/include/hw/virtio/virtio.h
>+++ b/include/hw/virtio/virtio.h
>@@ -22,7 +22,6 @@
> #include "standard-headers/linux/virtio_config.h"
> #include "standard-headers/linux/virtio_ring.h"
> #include "qom/object.h"
>-#include "hw/virtio/vhost.h"
>
> /*
>  * A guest should never accept this. It implies negotiation is broken
>diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
>index eb6347ab5d..faedf886da 100644
>--- a/hw/virtio/virtio.c
>+++ b/hw/virtio/virtio.c
>@@ -26,6 +26,7 @@
> #include "qemu/module.h"
> #include "qom/object_interfaces.h"
> #include "hw/virtio/virtio.h"
>+#include "hw/virtio/vhost.h"
> #include "migration/qemu-file-types.h"
> #include "qemu/atomic.h"
> #include "hw/virtio/virtio-bus.h"
>-- 
>2.37.3
>
>

