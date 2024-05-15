Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp755186ejl;
        Wed, 15 May 2024 09:03:39 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXa+QoW/2lkUuWydaQKUPogh1INtWwiVxNC6wSOpVRLlvAXWvwskjWa3zXyAvNRckd3mNWtL36xxWobDfNQxqWq8RcAi2AV
X-Google-Smtp-Source: AGHT+IFsnS+wTHEgVpVNOWMT6eJuLgmmZYUQt8j4MUbteM3iBnckOGDB0DyuKDw4NBZCafWNFG4s
X-Received: by 2002:a05:6214:469d:b0:6a0:c9eb:25db with SMTP id 6a1803df08f44-6a168179d57mr211024446d6.8.1715789019539;
        Wed, 15 May 2024 09:03:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715789019; cv=none;
        d=google.com; s=arc-20160816;
        b=AzrIKAAIeOpQiOkdfkgCXRW6gKYBtBmbuHfMqedOUwULl2afm08I1ksZGbc/UUR5qm
         eNHYZEveA7d3NyWrKJGdWmGFqfA6MulAMp20jUAodbx+qpr4QtuElaTzZDv2GGkZjKOG
         +/f8+N6xyLvhT0cJN8bKqcwSV0ovuKxN/Sg3C1yvlynI0/6Rn3cTXfBNv5NPQjYSYzwT
         KOJqJBJStKgDD/smOV7HskTiNznQRKSrE+jva0dN4Edl/EKy2HNXTNn7io0wDtK0Sha0
         RGf8zRJ2ob3nb7kAISNId5O48/bJRThn/x38tbDh+pxgUhxxu0QRiZybJcjC+DUeQbfH
         W+bA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=oBPMHWk/3X9EOsFM9ZyHhxSqY4SAOc/HnPCkNSCS9iE=;
        fh=Cj298MC1O1uS/H2UOTZWU0x6wa3shLIF5bjKOhNuLI0=;
        b=lM0wP8BQnVatJcLhICMs29Qjv+csNVUT4mCAnHjc6CmSLVB8MS2lqUg5Z4ycfKekji
         cnCsfv87u/Z5fq2Y9PselcGmXjDjNSBmWl6sd9m0l64In3MHuEBFGicUgYicbd1fMXgC
         zPK1uwtlaXIbxFloulvuH0lFzZ0Po/wg8IgXAA4RSTy1qkQUxrtRa4sCVtUiqde+o++Z
         EfHwqYnrfEbJ5m1VxO1xBCkyeJq8rijLGwzCvwR3qwZwwS8ISN6f1Hp7s5Sa6NbObllS
         l7ZdiIC6ktCdO1vvsOX9aY3YwSn07PI8ZqBt6V4lQaijiM/XQNhUQKMdths7cn76SmEF
         CGsg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XUJkoC4K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6a15f2e570csi142926776d6.434.2024.05.15.09.03.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2024 09:03:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=XUJkoC4K;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s7H5t-000186-6C; Wed, 15 May 2024 12:03:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1s7H5q-00014J-8T
 for qemu-arm@nongnu.org; Wed, 15 May 2024 12:03:03 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1s7H5o-0000Qp-Nx
 for qemu-arm@nongnu.org; Wed, 15 May 2024 12:03:02 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715788979;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=oBPMHWk/3X9EOsFM9ZyHhxSqY4SAOc/HnPCkNSCS9iE=;
 b=XUJkoC4Kfp5Hj6AG55ZKTD6JDiuPkOTlV21iJESG8oJHJ63bVtWMid1Ih1bfMw8pjahW0s
 uA8D0MsmQMe79t61vSB7kySY90UwH79mLDk+c5yZjlOeHUTa1Oeha11M63wFty5F/xmnWC
 b5qJHMBT3I9n/15izoaVj88u+pVu6/Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-564-xCEB7kspOFWRMYUkwWWCIQ-1; Wed, 15 May 2024 12:02:55 -0400
X-MC-Unique: xCEB7kspOFWRMYUkwWWCIQ-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-351baf27b00so2275152f8f.0
 for <qemu-arm@nongnu.org>; Wed, 15 May 2024 09:02:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715788974; x=1716393774;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oBPMHWk/3X9EOsFM9ZyHhxSqY4SAOc/HnPCkNSCS9iE=;
 b=DAAcPgNGTk9HLcydYZz0Wdsz0l++neQKAVAD4LDT8cZd1GnkKvhm2jOzhJtyEG3Hxr
 2EXScpF5A7q/6Oe+EfjdRG/2kz3fMzWLegcyZmlVV/ErmrqOpk9llbBQxT+ZniU9l+rP
 ddmvosa6ZHSBBrWPaRPsCHENAQm8RZeiOfEzGAPYZ39C+Aek78+BIbScxBqqIjxXn+Ru
 2MhlGHwXlITCQADikzah0KnWhehvokyvlRQF317KKpbHVM0jCQ8XNw1DgZAQbP/fgQ4F
 3LvTvIQA87gh5kmM3d9+eS4lctPIeTJCM4s0TyHWjnZl/zsaBeaU0RGxC4+91PwEyy+m
 JQjg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUg2TBtygxERPomIYDvPL3TPNcyIjCjti5FnybHF8BAYOjmf3xV2dffZ8SFnSgWnDmI4M6iitcUKiUETpcYRvzIm6dw
X-Gm-Message-State: AOJu0YwC5JHgPuH/rGCPVmuWyuRLqbQJcyCu31EV4z/3ncvyFIzRQ/TG
 3xTA/xSTj0pqHWp9g5qMSc9XjDBs9cyQBR7ix3izuTmhD6zoGBnzCRFZ/qEczgUOol6A1T9cpMA
 dvNCYa2x5QbiAT2OVdbs2xsM5eUjXVN2AXY4OY/3Kl3BufSl12A==
