Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp3806462wrs;
        Mon, 2 Sep 2019 00:38:02 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwWlwFs6emVQGx/KOAL1cXTdmcvfResok83v3lUkWaxb70IRQojJxxM1mjE9KHX550qt4IE
X-Received: by 2002:ac8:60a:: with SMTP id d10mr26578278qth.31.1567409882843;
        Mon, 02 Sep 2019 00:38:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567409882; cv=none;
        d=google.com; s=arc-20160816;
        b=lt1D+W+Q4OohM0nODcP+d/9fkc0NTaIYUDWvxch5nqb7SME0Tjh05633omvdH67qR3
         /UxQvlidai1UKt5OVwPR1n3QO4Gz/6YI1tJVYAVhjSMU7VpODa/PHRD7MGitu63vxGOF
         uACCgxwgYWPKctb/dcVrYvUmKP3dv40Gcql/grE5ILQj3yL6VURUaw7LlmjPcySF0EIE
         nUB9aBOt4LYnljMGEcBzr6SYB6SEp3fpnRacQUAk7mCQPF/KOIbNSVMIeDj3MhZzzAuc
         uJxUG0OmguPPuiQjJw0341zjg8W0NJqb4Mwy57YYhWE9HAznHH40/YA4SQw4TGkWYjSL
         0b6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:references:to:from;
        bh=BOxxL0QhGQMDLup/03+G9SzvxLcyG2s3KfJHd6X6mPs=;
        b=G6qawBuJDzjAxR4YGEEuStKA5mItuN9jSp1zfzG1psWU1YReJ9HsFGd8Y/BrsXK19b
         eWyS5mPn2mPG+zDSCVAfg8hy//CGK8Dx5l/Dste0U75OY4BznHae0/I/SPtaYcMQJN7A
         KZddzT8vM+LWrPefFixePUJHZNIb+0gZMO2H7a6hcj0TzN+b1R9LLTk9Ho+8W4aLBCRh
         eJnsjn9hJsviO9jlX+buCnqMlZtd9OLbTa5PPWKD2m/hmHi1bYN9GmqUMQxwOfc4M5Hk
         dNFq/e4D8esH81gTJ8djIWWbamWGXmYwEZkPMduJxw++FLo8FCV74o7zFbCyMZKiSVmP
         xcVA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id w6si10159150qka.363.2019.09.02.00.38.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 02 Sep 2019 00:38:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33868 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i4guX-0004V6-NF
	for alex.bennee@linaro.org; Mon, 02 Sep 2019 03:38:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59641)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <eric.auger@redhat.com>) id 1i4guJ-0004V0-Ls
 for qemu-arm@nongnu.org; Mon, 02 Sep 2019 03:37:48 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <eric.auger@redhat.com>) id 1i4guH-00045K-9g
 for qemu-arm@nongnu.org; Mon, 02 Sep 2019 03:37:46 -0400
Received: from mx1.redhat.com ([209.132.183.28]:51948)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <eric.auger@redhat.com>)
 id 1i4guH-00044z-3i; Mon, 02 Sep 2019 03:37:45 -0400
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 7F8FA882F5;
 Mon,  2 Sep 2019 07:37:43 +0000 (UTC)
Received: from [10.36.116.67] (ovpn-116-67.ams2.redhat.com [10.36.116.67])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 648FA19C5B;
 Mon,  2 Sep 2019 07:37:39 +0000 (UTC)
From: Auger Eric <eric.auger@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>,
 qemu-devel@nongnu.org, qemu-arm@nongnu.org, imammedo@redhat.com
References: <20190813210539.31164-1-shameerali.kolothum.thodi@huawei.com>
 <20190813210539.31164-9-shameerali.kolothum.thodi@huawei.com>
Message-ID: <90b6bb3e-d8d9-b7ac-ab2d-786d08ebd678@redhat.com>
Date: Mon, 2 Sep 2019 09:37:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <20190813210539.31164-9-shameerali.kolothum.thodi@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.28]); Mon, 02 Sep 2019 07:37:43 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH-for-4.2 v9 08/12] hw/arm: Factor out
 powerdown notifier from GPIO
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
Cc: peter.maydell@linaro.org, sameo@linux.intel.com, ard.biesheuvel@linaro.org,
 linuxarm@huawei.com, xuwei5@hisilicon.com, shannon.zhaosl@gmail.com,
 sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uvxF262uLeDB

Hi Shameer,

On 8/13/19 11:05 PM, Shameer Kolothum wrote:
> This is in preparation of using GED device for
> system_powerdown event. Make the powerdown notifier
> registration independent of create_gpio() fn.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Reviewed-by: Eric Auger <eric.auger@redhat.com>

Thanks

Eric
> ---
>  hw/arm/virt.c         | 12 ++++--------
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 5 insertions(+), 8 deletions(-)
> 
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 56d64fc0a9..0e75213b44 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -787,10 +787,6 @@ static void virt_powerdown_req(Notifier *n, void *opaque)
>      qemu_set_irq(qdev_get_gpio_in(gpio_key_dev, 0), 1);
>  }
>  
> -static Notifier virt_system_powerdown_notifier = {
> -    .notify = virt_powerdown_req
> -};
> -
>  static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
>  {
>      char *nodename;
> @@ -831,10 +827,6 @@ static void create_gpio(const VirtMachineState *vms, qemu_irq *pic)
>                            KEY_POWER);
>      qemu_fdt_setprop_cells(vms->fdt, "/gpio-keys/poweroff",
>                             "gpios", phandle, 3, 0);
> -
> -    /* connect powerdown request */
> -    qemu_register_powerdown_notifier(&virt_system_powerdown_notifier);
> -
>      g_free(nodename);
>  }
>  
> @@ -1726,6 +1718,10 @@ static void machvirt_init(MachineState *machine)
>          vms->acpi_dev = create_acpi_ged(vms, pic);
>      }
>  
> +     /* connect powerdown request */
> +     vms->powerdown_notifier.notify = virt_powerdown_req;
> +     qemu_register_powerdown_notifier(&vms->powerdown_notifier);
> +
>      /* Create mmio transports, so the user can create virtio backends
>       * (which will be automatically plugged in to the transports). If
>       * no backend is created the transport will just sit harmlessly idle.
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 577ee49b4b..0b41083e9d 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -137,6 +137,7 @@ typedef struct {
>      int psci_conduit;
>      hwaddr highest_gpa;
>      DeviceState *acpi_dev;
> +    Notifier powerdown_notifier;
>  } VirtMachineState;
>  
>  #define VIRT_ECAM_ID(high) (high ? VIRT_HIGH_PCIE_ECAM : VIRT_PCIE_ECAM)
> 
