Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp926447wrp;
        Wed, 25 Sep 2019 08:17:08 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwrD2VGcg2nLQmgqJpBS0ZJDxSPTAX7nZVI2Oox6sdIfh8GY41FTCQiZfYJbu72fbWvAmRk
X-Received: by 2002:ad4:4772:: with SMTP id d18mr8027249qvx.100.1569424627925;
        Wed, 25 Sep 2019 08:17:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569424627; cv=none;
        d=google.com; s=arc-20160816;
        b=1FjbssRVt/vwyrmpfOWj0oXSfwY4Yg1b770VWBWryV+x0vRNhtGTYEzZ0WzW2tqgIm
         iXUWVVu+o3HhvtOG5V4F3+6Sj7n7KSYla6V2VPvO5mAQybLWVYs4HamGhjQXYZk8fGds
         V+Y4ubMlQ4jpEk/FdBsdcz2FW/po6+s4jy+l8HCvvYEC0rQxv3lVer9EjGmTkvgRAtrW
         5pVuUHraozmmVo2KajGjFxjFL/Aui4Tp6aYYqTVQTQ4o9glHI27W5Dm3pb7UdRLsBEMA
         YSpLblaSEB+A/3ltX0NTGvw8vZC2JOSfQh2K72IGyhT51OVdao17qEE74KNpl5XYtwXH
         zpVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:subject:to:from:date;
        bh=zndOHvlAw+hJSl1ggMLzZCCSI96ODK7NeThLZMA9EEQ=;
        b=MXe8kCR3TaMnTTbhzAy6iVWWdztnIPV9V+aobzQpvCHSiFehDfHiMBVHP1/z+p/6kG
         frRt7sw8GxiZlypniSRcMQMPF3AC7BgMv8RHRYhhjnCNdzi8Mu2m6nNfkHAYof97SivL
         UYuIKMKY+hs2b7MJqcj819mpK8MV9lBFvR6suPdE1FevI/qHTZ2jpAhkjyFf01m5NkIy
         GGLNNVElvWlOG62jCxvS9S0T64/C9Aww9LnbcNru+RrXKcWyb9T+PBbvQSvq/gazggUo
         7SKjiSmesvl78qeyiISCmoqOvlVg/SN4Qxo2MQuFCH5OdtWb6Cc/OV0mDTUHLSaKy/Q2
         R/TA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id r10si4013971qvd.142.2019.09.25.08.17.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 25 Sep 2019 08:17:07 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:53522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iD92Q-0007LD-Cg
	for alex.bennee@linaro.org; Wed, 25 Sep 2019 11:17:06 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59000)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <imammedo@redhat.com>) id 1iD8w5-0001Za-QO
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 11:10:34 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <imammedo@redhat.com>) id 1iD8w4-0007IA-Gx
 for qemu-arm@nongnu.org; Wed, 25 Sep 2019 11:10:33 -0400
Received: from mx1.redhat.com ([209.132.183.28]:52780)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <imammedo@redhat.com>)
 id 1iD8w4-0007Fr-8A; Wed, 25 Sep 2019 11:10:32 -0400
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
 [10.5.11.22])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 608E8315C037;
 Wed, 25 Sep 2019 15:10:30 +0000 (UTC)
Received: from Igors-MacBook-Pro (ovpn-112-17.ams2.redhat.com [10.36.112.17])
 by smtp.corp.redhat.com (Postfix) with ESMTP id D503D10027B8;
 Wed, 25 Sep 2019 15:10:02 +0000 (UTC)
Date: Wed, 25 Sep 2019 17:09:59 +0200
From: Igor Mammedov <imammedo@redhat.com>
To: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
Subject: Re: [Qemu-devel] [PATCH-for-4.2 v11 09/11] docs/specs: Add ACPI GED
 documentation
Message-ID: <20190925170959.399b7302@Igors-MacBook-Pro>
In-Reply-To: <20190918130633.4872-10-shameerali.kolothum.thodi@huawei.com>
References: <20190918130633.4872-1-shameerali.kolothum.thodi@huawei.com>
 <20190918130633.4872-10-shameerali.kolothum.thodi@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.41]); Wed, 25 Sep 2019 15:10:30 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
 [fuzzy]
