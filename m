Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B5DACD4F24
	for <qemu-arm@archiver.kernel.org>; Wed, 13 May 2026 15:28:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wNBVq-0007By-RP; Wed, 13 May 2026 11:28:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wNBVc-0006yt-9Z
 for qemu-arm@nongnu.org; Wed, 13 May 2026 11:28:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <mst@redhat.com>) id 1wNBVZ-0003VN-VE
 for qemu-arm@nongnu.org; Wed, 13 May 2026 11:28:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1778686087;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=vRpgOAZ7+0bePiQu9eN5bPZwH8rZureOkJxlzx2kRt0=;
 b=XMwwRP2q34cTAs2vgKOMOtUBaQLlZaMYzxEDxJQRSY8hQvzhErIq9oGZiLGXiv3wJCsuT+
 HwOa5Bh03dSzVCOn9ZfkmokXv1bI5bSAlomvIIIVvqM0eWU9MRRxDoh3KvUO71cdSBsWJm
 3nPumAhtneKafb+5ZS78VXWQ0H2M8b4=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-529-ouwkB992PriWFig7u03g2Q-1; Wed, 13 May 2026 11:28:06 -0400
X-MC-Unique: ouwkB992PriWFig7u03g2Q-1
X-Mimecast-MFC-AGG-ID: ouwkB992PriWFig7u03g2Q_1778686085
Received: by mail-ed1-f72.google.com with SMTP id
 4fb4d7f45d1cf-67fd8c53ccdso3764421a12.3
 for <qemu-arm@nongnu.org>; Wed, 13 May 2026 08:28:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1778686085; x=1779290885;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=vRpgOAZ7+0bePiQu9eN5bPZwH8rZureOkJxlzx2kRt0=;
 b=o6dkEu3TUvDxgVNUQIieUe0NzU3bn2An++xBTf0Fb9WF9By8HS4l0Afjl6e2QcgB2K
 pmU3vE51B4EonPJvZGjavtCMB0EYuzm5DWV4oVfKns2LxhnyBWDtjSDkZdaqZD1AxZFp
 tyfQ/YlX/5ycSDRDb8SU+Gf54wfapMP+UtEJ4LG++3uE4KAqyP/hNdSFIKGLax4hRwNo
 8XIpSHLJdHmQFZrT2aNnl6EApzN+H7l7VkZLNvfDIDy7dP+WmpjjENZQd1kagreptHgT
 lC2e95jIT/3oL0N7rt0oWePThydrt39e/cw9x7jVsHGUfTEKbUFLXBEELjXyINl2iG6x
 fPbw==
X-Forwarded-Encrypted: i=1;
 AFNElJ8yJJcciZKCy7tol2TeSYsuww06vY5aVUkDSI5dFayMvRk6L4V9Wlf2938ykAa0ZEd/3a4o5EY6yA==@nongnu.org
X-Gm-Message-State: AOJu0YylyhCc1s+n4YwfUMp7BoVCC+VjOdYilo8jNseHjhWym9fOBnvg
 ZRdwlu6oZyc0a609RLaeOoPqSmljVMBRNttSWmt02zxs47jHQJDjmxQlCO8/3HV57ypoOxKrQLM
 V8vRErY9880Csi3d0kT8prg75G95DH3Vb+ygGdCCB1GDdTXlfjr253Q==
X-Gm-Gg: Acq92OETKPef64z0RnkMRL8GsSO1PLjzmtJ2Hp/FzF2JiKdGR/9il89KvtFfzqSHn8k
 GhPize+5ECNMSi/DdjRY8zTxterH/MW2/2ruRM+IhsFbwFqX+N4bO5nhq/VCEtikEzUV6IezXoD
 NQD/gpR7l4IaJeMqdxeEKb6/zTiZZFZ0TANmUNE3ljMiIOQDbsDEZX/ZsOoaidfEbTDd4uqD9Fx
 FkQCHF19xj2TlZXJdyhwJHA14zboLwWJ6nvs1Z0MRF571IrompMQgRAyr7btuq/T8T9yxrsQYnb
 QMe5TK2/CZ1LKBSPd7OhoNhFs6vV5LfYJZdhbWC6WuBaWLt4C6dSg7UiFHNHu8YopbVl5bPX078
 Kf/YQY3HeexDtgY00HmNk2WU2kgSNtVhRhvKPyUhL
X-Received: by 2002:a17:907:388b:b0:bd1:d4e8:42a4 with SMTP id
 a640c23a62f3a-bd3bf77aca8mr270887266b.11.1778686085345; 
 Wed, 13 May 2026 08:28:05 -0700 (PDT)
X-Received: by 2002:a17:907:388b:b0:bd1:d4e8:42a4 with SMTP id
 a640c23a62f3a-bd3bf77aca8mr270881166b.11.1778686084558; 
 Wed, 13 May 2026 08:28:04 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-48-7.inter.net.il. [80.230.48.7])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-458b3664e3esm26206076f8f.3.2026.05.13.08.28.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 May 2026 08:28:04 -0700 (PDT)
Date: Wed, 13 May 2026 11:28:01 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Zhao Liu <zhao1.liu@intel.com>
Cc: Igor Mammedov <imammedo@redhat.com>, qemu-devel@nongnu.org,
 anisinha@redhat.com, pbonzini@redhat.com, peter.maydell@linaro.org,
 shannon.zhaosl@gmail.com, philmd@linaro.org, rad@semihalf.com,
 leif.lindholm@oss.qualcomm.com, qemu-arm@nongnu.org
