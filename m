Received: by 2002:a17:505:bc8:b0:1be9:327d:8ee3 with SMTP id pe8csp418587njb;
        Tue, 13 May 2025 03:31:29 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXx45ohw4lrHpKaFgICfRNLBRCfHAKz24LmqCYK60FmxCluaZd0DwgjS+DSyJDQYELX3zQlJHsvC7ctCw==@linaro.org
X-Google-Smtp-Source: AGHT+IHEZzmVg353XVaWnMBkOrjOsJxHacLjfB6NB6ZfLrWdOm+v7fK0S09b2J+kNVjVuIKSDNnA
X-Received: by 2002:a05:620a:199f:b0:7ca:f46c:c325 with SMTP id af79cd13be357-7cd0114ef4cmr2243298585a.46.1747132288918;
        Tue, 13 May 2025 03:31:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747132288; cv=none;
        d=google.com; s=arc-20240605;
        b=Ep3ivYGsgJ3y2cEVzS5ff2zWJL73KEmzaagvIjI7K2XGTdM4Abt8zimSxldWRqNOsS
         AGFTDR6rcZcRkNNbit65uW0xEvM/9GVZ1+VQuwOWEB+qFhm2ztzzfiWZo52bAv8iHke6
         Wsl8qu1sVRY49RhSd1HGfycVhvu93EH9/KxTbKu+lM7M8I7HrRSpwYCnEHjAuQ+vVFyf
         Daord83IqA4O3bO+I0swnaSNGnUXLxedeWsdOdYniogSplSV7NrR+UI3PVti5dTPIwgn
         ll+9WzchP8C5LW0fTH6n7lZVkM5kCR+RuEzVjMTFieu1jfjenMOyGbLZnFjA1BbygxhI
         sAJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=K8iuDoVUKmba4R8nSTe6+wX/Mku81yEFf9qrmeNuvU0=;
        fh=RtSaLMIS815nO8YGZeFUTmq49cUVgz8hUhGeB/XAQKA=;
        b=GwDc953GA+hm1jT/KhJtKHVmzuId5L5AW9AoLlNRSBeASfQNftFjBypuOsOdF/jMYm
         ijyunm6FtoU2GtN0G4iNDe1Z670STqCL6639JY3kyXV+NRF5TmjbIPBLK0iHDebpFApD
         q87UIMtcbACaW6jspKK/KJRNSrdRNTIwJvebZLemLRNTWgi2XXZiSOMrKZ/ZPnkk6j/7
         0pJmfD+CUZ7uV5QRgHzR0/CGvs8VLEwUebPLSIUUolsuIgApX8GWsn+UNxgIl1/sS47Y
         p3Ewy7ItaLjmdgPX3BBU8PWFKYv+U31KyiEag/2YOO0gi05ZWkQOvIvcwwGh00nzLsd9
         x2kg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f0XfbZ8U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7cd00fed76fsi1080387185a.491.2025.05.13.03.31.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 13 May 2025 03:31:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=f0XfbZ8U;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uEmv0-0006uA-24; Tue, 13 May 2025 06:31:26 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEmuL-0006ka-TC
 for qemu-arm@nongnu.org; Tue, 13 May 2025 06:30:52 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1uEmuC-0001qV-6t
 for qemu-arm@nongnu.org; Tue, 13 May 2025 06:30:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1747132221;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=K8iuDoVUKmba4R8nSTe6+wX/Mku81yEFf9qrmeNuvU0=;
 b=f0XfbZ8UQhVd8x2EM+2PnkRdD6hnkH1Xzfa8lAH6svgTuAfRXgshcdDEy1ZQMHofpkfTUm
 cBTVTjQMrsqHbzdhyKM3+t8aWAQAdA+9xN0Bc7URHv4rEihIS0kbVppOZJl8S4zcjFU7rT
 ZycVLKsYe7vuB21lgBs1gJXA2qcQzvE=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-382-mo0If1QqPuyr1k5o-YF5QA-1; Tue, 13 May 2025 06:30:18 -0400