X-Received-From: 209.132.183.28
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
 shannon.zhaosl@gmail.com, mst@redhat.com, qemu-devel@nongnu.org,
 xuwei5@hisilicon.com, linuxarm@huawei.com, eric.auger@redhat.com,
 qemu-arm@nongnu.org, sebastien.boeuf@intel.com, lersek@redhat.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LhVGb3RA+e10

On Wed, 18 Sep 2019 14:06:31 +0100
Shameer Kolothum <shameerali.kolothum.thodi@huawei.com> wrote:

> Documents basic concepts of ACPI Generic Event device(GED)
> and interface between QEMU and the ACPI BIOS.
> 
> Signed-off-by: Shameer Kolothum <shameerali.kolothum.thodi@huawei.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>

Reviewed-by: Igor Mammedov <imammedo@redhat.com>

> ---
> Addressed Peter's comments,
>  -changed to rst format.
>  -typo/grammer corrections.
> ---
>  docs/specs/acpi_hw_reduced_hotplug.rst | 70 ++++++++++++++++++++++++++
>  docs/specs/index.rst                   |  1 +
>  2 files changed, 71 insertions(+)
>  create mode 100644 docs/specs/acpi_hw_reduced_hotplug.rst
> 
> diff --git a/docs/specs/acpi_hw_reduced_hotplug.rst b/docs/specs/acpi_hw_reduced_hotplug.rst
> new file mode 100644
> index 0000000000..911a98255b
> --- /dev/null
> +++ b/docs/specs/acpi_hw_reduced_hotplug.rst
> @@ -0,0 +1,70 @@
> +==================================================
> +QEMU and ACPI BIOS Generic Event Device interface
> +==================================================
> +
> +The ACPI *Generic Event Device* (GED) is a HW reduced platform
> +specific device introduced in ACPI v6.1 that handles all platform
> +events, including the hotplug ones. GED is modelled as a device
> +in the namespace with a _HID defined to be ACPI0013. This document
> +describes the interface between QEMU and the ACPI BIOS.
> +
> +GED allows HW reduced platforms to handle interrupts in ACPI ASL
> +statements. It follows a very similar approach to the _EVT method
> +from GPIO events. All interrupts are listed in  _CRS and the handler
> +is written in _EVT method. However, the QEMU implementation uses a
> +single interrupt for the GED device, relying on an IO memory region
> +to communicate the type of device affected by the interrupt. This way,
> +we can support up to 32 events with a unique interrupt.
> +
> +**Here is an example,**
> +
> +::
> +
> +   Device (\_SB.GED)
> +   {
> +       Name (_HID, "ACPI0013")
> +       Name (_UID, Zero)
> +       Name (_CRS, ResourceTemplate ()
> +       {
> +           Interrupt (ResourceConsumer, Edge, ActiveHigh, Exclusive, ,, )
> +           {
> +               0x00000029,
> +           }
> +       })
> +       OperationRegion (EREG, SystemMemory, 0x09080000, 0x04)
> +       Field (EREG, DWordAcc, NoLock, WriteAsZeros)
> +       {
> +           ESEL,   32
> +       }
> +       Method (_EVT, 1, Serialized)
> +       {
> +           Local0 = ESEL // ESEL = IO memory region which specifies the
> +                         // device type.
> +           If (((Local0 & One) == One))
> +           {
> +               MethodEvent1()
> +           }
> +           If ((Local0 & 0x2) == 0x2)
> +           {
> +               MethodEvent2()
> +           }
> +           ...
> +       }
> +   }
> +
> +GED IO interface (4 byte access)
> +--------------------------------
> +**read access:**
> +
> +::
> +
> +   [0x0-0x3] Event selector bit field (32 bit) set by QEMU.
> +
> +    bits:
> +       0: Memory hotplug event
> +       1: System power down event
> +    2-31: Reserved
> +
> +**write_access:**
> +
> +Nothing is expected to be written into GED IO memory
> diff --git a/docs/specs/index.rst b/docs/specs/index.rst
> index 40adb97c5e..984ba44029 100644
> --- a/docs/specs/index.rst
> +++ b/docs/specs/index.rst
> @@ -12,3 +12,4 @@ Contents:
>  
>     ppc-xive
>     ppc-spapr-xive
> +   acpi_hw_reduced_hotplug

