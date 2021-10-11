Received: by 2002:ac2:5f6a:0:0:0:0:0 with SMTP id c10csp847259lfc;
        Mon, 11 Oct 2021 08:16:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyrAf0kaZc5eW+oUfO9cfcoWk4Z1fFWFGyOgXe2GHZkMv8cX0RKCmsNySA0FrRg+qu+ycRP
X-Received: by 2002:ac8:de:: with SMTP id d30mr14878597qtg.377.1633965395728;
        Mon, 11 Oct 2021 08:16:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1633965395; cv=none;
        d=google.com; s=arc-20160816;
        b=RqWcxTSH9ZQKmdNQDdVEyXq9Mh+jjLT7Olp1XpnQo6dH9G+Qpq4kYQk2BiAeh/sNs7
         vAEM/2i0aH/zWWBsCJnPrFPdfRjt/qmt6vcTc3PoZC83Pd0Rf9WdN46K2LXWyYQriWYc
         XA0hpxXKKsBq97Uc7mEsH0hj4ETGF/srMuRgUmwErvh/RgFpqbtCztOwP9wASG6q0XFC
         z9tx6TcmSw5yYsruHjtuYGjL0M1WrtQc6N3tkkmW8qcIv8RaFYgVlCpF/U8VqVmeAUJ8
         zvFM4gc9PkWABepVzwcPM26RqJnJwBgFnjugv5NTqP+AwZtvl5dMgCL96jw6T+ZXLtDZ
         Cy+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date
         :dkim-signature;
        bh=m2OpKnDLnAJno+Zesxx72oqTPwWxOzALKGR8YQeCyPI=;
        b=Xao1qmW/7+KDlIm7zDxXca7LbsB0Slpl8dglV/TetIzM68JQaVV1mV442TVAbRKiQR
         vKU943RLMsHmRSCLoxrKVsWjI7dR8x8G36wv+EcaXBMtw9f6g6fbww+LWKSwwfywqxhC
         YeFCfEXf3RKcp9vWhp2t5aTPSXw8xwcVbl7cUy1LmDJ6zj+VCxq7jf36k0Kh5xH4lnPs
         GzwSPZ3E4LvtHi2ApJ89rO8FqTnsEFAP7OCnKThKUd4I+C1IxhmsjNg1ehejAJ2w4C0y
         e9plYM7VOOQPzStLUbmzLLZT4qhvpb3U3ubVLLK86oCAxpTqCam7j36PawZMrYfBt967
         EskA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aDa038vD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x11si4486278qvb.224.2021.10.11.08.16.35
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 11 Oct 2021 08:16:35 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=aDa038vD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:48434 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mZx2Z-0002bf-36
	for alex.bennee@linaro.org; Mon, 11 Oct 2021 11:16:35 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:54288)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mZx27-0002bL-HX
 for qemu-arm@nongnu.org; Mon, 11 Oct 2021 11:16:07 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:23312)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <imammedo@redhat.com>)
 id 1mZx23-0005kA-W0
 for qemu-arm@nongnu.org; Mon, 11 Oct 2021 11:16:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1633965363;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=m2OpKnDLnAJno+Zesxx72oqTPwWxOzALKGR8YQeCyPI=;
 b=aDa038vDFXmTCU5uAsTgSylIT6ZQfnq0AS3z9PodYawL3I7WQDUq7aGUE0Aaft6sg8FeFe
 iz/41eNOdPoFL7tKDoVWTG6K34n6XHLLN8eJk8xjOXv+dT3jylnSuaJnLPhcyyRbyga5DP
 k+rxTAbabEkGHdYc9VvWniETmnmAQlc=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-365-7CXpzKP6M3CCcEgKIYB5Dw-1; Mon, 11 Oct 2021 11:16:00 -0400
X-MC-Unique: 7CXpzKP6M3CCcEgKIYB5Dw-1
Received: by mail-ed1-f69.google.com with SMTP id
 t18-20020a056402021200b003db9e6b0e57so1937705edv.10
 for <qemu-arm@nongnu.org>; Mon, 11 Oct 2021 08:15:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=m2OpKnDLnAJno+Zesxx72oqTPwWxOzALKGR8YQeCyPI=;
 b=qeH4WRH3QnNCW4FlvpJ6PBwck2IhNncIw9rNoZ+H5VmNG3QHKSTcWFjqX37W1kStfy
 WPY+wnP1fUXeUThel9byvAV67aqTM9odkeQ93Ohu8JMiQXzyj0W9N0BhTp8a7LC9aYLP
 hSiaivL/x3GyXP1z6v2V4C8Npi67Z9eOK4qDS4gXmZL69ukChsDj2U5Mcr44K4AeAOjR
 kJa866GYUo5iowIwVulwn1a+BgveL8fnmERFbkgCZDTdpmJxV10n6oiWMZ1iBjQ9nL5V
 IRCjQqeUs8BN+8GpFhxgzKcg4Eukq0Z6AQB4+HkU6lsTeQ36S+fMYUujZBKJxuRWOXUk
 sLMQ==
