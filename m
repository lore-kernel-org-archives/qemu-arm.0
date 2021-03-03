Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp5722863lfg;
        Wed, 3 Mar 2021 14:15:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzbSqVJVDAJ2aO3OaLLB9KpGwB00mWzoCQjzCz+RfN14SecjR4Sxsxs7rPOJZ7mJFhcjiTt
X-Received: by 2002:a17:906:400b:: with SMTP id v11mr858467ejj.194.1614809744221;
        Wed, 03 Mar 2021 14:15:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1614809744; cv=none;
        d=google.com; s=arc-20160816;
        b=yRSrwvt6/iTOmSScnGCB6yGXEiaRTHKF8N4L5RHxoRzrd/bGjnuZMbrkFojoAqbO2c
         ndGltISdpuWms4KZ53/kidUClXRyhMnbkWk8sNH84tM4PJn2aCl/HrRJbz/5VF9ISjzZ
         TYDgeMgvcUqxXy6k4DI3iaFfOs34hqlf4XXeJwOigT2ZcXuDdg/D7VoGBil0lcyVvxwe
         bb4sUWl8q8sxPn6cmhDM+m02RkIW3M9zgvR8BU26/R/Yyzwmyrxb+0NSNaPc5gddgdRp
         gIxFZxLtSZdFGYIMLC63IE2JQlJQzRlMpWheSBKKwBYgrQGHsArVwQbMu8W14NN3WyVl
         qYnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-disposition:in-reply-to
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=TYwAvG5ucTTQOLeE1blHGHeaNwWpw8fVkV/fR4A4kWo=;
        b=FGs0AkK5b6QaBn2R1kT1ik0A4cEYbnOc6cXGe7D9hJm22FYDaSyJeZ480SBY7gMqQI
         aGRUC8VLlFZ3BruEN/+CWR/fZBaYYoDErcrUs4LZsvOc56t0uO+Afz/a1ac+9QhrHf6d
         F6CfG/T7g57kjGUypx3ld83JNOYHV2j0OBgzJbxZ2bkba84IMGP2BQkkwVYqeK0UgzO4
         cSOayFaoQG3tHMKps2PxoM5QXPhIFFiIjObiRwgPueO/7ShgrCTfu4t5QkJ32QR6jBWm
         S6vYyryotlZupSW3l51QQAdRaEnwTkfCcEdAjevVqwFtfeQTrZaUPjR3Vruk+OwH0HD0
         fVVw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="IVbJ/bxE";
       spf=pass (google.com: domain of mst@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <mst@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [63.128.21.124])
        by mx.google.com with ESMTPS id s28si8014213edw.110.2021.03.03.14.15.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Mar 2021 14:15:44 -0800 (PST)
Received-SPF: pass (google.com: domain of mst@redhat.com designates 63.128.21.124 as permitted sender) client-ip=63.128.21.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="IVbJ/bxE";
       spf=pass (google.com: domain of mst@redhat.com designates 63.128.21.124 as permitted sender) smtp.mailfrom=mst@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1614809743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TYwAvG5ucTTQOLeE1blHGHeaNwWpw8fVkV/fR4A4kWo=;
	b=IVbJ/bxE59zfmd8ySNSk7zvdG2das4PHttz4xSlsuR4lq+MbXhVqMQwqODvXeWbbJk0bK7
	FIkhi6TZkna4qfeHb78scfw1EtmGXftuTKCFBEndrEHt3GEuRkBfrlrC0lxI03c5ma6E5s
	X5NqShMTYcGbVEorDbGOUy/L5aMbPl8=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-544-h2uNi8M-MYeILkgJ8eYAvQ-1; Wed, 03 Mar 2021 17:15:41 -0500
X-MC-Unique: h2uNi8M-MYeILkgJ8eYAvQ-1
Received: by mail-ej1-f72.google.com with SMTP id v10so11149600ejh.15
        for <alex.bennee@linaro.org>; Wed, 03 Mar 2021 14:15:41 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=TYwAvG5ucTTQOLeE1blHGHeaNwWpw8fVkV/fR4A4kWo=;
        b=PQk8GiloyN7HAFDSy+P85Db1XyZGTOOQctMGo/GCSxtCKY++Fzn9sKx2JC12UZU8fg
         c8EZlAae2MioWC1sNih4d022dVgfm3v6JIfkaxwoejZHmZj+zK7IYkTBgS5iYaLVRxV7
         ZAkjMrU534y+VPRe9vR4wzUnLRx7CkYmFcmwOddKjNYm5UKKLfnWAhSAVi+Josn455j4
         81kAZUgqsGz8Ux+bhG6jLkid15jlQCpW9+es2n8EhGELiKTljcmBEX5B99XZNqUP5g5a
         5PAR98WWyK09uruuvF6zC5BXeTnwbxfJzKCQx04b6j/Rwm1URd1ilrT1OI8UahTSYDOO
         QocQ==
X-Gm-Message-State: AOAM532yjvm4NQTebWwDWox8RqlNXMUOZ9HoliL4puwzUevp3maw3Z19
	3bsCwm4wy+zsCgLRun+0+15MTEg6ZXGT2hVA1DyNUt8jnRAHALvJD5xlUWMtKPvtBms01Qz8znJ
	W/fvjeZwIzGUhVqvN
X-Received: by 2002:a17:906:11d1:: with SMTP id o17mr780973eja.517.1614809740401;
        Wed, 03 Mar 2021 14:15:40 -0800 (PST)
X-Received: by 2002:a17:906:11d1:: with SMTP id o17mr780964eja.517.1614809740258;
        Wed, 03 Mar 2021 14:15:40 -0800 (PST)
