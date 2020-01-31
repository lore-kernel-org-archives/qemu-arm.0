Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp47033lfp;
        Thu, 30 Jan 2020 18:10:56 -0800 (PST)
X-Google-Smtp-Source: APXvYqztfPCGPuOnBokUnFaplcvi6wRBsqkqGED5FXgeoxK/IRPdksm/A6uMJWeVY3bC5DRX0pPU
X-Received: by 2002:a0c:f685:: with SMTP id p5mr8234492qvn.44.1580436656395;
        Thu, 30 Jan 2020 18:10:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580436656; cv=none;
        d=google.com; s=arc-20160816;
        b=bQCXc4uzkZmppulmW/ebDu3WrqWKsUXlW8D0DFZKnpiL4H4OIwQ7geCfhEb97LbPlh
         FrVLMxpPEkzJKtIMEBNMjKGvIvHTeWxixCcWXL06AfmuwnI86JO8rP9GOIkgmkKYDQcz
         2YPC0EfX7t2YtsLJwCZCVBTsMRWR3NI258/atgGrGoyq1QH4k3Wo0cmQYVLfy5yA66P8
         Mfg2UaYOkNVeA88xGQMGdIT1vOBzJCIawYn5eHPdXeVwTpwK+7pTZMY/oZUQWfHycWwp
         YSZEqjZtXsscuYiZ6x43lIeFY4/xpZJqmuJ38P7UC0Tc93PQMBvViFEcBdWSK3gtd4ph
         Vspg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=N6ayk/ft5wsmfKUBydtbk6VT0gvwHB29Ch32NVXJQJM=;
        b=vh3yc2McfQbl4ZLGTfmB93S4AdynqGdR+lHwyFFr6A33hBW1IvEPnEsHUEjKyPV5ki
         jHK8pAoZK93v+t4qBOc3VvkgJge5p8LktWc9DeOjXOuSW2mOUSR7PO+R6wm+WuwvFgim
         Z3TdbyGxZ3MyLwAMCOrLt6piXz/a6L7Ou0VYIwn4tfUKqxII8nf09WKYe7v0UnSzOyiz
         QhrEX/P0yFbhTzU2hxwJKfi1hmab+bZnRUSKGbDqGo6G1ahwVHOm2E7PCiCIgMjeUz4q
         48GIfF7LUJ+K67STrhDsSv8m08zBIL6TQI1h3PmT7rOYRko4MVwbhgW025uj+1hiSUqw
         /hUQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VM7OMU8k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14si5228591qkh.103.2020.01.30.18.10.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 Jan 2020 18:10:56 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=VM7OMU8k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:47584 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ixLln-0002h2-S4
	for alex.bennee@linaro.org; Thu, 30 Jan 2020 21:10:55 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:50848)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <philmd@redhat.com>) id 1ixLle-0002eC-J2
 for qemu-arm@nongnu.org; Thu, 30 Jan 2020 21:10:48 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <philmd@redhat.com>) id 1ixLlc-0000mt-64
 for qemu-arm@nongnu.org; Thu, 30 Jan 2020 21:10:45 -0500
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:50520
 helo=us-smtp-1.mimecast.com)
 by eggs.gnu.org with esmtps (TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32)
 (Exim 4.71) (envelope-from <philmd@redhat.com>) id 1ixLlc-0000lR-1q
 for qemu-arm@nongnu.org; Thu, 30 Jan 2020 21:10:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1580436643;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=N6ayk/ft5wsmfKUBydtbk6VT0gvwHB29Ch32NVXJQJM=;
 b=VM7OMU8kfvtVGWn3xWnwPT52Z/HfJ0uhPzbI/30lowp5xscnQ+QWkps3MY8B1Jq5U5Egs8
 SjKKb8sqB4JD6jqaR0+cDTqA/LrHzA0Fy47mAFS7Topfj+/EeonJuGCFmrzeSMNtfbkW5s
 C46gzoghnS5AJ/0Zb22f7j6c0VAZjXA=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-424-cstCIGOvNDW-wx-bpFL2vg-1; Thu, 30 Jan 2020 21:10:39 -0500
