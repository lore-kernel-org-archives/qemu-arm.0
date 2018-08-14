Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp3636603wru;
        Mon, 13 Aug 2018 21:17:57 -0700 (PDT)
X-Google-Smtp-Source: AA+uWPxLGW3rr1yhPuZsxAiGzXohmT5xtqUpAp/+kjmdgDHyq20vX205T1AuVMzBuibRDbsKlPNl
X-Received: by 2002:ae9:df81:: with SMTP id t123-v6mr18465950qkf.55.1534220277347;
        Mon, 13 Aug 2018 21:17:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1534220277; cv=none;
        d=google.com; s=arc-20160816;
        b=qkvxdjpEROFNbNj/CiT6mOaA6tSKNJEAKKkdaeap5wYjLLLSt0ge6lfTOrWXm5bFSo
         0LPkJYEpDbnnUKd+JChcjAXCJC9FLIFwaab2O6g4reF0Wmkc3ihAx2R4OXLG+9mQA6+g
         mbsBBfoUdrNVHnGbQxlHOK83NMtuOCruTSzxS94nYKRQMxCEfRLVxM/4khqOAOjggKPu
         WjiLYQ6rTSpiZdz8jY2DDuSFpmYGPBw0+amtwyw8V0JqFWJx9pyz0JScMYrs+haWdCrl
         71dZDZmpQTXWJKxYq+ebVyz2pVbHBJji61qOvfvqtrqkqjSJuhpWfdIMx4dE3zIa6G/J
         6LAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject
         :content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:autocrypt:openpgp:from:references:to
         :dkim-signature:arc-authentication-results;
        bh=WN/cALtf5EiMQQyqLDkKRWJEl3K5kjK7i1rVgAS4Kps=;
        b=HE0JNJwRyfYdUIvXhKMvkjGZaCLFT8U+uOx1ldmLcqp439sWcEozSdBKp/VnUL2Lar
         NtezdhIGSKDYuHtJmpXcpQWhOYREEfY27TJ0f2wpLNZ566BhXICQBGknvWiWcrPazytg
         FFD0Oy/Y8CNlERMB0haE5sVP1eBotw7yk0nGNFK0tltw192A+IgtElzePtVHBWmTbA97
         N6qBpmuIdV/sOy33UVp2OvGBxkXBWLONDLzxZB3mEBG01drDUgYwpqx0OgThSv5mEpWJ
         aAheg69ZC71y9yw8pLbsGNUtGkgJ5zO26dw42WR1YIoaqUT4j6ZGGRNCnEeeAV196hph
         qolg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=B1dYlC7T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v48-v6si1917199qtj.291.2018.08.13.21.17.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 13 Aug 2018 21:17:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=B1dYlC7T;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org"
Received: from localhost ([::1]:42356 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fpQmK-0000Tf-Rq
	for alex.bennee@linaro.org; Tue, 14 Aug 2018 00:17:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52904)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fpQmC-0000TV-NR
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 00:17:50 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fpQm8-0000UB-60
	for qemu-arm@nongnu.org; Tue, 14 Aug 2018 00:17:48 -0400
Received: from mail-ua1-x943.google.com ([2607:f8b0:4864:20::943]:39198)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <philippe.mathieu.daude@gmail.com>)
	id 1fpQm8-0000Tx-0f; Tue, 14 Aug 2018 00:17:44 -0400
Received: by mail-ua1-x943.google.com with SMTP id g18-v6so11683497uam.6;
	Mon, 13 Aug 2018 21:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=sender:subject:to:cc:references:from:openpgp:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-language
	:content-transfer-encoding;
	bh=WN/cALtf5EiMQQyqLDkKRWJEl3K5kjK7i1rVgAS4Kps=;
	b=B1dYlC7TTYMvSecQOun1XhDnQPunRGVMb2Hqx3ir09F1O0m9Y+7icKn868rE7uTxU1
	5wwhM95EOi4HW0twZ9ISdSu5Gdlxn1aN58McSCpRmM2u06OlqiXu7kt/9vDCQ4irZlSY
	w5o8DG+1PSPiPEGE2vcItyV492Rx1ah4pRAaHWFOtP8E1brVZUJxqdcPYCgihbInUugn
	FGwdHceKsnBgx7zjVz5u2ycEBJ2teUj6qYnsnWQCuqJRJTmtaZExRSgV92o+uUjLqUpl
	ZfooawiZd3jRdET0lYrNP8wStNR/IDQmoEw1qDylqSovsbiUn5gKlcpEf+U2jMmZcqeK
	//Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:sender:subject:to:cc:references:from:openpgp
	:autocrypt:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=WN/cALtf5EiMQQyqLDkKRWJEl3K5kjK7i1rVgAS4Kps=;
	b=Nr5+7xCWaMj6yHqBXS95rbpVV/dnsIrdasx2sQjHRui/vJlAa6TqxpBrswdmHjglFg
	eZODRnagH48adDbrI5TWeaUqRyakp9aG+Nj3z9J5/eUaWJdvmsJtGGbyMJI2BCQA9Kmv
	2V429CGrXRcJ0spDxlJCwYIohQ1S3WcAHgIjTFAU5kMyBlso0KQe1vTtkFkPg4d0iz85
	UQbRCGqrbu5cHX/+RsJB2r6+mKNOCSZMptrLTmSWo0fMwzVKvn47edDkk0WoppX1Fl29
	oO7qGFPB5RF87VOTUWHEt2vke1VI3xlWU4acJiomuDSW8UIur5Vb0sdgA8+0BzB875/x
	yJ4A==
