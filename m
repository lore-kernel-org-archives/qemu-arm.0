Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2957741njj;
        Tue, 6 May 2025 01:12:19 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW83i5poUHUup5OG8VGCb1WMTgmcEPBgCp1HUqxz2EDZOCWWD9a3GsddbUc5ARWgAWXiuWq5E/iadq/pA==@linaro.org
X-Google-Smtp-Source: AGHT+IHQTSkoD8bzf2VAouQCbJcodrIfGVSEb+6HMB9CQFHhS8+J88ji0leSUPTdcHbEjpyo6SXD
X-Received: by 2002:a05:622a:828a:b0:491:18c2:2d1 with SMTP id d75a77b69052e-49118c20402mr19083771cf.7.1746519138993;
        Tue, 06 May 2025 01:12:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746519138; cv=none;
        d=google.com; s=arc-20240605;
        b=C8uWL8fn5PT4aXGzdqrGU2jSfYKEVlvNEe6nTht6L9RC1O4//og43BYBBOMZjbaa8O
         oafHDiBFbBNX++CxiGWMAntC6G+Fy7Qls/PHZJyBqvjSK3xQgtSGyNs7QjTgWX+LuKVI
         KThfyiBXX/cWqG2L4Hhgor447VVmi5G8LqYrnuWeq73Zq48N6nsqsSuuLm640gDwIaQP
         X03trnM7+lSaeDcYdjE7l4F7aN9i04bLzVsVN2wJJKa+a0VCjMdbei/7StGQgrBNUMsb
         AKLKKDlnJmraqq0FfpNukD61b5ATQl//6UgsT6stXfByPJl4sTPhIwizc20tXKxGdoOb
         +nLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=QHkcgapeVW41/Wm10mgZOFbCNxv68aW1y+Puf9VsBQ4=;
        fh=FKcawtrxkkRl/ejKrvToX0UgRUUml8G5sOBdiL0s6BM=;
        b=GSb/DRlVU5AasZlhDMMrc83PxYCrZUIFTFnem4vDWmTAVFTtxzanwjCrTJJUp5+psI
         MYJia+yB6ecLz1jd0fbB+Jutc8R0TeEDWaDycPtYlsILJcZd9y66QfFCpmmu157kx5cp
         u/lGj13LNVc+iFaLszaXgj4T2uc1v1g0Bw2RihJ3GQpIJFzvSIOIp7M0YvnK8zAuvq+/
         KpJo16eFn4vIvBnUMOZD/uUPl1OH2r8MY/V6PBxC+XEhjlM5y8eWMyyrz/WsolkVzmjR
         F+Yw6/KSizzxU4eeF8f6FvvAexghCGeP1XGeWRA2mZnV22odon1NLNVGZGc7y6O+qmVX
         sU/Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bUx95B94;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id d75a77b69052e-48b982471cesi105026641cf.289.2025.05.06.01.12.18
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 01:12:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=bUx95B94;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746519138;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QHkcgapeVW41/Wm10mgZOFbCNxv68aW1y+Puf9VsBQ4=;
	b=bUx95B94w2V7MHUgAK+ZRN/BSopQfd4NWspX5kiXew53KVqC117UT+e8wir3WyjaC3YaoK
	zZgQIkhVP+bwzo+NRpv7jWgWSwBHB0GipX/Zw7NjulU3gExAsxRz/TCOjWOa/aVRueCv0h
	NOYg2hV4uwmQD9kHK+1UaXSjRfJu+ls=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-658-JybBZWjWNUWeuIDsT0OZhQ-1; Tue, 06 May 2025 04:12:17 -0400
X-MC-Unique: JybBZWjWNUWeuIDsT0OZhQ-1
X-Mimecast-MFC-AGG-ID: JybBZWjWNUWeuIDsT0OZhQ_1746519136
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-43cf3168b87so22637735e9.2
        for <alex.bennee@linaro.org>; Tue, 06 May 2025 01:12:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746519136; x=1747123936;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QHkcgapeVW41/Wm10mgZOFbCNxv68aW1y+Puf9VsBQ4=;
        b=Chn2VvNic7pXQv6qcqsYn7woe3Ba5k7Lj6V98HqPVBH0qGZXq8mCtjb8yN3q53OIqE
         jbwVSqHO9T2hBtnVxE4GXtT8qaDs6qjAdnVvwWGVKIaLL1ZPg1EHc8uCUUrb7vcC9TCq
         xn+Ol/iKPNZtqLfsQ91zLR8yfu5i/d4GS7t0lHTNFASiX8MHZtgFvNLYvk+04peNH0J1
         Tz3+IDfeL29VVGpTe55XsR0MZ7j+dnHQ+jHKjNYkNnoy1X22A8eGZ5VzCf2VwA8WUyWv
         Any/YtM9jVvWSKGLhQ/S/O13Ltljap8m6gL5x5iHB8wYK4rigjItiaUHc45wVNtWMP/e
         GCFA==
