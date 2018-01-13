Received: by 10.28.173.206 with SMTP id w197csp78477wme;
        Fri, 12 Jan 2018 17:02:08 -0800 (PST)
X-Google-Smtp-Source: ACJfBotEGESCyU+9mBzRJekBiEFPH2klTVCFzXmZtSeIQAwAsLPiNRoO0pr0ZU9tf0hj0oyUo1ZR
X-Received: by 10.37.221.194 with SMTP id u185mr25048598ybg.208.1515805328812;
        Fri, 12 Jan 2018 17:02:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1515805328; cv=none;
        d=google.com; s=arc-20160816;
        b=fbbHTCHw8hJ7Tel4pfCCDyxt+s3FHQ6Yma3W4ogc7eXVkUvpMimG0ETUDQtlbPCSgg
         UBG18CiI+kk94oMFjJkxtiTgLppB/BOS6S0VRnaG2/MoRDa+7ehy0P0EUT/7MVrilr5l
         cOPyNe2iXaK6apSknaDqXtLfim0aF3nrgajzC91LzUIHQrDu0v8Y65geDpU3nRRfYP/k
         +jqyjCib0nkZ9rzgNQoe/XvpNt//xjwYbsmPmHUZ5HQHP05QRwf+roinULey+0sVMQOp
         u/HoFLLZvLuhVGErBktkSNq7/CLKUkX/y9h6DZwtfKQo8gPXzMnJv5K+b39Kf2N2DR73
         OfJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=FFEIQ+HoRYZFE7u7bMaeqb0SZbvlgI4eIT5l3LHI5IQ=;
        b=zQZfgz3jw2x3oBk+zl8xs4vujggG0dOqPOOB7cW4JwrbNcJ7w/EjLzZtw3K/0cKNMd
         54QscqAeOQCDC5juYzsweAQ0b2L1jvyuF85cJX0hfxV5p125PG24fNtNgN6NenNMSYW5
         8HvWXRrfhkzafjgGYxAm8v3/PoSrqJHzoMelZkzIMAZ9o5rJOJQoc1479zv49QmEQzv2
         cHqDqMyf6xOV2cyzrvJ/l/9y93BeIFrlClmUP0VlPuVhLOoQ+93f3qNDwSHvyci/YmLt
         OWx2OeI5dbcMD61LZJkxPzFvD5zxInO5yH34OaqotjpE60EOHNdR+Z3k0rc/MMnpUgWb
         kzmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CiLg/eLU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id s5si3855504ywe.94.2018.01.12.17.02.08
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 12 Jan 2018 17:02:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=CiLg/eLU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Received: from localhost ([::1]:52879 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eaAD2-0005Fr-9d
	for alex.bennee@linaro.org; Fri, 12 Jan 2018 20:02:08 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:38959)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eaACn-0005Em-8s
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 20:01:54 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1eaACm-00044C-Il
	for qemu-arm@nongnu.org; Fri, 12 Jan 2018 20:01:53 -0500
Received: from mail-wm0-x244.google.com ([2a00:1450:400c:c09::244]:42435)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1eaACk-00041e-Il; Fri, 12 Jan 2018 20:01:50 -0500
Received: by mail-wm0-x244.google.com with SMTP id b141so15340379wme.1;
	Fri, 12 Jan 2018 17:01:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:sender:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-transfer-encoding;
	bh=FFEIQ+HoRYZFE7u7bMaeqb0SZbvlgI4eIT5l3LHI5IQ=;
	b=CiLg/eLUhwiPEt5sxii1g7H6PKNYrrqtlUNLl23KfeFHOVxaienT/nQCtgJlc0mdsJ
	XFYGikDj3seGv+kyzjveHjpb+VZDdjro0CvUW3Xhc3BJTd0EXG6XdZklb9TmaPaO8XR3
	fBSy4JMfSQK1No343ARw+dpMlNPmplf19eHnpiiQ2eGQbrq9bby3Ccs9psfwWZmLz2on
	sexm+wYkdFCVaQFxNLlnyScGmhS9RVYjtUBgwodKqrFi6WMQMXWEpFfEjewWRA39YAzO
	nOZ2OEuEQ1PMtr6DiVZS4PZVoLPWoPnoM8bcaQ6xJ6oj4h/YA+eXw389O2SwEgGW49XU
	b+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
	:date:message-id:subject:to:cc:content-transfer-encoding;
	bh=FFEIQ+HoRYZFE7u7bMaeqb0SZbvlgI4eIT5l3LHI5IQ=;
	b=G/YfE+05YljntbB7FajtUT1lnnP1t3NNpUFa1yes74ji2KsmiVHG046jcPyGS8htXT
	ORa1UU1H8GjAJ+ssIgcGCgu9pU3Hif+Gwf81Uyq1N6rtC77UKw8ptGKNP2n7o5Bmod/4
	RRhSzMOr2d+TV4J+Zz0K+imAutEN/aaWzb2sniY5rY6M/sWX49mcWId+II+DmtMVJ6rq
	7cOwB6z6BPTqpH/FgGlYi3uiy+SY7U78ghGNPrNRe/GplNE4gvisJAlF7ADFmSWfqvTs
	zrOEtHAWQnox8ud1SEYEMxWsAWvVhgHZNoyqMtF82r58BUYHgnSGxNvib2AbW70gPhON
	AXHg==
