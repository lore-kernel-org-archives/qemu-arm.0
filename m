Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FC31CCFA1A
	for <qemu-arm@archiver.kernel.org>; Wed, 12 Nov 2025 13:10:01 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vJAbN-0000Q7-Gy; Wed, 12 Nov 2025 08:09:34 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vJAII-0005tH-D4
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 07:50:15 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1vJAI2-0000QD-2A
 for qemu-arm@nongnu.org; Wed, 12 Nov 2025 07:49:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1762951772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=MidskI02KBDkavdMZmN/zv7vIO9uCwKTKjcRXs7CHhE=;
 b=his+bqcbGgNUl5FmbseFTAkW04WivsENuTrgK6cFAXHuk8MmStyeTSWVAQ7jvZ8ZmMHu8P
 hO6rjxE6zmmDlIYmHEPjvaGzOn/odR1OequlgW/TdeBLcfbcGoK6YGwuMTyA+bkKMqGgpN
 PyWO7xVTIY3514Lj99X0a1Ej6ZSgyco=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-609-VGmRmSIJOe6PCFXIYwGzTg-1; Wed, 12 Nov 2025 07:49:31 -0500
X-MC-Unique: VGmRmSIJOe6PCFXIYwGzTg-1
X-Mimecast-MFC-AGG-ID: VGmRmSIJOe6PCFXIYwGzTg_1762951771
Received: by mail-wm1-f70.google.com with SMTP id
 5b1f17b1804b1-47113538d8cso4273265e9.1
 for <qemu-arm@nongnu.org>; Wed, 12 Nov 2025 04:49:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762951770; x=1763556570;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OGZsA9Er78xuHjaVmybLiZVZnkpjpBUWuXT5uN9MlHI=;
 b=eHnp25pV/TN2M+/1nKu8aJ9zZYlyeriu5f+aCvyTvBkys5ObMfUPquz8RCy6VamEXM
 ImR7D8aNnvKmJKRUP4td373zxtbj7VXNgG4W1PRaIxu5AELZhFgmElg0jA1GcMPATZwI
 LkjxTp6BdazWeraI1W2hHY2DIuwa5XpSck67sOASoNl5FaNN/MGtQ+aRizcQa1wWkXHR
 aY6BfS0iWBpfGF7dwOrfF3SZW77Lu/tuhI6uW42yUwDRgbQxSOdo9eM2Rx92HaPTwABr
 JN+R3OHRP5s4zol4CI6xGnf2L4foUQh8aHJPw7NiGtgJwAM69DxPXa+/jwyzGuT/ixax
 4ELQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFmJN24Bqr/qhrETqOIA3WE+Db7yic0KDWFWH1XUiH0drN3RntQWe7z1fBw85iRuAiRuVWrOe0oQ==@nongnu.org
X-Gm-Message-State: AOJu0Yx5TPh+wu7jJm+fC4SMdPeJmKLme+QFpQy309xefW9szWSIwAuE
 59/ppreneyGLk/06RlSua/wZtmDwKGpYsvOOT/GnP7AqX3FmoE9C422LpXJOdKsMZ74/YQLBuCn
 iEAGZO0Tu/mj6OiAerBUFxH7W6M3eHlnX2BxLMVM93/1YrsTTV++yHg==
X-Gm-Gg: ASbGncsDVpnt8Dpcu8XYTi/853mU8TePxviUu+YTpjS0ZGP8FdEWZIqdS8Zb9FbNeqF
 6F3/U4/zPhb65NhHX+26Uf39lwIQvHcxv/lTuLdLJJ/qa28FdIA/Ko3pNXucs3P1gHoDumeZJbi
 y2akn8kAMA+M8s4DnKqYBcdFV8wMPg6Sqk7DJcAf2YkTPhdq01WuLGyQ5mIEnq75sSj5q261aj1
 QNC2fLF+dtjehGfpwVSG4NUcx9DQGtrGZ6/XZNjQHM6RUAvelifdcv9lzmah9lrQ5Kyyfs39h2Q
 DysdsRakNaXcEVGmcBQJ8/x4AXrKusM5T5WgV7x9+efIPPwVwCFks9h8/M0f1PWTlw==
X-Received: by 2002:a05:600c:1c20:b0:46e:32dd:1b1a with SMTP id
 5b1f17b1804b1-4778703cf57mr26108405e9.7.1762951770562; 
 Wed, 12 Nov 2025 04:49:30 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHH9OMVYlPK+nc8UH0dxP0HD95VJka5aqgZvmwR1VGSvojArHtzGCmbdpTzxDdhhdLu1LawTA==
X-Received: by 2002:a05:600c:1c20:b0:46e:32dd:1b1a with SMTP id
 5b1f17b1804b1-4778703cf57mr26108025e9.7.1762951769963; 
 Wed, 12 Nov 2025 04:49:29 -0800 (PST)
