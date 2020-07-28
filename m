Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp470003lfy;
        Tue, 28 Jul 2020 03:43:22 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzBnIv+U+uSvLShyH7fTLULsHnzAsWimcxB807iYmW7yBU3JLYETLGaVINLtWJrAWF4drPe
X-Received: by 2002:a25:d92:: with SMTP id 140mr24254634ybn.250.1595933002515;
        Tue, 28 Jul 2020 03:43:22 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1595933002; cv=none;
        d=google.com; s=arc-20160816;
        b=fFRy3YYFGsKQ1f2WrT8OyWACUgkzMthrUh3tRcgXv9xIwaJe+HP402YmFLOoh/6uYU
         1ufeKXVwdegiqulP6oKGg/pe5EXcu3dkzuj72spAP1uHc9tI/9WyEuCMsykrz1VF8zIZ
         RqDXIx4wGSOuu1kavt1jl0pxlh3hzzv7tJ+JA0eLnkA3/XGGyvxny6wepEG1ZYzJ9LP+
         t/GLQq0VXT3yQs8EvKJ0UZMEMMCrR+UAzcvc4IvnrqttcDz9Z47kFNC+/KfBMj0wGCDz
         9Qh6mI7KY9NT/Q1OdtMaBIyRpo8yYmj7LAwq11wlHqvK2GB7UEVLOFRCle/TmGG9H77M
         jDOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:to:from:date
         :dkim-signature;
        bh=0Zqtu93XjkTXjRgpWdCxN5V6Q2rGF/LY/1avvcwWTU8=;
        b=tmCBojtC/6qaC1KUXrvROuGU9D+CJV9Tvws/Ad+soIj87jc7Ym+cINodijfBKXJLPc
         EYRhDjdTt9UyitvjNSai4s/k+1hmKjGZfXuW09Mm7HxYg7mIXppoPW94BuzZHkVsFNio
         /3GWuorN2tyJl/EM5ajBDE1DrdF2QYGyJUFe77K4J9gUHGFk3Ikef87Zl0CVqwD20/I0
         xDMmF3fkXEkbbqNCTSZ7/xh+1PTe/f01PMBaMAb0gTn5H/JqYDQ8RN2ziPUuZnyhs8Ev
         6tE7O80IPLQRjckegyOMmpPrbrGAQZYvHu/ISiMtTAGdgUHoQp6wW56O4iidxnY2+bas
         HUPg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HXJEFfSu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f17si12343512ybg.278.2020.07.28.03.43.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 28 Jul 2020 03:43:22 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=HXJEFfSu;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:52944 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k0N4r-0002in-Tz
	for alex.bennee@linaro.org; Tue, 28 Jul 2020 06:43:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54242)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k0N1p-0000Fq-8R
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 06:40:13 -0400
Received: from us-smtp-1.mimecast.com ([205.139.110.61]:27795
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <drjones@redhat.com>)
 id 1k0N1n-0002z1-Ew
 for qemu-devel@nongnu.org; Tue, 28 Jul 2020 06:40:12 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595932810;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=0Zqtu93XjkTXjRgpWdCxN5V6Q2rGF/LY/1avvcwWTU8=;
 b=HXJEFfSu2uwrvA32achqLO8Mo1sVLXy6Pv81izNd6f3u8/ZHh2LCWDDebZV9HxvBB/od0p
 Ke8yQiSeoiDQgEG6g86R8bDQPgev5SC7yaI7WxZJJ9FAOHsnQjTkGFUux5fydMSsKx+03C
 x2mvwHM1IKFmkKaFV58xOjVrvsfU4xE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-194-Db-3W4OXMSa6UJo7G_1ccg-1; Tue, 28 Jul 2020 06:40:06 -0400
X-MC-Unique: Db-3W4OXMSa6UJo7G_1ccg-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com
 [10.5.11.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 23650107ACCA;
 Tue, 28 Jul 2020 10:40:04 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.40.193.15])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 65716726BA;
 Tue, 28 Jul 2020 10:39:55 +0000 (UTC)
Date: Tue, 28 Jul 2020 12:39:52 +0200
From: Andrew Jones <drjones@redhat.com>
To: Cornelia Huck <cohuck@redhat.com>
Subject: Re: [PATCH] hw: add compat machines for 5.2
Message-ID: <20200728103952.aklbaxcgw7c6eywz@kamzik.brq.redhat.com>
References: <20200728094645.272149-1-cohuck@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20200728094645.272149-1-cohuck@redhat.com>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Received-SPF: pass client-ip=205.139.110.61; envelope-from=drjones@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/28 06:02:02
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Eduardo Habkost <ehabkost@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>,
 qemu-devel@nongnu.org, Halil Pasic <pasic@linux.ibm.com>,
 Christian Borntraeger <borntraeger@de.ibm.com>, qemu-s390x@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 David Gibson <david@gibson.dropbear.id.au>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A/fkCSMJWOQh

On Tue, Jul 28, 2020 at 11:46:45AM +0200, Cornelia Huck wrote:
> Add 5.2 machine types for arm/i440fx/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  9 files changed, 71 insertions(+), 6 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index ecfee362a182..acf9bfbeceaf 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -2546,10 +2546,17 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
>  
> +static void virt_machine_5_2_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(5, 2)
> +
>  static void virt_machine_5_1_options(MachineClass *mc)
>  {
> +    virt_machine_5_2_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_5_1, hw_compat_5_1_len);
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(5, 1)
> +DEFINE_VIRT_MACHINE(5, 1)
>  
>  static void virt_machine_5_0_options(MachineClass *mc)
>  {

For the above hw/arm/virt.c part

Reviewed-by: Andrew Jones <drjones@redhat.com>

