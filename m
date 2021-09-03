Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1513630lfb;
        Fri, 3 Sep 2021 10:43:24 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycJPp1R2PphOL6GAi8ehgCFS/Gtlw1jwRttYpZbtGOpz2c26abvwWTFHPRrXWEtX5m6RoG
X-Received: by 2002:a17:906:e88:: with SMTP id p8mr13816ejf.103.1630691004046;
        Fri, 03 Sep 2021 10:43:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630691004; cv=none;
        d=google.com; s=arc-20160816;
        b=I0yxQ2cpzgasXMMdLUhy805X6rg1CbmpEwBxrfAuDmtnxB/uMXwJzYe9obRYmdyGgQ
         3cGCp7BrIpYT1C0k5wLu5h/Z9m8MKYX/EFEFZsQYCxp9G+OYmOADhDHC9Jy9NDpJkYbI
         QSi+3hINFlRZlQSSoan9I4h9gd2FT0q2/1H0xhwQJ8SqrfwKDJlgvDpfCU439QMkeDst
         Q387c9Z+1UcNlRHUkPRbeMNIdjmQz/8gMzIuqxCKrZvPhasirMwedZ1tSfNDRFQ31CIk
         m+xh0ePfZDYImV6UUOjzymfKFwh4myZia+QqEAoXPimP1xO+gCYYdm1aGxjhtKe6CCcJ
         Jzbw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=HToSchqv8B+TwDh08Rs1kk9V3QAdaTIG66Xf3RzZbPg=;
        b=NpqZhPMOR3YikYzPR+DArNr3SBryNZzg5OYUxK6z5dsrSqB4/nMm45flxDQU57QTeU
         jNFDy/wx00AWhEH5YrWfUv9QUJkZXqX5+JSzXreS+OYyexJGixmweJesL7X+WpKfZ/tU
         KKeWaijOjgN3E4BWV5sy0vx+Yq7alC0BmLQIbFAD9xSQfVHwbi5aCIg2m0vyS9Miobqa
         w7K9da/Pi3hsrKphY6/yOtDMuN4QNLbuuDi0XqNBqKD9XuzP6S1VwLNNRvCDhtGC0tiG
         sGBpc3p6qRXwjMjnLcLssWD9Ln5Ue61I8N9SCEU3I6t77m+tA0o8vKJeKk+C8jM0/R9x
         2MUg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aQr5HA77;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id l17si5955616ejn.343.2021.09.03.10.43.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:43:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=aQr5HA77;
       spf=pass (google.com: domain of philmd@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630691003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=HToSchqv8B+TwDh08Rs1kk9V3QAdaTIG66Xf3RzZbPg=;
	b=aQr5HA77dRhrBsDbmihd6dZ0Oh995qliMdnuzaoNJDCz5wNiqieUf5ZC1HxqWV9YCa/9y+
	57Vnv2M36ZuKAGiyXe+Hf6hJ8QtJRVxK7hrUomlu91vQP6g/75Ja+tJAen3TOZ6J+mJeOT
	AyWkZh4THNCoMt2S9NBxzAeVrnfuJ4Y=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-4-4ceKZm2GN-KCh4FP-bb5PA-1; Fri, 03 Sep 2021 13:43:20 -0400
X-MC-Unique: 4ceKZm2GN-KCh4FP-bb5PA-1
Received: by mail-wm1-f69.google.com with SMTP id x125-20020a1c3183000000b002e73f079eefso68209wmx.0
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 10:43:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HToSchqv8B+TwDh08Rs1kk9V3QAdaTIG66Xf3RzZbPg=;
        b=F/SLFIzbAflgYIGNQiAq3rl8AKKPCJv2UFhwlkRaPR8YGosvSMxLYtWS03Li8L6+R0
         6leHQr3i/Wgo+sU4MXf0J49EacePhmSW1fkcQ5B2bjDwMZps6tOenPsGlpdMR+0X+IzL
         lyz2gt60B7/w0Ty/h1cFlISxoERBplFCIGp5qhulx/7RuNDBqz8Klp3UyNAfU2vus/mk
         UxgkIOb2P8MhnbBeBj7RMgtpG91HDPU6hssY2bF3CoPNP8XAg7SlCPEwBNdVwBgikcPx
         463Sg76AMCnlxW7RKSiyhzJejBHvo3nWjiitqhUeJmm3G7jICPjC+V5oCgdDcwuV5qMY
         mMWg==
X-Gm-Message-State: AOAM531JPOoUQAm6mJO6/OXeJzsuWNJSbRBLIMznAnDeWUP98n90Oeun
	f+AGjXE5HnchF9u9zjf4wSL7HHC+1LchLANyjlOcXT5Rmr/z9LRn1JWbXN4ToI7OnozrvTuKpRY
	pr8n5BTi/f2cFhB8h
X-Received: by 2002:a5d:4591:: with SMTP id p17mr254877wrq.57.1630690998818;
        Fri, 03 Sep 2021 10:43:18 -0700 (PDT)
X-Received: by 2002:a5d:4591:: with SMTP id p17mr254856wrq.57.1630690998676;
        Fri, 03 Sep 2021 10:43:18 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.36] (21.red-83-52-55.dynamicip.rima-tde.net. [83.52.55.21])
        by smtp.gmail.com with ESMTPSA id m11sm5361480wrz.28.2021.09.03.10.43.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 10:43:18 -0700 (PDT)