Subject: Re: [PATCH v2 03/21] x86: q35: generate WDAT ACPI table
Message-ID: <20260513112745-mutt-send-email-mst@kernel.org>
References: <20260303092532.2410177-1-imammedo@redhat.com>
 <20260303092532.2410177-4-imammedo@redhat.com>
 <agSdBwKQh3C9UgdF@intel.com>
MIME-Version: 1.0
In-Reply-To: <agSdBwKQh3C9UgdF@intel.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: TohXQB7AL4RNuIoZow8gDfNWvEXyhBwKqaQRteaxd2c_1778686085
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=170.10.129.124; envelope-from=mst@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -24
X-Spam_score: -2.5
X-Spam_bar: --
X-Spam_report: (-2.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.445,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H4=0.001, RCVD_IN_MSPIKE_WL=0.001,
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

On Wed, May 13, 2026 at 11:47:19PM +0800, Zhao Liu wrote:
> On Tue, Mar 03, 2026 at 10:25:14AM +0100, Igor Mammedov wrote:
> > Date: Tue,  3 Mar 2026 10:25:14 +0100
> > From: Igor Mammedov <imammedo@redhat.com>
> > Subject: [PATCH v2 03/21] x86: q35: generate WDAT ACPI table
> > 
> > It will generate WDAT table [1] customized for TCO watchdog.
> > This allows Windows guests (Windows Server 2008/Vista+) to
> > use TCO watchdog using built-in generic driver, which
> > alleviates need to install vendor specific drivers.
> > 
> > Given that enabling it might change guest behaviour
> > (both Windows/Linux) the feature is disabled by default.
> > 
> > Users that need it can enable the feature with
> > following CLI option.
> >     -machine wdat=on
> > 
> > 1)
> >    "Hardware Watchdog Timers Design Specification"
> >     https://uefi.org/acpi 'Watchdog Action Table (WDAT)'
> > 
> > Signed-off-by: Igor Mammedov <imammedo@redhat.com>
> > Reviewed-by: Ani Sinha <anisinha@redhat.com>
> > ---
> >  include/hw/acpi/wdat-ich9.h | 15 +++++++
> >  hw/acpi/meson.build         |  3 +-
> >  hw/acpi/wdat-ich9-stub.c    | 15 +++++++
> >  hw/acpi/wdat-ich9.c         | 90 +++++++++++++++++++++++++++++++++++++
> >  hw/i386/acpi-build.c        | 12 +++++
> >  5 files changed, 134 insertions(+), 1 deletion(-)
> >  create mode 100644 include/hw/acpi/wdat-ich9.h
> >  create mode 100644 hw/acpi/wdat-ich9-stub.c
> >  create mode 100644 hw/acpi/wdat-ich9.c
> 
> ...
> 
> > +void build_ich9_wdat(GArray *table_data, BIOSLinker *linker, const char *oem_id,
> > +                     const char *oem_table_id, uint64_t tco_base)
> > +{
> > +    AcpiTable table = { .sig = "WDAT", .rev = 1, .oem_id = oem_id,
> > +                        .oem_table_id = oem_table_id };
> > +    struct AcpiGenericAddress tco_rld =  TCO_REG(tco_base, 0x0, 16);
> > +    struct AcpiGenericAddress tco2_sts = TCO_REG(tco_base, 0x6, 16);
> > +    struct AcpiGenericAddress tco1_cnt = TCO_REG(tco_base, 0x8, 16);
> > +    struct AcpiGenericAddress tco_tmr =  TCO_REG(tco_base, 0x12, 16);
> > +
> > +    acpi_table_begin(&table, table_data);
> > +    build_append_int_noprefix(table_data, 0x20, 4); /* Watchdog Header Length */
> > +    build_append_int_noprefix(table_data, 0xff, 2); /* PCI Segment */
> > +    build_append_int_noprefix(table_data, 0xff, 1); /* PCI Bus Number */
> > +    build_append_int_noprefix(table_data, 0xff, 1); /* PCI Device Number */
> > +    build_append_int_noprefix(table_data, 0xff, 1); /* PCI Function Number */
> > +    build_append_int_noprefix(table_data, 0, 3);    /* Reserved */
> > +    /*
> > +     * limits/resolution are defined by ICH9 TCO spec
> > +     */
> > +    build_append_int_noprefix(table_data, 0x258, 4);/* Timer Period, ms */
> > +    build_append_int_noprefix(table_data, 0x3ff, 4);/* Maximum Count */
> > +    build_append_int_noprefix(table_data, 0x4, 4);  /* Minimum Count */
> 
> Spec said: The time-out period before the WDT fires is recommended to be at
> least 5 minutes and is required to be less than 4,294,967,296 count
> intervals.
> 
> Here we encode 0x4 * 0x258 = 2400ms, less than 5 minutes. But I
> understand because "5 minutes" is just "recommanded" by spec, so 2400ms is
> okay.
> 
> LGTM,
> 
> Reviewed-by: Zhao Liu <zhao1.liu@intel.com>


maybe a comment why it's shorter?