X-Gm-Message-State: AOAM531peBy4JqbIAVxwGaywPZf4f0buf4K8d2C8poTvJOtV52ZWGszx
 h0hNxigAFjxmx9B4/eqMpAfQlrQpZd8r1rX8wx1NQfudzCfjmZreBfAwoQCrks7P27f3/X5f6XE
 yf2lbwEEVcIXW
X-Received: by 2002:a05:6402:1e8e:: with SMTP id
 f14mr5415342edf.27.1633965358903; 
 Mon, 11 Oct 2021 08:15:58 -0700 (PDT)
X-Received: by 2002:a05:6402:1e8e:: with SMTP id
 f14mr5415283edf.27.1633965358563; 
 Mon, 11 Oct 2021 08:15:58 -0700 (PDT)
Received: from localhost (nat-pool-brq-t.redhat.com. [213.175.37.10])
 by smtp.gmail.com with ESMTPSA id u19sm4429423edv.40.2021.10.11.08.15.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Oct 2021 08:15:58 -0700 (PDT)
Date: Mon, 11 Oct 2021 17:15:57 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Eric Auger <eric.auger@redhat.com>
Subject: Re: [RFC v2 1/2] hw/pci-host/gpex: Allow to generate preserve boot
 config DSM #5
Message-ID: <20211011171557.416c1fc6@redhat.com>
In-Reply-To: <20211005085313.493858-2-eric.auger@redhat.com>
References: <20211005085313.493858-1-eric.auger@redhat.com>
 <20211005085313.493858-2-eric.auger@redhat.com>
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.33; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=imammedo@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=imammedo@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -28
X-Spam_score: -2.9
X-Spam_bar: --
X-Spam_report: (-2.9 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.049,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
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
Cc: peter.maydell@linaro.org, drjones@redhat.com, gshan@redhat.com,
 jean-philippe@linaro.org, qemu-devel@nongnu.org,
 shameerali.kolothum.thodi@huawei.com, shannon.zhaosl@gmail.com,
 qemu-arm@nongnu.org, philmd@redhat.com, ardb@kernel.org,
 eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: klRGWc5+r0BX

On Tue,  5 Oct 2021 10:53:12 +0200
Eric Auger <eric.auger@redhat.com> wrote:

> Add a 'preserve_config' field in struct GPEXConfig and
> if set generate the DSM #5 for preserving PCI boot configurations.
> The DSM presence is needed to expose RMRs.

here should be pointers to spec and location within it
where it says preserving PCI boot configuration is necessary
or in absence of that a bit more detailed explanation
why it's necessary.

> 
> At the moment the DSM generation is not yet enabled.
> 
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> ---
>  include/hw/pci-host/gpex.h |  1 +
>  hw/pci-host/gpex-acpi.c    | 12 ++++++++++++
>  2 files changed, 13 insertions(+)
> 
> diff --git a/include/hw/pci-host/gpex.h b/include/hw/pci-host/gpex.h
> index fcf8b63820..3f8f8ec38d 100644
> --- a/include/hw/pci-host/gpex.h
> +++ b/include/hw/pci-host/gpex.h
> @@ -64,6 +64,7 @@ struct GPEXConfig {
>      MemMapEntry pio;
>      int         irq;
>      PCIBus      *bus;
> +    bool        preserve_config;
s/^^^/preserve_fw_config/

>  };
>  
>  int gpex_set_irq_num(GPEXHost *s, int index, int gsi);
> diff --git a/hw/pci-host/gpex-acpi.c b/hw/pci-host/gpex-acpi.c
> index e7e162a00a..7dab259379 100644
> --- a/hw/pci-host/gpex-acpi.c
> +++ b/hw/pci-host/gpex-acpi.c
> @@ -164,6 +164,12 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>                  aml_append(dev, aml_name_decl("_PXM", aml_int(numa_node)));
>              }
>  


> +            if (cfg->preserve_config) {
> +                method = aml_method("_DSM", 5, AML_SERIALIZED);
> +                aml_append(method, aml_return(aml_int(0)));
> +                aml_append(dev, method);
> +            }
> +
>              acpi_dsdt_add_pci_route_table(dev, cfg->irq);
>  
>              /*
> @@ -191,6 +197,12 @@ void acpi_dsdt_add_gpex(Aml *scope, struct GPEXConfig *cfg)
>      aml_append(dev, aml_name_decl("_STR", aml_unicode("PCIe 0 Device")));
>      aml_append(dev, aml_name_decl("_CCA", aml_int(1)));
>  
> +    if (cfg->preserve_config) {
> +        method = aml_method("_DSM", 5, AML_SERIALIZED);
> +        aml_append(method, aml_return(aml_int(0)));
> +        aml_append(dev, method);
> +    }
> +


these ones seem to wrong ,
it adds duplicate _DSM methods with wrong ARGs number.

virt board already has _DSM defined, see

  acpi_dsdt_add_pci_osc()
    E5C937D0-3553-4D7A-9117-EA4D19C3434D

you need to modify that one (and possibly move out DSM into a separate function),
also preserving config might regress what commit 40c3472a29c9a was fixing.


>      acpi_dsdt_add_pci_route_table(dev, cfg->irq);
>  
>      method = aml_method("_CBA", 0, AML_NOTSERIALIZED);

