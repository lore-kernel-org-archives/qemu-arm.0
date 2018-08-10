Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp2628887wru;
        Thu, 9 Aug 2018 21:26:27 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPyYNylH35FlvtI40Z9Z39Cv/bjJrjLB5S02QVBnWnUFQOLAMP0Ixw/3QTWucyYrLQ8WVijy
X-Received: by 2002:ac8:6055:: with SMTP id k21-v6mr5042158qtm.204.1533875187819;
        Thu, 09 Aug 2018 21:26:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1533875187; cv=none;
        d=google.com; s=arc-20160816;
        b=zcg9yQeyAwHQVUSBdjpgOzDGDX2ZuYhHn5NQadmbHYt2CvahcKDEohwRGt71NyKvid
         flFK1g8QShv3ByyjekxYqHDrdkQSYjDrDxBhIqG/s/O3Y7VP3tMZOr4RFkJBQwT/vwkP
         9mKC4818YT8JA2auBTobbmzaKRscpsKhybGGDGKNkYOniBvzw369G2Ep/jKFyfldJJwm
         /ds9LH6azCT+d0G8PDpdD+AuWJ4+jio9YK6Ch2Jd2qIoN9eeoaVgt9IV2+bCPfuQ5hbX
         Ll5xGd4KiIJLbT5Mo0arxNeGZlJZbv2keFkn9rpO1RRw0GJTGRo4G02rygVdUX1lFHSF
         9PxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=PpvJ6kPrdykkL6f4bI/6I3Dmy8ke/rh27Z+c2e2eYo4=;
        b=lSyN8N6p2eS3Z3fypiVk0rN1tAyfJDSESoD9pTCvpy0PJq+IpoSLuyGJsBqozFN2Sf
         xdxzg0O3QCjZ1yoohYEyhJ8ZML0vswLzoYX2W7xd8v08RkBfIg8s2XU6C/LcQ9C2dxfx
         Jq6OT4sgXjgorr2kOm8IbX/2R4QuLrjEqEwVXN8DboIbcl1vivlokHsI55V9tJwwPmQA
         SH6mV9CifTACZP0nEQECHESRr2IJQ09Zhjf0X6UbHS5CSMokVqwAZltv1No4jGX7H3tI
         hQm+dYpWV1F9v4DNhW4rPfcnzs+qqO1QBt6RkNObqFcLFH/F4aL353/XrsgJj6NRTXrS
         h7Nw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kb0pKC16;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id g3-v6si7421817qvl.167.2018.08.09.21.26.27
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 09 Aug 2018 21:26:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=kb0pKC16;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:54216 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fnz0N-0001M4-61
	for alex.bennee@linaro.org; Fri, 10 Aug 2018 00:26:27 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:58775)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnz0F-0001Ly-6S
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 00:26:20 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnz0B-0002oC-VB
	for qemu-arm@nongnu.org; Fri, 10 Aug 2018 00:26:19 -0400
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943]:40930)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fnz0B-0002nZ-Oy; Fri, 10 Aug 2018 00:26:15 -0400
Received: by mail-ua1-x943.google.com with SMTP id m13-v6so579969uaq.7;
	Thu, 09 Aug 2018 21:26:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=PpvJ6kPrdykkL6f4bI/6I3Dmy8ke/rh27Z+c2e2eYo4=;
	b=kb0pKC16MEIqppcH0+Y9o4dZATwrIN0H0iVNpliyqa/qxm/apwrV3lmjgWACcS+LLp
	xYh8QS8DMI/H15usUipmVD+AW0ILbdon+72GEXdjIzDxYSPvhaouA/lpB/AonWoyXvEG
	Yq2FS+XD6m/mXeDhe/o95lUogX53D508mCGDkx6Cq7gWuJfEFmMssLVtYITwBE/72RcP
	0cWe4FgSjPCUfCUtkLOQmNBDqoIjhM8DTqpRo7wYxUlq9rcUQP57M5dSujlOrGrqnQ7k
	PbI9mDgLr+ncqDhVL+DcG3K9yY+PbvdS0Fx7pNcMJ8KWz15SPBr3hS1EG8XpYst/a9o6
	Ykkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=PpvJ6kPrdykkL6f4bI/6I3Dmy8ke/rh27Z+c2e2eYo4=;
	b=O+kppNMRmegGA08d0OJAc2hCkYjUNjf2fp6WcSarYoxVAhns4BioYEshOGQUmTFhSr
	pAQvYVPFq56C8nI2+YjNNYc2YF83yiGmlupVmqX4sRtUMxg/IBONByq8jMvSAVnf11/a
	T8avgTsLUKs2XrPz6nHZBGX2g4k+t2fJW2oQWC2x7dR3wN/QdNCJ5n6hwzwCslKYiyU3
	WPWjqJBIBd+ApKGuaI4v+eqep0cH74LbzWjvjoBW6cqA/ijYJnhMS8WgQAwxYJZOVq59
	ydoXNg/A58wKKc1PZwCyTo6IjWOYfxdhxsrX3mCFeJ8rGOGKZGp/EuHQg4XEW7N/nq4u
	IqzA==
