Received: by 10.28.71.27 with SMTP id u27csp3899181wma;
        Tue, 6 Feb 2018 07:13:12 -0800 (PST)
X-Google-Smtp-Source: AH8x226Pl/qSeYJhCIVA6INrCETgsQD/Yi5ATFe+CJBUtQ7AMJq1HWVXHqb+IuVwS9AdA8Liefh3
X-Received: by 10.37.162.130 with SMTP id c2mr1613322ybi.51.1517929992249;
        Tue, 06 Feb 2018 07:13:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1517929992; cv=none;
        d=google.com; s=arc-20160816;
        b=WGGiGzjgWmf/j9XPfXeakKYLsq5jDujD/sjn2n3rQCfHhCxgvOMrEm5RN9JUG2vHGH
         e6R4EhBYoc9vP0zQdsx8NzHLJvKxJsMF/wrxPAzRD3FOEnpDLZ4yyZDDmiq7ufG44mM9
         bd5R3UMfARHgEXZlukC8fF7g6b4cQ1pF8WFBG9Q4YETerdG9mIj9DGhi5SIX7fSIHYlt
         XG3VjSuHKEJw6mAEg7KL+saP10Amdg/K3HLbAhXh/Ij3SIpoYaGS4oFmgqmW54dTwOQU
         FhuDI5e2lguQ5v4OIXcF7WDen8qZaTuXd+Hayem3iVcONHJUTihEkk4siYZU8m1XyV0D
         lWrQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:to:message-id:date:from:references
         :in-reply-to:mime-version:dkim-signature:arc-authentication-results;
        bh=/akAUOJ7IsGYKGqmsKBMi1jeIaH67UgAngpT+LO0NfE=;
        b=GWmmt5xvFkh0Zz2ohy+m7R75B05DcCTZyNfaZIShnSP4h46VRCxS+/JriuQUKv9hZP
         pmNNyRZc19rv/UGkwFZ8xZfOGxXZfIA/OBtkKe6ycd6uqRZ2XxfcHYWrb+T8XbTByi6I
         kDV8ykqyGEW3lrIdVYq79sQRshSOCfHOxHyvJGaQHxYcfNY4IYU3TLXOpJX9kwbozCho
         HOz7IIeXVI9OKdemcNmGVsl0lsBS0qofhsFEaLI0e/Fg1zsWve4SlSTn3d6Z6MYBLhHV
         OBQQtLpCZP+DNoorg7NLO5aEABjJHRTE6aHLDZEGXnnuR9bZGAuw9c2SjpjdPue+5bB9
         SRtQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OoFdae4L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id z11si1216993ybg.415.2018.02.06.07.13.12
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 06 Feb 2018 07:13:12 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=OoFdae4L;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:55255 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ej4vn-0004Lf-ML
	for alex.bennee@linaro.org; Tue, 06 Feb 2018 10:13:11 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33184)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ej4vV-0004Do-Ih
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 10:12:58 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <andrew.smirnov@gmail.com>) id 1ej4vS-000316-KM
	for qemu-arm@nongnu.org; Tue, 06 Feb 2018 10:12:52 -0500
Received: from mail-qt0-x241.google.com ([2607:f8b0:400d:c0d::241]:38691)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <andrew.smirnov@gmail.com>)
	id 1ej4vS-00030X-Ft; Tue, 06 Feb 2018 10:12:50 -0500
