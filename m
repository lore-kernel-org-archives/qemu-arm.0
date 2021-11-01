Received: by 2002:a05:6512:b9e:0:0:0:0 with SMTP id b30csp2427764lfv;
        Mon, 1 Nov 2021 12:05:02 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyh34FTBn7/isRlah66aLtgMbJhDFtyCQ7Sy6UaOuSjss3xwygNNF06QB87k9vGK+DUyv16
X-Received: by 2002:a54:4f0d:: with SMTP id e13mr745519oiy.110.1635793502022;
        Mon, 01 Nov 2021 12:05:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1635793502; cv=none;
        d=google.com; s=arc-20160816;
        b=rOFcci8zIkwiATE7T2FqN8xSTXU/d5uMd/jY5lv+yuojWlG0OZoNpWnLF0Jw2p1F+o
         fXNnAuvqhMblDRtrIDdcsPt0G1pl1g85xo+zw8rsfkoW+4w0ymOKsse+xN2sc3LuYVYH
         stNeMnrrs+sdeZWKrMk31teURxqe0TOSCR8vD90ajI4dVnjZhOUWQh7ieG2ptz8i12Rc
         8t9Hogkf9a2nOsHU22Xm8Se7aNtSs7g/KfdXfdQJoMvyvh05urg3KQDc7QZ1ngXqrMeW
         oX25sN4/PajuMJxr/MIydUMCws5MptDlTs/p3GnSePi/POfJ82mN94h6nFZaXLkPFXA2
         PeGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=0S6+Om3mwexqHvaHOvzgLHf6nRLt5nN5suGHcXY/OtY=;
        b=0/h9LzO4lCwQOGtbIQhCjycTaU7QWXdY2CF3JLCydtr2TRpdc82TTq6OwrGX46HktF
         25OYjd8zN7Cjq9qiPkA/h6s8Ltv0ESqfGx6/O9F9425B7NUGMi3i6WjLMqijEPRfLmnx
         K9ViWGzdxjyR0ZrT2Qiqr9DgFkZxfoXYEkfmZtIhhb23OnjP08Hjcj0zi/EUwQi4Wz/Y
         mr8MVFLtBNE+01he796NrH4VDoMPbhcs7Nx4R+4bpmfRwjTsrtdsda+7fX/OvWUUyN8M
         XCHSOSm/Pz3fwMBPEKQvu4Mgx2tt126t8pe/UEsf+XHlo0GhE/wMvrUWSa40fCMDGyx5
         La9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GjRHFAhy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s15si3384121otv.298.2021.11.01.12.05.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 01 Nov 2021 12:05:02 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@redhat.com header.s=mimecast20190719 header.b=GjRHFAhy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from localhost ([::1]:50432 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mhcc9-0006Kg-58
	for alex.bennee@linaro.org; Mon, 01 Nov 2021 15:05:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37218)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mhbTJ-0007FW-UO
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 13:51:50 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:39221)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <wrampazz@redhat.com>)
 id 1mhbTF-00006S-Tk
 for qemu-arm@nongnu.org; Mon, 01 Nov 2021 13:51:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635789105;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=0S6+Om3mwexqHvaHOvzgLHf6nRLt5nN5suGHcXY/OtY=;
 b=GjRHFAhynwb2GWmeGl6ecOFTDjgW1F/mrgvXIuDILvajIMP2Ih1SPg6vbaxcxM1zP9Eq5F
 iAhfiDbuJzo1lFpQ0G+hzI+iRtDMXEwJO6rHpUNtwbyyaS1psfgDIeBt2biOwwql37cpcL
 stAAqIBAmHuN/pQ/LsuOtj2Wc5TnR+c=
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-569-hRuVdoQKNbmN4aXJjd6RQA-1; Mon, 01 Nov 2021 13:51:43 -0400
X-MC-Unique: hRuVdoQKNbmN4aXJjd6RQA-1
Received: by mail-pf1-f198.google.com with SMTP id
 f18-20020aa79d92000000b0048118561271so1107598pfq.21
 for <qemu-arm@nongnu.org>; Mon, 01 Nov 2021 10:51:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=0S6+Om3mwexqHvaHOvzgLHf6nRLt5nN5suGHcXY/OtY=;
 b=WC1BGqjnnZQ0s72iPev/K44VGY1YxohyB6VJci1OQNJZzspmhsBQmYDknIWPQyGGZI
 sd01DY+UIR8u8eRWQ1uOQX0+0rywG/wwD0700fejkCPCAwRwzQiT7yHKbj9Sp5Gogl7L
 VyA1EQcvQxyYrGzYIWFBWkETw6sWRSbrHWCp/snd6Y1T4yenffvMaLovbYXEDmnaeW5O
 pHB/6o5bnYj/2/MFiWXc4r6two980DDCrgzGJa+mDJiyeMIIKgVaXCIdM/W/pMhy1O9o
 YgIyoFkQjTk3AvScOoNH3T5yj8fT3OdM4ndhi/bLt3aQSTGbNI5toswIgKFQAfde3JYT
 RqkQ==
