Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2954693njj;
        Tue, 6 May 2025 01:05:08 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWkjCo7ap53YZhhhrSBIEPbBV+M1sUFQWTPbafCFPnyuCo2LICH9F5YnuN+0Avrsj/505j/QZd0u3vZeQ==@linaro.org
X-Google-Smtp-Source: AGHT+IHqsZWRDnWvgwFPz5jQiVY97v8bF/k+6utzceeFLsoPSd5Dy2awAHJFV7eVhYjTUG8MUcFV
X-Received: by 2002:a05:6512:b88:b0:54a:fa58:a6f4 with SMTP id 2adb3069b0e04-54fb4a5dee2mr699459e87.24.1746518707804;
        Tue, 06 May 2025 01:05:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746518707; cv=none;
        d=google.com; s=arc-20240605;
        b=AIqvZIkdFIR4LLMq1pBEktDDR2EsAMmzTTJwyigDr5qJLhYP2vRw1Jv0QEhy1YBTuE
         RKO8D/8htbo7eWP5UNvly105vKugY1ipTWDib2yjigkh8djWWNc70hHjMAz9tD6jX6eI
         OBW4S79cPsamqjH2plU1IcR/oVLqGvk8cgtfSJ+H8mXtCMM/GeyZf5g+2CTjJumLV33y
         thUdIP1HW3U2CqLsbKOXfgd8eZxWDiI11GQFX08F1sCvA5+K1lwnqoG0MYnbw2DGMC44
         UmTBH3b3yfKOPK94gfCy2R9ybJ6zg48m8lgfExECYpVa94PCGwO70EdQRKSd7Szt28Bo
         634g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:reply-to:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=CKq13IDoWWLLZS+sTpTrQ44CVklgdW+U3vYc0T0Rv9c=;
        fh=fUKW7WV7TF0CgDuRsmrT+wPzdkRUHf/lZSZDeN6Bx14=;
        b=algbvVUhak68Kk3pT0RnG9EUdJOYHFqbP98CYm09PKyYGoKzRvxABScU6Ch0nZpbTl
         30JmfC6TZQHgcEL4bW8cg6WjuY4VbuSGXMViGdJcfCGDeZdr3omAiOczXSI1y8Y1SP5U
         g3SCZUSPrs+CIwxdVryuUBjecA6uzYDch/+8XcSb0CJEHlvJLdquw97o/7ZG2cFB8mbB
         o+kO1OcFNje/m3xugrVM/Ywkn4RsphG41qsO1H/wto1X2nKso+wqcw1aUHpp0WNoK7L6
         a7YXc5MQIqL1qOkZ9dyVBdHsCIhdZ1VrID+e9fQUKJ3Yit9yf6DmgfNmysWjnNZlNehG
         aX7w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DGel+YIe;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <berrange@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id 38308e7fff4ca-3202ac94da2si35662121fa.177.2025.05.06.01.05.07
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 01:05:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=DGel+YIe;
       spf=pass (google.com: domain of berrange@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=berrange@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746518706;
	h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CKq13IDoWWLLZS+sTpTrQ44CVklgdW+U3vYc0T0Rv9c=;
	b=DGel+YIeotwXkF0hPQikYl+MTSVXuYyCgCBU8BgGrznxZ0ljuqOISz37hKSntPltTHDNi7
	VMFemsxOy3PzK6Qh7KtcjKFg69vLpFeM3rCzByzZoIYrMBrEnHZ/yku/9uNDbmCn5RyU6x
	4x+k3j7UiLv6zsElGyCfivdvJxVRyYk=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-492-bvfRT-jqOjCO4DXOnumunA-1; Tue,
 06 May 2025 04:05:03 -0400
X-MC-Unique: bvfRT-jqOjCO4DXOnumunA-1
X-Mimecast-MFC-AGG-ID: bvfRT-jqOjCO4DXOnumunA_1746518701
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E02601800ECC;
	Tue,  6 May 2025 08:05:00 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.127])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5104718001D7;
	Tue,  6 May 2025 08:04:53 +0000 (UTC)
Date: Tue, 6 May 2025 09:04:50 +0100
From: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To: Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Daniel Henrique Barboza <danielhb413@gmail.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>,
	Jonah Palmer <jonah.palmer@oracle.com>,
	Raphael Norwitz <raphael.norwitz@nutanix.com>,
	Jason Wang <jasowang@redhat.com>,
	=?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@redhat.com>,
	qemu-ppc@nongnu.org,
	Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, Anton Johansson <anjo@rev.ng>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
	"Michael S. Tsirkin" <mst@redhat.com>,
	Mark Cave-Ayland <mark.caveayland@nutanix.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH] hw/virtio: Introduce CONFIG_VIRTIO_LEGACY to disable
 legacy support
Message-ID: <aBnCk2WE_SNkRgSH@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20250502132441.64723-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250502132441.64723-1-philmd@linaro.org>
User-Agent: Mutt/2.2.14 (2025-02-20)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-TUID: O9bC5VGT5cIK

On Fri, May 02, 2025 at 03:24:41PM +0200, Philippe Mathieu-Daudé wrote:
> Legacy VirtIO devices don't have their endianness clearly defined.
> QEMU infers it taking the endianness of the (target) binary, or,
> when a target support switching endianness at runtime, taking the
> endianness of the vCPU accessing the device.
> 
> Devices modelling shouldn't really change depending on a property
> of a CPU accessing it.
> 
> For heterogeneous systems, it is simpler to break such dev <-> cpu
> dependency, only allowing generic device models, with no knowledge
> of CPU (or DMA controller) accesses.
> 
> Therefore we introduce the VIRTIO_LEGACY Kconfig key. We keep the
> current default (enabled).
> New binaries can set CONFIG_VIRTIO_LEGACY=n to restrict models to
> the VirtIO version 1 spec.

IMHO that isn't acceptable. In order to be able to provide an
upgrade path from the old binaries, we need the need the new
binaries to be able to serve the same use cases & disabling
virtio 0.9 support prevents that. I don't see a compelling
technical reason why we can't support virtio 0.9 from this
endian point.

Yes may be more ugly/messy than we would like, but that's par
for the course with QEMU emulating arbitrary device models.
If the new binaries can't cope with messy devices then I think
we are doing something wrong.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|
