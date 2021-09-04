Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1949242lfb;
        Fri, 3 Sep 2021 22:48:17 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwt/uN0+FMtO6pSm8AC5KO8USmZ9Ty0ct97cwTen/7TfR+a4Vq+IYmAPF/AuiB0csl93mn8
X-Received: by 2002:a17:906:b08e:: with SMTP id x14mr2705463ejy.40.1630734497753;
        Fri, 03 Sep 2021 22:48:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630734497; cv=none;
        d=google.com; s=arc-20160816;
        b=slGW7hNni4zQJ3ZygdlgJp4399HhPp3cHl3VOxzIa2oRIapLlabX0uQHaZ0xSs3qsV
         S9+YwVLZYNS2wG+F6j6OyxfCMakMSf+vp74vkkv55RDw4CXNhIUaRzC+bvSvHqJwHWPU
         4Vj0Y3FqXYQ/MdMP01ix1usTGteceC+/bFUysg/PILHCSbYZDPy4NtkC/ahtsxj6xNiU
         DVT+956bth7G5BLBiYUzl2/k/xwGhcNgm9ofcmLJGMX0k3VHOu0vApLUp7Y2RpRXniMZ
         xfFL0QNVy27FbGKwnW4AcKw74Cszg8nbuN52zcMwB+KC21vmRC2XnkyMBQi5lycuawBV
         IZ7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=8hRp8M0ry3uyMaz+vHwTVKodJnJrMSesJkGEZ8k0+/A=;
        b=XUQWcBz+vYlV8b606TGrue7B5rhoDe/tzg3Y4p/ZaVGC8VDHq6pAVZkBbNnUUvGRGG
         fQaTxUA/NEw1dPLyZe5c//yO6bypCfek9/lsbiF8ZU8gby8ns92jXq3h4NSU1g8uIThA
         vmE+nZV4jr/50Le+6TIQ+xwDoyJVq59KLww/s1WfYvyRY64FcYXpWhFSP02vUSafd7LG
         25XDWtz6Kgzfr1jfk2LmLJDud8LARMXCiBsQl5DeTAhvKvGVmu9DcSyjUTji89WtHybw
         yRCgwWYUYy4DxDqVfdHOFmhHqs1+HLvgcj80YW2tavkeitJj02Gh+2VthQs39tJHhB92
         LouQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QaxhxMfn;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id i6si1523935ejo.484.2021.09.03.22.48.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 22:48:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=QaxhxMfn;
       spf=pass (google.com: domain of thuth@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630734496;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8hRp8M0ry3uyMaz+vHwTVKodJnJrMSesJkGEZ8k0+/A=;
	b=QaxhxMfn5KQIEiiNLE4VXLh5jSBWzeO+nYcQI1D7ry19H0kiocxPo7Xnd4wcxlsKOUHQKm
	CGVSOaoGEpgxHezqpAfzulYTCMtj+hdeMY2+i/PK0KOXUdAK9+NQVvqKaaTD13awKGAai3
	m4HYUKx3pAOEcv9whsRkHt3UEnN7IBc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-34-lwz3GQLrNZ2E_KG2Y3UwXg-1; Sat, 04 Sep 2021 01:48:13 -0400
X-MC-Unique: lwz3GQLrNZ2E_KG2Y3UwXg-1
Received: by mail-wm1-f71.google.com with SMTP id b126-20020a1c8084000000b002f152a868a2so476832wmd.1
        for <alex.bennee@linaro.org>; Fri, 03 Sep 2021 22:48:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8hRp8M0ry3uyMaz+vHwTVKodJnJrMSesJkGEZ8k0+/A=;
        b=dR2EoAjC1xUax9MdJ0y7Cj3dITTPuTPDwnN1rUrTg+Ecuw+tI/qdLh9OFENYp6bVRs
         Z4NCBdAAB1t0Kor1ERM4Eb0o9IimqPUiF9ABt7Gd5g+Qnk6rYibwoOoxmdHFtjHIDj1c
         hOkr6w9NiZ7TTFYoXvoDQj2noysxXGIPz2mQWL9C/mbVoxxzyY6OOSFnPUif1jN6k1YD
         eDuHmR4RArY22CD7Q2DUecYFjdpcakuPeob+ji32DO+bRMExnw86d/xergssd36ANWz9
         qM1ZJAUAuEURGd7sG14TILAZuJknpWjpDjAQs2XYdfZ81GA45VeEpCuLkJLUrTQk8AEu
         e9HA==
X-Gm-Message-State: AOAM5334DVRWc76kiCwE+dFe4n0qY7iwDr/RAmZiCEXPxMF0FyI4O2//
	o8kVbvRD75BjKToS39UnSoL7584Ri0SU29n6ztCahGjpWBgFCVC0A4f3sf0Bze+eTpsB7XfDa0a
	CQ0DVy2XqS7RmcMfo
X-Received: by 2002:a1c:98d8:: with SMTP id a207mr1734180wme.16.1630734492025;
        Fri, 03 Sep 2021 22:48:12 -0700 (PDT)
X-Received: by 2002:a1c:98d8:: with SMTP id a207mr1734170wme.16.1630734491803;
        Fri, 03 Sep 2021 22:48:11 -0700 (PDT)
Return-Path: <thuth@redhat.com>
Received: from thuth.remote.csb (pd9575809.dip0.t-ipconnect.de. [217.87.88.9])
        by smtp.gmail.com with ESMTPSA id h16sm1181315wre.52.2021.09.03.22.48.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Sep 2021 22:48:11 -0700 (PDT)
Subject: Re: [PATCH v3 24/28] tests/qtest: Replace g_memdup() by g_memdup2()
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
 qemu-devel@nongnu.org
Cc: Laurent Vivier <lvivier@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Peter Maydell <peter.maydell@linaro.org>,
 qemu-arm@nongnu.org, David Gibson <david@gibson.dropbear.id.au>,
 Kevin Wolf <kwolf@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Markus Armbruster <armbru@redhat.com>, Jason Wang <jasowang@redhat.com>,
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
 <20210903174510.751630-25-philmd@redhat.com>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <98c0ca0f-137a-7392-ebda-a8d1b7743892@redhat.com>
Date: Sat, 4 Sep 2021 07:48:09 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.12.0
MIME-Version: 1.0
In-Reply-To: <20210903174510.751630-25-philmd@redhat.com>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-TUID: egy8qhf12NYf

On 03/09/2021 19.45, Philippe Mathieu-Daudé wrote:
> Per https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
> 
>    The old API took the size of the memory to duplicate as a guint,
>    whereas most memory functions take memory sizes as a gsize. This
>    made it easy to accidentally pass a gsize to g_memdup(). For large
>    values, that would lead to a silent truncation of the size from 64
>    to 32 bits, and result in a heap area being returned which is
>    significantly smaller than what the caller expects. This can likely
>    be exploited in various modules to cause a heap buffer overflow.
> 
> Replace g_memdup() by the safer g_memdup2() wrapper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>   tests/qtest/libqos/ahci.c   | 6 +++---
>   tests/qtest/libqos/qgraph.c | 2 +-
>   2 files changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/qtest/libqos/ahci.c b/tests/qtest/libqos/ahci.c
> index fba3e7a954e..eaa2096512e 100644
> --- a/tests/qtest/libqos/ahci.c
> +++ b/tests/qtest/libqos/ahci.c
> @@ -639,8 +639,8 @@ void ahci_exec(AHCIQState *ahci, uint8_t port,
>       AHCIOpts *opts;
>       uint64_t buffer_in;
>   
> -    opts = g_memdup((opts_in == NULL ? &default_opts : opts_in),
> -                    sizeof(AHCIOpts));
> +    opts = g_memdup2((opts_in == NULL ? &default_opts : opts_in),
> +                     sizeof(AHCIOpts));
>   
>       buffer_in = opts->buffer;
>   
> @@ -860,7 +860,7 @@ AHCICommand *ahci_command_create(uint8_t command_name)
>       g_assert(!props->ncq || props->lba48);
>   
>       /* Defaults and book-keeping */
> -    cmd->props = g_memdup(props, sizeof(AHCICommandProp));
> +    cmd->props = g_memdup2(props, sizeof(AHCICommandProp));
>       cmd->name = command_name;
>       cmd->xbytes = props->size;
>       cmd->prd_size = 4096;
> diff --git a/tests/qtest/libqos/qgraph.c b/tests/qtest/libqos/qgraph.c
> index d1dc4919305..109ff04e1e8 100644
> --- a/tests/qtest/libqos/qgraph.c
> +++ b/tests/qtest/libqos/qgraph.c
> @@ -93,7 +93,7 @@ static void add_edge(const char *source, const char *dest,
>       edge->type = type;
>       edge->dest = g_strdup(dest);
>       edge->edge_name = g_strdup(opts->edge_name ?: dest);
> -    edge->arg = g_memdup(opts->arg, opts->size_arg);
> +    edge->arg = g_memdup2(opts->arg, opts->size_arg);
>   
>       edge->before_cmd_line =
>           opts->before_cmd_line ? g_strconcat(" ", opts->before_cmd_line, NULL) : NULL;
> 

Reviewed-by: Thomas Huth <thuth@redhat.com>
