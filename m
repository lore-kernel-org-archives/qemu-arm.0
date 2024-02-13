Received: by 2002:a17:906:3953:b0:a3d:1c09:7d3d with SMTP id g19csp61009eje;
        Tue, 13 Feb 2024 03:19:38 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX1OlWFXpvi6a+q73DO3h8EPsGli6J+kqFYeK+Geb7ZLsYWq07oQLoXp8Ea1WTG1G8dHByal9ae4g78M1y+lERrE7Uzyy3Q
X-Google-Smtp-Source: AGHT+IH/dFoJKtycCVhV3S4Sj7dilP373F/+1svH0bMoqBP/7sIxE/xi13AzzC0HC8Wlu1rxkdXd
X-Received: by 2002:a05:622a:18a8:b0:42c:6b3d:5eb with SMTP id v40-20020a05622a18a800b0042c6b3d05ebmr10558255qtc.64.1707823178545;
        Tue, 13 Feb 2024 03:19:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707823178; cv=none;
        d=google.com; s=arc-20160816;
        b=xU1WvTKiJ2lprBNM/XTTuaL7C8qJBsDi9+jQ10SyQT6Z2r+ON2kuoU0FUiuEStYTco
         TW0DQEE0e3KSy2SiRAxbFJvAvKd5FXMwdl9RvbfIFfe4RjUOA6E6nVbdjBDa4VjUAwSo
         N+EdApx/oVIM6ZYM957ya3O+D7BhgSc5yu1dEi0a+EphZqNh7ZKkCY15/hUw2wFrhDo2
         tacMFMWtlSVT3v7f3YB5HoIg59tnHBq1GcxpzLMBCvcM1pmnHMbk3oSUXE8uV65LN186
         CENfC3N6c5kCoya3Iat0KS84nD8pcLPedTUjLrZiMvnegidXhv2sWGzYwyonnsXrvClr
         69uA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:reply-to:list-subscribe:list-help:list-post
         :list-archive:list-unsubscribe:list-id:precedence
         :content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=LCLGA4U2uFc6QN+wzebmqUfLAFpDW+wWikqw8h42iVs=;
        fh=apL9Uiq/Km+QiPatW0eAm2vAdn+exkF9UECvgIxAK1o=;
        b=rXSpUgX1XfatQVzp5v0sndp1TE2gvHeaq1BojwcDJo82wYQzjv3CRmAT73UCOL0Jv2
         TSKk6a4czRbfqVWIqa4y18xRBlIivutZXCP/ivQz22KdqXkAxypjC6zjWDfZrOiGyZ+7
         Y1ZlTtQjSIjnL9oczPen/2Eru67+sW4Cz7cvFktiBcYnWcsCiHLOE03xbLB2itzOIyEq
         GWzza13QQPK7XHfPGuhGs3nwU7D8fNKWN9yz3KUtsVW71Mn2hLmEeFB9CDj9SVxV3e0H
         U4gipPGkmcSGPU/3ZZgi/UgX1HNprnI8p8mag9xPc1PzJSJW1GAymuNnbhyK2TF6kMpt
         ++nQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DaHh6EKx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
X-Forwarded-Encrypted: i=1; AJvYcCXjaAYobUePQbOpntbTKaGvxoPziZszjmdHt5yejBSkeTNL2RQYuYSj+YHnce4XeaN/XQVLRgU7eE8S6T6cjEDPsvfXI98G
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id js6-20020a0562142aa600b0068d18a99f78si2615048qvb.38.2024.02.13.03.19.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 Feb 2024 03:19:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DaHh6EKx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rZqoy-00046K-QH; Tue, 13 Feb 2024 06:19:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rZqox-00044m-By
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 06:19:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1rZqov-000105-Nc
 for qemu-arm@nongnu.org; Tue, 13 Feb 2024 06:19:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1707823163;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=LCLGA4U2uFc6QN+wzebmqUfLAFpDW+wWikqw8h42iVs=;
 b=DaHh6EKxl5W4MoT5l1iRMyeU81NRZ4xKVZEQ1oLqe44dliD1mECi1xcxoogTQKRIZalsEZ
 9GTEZjZdaIYSd4P59h9YLAlBx6RZ+mInVGb6yGfeB6ngI85YE9Z3AdFREtKF1D5IKHaaxa
 GSSHv8YL9o3KEGz/Y/bLVk4rnBvarqw=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-408-PWu2ZuWIOii_W028HoiYyw-1; Tue, 13 Feb 2024 06:19:21 -0500
