Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp288516wru;
        Thu, 26 Jul 2018 21:52:39 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpeOWggzd2ItwitjnLlwFPma3CKAzZdArC0V3hcMJScfuQpBpqszQSrgJvJ3tr4Vy/pEKrB2
X-Received: by 2002:a37:93c6:: with SMTP id v189-v6mr4425195qkd.140.1532667159034;
        Thu, 26 Jul 2018 21:52:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532667159; cv=none;
        d=google.com; s=arc-20160816;
        b=PEujMTnYNrvu1v5QhGJ98JFlAZZINQKULVeWh/fd1kc9UOOuN+apq7lDTk6DCCsdhT
         f3JwZpKJG9tBwjwtrx7zp2XrYcEWeTv9Q21fJUyDgsg3aWA+7IkF7XcNwRN40AqS4RvQ
         PHE6N3qcdvDBd65jHbbuRQrGt87CrZjccbZWWpCX6+Ja0t2if+etQBTswreKzluYd/j+
         kVaYU550nrAcO5HW6pDFacrDHYMbQFQPQ+zntBtI7X1ADdWUPt8Pt/kfOhhAKrsiuSBI
         xLLa84VM4+JYhfq1DCtAiDVJ17JZrCVOuYJZLKCaigrFeqZcZybMyaTN+Vr3UL7EFgM2
         wS5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=ru10B/Lt910NCiNxs2ZRUNXxqKXn7fbYksREFKXXFyA=;
        b=BkOAf7XT2OzzywRlt/WCiBcyaT+9VNigV29bwkpg0KEEzafqTUH++W4bwNo7/r51dQ
         attsDyIgq3wAQHhJEZM7CyAlQWi3iaGFjoWs3shn5akQMazAXmREZX1kKJBWcBjwsWsO
         Ohrw4f7vD3pxJ+90TxKN6g8L6Row0GbELu2IyV/j4tltSjsa6ySF6f9xPTzPQrIgc8jE
         x8acT2kN4B7LD5fSzS3uz9xTwOHppS/9i31qgz3d3G/38V0CM3gG5EvDF2pWiGHXFxcJ
         9ERiyxAsqNYr6M85utFznbeiJIhDBQ7pyk3MvkEnk2Cthc2G7x8Ixt/j3zzKhm+JxbMJ
         2xiQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cgeo70Yh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c30-v6si2742484qtb.377.2018.07.26.21.52.38
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 26 Jul 2018 21:52:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=cgeo70Yh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:39081 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fiuk2-0001UE-JY
	for alex.bennee@linaro.org; Fri, 27 Jul 2018 00:52:38 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37270)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fiujw-0001U8-23
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 00:52:33 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fiujs-0001ZG-VR
	for qemu-arm@nongnu.org; Fri, 27 Jul 2018 00:52:32 -0400
Received: from mail-vk0-x244.google.com ([2607:f8b0:400c:c05::244]:36644)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fiujs-0001YV-P9; Fri, 27 Jul 2018 00:52:28 -0400
Received: by mail-vk0-x244.google.com with SMTP id y9-v6so1882275vky.3;
	Thu, 26 Jul 2018 21:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=ru10B/Lt910NCiNxs2ZRUNXxqKXn7fbYksREFKXXFyA=;
	b=cgeo70YhjyZq2dKTthv/fMhWyYHPBVCoV4lhIxDfPRsU93df4/xEJmbvLEsUcD0Qzh
	6kXkwaeEau6+iU6AUlEzJqi9nRgPDO/zVnchuf9wzz+m86UwGxSVEpZc+pBqlR+kBi4W
	JXKyWMpXSi+t/Fud8FLsVsgdkhHpLYdtbzp7l5nep8sn/4wtLGr2khf8wzNJqq7OIw0R
	1JgCRwIXUIOelDYSU4jSLuQn3p2q4mULXMf9zkkIExZM7OSr+PJWRb5PU7+NUycQGgAw
	nlF36ka1K4f0AKey3S260y3728oSaGKVZB7l/YMenxvQNFwYSuu/OO2Jc7WXpFW/eGdP
	W7kA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=ru10B/Lt910NCiNxs2ZRUNXxqKXn7fbYksREFKXXFyA=;
	b=Jr7345mfdZlJYuatgoLVgRMaW0eQo/okcFEleD/OmeSk+ctrjoenbpK+DenL+Xnf/4
	vTR8fhIe0XsvRr8eMHcPRH1Ep99HwpwJfb9q9JOS7gT6M3ljKzer7JrqVHi53FLywUgY
	84XCXikZhTUawUJs9cGPTILHScDbOy+YX1OuztuZUR7Q5/KmQyLeqEWmEvtb3+3xDXd5
	ML+42I0j4bioKNTMpFHLcXLXVAmG2QWlFyYNXvshg3WwZkwv7Yzlzv1U8J/EPhQ7Swmd
	1lU9weEDzVbdYEBg0ssYnlaIYYszkwxeZXZTWRAaAUPMxS/uPG0YMCbLDUKWhc1Zz5XB
	9KRw==
X-Gm-Message-State: AOUpUlFDNSyXx/qV8UrQ37zxuV97OuBVdizWY4d0jM2IeI8jVORa/Z8j
	YMWWjroUb+LAdcyNWJykuxY=
X-Received: by 2002:a1f:9cc4:: with SMTP id
	f187-v6mr2934348vke.87.1532667146604; 
	Thu, 26 Jul 2018 21:52:26 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	g10-v6sm775000uae.40.2018.07.26.21.52.22
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 26 Jul 2018 21:52:25 -0700 (PDT)
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org,
	Su Hang <suhang16@mails.ucas.ac.cn>
