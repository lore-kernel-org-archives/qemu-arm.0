Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp5095559wrh;
        Tue, 30 Apr 2019 12:25:07 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyJyB6X8nRksiO0UA1CwwxmLlfWNBAjBPbNOfgJkz2mWMt6PS+qd4xd+E+6qDn7Yf3iuDES
X-Received: by 2002:a5d:424e:: with SMTP id s14mr22645041wrr.77.1556652307032;
        Tue, 30 Apr 2019 12:25:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556652307; cv=none;
        d=google.com; s=arc-20160816;
        b=BHbNdZzwDztXNjV3whwmEYGHtow5PduuMshapi4xVf7AI5TJAzTPnP0YXesfwCXG+Z
         Tpr+XrN1zU9gtXOcdhZYI2F7GLMATbRzgtGrVg3E8Kufr4FDpc+8nwGQkO0lEJkngBIZ
         gjzKgtZfio2Yo7AFiG/WkrsJAaO1c766RU1Zgjp6qpDF4y/I0DV5zhFMmNmR/xMoY+dz
         7hLLRTDqJCE4Z+mAy902Xgy/SnHM1zEQTmWmYV7oDCn6/YRef8mh9e5aOdJBCBh5LWBd
         MyW60lbwWCa1SSKmpruBkdcM1JH227Gq2jeADWezFDPOzGm/6Af8b1y5j1KCU1A9mqp5
         Ejuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:openpgp:from:references:to;
        bh=+3q2W/XxvBymSvTp+0j8mpDo60A6BvU3bfPhmQO0Upo=;
        b=mwD5QC4IejKZZh2tPsOxALAuvd2NlOvePWI2OTuZfUWDK5RNdyTFi9nozJ3XrMyDHO
         T3WxoAXux4/jMPu++D86vdVN0+P4KIsB4ovwixc/M195lBQLkyNUbdDCl6iH/bC6jFjM
         l1NMGOgj9Ukr5C9giRFKo1tVx+yyMIPNGkyipmpQitnMk43wyux6QW7ZIu6oKJ98fXg3
         QpcQ1Ki8079TAMrovetmU/vmR2z3CE0bmeJqnb/2LLjEapG2sLyqgPHBDIl5DWhJSgfB
         2xRjqcjg0gstTYx7vnKPmMAcaQf5feSpXLrsRVGLl4KSx2U/7h9b1MG6Zy7GCvFlMFY7
         U+Cw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id m18si26166626wrj.311.2019.04.30.12.25.06
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 12:25:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:52124 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLYNG-0003QM-1o
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 15:25:06 -0400
Received: from eggs.gnu.org ([209.51.188.92]:40721)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLYMe-0003AH-6s
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 15:24:29 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philmd@redhat.com>) id 1hLYKL-0002s4-Ca
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 15:22:07 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43696)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philmd@redhat.com>) id 1hLYKK-0002rR-NZ
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 15:22:04 -0400
Received: by mail-wr1-f66.google.com with SMTP id a12so22287818wrq.10
	for <qemu-arm@nongnu.org>; Tue, 30 Apr 2019 12:22:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:openpgp:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=+3q2W/XxvBymSvTp+0j8mpDo60A6BvU3bfPhmQO0Upo=;
	b=XY33nALRo6tEf0HCUdaa/uhzwjYtqvqZXkdVenIKUfB+moYvf18KW3mXbIWLnU5BSt
	bXT4HeT1Og4ZR+iTfIIbpqgnYu2Gto0lG0ZKwhIohli25O47H9r+CAdSzQ5oUCQZUG0i
	vTLv3iTRHmVT4OVCXKX3gAvIz9H80FYdiJxrthAJCH0KiBsWMpkLbYMiBKu5D2gR+npG
	DMkG/MYSllKhtndYr+t5AZDwb7VDJ72tb1lhsqfxFlK3wGpKD+b2CWNCeVOobBxj3nXG
	NFwg5PqlmjIIVtIsZahOvo9hTHQOrVfDMISWn0bsP5/N71BEkOGyWQJrKB4LEqW6TZeZ
	BBEw==
