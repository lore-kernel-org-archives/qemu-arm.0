Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1671909lfb;
        Fri, 3 Sep 2021 14:13:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwvGoH8kuHXWQGM5gmbW1nndM3rmFGFWj1HZ76/0/dzzFOTKMFbBq03YtIQQnpAlcNK4HU
X-Received: by 2002:aa7:cc88:: with SMTP id p8mr895855edt.361.1630703624416;
        Fri, 03 Sep 2021 14:13:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630703624; cv=none;
        d=google.com; s=arc-20160816;
        b=JVzldES1TznJSjHYNXMsFS0Msuzg1P95ZUVssrh5ODSkaNyMCS1fkd6bnGCDJrfM9O
         Gj7rXpPZwmuaM1JInnTGztiSQXlhQV6sUr7fOpe4mrhEbvoBJZ/eFIr1ESQRzYDYZ8nm
         mVIItVsH+Nup2YQ3fKnqMMd5hQLoa0Jr9v8loL3YBp3cHIJn1gnix2YdV0ZJSbrfM9Rg
         RZ8lg2wnChZb1Nl0E1ImgICsDLU8WGW5NAyMzHbzqNGUbNBirS0LGre9PayL9/W7P+Yf
         M6YrQykoHmigWt3djCgsG+AOvbCTgxaSEF6QrzwIrSE0LzS0QZ0eeTsPHLDzv3Gu5D59
         Nl5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=/d4C/QbXJZGAaDLSeN+s4CWc2iWOHgX8c+5IR1zVWgc=;
        b=Tjwb4T/VP3ID/l6AyXRkgTMT17/Gd3EGFXugTNdIkc6NWXuJv+en2ci/0LVyb4BUiy
         eIKIxwVj7msoMHGTs+FelV3hHY7to/2saTPBvh2LG5k5bgbL2dhgwF8N25PcRt3RusLd
         l0EAxr+6/iBYqkhy/OKQQE5n4DWz5nKmNGvF0MZKW0Ct2Tkmol7m40MoIDqes070DPH0
         6m2qUAy0I1hl6C1XYVb0BqyCCKCCYpS8yZe+wkQURz9gaha6TKfs0kDHOOKx98AoBN7F
         vOUNOxJdkkXZVB3lCjK2xQeJz2R7Ew7eFBZa+c49Cflt5lTnwgHfWD1F9MQagDdjvXQD
         t6Fg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a3RoiLk3;
       spf=pass (google.com: domain of eblake@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eblake@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [216.205.24.124])
        by mx.google.com with ESMTPS id dr5si337307ejc.33.2021.09.03.14.13.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 14:13:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of eblake@redhat.com designates 216.205.24.124 as permitted sender) client-ip=216.205.24.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=a3RoiLk3;
       spf=pass (google.com: domain of eblake@redhat.com designates 216.205.24.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630703623;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/d4C/QbXJZGAaDLSeN+s4CWc2iWOHgX8c+5IR1zVWgc=;
	b=a3RoiLk30gv9S53q0+vpyW9SMdE7evtDb95IXPPb4HbhFw9EFY6XoIiX1H4ANJsWho3mLB
	nl0yC9+QclTGk+wXVTBgVZZwtVPappEuQZUa7AER30zIPIQPof6GTzM2XUwF3egkxVftxb
	UPJPxv/0miGGhuSYIYe20zPsknMn/0I=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-249-EGpLn-XqPvuZx1yawfyxpA-1; Fri, 03 Sep 2021 17:13:42 -0400
X-MC-Unique: EGpLn-XqPvuZx1yawfyxpA-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.phx2.redhat.com [10.5.11.14])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A71B4100945A;
	Fri,  3 Sep 2021 21:13:40 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id EB4E55D9F0;
	Fri,  3 Sep 2021 21:13:28 +0000 (UTC)
Date: Fri, 3 Sep 2021 16:13:22 -0500
From: Eric Blake <eblake@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@redhat.com>
Cc: qemu-devel@nongnu.org, Laurent Vivier <lvivier@redhat.com>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org,
	David Gibson <david@gibson.dropbear.id.au>,
	Kevin Wolf <kwolf@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	Markus Armbruster <armbru@redhat.com>,
	Thomas Huth <thuth@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Christian Schoenebeck <qemu_oss@crudebyte.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vladimir Sementsov-Ogievskiy <vsementsov@virtuozzo.com>,
	David Hildenbrand <david@redhat.com>,
	Eduardo Habkost <ehabkost@redhat.com>, John Snow <jsnow@redhat.com>,
	Gerd Hoffmann <kraxel@redhat.com>,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Hanna Reitz <hreitz@redhat.com>, qemu-block@nongnu.org,
	qemu-ppc@nongnu.org, "Daniel P . Berrange" <berrange@redhat.com>
Subject: Re: [PATCH v3 05/28] block/qcow2-bitmap: Replace g_memdup() by
 g_memdup2()
Message-ID: <20210903211322.n5isnkxin6jlkxrf@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-6-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210903174510.751630-6-philmd@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.14
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: tUgVyh8vM0no

On Fri, Sep 03, 2021 at 07:44:47PM +0200, Philippe Mathieu-Daudé wrote:
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
> Replace g_memdup() by the safer g_memdup2() wrapper.
> 
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  block/qcow2-bitmap.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/block/qcow2-bitmap.c b/block/qcow2-bitmap.c
> index 8fb47315515..218a0dc712a 100644
> --- a/block/qcow2-bitmap.c
> +++ b/block/qcow2-bitmap.c
> @@ -1599,7 +1599,7 @@ bool qcow2_store_persistent_dirty_bitmaps(BlockDriverState *bs,
>                             name);
>                  goto fail;
>              }
> -            tb = g_memdup(&bm->table, sizeof(bm->table));
> +            tb = g_memdup2(&bm->table, sizeof(bm->table));

Trivially safe.  It might be worth a comment in the various commit
messages for which patches are trivially safe (because the argument
was directly from sizeof), and which would require a larger audit of
callers to see if we had any (unlikely) bug (such as patch 3/28).

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