X-Gm-Message-State: AOAM531dx7FS7oCmtWRihjCFNAKB3pKwTzxxipm8QuZYGyNChhtEoWtu
 FaJLHnY5JpyWj40anzx+EvS6pEiF5o2evJGCOBtaAid2nBZ2lzrpuJ5paiTve/xGBcZv2amnCiM
 z045nBRe6P7V4eU+rRKe5d21+1UFk
X-Received: by 2002:a17:90a:d515:: with SMTP id
 t21mr422956pju.123.1635789100948; 
 Mon, 01 Nov 2021 10:51:40 -0700 (PDT)
X-Received: by 2002:a17:90a:d515:: with SMTP id
 t21mr422918pju.123.1635789100614; 
 Mon, 01 Nov 2021 10:51:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210927163116.1998349-1-f4bug@amsat.org>
 <20210927163116.1998349-6-f4bug@amsat.org>
In-Reply-To: <20210927163116.1998349-6-f4bug@amsat.org>
From: Willian Rampazzo <wrampazz@redhat.com>
Date: Mon, 1 Nov 2021 14:51:14 -0300
Message-ID: <CAKJDGDb81ST8YyYw-8KV+jx0mjaqdd9siKL2sFM4yaFwG5769w@mail.gmail.com>
Subject: Re: [PATCH v4 5/6] tests/acceptance: Add bFLT loader linux-user test
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=wrampazz@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=216.205.24.124; envelope-from=wrampazz@redhat.com;
 helo=us-smtp-delivery-124.mimecast.com
X-Spam_score_int: -34
X-Spam_score: -3.5
X-Spam_bar: ---
X-Spam_report: (-3.5 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_HIGH=-0.734,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_LOW=-0.7, RCVD_IN_MSPIKE_H2=-0.001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Warner Losh <imp@bsdimp.com>, qemu-arm <qemu-arm@nongnu.org>,
 qemu-devel <qemu-devel@nongnu.org>,
 Wainer dos Santos Moschetta <wainersm@redhat.com>,
 Laurent Vivier <laurent@vivier.eu>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: khAJRqzCOVoL

Hi, Phill,

On Mon, Sep 27, 2021 at 1:31 PM Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.or=
g> wrote:
>
> Add a very quick test that runs a busybox binary in bFLT format:
>
>   $ AVOCADO_ALLOW_UNTRUSTED_CODE=3D1 \
>     avocado --show=3Dapp run -t linux_user tests/acceptance/load_bflt.py
>   JOB ID     : db94d5960ce564c50904d666a7e259148c27e88f
>   JOB LOG    : ~/avocado/job-results/job-2019-06-25T10.52-db94d59/job.log
>    (1/1) tests/acceptance/load_bflt.py:LoadBFLT.test_stm32: PASS (0.15 s)
>   RESULTS    : PASS 1 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 0 =
| CANCEL 0
>   JOB TIME   : 0.54 s
>
> Reviewed-by: Willian Rampazzo <willianr@redhat.com>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> ---
>  tests/acceptance/load_bflt.py | 54 +++++++++++++++++++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 tests/acceptance/load_bflt.py
>
> diff --git a/tests/acceptance/load_bflt.py b/tests/acceptance/load_bflt.p=
y
> new file mode 100644
> index 00000000000..f071a979d8e
> --- /dev/null
> +++ b/tests/acceptance/load_bflt.py
> @@ -0,0 +1,54 @@
> +# Test the bFLT loader format
> +#
> +# Copyright (C) 2019 Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>
> +#
> +# SPDX-License-Identifier: GPL-2.0-or-later
> +
> +import os
> +import bz2
> +import subprocess
> +
> +from avocado import skipUnless
> +from avocado_qemu import QemuUserTest
> +from avocado_qemu import has_cmd
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
> +    @skipUnless(*has_cmd('cpio'))
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

If there are other changes to this patch, also, change this to use the
`os` library:

busybox_path =3D os.path.join(self.workdir, "/bin/busybox")

Sorry for not catching this before.

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
> 2.31.1
>

