Received: by 2002:a17:906:2b99:b0:a2e:1324:ea5c with SMTP id m25csp840617ejg;
        Fri, 19 Jan 2024 02:09:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGabB4dPE8cnpAXG5eyZk78qiYnpr3Ogj1zjcqD5XkgjFrkYQBeqmHMIRuZfokYZ2CPn87q
X-Received: by 2002:a81:69c2:0:b0:5ff:7cf4:3d75 with SMTP id e185-20020a8169c2000000b005ff7cf43d75mr2241210ywc.103.1705658969245;
        Fri, 19 Jan 2024 02:09:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705658969; cv=none;
        d=google.com; s=arc-20160816;
        b=lxm12G97IqZ1IumpYA8fzxWBIKpRHs2rj/5o/RvUMBwv9pGujrQSqczqQWYN2t6C0/
         EAmkTSz6CFmnQmd10bsDxl9+IMn9JlEeQjQ74DK3DrXQIhM/8GicjRPSzognfl53axyu
         pdXJnzA1UGsYKVZAfDFCETckuOvSlJbUv+h++NkCJoickbMDED3vXJyp++P1yIEZ5KO5
         4KhJfzKMEfwPGnwOg4bcVpOGj1C1nD9JenpDXB55gttx6QJa0xAvze9VOfYf6U9TirDL
         0zpn6FVJk1Ibr4LGYb8VsAG06GxjmNhGM5ol++5dJAVU9rewrSoVew1ZF7ymA1WE40VN
         y3dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :dkim-signature;
        bh=Migo7T0jQKXV0XcEd9xW1k66AHKgKw42yZhBkgGG2ys=;
        fh=bvrTHXxDtERGnasHZBJGjAzBR+sJw6pI3FjbpiCqrs8=;
        b=Vn1qO3FiprMVpfz9MWhP4NqS22aUTimhb6T0QJUzRqHlCHjZTFrMBgRu/BtmVujuHr
         xD22iKKMlQzsZYMX5Z3PjANRbTXtvM5bLT4mIvtTH2rNjhCThqLOWBVRQjUC1vA8Y70Y
         jHs2bwWRRpVAukLc/Sa/elQrWHOnZkrmxSo4M6RGjajt9fLOqq9jVXg/9WNEPDFJY1QN
         ziG14pLqxwgcHBBhHWwspe7CdaPwzDPKjofCt4vFG7o1l+iHI5hr4b5hI/RaT49r+UWj
         Y8KONz32DjWnJNAeojtubzJv8aPUzEroumNUeXEp2DxsXbiHBCml9IasY8lwcragvPba
         36uQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ftzN96J/";
       spf=pass (google.com: domain of kwolf@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kwolf@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <kwolf@redhat.com>
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com. [170.10.133.124])
        by mx.google.com with ESMTPS id v16-20020a05622a145000b0042a0cd7975bsi5918370qtx.676.2024.01.19.02.09.29
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jan 2024 02:09:29 -0800 (PST)
Received-SPF: pass (google.com: domain of kwolf@redhat.com designates 170.10.133.124 as permitted sender) client-ip=170.10.133.124;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b="ftzN96J/";
       spf=pass (google.com: domain of kwolf@redhat.com designates 170.10.133.124 as permitted sender) smtp.mailfrom=kwolf@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705658968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Migo7T0jQKXV0XcEd9xW1k66AHKgKw42yZhBkgGG2ys=;
	b=ftzN96J/IBdo96Sox3pdjdh3Xd2WvzVrizLCuZgZEv0bnYzi2HVs4lUQmXEw3tsDXFJUI8
	HxW4+AJ0uVqj0CX5XEpaNfcEtiLhZzyuajnMrusdjFEjwxOM1KQZEmiZrOFUWfMOkOJSZM
	3CBRexw114vMp7ht90hK/0pIYTeg0HU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-28-x1kt7xAyM2yDBWZoYPV-WQ-1; Fri,
 19 Jan 2024 05:09:25 -0500
X-MC-Unique: x1kt7xAyM2yDBWZoYPV-WQ-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 4DADF1C0CCA2;
	Fri, 19 Jan 2024 10:09:24 +0000 (UTC)
Received: from redhat.com (unknown [10.39.194.86])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 484F32166B33;
	Fri, 19 Jan 2024 10:09:22 +0000 (UTC)
Date: Fri, 19 Jan 2024 11:09:21 +0100
From: Kevin Wolf <kwolf@redhat.com>
To: Philippe =?iso-8859-1?Q?Mathieu-Daud=E9?= <philmd@linaro.org>
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
	Markus Armbruster <armbru@redhat.com>, qemu-devel@nongnu.org,
	Marc Zyngier <maz@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
	qemu-arm@nongnu.org, Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Radoslaw Biernacki <rad@semihalf.com>,
	"Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
	Leif Lindholm <quic_llindhol@quicinc.com>,
	Rob Herring <robh@kernel.org>,
	Alistair Francis <alistair@alistair23.me>