X-MC-Unique: mo0If1QqPuyr1k5o-YF5QA-1
X-Mimecast-MFC-AGG-ID: mo0If1QqPuyr1k5o-YF5QA_1747132217
Received: by mail-wm1-f71.google.com with SMTP id
 5b1f17b1804b1-43efa869b19so37229955e9.2
 for <qemu-arm@nongnu.org>; Tue, 13 May 2025 03:30:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747132217; x=1747737017;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K8iuDoVUKmba4R8nSTe6+wX/Mku81yEFf9qrmeNuvU0=;
 b=DufMtB+S0EJWyLgFYrSE744o/nLMhc8bM6vVGRg9GLx4Q0TZKrfBcVmoyV47ll+9SV
 BUGgm+ZP/aY9Bz2K+xXq+gju3hbykt5ootC9ITHJz2RqRFnIU8oMZtRhkWW/XdbHPBKR
 y8DWl0C2ij9J5ST5E5hFWdbDcsg4Lq3UT2KhkYuL5dQqAX2Vw4XvtuMjfWzE3z3kjUXe
 fm8YzRGVSYcU6+1k9IvfOi9VrykuL2AccV85ZnNtG5D390Ihsv6rsw66OLc7YCchNufu
 YoOeEyG0Af6b+OfL7tIri6z8nksddx3fj3Ace5Ws4AiXfRk9e1byo9sFjNTQg0pexzX4
 zYDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsAIVHgiYGbk5kVzK5uakk1X9LYeYBNpSFSDVB06ebYhgEE89El3r/mSDZlnxUI/WtYU3GeAIDrw==@nongnu.org
X-Gm-Message-State: AOJu0Yx/yqSQdYH4AHT1GcXRYlQVFk8cBcITkE+JbdDgwNwtfYsnApC3
 0i2bsXgowa509sY24jE1HgJ+HCMlDcWSwhU2uYU3MD2Xxe+1ndUewr3vqi6qm97UliV7GnqqdsZ
 E9+2eszIndfvqVToajcj8VIW3PpbrzcEHgA6DAqA0+iFuPkgSLg==
X-Gm-Gg: ASbGncstfc9vPpgT3TuVL2AV44A1OZeAmZQhoyrL0zcKr3/dDjeaCpx4SHJSp1q50Kh
 T6c+3Fy9vrCAemD+T/rlVDoyvJkDLaWP5tQ3biEb5vWm6be49gVW8Zo11gZL65sCF8Vl43ia/tj
 mis7hBd8/zx7bPSqdydmbUrrfuPJqjqqf+uD1aOy53xR3NwZhcEEpYHZrobEx07sSpRgeXYSZGT
 /inSKgobJ8TRrmULElxkCzPLvtGNApp2R7uTNIxSuMH2xWT5DOsRUDvJzQ10cv1zg5UkHcpEk8v
 5YBULVMVv/zpKBaP6FIKD/93lF0KBUJ5
X-Received: by 2002:a05:600c:3e8c:b0:43c:f969:13c0 with SMTP id
 5b1f17b1804b1-442d6ddec16mr137058865e9.29.1747132217491; 
 Tue, 13 May 2025 03:30:17 -0700 (PDT)
X-Received: by 2002:a05:600c:3e8c:b0:43c:f969:13c0 with SMTP id
 5b1f17b1804b1-442d6ddec16mr137058455e9.29.1747132217110; 
 Tue, 13 May 2025 03:30:17 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com ([85.93.96.130])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-442cd3aecb0sm208576865e9.28.2025.05.13.03.30.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 May 2025 03:30:16 -0700 (PDT)
Date: Tue, 13 May 2025 12:30:14 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>,
 kvm@vger.kernel.org, Sergio Lopez <slp@redhat.com>, Gerd Hoffmann
 <kraxel@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, Laurent
 Vivier <lvivier@redhat.com>, Jiaxun Yang <jiaxun.yang@flygoat.com>, Yi Liu
 <yi.l.liu@intel.com>, "Michael S. Tsirkin" <mst@redhat.com>, Eduardo
 Habkost <eduardo@habkost.net>, Marcel Apfelbaum
 <marcel.apfelbaum@gmail.com>, Alistair Francis <alistair.francis@wdc.com>,
 Daniel Henrique Barboza <dbarboza@ventanamicro.com>, Marcelo Tosatti
 <mtosatti@redhat.com>, qemu-riscv@nongnu.org, Weiwei Li
 <liwei1518@gmail.com>, Amit Shah <amit@kernel.org>, Zhao Liu
 <zhao1.liu@intel.com>, Yanan Wang <wangyanan55@huawei.com>, Helge Deller
 <deller@gmx.de>, Palmer Dabbelt <palmer@dabbelt.com>, Ani Sinha
 <anisinha@redhat.com>, Fabiano Rosas <farosas@suse.de>, Paolo Bonzini
 <pbonzini@redhat.com>, Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 =?UTF-8?B?Q2zDqW1lbnQ=?= Mathieu--Drif <clement.mathieu--drif@eviden.com>,
 qemu-arm@nongnu.org, =?UTF-8?B?TWFyYy1BbmRyw6k=?= Lureau
 <marcandre.lureau@redhat.com>, Huacai Chen <chenhuacai@kernel.org>, Jason
 Wang <jasowang@redhat.com>, Mark Cave-Ayland <mark.caveayland@nutanix.com>
