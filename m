Received: by 10.28.71.27 with SMTP id u27csp19747wma;
        Tue, 23 Jan 2018 16:39:27 -0800 (PST)
X-Google-Smtp-Source: AH8x226brUaomC+6AqzmyfTl8LczujKJ84CzjNxg39OEaRlX0nNzDdVYBXkWiN0ZYmJbKHVf+TqK
X-Received: by 10.13.243.3 with SMTP id c3mr1417216ywf.336.1516754367639;
        Tue, 23 Jan 2018 16:39:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1516754367; cv=none;
        d=google.com; s=arc-20160816;
        b=CkoyTsyS6CRruMyvHbH+DUUdhRr5LFWDGNfYDAHNiJKJooQ6jHBpkEGASx+VbCQRFn
         D4jSaQkIcjhxzBEfWv3j8MMwt66Y0R41YkWNk+0DxGpIxl/xVunXy6XrKfdd+knFf4UI
         2c2WtrsOIpAQMGGi6q1ciXEzvIBS+IgT1jcTros/4ETClCsAOn41OwJ3gH7w4oEgiuEV
         eD9q7pjKvGZWTAJwLZxJ9AKwoRwAMc/gWuk9rumfq/bJ6aQ7DaEUGETbJi213tSjLGDm
         l5ce4QKcBCGmwcJ2KvXKv5vyE0tXqH+tCPSWHm3S3ono2+i5GmrSmt4Xg/CZOpZ2FihT
         mKwA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=TrbDz4tITjhQligcJvKnU+bESOgfgHdVyRa7PvFCMho=;
        b=YVkp2hJVn13xUmYe2xeS/8KECfGG5RBsener0fwE3pI/fhsrZu/qk1Ob9GFPYnDPae
         b17yrN9YmrnER14XEmC8LXc8LnV+5x/rFg0rfE9ERD9mJZxJw7aIELgpLoRcvpjlU7X5
         k6L/hgj28K05y/l9l7mU3RFiZxp0ZXW2gTV+VK5piuqdepvrMypYYaLmBxDpyq4IdcDP
         Qjd2moQFLliR/f/GqBFxLnDhWWewSKZLyvsGuPE2IBIKf82DfqYqaDjT7d+vO0nPTJ4y
         126dR9frcGs7SS6UlKiiVYcmqKAQsVwNW1T3pcBrUV+qE7WunK4WXVjBIMvQQJFPdpAK
         w2pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NpxXhXe4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id t15si4206398ywg.28.2018.01.23.16.39.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 23 Jan 2018 16:39:27 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=NpxXhXe4;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:36886 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ee967-0003Zj-61
	for alex.bennee@linaro.org; Tue, 23 Jan 2018 19:39:27 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33743)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ee95N-0003UP-Nn
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 19:39:09 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1ee94T-0001Ly-CQ
	for qemu-devel@nongnu.org; Tue, 23 Jan 2018 19:38:41 -0500
Received: from mail-lf0-x242.google.com ([2a00:1450:4010:c07::242]:33259)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1ee94S-0001I2-Vi; Tue, 23 Jan 2018 19:37:45 -0500
Received: by mail-lf0-x242.google.com with SMTP id t139so2969190lff.0;
	Tue, 23 Jan 2018 16:37:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=TrbDz4tITjhQligcJvKnU+bESOgfgHdVyRa7PvFCMho=;
	b=NpxXhXe4IETCSChtfyXctafW/23XUyiFPgACeg/z7X7bC59K5HTDHTXhZXGSyjO+W+
	8IiJukV400HumToaBmkG8OwFQvmUUOiewfwQhgLjSUEKEW1EyNKPXbv1efJsO9RkAXPY
	A2qwz5IZ9wiWmBaQxWsNZee+8H/ogBX//wpv9XI6cSbIlgEKiw3xBLiaZqPAFhdH52W1
	0g9ddAfAu/1Uf4qyHUS3JMq2SiPFnOB3CT+wsLzCgPPmiEhZcj9EWCVk6egnxHl9ER9+
	PGSkHH3i7s3+6XSoL4L2sRRmsWal095IoNIzSpX/E3fdaD2XcCFF+MrHMfRPIH5l5Xeu
	l8YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=TrbDz4tITjhQligcJvKnU+bESOgfgHdVyRa7PvFCMho=;
	b=ZlPWUgYz211iGWJ5kMoiMMDMKLwefn0Ud4hJTswlUxAGFOI+8hxbVpLyZJBVEOmvXA
	BrqcCVGeDoHvUpp41tLM5s5eE32FWpza3UMILPyzklulQ6GT5NXYlwo7KhxWRhThcT88
	/j9gCFosiwg2sbkyHEbJceyZ3/9ff3WF9k3pzaFlCl/rhrgPchklZHbcXIecNOjkXLFU
	U/yklrqz2vC1j0zjoUaeGeMNSRJ5xax9LREIAJJg2f9kTRcg+MYvurqxIj+idcWlfYC5
	zCrq0SM5W6hWhGl6OtG3Ixw4H4SidFtzaJmcg5gy7sL71AQss8vhnfz1I85rGFqlC9na
	L9AA==
X-Gm-Message-State: AKwxytfgL/YZoIeDVh72//U/elYtC1GbYJqabXrD9/jHBHq66fzUVelA
	OAvckn7YmezE/KXuNf8aZL06lQISm75JI/9dv48=
X-Received: by 10.46.70.10 with SMTP id t10mr2091475lja.27.1516754263646; Tue,
	23 Jan 2018 16:37:43 -0800 (PST)
MIME-Version: 1.0
Received: by 10.46.45.10 with HTTP; Tue, 23 Jan 2018 16:37:13 -0800 (PST)
In-Reply-To: <20180123020820.1288-15-f4bug@amsat.org>
References: <20180123020820.1288-1-f4bug@amsat.org>
	<20180123020820.1288-15-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Tue, 23 Jan 2018 16:37:13 -0800
X-Google-Sender-Auth: 4wo2dUajyoHWaaHVPSe6Tn0rHVc
Message-ID: <CAKmqyKOP13qWi4a9376zFEM7_E8YBvmzH=FvL0LHE=AHDivUNQ@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4010:c07::242
Subject: Re: [Qemu-devel] [PATCH v9 14/16] hw/arm/exynos4210: access the
 64-bit capareg with qdev_prop_set_uint64()
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Kevin O'Connor <kevin@koconnor.net>, Stefan Hajnoczi <stefanha@redhat.com>,
	Marcel Apfelbaum <marcel@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
	"open list:Exynos" <qemu-arm@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: RwB/TUmT3kmL

On Mon, Jan 22, 2018 at 6:08 PM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> We only set a 32-bit value, but this is a good practice in case this
> code is used as reference.
>
> (missed in 5efc9016e52)
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Reviewed-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/arm/exynos4210.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index e8e1d81e62..d89322c7ea 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -378,7 +378,7 @@ Exynos4210State *exynos4210_init(MemoryRegion *system=
_mem)
>          DriveInfo *di;
>
>          dev =3D qdev_create(NULL, TYPE_SYSBUS_SDHCI);
> -        qdev_prop_set_uint32(dev, "capareg", EXYNOS4210_SDHCI_CAPABILITI=
ES);
> +        qdev_prop_set_uint64(dev, "capareg", EXYNOS4210_SDHCI_CAPABILITI=
ES);
>          qdev_init_nofail(dev);
>
>          busdev =3D SYS_BUS_DEVICE(dev);
> --
> 2.15.1
>
>
