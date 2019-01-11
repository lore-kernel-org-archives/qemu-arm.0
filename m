Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp321729wrt;
        Fri, 11 Jan 2019 08:26:50 -0800 (PST)
X-Google-Smtp-Source: ALg8bN71o+nxUVx7nvqL3PsrTOlq7DLHVBP1VVptZ0ThhBoNFQrbdhRt1R0cfMAJwwH2gQaCzolV
X-Received: by 2002:a05:6000:1c8:: with SMTP id t8mr14499075wrx.146.1547224010164;
        Fri, 11 Jan 2019 08:26:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1547224010; cv=none;
        d=google.com; s=arc-20160816;
        b=abI8F3s7Z3jy/5Cdy9q00ZBm+IFn1iWYdHUqY8ZPhLxul1NzEQByPF1VC9kRmZXGiR
         pG59WkBb5sHvI4n75lTdNgoMEJtxhV5bAWU82rn5qD3jBpGvgLL3IerSSme7IBDtpiXs
         xVgcsRIkpjmUPaVHDw2Cb+CEiGDlEpycHniZvAB0rEwksFQ9aUai6RP/RCWyM73KWAgG
         5sSmlcIbQoLxk8K5cokApG0a4lX/TsHjSIeBLqD4SGJIIUWHhpOq9Eu8yVNrt32gQNlR
         BQdlT9Ymbn1oWeiyHQnTpZmUEJ544A1ecdeiW+mh0tgNRObbEiKpRJWbIbbTFynG8Jsn
         mLxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=q/qKc0V/nrKJ9PM+51qCnyEmYfhsZVHqd7hLWMDSXgs=;
        b=tbJMjfbT3klR7ErBZQhP71Kx6cpB/L8YU9LmzDL8nmJLe9gzulJsJvSc8F/OfYXOhx
         hGhhCGk7Qo10VFJCL/xbgeTcjssf3gdMzvqSx4RokE9Kx+UvHJ5DRXKXYYrXXqnvpK1d
         gtA+o4Fx3c+Ie8ZWp3Geol5vQTEaPlyS4DYLynEDxn22pTTGKrpU0+dyEm+bzgcwzsje
         VZe45Rem77Sdn9giHyNZd5eq0B89YalozGg+jNgwtxvf+s4GJWlf7cAdCCJZb6Rrwkio
         hg+79m7t1G2vgRWszcTndMAuyf37goPs4RS+972zQ0D7cDGGzdaE3eo6+Tu32aFCJJkz
         Q1kw==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 63si44808597wrm.435.2019.01.11.08.26.50
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 11 Jan 2019 08:26:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([127.0.0.1]:38036 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ghzdx-0004oy-AU
	for alex.bennee@linaro.org; Fri, 11 Jan 2019 11:26:49 -0500
Received: from eggs.gnu.org ([209.51.188.92]:51876)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1ghzdl-0004oA-Ry
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 11:26:38 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <lersek@redhat.com>) id 1ghzdh-0000HW-Eb
	for qemu-arm@nongnu.org; Fri, 11 Jan 2019 11:26:36 -0500
Received: from mx1.redhat.com ([209.132.183.28]:33208)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <lersek@redhat.com>)
	id 1ghzdd-0000D3-DF; Fri, 11 Jan 2019 11:26:29 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com
	[10.5.11.16])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 19EE4C057F36;
	Fri, 11 Jan 2019 16:26:22 +0000 (UTC)
Received: from lacos-laptop-7.usersys.redhat.com (ovpn-120-3.rdu2.redhat.com
	[10.10.120.3])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 3891668D2A;
	Fri, 11 Jan 2019 16:26:07 +0000 (UTC)
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
	qemu-devel@nongnu.org
References: <20190111140857.4211-1-philmd@redhat.com>
	<20190111140857.4211-6-philmd@redhat.com>
From: Laszlo Ersek <lersek@redhat.com>
Message-ID: <32678400-47af-a842-0563-0d1a72712b4a@redhat.com>
Date: Fri, 11 Jan 2019 17:26:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190111140857.4211-6-philmd@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
	(mx1.redhat.com [10.5.110.32]);
	Fri, 11 Jan 2019 16:26:22 +0000 (UTC)
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 209.132.183.28
Subject: Re: [Qemu-arm] [PATCH 05/15] hw/nvram/fw_cfg: Remove various
 typedefs from "qemu/typedefs.h"
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
	Xiao Guangrong <xiaoguangrong.eric@gmail.com>,
	qemu-block@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>,
	Ben Warren <ben@skyportsystems.com>, qemu-arm@nongnu.org,
	Gerd Hoffmann <kraxel@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
	Igor Mammedov <imammedo@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: clN0hGOciJjS