X-Forwarded-Encrypted: i=1; AJvYcCWARydM289znc3mEtBIlZybaYmgpCzb8jbZKIRGtNDazaG2xv2aFDaJXkP5L0p1hoakni4HlFz/P0ALxg==@linaro.org
X-Gm-Message-State: AOJu0Yxde0vz0qkONUnZaS6hKcKgg0BXZSvkYD9IzcePCpcwoDpqhKN9
	ZMIw3G+m0yveqH/3hhvtzHATNLjjQvRxxt6Gkr9+YcRb6+Fv2ST0TrQvI/R5gqz24hpQnnM2wWf
	JFHTPgzN9Oiv1cFxJ1UtAnE6FXgTbStG/4Ccd6ipFLPgfm3CdcGO83A==
X-Gm-Gg: ASbGncuorVi3irEkxGY7Su/6l+P6OpcMZ70YEfhxBOmD1mcI79w7lj6Ik5JVnqNtqbo
	J2WHX0g/0J9o8lkFOfJNOiAWowPaB4s0R9Fh6xR+85nBcQ6jxtitI9yaFyEa4te2eDzaf7IlySR
	c3eocbuTXEECrumss8wJpscxPKklvhfdlmhiU+6ALIRNZeeF2NInZZJD2jBdKjqjj4iqY2fVMWD
	rEn6i6uhjUMr1WkK5WlKLTmbrslRWlviaP5Av7+U6r9HRidCPDUhMW7USLC+yA+D/s0nCk94jZU
	BTovuw==
X-Received: by 2002:a05:600c:1914:b0:43b:c0fa:f9dd with SMTP id 5b1f17b1804b1-441bbf33f76mr110821895e9.25.1746519136419;
        Tue, 06 May 2025 01:12:16 -0700 (PDT)
X-Received: by 2002:a05:600c:1914:b0:43b:c0fa:f9dd with SMTP id 5b1f17b1804b1-441bbf33f76mr110821635e9.25.1746519136071;
        Tue, 06 May 2025 01:12:16 -0700 (PDT)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441b8a2874asm158415125e9.26.2025.05.06.01.12.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 01:12:15 -0700 (PDT)
Date: Tue, 6 May 2025 04:12:11 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>
Cc: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>,
	qemu-devel@nongnu.org,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	David Hildenbrand <david@redhat.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Jonah Palmer <jonah.palmer@oracle.com>,
	Raphael Norwitz <raphael.norwitz@nutanix.com>,
	Jason Wang <jasowang@redhat.com>,
	=?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
	qemu-ppc@nongnu.org,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Akihiko Odaki <akihiko.odaki@daynix.com>,
	Stefan Hajnoczi <stefanha@redhat.com>,
	Cornelia Huck <cohuck@redhat.com>, Anton Johansson <anjo@rev.ng>,
	Pierrick Bouvier <pierrick.bouvier@linaro.org>, qemu-arm@nongnu.org,
	Mark Cave-Ayland <mark.caveayland@nutanix.com>,
	Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [RFC PATCH] hw/virtio: Introduce CONFIG_VIRTIO_LEGACY to disable
 legacy support
Message-ID: <20250506040903-mutt-send-email-mst@kernel.org>
References: <20250502132441.64723-1-philmd@linaro.org>
 <aBnCk2WE_SNkRgSH@redhat.com>
MIME-Version: 1.0
In-Reply-To: <aBnCk2WE_SNkRgSH@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: UcDOBpCWd04hs29PKuXDGS4ux8W40ZV1pTlbkdXJ1rU_1746519136
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: Li3Gx5h01CK0

On Tue, May 06, 2025 at 09:04:50AM +0100, Daniel P. Berrangé wrote:
> On Fri, May 02, 2025 at 03:24:41PM +0200, Philippe Mathieu-Daudé wrote:
> > Legacy VirtIO devices don't have their endianness clearly defined.
> > QEMU infers it taking the endianness of the (target) binary, or,
> > when a target support switching endianness at runtime, taking the
> > endianness of the vCPU accessing the device.
> > 
> > Devices modelling shouldn't really change depending on a property
> > of a CPU accessing it.
> > 
> > For heterogeneous systems, it is simpler to break such dev <-> cpu
> > dependency, only allowing generic device models, with no knowledge
> > of CPU (or DMA controller) accesses.
> > 
> > Therefore we introduce the VIRTIO_LEGACY Kconfig key. We keep the
> > current default (enabled).
> > New binaries can set CONFIG_VIRTIO_LEGACY=n to restrict models to
> > the VirtIO version 1 spec.
> 
> IMHO that isn't acceptable. In order to be able to provide an
> upgrade path from the old binaries, we need the need the new
> binaries to be able to serve the same use cases & disabling
> virtio 0.9 support prevents that. I don't see a compelling
> technical reason why we can't support virtio 0.9 from this
> endian point.
> 
> Yes may be more ugly/messy than we would like, but that's par
> for the course with QEMU emulating arbitrary device models.
> If the new binaries can't cope with messy devices then I think
> we are doing something wrong.
> 
> With regards,
> Daniel


To be more specific, having a kconfig knob modifying the device
without regards for machine types, means it is no longer
enough to inspect the command line to figure out the
compatiblity. That's a problem.

-- 
MST
