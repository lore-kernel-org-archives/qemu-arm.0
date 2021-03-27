Received: by 2002:a19:6d5:0:0:0:0:0 with SMTP id 204csp2395644lfg;
        Sat, 27 Mar 2021 11:20:49 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzDK/2B9opn3aBq6r0uCPRJbi+LevGbys1pWSQCRNaWy6xsv7mrwnsBa8aYe/kojdJOKQgQ
X-Received: by 2002:a05:6602:184c:: with SMTP id d12mr14970611ioi.8.1616869248768;
        Sat, 27 Mar 2021 11:20:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1616869248; cv=none;
        d=google.com; s=arc-20160816;
        b=uwIKYY5lILWtnEzirtZf86/dk0yJPmIehehN5vzT4YPE8MEzjuE3kZLJvA67SKQNw2
         WxgjOPghkMKwhNadRw68XL/bT9VRD3oYmdSwuKSDRnYIhvSIAS6GykCC7k4RV5s9sQ2h
         G4MsnQDlXfkQRp054+gCLBPw8VA15tousx1nfXHuUH1Ef2khHehV4StV0jdaVIX8gykx
         ObfVs/jYSaLrNi3BbAIL1PZRZps6m/fEjYz2Zf2Bk3x9fYQOLBzTtNWuIg1EeZucl5Yk
         ZVPVKiZlKNXkfLfZ1A+tRMaStlOQ0URz/3fUO0Bqd/xzHtrwEayCq5du51jr5n43cv42
         4W5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=akhlSDJd+7LUSaLOX7tpvTKFpbH2qhmaGBO/8LnsJj0=;
        b=GgsICkEBOYGtj71PA+cVilHKjCQsbmjWnZmGWVe82VHZsbVZ0mKmYUBrdFftXJVSqh
         84SpC1Sk+a55sijQdtoG5/nP1sVw0Z9H6WQ2iCgwWcxOcQ9+15jqYi8Uk9fVRy0odM/F
         YmMwnq1Zft1ud2HwBbwMA6/yfacWz7dhR8j4sp/sy1WGey3LIBuwEnaADM0J+FNOToCk
         K+geMCq/Dy69nE188zB4SMlyXmWXaNKyKyi/dlWsRjQlxQbdksV66JwFjHyrcP3Zy7mI
         /iu17MB3kr6Ov6rLl3cWkcJoE3bDwhZqUAXRED8i1H9bN6HNfU4O0RQ4YXS1IPY/oWr9
         6b9Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IA1a22Ia;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id t13si10183581jan.74.2021.03.27.11.20.48
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 27 Mar 2021 11:20:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=IA1a22Ia;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:34446 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lQDYG-0001Ho-2n
	for alex.bennee@linaro.org; Sat, 27 Mar 2021 14:20:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45262)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lQDXR-0001Ca-IU
 for qemu-arm@nongnu.org; Sat, 27 Mar 2021 14:19:58 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:55668)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thuth@redhat.com>) id 1lQDXI-0005sQ-Uj
 for qemu-arm@nongnu.org; Sat, 27 Mar 2021 14:19:57 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1616869188;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=akhlSDJd+7LUSaLOX7tpvTKFpbH2qhmaGBO/8LnsJj0=;
 b=IA1a22Iawhz8f/WfffoX7S5KwteXsljspwJcK/HMF5QytxGKuNwHnvsg7/f1Ob8NJNA63x
 21D8cSdmkgLMwjtfCzTMIakQho2D3DYF/aQE6rTNV6BhMA858MYQJNPjjlzH0ScPpLcFNV
 N8u6gwgMpbmzbED2M0z17zwSRDdVcpE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-499-ebF9IaCDN6CXKeWsMXmqjw-1; Sat, 27 Mar 2021 14:19:43 -0400
X-MC-Unique: ebF9IaCDN6CXKeWsMXmqjw-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 5AD14180FCA0;
 Sat, 27 Mar 2021 18:19:42 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-112-12.ams2.redhat.com [10.36.112.12])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 157C78D65A;
 Sat, 27 Mar 2021 18:19:40 +0000 (UTC)
Subject: Re: [PATCH] hw: Do not include hw/sysbus.h if it is not necessary
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20210327082804.2259480-1-thuth@redhat.com>
 <f9c5e949-1790-31ae-54c7-ccfdc3c16ae9@amsat.org>
