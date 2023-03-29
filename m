Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp643542ejb;
        Wed, 29 Mar 2023 09:56:27 -0700 (PDT)
X-Google-Smtp-Source: AKy350an0pihSMEMuRD8s5QVS5R6pekNrJnZKREhqJPPHMv7SRf65lUockuKppRfBlBpYbwLycyG
X-Received: by 2002:ac8:7d95:0:b0:3e4:e456:6eb with SMTP id c21-20020ac87d95000000b003e4e45606ebmr16652350qtd.33.1680108987372;
        Wed, 29 Mar 2023 09:56:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1680108987; cv=none;
        d=google.com; s=arc-20160816;
        b=olugqV7KuKWNaFJtyDQ6fFd/5gcpbw5Cd5UurDPM7pp63PNN9SQgU3iIw4uPbhhbi0
         beMX67ZQV5D0wj0PuBdLuEdsw7GwOpw+EAHKNc+we8P6HDHii4iHPpysmN5e1k4urfou
         T9/8dkEhlRvTFox/SFsw/sXOV550wNYBxfp6OAYEuKRNROkvMxekaaAJP2DL+J1FisYN
         A+6aAHbnkeRbm0tjDELmi4C2e0ku490zG013Kfn4BeuoMNwzeMjlgvgFgUgrLyTbFI44
         ZLVZbtnd6ehhoTfzxbD2oI4c35L4eV+R3H1QPCGw0kD91HrRSgZuEdSzSUA9sZmGVoc6
         qGsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-disposition:in-reply-to:mime-version:references:message-id
         :subject:cc:to:from:date:dkim-signature;
        bh=1CKIEZQy8poSRwuqCLaqwW2a1LiKk5FSNOWDECIAAxg=;
        b=h4lkrPsgrlfbM3I42NUmJ2CmjYmxs8kOJCF0qVCWX7mohxY5MV7IKwemjDAvWDnRGB
         36aHAZRE8IXR75xU8vEtlXJtBPVGM+uAAQJlXvK5WMTEzSL26Vgbz2ZUkJWJ/+OPO8Ct
         34J1xzmRBVXyBbCwbsIXWBhT5gg4ryuDM+DFrPK0/8QkW/JA0qN8+7nZhN8t28dlCnb5
         lt9hmr80Sdo5p/FY/pkllbXy8JvomPuP2ULB1tEJ0qY1AF+4xpd4Xhb5zHylpTiWlvwN
         wOuhhRcF8U4GrSngYHQw1es9uT/eTguZEfZT4eObxAvVKWPiHb9b8p+leMPrSae6fRD9
         q7Rg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UtP+arj6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4-20020ac85a84000000b003e305a3a872si17619467qtc.220.2023.03.29.09.56.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 Mar 2023 09:56:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=UtP+arj6;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1phZ5e-0003Ss-Hx; Wed, 29 Mar 2023 12:56:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1phZ5c-0003SN-5f
 for qemu-arm@nongnu.org; Wed, 29 Mar 2023 12:56:00 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1phZ5a-0001zx-IS
 for qemu-arm@nongnu.org; Wed, 29 Mar 2023 12:55:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680108957;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1CKIEZQy8poSRwuqCLaqwW2a1LiKk5FSNOWDECIAAxg=;
 b=UtP+arj6vHpNJXSvksOPxvYT4mkBWDnojzJhNvGWu5COLsvGK1xfQboXHwuLb0faz7B3zV
 AHfIpTFcBH1WbG64RedQabNPRceJJUFs25Vky4KKgf/EzVZzEcXArVVweEpfcgufKzWtrM
 JqK+/2oD/Cdo4GnPrZfm9rv6gTHc3vU=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-380-WOsewSySNUy4TBg1sMnCuA-1; Wed, 29 Mar 2023 12:55:56 -0400
