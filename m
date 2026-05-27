Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8FC7CD5BD0
	for <qemu-arm@archiver.kernel.org>; Wed, 27 May 2026 12:59:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSDqk-0004G6-Fa; Wed, 27 May 2026 08:59:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1wSDqe-0004F2-KQ
 for qemu-arm@nongnu.org; Wed, 27 May 2026 08:59:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1wSDqd-000830-30
 for qemu-arm@nongnu.org; Wed, 27 May 2026 08:59:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1779886738;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=iEQAfLvOet6qO6R1zNac4aqvvCu/csDx1DZhIdUpyCE=;
 b=Q3B4HnsjsClF85VCIa05wWLwGtOAoH2Xv+w142Nrqknb/SxcvlRBgku6PAOxgGUtQl7iOw
 SV4BBQwIUtX7jnaildYml46ZNveqkHgQiAbVgM+AklUxVTOb9f52sLeJOp9YvGCmazOeeo
 4cmQ35oypBiUjkblAl48UeYjR3MnZ1Q=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-448-ONSce1I4PmGDMiOMXYWZ-A-1; Wed, 27 May 2026 08:58:54 -0400
X-MC-Unique: ONSce1I4PmGDMiOMXYWZ-A-1
X-Mimecast-MFC-AGG-ID: ONSce1I4PmGDMiOMXYWZ-A_1779886734
Received: by mail-wm1-f69.google.com with SMTP id
 5b1f17b1804b1-4903dcb32f8so50412435e9.0
 for <qemu-arm@nongnu.org>; Wed, 27 May 2026 05:58:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779886733; x=1780491533;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=iEQAfLvOet6qO6R1zNac4aqvvCu/csDx1DZhIdUpyCE=;
 b=knpD72yYhR1x5dyxVO12JP4OPuvK8tBguNaS7TRvMcjI8sritO16FK0mZM7Vv/tyQx
 BGyhf8XXFRQUnhltLJhqZLsOTHpG1q96Eph1SXoGt221sdM+Gh0+bUnP6q/tLu9xeDYo
 DiKorvDTRZqmsnwYAtw/5EP+JiiEXMDBWbA50lSMJaQYGSCdhQnf4muDAgMQhkCc8fW0
 C1wU5JD0mrlTv277AOXDUA7m+s0YIUiOTdsQEDoXUzZ7+oy895sQWiMGAWDSA8z5du9Z
 2FfjDYKg3/5SBlSxUewRsyRZcj/Sydf9GHYtJlOHKVAWPbACNWD7nNoJG/zO/Epi1ehD
 Bcog==
X-Forwarded-Encrypted: i=1;
 AFNElJ/Qb4kdINPj7X52CoaPC+uYKg58DX2tp3JtVJGmDJSe1/ouiH/BNxibu3Jrs4Z78tXuXojVAY3luA==@nongnu.org
X-Gm-Message-State: AOJu0YzdCCEHzeiOUVb6FNtwAbis5e7qws+S4jzG1Ogm1QmGCTn5ZZl9
 RVoCrQ5Vy2TvYNiLkPrzsrueI/iDFVn3cZvTLCg7wNECk5FFs6XQL3GDOfXOApZY7k+SbxvDMeV
 solsGKymIWXpLYSK56F8y3QQ2kJxciOIksgaNOGZVIdNWGmBIqUYR5w==
X-Gm-Gg: Acq92OEJgo77T8VwL0zY20V5gFLg6xhezCEjdk5vm/USfjDe2eerYqrRS1MG8YNEjCB
 5vvIWi0dFWsvzllcj5wtSvCKCSrmOvdp+cIfOGJz8+AQ9RNxwJO8orJyttA5UGMmHYGI0Zbd4tt
 zh/rZH3F7Lj1Dz5K5d3tM64icXKdh0plnK7/1BBIUh6Ej7lLg2yAsRWP3zt180YHbQ+Qjkli6cX
 nqP8e1V0zgs6B3twmZmiKF7MxnTF7I4Dg6839/4F2FmNUaxF0Z2HBagEv1a66GZ4usE+n4+jx/x
 KOFLlsBgiRqADR/JnMJ0K4m+nT7Xiq0q8Wb1Z6X84WMtXK6oAKLA9NYcjEZA3+J2FgdHSGrwUbQ
 NPQLfQQ==
