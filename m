Received: by 2002:a05:6512:204:0:0:0:0 with SMTP id a4csp1461271lfo;
        Fri, 18 Mar 2022 05:29:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxttvldmSCBJE98IO7NE6/Rwc3xsFfYKpynz3Lu8/TFjP0C/gKmg0D69RzPJEDh9f1oilHn
X-Received: by 2002:a37:a82:0:b0:67b:1183:7c00 with SMTP id 124-20020a370a82000000b0067b11837c00mr5412000qkk.547.1647606552533;
        Fri, 18 Mar 2022 05:29:12 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1647606552; cv=none;
        d=google.com; s=arc-20160816;
        b=CFXpkHrm9Hw8kuIdR0GGyQNZbj59VLBYIwA4LQ3xqUiSdSX6Ntu50Qos20S7C+q1xI
         wtQ5W2wA4vmt4xhxoRU84qobZCz976BB5G78Hb2m4ynzW1iMliyuEqaqj4PMYJMEbmfe
         hBSKfzvvLt62mv512O1HV4fZkmLTuqH9AfZ7fwnQqfKzLRx2gU+lvesZxhcgZRzsde44
         YA1kkWGTJS2NbDXi0qzOoE328iYnCiRBdoq+CX8gzA+4IUczshF7e03kpwn6kgZEc57Y
         aqVMaEDBHEmaqmWbzQQ8obxraFpJ1gr44RDxIdnSXNd8vO4UsqL1A+i/Ms0gTx4T6pZe
         FrqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=ThhdvcZPsQAJXmrn9Dm2sMpoRrM2Z3xvNgdmlbbaR5Y=;
        b=knDXlFHVzzlRvlT5uZM89w2C/3QbSW8oY6cVGNCZrcUwWJx0KsFFVYIv8G3bWhUWud
         DWJoIpZgqX8MRqocsL1fvjnIjlQ3B1Z1xTKESAr0wrxIwhiJwfvb9RmbX7hLRe4LpfQR
         /8eXFTN5DMc1P81AfF3JXja7PgrjGTpgU4qxrczLZwieGe7cgcSUStISo6xkaKshoheV
         a40fx1Fxga+ZSchwQer9uVyTg21y/2U41QOEho5vbcE3F2EPO1d1DJRg1l/KS8FGLtnQ
         i+ak9osA0anqWrnDgOm/b6ySW1h9ALmty3ipxQQhVE0UmiMGmgFpf1KNzmBPjZrqRB1i
         AvzA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="b/EmpFjF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bi27-20020a05620a319b00b0067d6f11e092si2192635qkb.27.2022.03.18.05.29.12
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 18 Mar 2022 05:29:12 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b="b/EmpFjF";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:41744 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nVBjE-0002Df-1F
	for alex.bennee@linaro.org; Fri, 18 Mar 2022 08:29:12 -0400
Received: from eggs.gnu.org ([209.51.188.92]:35610)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1nVBim-0002BR-Qn
 for qemu-arm@nongnu.org; Fri, 18 Mar 2022 08:28:45 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28413)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <eauger@redhat.com>) id 1nVBii-0000ff-EG
 for qemu-arm@nongnu.org; Fri, 18 Mar 2022 08:28:42 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1647606517;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ThhdvcZPsQAJXmrn9Dm2sMpoRrM2Z3xvNgdmlbbaR5Y=;
 b=b/EmpFjFEPjL7tIRGG07ipFolwc8FQGlrq6S6R+b6SKHLm1CGymKNTVCl32da6lJVQNoqK
 Hb+F6S9Solua/Y33AX2tXOWvB8oM6YBkllAHEKFC1Iz6bTFec+llnMZWRhgiWfh0VmkNwO
 AX0SH+15vnadzUbTuRFIWgkZ9DVy3H0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-386-pfnbEIhLN7qrcRgcSufB6g-1; Fri, 18 Mar 2022 08:28:36 -0400
X-MC-Unique: pfnbEIhLN7qrcRgcSufB6g-1
Received: by mail-wm1-f71.google.com with SMTP id
 i65-20020a1c3b44000000b00385c3f3defaso1391658wma.3
 for <qemu-arm@nongnu.org>; Fri, 18 Mar 2022 05:28:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=ThhdvcZPsQAJXmrn9Dm2sMpoRrM2Z3xvNgdmlbbaR5Y=;
 b=Oj3KH2V5mzYdFNPmnJ0+HCbgh3TGaYSyn8dSSL+9Y+4HeuDqZ6Fx+V1fbQvhthRoSk
 GJdZ2v5n8AQmCuRB53kZfIcgu3NsYIBWlKRXrMoHZ/n8VVOIKXcE5K/GiUGJHiKWpMPW
 KUZ4kbybPH16r7TC2MWfGGOxab2nn/xmrBpYVw4jePb1G0i8zr21nQK3Mq/0iendnYDi
 ZL+BQx6JUq+wAK2aN+1CUGh+m3VemhZ58dEVxvNXhHGxdcv76eJS16cPSPOfgD47pbJX
 tUQq+r990r4Yu7tkR4gVB6TtPsNiYmqOFQOXk+TxIU2ILiECL/To6/0ardyeGxGyYKH8
 TbaQ==
