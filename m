Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp285401wrt;
        Mon, 10 Dec 2018 23:33:17 -0800 (PST)
X-Google-Smtp-Source: AFSGD/Xm9eV9NUXSUUbyrMwc2o9uzj+V7Lb1ObnuoekQiuUZlBgD2R13ppIxScaTeChusd0OJFH0
X-Received: by 2002:aed:39e8:: with SMTP id m95mr14861704qte.317.1544513597627;
        Mon, 10 Dec 2018 23:33:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1544513597; cv=none;
        d=google.com; s=arc-20160816;
        b=KD9Bn47xSHBaq046RClo+dkBBjz03sJYdcBOs8hyt216bTU+R/+gb7c2a4PfcOOgSz
         ciHXC3IryX2+agYNXunoC1fBv/0u4V2OdPx65vndBPMPhiXN8/PdVNnhcsX0BvF9LruW
         7PimoP0DPVzfoZTE4pIWvqyK2wqObSu4BqViBVrZ+3GlsQdcAwX63RowfcDMv1iS1Sa0
         Z1AnBrblKYGem8YUiYrpQQu8G7Eiy+vFPsSFCNm5odYTQO2W1znBJ5aMkUapo8kYbecR
         QJQI4kglGsDSo79JmMDLlpSzOoD6Vufa8Fjc+Rvi2CvPrxRcAdfQcmBNx7smdXeQ0uYb
         xt5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:to;
        bh=SmMsmLSAGHXhTBy+ZENUJXZBRpzbmJ1wdR1uOi7iEs4=;
        b=fxlZSsV3VOfG5z3qjSWoU0R9Qhi0xUeU3sR/u2qh3krcTIoRqEAZTIM6kol9oXZfP5
         mt4m91bLli9GV/RfrEp7vRE7ht9q+MRI76bxSgZWfYKg6sBYmYaf3NsvLngcwiree3mQ
         sdwjaVNKyiqHnf/C3Qf4cJhAPg82H76AQt25QEwIRfbSJgLB6USnMm8nRJGqRZI0Bi6Q
         YPsfeZIfnAyEDtUGT6SzUtqh+r/kpOGTX+z3b7V5PajvQOkpcnmaoXkmy8NLgDO5nnvQ
         injBzpaxdaaMz8d260yZZt3LBfV+VILu2GEszCSmziVeJ8XhYS/zwXdhObc3XsG7icxU
         pB8w==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l11si1465963qke.87.2018.12.10.23.33.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 10 Dec 2018 23:33:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:36374 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gWcXd-0002Gv-5C
	for alex.bennee@linaro.org; Tue, 11 Dec 2018 02:33:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58351)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1gWcXQ-0002GN-Ct
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 02:33:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <clg@kaod.org>) id 1gWcXN-0001pd-3e
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 02:33:04 -0500
Received: from 1.mo2.mail-out.ovh.net ([46.105.63.121]:39794)
	by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
	(Exim 4.71) (envelope-from <clg@kaod.org>) id 1gWcXM-0001nu-RW
	for qemu-arm@nongnu.org; Tue, 11 Dec 2018 02:33:01 -0500
Received: from player688.ha.ovh.net (unknown [10.109.160.12])
	by mo2.mail-out.ovh.net (Postfix) with ESMTP id 4AA4F1757B3
	for <qemu-arm@nongnu.org>; Tue, 11 Dec 2018 08:32:58 +0100 (CET)
Received: from kaod.org (lfbn-1-10605-110.w90-89.abo.wanadoo.fr
	[90.89.196.110]) (Authenticated sender: postmaster@kaod.org)
	by player688.ha.ovh.net (Postfix) with ESMTPSA id 0C3999C831F;
	Tue, 11 Dec 2018 07:32:53 +0000 (UTC)
To: Joel Stanley <joel@jms.id.au>, Peter Maydell <peter.maydell@linaro.org>
References: <20181211031044.27628-1-joel@jms.id.au>
	<20181211031044.27628-2-joel@jms.id.au>
