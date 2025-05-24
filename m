Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp3137294njc;
        Sat, 24 May 2025 03:55:15 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWEq6pxrDCM4b3Z1Qacik3EtRGNEsa2FP3SN99k45U33rYYIsl5Ir6HbK3o9QIYApDUbDFJxoUKQwYxFQ==@linaro.org
X-Google-Smtp-Source: AGHT+IGmm+CBqiBD+kcLiDwV+skH0LpWU5HGOvJX70w/NFQtPOOsrDK9sdeV72xFkwhgqPrwzh61
X-Received: by 2002:a05:622a:4887:b0:494:a241:66b with SMTP id d75a77b69052e-49f32b864e3mr47996441cf.2.1748084115378;
        Sat, 24 May 2025 03:55:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1748084115; cv=none;
        d=google.com; s=arc-20240605;
        b=evbUXoE/o6OTMbqCDei8kYTGU/bDbGnpPC5gJDqZ4EQy6pfUesnFYwnHiGoOn1CLED
         5NEaDC21CWbMVjwbNkDgJ8m0x+aHYL3pEX4x3J6L/ewcKJzq84crff+m/SHyeAX/vlgl
         RulADiJJZqFoNhaAE12VK89mbU5t9WikReAr8GQyMxjyfuYm//oVCshThRtXj1Qom/jY
         1C5M+Ao7jVnm2rMZ8akIDmKXkFlUmREp2SfgACuPfCXTxZaxiFsjvnRukKpL6ACbE0hi
         n0aAznyYGWaXLxmAUgYG9GMpejPAXGRsOOK+65BdNLtJErQLMF+nbINfuOeJRf+Hnt7c
         189w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=FM8zIdqMag/fILXWK49jB4inIeNGGe7lrWhZ9Yj9lIU=;
        fh=CMSczq6sRyi7XzDewjECZS90Nesq8JvGImW8UPH/V8M=;
        b=ON3tQtzaw2+9x1ig/yRaS6v0kX/FKLZfqFdZ66TG6Vekk6ypMiX+WMN1AMlPWttX+v
         6wR2wuwdvITpgGBeyxkh/aRhB7CtevzHAdjvfQA8yhbO80p32/V/ZN6ct2jqA2ws/1uU
         S8R1ViwEc0+OfgvmWB541kjsqAaPyazfMU3ZnyBaWjoKAl8TF3JQWPXwTyu/oIhSKxnK
         oOBvh/FSGa8N1vVOqxB8axnDn2adpxee3KrqXiLdEEoYVGhNBFK34cpP9/iVWZsQQ/9H
         id01MFsjohOWyzU9unDVACxi5j4ES7gVqgn+wwkxjvN76hqV8QFhMuTTNdh0yMJ27mku
         tDhw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FauC8kxZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-494ae55fdedsi194823531cf.205.2025.05.24.03.55.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 24 May 2025 03:55:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=FauC8kxZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=QUARANTINE sp=QUARANTINE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uImWi-0006Qf-Rz; Sat, 24 May 2025 06:54:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1uImWg-0006QH-B6
 for qemu-arm@nongnu.org; Sat, 24 May 2025 06:54:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1uImWe-0004wA-8O
 for qemu-arm@nongnu.org; Sat, 24 May 2025 06:54:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1748084085;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FM8zIdqMag/fILXWK49jB4inIeNGGe7lrWhZ9Yj9lIU=;
 b=FauC8kxZzTg97otUCGpSOjc/Mvld7iiamGWUw8B51dRGBFh+Dd86DUZiYdzvvxPTPY9DrX
 3HavDLHrDQtSwnPR78+01ytsCwoDIsHPtszB+Sd3gntNf+NgCk6vjIn2w6xZGEWnY6agx+
 /ZEWVe2kkqiFvFkkBZRcozOOqgtD0Fo=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-302-4cnHgN31P3ykgzaDtOm7Ug-1; Sat, 24 May 2025 06:54:44 -0400