X-Received: by 2002:adf:ff92:0:b0:34c:9b4d:a7ee with SMTP id
 ffacd0b85a97d-3504aa66822mr13132983f8f.67.1715788974440; 
 Wed, 15 May 2024 09:02:54 -0700 (PDT)
X-Received: by 2002:adf:ff92:0:b0:34c:9b4d:a7ee with SMTP id
 ffacd0b85a97d-3504aa66822mr13132944f8f.67.1715788973742; 
 Wed, 15 May 2024 09:02:53 -0700 (PDT)
Received: from redhat.com ([2a02:14f:175:c01e:6df5:7e14:ad03:85bd])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-351cb0fb6b4sm3632961f8f.24.2024.05.15.09.02.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 May 2024 09:02:53 -0700 (PDT)
Date: Wed, 15 May 2024 12:02:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Fiona Ebner <f.ebner@proxmox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3 5/5] virtio-gpu: fix v2 migration
Message-ID: <20240515120104-mutt-send-email-mst@kernel.org>
References: <20240515141557.1277999-1-marcandre.lureau@redhat.com>
 <20240515141557.1277999-6-marcandre.lureau@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240515141557.1277999-6-marcandre.lureau@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.935,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: r7cTmZBE1jQa

On Wed, May 15, 2024 at 06:15:56PM +0400, marcandre.lureau@redhat.com wrote:
> From: Marc-André Lureau <marcandre.lureau@redhat.com>
> 
> Commit dfcf74fa ("virtio-gpu: fix scanout migration post-load") broke
> forward/backward version migration. Versioning of nested VMSD structures
> is not straightforward, as the wire format doesn't have nested
> structures versions.
> 
> Use the previously introduced check_machine_version() function as a
> field test to ensure proper saving/loading based on the machine version.
> The VMSD.version is irrelevant now.
> 
> Fixes: dfcf74fa ("virtio-gpu: fix scanout migration post-load")
> Suggested-by: Peter Xu <peterx@redhat.com>
> Signed-off-by: Marc-André Lureau <marcandre.lureau@redhat.com>

I don't get it. Our standard way to do it is:
- add a property (begin name with x- so we don't commit to an API)
- set from compat machinery
- test property value in VMSTATE macros

Big advantage is, it works well with any downstreams
which pick any properties they like.
Why is this not a good fit here?


> ---
>  hw/display/virtio-gpu.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/display/virtio-gpu.c b/hw/display/virtio-gpu.c
> index ae831b6b3e..b2d8e5faeb 100644
> --- a/hw/display/virtio-gpu.c
> +++ b/hw/display/virtio-gpu.c
> @@ -20,6 +20,7 @@
>  #include "trace.h"
>  #include "sysemu/dma.h"
>  #include "sysemu/sysemu.h"
> +#include "hw/boards.h"
>  #include "hw/virtio/virtio.h"
>  #include "migration/qemu-file-types.h"
>  #include "hw/virtio/virtio-gpu.h"
> @@ -1166,10 +1167,14 @@ static void virtio_gpu_cursor_bh(void *opaque)
>      virtio_gpu_handle_cursor(&g->parent_obj.parent_obj, g->cursor_vq);
>  }
>  
> +static bool machine_check_9_0(void *opaque, int version)
> +{
> +    return machine_check_version(9, 0);
> +}
> +
>  static const VMStateDescription vmstate_virtio_gpu_scanout = {
>      .name = "virtio-gpu-one-scanout",
> -    .version_id = 2,
> -    .minimum_version_id = 1,
> +    .version_id = 1,
>      .fields = (const VMStateField[]) {
>          VMSTATE_UINT32(resource_id, struct virtio_gpu_scanout),
>          VMSTATE_UINT32(width, struct virtio_gpu_scanout),
> @@ -1181,12 +1186,12 @@ static const VMStateDescription vmstate_virtio_gpu_scanout = {
>          VMSTATE_UINT32(cursor.hot_y, struct virtio_gpu_scanout),
>          VMSTATE_UINT32(cursor.pos.x, struct virtio_gpu_scanout),
>          VMSTATE_UINT32(cursor.pos.y, struct virtio_gpu_scanout),
> -        VMSTATE_UINT32_V(fb.format, struct virtio_gpu_scanout, 2),
> -        VMSTATE_UINT32_V(fb.bytes_pp, struct virtio_gpu_scanout, 2),
> -        VMSTATE_UINT32_V(fb.width, struct virtio_gpu_scanout, 2),
> -        VMSTATE_UINT32_V(fb.height, struct virtio_gpu_scanout, 2),
> -        VMSTATE_UINT32_V(fb.stride, struct virtio_gpu_scanout, 2),
> -        VMSTATE_UINT32_V(fb.offset, struct virtio_gpu_scanout, 2),
> +        VMSTATE_UINT32_TEST(fb.format, struct virtio_gpu_scanout, machine_check_9_0),
> +        VMSTATE_UINT32_TEST(fb.bytes_pp, struct virtio_gpu_scanout, machine_check_9_0),
> +        VMSTATE_UINT32_TEST(fb.width, struct virtio_gpu_scanout, machine_check_9_0),
> +        VMSTATE_UINT32_TEST(fb.height, struct virtio_gpu_scanout, machine_check_9_0),
> +        VMSTATE_UINT32_TEST(fb.stride, struct virtio_gpu_scanout, machine_check_9_0),
> +        VMSTATE_UINT32_TEST(fb.offset, struct virtio_gpu_scanout, machine_check_9_0),
>          VMSTATE_END_OF_LIST()
>      },
>  };
> -- 
> 2.41.0.28.gd7d8841f67