On 01/11/19 15:08, Philippe Mathieu-Daud=C3=A9 wrote:
> There are only three files requiring these typedefs, let them
> include "hw/nvram/fw_cfg.h" directly to simplify "qemu/typedefs.h".
>=20
> To clean "qemu/typedefs.h", move the forward declarations
> to "hw/nvram/fw_cfg.h".
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>
> ---
>  include/hw/acpi/vmgenid.h | 1 +
>  include/hw/arm/virt.h     | 1 +
>  include/hw/mem/nvdimm.h   | 1 +
>  include/hw/nvram/fw_cfg.h | 8 +++++++-
>  include/qemu/typedefs.h   | 4 ----
>  5 files changed, 10 insertions(+), 5 deletions(-)
>=20
> diff --git a/include/hw/acpi/vmgenid.h b/include/hw/acpi/vmgenid.h
> index 38586ecbdf..be53de38f1 100644
> --- a/include/hw/acpi/vmgenid.h
> +++ b/include/hw/acpi/vmgenid.h
> @@ -3,6 +3,7 @@
> =20
>  #include "hw/acpi/bios-linker-loader.h"
>  #include "hw/qdev.h"
> +#include "hw/nvram/fw_cfg.h"
>  #include "qemu/uuid.h"
> =20
>  #define VMGENID_DEVICE           "vmgenid"
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 4cc57a7ef6..fef632dcf5 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -35,6 +35,7 @@
>  #include "qemu/notify.h"
>  #include "hw/boards.h"
>  #include "hw/arm/arm.h"
> +#include "hw/nvram/fw_cfg.h"
>  #include "sysemu/kvm.h"
>  #include "hw/intc/arm_gicv3_common.h"
> =20
> diff --git a/include/hw/mem/nvdimm.h b/include/hw/mem/nvdimm.h
> index c5c9b3c7f8..51d3a52c4b 100644
> --- a/include/hw/mem/nvdimm.h
> +++ b/include/hw/mem/nvdimm.h
> @@ -24,6 +24,7 @@
>  #define QEMU_NVDIMM_H
> =20
>  #include "hw/mem/pc-dimm.h"
> +#include "hw/nvram/fw_cfg.h"
>  #include "hw/acpi/bios-linker-loader.h"
> =20
>  #define NVDIMM_DEBUG 0
> diff --git a/include/hw/nvram/fw_cfg.h b/include/hw/nvram/fw_cfg.h
> index f5a6895a74..244ed78afa 100644
> --- a/include/hw/nvram/fw_cfg.h
> +++ b/include/hw/nvram/fw_cfg.h
> @@ -14,7 +14,9 @@
>  #define FW_CFG_IO(obj)  OBJECT_CHECK(FWCfgIoState,  (obj), TYPE_FW_CFG=
_IO)
>  #define FW_CFG_MEM(obj) OBJECT_CHECK(FWCfgMemState, (obj), TYPE_FW_CFG=
_MEM)
> =20
> -typedef struct fw_cfg_file FWCfgFile;
> +typedef struct FWCfgState FWCfgState;
> +typedef struct FWCfgIoState FWCfgIoState;
> +typedef struct FWCfgMemState FWCfgMemState;

I think the resultant file would be easier to read if you moved the
State typedefs before the spot where we make the first references to
them, namely in the FW_CFG*() function-like macros.

With that,

Reviewed-by: Laszlo Ersek <lersek@redhat.com>

Thanks
Laszlo

> =20
>  #define FW_CFG_ORDER_OVERRIDE_VGA    70
>  #define FW_CFG_ORDER_OVERRIDE_NIC    80
> @@ -24,6 +26,8 @@ typedef struct fw_cfg_file FWCfgFile;
>  void fw_cfg_set_order_override(FWCfgState *fw_cfg, int order);
>  void fw_cfg_reset_order_override(FWCfgState *fw_cfg);
> =20
> +typedef struct fw_cfg_file FWCfgFile;
> +
>  typedef struct FWCfgFiles {
>      uint32_t  count;
>      FWCfgFile f[];
> @@ -34,6 +38,8 @@ typedef struct fw_cfg_dma_access FWCfgDmaAccess;
>  typedef void (*FWCfgCallback)(void *opaque);
>  typedef void (*FWCfgWriteCallback)(void *opaque, off_t start, size_t l=
en);
> =20
> +typedef struct FWCfgEntry FWCfgEntry;
> +
>  struct FWCfgState {
>      /*< private >*/
>      SysBusDevice parent_obj;
> diff --git a/include/qemu/typedefs.h b/include/qemu/typedefs.h
> index 3a5ca74bd3..1c294c296c 100644
> --- a/include/qemu/typedefs.h
> +++ b/include/qemu/typedefs.h
> @@ -31,10 +31,6 @@ typedef struct DriveInfo DriveInfo;
>  typedef struct Error Error;
>  typedef struct EventNotifier EventNotifier;
>  typedef struct FlatView FlatView;
> -typedef struct FWCfgEntry FWCfgEntry;
> -typedef struct FWCfgIoState FWCfgIoState;
> -typedef struct FWCfgMemState FWCfgMemState;
> -typedef struct FWCfgState FWCfgState;
>  typedef struct HCIInfo HCIInfo;
>  typedef struct HVFX86EmulatorState HVFX86EmulatorState;
>  typedef struct I2CBus I2CBus;
>=20

