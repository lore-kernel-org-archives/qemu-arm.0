Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3351537lfy;
        Fri, 31 Jul 2020 02:40:35 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwAN/nJh6miD6/+tjeID5JWzFmFFJAfAhhWDOqbCV4t/EhAjIG51JcJMgpt5z0y+xt9+i52
X-Received: by 2002:a25:d4b:: with SMTP id 72mr5183509ybn.22.1596188435262;
        Fri, 31 Jul 2020 02:40:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596188435; cv=none;
        d=google.com; s=arc-20160816;
        b=UtCratWfvsxL0ogLyY0UlgHeWJTMJHoFk6Xi1lRueqWHtsGE4K5//iLqi76MY31EiD
         t+rCIc/dJozDHjXzzvn8Wq06Va5XM1D6PSVv7lsRBihtgSbirWBd2lYEYsMAyqHqSfz/
         m/n47xDs4IoZfEgcwhljWfStJSSJZJNu6V/tpasR9gAfWQmYcHLhDWOTfvlDns3VAQ6e
         rw+aoDnF20w9F+MvElpWOTgQZWqanr2nfXDpmts3bsGO775hsJzteJUcg9zRsTPKAl8v
         KpFmNe+sDxSRcg4qwuN8U5aTZzCT6ZkeZF88TaUzia4dtgisaVV9HdmJ0x7Km/2QWvWX
         cECQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=4wbVNQOzoIXN8geB73F0yfgzsn0haLtpd4qkPqDXwCs=;
        b=qnsFKLcJ63EWSBqa+R+LE8Uq7g2iHTgIpEfXEAj28cmFU3Yglza52sEgAxAQkiW1Ib
         tZCmeW5oLUE+WO8f3D+Dn3mGtoOOBIBUZTUAKzzuu1Kkwc1xnfhmp0Ydqwg3LeK7hgId
         t1ZHv9uS8Pbwx2TzzvkNyhI85CHp36fsKmtG5TYkEnJg1e4MVl1yK1BD7hTlXBsmSzc3
         ndzjZ8pXLEUVb7pS3jUIxo+IrEde1ozo5EJLbkJvA1cU9KWxidNGXK2BmgkfjbkHFApt
         RV/BCKT0XiFowvyHFQn872HgIY4gxH5aG9LfxkJScjdeRJXO37uE1H73kWxpsAahAeNg
         TsjA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XUWh+1ER;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q190si7166636ybg.252.2020.07.31.02.40.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 31 Jul 2020 02:40:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=XUWh+1ER;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:37934 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k1RWk-0001LA-LV
	for alex.bennee@linaro.org; Fri, 31 Jul 2020 05:40:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:42854)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1k1RNz-0002jB-5y
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 05:31:31 -0400
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:23690
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1k1RNx-0003oJ-9U
 for qemu-devel@nongnu.org; Fri, 31 Jul 2020 05:31:30 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1596187888;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=4wbVNQOzoIXN8geB73F0yfgzsn0haLtpd4qkPqDXwCs=;
 b=XUWh+1ERK8dV6ilsw0LKujuZiTLn6qrkwtXS2zrFDwDn65EpxemW7cCQcsLsPImZO0L7H+
 vovwte09zzuWKMQWJY5/SWWf+EuHjXG0k3/UjRzQCW3r6MQHP670KqvP3SBs7E2eUtUGFb
 xc2rDYzZIL8t7vsTeN4I9Nab6oEEi0A=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-118-1Cj6vD9BPqif02YKOYdI8w-1; Fri, 31 Jul 2020 05:31:27 -0400
X-MC-Unique: 1Cj6vD9BPqif02YKOYdI8w-1
Received: from smtp.corp.redhat.com (int-mx01.intmail.prod.int.phx2.redhat.com
 [10.5.11.11])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id A7D4257;
 Fri, 31 Jul 2020 09:31:25 +0000 (UTC)
Received: from localhost (unknown [10.40.208.36])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 5AC74512FE;
 Fri, 31 Jul 2020 09:31:18 +0000 (UTC)
Date: Fri, 31 Jul 2020 11:31:17 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: "Michael S. Tsirkin" <mst@redhat.com>
Subject: Re: [PATCH 2/2] arm/acpi: fix an out of spec _UID for PCI root
Message-ID: <20200731113117.5df42212@redhat.com>
In-Reply-To: <20200730155755.188845-2-mst@redhat.com>
References: <20200730155755.188845-1-mst@redhat.com>
 <20200730155755.188845-2-mst@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.11
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=205.139.110.120; envelope-from=imammedo@redhat.com;
 helo=us-smtp-1.mimecast.com
X-detected-operating-system: by eggs.gnu.org: First seen = 2020/07/31 03:06:50
X-ACL-Warn: Detected OS   = Linux 2.2.x-3.x [generic] [fuzzy]
X-Spam_score_int: -40
X-Spam_score: -4.1
X-Spam_bar: ----
X-Spam_report: (-4.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H2=-1, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>, vit9696 <vit9696@protonmail.com>,
 qemu-devel@nongnu.org, Eduardo Habkost <ehabkost@redhat.com>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm@nongnu.org,
 Paolo Bonzini <pbonzini@redhat.com>, Laszlo Ersek <lersek@redhat.com>,
 Richard Henderson <rth@twiddle.net>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2/9soHAAAi8A

On Thu, 30 Jul 2020 11:58:41 -0400
"Michael S. Tsirkin" <mst@redhat.com> wrote:

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

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

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

