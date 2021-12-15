Received: by 2002:a05:6214:3f4:0:0:0:0 with SMTP id cf20csp550934qvb;
        Wed, 15 Dec 2021 08:54:11 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzdkD9NYFQyfebni0JftV3U7ezv9GNktuhOTYoR9kyAVQrRURV0V2I6BrokFmjexE5mVUTU
X-Received: by 2002:a05:6214:cce:: with SMTP id 14mr4465252qvx.58.1639587251704;
        Wed, 15 Dec 2021 08:54:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1639587251; cv=none;
        d=google.com; s=arc-20160816;
        b=jnlCrIMWxgqwdQo52ZInXT3g+LLQVM/jRrvoui5Yh/lLN1egad3BjA+HWXJ+ijhwDM
         8JWqvpAbHiuNulJPVgd7A4aDFlJez/yv8oFbg4Fu198t1tAV3XMrk2NCrau1RUzE7DQF
         F/2lMpaJmIXqp1Qyt2lBfOPKr86gDvRpLdBtDx2v3QxWHNIrLWT8wHPuqpYS9BNr8aeu
         VPBDEknz2cAsYg5CjI+fVQht/P3uKNLwbalVxWIhoiYRqbkiIxUsoY5ylZC7n1a49Ikf
         5/rdzZI+K2n4587aPcT1jCu9FOWXGYvVUKe0byQzgm7P9ompX4ky+ULHFl0Pv27kllEf
         BxXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=BLtJrCZcQqOeInQ2K4AukauYCruYIyRO70+OV26bvCo=;
        b=c4PVqOsCQWL61QyDNkUnW+husP6HgOy1/pcX8qWzqNpPanbOihxnNzgZgJqAuP1nvO
         J8YLH+eErxBc4/450JCJwd8EvqbxOUKHfQSUmslojlUTHALtiP2K+LXVdgBQimXHwklM
         y9f+XcYBckVbgbx/ZsWA7OwXtBUUcgpaomOlF1i/YqRsHd05asJLYPdZKFtyRfb3MyGv
         pPBGnK1kTzEK+fgOcR1YE83D6mQPkWPm+Uw/fkJNbQKf0/aqYj1tww3cgefc4e+Zl7vk
         9JakahiVT4GFMnPXRtLFjTErxXh8VUla5dL84wVDrZo0Z5ub6h2n5bHI1vqgc/k8WxYV
         cgmg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O0KH61Qy;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id u3si1115421qvm.269.2021.12.15.08.54.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 Dec 2021 08:54:11 -0800 (PST)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=O0KH61Qy;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1639587251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=BLtJrCZcQqOeInQ2K4AukauYCruYIyRO70+OV26bvCo=;
	b=O0KH61QyjluYe/Y0b7yGAq309pG1wts87Mu91E1KwREiKMygTmrmkvEwvgsETMvA61/8+O
	bKnan5DpnpiDsu5P6BEn0283NXGOsjIo3rw21d4GnK5xRHReitDvkibDE1x3kJjQUYRLTd
	szKwoX8g3nN+F30O3sZA9iyWiE/C5mY=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-589-3aiIQAB0OKyY-kJ_ARBncg-1; Wed, 15 Dec 2021 11:54:07 -0500
X-MC-Unique: 3aiIQAB0OKyY-kJ_ARBncg-1
Received: by mail-wm1-f71.google.com with SMTP id 69-20020a1c0148000000b0033214e5b021so12839234wmb.3
        for <alex.bennee@linaro.org>; Wed, 15 Dec 2021 08:54:07 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=BLtJrCZcQqOeInQ2K4AukauYCruYIyRO70+OV26bvCo=;
        b=gQz+LJLlKnuy0KkxgzP+kGSi/O00e92PqAjyvWfRzHq7o1HvW1YRRXoKgGl1PaVPRP
         ssgI2didjTjZQl2TeXyIB0vqhjji3Cc6L6hCjKGzgIj75BZPynZ6WsIoZIwsX16nfzrr
         Wh+Y/aehnPwYo5HVc3ZMVv7+xMUUc1OmeEbKEwJ5KdSugDI92IFA/EWeTU1kKETYNCMW
         DG6O7bHHjPjXNPNn8bp6MQKw+bEHQHtqEazhr+OFgwq4q3geZO8nTjpnpLNy3wmgYKHA
         josRqDD8nJp8UL+jkqkg0ANLAI7wZ5tgK31kGP/9TZaX4/rzq37booIq1P2cJmJa7gud
         hQRQ==
