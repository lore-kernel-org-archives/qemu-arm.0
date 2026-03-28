Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 527EC10F3DCE
	for <qemu-arm@archiver.kernel.org>; Sat, 28 Mar 2026 13:24:50 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w6Teg-0001Hy-27; Sat, 28 Mar 2026 09:24:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1w6Tee-0001HJ-Gu
 for qemu-arm@nongnu.org; Sat, 28 Mar 2026 09:24:44 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mbawa@redhat.com>) id 1w6Tec-0005wa-Tw
 for qemu-arm@nongnu.org; Sat, 28 Mar 2026 09:24:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1774704281;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=fflB0LoqGT5rH5FdMcYQPoW4h2hRiuEbN2Gfb5ipuvA=;
 b=FV1SqLGqtvU8Gag5+JvDHO9Dhl6pVyuafWVCBx4YBkGjS6qYjPOfNZwj7Q8u55etg5MnAV
 8H6wyC5on5lpkaeZ8dHgrwgrAt35QqcRDPaQcVmjerQYWzUZK21OPRQ4RxJBqoh7T3kVN2
 b4XuLSnpA4OyHkTMI5lxTxc3IJJZl84=
Received: from mail-ot1-f70.google.com (mail-ot1-f70.google.com
 [209.85.210.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-SkUrrxa5PVGaIrZQ8kHgCg-1; Sat, 28 Mar 2026 09:24:39 -0400
X-MC-Unique: SkUrrxa5PVGaIrZQ8kHgCg-1
X-Mimecast-MFC-AGG-ID: SkUrrxa5PVGaIrZQ8kHgCg_1774704273
Received: by mail-ot1-f70.google.com with SMTP id
 46e09a7af769-7d4c7afa9e0so8334189a34.0
 for <qemu-arm@nongnu.org>; Sat, 28 Mar 2026 06:24:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774704272; x=1775309072;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=fflB0LoqGT5rH5FdMcYQPoW4h2hRiuEbN2Gfb5ipuvA=;
 b=AMzHYnbwMByIzNCra4+2rD74d2pyq+MszL21ISQL1d/2zEahU76Puo6t88rgZacaJG
 RUqwY7sjocM+za6s/JZKt4J9SUgthr19NDeKDqHRQah+CzNptgCo/s5X6auEdrwHKGZh
 yHsXM8eS7cyyclbEq7UV1unITqXnOdod3y7ncPES5ellsS8h+//mrcNUyY43iPg9KIA3
 Px+ufyE3LAdFvUAjVru5ceeiR9iBEtlfkfg6uIG6ZyY0UI32sUfdKtY6jHu/BGrCETiK
 bSGp3hLPAjm6Fbnp0/jnBA8mXjBpV7a5j3msw4h/1ah/tcL36swPNDz/xo4QNXBZj7vQ
 MwUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUUi2FWeqwfpYcjp9UcArZhh7Jpk0VPjKHn0uaWn3k7pZwxzPExhmVoNJa1BljN2cFsFARHscpXpA==@nongnu.org
X-Gm-Message-State: AOJu0YwZ4sAm1WOtQDbo8IdwAt8ugsq/QYhieFN+gPBs4EfQo9xxYjio
 v476Z6iSiZQOTVm7i4ZKEEPC/T7DaHxpAhr6KJWG8gVos+7j/2uADH5jevMNdxH5v8SRag3z3aY
 TnXldA6hfArm+o2oeqSJAX8AcUoPSp0apUPSUSYkDgvPXd0zMd/HBwShnBpzcVt6ECTpyun8cYT
 PdxFcoiqAzPGtIV1Xf/nWOoMGDRCwd
X-Gm-Gg: ATEYQzxe03fIoZeAV9r7k1VtSPOm0VPEtE7dw2N7l2VjoewJXTsDLF4BgRaBm9drQ+X
 x8Af2sKAfNau9htXOgl/IkCdyyGcWQndWkoc7dXbE872oE72NXSxXWDY1OQQLnR+P97+DArqVti
 Ay63GuN+dG/n77B6kO8PEACcPzZ7F5rGt+iaCIukTbD/EgSTtjlhftrguy53YVeMYmnwJB3O9Jc
 PaV2nqjn8bf9tX3mr1pRKBwA9Qn36djKSHd+rc=
X-Received: by 2002:a05:6820:99c:b0:67b:c9fa:c310 with SMTP id
 006d021491bc7-67e187726b3mr3236780eaf.68.1774704272630; 
 Sat, 28 Mar 2026 06:24:32 -0700 (PDT)
X-Received: by 2002:a05:6820:99c:b0:67b:c9fa:c310 with SMTP id
 006d021491bc7-67e187726b3mr3236762eaf.68.1774704272205; Sat, 28 Mar 2026
 06:24:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260327173209.148180-1-mbawa@redhat.com>
 <20260327173209.148180-4-mbawa@redhat.com>
 <6cb600f2-5f0a-4b77-a972-967deee93698@linaro.org>
In-Reply-To: <6cb600f2-5f0a-4b77-a972-967deee93698@linaro.org>
From: Mohammadfaiz Bawa <mbawa@redhat.com>
Date: Sat, 28 Mar 2026 18:54:16 +0530
X-Gm-Features: AQROBzBmSFlATYcnLAcRiQFiM4WP6_UUedUQsRD0g6DmrsirwT9xV1se8F0Ej2c
Message-ID: <CAJg9KkybpR9X3xELr6mM5j1VMAC_61wPfq=dUS7Ug_xSqvd7uQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] hw/tpm: add PPI support to tpm-tis-device for
 ARM64 virt
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, stefanb@linux.vnet.ibm.com, 
 pierrick.bouvier@linaro.org, "Michael S . Tsirkin" <mst@redhat.com>,
 imammedo@redhat.com, 
 anisinha@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com, 
 qemu-arm@nongnu.org, mohamed@unpredictable.fr, 
 Stefan Berger <stefanb@linux.ibm.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CTZj0fJs3aSbF1LjJWElvEjU3Qi_RD4pIW7e8s1llgs_1774704273
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mbawa@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=0.001,
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

On Sat, Mar 28, 2026 at 5:17=E2=80=AFAM Philippe Mathieu-Daud=C3=A9
<philmd@linaro.org> wrote:
>
> Hi,
>
> On 27/3/26 18:32, Mohammadfaiz Bawa wrote:
> > Add PPI memory region and ACPI _STA, _DSM to tpm-tis-sysbus so
> > Windows 11 ARM64 guests no longer log Event ID 15 errors from
> > tpm.sys on every boot.
> >
> > Reviewed-by: Stefan Berger <stefanb@linux.ibm.com>
> > Signed-off-by: Mohammadfaiz Bawa <mbawa@redhat.com>
> > ---
> >   hw/arm/virt-acpi-build.c |  9 ++++++++-
> >   hw/tpm/tpm_tis_sysbus.c  | 11 +++++++++++
> >   2 files changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> > index 591cfc993c..5b5ac551f8 100644
> > --- a/hw/arm/virt-acpi-build.c
> > +++ b/hw/arm/virt-acpi-build.c
> > @@ -240,7 +240,8 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMachi=
neState *vms)
> >       Aml *dev =3D aml_device("TPM0");
> >       aml_append(dev, aml_name_decl("_HID", aml_string("MSFT0101")));
> >       aml_append(dev, aml_name_decl("_STR", aml_string("TPM 2.0 Device"=
)));
> > -    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> > +    aml_append(dev, aml_name_decl("_UID", aml_int(1)));
> > +    aml_append(dev, aml_name_decl("_STA", aml_int(0xF)));
> >
> >       Aml *crs =3D aml_resource_template();
> >       aml_append(crs,
> > @@ -248,6 +249,12 @@ static void acpi_dsdt_add_tpm(Aml *scope, VirtMach=
ineState *vms)
> >                                     (uint32_t)memory_region_size(sbdev_=
mr),
> >                                     AML_READ_WRITE));
> >       aml_append(dev, aml_name_decl("_CRS", crs));
> > +
> > +    hwaddr ppi_base =3D platform_bus_get_mmio_addr(pbus, sbdev, 1);
> > +    if (ppi_base !=3D -1) {
> > +        ppi_base +=3D pbus_base;
> > +        tpm_build_ppi_acpi(TPM_IF(sbdev), dev, ppi_base);
>
> Matter of style, I'd rather:
>
>             tpm_build_ppi_acpi(TPM_IF(sbdev), dev, pbus_base + ppi_base);
>
> > +    }
> >       aml_append(scope, dev);
> >   }
> >   #endif
>
> Hmm I see in tests/qtest/bios-tables-test.c that test_acpi_tcg_tpm()
> only tests X86 (Q35). Could you see how to add coverage for Aarch64
> virt machine? (It could be a patch on top, no need to repost a v4).
>
> Otherwise,
>
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>

Noted, and I'll look into adding tests aarch64 virt coverage as a follow-up=
.

Thanks,
Faiz