References: <20180725085944.11856-1-stefanha@redhat.com>
	<20180725085944.11856-8-stefanha@redhat.com>
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
Message-ID: <0c2c23f3-5ec9-5446-17ca-683d267d0f4c@amsat.org>
Date: Fri, 27 Jul 2018 01:52:19 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180725085944.11856-8-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:400c:c05::244
Subject: Re: [Qemu-arm] [PATCH v3 7/7] Add QTest testcase for the Intel
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
	Alistair Francis <alistair@alistair23.me>,
	Subbaraya Sundeep <sundeep.lkml@gmail.com>,
	Steffen Gortz <qemu.ml@steffen-goertz.de>, qemu-arm@nongnu.org,
	Joel Stanley <joel@jms.id.au>, Julia Suvorova <jusual@mail.ru>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: WyqKzR2hqjXF

Hi Su,

On 07/25/2018 05:59 AM, Stefan Hajnoczi wrote:
> From: Su Hang <suhang16@mails.ucas.ac.cn>
> 
> 'test.hex' file is a bare metal ARM software stored in Hexadecimal
> Object Format. When it's loaded by QEMU, it will print "Hello world!\n"
> on console.
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
>  tests/hexloader-test.c               | 56 ++++++++++++++++++++++++++++
>  tests/hex-loader-check-data/test.hex | 12 ++++++
>  5 files changed, 80 insertions(+)
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
> index 0000000000..78b566f8b1
> --- /dev/null
> +++ b/tests/hexloader-test.c
> @@ -0,0 +1,56 @@
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
> +
> +static unsigned char pre_store[BIN_SIZE] = {
> +    4,   208, 159, 229, 22,  0,   0,   235, 254, 255, 255, 234, 152, 16,  1,
> +    0,   4,   176, 45,  229, 0,   176, 141, 226, 12,  208, 77,  226, 8,   0,
> +    11,  229, 6,   0,   0,   234, 8,   48,  27,  229, 0,   32,  211, 229, 44,
> +    48,  159, 229, 0,   32,  131, 229, 8,   48,  27,  229, 1,   48,  131, 226,
> +    8,   48,  11,  229, 8,   48,  27,  229, 0,   48,  211, 229, 0,   0,   83,
> +    227, 244, 255, 255, 26,  0,   0,   160, 225, 0,   208, 139, 226, 4,   176,
> +    157, 228, 30,  255, 47,  225, 0,   16,  31,  16,  0,   72,  45,  233, 4,
> +    176, 141, 226, 8,   0,   159, 229, 230, 255, 255, 235, 0,   0,   160, 225,
> +    0,   136, 189, 232, 132, 0,   1,   0,   0,   16,  31,  16,  72,  101, 108,
> +    108, 111, 32,  119, 111, 114, 108, 100, 33,  10,  0};

Can this be:

  0x04, 0xd0, 0x9f, 0xe5,   0x16, 0x00, 0x00, 0xeb,   0xfe, 0xff, 0xff,
0xea,
  0x98, 0x10, 0x01, 0x00,   0x04, 0xb0, 0x2d, 0xe5,   0x00, 0xb0, 0x8d,
0xe2,
  0x0c, 0xd0, 0x4d, 0xe2,   0x08, 0x00, 0x0b, 0xe5,   0x06, 0x00, 0x00,
0xea,
  0x08, 0x30, 0x1b, 0xe5,   0x00, 0x20, 0xd3, 0xe5,   0x2c, 0x30, 0x9f,
0xe5,
  0x00, 0x20, 0x83, 0xe5,   0x08, 0x30, 0x1b, 0xe5,   0x01, 0x30, 0x83,
0xe2,
  0x08, 0x30, 0x0b, 0xe5,   0x08, 0x30, 0x1b, 0xe5,   0x00, 0x30, 0xd3,
0xe5,
  0x00, 0x00, 0x53, 0xe3,   0xf4, 0xff, 0xff, 0x1a,   0x00, 0x00, 0xa0,
0xe1,
  0x00, 0xd0, 0x8b, 0xe2,   0x04, 0xb0, 0x9d, 0xe4,   0x1e, 0xff, 0x2f,
0xe1,
  0x00, 0x10, 0x1f, 0x10,   0x00, 0x48, 0x2d, 0xe9,   0x04, 0xb0, 0x8d,
0xe2,
  0x08, 0x00, 0x9f, 0xe5,   0xe6, 0xff, 0xff, 0xeb,   0x00, 0x00, 0xa0,
0xe1,
  0x00, 0x88, 0xbd, 0xe8,   0x84, 0x00, 0x01, 0x00,   0x00, 0x10, 0x1f,
0x10,
  'H',  'e',  'l',  'l',    'o',  ' ',  'w',  'o',    'r',  'l',  'd',  '!',
  '\n', '\0'
};

?

> +
> +/* success if no crash or abort */
> +static void hex_loader_test(void)
> +{
> +    unsigned int i;
> +    unsigned char memory_content[BIN_SIZE];
> +    const unsigned int base_addr = 0x00010000;
> +
> +    QTestState *s = qtest_startf(
> +        "-M emcraft-sf2 -nographic -kernel ./tests/hex-loader-check-data/test.hex");
> +
> +    for (i = 0; i < BIN_SIZE; ++i) {
> +        memory_content[i] = qtest_readb(s, base_addr + i);
> +        g_assert_cmpuint(memory_content[i], ==, pre_store[i]);
> +    }
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
