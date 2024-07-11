Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp42778nji;
        Thu, 11 Jul 2024 02:18:24 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUOg1a0xpjOurRkNU9HLa+HQPS2V2twqQxnz2A+h+vRbDHbSs3DpP06v6iYAAd5UWF1cCLcnmfBo4tJS2JMFSqdVcxnexjw
X-Google-Smtp-Source: AGHT+IFEvJ+R4gId0Zk6lRId0FMvlQq093wXaTwT3/gJ8JO7nUchYxjUuywOKmKsTn2b4G1K7Z/u
X-Received: by 2002:a05:622a:ce:b0:447:e5e8:83c2 with SMTP id d75a77b69052e-447faa36acfmr108742961cf.55.1720689504515;
        Thu, 11 Jul 2024 02:18:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720689504; cv=none;
        d=google.com; s=arc-20160816;
        b=t6HZP95eYIvlcF2hZSDLa3TM9tD5+IpUOZXyr86ToGuiYS96sy/dKfdF0A7xILrQJ4
         7elMZFcbT9csTARq+fO/Lo4Epc3JoZ4NFHYJ/Ry+HJSyge/X50Q20FFcWnxfU+bEeWqv
         KMJ55KA/ya9o9ttEsYz6pQ8OdR2tpBDSwsJfsKnKvAAdCMFN1PDBmtStI4fhj2Iv3QX/
         APeynVcA6KKDa/iNNPU5Rpe8ZZiUFfhMRNvixV0aIA2rJwpY5b0uFskkNzMIHqbafL/E
         N9lTaDiSp07nPbsL57MaHaQj1t8XTPGQ9v9KbD4h3vtgw5FzB2R4xF3swjk/mQ+j0cA/
         8lNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:cc:to:from
         :date:dkim-signature;
        bh=MiMdkC6Vn8f5soGxJat2tMXfctteJTyrM2IIJfpajTg=;
        fh=EoWN8VZjKHCk1xWsHAk1sOtAdH3a4pAFO7bdesn1vUI=;
        b=v8m1POtGY4ZW4ucPnAH+NMp/4rIW8RdmHL3BVie4cUKDJRxFmAnEvJTyQbbd/gTeQl
         QgJbTTyUQjM+YcRfqtxxBYSffr4vliesQH5zOAJlppN6am1ITKy4kVwQjafR+QGhgMbH
         YAX2ajOCtfeuY3Ns/3mLaH2ueJ71/oAVg8qGwulHYSL1pA0VwCstJLD4FYGJiBKf1qCr
         fuvas0iYt8HSqDqJkyB1Yxy0HvT/WbTPhQLrHfgjFNxNxi6qUFJ598KVq4jngUU0HtsF
         lD+fDs7c1j+Iy8z8d1GDCWtxoOX9siDZRB0XxNGJFavhXwLQZYsIn6cof/GOXPdDh0wN
         OR5g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K+sD1axb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-447f9bc4e9dsi66272851cf.411.2024.07.11.02.18.24
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jul 2024 02:18:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=K+sD1axb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRpvW-0001nz-Nd; Thu, 11 Jul 2024 05:17:23 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sRpvS-0001iH-Bn
 for qemu-arm@nongnu.org; Thu, 11 Jul 2024 05:17:18 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1sRpvO-00006t-U0
 for qemu-arm@nongnu.org; Thu, 11 Jul 2024 05:17:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1720689433;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MiMdkC6Vn8f5soGxJat2tMXfctteJTyrM2IIJfpajTg=;
 b=K+sD1axbCCjv0A2ArB2qFvIWTR69aF0E7W1YT2YNpyvGDnCrMbBOjgn4Ff2UMx5shV0yTO
 cqrLEo8M8uJ8mibO1BJljERfbWg4WBQBAO37Hr9F6tyPs5ehGdLJFjFRexjD+ENH0xBYVZ
 NLJ4hgvlnsV5VuUwunaaRybQrxiwDug=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-518-LLCV4x5XOja2mnB32UlAkA-1; Thu, 11 Jul 2024 05:17:12 -0400
