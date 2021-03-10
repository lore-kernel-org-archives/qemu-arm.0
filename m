Received: by 2002:a0c:aac5:0:0:0:0:0 with SMTP id g5csp794150qvb;
        Wed, 10 Mar 2021 07:20:52 -0800 (PST)
X-Google-Smtp-Source: ABdhPJwdedqXn2oRgvNjgN9Mwf0cceo7wy0pvqlj/NBecxhqhsZG4/cS0M6EhL+SumImzseWjHDd
X-Received: by 2002:a92:c052:: with SMTP id o18mr2974419ilf.84.1615389651634;
        Wed, 10 Mar 2021 07:20:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1615389651; cv=none;
        d=google.com; s=arc-20160816;
        b=IldxX8JbvwaknD58FmpznlcU5xubfsjsL7GESPePyKOsoLLxcjMirNbsdMEii61swo
         a5h15dtGkXCE5L7Y1G44/cyBbmG66QQR5snjd5vB22LP9ZenRuLoHbogOw3VqpR0U5ol
         /2rdzQOwEpt4i+6J/A+QZVv56muI26X1lXPJ0gZBrsbummEUmR3vOGxkZLq/CU6tdTbW
         HY7w4DMhGiXkbdn52tusKV+/k+W+z3q0p6Ko6+gfjqU0QY0Cm9PLo+QlIsoGV8m3E2a/
         +aBiwMhVWLdTIwCCpDn9yidteu4keuaviSveyDNxEsCgFWdLNvHRK90kp34GFXS5/M8P
         fQZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=TbMLigH8Mpsu0ZbFvIpyL/zkpW0x74/TgwZ0GYk8LbU=;
        b=E/mQojnz+SD0Jl3p2fjSj1F6VoZU4dJrFmc1lXxmUNiFN0Wd7vr8RtuSDRMz4IKRU0
         6CBNe4auJdhb02hyX72jmNTjoahWGJ+dKDPMa5oETqiRL+JN/d+8lY/ZcM/+qyb45fZ0
         vkI/IuAL9+5U/HfahdkaOzdbZ2z2RU61mTHfVIaqvscyYBSGyT2tIZ6Cj4staQaqRtMI
         j7IOhjf97VqfTQt9xhJK8MJqqlq5FN0fRtmhPYAvAEaXhkzpeQP9mRO5UYLZWzb8vlWQ
         JszpDjyov9pcMTxKzwzsf6qrup4WtFuZi98XfBya/BKERVcgs2LfvfhyhPAsLgMXDz60
         TNSA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=erVtgq3w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h13si17368351iow.73.2021.03.10.07.20.51
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 10 Mar 2021 07:20:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=erVtgq3w;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:44554 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lK0dm-0007kv-V5
	for alex.bennee@linaro.org; Wed, 10 Mar 2021 10:20:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:49050)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lK0dP-0007jH-9g
 for qemu-arm@nongnu.org; Wed, 10 Mar 2021 10:20:27 -0500
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:35559)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_CBC_SHA1:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1lK0dM-0005SY-5o
 for qemu-arm@nongnu.org; Wed, 10 Mar 2021 10:20:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1615389623;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=TbMLigH8Mpsu0ZbFvIpyL/zkpW0x74/TgwZ0GYk8LbU=;
 b=erVtgq3wkoi/13VQerUIDHLpUMoonOeCydXKS9Kif2l75SvpJTHeFkuTyjh41kXrqxMYDh
 Pl139cU4hbZvmWM9FMbJBLVh7ctgBwDDvm3usj+Zu8Acns0D6P13qxZpsUfEbl+lSHRRmb
 j9YChrQKU4OkEzxPhN6KJJx0TJNqZAE=
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com
 [209.85.217.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-581-Zpc2J_ujOICld5hajTJItQ-1; Wed, 10 Mar 2021 10:20:19 -0500
X-MC-Unique: Zpc2J_ujOICld5hajTJItQ-1
Received: by mail-vs1-f71.google.com with SMTP id w5so5058206vsf.14
 for <qemu-arm@nongnu.org>; Wed, 10 Mar 2021 07:20:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TbMLigH8Mpsu0ZbFvIpyL/zkpW0x74/TgwZ0GYk8LbU=;
 b=cQEHVm99DuidBCwY1OKGMYeGmzgWEh1fq+/3Ngdb3yZauNihA2j1t5vuhF5rTlBnga
 8F3IMTuTeU/xtrt91c58HaKFbdkmdzSl/YqucZrtMAF64is1Wik5uPOAeLkJUSCpNtqh
 pSjNOgMlcW4uXn5HdAKN2gzVvIOUJxymuwl4vjzRGuPRBALfVgg6yr4RngrSaddGVc7V
 RLjsSFY+lVR2GLIWNc0EqPUt8Eg5g3v/TBa8An9Ms974+vd1ozVLXfPEPnXNY4yS49MF
 T3Q/da7tQXfGVfJyEW0S45RQDfKW29u3r4FBh9I3tZZzS7poIUCyLLNOWM1d7CZ7xD3H
 fRow==
X-Gm-Message-State: AOAM533NQOshgf5rbt6LFM5h3ftWjyj5p6i6U829bVceznb3iOJ2yCar
 T6IqojZvABqRxh+V3IhlgdlnDgSFbkbmIC/w64fU3EqQb0jcu/1/sGFFlzlBcjOVX0cKKeG3BtW
 uPHlKhO9cq5zVoMth8dEB+3+dMrkz
X-Received: by 2002:a67:3241:: with SMTP id y62mr1922444vsy.45.1615389618903; 
 Wed, 10 Mar 2021 07:20:18 -0800 (PST)
X-Received: by 2002:a67:3241:: with SMTP id y62mr1922416vsy.45.1615389618673; 
 Wed, 10 Mar 2021 07:20:18 -0800 (PST)
MIME-Version: 1.0
References: <20210214194524.768660-1-f4bug@amsat.org>
In-Reply-To: <20210214194524.768660-1-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Wed, 10 Mar 2021 12:19:52 -0300
Message-ID: <CAKJDGDb_ZF_r3EzfXyQRKSWdvyV98eLD9=3PEdz=w+YAe_JWzw@mail.gmail.com>
Subject: Re: [PATCH v2] tests/acceptance: Add bFLT loader linux-user test
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.243,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H3=0.001, RCVD_IN_MSPIKE_WL=0.001,
 SPF_HELO_NONE=0.001, SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
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
Cc: qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>, Willian Rampazzo <willianr@redhat.com>,
 qemu-arm <qemu-arm@nongnu.org>, Cleber Rosa <crosa@redhat.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cBHTVEE+aNIG

On Sun, Feb 14, 2021 at 4:45 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Add a very quick test that runs a busybox binary in bFLT format:
>
>   $ avocado --show=3Dapp run -t linux_user tests/acceptance/load_bflt.py
>   JOB ID     : db94d5960ce564c50904d666a7e259148c27e88f
>   JOB LOG    : ~/avocado/job-results/job-2019-06-25T10.52-db94d59/job.log
>    (1/1) tests/acceptance/load_bflt.py:LoadBFLT.test_stm32: PASS (0.15 s)
>   RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 =
| CANCEL 0
>   JOB TIME   : 0.54 s
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
> Based-on: <20210214175912.732946-1-f4bug@amsat.org>
>   tests/acceptance: Extract QemuBaseTest from Test
>   tests/acceptance: Make pick_default_qemu_bin() more generic
>   tests/acceptance: Introduce QemuUserTest base class
> ---
>  tests/acceptance/load_bflt.py | 51 +++++++++++++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 tests/acceptance/load_bflt.py
>

Including the skipUnless on `cpio` mentioned by Thomas,

Reviewed-by: Willian Rampazzo <willianr@redhat.com>

> diff --git a/tests/acceptance/load_bflt.py b/tests/acceptance/load_bflt.p=
y
> new file mode 100644
> index 00000000000..4b7796d0775
> --- /dev/null
> +++ b/tests/acceptance/load_bflt.py
> @@ -0,0 +1,51 @@
> +# Test the bFLT format
> +#
> +# Copyright (C) 2019 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import os
> +import bz2
> +import subprocess
> +
> +from avocado_qemu import QemuUserTest
> +
> +
> +class LoadBFLT(QemuUserTest):
> +
> +    def extract_cpio(self, cpio_path):
> +        """
> +        Extracts a cpio archive into the test workdir
> +
> +        :param cpio_path: path to the cpio archive
> +        """
> +        cwd =3D os.getcwd()
> +        os.chdir(self.workdir)
> +        with bz2.open(cpio_path, 'rb') as archive_cpio:
> +            subprocess.run(['cpio', '-i'], input=3Darchive_cpio.read(),
> +                           stderr=3Dsubprocess.DEVNULL)
> +        os.chdir(cwd)
> +
> +    @skipUnless(os.getenv('AVOCADO_ALLOW_UNTRUSTED_CODE'), 'untrusted co=
de')
> +    def test_stm32(self):
> +        """
> +        :avocado: tags=3Darch:arm
> +        :avocado: tags=3Dlinux_user
> +        :avocado: tags=3Dquick
> +        """
> +        # See https://elinux.org/STM32#User_Space
> +        rootfs_url =3D ('https://elinux.org/images/5/51/'
> +                      'Stm32_mini_rootfs.cpio.bz2')
> +        rootfs_hash =3D '9f065e6ba40cce7411ba757f924f30fcc57951e6'
> +        rootfs_path_bz2 =3D self.fetch_asset(rootfs_url, asset_hash=3Dro=
otfs_hash)
> +        busybox_path =3D self.workdir + "/bin/busybox"
> +
> +        self.extract_cpio(rootfs_path_bz2)
> +
> +        res =3D self.run(busybox_path)
> +        ver =3D 'BusyBox v1.24.0.git (2015-02-03 22:17:13 CET) multi-cal=
l binary.'
> +        self.assertIn(ver, res.stdout_text)
> +
> +        res =3D self.run(busybox_path, ['uname', '-a'])
> +        unm =3D 'armv7l GNU/Linux'
> +        self.assertIn(unm, res.stdout_text)
> --
> 2.26.2
>

