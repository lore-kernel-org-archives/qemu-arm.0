Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E7BCCF9E0
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 11:12:39 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDL80-0003fO-IN; Mon, 27 Oct 2025 07:11:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDL7s-0003Ya-WE
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:11:02 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eric.auger@redhat.com>)
 id 1vDL7i-0007EQ-Dx
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 07:11:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1761563445;
 h=from:from:reply-to:reply-to:subject:subject:date:date:
 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
 content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NixdesNY1utcW3p2yxkWUY9N6N9R0zractCK2Y1EA18=;
 b=ZzmjSgKblp6sHS45gHNFh4RIarentO1h6IepPll+UBpzv+bmLS6a2qaIgeamPk6tUTON8E
 GnPcO8u9fPWCt2LGrQBtEm5Kr514KTfKLI3kBj4S7defkgXyRVzWctY/SIAOqNzjEv5MG1
 VdnV/P4GC6kOIRAi+Jo0Ibz6nFD/Sss=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-325-l96Tmp0rO4G2qAWRu09F_g-1; Mon, 27 Oct 2025 07:10:44 -0400
X-MC-Unique: l96Tmp0rO4G2qAWRu09F_g-1
X-Mimecast-MFC-AGG-ID: l96Tmp0rO4G2qAWRu09F_g_1761563443
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-470fd92ad57so54765715e9.3
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 04:10:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761563443; x=1762168243;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:reply-to:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NixdesNY1utcW3p2yxkWUY9N6N9R0zractCK2Y1EA18=;
 b=YA84BNwuza6Y3g3UcxUoS3oSfH7Ro8Qu6uVETzN0whsFYMZ+irv2o6MIaBumt6Ig5V
 g0Gk53D0TBmuSHnCVNgJ6dDWpSjPHSN0p7sH4Sgiu+wzDYwZ3DaclfuWGoFeIz5Vgp8C
 YKZIAWjIf96PeXykbkzpfLTBBrOEYuThs2WER5GvrUKOHAC/5zPz5Yh/tb+2CmqJZsHK
 XRxJM5N+AXDFqFAXEsi7TXH0wVXj/ieJKUtkLGhhcyOZRQBl+4X71JLBdY93jduhUTFT
 fgZTAa321t8xUSfKRNV/IZlnBart1cKVOZ7vKqKozen0BlIm6shtYtTrE/rXTc1J3Vt6
 xSeg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTwOJGWeP1Km/sn4So77LQ9JQZEKIUFP2OrN1v/fxJuCnMZkVmsx8qVU4dDzeQzujUpNBhWPZO1A==@nongnu.org
X-Gm-Message-State: AOJu0YyMU6CO+0ucq7LZFkH7dar66BkBQQlneGwr2BrkOT/osehIBOfO
 DCENfue1Us5Y04Oje1+cb3zxIrqYwuVTL5onuS/AA4sLdeSZ+M29jVEi6+/pLCZtZF8liTejiE6
 YLYndQ/I7ZM/ubAknWLvAQqNbF2Ja//n6s0kIsRWyxMgy/Jm2GcLpsw==
X-Gm-Gg: ASbGncv6qWTSXF2xBlO692GBMj/+5aq9WWSoUPky/PjncuyXiCXAunrVS7fqUc3V+cz
 GTHcM5Aotg26PF3IQImeklEiuFr9PI7/uDMri7CCDmmIqS9Dt+59ll9ZoqVU2Gi30ZFz8GnnIx7
 /J5RgAZw1KVmxPqEEVkHX1rEbPypobPdhD85vEkfhoYcQNIJDoYK9ZPppdxIs/rVxKID0lXOFSY
 JRBxmZE049Voxx6iMwacaJgbdQIj/6StH53SPdThbVXHnr3QRXH2TUjQVPx4STrDkWNEgPUglbC
 sGeYh1huzMNmg44Rqo3kMIkpk5ygrTk9oFg01UKhevHWgv5eJOkDOB+sBLamB7rMRjlztRtwTJ3
 DRoA3Iks0HnleeRRrWf5DW/bxCOjWwvVkJR4c8+LCJKQ9Fw==
