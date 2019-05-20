Received: by 2002:adf:c793:0:0:0:0:0 with SMTP id l19csp668235wrg;
        Mon, 20 May 2019 14:50:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzi/Phy518hmAxxpKDuQAyPaeAoa63wXN5Bc3YLmtWxw4hEJ52DgIYhRzH7Xi0WdiT9Y63w
X-Received: by 2002:a17:906:7206:: with SMTP id m6mr62209900ejk.39.1558389047077;
        Mon, 20 May 2019 14:50:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1558389047; cv=none;
        d=google.com; s=arc-20160816;
        b=LR5mdN6SmcwAzFyGQusSEBzIVpv/4jtQQa2ugxD7jZS5vCIkmq7qVh1C1c5YXrflfd
         lC5R5obYvXdGQMrM0/OQeka4db56c0Vwwo3w1r9xuGIaJFN6wLp7MgpaEqYlfrP2djOb
         OOcpRP3q+VilFuYyCYZOoRwwqbn80w+YwcX1KVMHM1HWQI3ufY+suVKB0m6L7oitcDfK
         dqBcuKH2iRpt4PYtUuj2eXAJ8/2TI2z1m1xvo2BJss24ssdkjeoVzvXHI7evFs4KC2KO
         fT0w7XfIpIKCfB5Wc4rEsoKPkQQ7u4abBjVbUWs1b3O5AfBV59/+kCdJ8Lf6WnmxMYMT
         eCFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:in-reply-to
         :references:mime-version:dkim-signature;
        bh=x7r9XNYB2o5vMYWmRzZIat+sN5wAmUA6kVuz3xo43fs=;
        b=b66TzhrFL1EF3hcr7iEae+zIRTOwx1jLTbTpFMjId+NcPW3j2TC7UpupyIQm56Hn5h
         MR+QuqpDgM95oTbgrRPOeOmNXNy+V1IDaodimv1j6g1W9wSOdClMln5Mij/ZC8Wf0i0y
         Csn+KhbZtNTtu6tPd8l7Oo30vF5SQhKamvlgx5EGNOnfbV7ii+CDXW1qx+SwFYpATG9I
         XJxJcOc17O1cZXAIIpkPvX0lWRBgY6hzwlgWvt6dbXunTaPMsaH+Mk142tb34zrvbTpU
         gpfb5wPXUXsWsgOIvzthSo/ZVaAL/WsNVuIXTvAv4cHNBfpH2tu2Xf3aVH+STFi1DFll
         o8Eg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=q84M+lnH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y46si2800175edc.298.2019.05.20.14.50.46
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 20 May 2019 14:50:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=q84M+lnH;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([127.0.0.1]:42456 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hSqBC-0003o8-5B
	for alex.bennee@linaro.org; Mon, 20 May 2019 17:50:46 -0400
Received: from eggs.gnu.org ([209.51.188.92]:59517)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hSqAt-0003m5-5k
	for qemu-arm@nongnu.org; Mon, 20 May 2019 17:50:28 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <alistair23@gmail.com>) id 1hSqAs-00064q-At
	for qemu-arm@nongnu.org; Mon, 20 May 2019 17:50:27 -0400
Received: from mail-lj1-x243.google.com ([2a00:1450:4864:20::243]:36800)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <alistair23@gmail.com>)
	id 1hSqAq-000632-5U; Mon, 20 May 2019 17:50:24 -0400
