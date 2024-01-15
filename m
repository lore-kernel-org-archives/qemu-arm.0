Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp160226ejf;
        Mon, 15 Jan 2024 03:06:28 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGQ6gl+VGKqFvJE8Ejphg/n1FPmyO5KXoVVPvxJnTOwd/t6G8UJl2fsv7+IgD8miw1qva9P
X-Received: by 2002:a05:6102:cc:b0:467:da2b:4f19 with SMTP id u12-20020a05610200cc00b00467da2b4f19mr2898177vsp.25.1705316788282;
        Mon, 15 Jan 2024 03:06:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705316788; cv=none;
        d=google.com; s=arc-20160816;
        b=KQVZI3nM/IURw+SUReWIv8NCKhxbiKzH5uUR2JriGe/YP5Gdt0BK3Vi6e70bkQv0Rz
         QtbpLMKpEM5LdNMJgy/alMXnDYwXoOa6LaYwDeN+N3Wgt5Gz/VyjHUNhmWFRErccfrJV
         pXGq6KfoZsTcUJKNH1tmeonmW0ixhh7L24pU/TE6fdo3OkilnepkF7QxUlLQCE+ZsqsX
         DMJS1FJiTP1anHT9iUfrscDZJj2qhjh2j51OhBEv87O6Lh5uilPf6J+yXrVH7i8k4aJu
         MUbkzjI2AnfVl3uCOQjqHahuLZbjtSlDLe7MFf41au7zO3qKU8CfnrMhQ8j0Bi/YjmVt
         n3dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=5W3LgO0URoAYwkiJOhIJtLijANjTr8HAZ+QfpNajcW8=;
        fh=bZdE+urztUL+7XOI06+xxICqdW0eObMogB22+q2scaw=;
        b=Jn/gtlOMYd36ZEoVBQQA8XmiY5MLoa+9dSTmoBgJxikgB0kfPKZT3K39Q4ekXQ9Hc6
         YJ009pO+pf3IIz7abvPSQ6xrr4Hnm00XPy0Fr9Oo7uwlhEGS0C82XgqP6ysUpWAXLTP/
         2Mb3Ki870aP0DHdsz3okKzG5H3Q605AbT9oeu9OgmgcOJX1kP0AAO3gGqJ8wADIc8i3Y
         46Ey4skeKcmdDkZ8xnNe1sjA5+/U1keCSimRNTNnvwLCDJtJeiafEJQvEKo8U9v5CTp1
         yyIPmbjOMlx4TgdIUkX0mu8JLpqhXwinNJLV9t/+QCNh2d4Xh5YhsGtFN7TeU/k7Czmd
         pLBw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dLriMEzt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e2-20020a0cf342000000b0067f3b3dec1dsi7685011qvm.258.2024.01.15.03.06.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jan 2024 03:06:28 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=dLriMEzt;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rPKnB-0005JT-To; Mon, 15 Jan 2024 06:06:09 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rPKn9-0005Ie-Hl
 for qemu-devel@nongnu.org; Mon, 15 Jan 2024 06:06:07 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rPKn5-0004hg-FC
 for qemu-devel@nongnu.org; Mon, 15 Jan 2024 06:06:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1705316761;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5W3LgO0URoAYwkiJOhIJtLijANjTr8HAZ+QfpNajcW8=;
 b=dLriMEztlJopNtC+/0CBQSGfoWg+a3yIOYU2euDB7luPMNrkkptZcyJ35zGYKlHB+Rj+a2
 LOpQ+Jgn/xEXdLUq76xDad0mjw/1UDwqcScDzvUODgGiKnnhBMmTXad4gjpq7HCoiFmDzG
 Yg/nBQU5L1ZuuSfNix2kOMGtlD3nV30=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-172-ebvgCu7AP7qL4ofbTNEvlw-1; Mon, 15 Jan 2024 06:04:48 -0500