From: =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>
Message-ID: <6b36b24b-9cef-c741-9cfa-cda118d187f5@kaod.org>
Date: Tue, 11 Dec 2018 08:32:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.3.1
MIME-Version: 1.0
In-Reply-To: <20181211031044.27628-2-joel@jms.id.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
X-Ovh-Tracer-Id: 7505811730701323072
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedtkedrudegiedguddutdcutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
	[fuzzy]
X-Received-From: 46.105.63.121
Subject: Re: [Qemu-arm] [PATCH 1/2] aspeed: Add syscon-poweroff to guest
 device tree
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm@nongnu.org,
	qemu-devel@nongnu.org
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LM4TPs/H2s6+

On 12/11/18 4:10 AM, Joel Stanley wrote:
> This adds a node to the guest's device tree that allows it to cause Qem=
u
> to exit when the guest shuts down.

Do you think we could find a way to add the same node under U-Boot for=20
tests using flash images ? or could we just add the node in DT ? Would
that be a problem on real system ?     =20


Nevertheless, this is fine.

Reviewed-by: C=C3=A9dric Le Goater <clg@kaod.org>

Thanks,

C.


> Signed-off-by: Joel Stanley <joel@jms.id.au>
> ---
>  hw/arm/aspeed.c | 33 +++++++++++++++++++++++++++++++++
>  1 file changed, 33 insertions(+)
>=20
> diff --git a/hw/arm/aspeed.c b/hw/arm/aspeed.c
> index 515898548284..00060d44ad51 100644
> --- a/hw/arm/aspeed.c
> +++ b/hw/arm/aspeed.c
> @@ -21,8 +21,10 @@
>  #include "hw/i2c/smbus.h"
>  #include "qemu/log.h"
>  #include "sysemu/block-backend.h"
> +#include "sysemu/device_tree.h"
>  #include "hw/loader.h"
>  #include "qemu/error-report.h"
> +#include <libfdt.h>
> =20
>  static struct arm_boot_info aspeed_board_binfo =3D {
>      .board_id =3D -1, /* device-tree-only board */
> @@ -126,6 +128,36 @@ static void write_boot_rom(DriveInfo *dinfo, hwadd=
r addr, size_t rom_size,
>      g_free(storage);
>  }
> =20
> +static void fdt_add_shutdown_node(void *fdt)
> +{
> +    const char *nodename =3D "/syscon-poweroff";
> +    uint32_t phandle;
> +    int offset;
> +
> +    /* Find the scu phandle */
> +    offset =3D fdt_path_offset(fdt, "/ahb/apb/syscon@1e6e2000");
> +    if (offset < 0) {
> +        error_report("%s couldn't find syscon, guest shutdown unavaila=
ble: %s",
> +                     __func__, fdt_strerror(offset));
> +        return;
> +    }
> +    phandle =3D fdt_get_phandle(fdt, offset);
> +
> +    /* Add syscon-poweroff node and use 0x1A0, an un-used SCU register=
 */
> +    qemu_fdt_add_subnode(fdt, nodename);
> +    qemu_fdt_setprop_string(fdt, nodename, "compatible", "syscon-power=
off");
> +    qemu_fdt_setprop_cells(fdt, nodename, "regmap", phandle);
> +    qemu_fdt_setprop_cells(fdt, nodename, "offset", 0x1A0);
> +    qemu_fdt_setprop_cells(fdt, nodename, "value", 1);
> +}
> +
> +static void aspeed_board_modify_dtb(const struct arm_boot_info *binfo,
> +                                    void *fdt)
> +{
> +    fdt_add_shutdown_node(fdt);
> +}
> +
> +
>  static void aspeed_board_init_flashes(AspeedSMCState *s, const char *f=
lashtype,
>                                        Error **errp)
>  {
> @@ -228,6 +260,7 @@ static void aspeed_board_init(MachineState *machine=
,
>      aspeed_board_binfo.kernel_cmdline =3D machine->kernel_cmdline;
>      aspeed_board_binfo.ram_size =3D ram_size;
>      aspeed_board_binfo.loader_start =3D sc->info->sdram_base;
> +    aspeed_board_binfo.modify_dtb =3D aspeed_board_modify_dtb;
> =20
>      if (cfg->i2c_init) {
>          cfg->i2c_init(bmc);
>=20

