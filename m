Received: by 10.25.208.211 with SMTP id h202csp60088lfg;
        Fri, 26 Feb 2016 14:35:55 -0800 (PST)
X-Received: by 10.55.77.148 with SMTP id a142mr5158839qkb.44.1456526155252;
        Fri, 26 Feb 2016 14:35:55 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id n6si15212137qge.102.2016.02.26.14.35.55
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 26 Feb 2016 14:35:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@gmail.com
Received: from localhost ([::1]:52384 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1aZQzK-0003yr-OO
	for alex.bennee@linaro.org; Fri, 26 Feb 2016 17:35:54 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:51131)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aZQzI-0003yk-8X
	for qemu-arm@nongnu.org; Fri, 26 Feb 2016 17:35:53 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1aZQzH-0008SQ-8Y
	for qemu-arm@nongnu.org; Fri, 26 Feb 2016 17:35:52 -0500
Received: from mail-oi0-x241.google.com ([2607:f8b0:4003:c06::241]:33826)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>)
	id 1aZQzH-0008S4-33; Fri, 26 Feb 2016 17:35:51 -0500
Received: by mail-oi0-x241.google.com with SMTP id x143so205254oix.1;
	Fri, 26 Feb 2016 14:35:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc;
	bh=0HOhpsO+9UHil3GKINV4wpGywB/mytbz91ue6JXjX2A=;
	b=sctoiu4SC2Ob8sTsRtidtPh8QH/+2kRbZLqIyeQyWrSBMdfgI4pVaWD7vg+AV+qa3o
	6xOPaqmjbdBsrh/4q+QXWhWNMaRTOJ/VHJulX06U33IGrLrcqsEmkW843i+DL7O+zKCu
	/B4h4dlM/gpe99CpbAg/QxH36Kz5ybhhmlSzRRzY/TOb7Nnx10tccXJewJcAHaNkZ+rF
	bYyHamFnwXZxn5GpmFOdbFJrs9wyfUV9dDDVFfig6b1PJtSUDoS+mrVtUq07yPsFX36I
	1XPk/VLj4IPKBicuUmXOfgGh4LawxZd7DCoCX7ctP5HLA0yJ7kW1Jdpob9Hh+UWSz/vW
	8HMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc;
	bh=0HOhpsO+9UHil3GKINV4wpGywB/mytbz91ue6JXjX2A=;
	b=f1RDWj6PY8/jjsBVEMhH6QJaHE8aa6ojW/aZj1geb3y5CqOztRVoWj9Wyhqkc1r2Nf
	F8XmCaLq9CvhWZUA6TDRqKWNh6wQMv4F8CgGwEYQPnBq67imWZF/HsU7RhIGatG50pXu
	WX5sRJV6m9+txy1kUvbyruxdUDU2fQhreC9xB1bH1zEIl/YLxg9HqpKc8b9IfgSLdtAn
	5E2fahx/hDWFs4QLKhkKG31x3dVg2lliWaC581P+3MeRZnJIwab6bDY0pry1jG9D49TN
	cAjfTK+l19/Nl0gmprAEcLFIIHVN3npShzWr0Sz/FfRuwLhaWdLjKgJ5p014mF3fiI5e
	vYhg==
X-Gm-Message-State: AD7BkJKfXrgCzf41UO1gvULicBZfj/EMRpKc25na8vtbUcIK5TF0ISbk5uHcgae1FHd5hXvjzupPs8UkFg5CRg==
X-Received: by 10.202.63.86 with SMTP id m83mr3074987oia.76.1456526149122;
	Fri, 26 Feb 2016 14:35:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.182.81.69 with HTTP; Fri, 26 Feb 2016 14:35:19 -0800 (PST)
In-Reply-To: <1456493044-10025-2-git-send-email-peter.maydell@linaro.org>
References: <1456493044-10025-1-git-send-email-peter.maydell@linaro.org>
	<1456493044-10025-2-git-send-email-peter.maydell@linaro.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 26 Feb 2016 14:35:19 -0800
X-Google-Sender-Auth: 8lx6Hh2mfijGzRvrJpbfvBnFSEg
Message-ID: <CAKmqyKO5Vu7Ws9RO2UyH4zvUtxBmpk0BuZh-zX-izWgDm2=04w@mail.gmail.com>
To: Peter Maydell <peter.maydell@linaro.org>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:4003:c06::241
Cc: Patch Tracking <patches@linaro.org>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Alistair Francis <alistair.francis@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 1/2] sd.c: Handle NULL block
	backend in sd_get_inserted()
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
X-TUID: 3DG4x5yL4Lv4

On Fri, Feb 26, 2016 at 5:24 AM, Peter Maydell <peter.maydell@linaro.org> wrote:
> The sd.c SD card emulation code can be in a state where the
> SDState BlockBackend pointer is NULL; this is treated as
> "card not present". Add a missing check to sd_get_inserted()
> so that we don't segfault in this situation.
>
> (This could be provoked by the guest writing to the SDHCI
> register to do a reset on a xilinx-zynq-a9 board; it will
> also happen at startup when sdhci implements its DeviceClass
> reset method.)
>
> Signed-off-by: Peter Maydell <peter.maydell@linaro.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Thanks,

Alistair

> ---
>  hw/sd/sd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/sd/sd.c b/hw/sd/sd.c
> index edb6b32..00c320d 100644
> --- a/hw/sd/sd.c
> +++ b/hw/sd/sd.c
> @@ -449,7 +449,7 @@ static void sd_reset(DeviceState *dev)
>
>  static bool sd_get_inserted(SDState *sd)
>  {
> -    return blk_is_inserted(sd->blk);
> +    return sd->blk && blk_is_inserted(sd->blk);
>  }
>
>  static bool sd_get_readonly(SDState *sd)
> --
> 1.9.1
>
>