X-MC-Unique: ebvgCu7AP7qL4ofbTNEvlw-1
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-783252bcf1aso908996485a.2
 for <qemu-devel@nongnu.org>; Mon, 15 Jan 2024 03:04:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705316688; x=1705921488;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5W3LgO0URoAYwkiJOhIJtLijANjTr8HAZ+QfpNajcW8=;
 b=A1BSAuEqGemobbAmQr8DFdOqEye71F5LNNyyaMP2pXeS/Nd/uK0Y+EHzASaKJ1oroc
 oJFL8WQAnEK9ueZSqfufmpwMxjb8bbUeNuTIccxn5A4pXhCVwWyQISeThci0vIJXlnTX
 FqDD/DpkKE9rEoZqYOqk9BpkuOT8s1IRL1J2eZi/C6UfyiaAYNc0BycUp6kPN4fYf6YZ
 Maedg6DSJOwhgwGN8k48CkFBV/bBDPZyuSPbtrCb6o7nX4MZ5xROsX/xcMLqjQBpONZz
 p9iz9ZNgQrZmvI99dru4JjaYg7sgTGhiA8Ky1hIzDrU0s9/0fxgmpcIv1FqQEBsC94dw
 BWyA==
X-Gm-Message-State: AOJu0YyAxBwoN6leqEU3D+Xfc8yqL2ZUrFx8eY/nG6uuANkYtBzWGHs3
 gOZzt4CGVeaYZYs7B3f7A0eS5MGRp5YbskaFicHSw9Aea0eZWoAYpVqmnwwRbRg3Hfg4vO1amxE
 WonhrFDWuLhC5SsO8uEN8Rek=
X-Received: by 2002:a05:620a:5597:b0:783:636c:d0d4 with SMTP id
 vq23-20020a05620a559700b00783636cd0d4mr545173qkn.121.1705316687778; 
 Mon, 15 Jan 2024 03:04:47 -0800 (PST)
X-Received: by 2002:a05:620a:5597:b0:783:636c:d0d4 with SMTP id
 vq23-20020a05620a559700b00783636cd0d4mr545160qkn.121.1705316687469; 
 Mon, 15 Jan 2024 03:04:47 -0800 (PST)
Received: from ?IPV6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 m1-20020a05620a214100b00781df3924f3sm2858976qkm.129.2024.01.15.03.04.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Jan 2024 03:04:46 -0800 (PST)
Message-ID: <9d932feb-b849-4fac-855f-bfbaf0149f03@redhat.com>
Date: Mon, 15 Jan 2024 12:04:43 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] virtio-iommu: Use qemu_real_host_page_mask as default
 page_size_mask
Content-Language: en-US
To: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, peter.maydell@linaro.org, mst@redhat.com
Cc: clg@redhat.com, alex.williamson@redhat.com
References: <20231221134505.100916-1-eric.auger@redhat.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20231221134505.100916-1-eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -33
X-Spam_score: -3.4
X-Spam_bar: ---
X-Spam_report: (-3.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-2.758,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_SORBS_WEB=1.5, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Reply-To: eric.auger@redhat.com
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: jIPmjLrWurGM

Hi,

On 12/21/23 14:45, Eric Auger wrote:
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
> driver fails the viommu_domain_finalise() with
> "granule 0x10000 larger than system page zie 0x1000".
>
> The current limitation of global granule in the virtio-iommu
> should be removed and turned into per domain granule. But
> until we get this upgraded, this new default is probably
> better because I don't think anyone is currently interested in
> running a 4kB page size guest with virtio-iommu on a 64kB host.
> However supporting 64kB guest on 64kB host with virtio-iommu and
> VFIO looks a more important feature.

Gentle ping

Thanks

Eric
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  hw/virtio/virtio-iommu.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
> index 9d463efc52..b77e3644ea 100644
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
>      .fields = (VMStateField[]) {
>          VMSTATE_GTREE_DIRECT_KEY_V(domains, VirtIOIOMMU, 2,