X-MC-Unique: LLCV4x5XOja2mnB32UlAkA-1
Received: by mail-wr1-f69.google.com with SMTP id
 ffacd0b85a97d-3679ab94cdbso391841f8f.3
 for <qemu-arm@nongnu.org>; Thu, 11 Jul 2024 02:17:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720689431; x=1721294231;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kMETAZaH9ZANVQpqrZkMXxfrvuvn0zthcUi5l1K+JZQ=;
 b=bLRKkyF94Pi0ZOuP/VXfbHh4PME4qfUrYE2j0jbVCl0x1HhcjOeAq2t4X+7V0hDHtT
 A8bpZqOL3+whptuV02OQ79kgfUYdpLkIX7Du/pJXvFZP9S8a5o5lkCzlKVfjdb2/C9+t
 rrw6bxBwSCspQgrzBhQNs1j7V6eITPUAAg8NmvJf+eCJTr0rf3TQBXxVKpBOfTcsHR/q
 N98SfC3fAeHJZMqvsVubqLsdN9Pn6S9e6YwGdconGqRYwEtH0w7Sp05cqp9KkgKHPXzs
 uMu1yddcysqQFhcxe3mFYUEZwMfK8uDK3X+Z3ouSkJNLHvVHSiphYtCgqplvzwgx7dQ+
 XV5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXI/QmZfFcSLuZpTFOE7y7GvQMHRQ+SlwIp33fl0Wc9R5cYSeLIp2+7SzxQGiH2LgPcjYgEMeM9ivN2/NVH1LGm2Nad
X-Gm-Message-State: AOJu0YxFSgHXkO7faFDr+1WyIfjEj84oadvLckshQuzRqfYd9+2JQ5yn
 kKZKhZv8V0cHU7OP7t5T+ST5p1h2zEK52ml2fT9RlTAL5J+5qwkBMbQi1XPATmeSBFI92CLY6VQ
 Y5J0XKHAXsKHOz7H7dVzUS0GdZ5MAQz9saqrYQOa3Z12Z0cgfvg==
X-Received: by 2002:a05:6000:1fad:b0:367:ebb7:7c99 with SMTP id
 ffacd0b85a97d-367ebb77ecbmr2777533f8f.47.1720689431377; 
 Thu, 11 Jul 2024 02:17:11 -0700 (PDT)
X-Received: by 2002:a05:6000:1fad:b0:367:ebb7:7c99 with SMTP id
 ffacd0b85a97d-367ebb77ecbmr2777508f8f.47.1720689430965; 
 Thu, 11 Jul 2024 02:17:10 -0700 (PDT)
