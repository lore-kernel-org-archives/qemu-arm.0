Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp2983787njj;
        Tue, 6 May 2025 02:16:37 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXdTGSsuzDbdAAid1snMD3IoW8wWVwek2TTRCiP5J1z+F8WiGHD0zo6F0vgl+HF+ni9mIDgn/9urnQAqA==@linaro.org
X-Google-Smtp-Source: AGHT+IHpCLtoQcvFv5xhvWMLAz0o5+gtFydHYxmFbbu+3IUiJSTk6WK0vwIXfVE+QD66scGTrqmg
X-Received: by 2002:a05:622a:550e:b0:48d:ecaa:920a with SMTP id d75a77b69052e-48decaac37amr183391981cf.38.1746522997268;
        Tue, 06 May 2025 02:16:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746522997; cv=none;
        d=google.com; s=arc-20240605;
        b=GexMZhWhtae10oB8LMihAt4nkpFivHrzPc3BDQ/D0cORGUBI0aeVpo5OlPNqvjc0U/
         JvcFr9BsJ2UoRaBZnNoIL6TLy43BJ/L8OrFfVEUh7xJVubAzkwDISmMd9IyP8iJHK8zy
         mSq4WJPuT6mmuEAPDf8RM8A17dEz1Uj17N67F+ywDCoK4tnLdj0D6W/bfABb5CNMXqtu
         Qci8+CWBfEanWgjGT+kG06ZBmSk3s5qGq72379JzAfZmT/owjus2renbq40euOB87ZM1
         azUOEt+hy2JMCqLqBe5dGtZvbb12MsWJly3BsWhJJFvWwFnq9d0thxslzsbN5Uq0/BO4
         YqxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=7FIB23mvbtYnFGNFnK8BC0WEahE4E9a/GHcIYRUObXE=;
        fh=XYMfIdnhQHwIBtvKfLXcnXkBk9AyiIiQsS6AO7bHLQE=;
        b=RtoGHauh17RkI0ZfLslqOEkI1Vx7k188O4CN5DQaajyHq+TWgf8hMjVAFweI9fSGx1
         loU9uFmdVzQ9HPqlg1CakoXhRDV8Rems5i4ZvowSUkd9oHZ+cDvZxoMv6QSErT1YLG8N
         ct6J1AQ14jIIVGmJ6GOwHhiHvBNRiHB58wd8y0YYeZbwDV88R4y8KsagkJ6QcnXz2O0A
         dClZjojsWTlJ15zRdyYwTcu3PFPQFElgxqbYhRTZ+GqVG1mtV0VBiPG7WbXq+6d9ZQL0
         56EneD+LE8Hsu9SH1nySBs2SGRc3u+QghuNKVDcgtIVv9ho7ilE0eyVspT0Url//EGqI
         6Bdg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MwSZUrhG;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.129.124])
        by mx.google.com with ESMTPS id d75a77b69052e-48b98b2583dsi107701371cf.471.2025.05.06.02.16.37
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:16:37 -0700 (PDT)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) client-ip=170.10.129.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=MwSZUrhG;
       spf=pass (google.com: domain of mst@redhat.com designates 170.10.129.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746522996;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=7FIB23mvbtYnFGNFnK8BC0WEahE4E9a/GHcIYRUObXE=;
	b=MwSZUrhGwiBYUc4tij8NBSIZgsKnhnBzehO1zsWCogvSLWkpfd5r4iIqeSw+l/P2x0YogN
	PPluNLT0L4eaYCPvqMIAxbe1ZMjlZ1OZk3KakukVoQFUKcbH+uafpmDnkUD744YNZFCXE/
	l7EWi0+ZrmGPyGH/cl2HfhSpU2JrfMQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-693-F_IvnUTeNNSyDEH2A1xJmQ-1; Tue, 06 May 2025 05:16:35 -0400
X-MC-Unique: F_IvnUTeNNSyDEH2A1xJmQ-1
X-Mimecast-MFC-AGG-ID: F_IvnUTeNNSyDEH2A1xJmQ_1746522994
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3a0af6219a5so147559f8f.1
        for <alex.bennee@linaro.org>; Tue, 06 May 2025 02:16:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746522994; x=1747127794;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7FIB23mvbtYnFGNFnK8BC0WEahE4E9a/GHcIYRUObXE=;
        b=w+8Gh3yGfBzYnMdyFOs6TtV6NaKQ+bgVxEx/9J40aeZSXFpKrNpnfJIJuBWVYxNH+k
         HFugFeAl9iuFO80sk6IdYm3709RkK/9cTvD/DtgI1aLn225r0TRu5KcKwBmmmZK+K0GS
         7rKczZZ04wqC16fLCPWuZLvKf0ZF8/Fjuo/s2GR1K1a3SwEia6ZXd2H0uB6+uKvUUXng
         35Tqm5nQAigWc+EGyCIHLJztK0owMN77SU653P4vZvLKGXpSSLX9/niutmbiqFmJMhYw
         EQajTbV04J5IHAcoY5NQ4V2XwXsWzC3Z+VmfHUIrHjg6vE+LIBf82m5fcOYurX3hXpev
         20sg==
X-Forwarded-Encrypted: i=1; AJvYcCVJTa4YZlMU/5/hEw6wfEXz+YvQOKPAo2t5rOTWGTjudU7h6Z3ZYZILdiSH3Pfj2cw108/E0W4vlm/7SQ==@linaro.org
X-Gm-Message-State: AOJu0Yy7bvBdQadeT+5mEwbUVjsXATRvI1NxCNvyuJeal8pSEewUy0Pb
	yvFHxEN0J7bIHz7+A5+N/leR94wGiJLiD7/DeSPRZE0qpyoGB45v44V+tKWrkc2fuJLL+e3bQOQ
	rsEgTNoxKNDXyBtENnmhGD7QiGDtmipUq2uC7HtjW1lb8TeAmifeaTw==
X-Gm-Gg: ASbGnct4gXRNuQcBXsbPY/+CqjT3ZiruOVvAQz67w3/wJkxmepJ0ZX5+wLi6ew2uqXV
	ZKNuUxzw1HKjg9gPBV/IfnSNHwdWwHVXhHyyzLn0sUahUFSkXcpB40U9QHrCyDK0Sz0+Qwyc+bn
	WMBGTR9kbOL22V5M8URo0Ne4P3m6X8Or7yJFxlQHv+IVGGDvDf9q5Tq4kmH6LiJ2hgc93yJEcOM
	1GL7Nw1KTCKk5yRfG6MkWJ/bfx2K6QVi7QFjsX1BukyEZfhnVa8/cU6ljHwjErAWjidH9IyYTm7
	oucuyw==
X-Received: by 2002:a05:6000:1843:b0:39c:30f7:b6ad with SMTP id ffacd0b85a97d-3a0ab58f3camr1826769f8f.18.1746522994413;
        Tue, 06 May 2025 02:16:34 -0700 (PDT)
X-Received: by 2002:a05:6000:1843:b0:39c:30f7:b6ad with SMTP id ffacd0b85a97d-3a0ab58f3camr1826742f8f.18.1746522994012;
        Tue, 06 May 2025 02:16:34 -0700 (PDT)
Return-Path: <mst@redhat.com>
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0d3csm12772869f8f.3.2025.05.06.02.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 02:16:33 -0700 (PDT)
Date: Tue, 6 May 2025 05:16:29 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Daniel =?iso-8859-1?Q?P=2E_Berrang=E9?= <berrange@redhat.com>,
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
	Peter Maydell <peter.maydell@linaro.org>,
	Manos Pitsidianakis <manos.pitsidianakis@linaro.org>
Subject: Re: [RFC PATCH] hw/virtio: Introduce CONFIG_VIRTIO_LEGACY to disable
 legacy support
Message-ID: <20250506051530-mutt-send-email-mst@kernel.org>
References: <20250502132441.64723-1-philmd@linaro.org>
 <aBnCk2WE_SNkRgSH@redhat.com>
 <20250506040903-mutt-send-email-mst@kernel.org>
 <59c4d557-2f73-4b56-8650-f16ed3cd7bb2@linaro.org>
MIME-Version: 1.0
In-Reply-To: <59c4d557-2f73-4b56-8650-f16ed3cd7bb2@linaro.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ctQSy5Ma3e5GwmYySzydqimpntvSZwYM-86N-ua1jXg_1746522994
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: rkkiiA+/Spv8

On Tue, May 06, 2025 at 10:55:34AM +0200, Philippe Mathieu-Daudé wrote:
> On 6/5/25 10:12, Michael S. Tsirkin wrote:
> > On Tue, May 06, 2025 at 09:04:50AM +0100, Daniel P. Berrangé wrote:
> > > On Fri, May 02, 2025 at 03:24:41PM +0200, Philippe Mathieu-Daudé wrote:
> > > > Legacy VirtIO devices don't have their endianness clearly defined.
> > > > QEMU infers it taking the endianness of the (target) binary, or,
> > > > when a target support switching endianness at runtime, taking the
> > > > endianness of the vCPU accessing the device.
> > > > 
> > > > Devices modelling shouldn't really change depending on a property
> > > > of a CPU accessing it.
> > > > 
> > > > For heterogeneous systems, it is simpler to break such dev <-> cpu
> 
>         ^^^^^^^^^^^^^
> 
> > > > dependency, only allowing generic device models, with no knowledge
> > > > of CPU (or DMA controller) accesses.
> > > > 
> > > > Therefore we introduce the VIRTIO_LEGACY Kconfig key. We keep the
> > > > current default (enabled).
> > > > New binaries can set CONFIG_VIRTIO_LEGACY=n to restrict models to
> > > > the VirtIO version 1 spec.
> > > 
> > > IMHO that isn't acceptable. In order to be able to provide an
> > > upgrade path from the old binaries, we need the need the new
> > > binaries to be able to serve the same use cases & disabling
> > > virtio 0.9 support prevents that.
> 
> This isn't for the single binary effort, there we are taking a
> lot of care to not introduce any change.
> 
> This is for after it; once we have a single binary (one architecture
> run by an instance) we can start testing heterogeneous emulation
> (different architectures in the same instance).
> 
> > > I don't see a compelling
> > > technical reason why we can't support virtio 0.9 from this
> > > endian point.
> 
> VirtIO 0.9 needs knowledge of the vCPU architecture to get its
> endianness. So we need to somehow propagate that at creation
> time, guarantying which vCPU (or set of vCPUs) will access a
> virtio device.
> 
> The use case I'd like to figure out is how should we model
> plugging a virtio 0.9 device in into a fully emulated
> ZynqMP machine, which has little-endian ARM cores and big
> endian MicroBlaze cores.
> 
> Alex said this is unlikely to happen, and better is to
> ignore this case by not allowing virtio pre-1.0 devices in
> our future heterogeneous emulator.

Indeed. I just do not think this can be done with a kconfig knob,
it's a machine property.

> In this same thread Pierrick pointed me to the reference in
> the spec: '2.4.3 Legacy Interfaces: A Note on Virtqueue Endianness',
> "It is assumed that the host is already aware of the guest endian."
> 
> I suppose this means a pre-1.0 virtio device expect to be used by
> a single guest OS, but it is not clear the guest OS as fixed
> endianness, because the code path checks vCPU endianness at
> runtime, so passing guest endianness as a property to pre-1.0
> devices isn't really an option.
> 
> Anyway I think 1/ I posted this too early, "speculating" as Pierrick
> noticed, and confuse the community w.r.t. "single binary" and
> 2/ I don' t understand legacy virtio and its endianness handling
> enough to figure a clever idea to keep using it heterogeneous
> setup, so I'll let this task to someone more familiar with that tech.
> 
> > > Yes may be more ugly/messy than we would like, but that's par
> > > for the course with QEMU emulating arbitrary device models.
> > > If the new binaries can't cope with messy devices then I think
> > > we are doing something wrong.
> 
> > 
> > To be more specific, having a kconfig knob modifying the device
> > without regards for machine types, means it is no longer
> > enough to inspect the command line to figure out the
> > compatiblity. That's a problem.
> > 
> 
> OK. I won't pursue in this direction. I apologize for mentioning
> this topic again too early.
> 
> Regards,
> 
> Phil.