X-MC-Unique: PWu2ZuWIOii_W028HoiYyw-1
Received: by mail-yb1-f197.google.com with SMTP id
 3f1490d57ef6-dc647f65573so7495824276.2
 for <qemu-arm@nongnu.org>; Tue, 13 Feb 2024 03:19:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707823161; x=1708427961;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LCLGA4U2uFc6QN+wzebmqUfLAFpDW+wWikqw8h42iVs=;
 b=Gl9wHlYl4445hBNrCKhWJEO959nJWjlYHaXpDxvaf+B8KRNO9Bf2LhNSqbQyE0VYCO
 YXKgxtbz7pOZe5qJ0uQypWUGnZijcxxBmLfs26xmD/Bfnsl6IqMoL6q3URLAOgVVYTbz
 Hq0aeV+P91C3GuG6c0TKKQyCGOkQTF6dueqbJsKp3eLa6SL90GOoZqiINfUo7R1W/t5I
 mW126shC3UJPDdmmqpQAGZk3+eo9tZPUd029sGaE6SR1yfrT2DcaSMIZlfBWiAenxrak
 JQ0w0ezjhDzNix2ilId3iipXbI6NBYBC5d+Tx3oEFQjy/o1zMgfZj6C98g/DSYzsPPPl
 5SJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWfh1oC57w8dSMoXdSyenm074l5GnGeZ2vBWjj7MOD3NU93UTjQF8MvIPLJgLzUvonX7l8UI4/NzNP19kfNJg7PmxLm
X-Gm-Message-State: AOJu0YyrdoFZ4QFEwEA6UmfJUP6ixXqhc+xYArnpmbaKeaVLzwfTgT4Z
 0uuFbgKOp5y22JEBu3jTL/74RKg8LfgJXHTqyqIx/UAgwXpbH4IKvLnvMoOFfE3G1zbeXtJ/NlY
 BX/z2TWpeReAwZFI2MYg+VIMhKjUoZCOsToSg2rRqtJXNI48zvA==
X-Received: by 2002:a25:918f:0:b0:dbe:a65c:fdf0 with SMTP id
 w15-20020a25918f000000b00dbea65cfdf0mr7680839ybl.34.1707823161322; 
 Tue, 13 Feb 2024 03:19:21 -0800 (PST)
X-Received: by 2002:a25:918f:0:b0:dbe:a65c:fdf0 with SMTP id
 w15-20020a25918f000000b00dbea65cfdf0mr7680820ybl.34.1707823160894; 
 Tue, 13 Feb 2024 03:19:20 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCU9+1nh90Mi2+j6X/tLO8inVgbpoDZqCw3SNM8ZRpRCdtbhkWbx6lEMdVdDv40BYeJCKOLKYR5D1k3MazjBIhK5zS0JiuLhktnXhB0u1E2a5d6dlEOS3hG6DQ7lUgKJsFlK85RxOqAY3d3QbmrhnA8OrUkIeAAUY4c7ht4hGuVH1awn9jWgq7h/gdJCxqOOXvtXKhq5eX1ryIYDMmT2VBCU7f2AGC0AVkxZKsPGmyh5D0VtDztLaBciJMY=
Received: from ?IPV6:2a01:e0a:59e:9d80:4685:ff:fe66:ea36?
 ([2a01:e0a:59e:9d80:4685:ff:fe66:ea36])
 by smtp.gmail.com with ESMTPSA id
 j26-20020a37ef1a000000b00785c09a0706sm2848852qkk.20.2024.02.13.03.19.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Feb 2024 03:19:20 -0800 (PST)
Message-ID: <91f1b2d8-da88-43c3-871f-7c47ef0d9439@redhat.com>
Date: Tue, 13 Feb 2024 12:19:16 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] virtio-iommu: Use qemu_real_host_page_mask as default
 page_size_mask
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: eric.auger.pro@gmail.com, qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 jean-philippe@linaro.org, alex.williamson@redhat.com, clg@redhat.com,
 peter.maydell@linaro.org
References: <20240117132039.332273-1-eric.auger@redhat.com>
 <20240213044312-mutt-send-email-mst@kernel.org>
 <6d4b5766-f8e2-4889-827d-01d3509239f7@redhat.com>
 <20240213060544-mutt-send-email-mst@kernel.org>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20240213060544-mutt-send-email-mst@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: M5BAf87Hqsur