X-Gm-Message-State: AKwxyte0S8T2azIWChytxCTcTRBKWsHagY6odYLvsdySf8QpPAvBNMrP
	uQX0iEUFjd1qbnUP37Ci3jg/NkC5vueVsjuTdg8=
X-Received: by 10.28.69.8 with SMTP id s8mr4766142wma.25.1515805309468; Fri,
	12 Jan 2018 17:01:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.28.164.69 with HTTP; Fri, 12 Jan 2018 17:01:18 -0800 (PST)
In-Reply-To: <20180111205626.23291-11-f4bug@amsat.org>
References: <20180111205626.23291-1-f4bug@amsat.org>
	<20180111205626.23291-11-f4bug@amsat.org>
From: Alistair Francis <alistair.francis@xilinx.com>
Date: Fri, 12 Jan 2018 17:01:18 -0800
X-Google-Sender-Auth: P7M7AMQH_hPx83Bn5EIFWYYrebI
Message-ID: <CAKmqyKPK9nwQd959-AoV6b=Fj5YJt8CGufYQqiGau0PVQWe7Rg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:400c:c09::244
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH v6 10/21] hw/arm/exynos4210:
 implement SDHCI Spec v2
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
Cc: "Edgar E . Iglesias" <edgar.iglesias@xilinx.com>,
	Peter Maydell <peter.maydell@linaro.org>,
	Prasad J Pandit <pjp@fedoraproject.org>,
	=?UTF-8?Q?Gr=C3=A9gory_Estrade?= <gregory.estrade@gmail.com>,
	Andrey Smirnov <andrew.smirnov@gmail.com>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Alistair Francis <alistair.francis@xilinx.com>,
	Sai Pavan Boddu <saipava@xilinx.com>,
	Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	Clement Deschamps <clement.deschamps@antfield.fr>,
	Andrew Baumann <Andrew.Baumann@microsoft.com>,
	Jean-Christophe Dubois <jcd@tribudubois.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 9A99OrkDZdW+

On Thu, Jan 11, 2018 at 12:56 PM, Philippe Mathieu-Daud=C3=A9
<f4bug@amsat.org> wrote:
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>

Acked-by: Alistair Francis <alistair.francis@xilinx.com>

Alistair

> ---
>  hw/arm/exynos4210.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/exynos4210.c b/hw/arm/exynos4210.c
> index e8e1d81e62..0e6acac784 100644
> --- a/hw/arm/exynos4210.c
> +++ b/hw/arm/exynos4210.c
> @@ -75,7 +75,6 @@
>  #define EXYNOS4210_INT_COMBINER_BASE_ADDR   0x10448000
>
>  /* SD/MMC host controllers */
> -#define EXYNOS4210_SDHCI_CAPABILITIES       0x05E80080
>  #define EXYNOS4210_SDHCI_BASE_ADDR          0x12510000
>  #define EXYNOS4210_SDHCI_ADDR(n)            (EXYNOS4210_SDHCI_BASE_ADDR =
+ \
>                                                  0x00010000 * (n))
> @@ -377,8 +376,18 @@ Exynos4210State *exynos4210_init(MemoryRegion *syste=
m_mem)
>          BlockBackend *blk;
>          DriveInfo *di;
>
> +        /* Compatible with:
> +         * - SD Host Controller Specification Version 2.0
> +         * - SDIO Specification Version 2.0
> +         * - MMC Specification Version 4.3
> +         *
> +         * - SDMA
> +         * - ADMA
> +         */
>          dev =3D qdev_create(NULL, TYPE_SYSBUS_SDHCI);
> -        qdev_prop_set_uint32(dev, "capareg", EXYNOS4210_SDHCI_CAPABILITI=
ES);
> +        qdev_prop_set_uint8(dev, "sd-spec-version", 2);
> +        qdev_prop_set_bit(dev, "suspend", true);
> +        qdev_prop_set_bit(dev, "1v8", true);
>          qdev_init_nofail(dev);
>
>          busdev =3D SYS_BUS_DEVICE(dev);
> --
> 2.15.1
>
>
