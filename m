Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp21809eje;
        Tue, 13 Feb 2024 01:45:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCW0tG0byCyy2v2drdp/gRJvxX4KKmwhZJ7iFJU+ZnXzrXn082f/eHwgmVnfqaBxhdstLgoq4z/TkICVPi8MtiUT+hB+E+T5
X-Google-Smtp-Source: AGHT+IGrjV9bbCTjBehBh9/qLvyuXEVsOmf+xLws2bP39VJTVNRStZQ5Jx3v4RmVwp9UVFmpE7XQ
X-Received: by 2002:a05:6214:27cf:b0:68c:cb4c:f96 with SMTP id ge15-20020a05621427cf00b0068ccb4c0f96mr10444962qvb.24.1707817529226;
        Tue, 13 Feb 2024 01:45:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707817529; cv=none;
        d=google.com; s=arc-20160816;
        b=Gy0UbiFwy1wT43WBoxCmYzQ9nacD99k+9aaYOMRpCvWnLmIpjMiCe77V9D8Sxn2OwS
         0fPU0qVzF4BXDYWHr3rTRFHOBWzDIy2yRiYCLi8W5ArkhihYJxzoyyXQZbzMFIcdS1/r
         K8PUONitWNtZRAYww8aGIQTz5NWXoBjjxii2zo4icI6lVE/gERifRAhvEZLjn37TeDw7
         GHdOk5377Uzh3wZoPTMHpVTPbwshlN6FV/KWjLX5zNIC9PIuWF2+nxTINQT6by6O+yEB
         TYPfAfcTw/bnU3XGe9ZbVLuJbJDf/X3hir/uLG/vFz/3PzZloaYxapTCfN7zkcVzh3wd
         0oLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=9kHVkDwBtC5IG302WkC9sPitZi9ffNJvND+yCp6Ty80=;
        fh=LyXcMwp1DdgMnY+A1m0WyCI5nnZ7I3YonWRRh6Miydo=;
        b=ZGbo/TJwKdrYKn1fFfBQR9xfuYsxGoY/pi0rrUY2j3bLpT28a/0cvp4tmhK2X7DHQS
         w2kSOnBf9/YiQF47rogoy9byIa+FhXKK05Ag535/GQYiyoHtjBIXlXUudafJ1Iy03evJ
         s8PHN69UqdJy/SzJ9588+2wxTGYrRj8dDPvSO9+Z7Ex3XTaPy83AMSqu/8jjaW5fj2ys
         y0fpEOs+pE0K12iH4VNDRVc9DLN39ntnhzU6lB4Avg3LxrBjCFs+VKuzGdCBD5uA+FZo
         r4OPSLQdtByaSp3mAgafcA1Vx2gorWJ5cWSWIrAE0JrjnJKoqp6ZWRgjEYWHgoTUpjme
         pT/w==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cvCHlIEg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCVzjUTELCr9esQMmxysjMozxFYjoQXdRZeYw9+lNBu1J7Fr4U/z2gcIJY8cHIzjMSQH75u3Udsmh6Fg8tgIr90Oq+SvyPQr
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u15-20020a0562141c0f00b0068cccd6088asi2508652qvc.247.2024.02.13.01.45.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 01:45:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=cvCHlIEg;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZpKq-0001yN-7d; Tue, 13 Feb 2024 04:44:16 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rZpKh-0001s1-2E
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 04:44:08 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1rZpKf-0000k3-4F
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 04:44:06 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707817444;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=9kHVkDwBtC5IG302WkC9sPitZi9ffNJvND+yCp6Ty80=;
 b=cvCHlIEgpGDhFB+g5CPvrB3C7v9CzrUix7kCSL4Poy9UQB4SUoKmMNjrbFsP3kvU199GMV
 9gxvmqp0E53FDMcsVLUTXT18ZqoQjwvK6v51kyONr9FZr5KRaX90n00XP4APam6dFefh+x
 1Moja8t6b0RODBbYOi5Hc+oXsHZNjB0=
