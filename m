Received: by 2002:a05:6000:88:0:0:0:0 with SMTP id m8csp2472238wrx;
        Sun, 7 Apr 2019 06:16:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxhEKfYUWQ0ZYNuckwTHYsFLUKp9qn7aBJfqcmUKe29EC1iJbTmFyEG30/lbS46W3QbHJWJ
X-Received: by 2002:a1c:720a:: with SMTP id n10mr13765169wmc.107.1554642994319;
        Sun, 07 Apr 2019 06:16:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1554642994; cv=none;
        d=google.com; s=arc-20160816;
        b=EXy/7XzHjp53JVXIVdT/6jrsDLg4nazqiazZ+sJFBQzQjGM171KKTHvAw4z+3GLS8f
         CJU/Nr40gvQBtA+4A5rWsOUEEMNbccGyhecGoIOeLr31MMFitddJBxAJEDpXbAjFsZkK
         ++ut28uQ1laScxMdfUjG9H3TRzOkK3oRfKTWaxdIrUpYwpS6kwHPhCFXxOjWJyPVPmTN
         PxI3JRwR+sTUinjriYx/0TRK/lDCrjM7YTVkf3RgArDtH76pENuOtqRilHV7jypiGaEK
         2PEUDRwFueyN2gSR3WGGuSPxRPkALr/IvuiU/guf7I8GInDg/Us/t7Zz7g8G8/p3TAO/
         Ps1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mXmHNYpKBI7HGne+BLLX6Xiqzh46cTvKOtQ4QuCI4IQ=;
        b=QRel5LjJiw4aovPnwGlNEb70JOqMZwnGEoaTjKS2mFhsxzzA56SK0bZdV+1azp2z8Q
         rnBnx5wLc3DzrXqu6hsA96KZAhVgGf1iImbOH5giu24ukgFby+/Or50ba0EiDaPyzo+I
         Ys20OULtk8jqHB4cxzyCd9m9N7dOCKcOGOG/cfx1BR8e/I2h6gL5PV7DGAibZ/b6vWP2
         jmraSBciVb1zKVWBUXqlfFDmsXTbtlEXEPnxKgQDKUNsIJJuzQbHb0nuEfO8j4LDNexF
         7eA+qhWYUhaFQat63Jr4qIoRpxV2CUEUl3mZ2u+NEVxxJolfdOMMLZw56dfyvnTW92mT
         h6MA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zf5vYvpC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x81si4602266wmg.167.2019.04.07.06.16.34
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Sun, 07 Apr 2019 06:16:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=Zf5vYvpC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:39321 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hD7ez-0002OP-Ef
	for alex.bennee@linaro.org; Sun, 07 Apr 2019 09:16:33 -0400
Received: from eggs.gnu.org ([209.51.188.92]:58430)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hD7ep-0002No-Kh
	for qemu-arm@nongnu.org; Sun, 07 Apr 2019 09:16:24 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hD7eo-0002Rl-Fy
	for qemu-arm@nongnu.org; Sun, 07 Apr 2019 09:16:23 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:34668)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hD7em-0002Nf-Im
	for qemu-arm@nongnu.org; Sun, 07 Apr 2019 09:16:20 -0400
