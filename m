Received: by 2002:a17:906:fc07:b0:9bd:85f7:2662 with SMTP id ov7csp3022099ejb;
        Wed, 25 Oct 2023 13:55:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGL78Q3ZJVuNE7/7vB+HML12/ccEZQNre1PWZUWdL1zFyfsCaHu6IUNPqILhM46SF+8K+eJ
X-Received: by 2002:a05:620a:3903:b0:76f:5b9:3f29 with SMTP id qr3-20020a05620a390300b0076f05b93f29mr1165425qkn.2.1698267300615;
        Wed, 25 Oct 2023 13:55:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1698267300; cv=none;
        d=google.com; s=arc-20160816;
        b=rNVuiAYHUvBJxmH55CjWWcKvBZ2jXojz47tGpsnjKhiSCUp+WKMuMg2AttaW8Cc6WU
         FGXDlWITU1cztTvjy9JjTgszh0FUYpxLhtuQNFoGKXAA5GYvH9EQXVydnBqlZXGrgUhp
         ezT6wFsKPzJgVh/VmbixRkZko+T1OzYDoGhKgAD8EtsGfTA7Aq8V1yMngtVM3bxIxFHl
         HJNpQru9YBS39g5+XdN+Vf+7kH8N0VD8oSKtAsKLoZbniQUfYV9GtiErLINU5Ml9cc6S
         HeC5hH40A4ZSDrEjGZ6eqRZe2QquroesTbB5O0t61+hhpejttvpahpJGnxsBUFFo7ZLG
         hezw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:mime-version:references
         :message-id:in-reply-to:subject:cc:to:from:date;
        bh=n/w0JvkJXfOjvG2BwwtkwhUoojGe+LW0ZbYTSNxmuRY=;
        fh=gHgTXW+HYQlfXOTlyX5PQSNotlP/s1ZHeLT9aaJYBuQ=;
        b=GV8TqSjbveRfXsESCFmSexBG+QuphnE2+KTg8OMeWAQUfh/ixNTzpWHt9wNKIRBFeg
         +PRSe4Zrd19A/6XTB+MqUn0rt+F8yDPSPp4Qev/jBI4hfwJ876iBhs9SVErFwbHjrhEI
         nN6srBgMS5BH+Whk6sevsuiEw4vbJioYKSBuHGk4Ym6IWW3JJRKGAVn/+aBzcXrr+dLT
         jx9CMeayzksoMHCoRbZufsszX/2X1pDLcnqFjXSbNCGHrUiaSVYlnclhcFX4NUNgBmko
         VDR2HIke6B8ud8wRW01w8av6aLi5zTRmig+DxwStjuqEB0v/PT9fjx8aFl3Azyb77TBO
         I5YA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w14-20020a05620a444e00b007759f941a4bsi9245966qkp.331.2023.10.25.13.55.00
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Oct 2023 13:55:00 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=eik.bme.hu
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qvkte-0004hM-H6; Wed, 25 Oct 2023 16:54:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1qvktd-0004gW-Dw; Wed, 25 Oct 2023 16:54:33 -0400
Received: from zero.eik.bme.hu ([152.66.115.2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <balaton@eik.bme.hu>)
 id 1qvkta-0005i1-Q9; Wed, 25 Oct 2023 16:54:33 -0400
Received: from zero.eik.bme.hu (blah.eik.bme.hu [152.66.115.182])
 by localhost (Postfix) with SMTP id 6E81D756066;
 Wed, 25 Oct 2023 22:54:26 +0200 (CEST)
Received: by zero.eik.bme.hu (Postfix, from userid 432)
 id 287107456A7; Wed, 25 Oct 2023 22:54:26 +0200 (CEST)
Received: from localhost (localhost [127.0.0.1])
 by zero.eik.bme.hu (Postfix) with ESMTP id 2636B745681;
 Wed, 25 Oct 2023 22:54:26 +0200 (CEST)
Date: Wed, 25 Oct 2023 22:54:26 +0200 (CEST)
From: BALATON Zoltan <balaton@eik.bme.hu>
To: =?ISO-8859-15?Q?Marc-Andr=E9_Lureau?= <marcandre.lureau@redhat.com>
cc: qemu-devel@nongnu.org, qemu-ppc@nongnu.org, 
 Peter Maydell <peter.maydell@linaro.org>, 
 "Dr. David Alan Gilbert" <dave@treblig.org>, 
 Eric Blake <eblake@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>, 
 "Michael S. Tsirkin" <mst@redhat.com>, qemu-arm@nongnu.org, 
 =?ISO-8859-15?Q?Philippe_Mathieu-Daud=E9?= <philmd@linaro.org>, 
 Markus Armbruster <armbru@redhat.com>, 
 =?ISO-8859-15?Q?Daniel_P=2E_Berrang=E9?= <berrange@redhat.com>, 
 Thomas Huth <thuth@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
Subject: Re: [PATCH v6 12/23] virtio-gpu: replace PIXMAN for region/rect test
In-Reply-To: <20231025190818.3278423-13-marcandre.lureau@redhat.com>
Message-ID: <151fc11c-df21-51e6-f12c-e926e8764dc4@eik.bme.hu>
References: <20231025190818.3278423-1-marcandre.lureau@redhat.com>
 <20231025190818.3278423-13-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
 boundary="3866299591-905477889-1698267266=:42723"
X-Spam-Probability: 9%
Received-SPF: pass client-ip=152.66.115.2; envelope-from=balaton@eik.bme.hu;
 helo=zero.eik.bme.hu
X-Spam_score_int: -18
X-Spam_score: -1.9
X-Spam_bar: -
X-Spam_report: (-1.9 / 5.0 requ) BAYES_00=-1.9, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ukX491+1jLHk

  This message is in MIME format.  The first part should be readable text,
  while the remaining parts are likely unreadable without MIME-aware tools.

--3866299591-905477889-1698267266=:42723
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8BIT

On Wed, 25 Oct 2023, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
>
> Use a simpler implementation for rectangle geometry & intersect, drop
> the need for (more complex) PIXMAN functions.
>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>
> Acked-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> include/ui/rect.h       | 59 +++++++++++++++++++++++++++++++++++++++++
> hw/display/virtio-gpu.c | 30 ++++++++-------------
> 2 files changed, 70 insertions(+), 19 deletions(-)
> create mode 100644 include/ui/rect.h
>
> diff --git a/include/ui/rect.h b/include/ui/rect.h
> new file mode 100644
> index 0000000000..94898f92d0
> --- /dev/null
> +++ b/include/ui/rect.h
> @@ -0,0 +1,59 @@
> +/*
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#ifndef QEMU_RECT_H
> +#define QEMU_RECT_H
> +
> +#include <stdint.h>
> +#include <stdbool.h>
> +
> +typedef struct QemuRect {
> +    int16_t x;
> +    int16_t y;
> +    uint16_t width;
> +    uint16_t height;
> +} QemuRect;
> +
> +static inline void qemu_rect_init(QemuRect *rect,
> +                                  int16_t x, int16_t y,
> +                                  uint16_t width, uint16_t height)
> +{
> +    rect->x = x;
> +    rect->y = x;
> +    rect->width = width;
> +    rect->height = height;
> +}
> +
> +static inline void qemu_rect_translate(QemuRect *rect,
> +                                       int16_t dx, int16_t dy)
> +{
> +    rect->x += dx;
> +    rect->y += dy;
> +}
> +
> +static inline bool qemu_rect_intersect(const QemuRect *a, const QemuRect *b,
> +                                       QemuRect *res)
> +{
> +    int16_t x1, x2, y1, y2;
> +
> +    x1 = MAX(a->x, b->x);
> +    y1 = MAX(a->y, b->y);
> +    x2 = MIN(a->x + a->width, b->x + b->width);
> +    y2 = MIN(a->y + a->height, b->y + b->height);
> +
> +    if (x1 >= x2 || y1 >= y2) {
> +        if (res) {
> +            qemu_rect_init(res, 0, 0, 0, 0);
> +        }
> +
> +        return false;
> +    }
> +
> +    if (res) {
> +        qemu_rect_init(res, x1, y1, x2 - x1, y2 - y1);
> +    }
> +
> +    return true;
> +}
> +
> +#endif

Maybe you could move these to pixman-minimal.h as well implementing the 
missing pixman_region funcs so no need to change the callers? But I don't 
mind either way.

Regards,
BALATON Zoltan

> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index 4265316cbb..a8e767245f 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -16,6 +16,7 @@
> #include "qemu/iov.h"
> #include "sysemu/cpus.h"
> #include "ui/console.h"
> +#include "ui/rect.h"
> #include "trace.h"
> #include "sysemu/dma.h"
> #include "sysemu/sysemu.h"
> @@ -503,7 +504,7 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
>     struct virtio_gpu_simple_resource *res;
>     struct virtio_gpu_resource_flush rf;
>     struct virtio_gpu_scanout *scanout;
> -    pixman_region16_t flush_region;
> +    QemuRect flush_rect;
>     bool within_bounds = false;
>     bool update_submitted = false;
>     int i;
> @@ -565,34 +566,25 @@ static void virtio_gpu_resource_flush(VirtIOGPU *g,
>         return;
>     }
>
> -    pixman_region_init_rect(&flush_region,
> -                            rf.r.x, rf.r.y, rf.r.width, rf.r.height);
> +    qemu_rect_init(&flush_rect, rf.r.x, rf.r.y, rf.r.width, rf.r.height);
>     for (i = 0; i < g->parent_obj.conf.max_outputs; i++) {
> -        pixman_region16_t region, finalregion;
> -        pixman_box16_t *extents;
> +        QemuRect rect;
>
>         if (!(res->scanout_bitmask & (1 << i))) {
>             continue;
>         }
>         scanout = &g->parent_obj.scanout[i];
>
> -        pixman_region_init(&finalregion);
> -        pixman_region_init_rect(&region, scanout->x, scanout->y,
> -                                scanout->width, scanout->height);
> +        qemu_rect_init(&rect, scanout->x, scanout->y,
> +                       scanout->width, scanout->height);
>
> -        pixman_region_intersect(&finalregion, &flush_region, &region);
> -        pixman_region_translate(&finalregion, -scanout->x, -scanout->y);
> -        extents = pixman_region_extents(&finalregion);
>         /* work out the area we need to update for each console */
> -        dpy_gfx_update(g->parent_obj.scanout[i].con,
> -                       extents->x1, extents->y1,
> -                       extents->x2 - extents->x1,
> -                       extents->y2 - extents->y1);
> -
> -        pixman_region_fini(&region);
> -        pixman_region_fini(&finalregion);
> +        if (qemu_rect_intersect(&flush_rect, &rect, &rect)) {
> +            qemu_rect_translate(&rect, -scanout->x, -scanout->y);
> +            dpy_gfx_update(g->parent_obj.scanout[i].con,
> +                           rect.x, rect.y, rect.width, rect.height);
> +        }
>     }
> -    pixman_region_fini(&flush_region);
> }
>
> static void virtio_unref_resource(pixman_image_t *image, void *data)
>
--3866299591-905477889-1698267266=:42723--
