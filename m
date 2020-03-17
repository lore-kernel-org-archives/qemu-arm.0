Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1357705lfe;
        Tue, 17 Mar 2020 03:29:45 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vtvoYV0euQZrbMixK5OJSpc4ymutSKq3iJjQmMPjd3ZigEihxtwyuxu1cPaSLQIsSV/9hxL
X-Received: by 2002:a25:e805:: with SMTP id k5mr6870712ybd.14.1584440985215;
        Tue, 17 Mar 2020 03:29:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584440985; cv=none;
        d=google.com; s=arc-20160816;
        b=jPGQOgL1rQzBxEIdG+w5kEAWwY56R/hmLOONRnVESk3pp/bmBjGRMPwemhckZe5lWJ
         lOurcm8tFO6EHGNoyJOt30jJQOSqF0P7hBaN9NFrgfPcmVpXrejquemhXj70E3W2E8H6
         3iZevvCCvR1F3LQCELHbCnC0z1KNtUad/akH4fcpnbFP11TdO0k6sDNGweoATJvT5yHQ
         xE7wJWakd2YvfgQfYwEJZpysm4N1rp1aaNrCdQMwfazUBXCo9hYDWG3k7CIA0RybXb1/
         P1og8OSTmR4VwEr2VymOUn29rEfFK4Ul4hUgApsQx1i19VDZdeZssypUtwe2XvZF4fWh
         Olhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:from:references:cc:to:subject
         :dkim-signature;
        bh=druU3B9TDUPa45d+I7yG2jBUIQy72LLiJic5ErdHDw8=;
        b=TeFNJ+ETEvQU+2lqd5/NDxrzgBbPI6+G5wSH4zmrGrbpPtFp/KtSn1MNsCh1XkY79g
         RPB0DoC2FsMv1RNZb+a70t3EOCV2oO1klv6XAUBzqHjRWmcN3ia4cpDGj9PV99IDEuwG
         64ktCu5LB2USWjmkHAFi5EauGixMxUDLZzmUNSg6pJvr2mbVyFdzAb7tGlmtXgtISLcU
         xvw1jbRHrA7t3mZchh1Gsu67qVEZ9FYqEB4rtd5IbX4CwJlUdO7lM9uXzLk3ilyUTmDK
         i950BOY56lPbxeVtEjxSBoBmmthmrb5BcsvvZ2GrR+OyHpFc3li/8tPwvwtaj/tiLV+d
         tEfg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ES7HM8uj;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <philmd@redhat.com>
Received: from us-smtp-delivery-74.mimecast.com (us-smtp-delivery-74.mimecast.com. [63.128.21.74])
        by mx.google.com with ESMTPS id l192si2399231ybl.13.2020.03.17.03.29.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Mar 2020 03:29:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) client-ip=63.128.21.74;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@redhat.com header.s=mimecast20190719 header.b=ES7HM8uj;
       spf=pass (google.com: domain of philmd@redhat.com designates 63.128.21.74 as permitted sender) smtp.mailfrom=philmd@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1584440984;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=druU3B9TDUPa45d+I7yG2jBUIQy72LLiJic5ErdHDw8=;
	b=ES7HM8ujReHnt60HkBbDJeoOZd2zudt0SPVokOsgFnI+8Cv9x2RtEgFygArHLklDYCy/FQ
	vyxtdRrMDMGJtNTeroc0lUPuzdhnB6FmGq3nTaPxRTN+8VJQYnMdmnu6rqyg5Sqx4jBNze
	ZrRl7GI/mWKZAlzDk2fAi5grqjXR1Pg=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-uSrzK1mzMzS71B2jPEDoPA-1; Tue, 17 Mar 2020 06:29:43 -0400
X-MC-Unique: uSrzK1mzMzS71B2jPEDoPA-1
Received: by mail-wr1-f69.google.com with SMTP id v7so1018566wrp.0
        for <alex.bennee@linaro.org>; Tue, 17 Mar 2020 03:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=H/8EZFhA7VwCljRZso0Aa26Buw6kJJKPtM+QE3Y9nQg=;
        b=nIcNVdh1DC6e0YfH+cuTa82ywPVCQIhfof1ahi07Sn31W0qtFKVoTvzkP+x2/wL+El
         mIvsoSjY+dkXU5a8q3Xx5tuDG+xPIcquoaaCAiwmO8u50ckOsgFHJqDsYiN6ay8vJCVO
         p7mefk812kdB9V0JjvREza4YhiaKo/sHvg4nRlHAR30aNbxc0rQEe8ETt1/JoTXtC8Ug
         aQIbHB4bPCY1RBZe54IyLodp6uw0n8hxDBY2dRrjLp63GQYgjRXvu+SkIy+h9gajaumL
         WyvQcul3JjO+C8GPYgVDup6oVUwS7KQSyo0X0fCp4ndKpVVvJY2vBzZXwL9ElQl99R3g
         vG1A==
X-Gm-Message-State: ANhLgQ12NGiWWTVGA1o8ReN1YLkMkekpPmmD/Za5cUWnNnyxaTDQA9gD
	E6tIqnxVvxp23f3TV00wW6EW5lg/GBJ9luW2TWvPZCmC6coXW7vD71AZJferBtNYg9Q7FRRYU7A
	i2LrqIm6JLA6Pg/oH
X-Received: by 2002:a05:6000:18f:: with SMTP id p15mr5633266wrx.149.1584440981799;
        Tue, 17 Mar 2020 03:29:41 -0700 (PDT)