Subject: Re: [PATCH v4 25/27] hw/virtio/virtio-pci: Remove
 VirtIOPCIProxy::ignore_backend_features field
Message-ID: <20250513123014.763837de@imammedo.users.ipa.redhat.com>
In-Reply-To: <20250508133550.81391-26-philmd@linaro.org>
References: <20250508133550.81391-1-philmd@linaro.org>
 <20250508133550.81391-26-philmd@linaro.org>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.43; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3vT6aruiacPxWfDhVQiM1T8uj53B79WRxK64RitcIbI_1747132217
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -35
X-Spam_score: -3.6
X-Spam_bar: ---
X-Spam_report: (-3.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1.551,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: ZQoIUOU7ichW

On Thu,  8 May 2025 15:35:48 +0200
Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org> wrote:

> The VirtIOPCIProxy::ignore_backend_features boolean was only set
> in the hw_compat_2_7[] array, via the 'x-ignore-backend-features=3Don'
> property. We removed all machines using that array, lets remove
> that property, simplify by only using the default version.
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Mark Cave-Ayland <mark.caveayland@nutanix.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
>  include/hw/virtio/virtio-pci.h | 1 -
>  hw/virtio/virtio-pci.c         | 5 +----
>  2 files changed, 1 insertion(+), 5 deletions(-)
>=20
> diff --git a/include/hw/virtio/virtio-pci.h b/include/hw/virtio/virtio-pc=
i.h
> index f962c9116c1..9838e8650a6 100644
> --- a/include/hw/virtio/virtio-pci.h
> +++ b/include/hw/virtio/virtio-pci.h
> @@ -149,7 +149,6 @@ struct VirtIOPCIProxy {
>      int config_cap;
>      uint32_t flags;
>      bool disable_modern;
> -    bool ignore_backend_features;
>      OnOffAuto disable_legacy;
>      /* Transitional device id */
>      uint16_t trans_devid;
> diff --git a/hw/virtio/virtio-pci.c b/hw/virtio/virtio-pci.c
> index 8d68e56641a..7c965771907 100644
> --- a/hw/virtio/virtio-pci.c
> +++ b/hw/virtio/virtio-pci.c
> @@ -1965,8 +1965,7 @@ static void virtio_pci_device_plugged(DeviceState *=
d, Error **errp)
>       * Virtio capabilities present without
>       * VIRTIO_F_VERSION_1 confuses guests
>       */
> -    if (!proxy->ignore_backend_features &&
> -            !virtio_has_feature(vdev->host_features, VIRTIO_F_VERSION_1)=
) {
> +    if (!virtio_has_feature(vdev->host_features, VIRTIO_F_VERSION_1)) {
>          virtio_pci_disable_modern(proxy);
> =20
>          if (!legacy) {
> @@ -2351,8 +2350,6 @@ static const Property virtio_pci_properties[] =3D {
>                      VIRTIO_PCI_FLAG_MODERN_PIO_NOTIFY_BIT, false),
>      DEFINE_PROP_BIT("page-per-vq", VirtIOPCIProxy, flags,
>                      VIRTIO_PCI_FLAG_PAGE_PER_VQ_BIT, false),
> -    DEFINE_PROP_BOOL("x-ignore-backend-features", VirtIOPCIProxy,
> -                     ignore_backend_features, false),
>      DEFINE_PROP_BIT("ats", VirtIOPCIProxy, flags,
>                      VIRTIO_PCI_FLAG_ATS_BIT, false),
>      DEFINE_PROP_BIT("x-ats-page-aligned", VirtIOPCIProxy, flags,