Subject: Re: [PATCH v2 00/30] glib: Replace g_memdup() by g_memdup2()
To: qemu-devel@nongnu.org
Cc: Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
 Laurent Vivier <lvivier@redhat.com>, Kevin Wolf <kwolf@redhat.com>,
 qemu-ppc@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
 Hanna Reitz <hreitz@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, qemu-block@nongnu.org,
 Gerd Hoffmann <kraxel@redhat.com>, Eduardo Habkost <ehabkost@redhat.com>,
 Fam Zheng <fam@euphon.net>, Jason Wang <jasowang@redhat.com>,
 qemu-arm@nongnu.org, Christian Schoenebeck <qemu_oss@crudebyte.com>,
 Markus Armbruster <armbru@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, John Snow <jsnow@redhat.com>,
 Alex Williamson <alex.williamson@redhat.com>,
 =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 "Daniel P . Berrange" <berrange@redhat.com>,
 David Hildenbrand <david@redhat.com>, Eric Blake <eblake@redhat.com>,
 David Gibson <david@gibson.dropbear.id.au>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
References: <20210903174008.749126-1-philmd@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <b9c2ff43-e663-6204-f7a9-b8c81affc222@redhat.com>
Date: Fri, 3 Sep 2021 19:43:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210903174008.749126-1-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=philmd@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: /CUUQGzD37ZN

On 9/3/21 7:39 PM, Philippe Mathieu-Daudé wrote:
> Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
> 
>   The old API took the size of the memory to duplicate as a guint,
>   whereas most memory functions take memory sizes as a gsize. This
>   made it easy to accidentally pass a gsize to g_memdup(). For large
>   values, that would lead to a silent truncation of the size from 64
>   to 32 bits, and result in a heap area being returned which is
>   significantly smaller than what the caller expects. This can likely
>   be exploited in various modules to cause a heap buffer overflow.
> 
> g_memdup() as been deprecated in GLib 2.68. Since QEMU defines
> GLIB_VERSION_MAX_ALLOWED to GLIB_VERSION_2_56, the deprecation
> is not displayed (on GLib >= 2.68 such available on Fedora 34).
> However the function is still unsafe, so it is better to avoid
> its use.
> 
> This series provides the safely equivalent g_memdup2() wrapper,
> and replace all g_memdup() calls by it.
> 
> The previous link recommend to audit the call sites. Most of the
> calls use byte_size=sizeof(STRUCT), and no STRUCT appears to be
>> 4GiB.  Few calls use unsigned/size_t/uint16_t. Where code is
> doing multiplication, patches are sent as RFC. In particular:
>     hw/net/virtio-net.c
>     hw/virtio/virtio-crypto.c
> 
> Since v1:
> - Added missing g_memdup2 -> g_memdup2_qemu compat definition (danpb)
> - Do not call g_memdup2_qemu() but directly g_memdup2() (danpb)
> 
> Philippe Mathieu-Daudé (30):
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
>   RFC hw/virtio: Replace g_memdup() by g_memdup2()
>   net/colo: Replace g_memdup() by g_memdup2()
>   RFC ui/clipboard: Replace g_memdup() by g_memdup2()
>   RFC linux-user: Replace g_memdup() by g_memdup2()
>   tests/unit: Replace g_memdup() by g_memdup2()
>   tests/qtest: Replace g_memdup() by g_memdup2()
>   target/arm: Replace g_memdup() by g_memdup2()
>   target/ppc: Replace g_memdup() by g_memdup2()
>   contrib: Replace g_memdup() by g_memdup2()
>   checkpatch: Do not allow deprecated g_memdup()
>   f
>   test

I figured too late I was not placed in the correct commit,
please disregard this incomplete series...