X-Gm-Message-State: AOUpUlFuScTuKNnlbynyovPr9qobZu2XRA3FVXjwl4OZLWA2f60BqQ45
	X5LodLS2HJ9JslOp8cNqhE8=
X-Received: by 2002:ab0:4c24:: with SMTP id
	l36-v6mr3247637uaf.199.1533875174931; 
	Thu, 09 Aug 2018 21:26:14 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	a127-v6sm2628402vka.6.2018.08.09.21.26.10
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Aug 2018 21:26:14 -0700 (PDT)
To: Su Hang <suhang16@mails.ucas.ac.cn>
References: <20180803144721.17036-1-stefanha@redhat.com>
	<20180803144721.17036-7-stefanha@redhat.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>
Openpgp: id=FAABE75E12917221DCFD6BB2E3E32C2CDEADC0DE;
	url=http://pgp.mit.edu/pks/lookup?op=get&search=0xE3E32C2CDEADC0DE
Autocrypt: addr=f4bug@amsat.org; prefer-encrypt=mutual; keydata=
	mQINBDU8rLoBEADb5b5dyglKgWF9uDbIjFXU4gDtcwiga9wJ/wX6xdhBqU8tlQ4BroH7AeRl
	u4zXP0QnBDAG7EetxlQzcfYbPmxFISWjckDBFvDbFsojrZmwF2/LkFSzlvKiN5KLghzzJhLO
	HhjGlF8deEZz/d/G8qzO9mIw8GIBS8uuWh6SIcG/qq7+y+2+aifaj92EdwU79apZepT/U3vN
	YrfcAuo1Ycy7/u0hJ7rlaFUn2Fu5KIgV2O++hHYtCCQfdPBg/+ujTL+U+sCDawCyq+9M5+LJ
	ojCzP9rViLZDd/gS6jX8T48hhidtbtsFRj/e9QpdZgDZfowRMVsRx+TB9yzjFdMO0YaYybXp
	dg/wCUepX5xmDBrle6cZ8VEe00+UQCAU1TY5Hs7QFfBbjgR3k9pgJzVXNUKcJ9DYQP0OBH9P
	ZbZvM0Ut2Bk6bLBO5iCVDOco0alrPkX7iJul2QWBy3Iy9j02GnA5jZ1Xtjr9kpCqQT+sRXso
	Vpm5TPGWaWljIeLWy/qL8drX1eyJzwTB3A36Ck4r3YmjMjfmvltSZB1uAdo1elHTlFEULpU/
	HiwvvqXQ9koB15U154VCuguvx/Qnboz8GFb9Uw8VyawzVxYVNME7xw7CQF8FYxzj6eI7rBf2
	Dj/II6wxWPgDEy3oUzuNOxTB7sT3b/Ym76yOJzWX5BylXQIJ5wARAQABtDFQaGlsaXBwZSBN
	YXRoaWV1LURhdWTDqSAoRjRCVUcpIDxmNGJ1Z0BhbXNhdC5vcmc+iQI+BBMBAgAoBQI3aGSw
	AhsPBQkmUJgABgsJCAcDAgYVCAIJCgsEFgIDAQIeAQIXgAAKCRDj4yws3q3A3nS+EACxKosO
	3DZdwdVPXLVvSAA5y3Ohr2ByWN06RlVEkKWkOxm0lQ96LxBOZ03mDC+He/36DHaP+fujPBTz
	XjTXygWWZUtk0flDWR1w0a4yhX/JHfL5yloMZrxifCwouf2Sv9Yd6D46pzMeGsq8aCvbZYSf
	lDi3KXsVHc+jbmRwxtzJxz7366dsTC1tOJmjVSxc8bE55pHnPFOT1KKM9fxGWZFYx0UqAL/1
	NkrOKP5eXdJ51EhQa5pjivJw6dQlfWMQURG4o4e2+aLe4TkS2FI0r6nTgmoDmTT74u35NzZW
	Q3xjqcfqUX52+0drwlta22guNDbcJ4J+/I6FBF1C7CoSysBiIrldZQ6cJZ19st3jb7NHAoNk
	DcUt5I3gt4EpaiijWEEYAhw1/NSagm9bfn9veBqzVHNQrz76NZMiy2kP2vAxKOvo1XVlcEl0
	8MQ+IAUvYcLvU6yHRB4da7ts+ufqriNI5WBpvoLPRRa0wFDTj0nX/CfWFX9UkTwHA6/SWlhE
	hHau4xrpzFENwF5UDFtMkleo/u5Ipv7q8wYNs5JBpSXGmm4oSV9BbW0gp28D8fY4GGv1+6Dz
	BNDeuIdPf2NX0X55uyphpB0J4d70uNszAWXr7VqGOBbGrHcNHeT62BvoRd8bUQhaEyiJwOyC
	Ny4YIWW+I8W2wXkW+vSrZfEro2GZjQ==