From: Thomas Huth <thuth@redhat.com>
Message-ID: <f20613c8-2a01-68b8-e4da-0387e0f63e1b@redhat.com>
Date: Sat, 27 Mar 2021 19:19:39 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <f9c5e949-1790-31ae-54c7-ccfdc3c16ae9@amsat.org>
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=thuth@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=216.205.24.124; envelope-from=thuth@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -27
X-Spam_score: -2.8
X-Spam_bar: --
X-Spam_report: (-2.8 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.001,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 NICE_REPLY_A=-0.001, RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H4=0.001,
 RCVD_IN_MSPIKE_WL=0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Cc: qemu-trivial@nongnu.org, qemu-s390x@nongnu.org, qemu-arm@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: MPM91GS5sOyY

On 27/03/2021 15.54, Philippe Mathieu-Daudé wrote:
> Hi Thomas,
> 
> On 3/27/21 9:28 AM, Thomas Huth wrote:
>> Many files include hw/sysbus.h without needing it. Remove the superfluous
>> include statements.
>>
>> Signed-off-by: Thomas Huth <thuth@redhat.com>
>> ---
>>   hw/arm/cubieboard.c         | 1 -
>>   hw/arm/orangepi.c           | 1 -
>>   hw/char/riscv_htif.c        | 1 -
>>   hw/char/sifive_uart.c       | 1 -
>>   hw/char/virtio-serial-bus.c | 1 -
>>   hw/core/generic-loader.c    | 1 -
>>   hw/core/guest-loader.c      | 1 -
>>   hw/ide/ahci_internal.h      | 1 -
>>   hw/input/lasips2.c          | 1 -
>>   hw/intc/arm_gic_kvm.c       | 1 -
>>   hw/intc/arm_gicv3.c         | 1 -
>>   hw/intc/arm_gicv3_kvm.c     | 1 -
>>   hw/intc/s390_flic_kvm.c     | 1 -
>>   hw/isa/lpc_ich9.c           | 1 -
>>   hw/isa/piix4.c              | 1 -
>>   hw/moxie/moxiesim.c         | 1 -
>>   hw/nios2/generic_nommu.c    | 1 -
>>   hw/nubus/nubus-bus.c        | 1 -
>>   hw/nvram/spapr_nvram.c      | 1 -
>>   hw/rx/rx-gdbsim.c           | 1 -
>>   hw/s390x/s390-ccw.c         | 1 -
>>   hw/s390x/virtio-ccw.c       | 1 -
>>   hw/timer/mips_gictimer.c    | 1 -
>>   hw/usb/xen-usb.c            | 1 -
>>   hw/vfio/ap.c                | 1 -
>>   hw/vfio/ccw.c               | 1 -
>>   hw/xen/xen-bus-helper.c     | 1 -
>>   27 files changed, 27 deletions(-)
> 
> $ git grep -l '#include "hw/sysbus.h"' hw \
>    | xargs git grep -L sysbus_ \
>    | xargs git grep -L 'SysBusDevice\s\+\w'
> 
> hw/arm/cubieboard.c
> hw/arm/orangepi.c
> hw/char/riscv_htif.c
> hw/char/sifive_uart.c
> hw/char/virtio-serial-bus.c
> hw/core/generic-loader.c
> hw/core/guest-loader.c
> hw/hyperv/vmbus.c
> hw/i386/x86-iommu.c
> hw/ide/ahci_internal.h
> hw/input/lasips2.c
> hw/intc/arm_gic_kvm.c
> hw/intc/arm_gicv3.c
> hw/intc/arm_gicv3_kvm.c
> hw/intc/s390_flic_kvm.c
> hw/isa/lpc_ich9.c
> hw/isa/piix4.c
> hw/moxie/moxiesim.c
> hw/nios2/generic_nommu.c
> hw/nubus/nubus-bridge.c
> hw/nubus/nubus-bus.c
> hw/nvram/spapr_nvram.c
> hw/ppc/spapr_pci.c
> hw/riscv/riscv_hart.c
> hw/rx/rx-gdbsim.c
> hw/s390x/s390-ccw.c
> hw/s390x/virtio-ccw.c
> hw/timer/mips_gictimer.c
> hw/tricore/tc27x_soc.c
> hw/usb/xen-usb.c
> hw/vfio/ap.c
> hw/vfio/ccw.c
> hw/xen/xen-bus-helper.c
> 
> diff with your set:
> 
> @@ -5,6 +5,8 @@
>   hw/char/virtio-serial-bus.c
>   hw/core/generic-loader.c
>   hw/core/guest-loader.c
> +hw/hyperv/vmbus.c
> +hw/i386/x86-iommu.c
>   hw/ide/ahci_internal.h
>   hw/input/lasips2.c
>   hw/intc/arm_gic_kvm.c
> @@ -15,12 +17,16 @@
>   hw/isa/piix4.c
>   hw/moxie/moxiesim.c
>   hw/nios2/generic_nommu.c
> +hw/nubus/nubus-bridge.c
>   hw/nubus/nubus-bus.c
>   hw/nvram/spapr_nvram.c
> +hw/ppc/spapr_pci.c
> +hw/riscv/riscv_hart.c
>   hw/rx/rx-gdbsim.c
>   hw/s390x/s390-ccw.c
>   hw/s390x/virtio-ccw.c
>   hw/timer/mips_gictimer.c
> +hw/tricore/tc27x_soc.c
>   hw/usb/xen-usb.c
>   hw/vfio/ap.c
>   hw/vfio/ccw.c
> 
> 6 more candidates?

No, since those use TYPE_SYS_BUS_DEVICE and thus require hw/sysbus.h.

  Thomas