X-Gm-Message-State: AOAM531IrQmkxdepzpQQPGsYmRSD+G8B5vRsEqybmy8gAobWOU+SZ1Ae
 NVEE8l49GUEyPdN0uWjv2BBpZnRZMaRx+uiC76F3/MNwVFCYXf7+N9WegJfUygxb24xbkagnHzJ
 Q/4Sh7Qvzi5J+
X-Received: by 2002:adf:f943:0:b0:203:b456:c71d with SMTP id
 q3-20020adff943000000b00203b456c71dmr7961324wrr.568.1647606514740; 
 Fri, 18 Mar 2022 05:28:34 -0700 (PDT)
X-Received: by 2002:adf:f943:0:b0:203:b456:c71d with SMTP id
 q3-20020adff943000000b00203b456c71dmr7961293wrr.568.1647606514381; 
 Fri, 18 Mar 2022 05:28:34 -0700 (PDT)
Received: from ?IPv6:2a01:e0a:59e:9d80:527b:9dff:feef:3874?
 ([2a01:e0a:59e:9d80:527b:9dff:feef:3874])
 by smtp.gmail.com with ESMTPSA id
 p3-20020a05600c358300b00389f8158b6bsm10444073wmq.4.2022.03.18.05.28.31
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 18 Mar 2022 05:28:33 -0700 (PDT)
Subject: Re: [PATCH for-7.1] hw: Add compat machines for 7.1
To: Cornelia Huck <cohuck@redhat.com>, qemu-arm@nongnu.org,
 qemu-devel@nongnu.org, qemu-ppc@nongnu.org, qemu-s390x@nongnu.org