X-Gm-Message-State: APjAAAXoY+XQD/j0KDGglhIfVeL+W9V7oHFQV6ebfCW9NzgfDWtaqPjZ
	2KLUmVoJ5TQHIh7rIbGP5rB3DA==
X-Received: by 2002:adf:f50e:: with SMTP id q14mr37267330wro.48.1556652123692; 
	Tue, 30 Apr 2019 12:22:03 -0700 (PDT)
Received: from [192.168.1.33] (193.red-88-21-103.staticip.rima-tde.net.
	[88.21.103.193]) by smtp.gmail.com with ESMTPSA id
	r2sm12302833wrr.65.2019.04.30.12.22.02
	(version=TLS1_3 cipher=AEAD-AES128-GCM-SHA256 bits=128/128);
	Tue, 30 Apr 2019 12:22:02 -0700 (PDT)
To: Thomas Huth <thuth@redhat.com>, Peter Maydell <peter.maydell@linaro.org>, 
	"Michael S. Tsirkin" <mst@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>, qemu-devel@nongnu.org
References: <20190430191552.4027-1-thuth@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Openpgp: id=89C1E78F601EE86C867495CBA2A3FD6EDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xA2A3FD6EDEADC0DE
Message-ID: <1e384dcb-5f43-c718-15be-2577e1df69e0@redhat.com>
Date: Tue, 30 Apr 2019 21:22:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190430191552.4027-1-thuth@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.85.221.66
Subject: Re: [Qemu-arm] [PATCH v2] hw/pci-host: Use object_initialize_child
 for correct reference counting
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Andrey Smirnov <andrew.smirnov@gmail.com>,
	Paul Burton <pburton@wavecomp.com>, qemu-arm@nongnu.org,
	qemu-trivial@nongnu.org, Aleksandar Rikalo <arikalo@wavecomp.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: GvrAy/anppk2

On 4/30/19 9:15 PM, Thomas Huth wrote:
> Both functions, object_initialize() and object_property_add_child() increase
> the reference counter of the new object, so one of the references has to be
> dropped afterwards to get the reference counting right. Otherwise the child
> object might not be properly cleaned up when the parent gets destroyed.
> Some functions of the pci-host devices miss to drop one of the references.
> Fix it by using object_initialize_child() instead, which takes care of
> calling object_initialize(), object_property_add_child() and object_unref()
> in the right order.
> 
> Suggested-by: Eduardo Habkost <ehabkost@redhat.com>
> Signed-off-by: Thomas Huth <thuth@redhat.com>

Reviewed-by: Philippe Mathieu-Daudé <philmd@redhat.com>
Tested-by: Philippe Mathieu-Daudé <philmd@redhat.com>

> ---
>  v2: Added missing &error_abort parameter in xilinx-pcie.c

(I had this patch queued locally since pre-release, but haven't got to
respin my series yet, sorry.)