Received: by mail-oi1-x243.google.com with SMTP id v10so8423683oib.1
	for <qemu-arm@nongnu.org>; Sun, 07 Apr 2019 06:16:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=mXmHNYpKBI7HGne+BLLX6Xiqzh46cTvKOtQ4QuCI4IQ=;
	b=Zf5vYvpCgLF51Skuk0O7xjfRRSgNlgcnz0YZM1ORs6PKwJZDohwBExhhmbl6J9CY0f
	Z2a5xGqzFp1600aiw2OVWsPcQ4HiE+XUDgnRbck5uv5Fd6DNN7Tj59tFuPZWXjsjsMij
	4Sr77VHNInS9ZJk1mwy3JOqNu4PgEKRTHKdW8L5Bnh5uYS5w69enVOhBCeolkskfjZdJ
	5zhn+IURhqI5dsXFdtwvFc+MeL/CjAdGV/4TBF7e7CT1RbsjGVVL+WM06O+5DvrfCaJp
	a4/079k+DbSBXva/PPawpSE00/oq6UBq0AAR1fTCSn1vOAUmSU3K/kUBf/g29Z66qNGn
	YxGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=mXmHNYpKBI7HGne+BLLX6Xiqzh46cTvKOtQ4QuCI4IQ=;
	b=U5cEHqhxQTdWKfiqqvoVlxbZG+6eNBWvOhZ3WHM1qTJrZ6P9/UwkjuuJny6RcCt2yz
	gN7VQ3D5zwIR2d+pdthJXHB9nYt5lQO1FiB7+9kHkW9xAje0RNJ2GlKqWvvoBWl00hwW
	Dzi+Z3BqPVG1poksPloX9pJBuNFXi8pzIxLwum5604fxzkzlvqZ10qql69ZznIMj44FQ
	uOXUyjjfO7VV3AQJiJ4t9zUaA3EBrhlWcU+/RvFdDjcdv39VXAsEhY51ulJWVk8L0Bvh
	DjzA92WZRww6vs2lvXN6Wm38HXwLtDwJdMw6lCGM64hxumRqsbRfj7wjn7xnQrHD9FLp
	bfMg==
X-Gm-Message-State: APjAAAU1GGpjY2agrVeKCe0aTBleHpIXPmojWIfq/+Kxhjr7GNUIoguH
	QUvGfDp1FexZp5FUYw34o72IarQpLkPlNPUuqeUu4w==
X-Received: by 2002:aca:e054:: with SMTP id x81mr12845735oig.146.1554642979512;
	Sun, 07 Apr 2019 06:16:19 -0700 (PDT)
MIME-Version: 1.0
References: <1554624893-8363-1-git-send-email-guoheyi@huawei.com>
In-Reply-To: <1554624893-8363-1-git-send-email-guoheyi@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sun, 7 Apr 2019 14:16:08 +0100
Message-ID: <CAFEAcA-N=y3k41oexvYaQ+tKj1d2tCZh8MhPvdq8Uz7dh-eWWA@mail.gmail.com>
To: Heyi Guo <guoheyi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [RFC] arm/virt: add one more uart for UEFI runtime
 debug
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
Cc: wanghaibin.wang@huawei.com, qemu-arm <qemu-arm@nongnu.org>,
	Laszlo Ersek <lersek@redhat.com>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Wg8COH+u45W3

On Sun, 7 Apr 2019 at 09:19, Heyi Guo <guoheyi@huawei.com> wrote:
>
> This patch is based on the discussion in TianoCore edk2-devel mailing
> list:
> https://lists.01.org/pipermail/edk2-devel/2019-March/037986.html
>
> The conclusion is that we need an individual UART for UEFI runtime
> services to print debug message at runtime, to avoid conflicting with
> the system UART. We cannot use the secure UART either, for we may both
> have Trusted Firmware and UEFI runtime services running on the VM, and
> it is not easy to keep synchronization between the two components.

I don't think it makes much sense to keep adding UARTs for every
bit of the system software stack. We don't have an infinite
supply of UARTs on real hardware either -- how is this handled
there ?

Also adding new UARTs to this board is awkward because of
the weird choices various bits of software have made in
reading the dtb and picking a UART if there's more than one
listed.

> @@ -713,13 +715,23 @@ static void create_uart(const VirtMachineState *vms, qemu_irq *pic, int uart,
>      if (uart == VIRT_UART) {
>          qemu_fdt_setprop_string(vms->fdt, "/chosen", "stdout-path", nodename);
>      } else {
> +        const char *status_string;
> +
> +        if (uart == VIRT_SECURE_UART) {
> +            status_string = "secure-status";
> +        } else {
> +            status_string = "uefi-status";

Where does this status string come from? The "secure-status" one
is documented in the device tree spec and has a well defined
meaning.

thanks
-- PMM