On 2/13/24 12:07, Michael S. Tsirkin wrote:
> On Tue, Feb 13, 2024 at 11:32:13AM +0100, Eric Auger wrote:
>> Hi Michael,
>>
>> On 2/13/24 10:43, Michael S. Tsirkin wrote:
>>> On Wed, Jan 17, 2024 at 02:20:39PM +0100, Eric Auger wrote:
>>>> We used to set default page_size_mask to qemu_target_page_mask() but
>>>> with VFIO assignment it makes more sense to use the actual host page mask
>>>> instead.
>>>>
>>>> So from now on qemu_real_host_page_mask() will be used as a default.
>>>> To be able to migrate older code, we increase the vmstat version_id
>>>> to 3 and if an older incoming v2 stream is detected we set the previous
>>>> default value.
>>>>
>>>> The new default is well adapted to configs where host and guest have
>>>> the same page size. This allows to fix hotplugging VFIO devices on a
>>>> 64kB guest and a 64kB host. This test case has been failing before
>>>> and even crashing qemu with hw_error("vfio: DMA mapping failed,
>>>> unable to continue") in VFIO common). Indeed the hot-attached VFIO
>>>> device would call memory_region_iommu_set_page_size_mask with 64kB
>>>> mask whereas after the granule was frozen to 4kB on machine init done.
>>>> Now this works. However the new default will prevent 4kB guest on
>>>> 64kB host because the granule will be set to 64kB which would be
>>>> larger than the guest page size. In that situation, the virtio-iommu
>>>> driver fails on viommu_domain_finalise() with
>>>> "granule 0x10000 larger than system page size 0x1000".
>>>>
>>>> The current limitation of global granule in the virtio-iommu
>>>> should be removed and turned into per domain granule. But
>>>> until we get this upgraded, this new default is probably
>>>> better because I don't think anyone is currently interested in
>>>> running a 4kB page size guest with virtio-iommu on a 64kB host.
>>>> However supporting 64kB guest on 64kB host with virtio-iommu and
>>>> VFIO looks a more important feature.
>>>>
>>>> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>>>> Tested-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>>> Reviewed-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
>>> What about migration compatibility? In particular, cross-version one?
>>> Don't we need compat machinery for this?
>> See below
>>>> ---
>>>>
>>>> v1 -> v2:
>>>> - fixed 2 typos in the commit msg and added Jean's R-b and T-b
>>>> ---
>>>>  hw/virtio/virtio-iommu.c | 7 +++++--
>>>>  1 file changed, 5 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/hw/virtio/virtio-iommu.c b/hw/virtio/virtio-iommu.c
>>>> index 8a4bd933c6..ec2ba11d1d 100644
>>>> --- a/hw/virtio/virtio-iommu.c
>>>> +++ b/hw/virtio/virtio-iommu.c
>>>> @@ -1313,7 +1313,7 @@ static void virtio_iommu_device_realize(DeviceState *dev, Error **errp)
>>>>       * in vfio realize
>>>>       */
>>>>      s->config.bypass = s->boot_bypass;
>>>> -    s->config.page_size_mask = qemu_target_page_mask();
>>>> +    s->config.page_size_mask = qemu_real_host_page_mask();
>>>>      s->config.input_range.end = UINT64_MAX;
>>>>      s->config.domain_range.end = UINT32_MAX;
>>>>      s->config.probe_size = VIOMMU_PROBE_SIZE;
>>>> @@ -1491,13 +1491,16 @@ static int iommu_post_load(void *opaque, int version_id)
>>>>       * still correct.
>>>>       */
>>>>      virtio_iommu_switch_address_space_all(s);
>>>> +    if (version_id <= 2) {
>>>> +        s->config.page_size_mask = qemu_target_page_mask();
>> I tested migration from v2 -> v3 and the above code is overriding the
>> new default by the older one.
>>
>> Do you have an other concern?
>>
>> Thanks
>>
>> Eric
>
>
>>>> +    }
>>>>      return 0;
>>>>  }
>>>>  
>>>>  static const VMStateDescription vmstate_virtio_iommu_device = {
>>>>      .name = "virtio-iommu-device",
>>>>      .minimum_version_id = 2,
>>>> -    .version_id = 2,
>>>> +    .version_id = 3,
>>>>      .post_load = iommu_post_load,
>>>>      .fields = (const VMStateField[]) {
>>>>          VMSTATE_GTREE_DIRECT_KEY_V(domains, VirtIOIOMMU, 2,
> Oh I missed the version change. But then migration  to older version
> is completely broken isn't it? Old qemu can not handle version_id 3 at
> all.
Indeed, I considered migrating backyard was not that much important. Do
you consider this is mandated?

Eric
>
> Generally, compat machinery is nicer than the old version hacks.
>
>
>>>> -- 
>>>> 2.41.0
>