References: <20220316145521.1224083-1-cohuck@redhat.com>
From: Eric Auger <eauger@redhat.com>
Message-ID: <d3fa5cca-dedf-13f3-0bba-459f61bada43@redhat.com>
Date: Fri, 18 Mar 2022 13:28:31 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20220316145521.1224083-1-cohuck@redhat.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=eauger@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=170.10.133.124; envelope-from=eauger@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -21
X-Spam_score: -2.2
X-Spam_bar: --
X-Spam_report: (-2.2 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.082,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_NONE=-0.0001, RCVD_IN_MSPIKE_H5=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Cc: Eduardo Habkost <eduardo@habkost.net>,
 Peter Maydell <peter.maydell@linaro.org>, Eric Farman <farman@linux.ibm.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Thomas Huth <thuth@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 Yanan Wang <wangyanan55@huawei.com>, Greg Kurz <groug@kaod.org>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Halil Pasic <pasic@linux.ibm.com>,
 Paolo Bonzini <pbonzini@redhat.com>, David Hildenbrand <david@redhat.com>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8kevn3GI/4df

Hi Connie,

On 3/16/22 3:55 PM, Cornelia Huck wrote:
> Add 7.1 machine types for arm/i440fx/m68k/q35/s390x/spapr.
> 
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---
>  hw/arm/virt.c              |  9 ++++++++-
>  hw/core/machine.c          |  3 +++
>  hw/i386/pc.c               |  3 +++
>  hw/i386/pc_piix.c          | 14 +++++++++++++-
>  hw/i386/pc_q35.c           | 13 ++++++++++++-
>  hw/m68k/virt.c             |  9 ++++++++-
>  hw/ppc/spapr.c             | 15 +++++++++++++--
>  hw/s390x/s390-virtio-ccw.c | 14 +++++++++++++-
>  include/hw/boards.h        |  3 +++
>  include/hw/i386/pc.h       |  3 +++
>  10 files changed, 79 insertions(+), 7 deletions(-)
for the arm part:
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric

> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 46a42502bc55..2e6b4aac8c75 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -3017,10 +3017,17 @@ static void machvirt_machine_init(void)
>  }
>  type_init(machvirt_machine_init);
>  
> +static void virt_machine_7_1_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE_AS_LATEST(7, 1)
> +
>  static void virt_machine_7_0_options(MachineClass *mc)
>  {
> +    virt_machine_7_1_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>  }
> -DEFINE_VIRT_MACHINE_AS_LATEST(7, 0)
> +DEFINE_VIRT_MACHINE(7, 0)
>  
>  static void virt_machine_6_2_options(MachineClass *mc)
>  {
> diff --git a/hw/core/machine.c b/hw/core/machine.c
> index d856485cb4d0..cb9c05a7ded7 100644
> --- a/hw/core/machine.c
> +++ b/hw/core/machine.c
> @@ -37,6 +37,9 @@
>  #include "hw/virtio/virtio.h"
>  #include "hw/virtio/virtio-pci.h"
>  
> +GlobalProperty hw_compat_7_0[] = {};
> +const size_t hw_compat_7_0_len = G_N_ELEMENTS(hw_compat_7_0);
> +
>  GlobalProperty hw_compat_6_2[] = {};
>  const size_t hw_compat_6_2_len = G_N_ELEMENTS(hw_compat_6_2);
>  
> diff --git a/hw/i386/pc.c b/hw/i386/pc.c
> index fd55fc725caf..23bba9d82c12 100644
> --- a/hw/i386/pc.c
> +++ b/hw/i386/pc.c
> @@ -95,6 +95,9 @@
>  #include "trace.h"
>  #include CONFIG_DEVICES
>  
> +GlobalProperty pc_compat_7_0[] = {};
> +const size_t pc_compat_7_0_len = G_N_ELEMENTS(pc_compat_7_0);
> +
>  GlobalProperty pc_compat_6_2[] = {
>      { "virtio-mem", "unplugged-inaccessible", "off" },
>  };
> diff --git a/hw/i386/pc_piix.c b/hw/i386/pc_piix.c
> index b72c03d0a626..4c185c72d014 100644
> --- a/hw/i386/pc_piix.c
> +++ b/hw/i386/pc_piix.c
> @@ -415,7 +415,7 @@ static void pc_i440fx_machine_options(MachineClass *m)
>      machine_class_allow_dynamic_sysbus_dev(m, TYPE_VMBUS_BRIDGE);
>  }
>  
> -static void pc_i440fx_7_0_machine_options(MachineClass *m)
> +static void pc_i440fx_7_1_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_i440fx_machine_options(m);
> @@ -424,6 +424,18 @@ static void pc_i440fx_7_0_machine_options(MachineClass *m)
>      pcmc->default_cpu_version = 1;
>  }
>  
> +DEFINE_I440FX_MACHINE(v7_1, "pc-i440fx-7.1", NULL,
> +                      pc_i440fx_7_1_machine_options);
> +
> +static void pc_i440fx_7_0_machine_options(MachineClass *m)
> +{
> +    pc_i440fx_7_1_machine_options(m);
> +    m->alias = NULL;
> +    m->is_default = false;
> +    compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
> +    compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
> +}
> +
>  DEFINE_I440FX_MACHINE(v7_0, "pc-i440fx-7.0", NULL,
>                        pc_i440fx_7_0_machine_options);
>  
> diff --git a/hw/i386/pc_q35.c b/hw/i386/pc_q35.c
> index 1780f79bc127..302288342a91 100644
> --- a/hw/i386/pc_q35.c
> +++ b/hw/i386/pc_q35.c
> @@ -360,7 +360,7 @@ static void pc_q35_machine_options(MachineClass *m)
>      m->max_cpus = 288;
>  }
>  
> -static void pc_q35_7_0_machine_options(MachineClass *m)
> +static void pc_q35_7_1_machine_options(MachineClass *m)
>  {
>      PCMachineClass *pcmc = PC_MACHINE_CLASS(m);
>      pc_q35_machine_options(m);
> @@ -368,6 +368,17 @@ static void pc_q35_7_0_machine_options(MachineClass *m)
>      pcmc->default_cpu_version = 1;
>  }
>  
> +DEFINE_Q35_MACHINE(v7_1, "pc-q35-7.1", NULL,
> +                   pc_q35_7_1_machine_options);
> +
> +static void pc_q35_7_0_machine_options(MachineClass *m)
> +{
> +    pc_q35_7_1_machine_options(m);
> +    m->alias = NULL;
> +    compat_props_add(m->compat_props, hw_compat_7_0, hw_compat_7_0_len);
> +    compat_props_add(m->compat_props, pc_compat_7_0, pc_compat_7_0_len);
> +}
> +
>  DEFINE_Q35_MACHINE(v7_0, "pc-q35-7.0", NULL,
>                     pc_q35_7_0_machine_options);
>  
> diff --git a/hw/m68k/virt.c b/hw/m68k/virt.c
> index bbaf630bbf20..afa52d7e491e 100644
> --- a/hw/m68k/virt.c
> +++ b/hw/m68k/virt.c
> @@ -316,10 +316,17 @@ type_init(virt_machine_register_types)
>      } \
>      type_init(machvirt_machine_##major##_##minor##_init);
>  
> +static void virt_machine_7_1_options(MachineClass *mc)
> +{
> +}
> +DEFINE_VIRT_MACHINE(7, 1, true)
> +
>  static void virt_machine_7_0_options(MachineClass *mc)
>  {
> +    virt_machine_7_1_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>  }
> -DEFINE_VIRT_MACHINE(7, 0, true)
> +DEFINE_VIRT_MACHINE(7, 0, false)
>  
>  static void virt_machine_6_2_options(MachineClass *mc)
>  {
> diff --git a/hw/ppc/spapr.c b/hw/ppc/spapr.c
> index 953fc65fa863..3561882d6615 100644
> --- a/hw/ppc/spapr.c
> +++ b/hw/ppc/spapr.c
> @@ -4703,15 +4703,26 @@ static void spapr_machine_latest_class_options(MachineClass *mc)
>      }                                                                \
>      type_init(spapr_machine_register_##suffix)
>  
> +/*
> + * pseries-7.1
> + */
> +static void spapr_machine_7_1_class_options(MachineClass *mc)
> +{
> +    /* Defaults for the latest behaviour inherited from the base class */
> +}
> +
> +DEFINE_SPAPR_MACHINE(7_1, "7.1", true);
> +
>  /*
>   * pseries-7.0
>   */
>  static void spapr_machine_7_0_class_options(MachineClass *mc)
>  {
> -    /* Defaults for the latest behaviour inherited from the base class */
> +    spapr_machine_7_1_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>  }
>  
> -DEFINE_SPAPR_MACHINE(7_0, "7.0", true);
> +DEFINE_SPAPR_MACHINE(7_0, "7.0", false);
>  
>  /*
>   * pseries-6.2
> diff --git a/hw/s390x/s390-virtio-ccw.c b/hw/s390x/s390-virtio-ccw.c
> index 90480e7cf9bc..c3eab13c60e8 100644
> --- a/hw/s390x/s390-virtio-ccw.c
> +++ b/hw/s390x/s390-virtio-ccw.c
> @@ -791,14 +791,26 @@ bool css_migration_enabled(void)
>      }                                                                         \
>      type_init(ccw_machine_register_##suffix)
>  
> +static void ccw_machine_7_1_instance_options(MachineState *machine)
> +{
> +}
> +
> +static void ccw_machine_7_1_class_options(MachineClass *mc)
> +{
> +}
> +DEFINE_CCW_MACHINE(7_1, "7.1", true);
> +
>  static void ccw_machine_7_0_instance_options(MachineState *machine)
>  {
> +    ccw_machine_7_1_instance_options(machine);
>  }
>  
>  static void ccw_machine_7_0_class_options(MachineClass *mc)
>  {
> +    ccw_machine_7_1_class_options(mc);
> +    compat_props_add(mc->compat_props, hw_compat_7_0, hw_compat_7_0_len);
>  }
> -DEFINE_CCW_MACHINE(7_0, "7.0", true);
> +DEFINE_CCW_MACHINE(7_0, "7.0", false);
>  
>  static void ccw_machine_6_2_instance_options(MachineState *machine)
>  {
> diff --git a/include/hw/boards.h b/include/hw/boards.h
> index c92ac8815c85..d64b5481e834 100644
> --- a/include/hw/boards.h
> +++ b/include/hw/boards.h
> @@ -380,6 +380,9 @@ struct MachineState {
>      } \
>      type_init(machine_initfn##_register_types)
>  
> +extern GlobalProperty hw_compat_7_0[];
> +extern const size_t hw_compat_7_0_len;
> +
>  extern GlobalProperty hw_compat_6_2[];
>  extern const size_t hw_compat_6_2_len;
>  
> diff --git a/include/hw/i386/pc.h b/include/hw/i386/pc.h
> index 1a27de9c8b35..637367dc5fae 100644
> --- a/include/hw/i386/pc.h
> +++ b/include/hw/i386/pc.h
> @@ -202,6 +202,9 @@ void pc_madt_cpu_entry(AcpiDeviceIf *adev, int uid,
>  /* sgx.c */
>  void pc_machine_init_sgx_epc(PCMachineState *pcms);
>  
> +extern GlobalProperty pc_compat_7_0[];
> +extern const size_t pc_compat_7_0_len;
> +
>  extern GlobalProperty pc_compat_6_2[];
>  extern const size_t pc_compat_6_2_len;
>  
> 