X-MC-Unique: 4cnHgN31P3ykgzaDtOm7Ug-1
X-Mimecast-MFC-AGG-ID: 4cnHgN31P3ykgzaDtOm7Ug_1748084083
Received: by mail-wr1-f72.google.com with SMTP id
 ffacd0b85a97d-3a364802ec5so409717f8f.0
 for <qemu-arm@nongnu.org>; Sat, 24 May 2025 03:54:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748084083; x=1748688883;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=FM8zIdqMag/fILXWK49jB4inIeNGGe7lrWhZ9Yj9lIU=;
 b=O8i0wh/5n8daETronECc4dR00h3MXIdChMsdI3BYqBFjAa5Vkb6HvRzAyoUsaa/1E6
 ltfOE04sgsCifh1Uzx3wzppmSzgAzwHVZobnOXIPgdAsQTx0KskZZn538Po+yUwcP2+r
 umDGAlhQvMSwAflS+P7GmDXr1LgCZpu/MWd9Y8gWtCZDD+fvxIAIRb7BAqEA+kzYJ42+
 ZdJSSce9y9YoRp3rTQoNXihITNxNaIDyhi22XDHbZLDZQpn7pq5F9rZeNrZ5Dp7YS4VQ
 D1jvabXm2bxacCHqG3eyBnyJY7QMCFlnb7Kdi2FEE3YBXurBpowT8HLWrRTHBqUYO9tg
 m0EQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUhFNpJYudc58FPJR+DXOotZ+d2nbQv+hIexnjVrL1xZGSpKECLzAJhmcxE7S6pObIt0TDtibl3tA==@nongnu.org
X-Gm-Message-State: AOJu0YzrfnNSqWbuCKmDyUv4o1mzpsz9t4gISPBUDBkGEwpRjV3cuZkB
 b4J6RsYE/18tYyqOuXdmemVSe4pGkzndKz5rr6BbCU+vucJyzbF1uczV6ohn8MPXfHByUrJ4hb7
 bGycCyONlE9VWwKutmN3wdhvXUBzmphYWWyoZqnmY3fqfS7EEjz1PGxvAzE2vLQ==
X-Gm-Gg: ASbGncvud885XJb+M233gb2+MACCcgqz9SA2Ei7ba+KjlTOYuxcRS6hs8s1TzeWtxDP
 zDluOSaqmyH6YRT6NCDpV7iKXhP3AaplctF0DVtvkq3n4GUhRUIx2ztLUtGXoIfE7PBGlcHRVZT
 bUwTicq6NNqsCHnM0O9VVoJ+U4j7j8tvs14qFkeDSnIDmLkw6wmHs3ltTSw1oheukvSDUUBSXeS
 ILMAgAE+r4E+aKxJY0BY0YjRbQYSK11gdIv1DtMPcKsfeqHmiGcW8U+yk94L1N9jk4RTlTRIqXD
 Qf+mHg==
X-Received: by 2002:a05:6000:4023:b0:3a3:621a:d3c2 with SMTP id
 ffacd0b85a97d-3a4cb49f1a6mr2013454f8f.58.1748084082786; 
 Sat, 24 May 2025 03:54:42 -0700 (PDT)
X-Received: by 2002:a05:6000:4023:b0:3a3:621a:d3c2 with SMTP id
 ffacd0b85a97d-3a4cb49f1a6mr2013443f8f.58.1748084082307; 
 Sat, 24 May 2025 03:54:42 -0700 (PDT)
Received: from redhat.com ([2a0d:6fc0:1517:1000:ea83:8e5f:3302:3575])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3a4c002e937sm6976914f8f.29.2025.05.24.03.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 24 May 2025 03:54:41 -0700 (PDT)
Date: Sat, 24 May 2025 06:54:38 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Cc: Gustavo Romero <gustavo.romero@linaro.org>, eric.auger.pro@gmail.com,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 peter.maydell@linaro.org, imammedo@redhat.com, anisinha@redhat.com,
 shannon.zhaosl@gmail.com, pbonzini@redhat.com,
 Jonathan.Cameron@huawei.com, philmd@linaro.org
Subject: Re: [PATCH 08/22] hw/pci-host/gpex-acpi: Use
 build_pci_host_bridge_osc_method
Message-ID: <20250524065230-mutt-send-email-mst@kernel.org>
References: <20250514170431.2786231-1-eric.auger@redhat.com>
 <20250514170431.2786231-9-eric.auger@redhat.com>
 <e1ec0e15-ad26-456b-a8d7-16f683290651@linaro.org>
 <ed823ddc-6faa-42dc-bae5-c765d21c3cca@redhat.com>