Received: by mail-qt0-x241.google.com with SMTP id z10so2693256qti.5;
	Tue, 06 Feb 2018 07:12:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=/akAUOJ7IsGYKGqmsKBMi1jeIaH67UgAngpT+LO0NfE=;
	b=OoFdae4L49lUkbVgpIr8UKrfhiCqG5lbdhDdbFhMZ9WjnSBiNomGxhZqR4cYYT9Ht8
	8ivhH32A0Q9Xpw/7j5zMuO0My/cuJf9K8sjVdpTmiwUnsCNJqRSsA5RChVFMzYGzBflb
	STg3UuQHAhEBhECyHEYuVuCh0r3kZhzWFh8UlqCd9qQ8RUp8Yf5/yAbna72qlsFUHT3h
	MTzpzaaPpf5lk+CEdYnWoXkU37cvMjK45ck9LE/mgA2+ceBFfAjY874sGIGZKGTJdptW
	SLlRQjaaD3DhZVPEeFThdEHcyf5X5ZkiDETij8Ak7DVYo7scExyUjD8h5iEKodRX0WS7
	oJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=/akAUOJ7IsGYKGqmsKBMi1jeIaH67UgAngpT+LO0NfE=;
	b=s5XwMaLoGP6C0ybRQkx4TvhnTKNgLqSkZsuszzShI+WIqwnzriIfCnewHToAzTQ80C
	VKS1DRD4j7SDSvt+BOWYHwOEF9lUOCeP4Id0S3GI4j0t4uzcwV+3mK+2kZalSdka0hXg
	3qVmntcjXeg/pXrf8v6F0GDHdSipWzvrjvYXv7tkxV61l/L0AVJ6eEZEdm7ljTTVBgts
	2QqYv+PzryVd7EyWE8+tW10hDb9Ivjuqm1BXHA1XuRgbDRp5pnOCNWxDEmn+nPyk9vyg
	l43ybnSK19p4wvS6U6CujeEtb9MmyLLIYWaMgLfACNeTMoPc3Cmxi6lvUIZtRdvR0RXf
	uvQA==
X-Gm-Message-State: APf1xPAP+pGK2R/SUWZ1XkxYiBSSOh3gJkt9y7j2OUjTUvWkrst7/xYn
	gpcSDUtclxr/RBM5DE7kwq9D9pos4nZZxW4+cFE=
X-Received: by 10.200.57.3 with SMTP id s3mr4096843qtb.328.1517929969303; Tue,
	06 Feb 2018 07:12:49 -0800 (PST)
MIME-Version: 1.0
Received: by 10.140.101.113 with HTTP; Tue, 6 Feb 2018 07:12:48 -0800 (PST)
In-Reply-To: <24dcdefa-51f6-c3c1-61a2-c0f3eff7a800@amsat.org>
References: <20180116013709.13830-1-andrew.smirnov@gmail.com>
	<20180116013709.13830-6-andrew.smirnov@gmail.com>
	<24dcdefa-51f6-c3c1-61a2-c0f3eff7a800@amsat.org>
From: Andrey Smirnov <andrew.smirnov@gmail.com>
Date: Tue, 6 Feb 2018 07:12:48 -0800
Message-ID: <CAHQ1cqG6x8wNm8_B0X_OsE--KPAwPcxbBVc1cJYP9PHHLdZsbg@mail.gmail.com>
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400d:c0d::241
Subject: Re: [Qemu-arm] [PATCH v4 05/14] i.MX: Add code to emulate i.MX7
 SNVS IP-block
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
Cc: Peter Maydell <peter.maydell@linaro.org>, Jason Wang <jasowang@redhat.com>,
	"open list:ARM" <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: e1zj7zNB1Ule