X-Gm-Message-State: AOAM530IL7co0yP1bsKpnbDjjyqSgQ3g/JCelg2MEncBzkKSqVYPqEE+
	R5Uvz4206PvBk7Fg84L6kVl50xMgpVZjwnyK73Tz8Fshtkh0gaFNXouaSoWpEeqTZdL5J8SB867
	xY8sXvhMTv3HSvV4k
X-Received: by 2002:a05:6000:2ac:: with SMTP id l12mr2922494wry.72.1639587246640;
        Wed, 15 Dec 2021 08:54:06 -0800 (PST)
X-Received: by 2002:a05:6000:2ac:: with SMTP id l12mr2922471wry.72.1639587246493;
        Wed, 15 Dec 2021 08:54:06 -0800 (PST)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (174.red-83-50-185.dynamicip.rima-tde.net. [83.50.185.174])
        by smtp.gmail.com with ESMTPSA id v8sm2393630wrd.84.2021.12.15.08.54.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 15 Dec 2021 08:54:05 -0800 (PST)
Message-ID: <697323f3-0d82-2c7f-3c54-a0f38d93615f@redhat.com>
Date: Wed, 15 Dec 2021 17:54:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.0
Subject: Re: [PATCH v3 00/28] glib: Replace g_memdup() by g_memdup2()
To: qemu-devel@nongnu.org, QEMU Trivial <qemu-trivial@nongnu.org>
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>,
 Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 David Hildenbrand <david@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Eric Blake <eblake@redhat.com>, John Snow <jsnow@redhat.com>,
 Gerd Hoffmann <kraxel@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Hanna Reitz <hreitz@redhat.com>,
 qemu-block@nongnu.org, qemu-ppc@nongnu.org,
 "Daniel P . Berrange" <berrange@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
In-Reply-To: <20210903174510.751630-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: c2TnTd+fqhof

Hi Laurent,

On 9/3/21 19:44, Philippe Mathieu-Daudé wrote:

> This series provides the safely equivalent g_memdup2() wrapper,
> and replace all g_memdup() calls by it.

> Philippe Mathieu-Daudé (28):
>   hw/hyperv/vmbus: Remove unused vmbus_load/save_req()
>   glib-compat: Introduce g_memdup2() wrapper
>   qapi: Replace g_memdup() by g_memdup2()
>   accel/tcg: Replace g_memdup() by g_memdup2()
>   block/qcow2-bitmap: Replace g_memdup() by g_memdup2()
>   softmmu: Replace g_memdup() by g_memdup2()
>   hw/9pfs: Replace g_memdup() by g_memdup2()
>   hw/acpi: Avoid truncating acpi_data_len() to 32-bit
>   hw/acpi: Replace g_memdup() by g_memdup2()
>   hw/core/machine: Replace g_memdup() by g_memdup2()
>   hw/hppa/machine: Replace g_memdup() by g_memdup2()
>   hw/i386/multiboot: Replace g_memdup() by g_memdup2()
>   hw/net/eepro100: Replace g_memdup() by g_memdup2()
>   hw/nvram/fw_cfg: Replace g_memdup() by g_memdup2()
>   hw/scsi/mptsas: Replace g_memdup() by g_memdup2()
>   hw/ppc/spapr_pci: Replace g_memdup() by g_memdup2()
>   hw/rdma: Replace g_memdup() by g_memdup2()
>   hw/vfio/pci: Replace g_memdup() by g_memdup2()
>   hw/virtio: Replace g_memdup() by g_memdup2()
>   net/colo: Replace g_memdup() by g_memdup2()
>   ui/clipboard: Replace g_memdup() by g_memdup2()
>   linux-user: Replace g_memdup() by g_memdup2()
>   tests/unit: Replace g_memdup() by g_memdup2()
>   tests/qtest: Replace g_memdup() by g_memdup2()
>   target/arm: Replace g_memdup() by g_memdup2()
>   target/ppc: Replace g_memdup() by g_memdup2()
>   contrib: Replace g_memdup() by g_memdup2()
>   checkpatch: Do not allow deprecated g_memdup(
Is it possible to take the reviewed patches 2, 24 and 28
via qemu-trivial, so the rest can be merged slowly by
each submaintainer?
