Received: by 10.28.71.27 with SMTP id u27csp909714wma;
        Fri, 26 Jan 2018 08:45:56 -0800 (PST)
X-Google-Smtp-Source: AH8x225hXFXrTTx464nmMD9Cz9DIG9W3EBc1fllgYqAv2DLYycGUaGMoijEhr0C7iPd08sGHIZWX
X-Received: by 10.37.183.134 with SMTP id n6mr11833129ybh.216.1516985156446;
        Fri, 26 Jan 2018 08:45:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516985156; cv=none;
        d=google.com; s=arc-20160816;
        b=wQkBwvnrG5OZ86lyihUJtKa1/+jubtCRj/Wg3XqNa/WDt2Su07bMdO5C3AKeXkG+CZ
         3lC2RNCtP8gsOL/uGAngn4eSsxfXBRRQhsnL6uxObm+PQONDgIxa8+fOEyCO6DVz4vD8
         hN4jM+Odhb3NT60ZMp24erfFF4jbWXsGUax2GTeqIBbWNpK8waO+K82Z0Rp//GAMhjcS
         KbiorFAPOaF9uSCBRKtlZOvVwaDE/RlaSIigG2x7YoeS6PY0xUSVuvbZZpW+oTYdfnDo
         2RJYG0M6tb5rU2hwNImHMDWc7GwpaPk/ED1wiu8veBvqRLKOQfBtEP+Le2wYLDo8PFta
         lNBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=1Vg2pbggVnGrHJUxajLBbb0a41KlzEFHbzHTwZ4Hbl8=;
        b=SfbyzvW6G395Z7O4oAk0ERuVJOV6ptCpGBaROGGxvoeG9gbPunXrcPDQuPZf4DW3kg
         PX33eEkeDeAxhYWdPQ8h85/aotMeDfKixMKHhJ0llPdK3ET/bEQ5pIJS5DCiPGOIKXpG
         7Ccczu43sjoxUn0aqIYR5wYS8kn3z+QhwjHqV3mYsSkXOqJeaHJBnBUlsXxYoNWp4WlP
         1QEpso2/mCsX2JNwNtMS9upqQTQrh+M0djsIe9xqueC6p3+g1Sp0lFQITiXPI+zHbrHv
         OaYgxVwW0Qk6VojeOHOrTvrycRm15kln+RgQS+k4gSvaZLqGFc13DgTrd6q+RhP+JNmu
         eoZA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iiKHqs7o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z24si27309ybi.606.2018.01.26.08.45.56
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Jan 2018 08:45:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=iiKHqs7o;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37652 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ef78V-00041H-Ud
	for alex.bennee@linaro.org; Fri, 26 Jan 2018 11:45:55 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:40995)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ef6zw-0005xe-6o
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 11:37:05 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ef6zv-0001ae-9R
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 11:37:04 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:37943)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ef6zv-0001Zy-3n
	for qemu-devel@nongnu.org; Fri, 26 Jan 2018 11:37:03 -0500
Received: by mail-oi0-x241.google.com with SMTP id 5so682749oip.5
	for <qemu-devel@nongnu.org>; Fri, 26 Jan 2018 08:37:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=1Vg2pbggVnGrHJUxajLBbb0a41KlzEFHbzHTwZ4Hbl8=;
	b=iiKHqs7osGwfQcmc6+EZxIkihnEGXm6voh2oiP6JMI2XFhUr8k51FMk32YgPSvB7/H
	o7bIXRtf5wqckN+DVDnxvnrpRw6NFfXDskGoScggqtoJTyM9aXa5cFkGBvMmtj3PKa3R
	o8OYkjx2UmSE4guj2zheJ8Q6r04n8C0X0oB/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=1Vg2pbggVnGrHJUxajLBbb0a41KlzEFHbzHTwZ4Hbl8=;
	b=HGSNUV6rNusat8U/x/P8KYHl3QcjcIuQLbSA95WpghE1AL9lUYvLm+hXXqOj3SVZau
	fRSF+KBiDCdwLElcy7nrtsbm8KK6WeJDgV2JYcdj8l5rNFxydtbUmUjBR7UwbOIJIaFL
	PJUvJxluQiMgrOpRGN89Zb0pzXdTGyalBrH7JpPIV1Ggpr+liPwvilJL1vUqRDtu66ot
	LG+v4958OKj0d+GNCPEIlg/u1+4zJY114JzuyKh39/Gen8gcohsOn2gVzOs94bIyKSAY
	wX46AUjtvEm2PFKSBi6ATe1Qpgm9pQekQB/GDsfZ6QlQdLoIw1qfX5IGBQ/AqwsfIkOe
	HQaQ==