X-Received: by 2002:a05:600c:6299:b0:475:de55:9304 with SMTP id
 5b1f17b1804b1-475de559b0amr57728615e9.19.1761563442906; 
 Mon, 27 Oct 2025 04:10:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGng66RYWVXieE6xjlZ/YVYTTvKoCU49arFvseGNSohI5B1YpYU4WWc8gYSb+Gb4OvCz4qgYQ==
X-Received: by 2002:a05:600c:6299:b0:475:de55:9304 with SMTP id
 5b1f17b1804b1-475de559b0amr57728295e9.19.1761563442468; 
 Mon, 27 Oct 2025 04:10:42 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:f0e:9070:527b:9dff:feef:3874?
 ([2a01:e0a:f0e:9070:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-475dd02ce46sm152237065e9.3.2025.10.27.04.10.41
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 04:10:42 -0700 (PDT)
Message-ID: <a7b94719-d802-405f-a567-c919c096263d@redhat.com>
Date: Mon, 27 Oct 2025 12:10:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 16/27] hw/pci-host/gpex: Allow to generate preserve
 boot config DSM #5
To: Shameer Kolothum <skolothumtho@nvidia.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org
Cc: peter.maydell@linaro.org, jgg@nvidia.com, nicolinc@nvidia.com,
 ddutile@redhat.com, berrange@redhat.com, nathanc@nvidia.com,
 mochs@nvidia.com, smostafa@google.com, wangzhou1@hisilicon.com,
 jiangkunkun@huawei.com, jonathan.cameron@huawei.com,
 zhangfei.gao@linaro.org, zhenzhong.duan@intel.com, yi.l.liu@intel.com,
 shameerkolothum@gmail.com
References: <20250929133643.38961-1-skolothumtho@nvidia.com>
 <20250929133643.38961-17-skolothumtho@nvidia.com>
From: Eric Auger <eric.auger@redhat.com>
In-Reply-To: <20250929133643.38961-17-skolothumtho@nvidia.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: GWbuko7qO_QovVvmtVrnLT9uyvE-3cLZXZD86evHTrg_1761563443
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.129.124;
 envelope-from=eric.auger@redhat.com; helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 RCVD_IN_VALIDITY_RPBL_BLOCKED=0.001, RCVD_IN_VALIDITY_SAFE_BLOCKED=0.001,
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
Reply-To: eric.auger@redhat.com
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

Hi Shameer,

On 9/29/25 3:36 PM, Shameer Kolothum wrote:
> From: Eric Auger <eric.auger@redhat.com>
>
> Add a 'preserve_config' field in struct GPEXConfig and if set, generate the
> DSM #5 for preserving PCI boot configurations. For SMMUV3 accel=on support,
> we are making use of IORT RMRs in a subsequent patch and that requires the
> DSM #5.
>
> At the moment the DSM generation is not yet enabled.
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> [Shameer: Removed possible duplicate _DSM creations]
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Signed-off-by: Shameer Kolothum <skolothumtho@nvidia.com>
> ---
> Previously, QEMU reverted an attempt to enable DSM #5 because it caused a
> regression,
> https://lore.kernel.org/all/20210724185234.GA2265457@roeck-us.net/.
Looking at the above link again and especially the list of devices for
which it was failing, it looks reasonable to me to enable that config
along with accel smmu.

Eric
>
> However, in this series, we enable it selectively, only when SMMUv3 is in
> accelerator mode. The devices involved in the earlier regression are not
> expected in accelerated SMMUv3 use cases.
> ---
>  hw/pci-host/gpex-acpi.c    | 29 +++++++++++++++++++++++------
>  include/hw/pci-host/gpex.h |  1 +
>  2 files changed, 24 insertions(+), 6 deletions(-)
>
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index 4587baeb78..e3825ed0b1 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -51,10 +51,11 @@ static void acpi_dsdt_add_pci_route_table(Aml *dev, uint32_t irq,
>      }
>  }
>  
> -static Aml *build_pci_host_bridge_dsm_method(void)
> +static Aml *build_pci_host_bridge_dsm_method(bool preserve_config)
>  {
>      Aml *method = aml_method("_DSM", 4, AML_NOTSERIALIZED);
>      Aml *UUID, *ifctx, *ifctx1, *buf;
> +    uint8_t byte_list[1] = {0};
>  
>      /* PCI Firmware Specification 3.0
>       * 4.6.1. _DSM for PCI Express Slot Information
> @@ -64,10 +65,23 @@ static Aml *build_pci_host_bridge_dsm_method(void)
>      UUID = aml_touuid("E5C937D0-3553-4D7A-9117-EA4D19C3434D");
>      ifctx = aml_if(aml_equal(aml_arg(0), UUID));
>      ifctx1 = aml_if(aml_equal(aml_arg(2), aml_int(0)));
> -    uint8_t byte_list[1] = {0};
> +    if (preserve_config) {
> +        /* support for function 0 and function 5 */
> +        byte_list[0] = 0x21;
> +    }
>      buf = aml_buffer(1, byte_list);
>      aml_append(ifctx1, aml_return(buf));
>      aml_append(ifctx, ifctx1);
> +    if (preserve_config) {
> +        Aml *ifctx2 = aml_if(aml_equal(aml_arg(2), aml_int(5)));
> +        /*
> +         * 0 - The operating system must not ignore the PCI configuration that
> +         *     firmware has done at boot time.
> +         */
> +        aml_append(ifctx2, aml_return(aml_int(0)));
> +        aml_append(ifctx, ifctx2);
> +    }
> +
>      aml_append(method, ifctx);
>  
>      byte_list[0] = 0;
> @@ -77,12 +91,13 @@ static Aml *build_pci_host_bridge_dsm_method(void)
>  }
>  
>  static void acpi_dsdt_add_host_bridge_methods(Aml *dev,
> -                                              bool enable_native_pcie_hotplug)
> +                                              bool enable_native_pcie_hotplug,
> +                                              bool preserve_config)
>  {
>      /* Declare an _OSC (OS Control Handoff) method */
>      aml_append(dev,
>                 build_pci_host_bridge_osc_method(enable_native_pcie_hotplug));
> -    aml_append(dev, build_pci_host_bridge_dsm_method());
> +    aml_append(dev, build_pci_host_bridge_dsm_method(preserve_config));
>  }
>  
>  void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
> @@ -152,7 +167,8 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>                  build_cxl_osc_method(dev);
>              } else {
>                  /* pxb bridges do not have ACPI PCI Hot-plug enabled */
> -                acpi_dsdt_add_host_bridge_methods(dev, true);
> +                acpi_dsdt_add_host_bridge_methods(dev, true,
> +                                                  cfg->preserve_config);
>              }
>  
>              aml_append(scope, dev);
> @@ -227,7 +243,8 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>      }
>      aml_append(dev, aml_name_decl("_CRS", rbuf));
>  
> -    acpi_dsdt_add_host_bridge_methods(dev, cfg->pci_native_hotplug);
> +    acpi_dsdt_add_host_bridge_methods(dev, cfg->pci_native_hotplug,
> +                                      cfg->preserve_config);
>  
>      Aml *dev_res0 = aml_device("%s", "RES0");
>      aml_append(dev_res0, aml_name_decl("_HID", aml_string("PNP0C02")));
> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> index feaf827474..7eea16e728 100644
> --- a/include/hw/pci-host/gpex.h
> +++ b/include/hw/pci-host/gpex.h
> @@ -46,6 +46,7 @@ struct GPEXConfig {
>      int         irq;
>      PCIBus      *bus;
>      bool        pci_native_hotplug;
> +    bool        preserve_config;
>  };
>  
>  typedef struct GPEXIrq GPEXIrq;