Received: from fedora ([85.93.96.130]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47787e486a0sm33243745e9.4.2025.11.12.04.49.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Nov 2025 04:49:29 -0800 (PST)
Date: Wed, 12 Nov 2025 13:49:28 +0100
From: Igor Mammedov <imammedo@redhat.com>
To: Gavin Shan <gshan@redhat.com>
Cc: Philippe =?UTF-8?B?TWF0aGlldS1EYXVkw6k=?= <philmd@linaro.org>,
 qemu-arm@nongnu.org, qemu-devel@nongnu.org, jonathan.cameron@huawei.com,
 mchehab+huawei@kernel.org, gengdongjiu1@gmail.com, mst@redhat.com,
 anisinha@redhat.com, peter.maydell@linaro.org, pbonzini@redhat.com,
 shan.gavin@gmail.com, Markus Armbruster <armbru@redhat.com>
Subject: Re: [PATCH v3 6/8] acpi/ghes: Use error_abort in
 acpi_ghes_memory_errors()
Message-ID: <20251112134928.3f2ebb40@fedora>
In-Reply-To: <4af87665-14b1-41a4-8ed9-d3c9dfc087b8@redhat.com>
References: <20251105114453.2164073-1-gshan@redhat.com>
 <20251105114453.2164073-7-gshan@redhat.com>
 <2c3b388e-e002-466a-9b03-cafefcfc9d19@linaro.org>
 <4af87665-14b1-41a4-8ed9-d3c9dfc087b8@redhat.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 0UgHkSoCn8iSRSVcN_uU9EAUWsfP1P1Evpshi2usm8Q_1762951771
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.129.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
 SPF_HELO_PASS=-0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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

On Tue, 11 Nov 2025 13:58:46 +1000
Gavin Shan <gshan@redhat.com> wrote:

> Hi Philippe,
>=20
> On 11/11/25 12:54 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> > On 5/11/25 12:44, Gavin Shan wrote: =20
> >> Use error_abort in acpi_ghes_memory_errors() so that the caller needn'=
t
> >> explicitly call abort() on errors. With this change, its return value
> >> isn't needed any more.
> >>
> >> Suggested-by: Igor Mammedov <imammedo@redhat.com>
> >> Signed-off-by: Gavin Shan <gshan@redhat.com>
> >> ---
> >> =C2=A0 hw/acpi/ghes-stub.c=C2=A0=C2=A0=C2=A0 |=C2=A0 6 +++---
> >> =C2=A0 hw/acpi/ghes.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 =
| 15 ++++-----------
> >> =C2=A0 include/hw/acpi/ghes.h |=C2=A0 5 +++--
> >> =C2=A0 target/arm/kvm.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | 10 +++--=
-----
> >> =C2=A0 4 files changed, 13 insertions(+), 23 deletions(-) =20
> >=20
> >  =20
> >> diff --git a/include/hw/acpi/ghes.h b/include/hw/acpi/ghes.h
> >> index f73908985d..35c7bbbb01 100644
> >> --- a/include/hw/acpi/ghes.h
> >> +++ b/include/hw/acpi/ghes.h
> >> @@ -98,8 +98,9 @@ void acpi_build_hest(AcpiGhesState *ags, GArray *tab=
le_data,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 const char =
*oem_id, const char *oem_table_id);
> >> =C2=A0 void acpi_ghes_add_fw_cfg(AcpiGhesState *vms, FWCfgState *s,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 GArray *hardware_errors);
> >> -int acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 uint64_t *addresses, uint32_t num_of_addresses);
> >> +void acpi_ghes_memory_errors(AcpiGhesState *ags, uint16_t source_id,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 uint64_t *addresses, uint32_t num_of_addresses,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0 Error **errp); =20
> >=20
> > This is an anti-pattern w.r.t. commit e3fe3988d78 ("error: Document
> > Error API usage rules"), because it can be called with an errp distinct
> > of &error_abort.
> >=20
> > If you really want to abort(), remove the errp argument, directly call
> > abort() and rename as acpi_ghes_memory_abort_on_errors().
> >  =20
>=20
> Thanks for pointing it out. I will improve this like below in next revisi=
on.
>=20
> - Drop 'errp' argument from acpi_ghes_memory_errors(), but I prefer to ke=
ep
>    the function name.
>=20
> - In acpi_ghes_memory_errors(), a local variable 'Error *err' is added an=
d
>    pass it to ghes_record_cper_errors(), which is also called by QMP hand=
ler
>    qmp_inject_ghes_v2_error().
>=20
> Please let me know if there are any more improvements needed.
>=20
> >> =C2=A0 void ghes_record_cper_errors(AcpiGhesState *ags, const void *cp=
er, size_t len,
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 uint16_t source_id, Error **errp);
> >> diff --git a/target/arm/kvm.c b/target/arm/kvm.c
> >> index 459ca4a9b0..a889315606 100644
> >> --- a/target/arm/kvm.c
> >> +++ b/target/arm/kvm.c
> >> @@ -2458,13 +2458,9 @@ void kvm_arch_on_sigbus_vcpu(CPUState *c, int c=
ode, void *addr)
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 addresses[0] =3D paddr;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 if (code =3D=3D BUS_MCEERR_AR) {
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kvm_cpu_synchronize_state(c);
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (!acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SY=
NC,
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 addresses, 1)) {
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 kvm_inject_arm_sea(c);
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 } else {
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 error_report("failed to recor=
d the error");
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 abort();
> >> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 acpi_ghes_memory_errors(ags, ACPI_HEST_SRC_ID_SYNC,
> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 addresses, 1, &error_abort);

I guess that was my request,
with calling abort() directly you have to print error separately,
while using 'error_abort' is much more cleaner (as this hunk demonstrates) =
=20

> >> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 kvm_inject_arm_sea(c);
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 }
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 return;
> >> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } =20
> >  =20
>=20
> Thanks,
> Gavin
>=20