MIME-Version: 1.0
In-Reply-To: <ed823ddc-6faa-42dc-bae5-c765d21c3cca@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: DJ2ELQdBl6JpgzopM0ZohUCq6pJwP6j3imued_uYfpc_1748084083
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -23
X-Spam_score: -2.4
X-Spam_bar: --
X-Spam_report: (-2.4 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.298,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED=0.001, RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001,
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
X-TUID: KqXe2iEI9Qg/

On Wed, May 21, 2025 at 06:12:34PM +0200, Eric Auger wrote:
> Hi Gustavo,
> 
> On 5/20/25 4:09 PM, Gustavo Romero wrote:
> > Hi Eric,
> >
> > On 5/14/25 14:00, Eric Auger wrote:
> >> gpex build_host_bridge_osc() and x86 originated
> >> build_pci_host_bridge_osc_method() are mostly identical.
> >>
> >> In GPEX, SUPP is set to CDW2 but is not further used. CTRL
> >> is same as Local0.
> >>
> >> So let gpex code reuse build_pci_host_bridge_osc_method()
> >> and remove build_host_bridge_osc().
> >>
> >> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> >>
> >> ---
> >>
> >> The DSDT diff  is given below:
> >> diff --git a/dsdt.dsl_before b/dsdt.dsl_after_osc_change
> >> index 3224a56..fa7558e 100644
> >> --- a/dsdt.dsl_before
> >> +++ b/dsdt.dsl_after_osc_change
> >> @@ -5,13 +5,13 @@
> >>    *
> >>    * Disassembling to symbolic ASL+ operators
> >>    *
> >> - * Disassembly of dsdt.dat, Mon Apr  7 05:33:06 2025
> >> + * Disassembly of dsdt.dat, Mon Apr  7 05:37:20 2025
> >>    *
> >>    * Original Table Header:
> >>    *     Signature        "DSDT"
> >> - *     Length           0x00001A4F (6735)
> >> + *     Length           0x00001A35 (6709)
> >>    *     Revision         0x02
> >> - *     Checksum         0xBF
> >> + *     Checksum         0xDD
> >>    *     OEM ID           "BOCHS "
> >>    *     OEM Table ID     "BXPC    "
> >>    *     OEM Revision     0x00000001 (1)
> >> @@ -1849,27 +1849,26 @@ DefinitionBlock ("", "DSDT", 2, "BOCHS ",
> >> "BXPC    ", 0x00000001)
> >>                   {
> >>                       CreateDWordField (Arg3, 0x04, CDW2)
> >>                       CreateDWordField (Arg3, 0x08, CDW3)
> >> -                    SUPP = CDW2 /* \_SB_.PCI0._OSC.CDW2 */
> >> -                    CTRL = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
> >> -                    CTRL &= 0x1F
> >> +                    Local0 = CDW3 /* \_SB_.PCI0._OSC.CDW3 */
> >> +                    Local0 &= 0x1F
> >>                       If ((Arg1 != One))
> >>                       {
> >>                           CDW1 |= 0x08
> >>                       }
> >>
> >> -                    If ((CDW3 != CTRL))
> >> +                    If ((CDW3 != Local0))
> >>                       {
> >>                           CDW1 |= 0x10
> >>                       }
> >>
> >> -                    CDW3 = CTRL /* \_SB_.PCI0.CTRL */
> >> -                    Return (Arg3)
> >> +                    CDW3 = Local0
> >>                   }
> >>                   Else
> >>                   {
> >>                       CDW1 |= 0x04
> >> -                    Return (Arg3)
> >>                   }
> >> +
> >> +                Return (Arg3)
> >>               }
> >>
> >>               Method (_DSM, 4, NotSerialized)  // _DSM:
> >> Device-Specific Method
> >
> > The problem I face with diffs in the commit body is that tools like
> > b4, which are
> > based on git am, get very confused on how to handle it. I'm surprised
> > nobody ever
> > complained about it. I'm wondering if there is any catch on it,
> > because I have to
> > edit commits like this manually, removing the diff, to make it finally
> > apply to
> > the series. Anyways, do you mind at least removing the valid diff
> > header, like:
> >
> >> diff --git a/dsdt.dsl_before b/dsdt.dsl_after_osc_change
> >> index 3224a56..fa7558e 100644
> >> --- a/dsdt.dsl_before
> >> +++ b/dsdt.dsl_after_osc_change
> >
> > from the commit message so it doesn't confuse b4?
> Thank you for reporting the issue. in tests/qtest/bios-tables-test.c it
> is written at the top that we shall put the diffs in disasembled ACPI
> content in the commit msg. I will look for previously landed patches and
> see whether the current layout can be fixed.
> 
> Cheers
> 
> Eric


Eric, to clarify, the diff is supposed to go into commit log,
not after ---.
This will make it apply cleanly.
Also, removing the "index" line as well as date diff at least is a good
idea: the diff should be clean, not include irrelevant information.

Pls feel free to clarify the text in tests/qtest/bios-tables-test.c



