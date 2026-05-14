Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0213CD4851
	for <qemu-arm@archiver.kernel.org>; Thu, 14 May 2026 14:33:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNX7j-0008Eq-Au; Thu, 14 May 2026 10:33:15 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1wNX7f-0008CH-Gm
 for qemu-arm@nongnu.org; Thu, 14 May 2026 10:33:13 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1wNX7a-000123-RO
 for qemu-arm@nongnu.org; Thu, 14 May 2026 10:33:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778769184;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=B0/qR+9SC02xt5jpgOGKPzh1EcvUsgnng05Whu3DIEE=;
 b=bYPh54OxL7RxWIcVHWs3zgopl90YOsJ4Q7uspywwLKK8pxiXGSZSm+Qg9mQnEViHiInrft
 vVTCbkcdnPYFDvYuodSn17jPjMOT4tE/lsZZlpnDQgMVr5NtV52MtS6S3YR4Mz/j3QuMge
 +bs/bzfcummGk3EOXMO9VJx2d7UDGB0=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-zjvkyTGjOtKDmd2cwt1nMA-1; Thu, 14 May 2026 10:33:03 -0400
X-MC-Unique: zjvkyTGjOtKDmd2cwt1nMA-1
X-Mimecast-MFC-AGG-ID: zjvkyTGjOtKDmd2cwt1nMA_1778769182
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-48fd8162ed7so7346375e9.2
 for <qemu-arm@nongnu.org>; Thu, 14 May 2026 07:33:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778769182; x=1779373982;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4uv7GnQz5GSG67tsap8gp8SaeNT30zZaHENAZr25Ef8=;
 b=af3fXvoXniliUsImaoHcw4D7acUkcMNdSTnfxk0UqE0uvePcCRlVZzKTh6TRBDufzs
 X/9xMsQ8DdUJF6e6zOS3f+Y3EI2qVKMJoubE1o1qisx2dmBr6HyeyqqRbiVqP/mwa3HZ
 ClGDkQZWvVXr6RceLDnJGqmUUhUbGJQYF2xUTXNnIzNpeUqo1rkpKwCy6U69x3VUfxgF
 /CGtZyrdnIKVknyZ00FBYraMAGHWaKttWiBDnxEA4KuRvQYzD8KUzUMJ2TuNhFYC3LPo
 KlIoq1kyubsb37A0TJoeDZchH//12MOrqCQ1BVQf1liXj4WUb6jt7bP7P7yY9zBW/Dcv
 +h6A==
X-Forwarded-Encrypted: i=1;
 AFNElJ+j/O6fbEzEMOqGGw+ZLLE363VXNulsfirTWYAYHPUACdgaYZTlCBi1HSjJecQbG4yeo0Yr/7YkvQ==@nongnu.org
X-Gm-Message-State: AOJu0Yy0MWHyXzwtrIFbIhG2T0whh9MMqhLWp8SIflUsLv9g2/UbbRX/
 BFW65eXgAey/89S97EzdbLyZgAxgfNPaCf4xwYVmJcl0lU4GdJV873Pe0vLQb2cU/HC9OEU203a
 sPQA63mgXHuUzrMPweeIKAtDIHQjVAGeBL+ubGz0fvnYFYxZEq5jioQ==
X-Gm-Gg: Acq92OHD41zCS1dztIO2L3Qcn1+vIwu9SMI64tu9accjytbn0IRWXy89jIVcCs27csC
 O9oqpgXKqDUn3eiZMfnMu+Z7/lnQoN3dkSLNwNOeBC3v3RPhravN662FFbRfBPvbnRtUtlYNV0n
 XtdqDqRX7rjAaVe/SOVOOqPEuirrzZUT0QLb26rOirM+ZIYBNYIlBNPqpAsJGtwiTzaEi7CnACb
 IAWd/bl+1+ry97lfEJVHPVucn002qADeGe5Tg2Rj6MY1snGdMNXr4//9gQNzS8lIAfbmour8J4I
 so6yRgA5htI4RVC8csysSKhB2TZ1mNlUJ/WVqFf4++nGhk69XIN88s3y6Pjqe6nW1SHi4QjmQ+/
 uuVupfQ==
X-Received: by 2002:a05:600c:4f88:b0:48f:e230:2a22 with SMTP id
 5b1f17b1804b1-48fe2302b60mr20238695e9.33.1778769182184; 
 Thu, 14 May 2026 07:33:02 -0700 (PDT)
X-Received: by 2002:a05:600c:4f88:b0:48f:e230:2a22 with SMTP id
 5b1f17b1804b1-48fe2302b60mr20238065e9.33.1778769181694; 
 Thu, 14 May 2026 07:33:01 -0700 (PDT)
Received: from imammedo ([213.175.37.14]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-48fe4614d53sm2451125e9.11.2026.05.14.07.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 May 2026 07:33:01 -0700 (PDT)
Date: Thu, 14 May 2026 16:32:58 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Cc: Zhao Liu <zhao1.liu@intel.com>, qemu-devel@nongnu.org,
 anisinha@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, philmd@linaro.org, rad@semihalf.com,
 leif.lindholm@oss.qualcomm.com, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 03/21] x86: q35: generate WDAT ACPI table