Received: from imammedo.users.ipa.redhat.com (nat-pool-brq-t.redhat.com.
 [213.175.37.10]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-367cde89108sm7204789f8f.55.2024.07.11.02.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Jul 2024 02:17:10 -0700 (PDT)
Date: Thu, 11 Jul 2024 11:17:09 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Daniel P. =?UTF-8?B?QmVycmFuZ8Op?=" <berrange@redhat.com>
Cc: qemu-devel@nongnu.org, peter.maydell@linaro.org, philmd@linaro.org,
 mst@redhat.com, wangyanan55@huawei.com, pbonzini@redhat.com,
 richard.henderson@linaro.org, anisinha@redhat.com, qemu-arm@nongnu.org
Subject: Re: [PATCH] smbios: make memory device size configurable per Machine
Message-ID: <20240711111709.38806b3b@imammedo.users.ipa.redhat.com>
In-Reply-To: <Zo-bQgQVSgZw8J1A@redhat.com>
References: <20240711074822.3384344-1-imammedo@redhat.com>
 <Zo-bQgQVSgZw8J1A@redhat.com>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.42; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.144,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 7HvnKnC51ryD

On Thu, 11 Jul 2024 09:43:46 +0100
Daniel P. Berrang=C3=A9 <berrange@redhat.com> wrote:

> On Thu, Jul 11, 2024 at 09:48:22AM +0200, Igor Mammedov wrote:
> > Currently SMBIOS maximum memory device chunk is capped at 16Gb,
> > which is fine for the most cases (QEMU uses it to describe initial
> > RAM (type 17 SMBIOS table entries)).
> > However when starting guest with terabytes of RAM this leads to
> > too many memory device structures, which eventually upsets linux
> > kernel as it reserves only 64K for these entries and when that
> > border is crossed out it runs out of reserved memory.
> >=20
> > Instead of partitioning initial RAM on 16Gb chunks, use maximum
> > possible chunk size that SMBIOS spec allows[1]. Which lets
> > encode RAM in Mb units in uint32_t-1 field (upto 2047Tb).
> > As result initial RAM will generate only one type 17 structure
> > until host/guest reach ability to use more RAM in the future.
> >=20
> > Compat changes:
> > We can't unconditionally change chunk size as it will break
> > QEMU<->guest ABI (and migration). Thus introduce a new machine class
> > field that would let older versioned machines to use 16Gb chunks
> > while new machine type could use maximum possible chunk size.
> >=20
> > While it might seem to be risky to rise max entry size this much
> > (much beyond of what current physical RAM modules support),
> > I'd not expect it causing much issues, modulo uncovering bugs
> > in software running within guest. And those should be fixed
> > on guest side to handle SMBIOS spec properly, especially if
> > guest is expected to support so huge RAM configs.
> > In worst case, QEMU can reduce chunk size later if we would
> > care enough about introducing a workaround for some 'unfixable'
> > guest OS, either by fixing up the next machine type or
> > giving users a CLI option to customize it. =20
>=20
> I was wondering what real hardware does, since the best way to
> avoid guest OS surprises is to align with real world behaviour.
> IIUC, there is usually one Type 17 structure per physical
> DIMM.
>=20
> Most QEMU configs don't express DIMMs as a concept so in that
> case, we can presume 1 virtual DIMM, and thus having one type
> 17 structure is a match for physical hw practices.


> What about when the QEMU config has used nvdimm, pc-dimm,
> or virtio-mem devices though ? It feels like the best practice
> would be to have a type 17 structure for each instance of one
> of those devices.

QEMU doesn't expose any memory beside initial one in SMBIOS.
So from guest introspection pov when using only SMBIOS,
those do not exists.

On tangent:
I think exposing those with hotplug in place makes
it messy especially with migration in mind (we would need to
move smbios tables creation to reset time and enumerate all
supported memory devices at that time to get somewhat reliable
picture, which would reflect machine config _only_ at boot time).

Also it would help to model initial RAM as DIMM(s) device to
avoid faking RAM entry, and do it consistently with DIMM devices.

(but yeah, nobody asked for anything like that so far).


> > 1) SMBIOS 3.1.0 7.18.5 Memory Device =E2=80=94 Extended Size
> >=20
> > PS:
> > * tested on 8Tb host with RHEL6 guest, which seems to parse
> >   type 17 SMBIOS table entries correctly (according to 'dmidecode').
> >=20
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  include/hw/boards.h |  4 ++++
> >  hw/arm/virt.c       |  1 +
> >  hw/core/machine.c   |  1 +
> >  hw/i386/pc_piix.c   |  1 +
> >  hw/i386/pc_q35.c    |  1 +
> >  hw/smbios/smbios.c  | 11 ++++++-----
> >  6 files changed, 14 insertions(+), 5 deletions(-)
> >=20
> > diff --git a/include/hw/boards.h b/include/hw/boards.h
> > index ef6f18f2c1..48ff6d8b93 100644
> > --- a/include/hw/boards.h
> > +++ b/include/hw/boards.h
> > @@ -237,6 +237,9 @@ typedef struct {
> >   *    purposes only.
> >   *    Applies only to default memory backend, i.e., explicit memory ba=
ckend
> >   *    wasn't used.
> > + * @smbios_memory_device_size:
> > + *    Default size of memory device,
> > + *    SMBIOS 3.1.0 "7.18 Memory Device (Type 17)"
> >   */
> >  struct MachineClass {
> >      /*< private >*/
> > @@ -304,6 +307,7 @@ struct MachineClass {
> >      const CPUArchIdList *(*possible_cpu_arch_ids)(MachineState *machin=
e);
> >      int64_t (*get_default_cpu_node_id)(const MachineState *ms, int idx=
);
> >      ram_addr_t (*fixup_ram_size)(ram_addr_t size);
> > +    uint64_t smbios_memory_device_size;
> >  };
> > =20
> >  /**
> > diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> > index b0c68d66a3..719e83e6a1 100644
> > --- a/hw/arm/virt.c
> > +++ b/hw/arm/virt.c
> > @@ -3308,6 +3308,7 @@ DEFINE_VIRT_MACHINE_AS_LATEST(9, 1)
> >  static void virt_machine_9_0_options(MachineClass *mc)
> >  {
> >      virt_machine_9_1_options(mc);
> > +    mc->smbios_memory_device_size =3D 16 * GiB;
> >      compat_props_add(mc->compat_props, hw_compat_9_0, hw_compat_9_0_le=
n);
> >  }
> >  DEFINE_VIRT_MACHINE(9, 0)
> > diff --git a/hw/core/machine.c b/hw/core/machine.c
> > index bc38cad7f2..3cfdaec65d 100644
> > --- a/hw/core/machine.c
> > +++ b/hw/core/machine.c
> > @@ -1004,6 +1004,7 @@ static void machine_class_init(ObjectClass *oc, v=
oid *data)
> >      /* Default 128 MB as guest ram size */
> >      mc->default_ram_size =3D 128 * MiB;
> >      mc->rom_file_has_mr =3D true;
> > +    mc->smbios_memory_device_size =3D 2047 * TiB;
> > =20
> >      /* numa node memory size aligned on 8MB by default.
> >       * On Linux, each node's border has to be 8MB aligned
> > diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> > index 9445b07b4f..d9e69243b4 100644
> > --- a/hw/i386/pc_piix.c
> > +++ b/hw/i386/pc_piix.c
> > @@ -495,6 +495,7 @@ static void pc_i440fx_machine_9_0_options(MachineCl=
ass *m)
> >      pc_i440fx_machine_9_1_options(m);
> >      m->alias =3D NULL;
> >      m->is_default =3D false;
> > +    m->smbios_memory_device_size =3D 16 * GiB;
> > =20
> >      compat_props_add(m->compat_props, hw_compat_9_0, hw_compat_9_0_len=
);
> >      compat_props_add(m->compat_props, pc_compat_9_0, pc_compat_9_0_len=
);
> > diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> > index 71d3c6d122..9d108b194e 100644
> > --- a/hw/i386/pc_q35.c
> > +++ b/hw/i386/pc_q35.c
> > @@ -374,6 +374,7 @@ static void pc_q35_machine_9_0_options(MachineClass=
 *m)
> >      PCMachineClass *pcmc =3D PC_MACHINE_CLASS(m);
> >      pc_q35_machine_9_1_options(m);
> >      m->alias =3D NULL;
> > +    m->smbios_memory_device_size =3D 16 * GiB;
> >      compat_props_add(m->compat_props, hw_compat_9_0, hw_compat_9_0_len=
);
> >      compat_props_add(m->compat_props, pc_compat_9_0, pc_compat_9_0_len=
);
> >      pcmc->isa_bios_alias =3D false;
> > diff --git a/hw/smbios/smbios.c b/hw/smbios/smbios.c
> > index 3b7703489d..a394514264 100644
> > --- a/hw/smbios/smbios.c
> > +++ b/hw/smbios/smbios.c
> > @@ -1093,6 +1093,7 @@ static bool smbios_get_tables_ep(MachineState *ms=
,
> >                         Error **errp)
> >  {
> >      unsigned i, dimm_cnt, offset;
> > +    MachineClass *mc =3D MACHINE_GET_CLASS(ms);
> >      ERRP_GUARD();
> > =20
> >      assert(ep_type =3D=3D SMBIOS_ENTRY_POINT_TYPE_32 ||
> > @@ -1123,12 +1124,12 @@ static bool smbios_get_tables_ep(MachineState *=
ms,
> >      smbios_build_type_9_table(errp);
> >      smbios_build_type_11_table();
> > =20
> > -#define MAX_DIMM_SZ (16 * GiB)
> > -#define GET_DIMM_SZ ((i < dimm_cnt - 1) ? MAX_DIMM_SZ \
> > -                                        : ((current_machine->ram_size =
- 1) % MAX_DIMM_SZ) + 1)
> > +#define GET_DIMM_SZ ((i < dimm_cnt - 1) ? mc->smbios_memory_device_siz=
e \
> > +    : ((current_machine->ram_size - 1) % mc->smbios_memory_device_size=
) + 1)
> > =20
> > -    dimm_cnt =3D QEMU_ALIGN_UP(current_machine->ram_size, MAX_DIMM_SZ)=
 /
> > -               MAX_DIMM_SZ;
> > +    dimm_cnt =3D QEMU_ALIGN_UP(current_machine->ram_size,
> > +                             mc->smbios_memory_device_size) /
> > +               mc->smbios_memory_device_size;
> > =20
> >      /*
> >       * The offset determines if we need to keep additional space betwe=
en
> > --=20
> > 2.43.0
> >=20
> >  =20
>=20
> With regards,
> Daniel