Subject: Re: [PATCH v3 13/14] hw/arm: Prefer arm_feature(AARCH64) over
 object_property_find(aarch64)
Message-ID: <ZapH_23WyMrcH72f@redhat.com>
References: <20240110195329.3995-1-philmd@linaro.org>
 <20240110195329.3995-14-philmd@linaro.org>
 <ff57e1f5-ea78-459e-b51c-48040483bdea@linaro.org>
 <865y009p6b.wl-maz@kernel.org>
 <585e091b-d75c-408c-bc19-72728ff45e6f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <585e091b-d75c-408c-bc19-72728ff45e6f@linaro.org>
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.6
X-TUID: PdBUtxrd605g

Am 11.01.2024 um 11:08 hat Philippe Mathieu-Daudé geschrieben:
> On 11/1/24 10:47, Marc Zyngier wrote:
> > On Thu, 11 Jan 2024 09:39:18 +0000,
> > Philippe Mathieu-Daudé <philmd@linaro.org> wrote:
> > > 
> > > On 10/1/24 20:53, Philippe Mathieu-Daudé wrote:
> > > > The "aarch64" property is added to ARMCPU when the
> > > > ARM_FEATURE_AARCH64 feature is available. Rather than
> > > > checking whether the QOM property is present, directly
> > > > check the feature.
> > > > 
> > > > Suggested-by: Markus Armbruster <armbru@redhat.com>
> > > > Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
> > > > ---
> > > >    hw/arm/virt.c | 2 +-
> > > >    1 file changed, 1 insertion(+), 1 deletion(-)
> > > > 
> > > > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > > > index 49ed5309ff..a43e87874c 100644
> > > > --- a/hw/arm/virt.c
> > > > +++ b/hw/arm/virt.c
> > > > @@ -2140,7 +2140,7 @@ static void machvirt_init(MachineState *machine)
> > > >            numa_cpu_pre_plug(&possible_cpus->cpus[cs->cpu_index], DEVICE(cpuobj),
> > > >                              &error_fatal);
> > > >    -        aarch64 &= object_property_get_bool(cpuobj, "aarch64",
> > > > NULL);
> > > > +        aarch64 &= arm_feature(cpu_env(cs), ARM_FEATURE_AARCH64);
> > > 
> > > So after this patch there are no more use of the ARMCPU "aarch64"
> > > property from code. Still it is exposed via the qom-tree. Thus it
> > > can be set (see aarch64_cpu_set_aarch64). I could understand one
> > > flip this feature to create a custom CPU (as a big-LITTLE setup
> > > as Marc mentioned on IRC), but I don't understand what is the
> > > expected behavior when this is flipped at runtime. Can that
> > > happen in real hardware (how could the guest react to that...)?
> > 
> > I don't think it makes any sense to do that while a guest is running
> > (and no HW I'm aware of would do this). However, it all depends what
> > you consider "run time". You could imagine creating a skeletal VM with
> > all features, and then apply a bunch of changes before the guest
> > actually runs.
> 
> Thanks, this makes sense and confirms my guess.
> 
> > I don't know enough about the qom-tree and dynamic manipulation of
> > these properties though, and I'm likely to be wrong about the expected
> > usage model.
> 
> Kevin, Markus, this seems a good example of QOM "config" property that
> is RW *before* Realize and should become RO *after* it.
> 
> QDev properties has PropertyInfo::realized_set_allowed set to false by
> default, but here this property is added at the QOM (lower) layer, so
> there is no such check IIUC.

You can take almost any other config property and it will show the same
pattern. This is the normal case (and one of the reasons why the current
way of doing QOM properties isn't great).

As you say, qdev tries to take care of this. In pure QOM properties, the
property setter must have manually implemented checks, and perhaps not
very surprisingly, people tend to forget to add them.

> Should "aarch64" become a static QDev property instead (registered via
> device_class_set_props -> qdev_class_add_property)?
> 
> This just an analyzed example, unfortunately there are many more...

target/arm/cpu64.c already seems to use a wild mix of ways to add
properties, so maybe it wouldn't make things worse...

It's good to look at such devices because it shows how hard QAPIfication
of all devices would become (fortunately the subset we're really
interested in most is user creatable devices, and I don't think users
can create CPUs with -device even though they look like it and are
mentioned in -device help?).

The basic requirement for QAPIfication is that each type has a fixed
list of properties. This is easy with devices that create their
properties with a single device_class_set_props(), but devices that
directly create properties, some of them conditional, and spread across
several different functions, it becomes hard to see what the real list
of properties is.

Even worse, there are properties whose creation depends on runtime
options like which accelerator is used ("pauth-impdef" and
"pauth-qarma3" exist only for TCG). There is no way to write a schema
for that. In QAPI, you can have it optional and return an error if it's
set when it shouldn't be, but the existence of the property itself can't
(currently?) depend on runtime options.

Kevin
