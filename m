Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3745143wrt;
        Fri, 30 Nov 2018 08:07:16 -0800 (PST)
X-Google-Smtp-Source: AFSGD/X404LSE7XOAs0XhP7YCAkB9JlYuQHE+qyR6w2umyc/T76z58NNCwn+RXGUy/1HTx/2yIK/
X-Received: by 2002:a25:27c4:: with SMTP id n187-v6mr5774425ybn.153.1543594036873;
        Fri, 30 Nov 2018 08:07:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543594036; cv=none;
        d=google.com; s=arc-20160816;
        b=a/imM4m82TvhBA97gle6FY+AA7pkwWRQnYzydvmusxZP7WO5kbfgAN8RhmP2ukWlq2
         NOQBqOtzvU0hREzgbbVEjtfF8z+UBI9xzHpWr3wzqO/A6wPCInVml5lqSQXOlxUeYNH5
         5463zafEjOybKyXMlTswdzUx7eONthWWxtwkLjqFTDT9iMA2pF329DEY5q/qcbpKl3OK
         rXRbhXyc+5oycAXEcfll93vBrcDT0ww+tgJu8NlGMxENmUtxeDCHHAC0cncO5sV0zPmb
         zp4ZmKe2AXlVZRnEOAm48kcfemX+TiInzG/cFrkLgm7S2OVyP0cDmBtOXSqzj4I406vf
         Pphg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:user-agent:in-reply-to
         :content-disposition:mime-version:references:message-id:to:from:date;
        bh=BadtnaBUY2oUfRq+0qXU4WsoRmAzpscmGxp0yCMg+Xk=;
        b=E5N3PXkiAxZ0S9B7gDZ/G7ZYwi81WhxuRsNs5yqY41wxSBm5q0aNo+qsveQ0raiHde
         yilX/h+zjpqy5VzMiGkMZX949wseJZd4uPgnwv5CNRLwkLoeuhFxnuDVTCNdK5aryDiZ
         nUQDYILglcY1LGU2GbqPro9v9NGyF1R2eszswMPZbS4LP+ID1a9QnJvea2NBXxPoc5Aa
         6g61rgXw+5a47hHF+LQmBZ2Jflk9Wy9ryMO+FhWnzBr+4235/x13K1w911PsuoqvaBn0
         AXeBSWcb9/Qnvpjyu/WUv+nio0SS09RHFmrFCAHgV32Lj7M60O6jiSZkj3w0slUAk6Lo
         uyEA==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b124-v6si3022832ybh.357.2018.11.30.08.07.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 08:07:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:33565 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSlK0-0000ro-AL
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 11:07:16 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gSlJq-0000rT-Ai
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 11:07:08 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <drjones@redhat.com>) id 1gSlJm-0002Cw-Vi
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 11:07:06 -0500
Received: from mx1.redhat.com ([209.132.183.28]:41719)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <drjones@redhat.com>)
	id 1gSlJm-0002CD-PO; Fri, 30 Nov 2018 11:07:02 -0500
Received: from smtp.corp.redhat.com (int-mx07.intmail.prod.int.phx2.redhat.com
	[10.5.11.22])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 9C6393001A79;
	Fri, 30 Nov 2018 16:07:01 +0000 (UTC)
Received: from kamzik.brq.redhat.com (unknown [10.43.2.160])
	by smtp.corp.redhat.com (Postfix) with ESMTPS id 587491057FA2;
	Fri, 30 Nov 2018 16:06:56 +0000 (UTC)
Date: Fri, 30 Nov 2018 17:06:53 +0100
From: Andrew Jones <drjones@redhat.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Message-ID: <20181130160653.adccrrdtgr5vtey6@kamzik.brq.redhat.com>
References: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
	<1543407172-16175-6-git-send-email-peng.hao2@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1543407172-16175-6-git-send-email-peng.hao2@zte.com.cn>
User-Agent: NeoMutt/20180716
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.22
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.44]);
	Fri, 30 Nov 2018 16:07:01 +0000 (UTC)
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH V10 5/9] hw/arm/virt: add
 pvpanic device in virt acpi table
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
Cc: peter.maydell@linaro.org, qemu-arm@nongnu.org, philmd@redhat.com,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: JDxKSCLCLIlz

On Wed, Nov 28, 2018 at 08:12:48PM +0800, Peng Hao wrote:
> Add pvpanic device in virt acpi table, so when kenrel command line
> uses acpi=force, kernel can get info from acpi table.
> 
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  hw/arm/virt-acpi-build.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/hw/arm/virt-acpi-build.c b/hw/arm/virt-acpi-build.c
> index 5785fb6..2adba60 100644
> --- a/hw/arm/virt-acpi-build.c
> +++ b/hw/arm/virt-acpi-build.c
> @@ -84,6 +84,20 @@ static void acpi_dsdt_add_uart(Aml *scope, const MemMapEntry *uart_memmap,
>      aml_append(scope, dev);
>  }
>  
> +static void acpi_dsdt_add_pvpanic(Aml *scope, const MemMapEntry *pvpanic_memmap)
> +{
> +    Aml *dev = aml_device("PEVT");
> +    aml_append(dev, aml_name_decl("_HID", aml_string("QEMU0001")));
> +    aml_append(dev, aml_name_decl("_UID", aml_int(0)));
> +
> +    Aml *crs = aml_resource_template();
> +    aml_append(crs, aml_memory32_fixed(pvpanic_memmap->base,
> +                                       pvpanic_memmap->size, AML_READ_WRITE));
> +
> +    aml_append(dev, aml_name_decl("_CRS", crs));
> +    aml_append(scope, dev);
> +}
> +
>  static void acpi_dsdt_add_fw_cfg(Aml *scope, const MemMapEntry *fw_cfg_memmap)
>  {
>      Aml *dev = aml_device("FWCF");
> @@ -771,6 +785,7 @@ build_dsdt(GArray *table_data, BIOSLinker *linker, VirtMachineState *vms)
>      acpi_dsdt_add_uart(scope, &memmap[VIRT_UART],
>                         (irqmap[VIRT_UART] + ARM_SPI_BASE));
>      acpi_dsdt_add_flash(scope, &memmap[VIRT_FLASH]);
> +    acpi_dsdt_add_pvpanic(scope, &memmap[VIRT_PVPANIC]);
>      acpi_dsdt_add_fw_cfg(scope, &memmap[VIRT_FW_CFG]);
>      acpi_dsdt_add_virtio(scope, &memmap[VIRT_MMIO],
>                      (irqmap[VIRT_MMIO] + ARM_SPI_BASE), NUM_VIRTIO_TRANSPORTS);
> -- 
> 1.8.3.1
> 
>

Reviewed-by: Andrew Jones <drjones@redhat.com>