Message-ID: <20260514163258.37b025d3@imammedo>
In-Reply-To: <20260513112745-mutt-send-email-mst@kernel.org>
References: <20260303092532.2410177-1-imammedo@redhat.com>
 <20260303092532.2410177-4-imammedo@redhat.com>
 <agSdBwKQh3C9UgdF@intel.com>
 <20260513112745-mutt-send-email-mst@kernel.org>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: VuFsY4sarsVcZn6e6BvaAtm5_wLH3JznG1KFf1zLv1Y_1778769182
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 13 May 2026 11:28:01 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

> On Wed, May 13, 2026 at 11:47:19PM +0800, Zhao Liu wrote:
> > On Tue, Mar 03, 2026 at 10:25:14AM +0100, Igor Mammedov wrote: =20
> > > Date: Tue,  3 Mar 2026 10:25:14 +0100
> > > From: Igor Mammedov <imammedo@redhat.com>
> > > Subject: [PATCH v2 03/21] x86: q35: generate WDAT ACPI table
> > >=20
> > > It will generate WDAT table [1] customized for TCO watchdog.
> > > This allows Windows guests (Windows Server 2008/Vista+) to
> > > use TCO watchdog using built-in generic driver, which
> > > alleviates need to install vendor specific drivers.
> > >=20
> > > Given that enabling it might change guest behaviour
> > > (both Windows/Linux) the feature is disabled by default.
> > >=20
> > > Users that need it can enable the feature with
> > > following CLI option.
> > >     -machine wdat=3Don
> > >=20
> > > 1)
> > >    "Hardware Watchdog Timers Design=C2=A0Specification"
> > >     https://uefi.org/acpi 'Watchdog Action Table (WDAT)'
> > >=20
> > > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > > Reviewed-by: Ani Sinha <anisinha@redhat.com>
> > > ---
> > >  include/hw/acpi/wdat-ich9.h | 15 +++++++
> > >  hw/acpi/meson.build         |  3 +-
> > >  hw/acpi/wdat-ich9-stub.c    | 15 +++++++
> > >  hw/acpi/wdat-ich9.c         | 90 +++++++++++++++++++++++++++++++++++=
++
> > >  hw/i386/acpi-build.c        | 12 +++++
> > >  5 files changed, 134 insertions(+), 1 deletion(-)
> > >  create mode 100644 include/hw/acpi/wdat-ich9.h
> > >  create mode 100644 hw/acpi/wdat-ich9-stub.c
> > >  create mode 100644 hw/acpi/wdat-ich9.c =20
> >=20
> > ...
> >  =20
> > > +void build_ich9_wdat(GArray *table_data, BIOSLinker *linker, const c=
har *oem_id,
> > > +                     const char *oem_table_id, uint64_t tco_base)
> > > +{
> > > +    AcpiTable table =3D { .sig =3D "WDAT", .rev =3D 1, .oem_id =3D o=
em_id,
> > > +                        .oem_table_id =3D oem_table_id };
> > > +    struct AcpiGenericAddress tco_rld =3D  TCO_REG(tco_base, 0x0, 16=
);
> > > +    struct AcpiGenericAddress tco2_sts =3D TCO_REG(tco_base, 0x6, 16=
);
> > > +    struct AcpiGenericAddress tco1_cnt =3D TCO_REG(tco_base, 0x8, 16=
);
> > > +    struct AcpiGenericAddress tco_tmr =3D  TCO_REG(tco_base, 0x12, 1=
6);
> > > +
> > > +    acpi_table_begin(&table, table_data);
> > > +    build_append_int_noprefix(table_data, 0x20, 4); /* Watchdog Head=
er Length */
> > > +    build_append_int_noprefix(table_data, 0xff, 2); /* PCI Segment *=
/
> > > +    build_append_int_noprefix(table_data, 0xff, 1); /* PCI Bus Numbe=
r */
> > > +    build_append_int_noprefix(table_data, 0xff, 1); /* PCI Device Nu=
mber */
> > > +    build_append_int_noprefix(table_data, 0xff, 1); /* PCI Function =
Number */
> > > +    build_append_int_noprefix(table_data, 0, 3);    /* Reserved */
> > > +    /*
> > > +     * limits/resolution are defined by ICH9 TCO spec
> > > +     */
> > > +    build_append_int_noprefix(table_data, 0x258, 4);/* Timer Period,=
 ms */
> > > +    build_append_int_noprefix(table_data, 0x3ff, 4);/* Maximum Count=
 */
> > > +    build_append_int_noprefix(table_data, 0x4, 4);  /* Minimum Count=
 */ =20
> >=20
> > Spec said: The time-out period before the WDT fires is recommended to b=
e at
> > least 5 minutes and is required to be less than 4,294,967,296 count
> > intervals.
> >=20
> > Here we encode 0x4 * 0x258 =3D 2400ms, less than 5 minutes. But I
> > understand because "5 minutes" is just "recommanded" by spec, so 2400ms=
 is
> > okay.
> >=20
> > LGTM,
> >=20
> > Reviewed-by: Zhao Liu <zhao1.liu@intel.com> =20
>=20
>=20
> maybe a comment why it's shorter?

it's not shorter nor arbitrary value, comments already say it all.
and provide enough context for spec lookup:
 WDAT:
   /Timer Period/=09Contains the period of one timer count (in milliseconds=
).

 it's timer resolution.
   iTCO spec says: "The timer is clocked at approximately 0.6 seconds"

   and then MIN/MAX aren't default value either, they are limits per iTCO s=
pec,
   as comment above says. The guest OS sets actual value within declared he=
re constrains.

So no extra comments were added (just enough for spec lookup).
But my view is obviously biased,
just say what more you'd like to see in comments and I'll post fixup.