Received: by mail-lj1-x243.google.com with SMTP id z1so13931345ljb.3;
	Mon, 20 May 2019 14:50:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=x7r9XNYB2o5vMYWmRzZIat+sN5wAmUA6kVuz3xo43fs=;
	b=q84M+lnHopdfZVKExtjtdcrV1vDZiW0c0DeMXwrUcaSGUnH2O2HfQP9fPKZG1FQ4fn
	25sVYshWZd0vlShdwN0RRKqzhkfRv2/ekKrw8lDBSKfb4ntK8wFUrse5l1FuFdmom4In
	NVrFaVWwAooqXtf2CpSLF8etTDNboOUL3CV60KBcc09+ddoQBfpuv7n4NtoOmXVZ/3ig
	/fLxSmOkDDrYisABEPqk7fiDv+ZniCIqQaAiG7XXnLrFBSv4O5o3lz9OO8xEoL8Oyust
	KI8YHvQEyPb4StTpuLEnP5rXbjm54mGbcSKAzNyh5koS4HQXKL2sq+XPtdFZV5mXwpOw
	5Y0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=x7r9XNYB2o5vMYWmRzZIat+sN5wAmUA6kVuz3xo43fs=;
	b=cMAR1SVAlGkk6EZID4j93rzlKmUHrroHBXVdIFPTN/PJpW6UkIxv3QscZ7h4ygY9tc
	PLUjT9jceCdmhzVIhFCjmMOTwWy6S4bLjqyZ9CT9NMKfU2PrqUXs/vr5mgHBVl1WtSaa
	IMxg59NLBkVbA1wvXspAnGwArAUPGzPzvCoKb6DbItT3/bADcOfhd/E9KhuAdp8Q+G64
	11hiaEcGCWSlFMDaDp+NaMf6T9tpeAP8UDx7NX+bkRPMHxBeQVgsenK95RP+qL5TTw/N
	m8LD+1BR+5qKN6Ptnkd47t4wlock2F7Ixh8s/hFdAT5wbiNbArXezsfZaDbUQQ3/881a
	AOCw==
X-Gm-Message-State: APjAAAXdQdBimzlWjkkEdJ9oTorWbPzDRJV22J0Rjatw65ej4AX5+q9X
	16QxjbmBjREU1EChucFi2wvsLhvcXl+qqoHzQ9Q=
X-Received: by 2002:a2e:597:: with SMTP id 145mr11316838ljf.127.1558389023036; 
	Mon, 20 May 2019 14:50:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190520214342.13709-1-philmd@redhat.com>
	<20190520214342.13709-3-philmd@redhat.com>
In-Reply-To: <20190520214342.13709-3-philmd@redhat.com>
From: Alistair Francis <alistair23@gmail.com>
Date: Mon, 20 May 2019 14:48:08 -0700
Message-ID: <CAKmqyKMwbwvAyQ=u0SgaphHiP_HFFnL2npSTYum+G5V60F7kBw@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2a00:1450:4864:20::243
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH 2/4] hw/arm/exynos4: Use the IEC
 binary prefix definitions
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
	Igor Mitsyanko <i.mitsyanko@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	"qemu-devel@nongnu.org Developers" <qemu-devel@nongnu.org>,
	qemu-arm <qemu-arm@nongnu.org>, Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AtkoStJGOhw7

On Mon, May 20, 2019 at 2:48 PM Philippe Mathieu-Daud=C3=A9
<philmd@redhat.com> wrote:
>
> It eases code review, unit is explicit.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>

Alistair

> ---
>  hw/arm/exynos4_boards.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>
> diff --git a/hw/arm/exynos4_boards.c b/hw/arm/exynos4_boards.c
> index f0c24b7992e..f824eef0d36 100644
> --- a/hw/arm/exynos4_boards.c
> +++ b/hw/arm/exynos4_boards.c
> @@ -22,6 +22,7 @@
>   */
>
>  #include "qemu/osdep.h"
> +#include "qemu/units.h"
>  #include "qapi/error.h"
>  #include "qemu/error-report.h"
>  #include "qemu-common.h"
> @@ -60,8 +61,8 @@ static int exynos4_board_smp_bootreg_addr[EXYNOS4_NUM_O=
F_BOARDS] =3D {
>  };
>
>  static unsigned long exynos4_board_ram_size[EXYNOS4_NUM_OF_BOARDS] =3D {
> -    [EXYNOS4_BOARD_NURI]     =3D 0x40000000,
> -    [EXYNOS4_BOARD_SMDKC210] =3D 0x40000000,
> +    [EXYNOS4_BOARD_NURI]     =3D 1 * GiB,
> +    [EXYNOS4_BOARD_SMDKC210] =3D 1 * GiB,
>  };
>
>  static struct arm_boot_info exynos4_board_binfo =3D {
> --
> 2.20.1
>
>