X-Received: by 2002:a05:6000:18f:: with SMTP id p15mr5633249wrx.149.1584440981624;
        Tue, 17 Mar 2020 03:29:41 -0700 (PDT)
Return-Path: <philmd@redhat.com>
Received: from [192.168.1.34] (96.red-83-59-163.dynamicip.rima-tde.net. [83.59.163.96])
        by smtp.gmail.com with ESMTPSA id r1sm3465811wmh.0.2020.03.17.03.29.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Mar 2020 03:29:41 -0700 (PDT)
Subject: Re: [PATCH v1 24/28] tests/tcg/aarch64: add SVE iotcl test
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: Peter Maydell <peter.maydell@linaro.org>, qemu-arm@nongnu.org
References: <20200316172155.971-1-alex.bennee@linaro.org>
 <20200316172155.971-25-alex.bennee@linaro.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <3d01f357-eeb6-7fd7-1895-feae05beca99@redhat.com>
Date: Tue, 17 Mar 2020 11:29:40 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200316172155.971-25-alex.bennee@linaro.org>
Content-Language: en-US
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-TUID: 3oQaaEy0oRex

On 3/16/20 6:21 PM, Alex Benn=C3=A9e wrote:
> This is a fairly bare-bones test of setting the various vector sizes
> for SVE which will only fail if the PR_SVE_SET_VL can't reduce the
> user-space vector length by powers of 2.
>=20
> However we will also be able to use it in a future test which
> exercises the GDB stub.
>=20
> Signed-off-by: Alex Benn=C3=A9e <alex.bennee@linaro.org>

Tested-by: Philippe Mathieu-Daud=C3=A9 <philmd@redhat.com>

>=20
> ---
> v3
>    - use index to fill zreg
>    - CROSS_CC_HAS_SVE
> v5
>    - merge conflicts
> v6
>    - drop id check
> ---
>   tests/tcg/aarch64/sve-ioctls.c    | 70 +++++++++++++++++++++++++++++++
>   tests/tcg/aarch64/Makefile.target |  4 ++
>   2 files changed, 74 insertions(+)
>   create mode 100644 tests/tcg/aarch64/sve-ioctls.c
>=20
> diff --git a/tests/tcg/aarch64/sve-ioctls.c b/tests/tcg/aarch64/sve-ioctl=
s.c
> new file mode 100644
> index 00000000000..9544dffa0ee
> --- /dev/null
> +++ b/tests/tcg/aarch64/sve-ioctls.c
> @@ -0,0 +1,70 @@
> +/*
> + * SVE ioctls tests
> + *
> + * Test the SVE width setting ioctls work and provide a base for
> + * testing the gdbstub.
> + *
> + * Copyright (c) 2019 Linaro Ltd
> + *
> + * SPDX-License-Identifier: GPL-2.0-or-later
> + */
> +#include <sys/prctl.h>
> +#include <asm/hwcap.h>
> +#include <stdio.h>
> +#include <sys/auxv.h>
> +#include <stdint.h>
> +#include <stdlib.h>
> +
> +#ifndef HWCAP_CPUID
> +#define HWCAP_CPUID (1 << 11)
> +#endif
> +
> +#define SVE_MAX_QUADS  (2048 / 128)
> +#define BYTES_PER_QUAD (128 / 8)
> +
> +#define get_cpu_reg(id) ({                                      \
> +            unsigned long __val;                                \
> +            asm("mrs %0, "#id : "=3Dr" (__val));                  \
> +            __val;                                              \
> +        })
> +
> +static int do_sve_ioctl_test(void)
> +{
> +    int i, res, init_vq;
> +
> +    res =3D prctl(PR_SVE_GET_VL, 0, 0, 0, 0);
> +    if (res < 0) {
> +        printf("FAILED to PR_SVE_GET_VL (%d)", res);
> +        return -1;
> +    }
> +    init_vq =3D res & PR_SVE_VL_LEN_MASK;
> +
> +    for (i =3D init_vq; i > 15; i /=3D 2) {
> +        printf("Checking PR_SVE_SET_VL=3D%d\n", i);
> +        res =3D prctl(PR_SVE_SET_VL, i, 0, 0, 0, 0);
> +        if (res < 0) {
> +            printf("FAILED to PR_SVE_SET_VL (%d)", res);
> +            return -1;
> +        }
> +        asm("index z0.b, #0, #1\n"
> +            ".global __sve_ld_done\n"
> +            "__sve_ld_done:\n"
> +            "mov z0.b, #0\n"
> +            : /* no outputs kept */
> +            : /* no inputs */
> +            : "memory", "z0");
> +    }
> +    printf("PASS\n");
> +    return 0;
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    /* we also need to probe for the ioctl support */
> +    if (getauxval(AT_HWCAP) & HWCAP_SVE) {
> +        return do_sve_ioctl_test();
> +    } else {
> +        printf("SKIP: no HWCAP_SVE on this system\n");
> +        return 0;
> +    }
> +}
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefi=
le.target
> index b61b53e4dd1..c879932ff6c 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -47,6 +47,10 @@ ifneq ($(DOCKER_IMAGE)$(CROSS_CC_HAS_SVE),)
>   AARCH64_TESTS +=3D sysregs
>   sysregs: CFLAGS+=3D-march=3Darmv8.1-a+sve
>  =20
> +# SVE ioctl test
> +AARCH64_TESTS +=3D sve-ioctls
> +sve-ioctls: CFLAGS+=3D-march=3Darmv8.1-a+sve
> +
>   ifneq ($(HAVE_GDB_BIN),)
>   GDB_SCRIPT=3D$(SRC_PATH)/tests/guest-debug/run-test.py
>  =20
>=20