Message-ID: <25a63ca5-20ad-f8d9-0117-b46c31c0c6c5@amsat.org>
Date: Fri, 10 Aug 2018 01:26:08 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180803144721.17036-7-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::943
Subject: Re: [Qemu-arm] [PATCH v4 6/6] Add QTest testcase for the Intel
 Hexadecimal
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
Cc: Peter Maydell <peter.maydell@linaro.org>, jim@groklearning.com,
	mail@steffen-goertz.de, ilg@livius.net,
	Alistair Francis <alistair@alistair23.me>, qemu-devel@nongnu.org,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>,
	Stefan Hajnoczi <stefanha@redhat.com>, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: bNKN58FICi66

Hi Su,

On 08/03/2018 11:47 AM, Stefan Hajnoczi wrote:
> From: Su Hang <suhang16@mails.ucas.ac.cn>
> 
> 'test.hex' file is a bare metal ARM software stored in Hexadecimal
> Object Format. When it's loaded by QEMU, it will print "Hello world!\n"
> on console.

... on the console of the Emcraft SmartFusion2 machine.

> 
> `pre_store` array in 'hexloader-test.c' file, stores the binary format
> of 'test.hex' file, which is used to verify correctness.
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Suggested-by: Steffen Gortz <qemu.ml@steffen-goertz.de>
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Su Hang <suhang16@mails.ucas.ac.cn>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  MAINTAINERS                          |  6 +++
>  configure                            |  4 ++
>  tests/Makefile.include               |  2 +
>  tests/hexloader-test.c               | 60 ++++++++++++++++++++++++++++
>  tests/hex-loader-check-data/test.hex | 12 ++++++
>  5 files changed, 84 insertions(+)
>  create mode 100644 tests/hexloader-test.c
>  create mode 100644 tests/hex-loader-check-data/test.hex
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 666e936812..c48d9271cf 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -1323,6 +1323,12 @@ F: hw/core/generic-loader.c
>  F: include/hw/core/generic-loader.h
>  F: docs/generic-loader.txt
>  
> +Intel Hexadecimal Object File Loader
> +M: Su Hang <suhang16@mails.ucas.ac.cn>
> +S: Maintained
> +F: tests/hexloader-test.c
> +F: tests/hex-loader-check-data/test.hex
> +
>  CHRP NVRAM
>  M: Thomas Huth <thuth@redhat.com>
>  S: Maintained
> diff --git a/configure b/configure
> index 2a7796ea80..db97930314 100755
> --- a/configure
> +++ b/configure
> @@ -7382,6 +7382,10 @@ for test_file in $(find $source_path/tests/acpi-test-data -type f)
>  do
>      FILES="$FILES tests/acpi-test-data$(echo $test_file | sed -e 's/.*acpi-test-data//')"
>  done
> +for test_file in $(find $source_path/tests/hex-loader-check-data -type f)
> +do
> +    FILES="$FILES tests/hex-loader-check-data$(echo $test_file | sed -e 's/.*hex-loader-check-data//')"
> +done
>  mkdir -p $DIRS
>  for f in $FILES ; do
>      if [ -e "$source_path/$f" ] && [ "$pwd_is_source_path" != "y" ]; then
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index a49282704e..760a0f18b6 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -386,6 +386,7 @@ check-qtest-arm-y += tests/test-arm-mptimer$(EXESUF)
>  gcov-files-arm-y += hw/timer/arm_mptimer.c
>  check-qtest-arm-y += tests/boot-serial-test$(EXESUF)
>  check-qtest-arm-y += tests/sdhci-test$(EXESUF)
> +check-qtest-arm-y += tests/hexloader-test$(EXESUF)
>  
>  check-qtest-aarch64-y = tests/numa-test$(EXESUF)
>  check-qtest-aarch64-y += tests/sdhci-test$(EXESUF)
> @@ -773,6 +774,7 @@ tests/qmp-test$(EXESUF): tests/qmp-test.o
>  tests/device-introspect-test$(EXESUF): tests/device-introspect-test.o
>  tests/rtc-test$(EXESUF): tests/rtc-test.o
>  tests/m48t59-test$(EXESUF): tests/m48t59-test.o
> +tests/hexloader-test$(EXESUF): tests/hexloader-test.o
>  tests/endianness-test$(EXESUF): tests/endianness-test.o
>  tests/spapr-phb-test$(EXESUF): tests/spapr-phb-test.o $(libqos-obj-y)
>  tests/prom-env-test$(EXESUF): tests/prom-env-test.o $(libqos-obj-y)
> diff --git a/tests/hexloader-test.c b/tests/hexloader-test.c
> new file mode 100644
> index 0000000000..8818bd45f8
> --- /dev/null
> +++ b/tests/hexloader-test.c
> @@ -0,0 +1,60 @@
> +/*
> + * QTest testcase for the Intel Hexadecimal Object File Loader
> + *
> + * Authors:
> + *  Su Hang <suhang16@mails.ucas.ac.cn> 2018
> + *
> + * This work is licensed under the terms of the GNU GPL, version 2 or later.
> + * See the COPYING file in the top-level directory.
> + *
> + */
> +
> +#include "qemu/osdep.h"
> +#include "libqtest.h"
> +
> +#define BIN_SIZE 146