X-MC-Unique: WOsewSySNUy4TBg1sMnCuA-1
Received: by mail-wm1-f69.google.com with SMTP id
 l18-20020a05600c1d1200b003ef7b61e2fdso2376631wms.4
 for <qemu-arm@nongnu.org>; Wed, 29 Mar 2023 09:55:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680108954;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=1CKIEZQy8poSRwuqCLaqwW2a1LiKk5FSNOWDECIAAxg=;
 b=6/x+t/wwsJce2ECXJNn9eI7UMvaNAUbPI9kLRCkEm4gGfJSQtuOZfDKjhQr8VvuXzW
 YypPz5qCa08MXPcgu48Hio8/q44kjG6d+epmQDO5tCZtcgTMq3wp0HgWcEabR/d+gSj3
 xHG5UtG/H9SRRgOQtha5s8GzRV924IZOeLxrhGg/h7VwwZDwvdfPgtWPKZqGR7zq5UHS
 VzKttXIBRSOZs5GpNknlbVCWLurah9MNSs99nxIQesCPot91mpuwqRC0/ndEtGlnwjT6
 w0k9hd3sViQrMjveBo+ZGeLrGdrsn9mZqAszrkwhRyJGvFR6N/sycB8mL2tP0B3bmUuj
 obzQ==
X-Gm-Message-State: AAQBX9dLaow/b+lEurQm7akkLEwGHg8jk6rstS2g63okrUruPB2xLn/s
 DxwqohsOPm1UZHKI0HYJyRmY6eJWYuL+HmKMJGRtIzqL3QBkxubrCyRQ5CDf8yjgqf9OUdI2QP7
 +5peIV+ecGO4E
X-Received: by 2002:adf:db4b:0:b0:2d9:eb77:90d2 with SMTP id
 f11-20020adfdb4b000000b002d9eb7790d2mr14829278wrj.70.1680108954623; 
 Wed, 29 Mar 2023 09:55:54 -0700 (PDT)
X-Received: by 2002:adf:db4b:0:b0:2d9:eb77:90d2 with SMTP id
 f11-20020adfdb4b000000b002d9eb7790d2mr14829264wrj.70.1680108954299; 
 Wed, 29 Mar 2023 09:55:54 -0700 (PDT)
Received: from redhat.com ([2.52.18.165]) by smtp.gmail.com with ESMTPSA id
 d9-20020adfe889000000b002d97529b3bbsm20353314wrm.96.2023.03.29.09.55.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Mar 2023 09:55:53 -0700 (PDT)
Date: Wed, 29 Mar 2023 12:55:49 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Eric DeVolder <eric.devolder@oracle.com>
Cc: shannon.zhaosl@gmail.com, imammedo@redhat.com, ani@anisinha.ca,
 peter.maydell@linaro.org, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, marcel.apfelbaum@gmail.com,
 pbonzini@redhat.com, richard.henderson@linaro.org,
 eduardo@habkost.net, boris.ostrovsky@oracle.com
Subject: Re: [PATCH 2/2] hw/acpi: i386: bump MADT to revision 5
Message-ID: <20230329125543-mutt-send-email-mst@kernel.org>
References: <20230328155926.2277-1-eric.devolder@oracle.com>
 <20230328155926.2277-3-eric.devolder@oracle.com>
 <20230329010126-mutt-send-email-mst@kernel.org>
 <b9fcf584-8c83-9d56-c67a-b830b17c1272@oracle.com>
 <5ff9199b-0149-45dc-6138-3ad9b2d71fd3@oracle.com>
MIME-Version: 1.0
In-Reply-To: <5ff9199b-0149-45dc-6138-3ad9b2d71fd3@oracle.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: RrRqojXmDUqh

