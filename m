Received: by 10.25.208.211 with SMTP id h202csp914687lfg;
        Tue, 15 Mar 2016 19:09:52 -0700 (PDT)
X-Received: by 10.55.71.76 with SMTP id u73mr1796103qka.6.1458094191997;
        Tue, 15 Mar 2016 19:09:51 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c68si1149093qge.29.2016.03.15.19.09.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 15 Mar 2016 19:09:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:52614 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ag0uF-0000i4-ED
	for alex.bennee@linaro.org; Tue, 15 Mar 2016 22:09:51 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:44519)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thomas.hanson@linaro.org>) id 1afvZU-0003qs-2O
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 16:28:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <thomas.hanson@linaro.org>) id 1afvZS-0005Or-Sv
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 16:28:04 -0400
Received: from mail-ob0-x232.google.com ([2607:f8b0:4003:c01::232]:32842)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <thomas.hanson@linaro.org>) id 1afvZS-0005Ol-N2
	for qemu-arm@nongnu.org; Tue, 15 Mar 2016 16:28:02 -0400
Received: by mail-ob0-x232.google.com with SMTP id fz5so30113440obc.0
	for <qemu-arm@nongnu.org>; Tue, 15 Mar 2016 13:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc; bh=H2/lU8CL0Jjd5pW55MOzbZnagQfSVLOPESZPF14ypn4=;
	b=hq4+F/6mI59dT0w7SXGJEN1mOdNaG+M2BBcizp/6kzMzRGzTar7LN/cCIF8WLeeYXR
	fGZbrFW7srun4EGjUuega2Ek3w8FrstJU3ZF3ug2C9FAjuI5uCKlj1jB81D4VBmOlq4c
	tIfnFE3TxRXddds12DfcQ7Q3aUpw55HydLLG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:cc;
	bh=H2/lU8CL0Jjd5pW55MOzbZnagQfSVLOPESZPF14ypn4=;
	b=fVb3/vOZO4kOKFhea3vZXNrLIaKEbHbN0de99UPFEICOTzMeeYQZCI246nH6A44vTn
	1TYxrm7BL/cmrkUN179cv+tXXoUQFF3boq2pith3/alftQI8qUM3l6W4wPBixrtecD56
	8OVUT1ApxPVL3PJabQ9SQ1eu27wKULHgsK6uwgH4t6zn9VpOeK7h/Wa7gYu+240kWNPH
	ueqNcB21SOCZPwmZD9qAgJUDcB4DmmFYHS5G9QwzjHTxhl1rN8FJALqCt090VZsDGlEH
	OeW7xYFQOjJRYkdcPOmNaFzuzjWMAIfn2a8mRHQ+9GBp4pd8cnxzsa74SoAjQACX4RMC
	8+EQ==
X-Gm-Message-State: AD7BkJJKQv9ugUoY19DdhzNlp7d384dlWTKsJLS7hn4SWlQ+HGcm2ZI3rsaqXoEJi1GuWlXOWKTs3cXvaoFpHAKR
MIME-Version: 1.0
X-Received: by 10.60.50.98 with SMTP id b2mr5605oeo.38.1458073682206; Tue, 15
	Mar 2016 13:28:02 -0700 (PDT)
Received: by 10.157.6.36 with HTTP; Tue, 15 Mar 2016 13:28:02 -0700 (PDT)
In-Reply-To: <1458061009-7733-1-git-send-email-peter.maydell@linaro.org>
References: <1458061009-7733-1-git-send-email-peter.maydell@linaro.org>
Date: Tue, 15 Mar 2016 14:28:02 -0600
Message-ID: <CAA8zJ3AxgAAKzHr_sALQQ1VT5fTHRNrxot4--VREtZ2-6kK92w@mail.gmail.com>
From: Thomas Hanson <thomas.hanson@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c01::232
X-Mailman-Approved-At: Tue, 15 Mar 2016 22:09:50 -0400
Cc: patches@linaro.org, hitmoon <zxq_yx_007@163.com>, qemu-devel@nongnu.org,
	qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>,
	=?UTF-8?Q?Andreas_F=C3=A4rber?= <afaerber@suse.de>
Subject: Re: [Qemu-arm] [PATCH] sd: Fix "info qtree" on boards with SD cards
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
X-TUID: cu53cwe16eCz

The patch looks good.

Would it also be good to update bus_add_child() so that it NULL-checks
its "bus" parameter before dereferencing it?

-Tom

On 15 March 2016 at 10:56, Peter Maydell <peter.maydell@linaro.org> wrote:
> The SD card object is not a SysBusDevice, so don't create it with
> qdev_create() if we're not assigning it to a specific bus; use
> object_new() instead.
>
> This was causing 'info qtree' to segfault on boards with SD cards,
> because qdev_create(NULL, TYPE_FOO) puts the created object on the
> system bus, and then we may try to run functions like sysbus_dev_print()
> on it, which fail when casting the object to SysBusDevice.
>
> (This is the same mistake that we made with the NAND device
> and fixed in commit 6749695eaaf346c1.)
>
> Reported-by: hitmoon <zxq_yx_007@163.com>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> ---
> I assume that using qdev_create() for non-SysBus devices is
> OK if we are passing in a specific bus pointer, because we do
> this already for various things including PCI devices. The
> various "properly QOMified" uses of TYPE_SD_CARD do that; only
> this sd_init() function for the legacy uses doesn't.
> ---
>  hw/sd/sd.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index 00c320d..1568057 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -563,17 +563,19 @@ static const VMStateDescription sd_vmstate = {
>  /* Legacy initialization function for use by non-qdevified callers */
>  SDState *sd_init(BlockBackend *blk, bool is_spi)
>  {
> +    Object *obj;
>      DeviceState *dev;
>      Error *err = NULL;
>
> -    dev = qdev_create(NULL, TYPE_SD_CARD);
> +    obj = object_new(TYPE_SD_CARD);
> +    dev = DEVICE(obj);
>      qdev_prop_set_drive(dev, "drive", blk, &err);
>      if (err) {
>          error_report("sd_init failed: %s", error_get_pretty(err));
>          return NULL;
>      }
>      qdev_prop_set_bit(dev, "spi", is_spi);
> -    object_property_set_bool(OBJECT(dev), true, "realized", &err);
> +    object_property_set_bool(obj, true, "realized", &err);
>      if (err) {
>          error_report("sd_init failed: %s", error_get_pretty(err));
>          return NULL;
> --
> 1.9.1
>
>