X-Gm-Message-State: AKwxytdtIa9vdnP7MM1X/TuIlEvCooA/NEiERoYnKzNbGUbecC7AzWg+
	nqnNMsA0hEE2dz8BXY6SHnku7W2P2CDggakOOI3U4Q==
X-Received: by 10.202.105.84 with SMTP id e81mr4018889oic.305.1516984622222;
	Fri, 26 Jan 2018 08:37:02 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.61.133 with HTTP; Fri, 26 Jan 2018 08:36:41 -0800 (PST)
In-Reply-To: <5A6B5091.8030601@hisilicon.com>
References: <5A6B5091.8030601@hisilicon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 26 Jan 2018 16:36:41 +0000
Message-ID: <CAFEAcA_39SgDKFnkrcVePs89kYUMHvqqAdnkFhrCa=GYTu0Kpw@mail.gmail.com>
To: Wei Xu <xuwei5@hisilicon.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::241
Subject: Re: [Qemu-devel] [Qemu-arm] [PATCH] pl011: do not put into fifo
 before enabled the interruption
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Rob Herring <rob.herring@linaro.org>,
	"Chenxin \(Charles\)" <charles.chenxin@huawei.com>,
	tiantao6@huawei.com, QEMU Developers <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Linuxarm <linuxarm@huawei.com>,
	"Liuxinliang \(Matthew Liu\)" <z.liuxinliang@hisilicon.com>,
	qemu-arm <qemu-arm@nongnu.org>, Daode Huang <huangdaode@hisilicon.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	"Liguozhu \(Kenneth\)" <liguozhu@hisilicon.com>,
	Zhangyi ac <zhangyi.ac@huawei.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cHJzZjGbr29N

On 26 January 2018 at 16:00, Wei Xu <xuwei5@hisilicon.com> wrote:
> If the user pressed some keys in the console during the guest booting,
> the console will be hanged after entering the shell.
> Because in the above case the pl011_can_receive will return 0 that
> the pl011_receive will not be called. That means no interruption will
> be injected in to the kernel and the pl011 state could not be driven
> further.
>
> This patch fixed that issue by checking the interruption is enabled or
> not before putting into the fifo.
>
> Signed-off-by: Wei Xu <xuwei5@hisilicon.com>
> ---
>  hw/char/pl011.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/hw/char/pl011.c b/hw/char/pl011.c
> index 2aa277fc4f..6296de9527 100644
> --- a/hw/char/pl011.c
> +++ b/hw/char/pl011.c
> @@ -229,6 +229,8 @@ static int pl011_can_receive(void *opaque)
>      PL011State *s = (PL011State *)opaque;
>      int r;
>
> +    if (!s->int_enabled)
> +       return 0;
>      if (s->lcr & 0x10) {
>          r = s->read_count < 16;
>      } else {
> --

This doesn't look right. You should be able to use the PL011
in a strictly polling mode, without ever enabling interrupts.
Returning false in can_receive if interrupts are disabled
would break that.

If the user presses keys before interrupts are enabled,
what ought to happen is:
 * we put the key in the FIFO, and update the int_level flags
 * when the FIFO is full, can_receive starts returning 0 and
   QEMU stops passing us new characters
 * when the guest driver for the pl011 initializes the
   device and enables interrupts then either:
    (a) it does something that clears the FIFO, which will
    mean can_receive starts allowing new chars again, or
    (b) it leaves the FIFO as it is, and we should thus
    immediately raise an interrupt for the characters still
    in the FIFO; when the guest handles this interrupt and
    gets the characters, can_receive will permit new ones

What is happening in your situation that means this is not
working as expected ?

thanks
-- PMM