On Wed, Jan 31, 2018 at 9:10 AM, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.o=
rg> wrote:
> On 01/15/2018 10:37 PM, Andrey Smirnov wrote:
>> Add code to emulate SNVS IP-block. Currently only the bits needed to
>> be able to emulate machine shutdown are implemented.
>>
>> Cc: Peter Maydell <peter.maydell@linaro.org>
>> Cc: Jason Wang <jasowang@redhat.com>
>> Cc: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
>> Cc: qemu-devel@nongnu.org
>> Cc: qemu-arm@nongnu.org
>> Cc: yurovsky@gmail.com
>> Reviewed-by: Peter Maydell <peter.maydell@linaro.org>
>> Signed-off-by: Andrey Smirnov <andrew.smirnov@gmail.com>
>> ---
>>  hw/misc/Makefile.objs       |  1 +
>>  hw/misc/imx7_snvs.c         | 83 ++++++++++++++++++++++++++++++++++++++=
+++++++
>>  include/hw/misc/imx7_snvs.h | 35 +++++++++++++++++++
>>  3 files changed, 119 insertions(+)
>>  create mode 100644 hw/misc/imx7_snvs.c
>>  create mode 100644 include/hw/misc/imx7_snvs.h
>>
>> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
>> index 4b2b705a6c..019886912c 100644
>> --- a/hw/misc/Makefile.objs
>> +++ b/hw/misc/Makefile.objs
>> @@ -35,6 +35,7 @@ obj-$(CONFIG_IMX) +=3D imx6_ccm.o
>>  obj-$(CONFIG_IMX) +=3D imx6_src.o
>>  obj-$(CONFIG_IMX) +=3D imx7_ccm.o
>>  obj-$(CONFIG_IMX) +=3D imx2_wdt.o
>> +obj-$(CONFIG_IMX) +=3D imx7_snvs.o
>>  obj-$(CONFIG_MILKYMIST) +=3D milkymist-hpdmc.o
>>  obj-$(CONFIG_MILKYMIST) +=3D milkymist-pfpu.o
>>  obj-$(CONFIG_MAINSTONE) +=3D mst_fpga.o
>> diff --git a/hw/misc/imx7_snvs.c b/hw/misc/imx7_snvs.c
>> new file mode 100644
>> index 0000000000..670b9f4639
>> --- /dev/null
>> +++ b/hw/misc/imx7_snvs.c
>> @@ -0,0 +1,83 @@
>> +/*
>> + * IMX7 Secure Non-Volatile Storage
>> + *
>> + * Copyright (c) 2017, Impinj, Inc.
>> + *
>> + * Author: Andrey Smirnov <andrew.smirnov@gmail.com>
>> + *
>> + * This work is licensed under the terms of the GNU GPL, version 2 or l=
ater.
>> + * See the COPYING file in the top-level directory.
>> + *
>> + * Bare minimum emulation code needed to support being able to shut
>> + * down linux guest gracefully.
>> + */
>> +
>> +#include "qemu/osdep.h"
>> +#include "hw/misc/imx7_snvs.h"
>> +#include "qemu/log.h"
>> +#include "sysemu/sysemu.h"
>> +
>> +static uint64_t imx7_snvs_read(void *opaque, hwaddr offset, unsigned si=
ze)
>> +{
>> +    return 0;
>> +}
>> +
>> +static void imx7_snvs_write(void *opaque, hwaddr offset,
>> +                            uint64_t v, unsigned size)
>> +{
>> +    const uint32_t value =3D v;
>> +    const uint32_t mask  =3D SNVS_LPCR_TOP | SNVS_LPCR_DP_EN;
>> +
>> +    if (offset =3D=3D SNVS_LPCR && ((value & mask) =3D=3D mask)) {
>> +        qemu_system_shutdown_request(SHUTDOWN_CAUSE_GUEST_SHUTDOWN);
>> +    }
>> +}
>> +
>> +static const struct MemoryRegionOps imx7_snvs_ops =3D {
>> +    .read =3D imx7_snvs_read,
>
> Same here, you can remove the imx7_snvs_read() function since
> memory_region_dispatch_read() takes care of this and return 0.
>

Hmm, I don't think I agree both from reading code and trying this out.
Without .read callback the call chain ends up being the following
memory_region_dispatch_read() -> memory_region_dispatch_read1() ->
access_with_adjusted_size(..., memory_region_oldmmio_read_accessor,
...) -> memory_region_oldmmio_read_accessor() ->
mr->ops->old_mmio.read[ctz32(size)]() -> SEGFAULT

As much as I'd love to get rid of dummy .read callback, I don't see a
way to do that, unfortunately.

Thanks,
Andrey Smirnov
