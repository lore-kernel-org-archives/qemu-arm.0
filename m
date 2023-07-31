Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp2178352ejb;
        Mon, 31 Jul 2023 06:34:44 -0700 (PDT)
X-Received: by 2002:adf:f2c2:0:b0:314:1f0:5846 with SMTP id d2-20020adff2c2000000b0031401f05846mr10219784wrp.19.1690810484160;
        Mon, 31 Jul 2023 06:34:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690810484; cv=none;
        d=google.com; s=arc-20160816;
        b=vj0RKpO7Ttfcsy27mGmW8M/6q8wllvPC1d+UiGh90rQLqEzkwJKSPgwl0nCd1oKFEr
         AM2e1XuP6IS0sVVT0YqwxdOHoemAPGCQT7pA/+v7pS1vxCMujcLgmmeP3Z/m+eZh97bn
         wmtJwoC3L3U1IfNcOJnioF7+akbvrIqAb2eEc79Up/5f+sHo6ZHCRROdvQ8s22tqTSOR
         ehYLc/YKFA9lewBkgSJ4QqaOGUsczKPnGzPgXEVb6ar/pjeKB+XDUvYjPGJgGpDNLy50
         UDkZdrjH64eyHgWQshkTyxhnoT5rwvKUHEu+e5Kl/poLxXie8dyX0NfVFlUrTcnqhvnF
         3Vig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :dkim-signature;
        bh=r7Uopr2kgIXt3FFhLmTKhDjvzf6Kx+vE1vxShydLgeA=;
        fh=99M8M+8TD8TDQI1qe/4NtoIvOpLCBIu4dx5efhOEhl4=;
        b=fRyOMWrVzg27Gxe1fd7TC7FB9aj931Hzq6KNnGivThlydLRm5Mbdh1HKkpl8biVwEr
         4gpzkXk4UapS2+38bLEBbvc896bReeP+i7/tKFxoYwS5qEw9TCRxEZFkvvv6+wTAgN5a
         2pEuKHA9JPHgAzy4Xnp/5G6FBLEsxs+ApkC4dxPY6ctxn3c0lFgd2zD7ftww9LS06ukU
         Zo3q7n9MOOsU3lAY/0QskUqWZ8AAv+AfN3M0QOJ5Jp+Pj9HuS17rcgfMetb+bqwml2YV
         F24o70gJtNCOvNbAtr8+bukC3MdvJy/ozpGMhaGorZEyJT8iv8uTYlKILtFOmnzjdRoU
         2V6Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JSMWrok2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <philmd@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id s16-20020a05600c045000b003fbdbd0a7ddsor2769284wmb.3.2023.07.31.06.34.44
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 31 Jul 2023 06:34:44 -0700 (PDT)
Received-SPF: pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JSMWrok2;
       spf=pass (google.com: domain of philmd@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=philmd@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690810484; x=1691415284;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r7Uopr2kgIXt3FFhLmTKhDjvzf6Kx+vE1vxShydLgeA=;
        b=JSMWrok2UQBCpyrAEWsgW2Hbs50BJw08em/KcVvuVIxLGOsz3E6LsKaRVfl9eB/5c8
         OYk6qRpnK8E1KRfNK4SJODWZBROQvKybthPZkluX9Ink2ajQQfe2WvkKvdL5l3pDDZgJ
         3YBUbTvZ2JLWTsm+8iM1/shQq5eA/YhnXNEs89YNYLlaGJSkbTax2mL6/JaNtUSrWLq1
         bf/CnUqSNCB1AmCSeZhwHHKXfx4Z682pJid4Z1eRR69oWc/O4BVRp6ChHp/xdSmI3x/G
         QV6GetEt3zxwdduQY8tuTHAX1XosnyVweHmxmF0w8437PgCGBe5ISQnFQ1uRZhmp978Q
         q9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690810484; x=1691415284;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r7Uopr2kgIXt3FFhLmTKhDjvzf6Kx+vE1vxShydLgeA=;
        b=kfqevxcYuXhC7uU+xvAUNeIM2lVM1hU/Bx3a72cFyrYvq/0KK5lszlofeu+hBqqmb9
         iydAq7FPt6FIWpWdCKO3oPoSPcSwsWmsMSaf0U6xM6nV1aqsOVY7B9fFNr5yG7ke0BdC
         qbJM+kID1Uy8ylrkXgCy4aoat7bhcBydSvwIv7ab/dvzRSP++ljeaVO/QCpZgVFkC0WL
         kO8fwHAry7Y4+F9yq1dnyVLd7W9X94KYLbamNkt6dVz/OFYAxBeLt+9LqV7axClE+TOo
         0DNpVjpBj61XB75h+hFMaBBT7m1XxGIf5iUuPuR6B/5io9pwDke6LtomFQCW7hSX2I8f
         f4Qw==
X-Gm-Message-State: ABy/qLaVbQ4Cak2y07Ya7P3106pZh2j9dPxeHj8pkhQrC4oo+uYAGP6F
	4DzvMG1zRDus+dVA7Z2pTHxck0sU
X-Google-Smtp-Source: APBJJlHgjcjnmExY7U3tcpjy8F+fxzOvv6AKBpdUY6kpOips7eRhD3ysZnz85lMBaf7HYKmQhGRIeA==
X-Received: by 2002:a05:600c:11c9:b0:3f6:d90:3db with SMTP id b9-20020a05600c11c900b003f60d9003dbmr7656681wmi.3.1690810483742;
        Mon, 31 Jul 2023 06:34:43 -0700 (PDT)
Return-Path: <philmd@linaro.org>
Received: from [192.168.69.115] ([176.187.198.42])
        by smtp.gmail.com with ESMTPSA id e36-20020a5d5964000000b002fb60c7995esm13215285wri.8.2023.07.31.06.34.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 06:34:43 -0700 (PDT)
Message-ID: <eb9ef3c1-18f8-2209-8630-155e38dd4d12@linaro.org>
Date: Mon, 31 Jul 2023 15:34:34 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.13.0
Subject: Re: [RFC PATCH 02/24] gdbstub: Introduce GDBFeature structure
Content-Language: en-US
To: Akihiko Odaki <akihiko.odaki@daynix.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, =?UTF-8?Q?Alex_Benn=c3=a9e?=
 <alex.bennee@linaro.org>, Thomas Huth <thuth@redhat.com>,
 Alexandre Iooss <erdnaxe@crans.org>, Mahmoud Mandour
 <ma.mandourr@gmail.com>, Eduardo Habkost <eduardo@habkost.net>,
 Marcel Apfelbaum <marcel.apfelbaum@gmail.com>,
 Yanan Wang <wangyanan55@huawei.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?Q?Marc-Andr=c3=a9_Lureau?= <marcandre.lureau@redhat.com>,
 =?UTF-8?Q?Daniel_P=2e_Berrang=c3=a9?= <berrange@redhat.com>,
 John Snow <jsnow@redhat.com>, Cleber Rosa <crosa@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Michael Rolnik
 <mrolnik@gmail.com>, "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Brian Cain <bcain@quicinc.com>, Song Gao <gaosong@loongson.cn>,
 Xiaojuan Yang <yangxiaojuan@loongson.cn>, Laurent Vivier
 <laurent@vivier.eu>, Aurelien Jarno <aurelien@aurel32.net>,
 Jiaxun Yang <jiaxun.yang@flygoat.com>,
 Aleksandar Rikalo <aleksandar.rikalo@syrmia.com>,
 Chris Wulff <crwulff@gmail.com>, Marek Vasut <marex@denx.de>,
 Stafford Horne <shorne@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 =?UTF-8?Q?C=c3=a9dric_Le_Goater?= <clg@kaod.org>,
 David Gibson <david@gibson.dropbear.id.au>, Greg Kurz <groug@kaod.org>,
 Nicholas Piggin <npiggin@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Alistair Francis <alistair.francis@wdc.com>,
 Bin Meng <bin.meng@windriver.com>, Weiwei Li <liweiwei@iscas.ac.cn>,
 Liu Zhiwei <zhiwei_liu@linux.alibaba.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
 Max Filippov <jcmvbkbc@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, qemu-ppc@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org
References: <20230731084354.115015-1-akihiko.odaki@daynix.com>
 <20230731084354.115015-3-akihiko.odaki@daynix.com>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <20230731084354.115015-3-akihiko.odaki@daynix.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TUID: tUHDQbBWhzLx

On 31/7/23 10:43, Akihiko Odaki wrote:
> Before this change, the information from a XML file was stored in an
> array that is not descriptive. Introduce a dedicated structure type to
> make it easier to understand and to extend with more fields.

Great idea!

> Signed-off-by: Akihiko Odaki <akihiko.odaki@daynix.com>
> ---
>   MAINTAINERS             |  2 +-
>   meson.build             |  2 +-
>   include/exec/gdbstub.h  |  9 ++++--
>   gdbstub/gdbstub.c       |  4 +--
>   stubs/gdbstub.c         |  6 ++--
>   scripts/feature_to_c.py | 44 ++++++++++++++++++++++++++
>   scripts/feature_to_c.sh | 69 -----------------------------------------
>   7 files changed, 58 insertions(+), 78 deletions(-)
>   create mode 100755 scripts/feature_to_c.py
>   delete mode 100644 scripts/feature_to_c.sh


> diff --git a/scripts/feature_to_c.py b/scripts/feature_to_c.py
> new file mode 100755
> index 0000000000..5a5b49367b
> --- /dev/null
> +++ b/scripts/feature_to_c.py
> @@ -0,0 +1,44 @@

SPDX-License-Identifier: GPL-2.0-or-later ?

> +#!/usr/bin/env python3
> +
> +import os, sys
> +
> +def writeliteral(indent, bytes):
> +    sys.stdout.write(' ' * indent)
> +    sys.stdout.write('"')
> +    quoted = True
> +
> +    for c in bytes:
> +        if not quoted:
> +            sys.stdout.write('\n')
> +            sys.stdout.write(' ' * indent)
> +            sys.stdout.write('"')
> +            quoted = True
> +
> +        if c == b'"'[0]:
> +            sys.stdout.write('\\"')
> +        elif c == b'\\'[0]:
> +            sys.stdout.write('\\\\')
> +        elif c == b'\n'[0]:
> +            sys.stdout.write('\\n"')
> +            quoted = False
> +        elif c >= 32 and c < 127:
> +            sys.stdout.write(c.to_bytes(1, 'big').decode())
> +        else:
> +            sys.stdout.write(f'\{c:03o}')
> +
> +    if quoted:
> +        sys.stdout.write('"')
> +
> +sys.stdout.write('#include "qemu/osdep.h"\n#include "exec/gdbstub.h"\n\nconst GDBFeature gdb_features[] = {\n')

Preferably split in 3 calls for readability, otherwise:

Reviewed-by: Philippe Mathieu-Daudé <philmd@linaro.org>
