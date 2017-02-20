Received: by 10.25.0.147 with SMTP id 141csp459148lfa;
        Mon, 20 Feb 2017 03:51:18 -0800 (PST)
X-Received: by 10.200.47.129 with SMTP id l1mr18709644qta.148.1487591478704;
        Mon, 20 Feb 2017 03:51:18 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id p129si12746458qkc.253.2017.02.20.03.51.18
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 Feb 2017 03:51:18 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37675 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cfmUw-0004yf-7n
	for alex.bennee@linaro.org; Mon, 20 Feb 2017 06:51:18 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:39002)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cfmUs-0004yW-Hu
	for qemu-arm@nongnu.org; Mon, 20 Feb 2017 06:51:15 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cfmUr-0001kL-IO
	for qemu-arm@nongnu.org; Mon, 20 Feb 2017 06:51:14 -0500
Received: from mail-wm0-x22a.google.com ([2a00:1450:400c:c09::22a]:36987)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cfmUr-0001k0-BV
	for qemu-arm@nongnu.org; Mon, 20 Feb 2017 06:51:13 -0500
Received: by mail-wm0-x22a.google.com with SMTP id v77so50477268wmv.0
	for <qemu-arm@nongnu.org>; Mon, 20 Feb 2017 03:51:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=W9B+Kolep6o6FcUoOZHJdANqoYGoC5zmGrCMwQ9R2Xk=;
	b=Y4sNaOMbPl92PKmYJ+m9ecmVsefn1DB+hNGXZAic1dh3j+WdoygWPJZv+O5alnGh0p
	m3osHxdWetD9MrFIpMasPtq4xpu4WZRayGpn0wo+to1VXJT1rCpv2NGlUJ9SzfHLSXP7
	z0RY4GzNNgLFpCnWVFeVz+SNTx/da2HXNPmC4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=W9B+Kolep6o6FcUoOZHJdANqoYGoC5zmGrCMwQ9R2Xk=;
	b=mniF+CZzT5t2pHCbG06v6uGLwTglE85oJgg8sDioJzOdFwk+BJ68qRbuYsPL9ZUAdZ
	q4VXKn5DpMjvp+Kffy0k7qvvvXU1+Fg1odOSO2N0YTRegsoc8e+nYFNaNrCqmFNzFD0C
	CvNe+fMoh/8bDxggBaQs2HUqRhWib86ab3KVW+M+H8/rZgpAT7Cxnf2bA3se9ggnK/7V
	rlvgSUkM1yRgDFIaxwf3LKNxaS75f/iTLPb/pIASmKdWcenv1b6kXj1xTEMNHP9mvp8f
	YLuI3IQnpHCrPnuI0P/YEdHJhVntt+b8IcR+rVnTAhPdtJpZMReEwZcyc1rYVTXt+4IG
	H3tg==
X-Gm-Message-State: AMke39lrE5nfbeBwo7v+GU0nlnzB3H8fNwDuYJuRchtQGUyVQSR1ACd80wVZN/fSEu54SoKWC+7lhA5Og6puqTgQ
X-Received: by 10.28.157.70 with SMTP id g67mr18120068wme.111.1487591472042;
	Mon, 20 Feb 2017 03:51:12 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Mon, 20 Feb 2017 03:50:51 -0800 (PST)
In-Reply-To: <1487341525-5785-1-git-send-email-eric.auger@redhat.com>
References: <1487341525-5785-1-git-send-email-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2017 11:50:51 +0000
Message-ID: <CAFEAcA97d3kxq1XWgKMdjRB4VjSdg+tYVA5U0hhL3Af6Ja9FmA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22a
Subject: Re: [Qemu-arm] [PATCH v2] hw/arm/virt: Add a user option to
 disallow ITS instantiation
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijay Kilari <vijay.kilari@gmail.com>, eric.auger.pro@gmail.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Op9BoegpLrh7

On 17 February 2017 at 14:25, Eric Auger <eric.auger@redhat.com> wrote:
> In 2.9 ITS will block save/restore and migration use cases. As
> such let's introduce a user option that disallows its instantiation
> along with the GICv3. With no-its option turned true, migration will
> be possible, obviously at the expense of MSI support (with GICv3).
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
>
> ---
>
> v1 -> v2: fix omitted coma in object_property_set_description
>
> With this patch the option also is added in virt 2.8. I don't know
> if it is acceptable.

I think that's OK.

> ---
>  hw/arm/virt.c         | 28 +++++++++++++++++++++++++++-
>  include/hw/arm/virt.h |  1 +
>  2 files changed, 28 insertions(+), 1 deletion(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index f3440f2..c08deb0 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -605,7 +605,7 @@ static void create_gic(VirtMachineState *vms, qemu_irq *pic)
>
>      fdt_add_gic_node(vms);
>
> -    if (type == 3 && !vmc->no_its) {
> +    if (type == 3 && !vmc->no_its && !vms->no_its) {

Making the board creation code check both a vmc field and
a vms field seems a bit awkward...

> +    /* Default allows ITS instantiation */
> +    if (!vmc->no_its) {
> +        object_property_add_bool(obj, "no-its", virt_get_no_its,
> +                                 virt_set_no_its, NULL);
> +        vms->no_its = false;
> +        object_property_set_description(obj, "no-its",
> +                                        "Disallow the ITS instantiation",
> +                                        NULL);

Can we have the property be "its" with true-for-enabled,
rather than "no-its", please? (See later for rationale.)

> +    }

...if we have this code have an else {} clause we can
make it set the vms field appropriately, and then the
board creation code only needs to check the vms field.

> +
>      vms->memmap = a15memmap;
>      vms->irqmap = a15irqmap;
>  }
> diff --git a/include/hw/arm/virt.h b/include/hw/arm/virt.h
> index 58ce74e..5e73be9 100644
> --- a/include/hw/arm/virt.h
> +++ b/include/hw/arm/virt.h
> @@ -93,6 +93,7 @@ typedef struct {
>      FWCfgState *fw_cfg;
>      bool secure;
>      bool highmem;
> +    bool no_its;

Can we make this "bool its" where true means "has an ITS", please?
The fields in VirtMachineClass are all "no_foo" because we require
the "false" case to be the "new modern behaviour" and the "true"
case to be "legacy like old boards" for convenience of the
virt_machine_*_options() function chain, but we don't need to
do this for VirtMachineState fields. (So VMS 'secure', 'highmem'
and 'virt' are all true-for-feature-enabled.)
The user-facing property should also be "its" for the same reason.

An alternative to having the property be always default true
and only existing on newer boards would be to have the VMC field
be "no_default_its", expose the "its" property in all cases and
just have its default value be different for old virt-* machine
versions. I have no opinion here about which would be better.

>      bool virt;
>      int32_t gic_version;
>      struct arm_boot_info bootinfo;

thanks
-- PMM