Received: by mail-wm1-f72.google.com with SMTP id 7so2145057wmf.9
 for <qemu-arm@nongnu.org>; Thu, 30 Jan 2020 18:10:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=sQ2XPoEyVrYXsnHP3S+Bx1jgnWR7qliXlQ6rATor0F8=;
 b=k+pNrZfvNhuUX8muFd5smFdcMyu05qXMu6cgJ2wC1jcmzTyNhAoyj43Ov5dtaPXCnh
 EIBWxeL4bvpI8zZNxIJiwODf80h023185Lxl1dBIApXEw0/GxkW18QaLRnKy60BRS5u9
 B6UJotNAm0GYh8Phqb6UnwTHx3hGMDOI9Lhs87nS9lWh+GJHwAm7320wAix06Z4IE/q5
 wcxlJOLvpPoTOlN6AJVRy5liGgp8pR2CM179OIvBy9Iaeq98JJ5RcVGb7WJsydzliWSQ
 MsjZvcqPnHftu6TixcAzSqUxN8re00NuGghi6Uii6ppsoRuYCXhwdSrXLnzhp0a9M8I+
 jBVg==
X-Gm-Message-State: APjAAAU/6p9yyayPrXbgHPLfNKs1evCYH3kQji6lyGtkuflK0UMbMjJV
 nqxq2hCxwryPwOpihMCunXEgkZK6jDQM25cFn1EfvKqC/lyDLAPjY03QfD5BOtJ9AEkCzbsfxO3
 yxDdTrmGCTxsH
X-Received: by 2002:a1c:80d4:: with SMTP id b203mr8938984wmd.102.1580436638022; 
 Thu, 30 Jan 2020 18:10:38 -0800 (PST)
X-Received: by 2002:a1c:80d4:: with SMTP id b203mr8938944wmd.102.1580436637597; 
 Thu, 30 Jan 2020 18:10:37 -0800 (PST)
Received: from [192.168.1.35] (113.red-83-57-172.dynamicip.rima-tde.net.
 [83.57.172.113])
 by smtp.gmail.com with ESMTPSA id z21sm8644614wml.5.2020.01.30.18.10.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 30 Jan 2020 18:10:36 -0800 (PST)
Subject: Re: [PATCH v4 7/7] tests/boot_linux_console: Tag Emcraft Smartfusion2
 as running 'u-boot'
To: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <f4bug@amsat.org>,
 qemu-devel@nongnu.org
References: <20200120235159.18510-1-f4bug@amsat.org>
 <20200120235159.18510-8-f4bug@amsat.org>
From: =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@redhat.com>
Message-ID: <851737e6-9afd-85a5-b9a8-49e506287cf8@redhat.com>
Date: Fri, 31 Jan 2020 03:10:34 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200120235159.18510-8-f4bug@amsat.org>
Content-Language: en-US
X-MC-Unique: cstCIGOvNDW-wx-bpFL2vg-1
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 205.139.110.120
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Alistair Francis <alistair@alistair23.me>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>, qemu-arm@nongnu.org,
 Cleber Rosa <crosa@redhat.com>, Laurent Bonnans <laurent.bonnans@here.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 1u3W2HPvTV5g

On 1/21/20 12:51 AM, Philippe Mathieu-Daud=C3=A9 wrote:
> Avocado tags are handy to automatically select tests matching
> the tags. Since this test also runs U-Boot, tag it.
>=20
> We can run all the tests using U-Boot as once with:
>=20
>    $ avocado --show=3Dapp run -t u-boot tests/acceptance/
>    JOB LOG    : avocado/job-results/job-2020-01-21T00.16-ee9344e/job.log
>     (1/3) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_ar=
m_emcraft_sf2: PASS (16.59 s)
>     (2/3) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_ar=
m_raspi2_uboot: PASS (0.47 s)
>     (3/3) tests/acceptance/boot_linux_console.py:BootLinuxConsole.test_aa=
rch64_raspi3_uboot: PASS (2.43 s)
>    RESULTS    : PASS 3 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0=
 | CANCEL 0
>    JOB TIME   : 19.78 s
>=20
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>   tests/acceptance/boot_linux_console.py | 1 +
>   1 file changed, 1 insertion(+)
>=20
> diff --git a/tests/acceptance/boot_linux_console.py b/tests/acceptance/bo=
ot_linux_console.py
> index 22b360118d..4a4cf9d0ea 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -305,6 +305,7 @@ class BootLinuxConsole(Test):
>           :avocado: tags=3Darch:arm
>           :avocado: tags=3Dmachine:emcraft-sf2
>           :avocado: tags=3Dendian:little
> +        :avocado: tags=3Du-boot
>           """
>           uboot_url =3D ('https://raw.githubusercontent.com/'
>                        'Subbaraya-Sundeep/qemu-test-binaries/'
>=20

Thanks, applied to my python-next tree:
https://gitlab.com/philmd/qemu/commits/python-next