Received: from mail-lf1-f70.google.com (mail-lf1-f70.google.com
 [209.85.167.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-00priu66PV6tc76VR6XXzw-1; Tue, 13 Feb 2024 04:44:02 -0500
X-MC-Unique: 00priu66PV6tc76VR6XXzw-1
Received: by mail-lf1-f70.google.com with SMTP id
 2adb3069b0e04-5116e86c080so3425212e87.3
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 01:44:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707817441; x=1708422241;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9kHVkDwBtC5IG302WkC9sPitZi9ffNJvND+yCp6Ty80=;
 b=T92btuLxBr1gru2WMHQt3f+sE1HK/Bcaes9WbbsTpXn6UR+uD9yy/Qs+/IfjmR5JbI
 pbRKrZd7COaJdxhqfyhCI8shAThCwZCAujP6EPH9z8etzAAJ1SxXuix2fBkUKthMH+Lk
 X9CNTOy0JsM8sFLkmOwCtO3SRVl1dNJ3oneXxUZ8wsv39InSTYOUwU0JP8Eo16Hn49oD
 /JxEkTeWC7tl9+kBTKT6/hOiSE1rxi85dmAgXKs1vKFblcL7t2XFzm9cbuex+zKYHQpQ
 ijBHKmJiGK7W4kj54p1gpdxIrdvXcx7r8+yCXSkEqdraG48qsitjm9a1MX5QLtXBU5Ic
 PvWg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXD4qWlWEz1ZQDo69AIIe1AooQMjcIl8OUdlIdQL/IrZaXXatKyo7uwfPdXCjVGNVgnrAswaYe9ucSOdTD/zhOPRYoW
X-Gm-Message-State: AOJu0YztRenj10+7ecJse7kDe6VW6h3NVP+DWcLrVH5ZfVZGzVeEPodz
 weiut3+gkbixlsKDBX+iFFdMf1llszjm4FIPO9p8+slxvikAv+EzEi0z1aUlLdRmx1gqk/bMK0V
 6ZtEzLSzGLzQJrbOj1zKQHxwR00gZd4deIvu09Xy8502Vuij/dg==
X-Received: by 2002:ac2:410a:0:b0:511:5494:dd53 with SMTP id
 b10-20020ac2410a000000b005115494dd53mr6032345lfi.19.1707817441406; 
 Tue, 13 Feb 2024 01:44:01 -0800 (PST)
X-Received: by 2002:ac2:410a:0:b0:511:5494:dd53 with SMTP id
 b10-20020ac2410a000000b005115494dd53mr6032333lfi.19.1707817441035; 
 Tue, 13 Feb 2024 01:44:01 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWMRUtjXopPbZ4JDJ2c4QUq79feUFwhGcnRFmyLQ+wqdlaNyU4MBwp38kSHtdoEqAQ1INt8w07GYv7kNUkAJyA0SIh8ngPZJW7shPUkxluZ0A9zVaFPopb7iQrrtHUZbDZRQXKzvcSRlNB0LWHYpbFIk7KEZYRBHWnb70jpGoihnqp4GAVILkvXZ/oq1fxl93yEXXZktc58oqXO8MbJD8NFFkZZQ728CoTWqBLvS/NcJ0pcDUxLIQ3sp5M=
Received: from redhat.com ([2.52.146.238]) by smtp.gmail.com with ESMTPSA id
 i10-20020a056512318a00b005118bbf458fsm833779lfe.143.2024.02.13.01.43.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 01:44:00 -0800 (PST)
Date: Tue, 13 Feb 2024 04:43:55 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, alex.williamson@redhat.com,
 clg@redhat.com, peter.maydell@linaro.org
Subject: Re: [PATCH v2] virtio-iommu: Use qemu_real_host_page_mask as default
 page_size_mask
Message-ID: <20240213044312-mutt-send-email-mst@kernel.org>
References: <20240117132039.332273-1-eric.auger@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20240117132039.332273-1-eric.auger@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.774,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: 6ACmQJ1OJ3Rg

On Wed, Jan 17, 2024 at 02:20:39PM +0100, Eric Auger wrote:
> We used to set default page_size_mask to qemu_target_page_mask() but
> with VFIO assignment it makes more sense to use the actual host page mask
> instead.
> 
> So from now on qemu_real_host_page_mask() will be used as a default.
> To be able to migrate older code, we increase the vmstat version_id
> to 3 and if an older incoming v2 stream is detected we set the previous
> default value.
> 
> The new default is well adapted to configs where host and guest have
> the same page size. This allows to fix hotplugging VFIO devices on a
> 64kB guest and a 64kB host. This test case has been failing before
> and even crashing qemu with hw_error("vfio: DMA mapping failed,
> unable to continue") in VFIO common). Indeed the hot-attached VFIO
> device would call memory_region_iommu_set_page_size_mask with 64kB
> mask whereas after the granule was frozen to 4kB on machine init done.
> Now this works. However the new default will prevent 4kB guest on
> 64kB host because the granule will be set to 64kB which would be
> larger than the guest page size. In that situation, the virtio-iommu
> driver fails on viommu_domain_finalise() with
> "granule 0x10000 larger than system page size 0x1000".
> 
> The current limitation of global granule in the virtio-iommu
> should be removed and turned into per domain granule. But
> until we get this upgraded, this new default is probably
> better because I don't think anyone is currently interested in
> running a 4kB page size guest with virtio-iommu on a 64kB host.
> However supporting 64kB guest on 64kB host with virtio-iommu and
> VFIO looks a more important feature.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Tested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>

What about migration compatibility? In particular, cross-version one?
Don't we need compat machinery for this?

> ---
> 
> v1 -> v2:
> - fixed 2 typos in the commit msg and added Jean's R-b and T-b
> ---
>  hw/virtio/virtio-iommu.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 8a4bd933c6..ec2ba11d1d 100644
> --- a/hw/virtio/virtio-iommu.c
> +++ b/hw/virtio/virtio-iommu.c
> @@ -1313,7 +1313,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>       * in vfio realize
>       */
>      s->config.bypass = s->boot_bypass;
> -    s->config.page_size_mask = qemu_target_page_mask();
> +    s->config.page_size_mask = qemu_real_host_page_mask();
>      s->config.input_range.end = UINT64_MAX;
>      s->config.domain_range.end = UINT32_MAX;
>      s->config.probe_size = VIOMMU_PROBE_SIZE;
> @@ -1491,13 +1491,16 @@ static int iommu_post_load(void *opaque, int version_id)
>       * still correct.
>       */
>      virtio_iommu_switch_address_space_all(s);
> +    if (version_id <= 2) {
> +        s->config.page_size_mask = qemu_target_page_mask();
> +    }
>      return 0;
>  }
>  
>  static const VMStateDescription vmstate_virtio_iommu_device = {
>      .name = "virtio-iommu-device",
>      .minimum_version_id = 2,
> -    .version_id = 2,
> +    .version_id = 3,
>      .post_load = iommu_post_load,
>      .fields = (const VMStateField[]) {
>          VMSTATE_GTREE_DIRECT_KEY_V(domains, VirtIOIOMMU, 2,
> -- 
> 2.41.0