On Wed, Mar 29, 2023 at 08:19:22AM -0500, Eric DeVolder wrote:
> 
> 
> On 3/29/23 08:16, Eric DeVolder wrote:
> > 
> > 
> > On 3/29/23 00:03, Michael S. Tsirkin wrote:
> > > On Tue, Mar 28, 2023 at 11:59:26AM -0400, Eric DeVolder wrote:
> > > > Currently i386 QEMU generates MADT revision 3, and reports
> > > > MADT revision 1. ACPI 6.3 introduces MADT revision 5.
> > > > 
> > > > For MADT revision 4, that introduces ARM GIC structures, which do
> > > > not apply to i386.
> > > > 
> > > > For MADT revision 5, the Local APIC flags introduces the Online
> > > > Capable bitfield.
> > > > 
> > > > Making MADT generate and report revision 5 will solve problems with
> > > > CPU hotplug (the Online Capable flag indicates hotpluggable CPUs).
> > > > 
> > > > Signed-off-by: Eric DeVolder <eric.devolder@oracle.com>
> > > 
> > > I am looking for ways to reduce risk of breakage with this.
> > > We don't currently have a reason to change it if cpu
> > > hotplug is off, do we? Maybe make it conditional on that.
> > 
> > By "cpu hotplug off", do you mean, for example, no maxcpus= option?
> > In other words, how should I detect "cpu hotplug off"?
> > eric
> > 
> 
> Actually, if, for example, one had -smp 30,maxcpus=32, then there would be
> two hotpluggable cpus reported, the last two with the Enabled=0 and Online
> Capable=1. If one had -smp 32 (ie "cpu hotplug off"), then all cpus would be
> reported as Enabled and no cpu would have its Online Capable flag set.
> 
> Granted in both cases, MADT.revision would report 5, but it would still be accurate.
> 
> eric

sounds good.

> > > 
> > > 
> > > 
> > > 
> > > 
> > > > ---
> > > >   hw/i386/acpi-common.c | 13 ++++++++++---
> > > >   1 file changed, 10 insertions(+), 3 deletions(-)
> > > > 
> > > > diff --git a/hw/i386/acpi-common.c b/hw/i386/acpi-common.c
> > > > index 52e5c1439a..1e3a13a36c 100644
> > > > --- a/hw/i386/acpi-common.c
> > > > +++ b/hw/i386/acpi-common.c
> > > > @@ -38,8 +38,15 @@ void pc_madt_cpu_entry(int uid, const CPUArchIdList *apic_ids,
> > > >   {
> > > >       uint32_t apic_id = apic_ids->cpus[uid].arch_id;
> > > >       /* Flags – Local APIC Flags */
> > > > -    uint32_t flags = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
> > > > -                     1 /* Enabled */ : 0;
> > > > +    bool enabled = apic_ids->cpus[uid].cpu != NULL || force_enabled ?
> > > > +                     true /* Enabled */ : false;
> > > > +    /*
> > > > +     * ACPI 6.3 5.2.12.2 Local APIC Flags: OnlineCapable must be 0
> > > > +     * if Enabled is set.
> > > > +     */
> > > > +    bool onlinecapable = enabled ? false : true; /* Online Capable */
> > > > +    uint32_t flags = onlinecapable ? 0x2 : 0x0 |
> > > > +        enabled ? 0x1 : 0x0;
> > > >       /* ACPI spec says that LAPIC entry for non present
> > > >        * CPU may be omitted from MADT or it must be marked
> > > > @@ -102,7 +109,7 @@ void acpi_build_madt(GArray *table_data, BIOSLinker *linker,
> > > >       MachineClass *mc = MACHINE_GET_CLASS(x86ms);
> > > >       const CPUArchIdList *apic_ids = mc->possible_cpu_arch_ids(MACHINE(x86ms));
> > > >       AcpiDeviceIfClass *adevc = ACPI_DEVICE_IF_GET_CLASS(adev);
> > > > -    AcpiTable table = { .sig = "APIC", .rev = 1, .oem_id = oem_id,
> > > > +    AcpiTable table = { .sig = "APIC", .rev = 5, .oem_id = oem_id,
> > > >                           .oem_table_id = oem_table_id };
> > > >       acpi_table_begin(&table, table_data);
> > > > -- 
> > > > 2.31.1
> > > > 
> > > > 
> > > > 
> > > 