> 
>  hw/pci-host/designware.c  | 4 ++--
>  hw/pci-host/gpex.c        | 5 +++--
>  hw/pci-host/q35.c         | 4 ++--
>  hw/pci-host/xilinx-pcie.c | 4 ++--
>  4 files changed, 9 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/pci-host/designware.c b/hw/pci-host/designware.c
> index 29ea313798..64ad21d295 100644
> --- a/hw/pci-host/designware.c
> +++ b/hw/pci-host/designware.c
> @@ -721,8 +721,8 @@ static void designware_pcie_host_init(Object *obj)
>      DesignwarePCIEHost *s = DESIGNWARE_PCIE_HOST(obj);
>      DesignwarePCIERoot *root = &s->root;
>  
> -    object_initialize(root, sizeof(*root), TYPE_DESIGNWARE_PCIE_ROOT);
> -    object_property_add_child(obj, "root", OBJECT(root), NULL);
> +    object_initialize_child(obj, "root",  root, sizeof(*root),
> +                            TYPE_DESIGNWARE_PCIE_ROOT, &error_abort, NULL);
>      qdev_prop_set_int32(DEVICE(root), "addr", PCI_DEVFN(0, 0));
>      qdev_prop_set_bit(DEVICE(root), "multifunction", false);
>  }
> diff --git a/hw/pci-host/gpex.c b/hw/pci-host/gpex.c
> index 2583b151a4..1bafffcc34 100644
> --- a/hw/pci-host/gpex.c
> +++ b/hw/pci-host/gpex.c
> @@ -29,6 +29,7 @@
>   * http://www.firmware.org/1275/practice/imap/imap0_9d.pdf
>   */
>  #include "qemu/osdep.h"
> +#include "qapi/error.h"
>  #include "hw/hw.h"
>  #include "hw/pci-host/gpex.h"
>  
> @@ -120,8 +121,8 @@ static void gpex_host_initfn(Object *obj)
>      GPEXHost *s = GPEX_HOST(obj);
>      GPEXRootState *root = &s->gpex_root;
>  
> -    object_initialize(root, sizeof(*root), TYPE_GPEX_ROOT_DEVICE);
> -    object_property_add_child(obj, "gpex_root", OBJECT(root), NULL);
> +    object_initialize_child(obj, "gpex_root",  root, sizeof(*root),
> +                            TYPE_GPEX_ROOT_DEVICE, &error_abort, NULL);
>      qdev_prop_set_int32(DEVICE(root), "addr", PCI_DEVFN(0, 0));
>      qdev_prop_set_bit(DEVICE(root), "multifunction", false);
>  }
> diff --git a/hw/pci-host/q35.c b/hw/pci-host/q35.c
> index 7b871b5734..960939f5ed 100644
> --- a/hw/pci-host/q35.c
> +++ b/hw/pci-host/q35.c
> @@ -216,8 +216,8 @@ static void q35_host_initfn(Object *obj)
>      memory_region_init_io(&phb->data_mem, obj, &pci_host_data_le_ops, phb,
>                            "pci-conf-data", 4);
>  
> -    object_initialize(&s->mch, sizeof(s->mch), TYPE_MCH_PCI_DEVICE);
> -    object_property_add_child(OBJECT(s), "mch", OBJECT(&s->mch), NULL);
> +    object_initialize_child(OBJECT(s), "mch",  &s->mch, sizeof(s->mch),
> +                            TYPE_MCH_PCI_DEVICE, &error_abort, NULL);
>      qdev_prop_set_int32(DEVICE(&s->mch), "addr", PCI_DEVFN(0, 0));
>      qdev_prop_set_bit(DEVICE(&s->mch), "multifunction", false);
>      /* mch's object_initialize resets the default value, set it again */
> diff --git a/hw/pci-host/xilinx-pcie.c b/hw/pci-host/xilinx-pcie.c
> index 60309afe9e..ceb00e23e6 100644
> --- a/hw/pci-host/xilinx-pcie.c
> +++ b/hw/pci-host/xilinx-pcie.c
> @@ -149,8 +149,8 @@ static void xilinx_pcie_host_init(Object *obj)
>      XilinxPCIEHost *s = XILINX_PCIE_HOST(obj);
>      XilinxPCIERoot *root = &s->root;
>  
> -    object_initialize(root, sizeof(*root), TYPE_XILINX_PCIE_ROOT);
> -    object_property_add_child(obj, "root", OBJECT(root), NULL);
> +    object_initialize_child(obj, "root",  root, sizeof(*root),
> +                            TYPE_XILINX_PCIE_ROOT, &error_abort, NULL);
>      qdev_prop_set_int32(DEVICE(root), "addr", PCI_DEVFN(0, 0));
>      qdev_prop_set_bit(DEVICE(root), "multifunction", false);
>  }
> 
