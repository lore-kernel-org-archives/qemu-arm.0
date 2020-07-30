Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp2859093lfy;
        Thu, 30 Jul 2020 12:35:44 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxvgej7+sqmS47yGwpAmglZYYVIgJdx+1UF6IWqL+c3Quj4pQqyxFH817ZH59cZhlQYl8xw
X-Received: by 2002:a25:da51:: with SMTP id n78mr772551ybf.80.1596137744553;
        Thu, 30 Jul 2020 12:35:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596137744; cv=none;
        d=google.com; s=arc-20160816;
        b=yOWRgtC8Npbtg7ZEDI3aCxtdQf2c9u9LpQF5ut2cQpcMnYcsdNUm/Yinr+08aXoJRh
         J9aX6lj8kFr9Je4SQaPy7/F7wTu8cQU/agAOQsbrZ3RxYngrGCCsnKbL7MnCp691X2JH
         m7StDrJL5Wp3EcsiTJYJEdn0FeqzvKgVRdNcZgHGqYDupIL4XSZE+KXP1cF3RZuOqwUz
         XBKE5+IqFwKqzYr8uKn8T+tSdJ0ZTP3ToCR42slfTY6OXDqrgh4fjeXlysJW7z53k0d4
         QE8OT4UH8uG8BRaJ3/TNjYnrXxwrtXNG6dapGt77iNUYohgLzJHNE4K37OPhcRv8KmZl
         Zd0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=6x9JhPsGfgHqyEvcYKNefqz/dAP1WP+OAFZOES+jKAE=;
        b=bpBaQhEk9mBiKyOeQp9/YlGInTI5wVpqYsguHOeUx8mre4Ixiy5fN0Sn81l9y3o2Lo
         /tlOIr3X8kQXcm01NbzzoGgzTH7Zmv6pvITXOES1aKs+cxikLtu9TA7S/Lzs1taZEBGI
         OZT6hR9BwccH7zvOQews8YrwWlmc2r7boNFdbx6da9Ug9ltwmNqD+gOy3gdWISd3HMuA
         tz5svbDVPRbMT2X2go6vOJnrrRqZ1Z01ba7aTAH6WVQiZEdOKFdms1Hf/+D3pwHAw7Lz
         1ly+XuryljOnwcaelTr9EFN9BYQuqE2HuFHz8Ee9is+72eQm7gqHhl13V9+Mv/XQzrD9
         KQdw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ca9WFQuf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id v64si5423884ybc.490.2020.07.30.12.35.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jul 2020 12:35:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=ca9WFQuf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:49974 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k1EL9-0002ua-Sm
	for alex.bennee@linaro.org; Thu, 30 Jul 2020 15:35:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56440)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1k1EKv-0002rT-Oq
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 15:35:29 -0400
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:42266
 helo=us-smtp-delivery-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <lersek@redhat.com>) id 1k1EKt-0004XL-Vr
 for qemu-arm@nongnu.org; Thu, 30 Jul 2020 15:35:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596137726;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6x9JhPsGfgHqyEvcYKNefqz/dAP1WP+OAFZOES+jKAE=;
 b=ca9WFQufUrgxWxehmPE2maEJOQc2Tya/rovGz02g8ri56Ma4Irofgj0h/S+jNFgBrcSc55
 Ta0T+YQiYrdBZWVrE6Amyy9TW6hlPG4a7vw+oumdBYFrjrzuxdIG3/V9ng61H9gx3DhS0x
 x0KPlehnIWjs5i6n0iGcHCmx5ku8Zog=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-246-J9lINLiGPnuZL-FUzEiFZQ-1; Thu, 30 Jul 2020 15:35:23 -0400
X-MC-Unique: J9lINLiGPnuZL-FUzEiFZQ-1
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id D38C4800473;
 Thu, 30 Jul 2020 19:35:21 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-114-173.ams2.redhat.com
 [10.36.114.173])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D91FC1002393;
 Thu, 30 Jul 2020 19:35:16 +0000 (UTC)
Subject: Re: [PATCH 2/2] arm/acpi: fix an out of spec _UID for PCI root
To: "Michael S. Tsirkin" <mst@redhat.com>, qemu-devel@nongnu.org
References: <20200730155755.188845-1-mst@redhat.com>
 <20200730155755.188845-2-mst@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <bcd381a8-d9a2-178c-c25f-4aff26dbe992@redhat.com>
Date: Thu, 30 Jul 2020 21:35:16 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Firefox/52.0 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20200730155755.188845-2-mst@redhat.com>
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.61; envelope-from=lersek@redhat.com;
 helo=us-smtp-delivery-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/30 03:41:52
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>, Shannon Zhao <shannon.zhaosl@gmail.com>,
 qemu-arm@nongnu.org, Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Igor Mammedov <imammedo@redhat.com>,
 vit9696 <vit9696@protonmail.com>, Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Kfg6n7pjwFZh

On 07/30/20 17:58, Michael S. Tsirkin wrote:
> On ARM/virt machine type QEMU currently reports an incorrect _UID in
> ACPI.
> 
> The particular node in question is the primary PciRoot (PCI0 in ACPI),
> which gets assigned PCI0 in ACPI UID and 0 in the
> DevicePath. This is due to the _UID assigned to it by build_dsdt in
> hw/arm/virt-acpi-build.c Which does not correspond to the primary PCI
> identifier given by pcibus_num in hw/pci/pci.c
> 
> In UEFI v2.8, section "10.4.2 Rules with ACPI _HID and _UID" ends with
> the paragraph,
> 
>     Root PCI bridges will use the plug and play ID of PNP0A03, This will
>     be stored in the ACPI Device Path _HID field, or in the Expanded
>     ACPI Device Path _CID field to match the ACPI name space. The _UID
>     in the ACPI Device Path structure must match the _UID in the ACPI
>     name space.
> 
> (See especially the last sentence.)
> 
> A similar bug has been reported on i386, on that architecture it has
> been reported to confuse at least macOS which uses ACPI UIDs to build
> the DevicePath for NVRAM boot options, while OVMF firmware gets them via
> an internal channel through QEMU.  When UEFI firmware and ACPI have
> different values, this makes the underlying operating system unable to
> report its boot option.
> 
> Reported-by: vit9696 <vit9696@protonmail.com>
> Signed-off-by: Michael S. Tsirkin <mst@redhat.com>
> ---
> 
> Peter can you either ack or merge this one pls?
> 
>  hw/arm/virt-acpi-build.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 91f0df7b13..0a482ff6f7 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -170,7 +170,7 @@ static void acpi_dsdt_add_pci(Aml *scope, const MemMapEntry *memmap,
>      aml_append(dev, aml_name_decl("_CID", aml_string("PNP0A03")));
>      aml_append(dev, aml_name_decl("_SEG", aml_int(0)));
>      aml_append(dev, aml_name_decl("_BBN", aml_int(0)));
> -    aml_append(dev, aml_name_decl("_UID", aml_string("PCI0")));
> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
>      aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")));
>      aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
>  
> 

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

(Vitaly's full name could be included in the Reported-by here as well,
arguably.)

Thanks!
Laszlo