This size is not needed, just use sizeof().

> +
> +static unsigned char pre_store[BIN_SIZE] = {

I'd call this blob 'emcraft_sf2_uart_hello'.

It can also be const:

static const unsigned char emcraft_sf2_uart_hello[] = {
    ...

Can you add a comment providing the .S asm source and how to
build/generate this blob? (I think this is required to respect the GPLv2
license in your header).

> +  0x04, 0xd0, 0x9f, 0xe5,   0x16, 0x00, 0x00, 0xeb,   0xfe, 0xff, 0xff, 0xea,
> +  0x98, 0x10, 0x01, 0x00,   0x04, 0xb0, 0x2d, 0xe5,   0x00, 0xb0, 0x8d, 0xe2,
> +  0x0c, 0xd0, 0x4d, 0xe2,   0x08, 0x00, 0x0b, 0xe5,   0x06, 0x00, 0x00, 0xea,
> +  0x08, 0x30, 0x1b, 0xe5,   0x00, 0x20, 0xd3, 0xe5,   0x2c, 0x30, 0x9f, 0xe5,
> +  0x00, 0x20, 0x83, 0xe5,   0x08, 0x30, 0x1b, 0xe5,   0x01, 0x30, 0x83, 0xe2,
> +  0x08, 0x30, 0x0b, 0xe5,   0x08, 0x30, 0x1b, 0xe5,   0x00, 0x30, 0xd3, 0xe5,
> +  0x00, 0x00, 0x53, 0xe3,   0xf4, 0xff, 0xff, 0x1a,   0x00, 0x00, 0xa0, 0xe1,
> +  0x00, 0xd0, 0x8b, 0xe2,   0x04, 0xb0, 0x9d, 0xe4,   0x1e, 0xff, 0x2f, 0xe1,
> +  0x00, 0x10, 0x1f, 0x10,   0x00, 0x48, 0x2d, 0xe9,   0x04, 0xb0, 0x8d, 0xe2,
> +  0x08, 0x00, 0x9f, 0xe5,   0xe6, 0xff, 0xff, 0xeb,   0x00, 0x00, 0xa0, 0xe1,
> +  0x00, 0x88, 0xbd, 0xe8,   0x84, 0x00, 0x01, 0x00,   0x00, 0x10, 0x1f, 0x10,
> +  'H',  'e',  'l',  'l',    'o',  ' ',  'w',  'o',    'r',  'l',  'd',  '!',
> +  '\n', '\0'
> +};
> +
> +/* success if no crash or abort */
> +static void hex_loader_test(void)
> +{
> +    unsigned int i;
> +    unsigned char memory_content[BIN_SIZE];

Not needed.

> +    const unsigned int base_addr = 0x00010000;
> +
> +    QTestState *s = qtest_startf(
> +        "-M emcraft-sf2 -nographic -device loader,file=tests/hex-loader-check-data/test.hex");
> +
> +    for (i = 0; i < BIN_SIZE; ++i) {
> +        memory_content[i] = qtest_readb(s, base_addr + i);
> +        g_assert_cmpuint(memory_content[i], ==, pre_store[i]);
> +    }

Simply:

    for (i = 0; i < ARRAY_SIZE(emcraft_sf2_uart_hello); ++i) {
        g_assert_cmphex(qtest_readb(s, base_addr + i),
                        ==, emcraft_sf2_uart_hello[i]);
    }

> +    qtest_quit(s);
> +}
> +
> +int main(int argc, char **argv)
> +{
> +    int ret;
> +
> +    g_test_init(&argc, &argv, NULL);
> +
> +    qtest_add_func("/tmp/hex_loader", hex_loader_test);

       qtest_add_func("/loader/hex/emcraft-sf2/uart_hello", ...

> +    ret = g_test_run();
> +
> +    return ret;
> +}
> diff --git a/tests/hex-loader-check-data/test.hex b/tests/hex-loader-check-data/test.hex
> new file mode 100644
> index 0000000000..7e99b452f5
> --- /dev/null
> +++ b/tests/hex-loader-check-data/test.hex
> @@ -0,0 +1,12 @@
> +:020000040001F9
> +:1000000004D09FE5160000EBFEFFFFEA9810010008
> +:1000100004B02DE500B08DE20CD04DE208000BE5F8
> +:10002000060000EA08301BE50020D3E52C309FE5F0
> +:10003000002083E508301BE5013083E208300BE542
> +:1000400008301BE50030D3E5000053E3F4FFFF1A4E
> +:100050000000A0E100D08BE204B09DE41EFF2FE180
> +:1000600000101F1000482DE904B08DE208009FE544
> +:10007000E6FFFFEB0000A0E10088BDE8840001007E
> +:1000800000101F1048656C6C6F20776F726C6421D4
> +:020090000A0064
> +:00000001FF
> 

With comment addressed:
Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

Regards,

Phil.