X-Received: by 2002:a05:600c:a402:b0:48f:d1c0:721e with SMTP id
 5b1f17b1804b1-490426b294amr265356125e9.12.1779886733600; 
 Wed, 27 May 2026 05:58:53 -0700 (PDT)
X-Received: by 2002:a05:600c:a402:b0:48f:d1c0:721e with SMTP id
 5b1f17b1804b1-490426b294amr265355855e9.12.1779886733205; 
 Wed, 27 May 2026 05:58:53 -0700 (PDT)
Received: from imammedo ([213.175.46.86]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-490809c2dc2sm16208485e9.28.2026.05.27.05.58.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 May 2026 05:58:52 -0700 (PDT)
Date: Wed, 27 May 2026 14:58:51 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eauger@redhat.com>
Cc: qemu-devel@nongnu.org, mst@redhat.com, anisinha@redhat.com,
 pbonzini@redhat.com, peter.maydell@linaro.org, shannon.zhaosl@gmail.com,
 philmd@linaro.org, zhao1.liu@intel.com, rad@semihalf.com,
 leif.lindholm@oss.qualcomm.com, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 16/21] tests: acpi: arm/virt: add GTDT watchdog table
 test case
Message-ID: <20260527145851.2b0abebd@imammedo>
In-Reply-To: <cba87a73-0458-445e-8c12-683ca639f2de@redhat.com>
References: <20260303092532.2410177-1-imammedo@redhat.com>
 <20260303092532.2410177-17-imammedo@redhat.com>
 <cba87a73-0458-445e-8c12-683ca639f2de@redhat.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: W2AH3b-EvX6JE__ETyadV6xpBDQ4tkgcIJa1Vj2zE0c_1779886734
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
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

On Tue, 26 May 2026 16:44:08 +0200
Eric Auger <eauger@redhat.com> wrote:

> On 3/3/26 10:25 AM, Igor Mammedov wrote:
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > ---
> >  tests/qtest/bios-tables-test.c | 20 ++++++++++++++++++++
> >  1 file changed, 20 insertions(+)
> > 
> > diff --git a/tests/qtest/bios-tables-test.c b/tests/qtest/bios-tables-test.c
> > index 5082866184..11c6854af8 100644
> > --- a/tests/qtest/bios-tables-test.c
> > +++ b/tests/qtest/bios-tables-test.c
> > @@ -2290,6 +2290,24 @@ static void test_acpi_aarch64_virt_tcg_wdat(void)
> >      free_test_data(&data);
> >  }
> >  
> > +static void test_acpi_aarch64_virt_tcg_gtdt_wd(void)
> > +{
> > +    test_data data = {
> > +        .machine = "virt",
> > +        .arch = "aarch64",
> > +        .variant = ".gwdt",
> > +        .tcg_only = true,
> > +        .uefi_fl1 = "pc-bios/edk2-aarch64-code.fd",
> > +        .uefi_fl2 = "pc-bios/edk2-arm-vars.fd",
> > +        .cd = "tests/data/uefi-boot-images/bios-tables-test.aarch64.iso.qcow2",
> > +        .ram_start = 0x40000000ULL,
> > +        .scan_len = 128ULL * MiB,
> > +    };
> > +
> > +    test_acpi_one("-cpu cortex-a57 " "-device sbsa_gwdt", &data);  
> depends on the instantiation strategy, ie. whether Peter is OK with
> dynamic sysbus instantiation

machine option in v1 to do the same opened another can of worms
that I think consensus was it would be better go with -device. 

> 
> Thanks
> 
> Eric
> > +    free_test_data(&data);
> > +}
> > +
> >  static void test_acpi_q35_viot(void)
> >  {
> >      test_data data = {
> > @@ -2910,6 +2928,8 @@ int main(int argc, char *argv[])
> >              }
> >              qtest_add_func("acpi/virt/acpi-watchdog",
> >                             test_acpi_aarch64_virt_tcg_wdat);
> > +            qtest_add_func("acpi/virt/gwdt-watchdog",
> > +                           test_acpi_aarch64_virt_tcg_gtdt_wd);
> >          }
> >      } else if (strcmp(arch, "riscv64") == 0) {
> >          if (has_tcg && qtest_has_device("virtio-blk-pci")) {  
> 


