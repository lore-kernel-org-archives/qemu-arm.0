Received: by 2002:a17:907:2723:b0:a5a:9152:cbdc with SMTP id d3csp755710ejl;
        Wed, 15 May 2024 09:04:14 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmuxoCDd9aQcVs+IwvuSAwAwE+UhxOMtEyeZ6QDnyJNn/RS4A8NP9bDhUKbcyPPttI3CZZmkHfb08xETqi4ZX6glW0L2Bk
X-Google-Smtp-Source: AGHT+IFGieYJt2/5E+UQLC30Bs38hn2sBLtsyS4fd0FItrkM8dXuVP6NVt28HGKdPppl48gFCRnv
X-Received: by 2002:a25:8145:0:b0:de6:159d:c4bd with SMTP id 3f1490d57ef6-dee4f37dba2mr13667675276.62.1715789054408;
        Wed, 15 May 2024 09:04:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1715789054; cv=none;
        d=google.com; s=arc-20160816;
        b=fUbv8zqWcQb6VlrWcRLHEqJqDybptrfaruF4eNJzv8TKwr2Fi82vO5UL8U9FqqrQ9y
         JdiLMcFY2/AmDw29XIKZ7O6HE7rP8Z7c3N39MYirBJCqBAmR/Pgdm9f72twCxIvBuwA9
         1PWy52C5C/Way2Q6+M4A6cRbRC/sUcgltjBJf3E4x1hcCiC9MDOfaYylcwW53yQF2ioB
         4tjtaj/pgbJGglW4PKXqqaulYFA6IID/uY/Dt1caG4UHz1TujmzqHpMA+68OjQ71Frs5
         6Y5a2OLzCPhyI8Wq1sOQLdakfz66U9yRRTeSjpaA98GyaFO7KWwNL3ON6M3SZnvl4a9i
         l/7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence:user-agent
         :in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=yul14Iba9gQ06KAp3BAHzUcXKv21bZcrm8jPtqpFSvE=;
        fh=dUf3VhAOX85SRcpLa+KuoQv7iPjqTStFOGhYPTZUWKU=;
        b=nfFk/jXbRN93fE0LdYm1XkUwYrXXco3Bj3JFSN+4xBxwcZJaeXy3zoj1aNoMPytAX0
         13RtTI2U3DFwzCUpMiv0rXg9lltKpBZBO2OMjFY4dsJS0LfsL0sRvsiDVbn56uEhC3k/
         l9IeXpuGfBNxmDPlNTcyHZo1v2UNltKHNMMafUJ9or04VdDVbozmwXrjgoxDbUUdCqvM
         5MwCJUP5H3ouohdbRlWVXnQfw7QMGchnXaKm+7c3ptvf9Gy34FfXQPKxqZSt/3y1Seip
         /gVL0lKAkmPS9TaDVQjNN37mU8GGS7jn0qKwzH+NhI3K8mQSux+KDg/fTcaoNMGBt1B9
         Ifuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ij63PwpM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 3f1490d57ef6-debd388a88csi7056247276.585.2024.05.15.09.04.14
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 15 May 2024 09:04:14 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=Ij63PwpM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s7H6q-0002SX-7S; Wed, 15 May 2024 12:04:04 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1s7H6k-0002F8-Ok
 for qemu-arm@nongnu.org; Wed, 15 May 2024 12:03:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <berrange@redhat.com>)
 id 1s7H6g-0000Wh-Vp
 for qemu-arm@nongnu.org; Wed, 15 May 2024 12:03:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1715789033;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yul14Iba9gQ06KAp3BAHzUcXKv21bZcrm8jPtqpFSvE=;
 b=Ij63PwpMgBEEKG4hP/Wx6G6/a7caV+9WuRgHFzImzXx01vIW57IA7a7KzjEMr80LXyvVgP
 Do/hQ08KLwt6VBUTS47+5mQC5NXVH3CE1MenW+wjRYZQM1Rg/Oy+cZJwufWOSJfbZBSqci
 kfL/to3w37nwFzh8tLuLC1+my1a/l9A=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-128-rY8yE26YPZ2OePFvyWsgeA-1; Wed,
 15 May 2024 12:03:50 -0400
X-MC-Unique: rY8yE26YPZ2OePFvyWsgeA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com
 [10.11.54.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 97AB53C00096;
 Wed, 15 May 2024 16:03:49 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.55])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 9960B2026D68;
 Wed, 15 May 2024 16:03:46 +0000 (UTC)
Date: Wed, 15 May 2024 17:03:44 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: marcandre.lureau@redhat.com
Cc: qemu-devel@nongnu.org, Eduardo Habkost <eduardo@habkost.net>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Fiona Ebner <f.ebner@proxmox.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
 Fabiano Rosas <farosas@suse.de>, Gerd Hoffmann <kraxel@redhat.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Peter Xu <peterx@redhat.com>
Subject: Re: [PATCH v3 5/5] virtio-gpu: fix v2 migration
Message-ID: <ZkTc4Ott5M15k55R@redhat.com>
References: <20240515141557.1277999-1-marcandre.lureau@redhat.com>
 <20240515141557.1277999-6-marcandre.lureau@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240515141557.1277999-6-marcandre.lureau@redhat.com>
User-Agent: Mutt/2.2.12 (2023-09-09)
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Received-SPF: pass client-ip=170.10.133.124; envelope-from=berrange@redhat.com;
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
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: XYKcFK//5Cws

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

I think applying version number checks to decide machine type
compatibility is a highly undesirable direction for QEMU to
take.

Machine type compatibility is a difficult problem, but one of
the good aspects about our current solution is that it is
clear what the differences are for each version. We can see
all the compatibility properties/flags/values being set in
one place, in the declaration of each machine's class.

Sprinkling version number checks around the codebase in
arbitrary files will harm visibility of what ABI is expressd
by each machine, and thus is liable to increase the liklihood
of mistakes.

This will negatively impact downstream vendors cherry-picking
patches to their stable branches, as the version number logic
may have incorrect semantics. 

It will also create trouble for downstream vendors who define
their own machines with distinct versioning from upstream, as
there will be confusion over whether a version check is for
the base QEMU version, or the downstream version, and such
code added to the tree is less visible than the machine type
definitions.

Above all, I'm failing to see why there's a compelling reason
for virtio_gpu to diverge from our long standing practice of
adding a named property flag "virtio_scanout_vmstate_fix"
on the machine class, and then setting it in machine types
which need it.


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
> 
> 

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