> >
> >
> >> ---
> >>   hw/pci-host/gpex-acpi.c | 60 +++--------------------------------------
> >>   1 file changed, 4 insertions(+), 56 deletions(-)
> >>
> >> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> >> index f1ab30f3d5..98c9868c3f 100644
> >> --- a/hw/pci-host/gpex-acpi.c
> >> +++ b/hw/pci-host/gpex-acpi.c
> >> @@ -50,60 +50,7 @@ static void acpi_dsdt_add_pci_route_table(Aml
> >> *dev, uint32_t irq,
> >>       }
> >>   }
> >>   -static Aml *build_host_bridge_osc(bool enable_native_pcie_hotplug)
> >> -{
> >> -    Aml *method, *UUID, *ifctx, *ifctx1, *elsectx;
> >> -
> >> -    method = aml_method("_OSC", 4, AML_NOTSERIALIZED);
> >> -    aml_append(method,
> >> -        aml_create_dword_field(aml_arg(3), aml_int(0), "CDW1"));
> >> -
> >> -    /* PCI Firmware Specification 3.0
> >> -     * 4.5.1. _OSC Interface for PCI Host Bridge Devices
> >> -     * The _OSC interface for a PCI/PCI-X/PCI Express hierarchy is
> >> -     * identified by the Universal Unique IDentifier (UUID)
> >> -     * 33DB4D5B-1FF7-401C-9657-7441C03DD766
> >> -     */
> >> -    UUID = aml_touuid("33DB4D5B-1FF7-401C-9657-7441C03DD766");
> >> -    ifctx = aml_if(aml_equal(aml_arg(0), UUID));
> >> -    aml_append(ifctx,
> >> -        aml_create_dword_field(aml_arg(3), aml_int(4), "CDW2"));
> >> -    aml_append(ifctx,
> >> -        aml_create_dword_field(aml_arg(3), aml_int(8), "CDW3"));
> >> -    aml_append(ifctx, aml_store(aml_name("CDW2"), aml_name("SUPP")));
> >> -    aml_append(ifctx, aml_store(aml_name("CDW3"), aml_name("CTRL")));
> >> -
> >> -    /*
> >> -     * Allow OS control for SHPCHotplug, PME, AER, PCIeCapability,
> >> -     * and PCIeHotplug depending on enable_native_pcie_hotplug
> >> -     */
> >> -    aml_append(ifctx, aml_and(aml_name("CTRL"),
> >> -               aml_int(0x1E | (enable_native_pcie_hotplug ? 0x1 :
> >> 0x0)),
> >> -               aml_name("CTRL")));
> >> -
> >> -    ifctx1 = aml_if(aml_lnot(aml_equal(aml_arg(1), aml_int(0x1))));
> >> -    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x08),
> >> -                              aml_name("CDW1")));
> >> -    aml_append(ifctx, ifctx1);
> >> -
> >> -    ifctx1 = aml_if(aml_lnot(aml_equal(aml_name("CDW3"),
> >> aml_name("CTRL"))));
> >> -    aml_append(ifctx1, aml_or(aml_name("CDW1"), aml_int(0x10),
> >> -                              aml_name("CDW1")));
> >> -    aml_append(ifctx, ifctx1);
> >> -
> >> -    aml_append(ifctx, aml_store(aml_name("CTRL"), aml_name("CDW3")));
> >> -    aml_append(ifctx, aml_return(aml_arg(3)));
> >> -    aml_append(method, ifctx);
> >> -
> >> -    elsectx = aml_else();
> >> -    aml_append(elsectx, aml_or(aml_name("CDW1"), aml_int(4),
> >> -                               aml_name("CDW1")));
> >> -    aml_append(elsectx, aml_return(aml_arg(3)));
> >> -    aml_append(method, elsectx);
> >> -    return method;
> >> -}
> >> -
> >> -static Aml *build_host_bridge_dsm(void)
> >> +static Aml *build_pci_host_bridge_dsm_method(void)
> >>   {
> >>       Aml *method = aml_method("_DSM", 4, AML_NOTSERIALIZED);
> >>       Aml *UUID, *ifctx, *ifctx1, *buf;
> >> @@ -134,8 +81,9 @@ static void acpi_dsdt_add_host_bridge_methods(Aml
> >> *dev,
> >>       aml_append(dev, aml_name_decl("SUPP", aml_int(0)));
> >>       aml_append(dev, aml_name_decl("CTRL", aml_int(0)));
> >>       /* Declare an _OSC (OS Control Handoff) method */
> >> -    aml_append(dev, build_host_bridge_osc(enable_native_pcie_hotplug));
> >> -    aml_append(dev, build_host_bridge_dsm());
> >> +    aml_append(dev,
> >> +              
> >> build_pci_host_bridge_osc_method(enable_native_pcie_hotplug));
> >> +    aml_append(dev, build_pci_host_bridge_dsm_method());
> >>   }
> >>     void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
> >
> > Otherwise:
> >
> > Reviewed-by: Gustavo Romero <gustavo.romero@linaro.org>
> >
> >
> > Cheers,
> > Gustavo
> >

