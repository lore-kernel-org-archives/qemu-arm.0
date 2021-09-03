Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1646856lfb;
        Fri, 3 Sep 2021 13:37:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzHATeXS9gL2dp3CLCcJCvjbfqta/kP2qSlIP/8JlwfPshqwC46o24frG3okL5CCa6kELff
X-Received: by 2002:a17:906:1f81:: with SMTP id t1mr755139ejr.510.1630701462332;
        Fri, 03 Sep 2021 13:37:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630701462; cv=none;
        d=google.com; s=arc-20160816;
        b=U9ecxWv75vdvMNpwQfJOS4SO/0xmnX6wmlqCA1SUnK+NGc105Z9d/jxjbX8CMmovv9
         3s43+/QvL9W9/HPz2dyqmMtEGatPcr19ONfqXerBKcOAsVchXAQ1uPXlg31b52uxTSz1
         rbdcbYsgLyybeu7p+/sIKsB0/DJ9n7Jaq3izb7+BSwVMKUqJC97LhHOXj0e3fLZhv/wH
         k6h0qsZQNjlY/HHA9Z02r0j0RDPuo+ADF63gGGDA60r/j7Wkz61a1i9CyBg4WadlVCSI
         juLUKEi1hS/BX3dEbhSAVvrbwuL3DLY/8PDZ8vpPCchXbDr0/dmjs04n4vtqeJO9tsh3
         hPlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:user-agent
         :in-reply-to:mime-version:references:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=aw9m4qqc4U8mAFeDmeoRz2rwOvkqdWRlOxWeniWugMk=;
        b=laSfwBg4+Czcrseul7V2UilJSvOm/68g811QNrNNj816GAk7cmG5WZhrQj9nM7rv/5
         oTUPgMDuJyuiHeAxD32pNUZ8aOeqtHMjgARRumzRfsS2uoPIuN0fTYJ3KdqObS9Cjc5b
         kmd/pcN/EaZGbNsziKrvyzCxYdVVLDZXHLbAs8M6b1fKiICTd1sJGjP5jNbh9cD2HOmb
         hgkOBz//S1apEi6CDUX9GY4PznpUNd8kYzgWZoCKcVLY02Ae6o3/xOSqsW1VIWyn0Fyk
         wx9XYktAf+zGiY/gUa5ULVxp8UgiY0KapDs4dQPZjyWvVPnLMXvFRPvlRQRQY38Pq5La
         ri4w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jS4bG9r6;
       spf=pass (google.com: domain of eblake@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <eblake@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id g16si512607edb.150.2021.09.03.13.37.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 03 Sep 2021 13:37:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of eblake@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=jS4bG9r6;
       spf=pass (google.com: domain of eblake@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=eblake@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1630701461;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aw9m4qqc4U8mAFeDmeoRz2rwOvkqdWRlOxWeniWugMk=;
	b=jS4bG9r63XtMfcSRfYbOlZQwWwJ7UOYcfBG9hc6dFouIfMMSxPF68d1tmTU3dU0UkpIRtJ
	OQ5vQSHkXqFfk2ftmqu79oMxQzfzafOs5xQD5QyHoqDR0C36D+ufD41CAxdk68Ls3NCqtg
	AKRa7c7AmN29xMG+SPFqht1NFVyz1J4=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-60-PeOdw3ZbOXm9yRFhAFMvAw-1; Fri, 03 Sep 2021 16:37:37 -0400
X-MC-Unique: PeOdw3ZbOXm9yRFhAFMvAw-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 4EDBF84A5E1;
	Fri,  3 Sep 2021 20:37:35 +0000 (UTC)
Received: from redhat.com (ovpn-113-81.phx2.redhat.com [10.3.113.81])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 1380F77F35;
	Fri,  3 Sep 2021 20:37:21 +0000 (UTC)
Date: Fri, 3 Sep 2021 15:37:19 -0500
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
Subject: Re: [PATCH v3 02/28] glib-compat: Introduce g_memdup2() wrapper
Message-ID: <20210903203719.gsfqid3levceqjs6@redhat.com>
References: <20210903174510.751630-1-philmd@redhat.com>
 <20210903174510.751630-3-philmd@redhat.com>
MIME-Version: 1.0
In-Reply-To: <20210903174510.751630-3-philmd@redhat.com>
User-Agent: NeoMutt/20210205-739-420e15
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eblake@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: HdhhqtguZ133

On Fri, Sep 03, 2021 at 07:44:44PM +0200, Philippe Mathieu-Daudé wrote:
> When experimenting raising GLIB_VERSION_MIN_REQUIRED to 2.68
> (Fedora 34 provides GLib 2.68.1) we get:
> 
>   hw/virtio/virtio-crypto.c:245:24: error: 'g_memdup' is deprecated: Use 'g_memdup2' instead [-Werror,-Wdeprecated-declarations]
>   ...
> 
> g_memdup() has been updated by g_memdup2() to fix eventual security
> issues (size argument is 32-bit and could be truncated / wrapping).
> GLib recommends to copy their static inline version of g_memdup2():
> https://discourse.gnome.org/t/port-your-module-from-g-memdup-to-g-memdup2-now/5538
> 
> Our glib-compat.h provides a comment explaining how to deal with
> these deprecated declarations (see commit e71e8cc0355
> "glib: enforce the minimum required version and warn about old APIs").
> 
> Following this comment suggestion, implement the g_memdup2_qemu()
> wrapper to g_memdup2(), and use the safer equivalent inlined when
> we are using pre-2.68 GLib.
> 
> Reported-by: Eric Blake <eblake@redhat.com>
> Signed-off-by: Philippe Mathieu-Daudé <philmd@redhat.com>
> ---
>  include/glib-compat.h | 37 +++++++++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)

Reviewed-by: Eric Blake <eblake@redhat.com>

-- 
Eric Blake, Principal Software Engineer
Red Hat, Inc.           +1-919-301-3266
Virtualization:  qemu.org | libvirt.org
