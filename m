Received: by 10.182.158.201 with SMTP id ww9csp25780obb;
        Fri, 27 Nov 2015 09:17:18 -0800 (PST)
X-Received: by 10.140.84.40 with SMTP id k37mr55252437qgd.33.1448644638021;
        Fri, 27 Nov 2015 09:17:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s19si32109699qki.89.2015.11.27.09.17.17
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 27 Nov 2015 09:17:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro-org.20150623.gappssmtp.com
Received: from localhost ([::1]:57807 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a2Me5-0006JJ-Os
	for alex.bennee@linaro.org; Fri, 27 Nov 2015 12:17:17 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40783)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a2Me3-0006J0-Hi
	for qemu-arm@nongnu.org; Fri, 27 Nov 2015 12:17:16 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a2Me2-0006Xg-DZ
	for qemu-arm@nongnu.org; Fri, 27 Nov 2015 12:17:15 -0500
Received: from mail-ob0-x231.google.com ([2607:f8b0:4003:c01::231]:35887)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a2Me2-0006XZ-6s
	for qemu-arm@nongnu.org; Fri, 27 Nov 2015 12:17:14 -0500
Received: by obdgf3 with SMTP id gf3so87459735obd.3
	for <qemu-arm@nongnu.org>; Fri, 27 Nov 2015 09:17:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linaro-org.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=DtmbiFfK43AvMdpMgguDiWrp5ajGNJ1t8UfNjim6s6A=;
	b=rkJJXeEGzpGjz5jk9P6c8fORWrQcrdU9QTV6KocAlRzOTE7zJTGSSm4Ixart6JLIJz
	rOp1Bkba2CRDyIoSOFghnYWBamweZ8UIFfK6VdeEKMckrnf6o/fdMwyKx26SJYJYoHkD
	wCgSSoGJTbHC7Mh5WR6OJ3dk8gxmBZpv/YgZKPnXCgSpGLlucQfhBcVlpsMWe9lktCeL
	n4sDwl1pL2SOZjnsP3QBwuNlAsxH8m5Jt5p2vsXR8qM9bUd6a865wWWHYVnqibbqVwUt
	rCxRfRQ73rhBbEjL9jHbmih9OmMCPteHrHNzhG8EHe5/xh8WuW79WgssmOWjKq2fI3ac
	/7Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=DtmbiFfK43AvMdpMgguDiWrp5ajGNJ1t8UfNjim6s6A=;
	b=B2pxwXl2OmKzHFeReJ/xueVVgd4IAJRRVOLVCo5nHt0vGRpdb5mKxyQCuQ7qoygPyA
	+UVibNKxpG4NDVIx6Ts8zT94ZrSuupTR6Yc6Sonn/wug8zJFd+xQhcRmkdpnpCPwIdHz
	2lEVbeU3EynP5vPvfeqmymUuKn3obrVvX0Qx9RhvSrlkncFQyUD7EuM+StQdSUdN2mPz
	15tn1AVO3/u73iP6sQWornMBLT+2886P/EJS5Tso+BtxACJYJF2OJ7AeyXmP2RNWJW6I
	jzzePHjDMkwpWUGK8JK8nkdKK4/I0rsJJ1HRibaiDX2CBBoQjxOxLAssQokuRAs5xpeB
	nFaQ==
X-Gm-Message-State: ALoCoQlE+L4huJWaikNe5nOMQvCihGUuWVjq4DiA09ucOgpwz0oJ1Ge6+XwSIDtgiUwf30YwcKQ5
X-Received: by 10.60.233.103 with SMTP id tv7mr35655772oec.69.1448644633385;
	Fri, 27 Nov 2015 09:17:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.72.68 with HTTP; Fri, 27 Nov 2015 09:16:53 -0800 (PST)
In-Reply-To: <1447680189-2128-9-git-send-email-shannon.zhao@linaro.org>
References: <1447680189-2128-1-git-send-email-shannon.zhao@linaro.org>
	<1447680189-2128-9-git-send-email-shannon.zhao@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 27 Nov 2015 17:16:53 +0000