X-Gm-Message-State: AOUpUlFqo8O7JLyjZhz91V8nqAw9HJd2ijBfdmeE3x1VTFvd/NU4P+B4
	hA+rJb5/8mh0IXoD2tWtw/g=
X-Received: by 2002:ab0:2492:: with SMTP id
	i18-v6mr7853114uan.104.1534220262912; 
	Mon, 13 Aug 2018 21:17:42 -0700 (PDT)
Received: from [192.168.1.11] ([138.117.48.222])
	by smtp.gmail.com with ESMTPSA id
	o136-v6sm5759402vko.42.2018.08.13.21.17.38
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 13 Aug 2018 21:17:42 -0700 (PDT)
To: Stefan Hajnoczi <stefanha@redhat.com>, qemu-devel@nongnu.org
References: <20180813184624.12071-1-stefanha@redhat.com>
	<20180813184624.12071-7-stefanha@redhat.com>
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
Message-ID: <012316fe-edc8-689a-b328-d84e2268a7e4@amsat.org>
Date: Tue, 14 Aug 2018 01:17:33 -0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20180813184624.12071-7-stefanha@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::943
Subject: Re: [Qemu-arm] [PATCH v5 6/6] Add QTest testcase for the Intel
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
	Steffen Gortz <qemu.ml@steffen-goertz.de>,
	Su Hang <suhang16@mails.ucas.ac.cn>, joel@jms.id.au,
	qemu-arm@nongnu.org, jusual@mail.ru
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: N9eefL+gyiL9

Hi Su, Stefan,

On 08/13/2018 03:46 PM, Stefan Hajnoczi wrote:
> From: Su Hang <suhang16@mails.ucas.ac.cn>
> 
> 'test.hex' file is a memory test pattern stored in Hexadecimal Object
> Format.  It loads at 0x10000 in RAM and contains values from 0 through
> 255.

Please add this comment in the source file.

> 
> The test case verifies that the expected memory test pattern was loaded.
> 
> Reviewed-by: Stefan Hajnoczi <stefanha@redhat.com>
> Suggested-by: Steffen Gortz <qemu.ml@steffen-goertz.de>
> Suggested-by: Stefan Hajnoczi <stefanha@redhat.com>
> Signed-off-by: Su Hang <suhang16@mails.ucas.ac.cn>
> Signed-off-by: Stefan Hajnoczi <stefanha@redhat.com>
> ---
>  MAINTAINERS                          |  6 ++++
>  configure                            |  4 +++
>  tests/Makefile.include               |  2 ++
>  tests/hexloader-test.c               | 41 ++++++++++++++++++++++++++++
>  tests/hex-loader-check-data/test.hex | 18 ++++++++++++
>  5 files changed, 71 insertions(+)
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
> index 0000000000..90e470e9db
> --- /dev/null
> +++ b/tests/hexloader-test.c
> @@ -0,0 +1,41 @@
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
> +/* success if no crash or abort */

 ... 'test.hex' file is a memory test pattern stored in Hexadecimal
Object Format.  It loads at 0x10000 in RAM and contains values from 0
through 255.

Funny =)

Reviewed-by: Philippe Mathieu-Daudé <f4bug@amsat.org>

> +static void hex_loader_test(void)
> +{
> +    unsigned int i;
> +    const unsigned int base_addr = 0x00010000;
> +
> +    QTestState *s = qtest_startf(
> +        "-M vexpress-a9 -nographic -device loader,file=tests/hex-loader-check-data/test.hex");
> +
> +    for (i = 0; i < 256; ++i) {
> +        uint8_t val = qtest_readb(s, base_addr + i);
> +        g_assert_cmpuint(i, ==, val);
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
> index 0000000000..008a90bd4d
> --- /dev/null
> +++ b/tests/hex-loader-check-data/test.hex
> @@ -0,0 +1,18 @@
> +:020000040001F9
> +:10000000000102030405060708090a0b0c0d0e0f78
> +:10001000101112131415161718191a1b1c1d1e1f68
> +:10002000202122232425262728292a2b2c2d2e2f58
> +:10003000303132333435363738393a3b3c3d3e3f48
> +:10004000404142434445464748494a4b4c4d4e4f38
> +:10005000505152535455565758595a5b5c5d5e5f28
> +:10006000606162636465666768696a6b6c6d6e6f18
> +:10007000707172737475767778797a7b7c7d7e7f08
> +:10008000808182838485868788898a8b8c8d8e8ff8
> +:10009000909192939495969798999a9b9c9d9e9fe8
> +:1000a000a0a1a2a3a4a5a6a7a8a9aaabacadaeafd8
> +:1000b000b0b1b2b3b4b5b6b7b8b9babbbcbdbebfc8
> +:1000c000c0c1c2c3c4c5c6c7c8c9cacbcccdcecfb8
> +:1000d000d0d1d2d3d4d5d6d7d8d9dadbdcdddedfa8
> +:1000e000e0e1e2e3e4e5e6e7e8e9eaebecedeeef98
> +:1000f000f0f1f2f3f4f5f6f7f8f9fafbfcfdfeff88
> +:00000001FF
> 