Return-Path: <mst@redhat.com>
Received: from redhat.com (bzq-79-180-2-31.red.bezeqint.net. [79.180.2.31])
        by smtp.gmail.com with ESMTPSA id j14sm21939094eds.78.2021.03.03.14.15.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Mar 2021 14:15:39 -0800 (PST)
Date: Wed, 3 Mar 2021 17:15:36 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>
Cc: qemu-devel@nongnu.org, Claudio Fontana <cfontana@suse.de>,
	qemu-arm@nongnu.org, Peter Maydell <peter.maydell@linaro.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Richard Henderson <richard.henderson@linaro.org>,
	qemu-s390x@nongnu.org, Thomas Huth <thuth@redhat.com>,
	qemu-ppc@nongnu.org, Laurent Vivier <laurent@vivier.eu>,
	Cornelia Huck <cohuck@redhat.com>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>
Subject: Re: [PATCH v4 03/28] cpu: Introduce cpu_virtio_is_big_endian()
Message-ID: <20210303171059-mutt-send-email-mst@kernel.org>
References: <20210303214708.1727801-1-f4bug@amsat.org>
 <20210303214708.1727801-4-f4bug@amsat.org>
 <20210303170743-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
In-Reply-To: <20210303170743-mutt-send-email-mst@kernel.org>
Authentication-Results: relay.mimecast.com;
	auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=mst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-TUID: V9YElnw9XJrf

On Wed, Mar 03, 2021 at 05:08:36PM -0500, Michael S. Tsirkin wrote:
> On Wed, Mar 03, 2021 at 10:46:43PM +0100, Philippe Mathieu-Daudé wrote:
> > Introduce the cpu_virtio_is_big_endian() generic helper to avoid
> > calling CPUClass internal virtio_is_big_endian() one.
> > 
> > Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> 
> Using virtio in the name here probably because virtio wants this?
> That doesn't sound like a good naming strategy, name should
> tell us what function does not how it's used.

On a more concrete proposal, how about using this change
to rename the virtio_is_big_endian field to guest_is_big_endian(),
and put the wrapper somewhere in a virtio header instead?

> > ---
> >  include/hw/core/cpu.h | 9 +++++++++
> >  hw/core/cpu.c         | 8 ++++++--
> >  hw/virtio/virtio.c    | 4 +---
> >  3 files changed, 16 insertions(+), 5 deletions(-)
> > 
> > diff --git a/include/hw/core/cpu.h b/include/hw/core/cpu.h
> > index 2d43f78819f..b12028c3c03 100644
> > --- a/include/hw/core/cpu.h
> > +++ b/include/hw/core/cpu.h
> > @@ -602,6 +602,15 @@ hwaddr cpu_get_phys_page_debug(CPUState *cpu, vaddr addr);
> >   */
> >  int cpu_asidx_from_attrs(CPUState *cpu, MemTxAttrs attrs);
> >  
> > +/**
> > + * cpu_virtio_is_big_endian:
> > + * @cpu: CPU
> > +
> > + * Returns %true if a CPU which supports runtime configurable endianness
> > + * is currently big-endian.
> > + */
> > +bool cpu_virtio_is_big_endian(CPUState *cpu);
> > +
> >  #endif /* CONFIG_USER_ONLY */
> >  
> >  /**
> > diff --git a/hw/core/cpu.c b/hw/core/cpu.c
> > index 4dce35f832f..daaff56a79e 100644
> > --- a/hw/core/cpu.c
> > +++ b/hw/core/cpu.c
> > @@ -218,8 +218,13 @@ static int cpu_common_gdb_write_register(CPUState *cpu, uint8_t *buf, int reg)
> >      return 0;
> >  }
> >  
> > -static bool cpu_common_virtio_is_big_endian(CPUState *cpu)
> > +bool cpu_virtio_is_big_endian(CPUState *cpu)
> >  {
> > +    CPUClass *cc = CPU_GET_CLASS(cpu);
> > +
> > +    if (cc->virtio_is_big_endian) {
> > +        return cc->virtio_is_big_endian(cpu);
> > +    }
> >      return target_words_bigendian();
> >  }
> >  
> > @@ -438,7 +443,6 @@ static void cpu_class_init(ObjectClass *klass, void *data)
> >      k->write_elf64_note = cpu_common_write_elf64_note;
> >      k->gdb_read_register = cpu_common_gdb_read_register;
> >      k->gdb_write_register = cpu_common_gdb_write_register;
> > -    k->virtio_is_big_endian = cpu_common_virtio_is_big_endian;
> >      set_bit(DEVICE_CATEGORY_CPU, dc->categories);
> >      dc->realize = cpu_common_realizefn;
> >      dc->unrealize = cpu_common_unrealizefn;
> > diff --git a/hw/virtio/virtio.c b/hw/virtio/virtio.c
> > index 1fd1917ca0f..fe6a4be99e4 100644
> > --- a/hw/virtio/virtio.c
> > +++ b/hw/virtio/virtio.c
> > @@ -1973,9 +1973,7 @@ static enum virtio_device_endian virtio_default_endian(void)
> >  
> >  static enum virtio_device_endian virtio_current_cpu_endian(void)
> >  {
> > -    CPUClass *cc = CPU_GET_CLASS(current_cpu);
> > -
> > -    if (cc->virtio_is_big_endian(current_cpu)) {
> > +    if (cpu_virtio_is_big_endian(current_cpu)) {
> >          return VIRTIO_DEVICE_ENDIAN_BIG;
> >      } else {
> >          return VIRTIO_DEVICE_ENDIAN_LITTLE;
> > -- 
> > 2.26.2