Message-ID: <CAFEAcA9YFWMb6B5qzuBpgmjn3b1f_JtEa+atUSiSkz-tyPF1TQ@mail.gmail.com>
To: Shannon Zhao <shannon.zhao@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: Error: Malformed IPv6 address
	(bad octet value).
X-Received-From: 2607:f8b0:4003:c01::231
Cc: G Gregory <graeme.gregory@linaro.org>,
	"Michael S. Tsirkin" <mst@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>,
	qemu-arm@nongnu.org, Shannon Zhao <zhaoshenglong@huawei.com>,
	Igor Mammedov <imammedo@redhat.com>
Subject: Re: [Qemu-arm] [PATCH v3 8/8] hw/arm/virt: Add gpio-keys node for
	Poweroff using DT
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 3wsDOikYeWLr

On 16 November 2015 at 13:23,  <shannon.zhao@linaro.org> wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> Add a gpio-keys node. This is used for Poweroff for the systems which
> use DT not ACPI.
>
> Signed-off-by: Shannon Zhao <zhaoshenglong@huawei.com>
> Signed-off-by: Shannon Zhao <shannon.zhao@linaro.org>
> Tested-by: Wei Huang <wei@redhat.com>
> ---
>  hw/arm/virt.c | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index cb1d45b..3394262 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -561,6 +561,7 @@ static void create_gpio(const VirtBoardInfo *vbi, qemu_irq *pic)
>
>      pl061_dev = sysbus_create_simple("pl061", base, pic[irq]);
>
> +    uint32_t phandle = qemu_fdt_alloc_phandle(vbi->fdt);
>      nodename = g_strdup_printf("/pl061@%" PRIx64, base);
>      qemu_fdt_add_subnode(vbi->fdt, nodename);
>      qemu_fdt_setprop_sized_cells(vbi->fdt, nodename, "reg",
> @@ -573,6 +574,20 @@ static void create_gpio(const VirtBoardInfo *vbi, qemu_irq *pic)
>                             GIC_FDT_IRQ_FLAGS_LEVEL_HI);
>      qemu_fdt_setprop_cell(vbi->fdt, nodename, "clocks", vbi->clock_phandle);
>      qemu_fdt_setprop_string(vbi->fdt, nodename, "clock-names", "apb_pclk");
> +    qemu_fdt_setprop_cell(vbi->fdt, nodename, "phandle", phandle);
> +
> +    qemu_fdt_add_subnode(vbi->fdt, "/gpio-keys");
> +    qemu_fdt_setprop_string(vbi->fdt, "/gpio-keys", "compatible", "gpio-keys");
> +    qemu_fdt_setprop_cell(vbi->fdt, "/gpio-keys", "#size-cells", 0);
> +    qemu_fdt_setprop_cell(vbi->fdt, "/gpio-keys", "#address-cells", 1);
> +    qemu_fdt_setprop(vbi->fdt, "/gpio-keys", "autorepeat", NULL, 0);

Why would we want the power button to autorepeat ?

> +
> +    qemu_fdt_add_subnode(vbi->fdt, "/gpio-keys/poweroff");
> +    qemu_fdt_setprop_string(vbi->fdt, "/gpio-keys/poweroff",
> +                            "label", "GPIO Key Poweroff");
> +    qemu_fdt_setprop_cell(vbi->fdt, "/gpio-keys/poweroff", "linux,code", 116);

This could use a comment /* KEY_POWER */ to indicate what 116 is.
(Alternatively, see whether we can #include "standard-headers/linux/input.h"
which #defines KEY_POWER.)

> +    qemu_fdt_setprop_cells(vbi->fdt, "/gpio-keys/poweroff",
> +                           "gpios", phandle, 3, 0);
>
>      /* connect powerdown request */
>      qemu_register_powerdown_notifier(&virt_system_powerdown_notifier);

thanks
-- PMM
