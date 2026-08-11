Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0C46C5CFCF
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 10:35:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtjpJ-0002wZ-UO; Tue, 11 Aug 2026 06:35:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtjpG-0002wC-Cw
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 06:35:18 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtjpE-0006UT-No
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 06:35:18 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-825fdc558d3so23557167b3.2
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 03:35:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786444515; cv=none;
 d=google.com; s=arc-20260327;
 b=nO/zPhrb3dJk1lwyNdkkcZV/IW5GiELk/DpOSN07HUvFM6Ctv9cCSGE+EWB2qlnxki
 1YFJblkCVYzn6WlyogZuyW87KzVRflS9l630C7339S1sucIzujFjab/CNWlKFf3qQQzj
 OdNs44q/S8Q2OSI3ZzftJKF3VpncPdDFgGj7gqKQE+45qRmo+HVOeK+oXg4ajCnU3bCr
 piqaq3WBwzoF0XHtIEjEu3zqxuduSp0Rvapc4w3M/5Fw0O2SboE6OktytR2xgvREQSF7
 8E7Pe1oun4QNABJ9B21WrOcDOJ7QoJSf3ce0/LdjsM3wkyeOkCEwDrSXmWMNnaq0SEOn
 6vMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=wzZ5BnBQlzzhTGmSRFzOLOJJUmRxtFMTrrY4OIrwYHg=;
 fh=rj6b+ox7t1aF5cQATcc5UuHdEIDL04bcIDG5lF5eP9s=;
 b=SOFPxuFRidJOKyjGlK9YdY0YR6zXP1P+domTG9RtgEVqOS7bZSRwP9idFLi27KyC1h
 kXujuDTLbcxeKddWKrgFMxSBc+96DhVNn6vH5CpD6UA0TWoc1SuR68qL5cZxEjJdYVlE
 r4lgOhsIlRwoZefTAaL8/ll2VTqsvDVz9hkiXboed8WkKe7SiAo8WpVoYWypSsE1uzde
 BYvWQfBU9YPaz2iAaaD5OTbowZQQXgRuOf58ZbKJeS4DMqhRxq4yA8ORIbE4CHOaLTdE
 JbhjyXajoeL8mfWq75f5JhLq5G1eZoFj4BuVBkC1ywFMiM+kH9Y4ZkNw+f/zT//MFd5w
 J9LA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786444515; x=1787049315; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=wzZ5BnBQlzzhTGmSRFzOLOJJUmRxtFMTrrY4OIrwYHg=;
 b=WmchARACP5peqoo5l1mPj9Q0eJtobZQipo18GiG1NAEJmVU5gm4lKZwcgeo+2fmD2X
 ABuoGNopa3tpiuIgqKxd9K+LYKkYKhhtoVJvZTIJE9MmgiVgTAclTCnp184+c6NhR4w9
 Aql/k6R/Gg6rOuhXXXhrqrf2KNdXC3E7YkDBnKoFZleAmGzIsWHwtQyP/ssEqyZn3C4l
 o+ED/O8KtKcqjsspXpnojD6vcJcHCREaca5s1dO6PM3ftA0c2MLOoj2AuYv1WlP5ZvFI
 HXvgl1aAmE+Ge8mox0+8ARjOERqEzmg6v8vK/bH/B3uQfH7Q2oHqS5LHjz5cDaVr3DBS
 hgtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786444515; x=1787049315;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=wzZ5BnBQlzzhTGmSRFzOLOJJUmRxtFMTrrY4OIrwYHg=;
 b=fo8hEf6/qYYPj8k6Ne5IiEw40sPeKfp970wQQu3tStX/kjD+kS0eaXWw9v7h1IseQ9
 TBlS4/xvw6GZto+V5ACjZXT844hO9ZRfpPWKOcOheL5Y1FrGgdkIevLP0iCOnhV2T/hP
 eSc5QjQKPDrtISPMqEQAU4R3Q5x7R3mmnCscoiRh6z3U16rRKIvPUOp6h4XsPwXrlr5b
 Oxh8LPdXefjyOlXlFh9J2LfHLGptj6YC0+BdptIKgsi35HEiA/4ZIcoae4FNSuOEms7c
 SbrpiwFBp2aOiatGBMO9tHs9w0x8VLsIKblPXg4jX9bF2YG3wZcehjVByUWy/DnWZwgX
 pCmw==
X-Forwarded-Encrypted: i=1;
 AHgh+Rp5DGYQoEsKbpEWUBokoM7TpZjRohb7yd2EdMM4zWkTUV4Cr/ZkLK0CZbRmGVHuh4y/J+WbY4Lymg==@nongnu.org
X-Gm-Message-State: AOJu0YwDhidWyM0vTh3/Ncb5GK+0Brtd7Iza6pIw4zaQfzZFd2RCTeXH
 kQRMOqMASmLSK345pKxCOBXLYdp2N4ASV90rH8g654TP5yZ5W5/PHCXZV0ezmwMBfFFLoun58RE
 BefEZ44r4fysq+UikWZMZQc8rjt3Ud9T7chyyM/6aDg==
X-Gm-Gg: AR+sD11PUEf8Lk3bxtAF+x4/Wnep9Xdoh0tU2k23+5jJy7/Bh06y91uYIB6jPx8umst
 OS9+MbGv/HodDnn0ekhBKR1YAZa/n9vfb8FiKL8FYj/i7Pm/8aeTuMjdyFHgJIRlMLqbITiuRR8
 1+O95txXQkmnS/17w8I3GLOD09QdEpG+dbu0vjmo6Yyp/VKHUpvG8TMKVK69F75YhSzpJIZdZOy
 N4V1Mx4x9Mg1pfhGQGDFkjxcRi33W+M1KgTSJq1YOgBiBILTtUXbHO/WHeBe6HwHcBw6jajv9W+
 ULdLMbSQTpJkFSPyvAwvbrVvYANrE5QUPKfWFyWekMwVDQsRRe1XZdRQUHfauXErEYMBVYQRZh7
 VGBgktDWQA0sExd5x+4cL9rMgjohv
X-Received: by 2002:a05:690c:688a:b0:81e:5a57:b8ad with SMTP id
 00721157ae682-82f2bb8b28fmr14783717b3.21.1786444515262; Tue, 11 Aug 2026
 03:35:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260727135329.97190-1-marcelomanzo@gmail.com>
 <20260727135329.97190-3-marcelomanzo@gmail.com>
In-Reply-To: <20260727135329.97190-3-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Aug 2026 11:35:03 +0100
X-Gm-Features: AUfX_mxnqskE1kn5ZAj6RU9ZfIgUBgU4GL6FRAmpgjUwSeXNeLFowhXp6o0DSwY
Message-ID: <CAFEAcA-9-2N0Vqi13zhMerKcx+mZFSeCYj4mfjuyGsRz7_UwnA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] tests/functional/aarch64: add raspi4b full-RAM
 regression test
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@mailo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 27 Jul 2026 at 14:53, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> Guards against the bug fixed in the previous commit: boots raspi4b's
> default 2 GiB configuration and checks that the guest actually sees
> close to that (>1.9M kB), not the ~921 MiB the bug left it capped at.
> Deliberately checks a threshold rather than the exact byte count of
> either figure, since the precise number depends on how this specific
> pinned kernel accounts for its own early reservations; the threshold
> is comfortably between the two (943524 kB broken, 1905824 kB fixed,
> confirmed by hand against this exact kernel/initrd).
>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
> ---
>  tests/functional/aarch64/test_raspi4.py | 51 +++++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
>
> diff --git a/tests/functional/aarch64/test_raspi4.py b/tests/functional/aarch64/test_raspi4.py
> index 35ba6c24f7..55903e93d3 100755
> --- a/tests/functional/aarch64/test_raspi4.py
> +++ b/tests/functional/aarch64/test_raspi4.py
> @@ -154,6 +154,57 @@ def test_arm_raspi4_rng_thermal(self):
>          exec_command_and_wait_for_pattern(self, 'halt', 'reboot: System halted')
>
>
> +    def test_arm_raspi4_full_ram(self):
> +        kernel_path = self.archive_extract(self.ASSET_KERNEL_20190215,
> +                                           member='boot/kernel8.img')
> +        dtb_path = self.archive_extract(self.ASSET_KERNEL_20190215,
> +                                        member='boot/bcm2711-rpi-4-b.dtb')
> +        initrd_path = self.uncompress(self.ASSET_INITRD)
> +
> +        self.set_machine('raspi4b')
> +        self.vm.set_console()
> +        kernel_command_line = (self.KERNEL_COMMON_COMMAND_LINE +
> +                               'earlycon=pl011,mmio32,0xfe201000 ' +
> +                               'console=ttyAMA0,115200 ' +
> +                               'panic=-1 noreboot ' +
> +                               'dwc_otg.fiq_fsm_enable=0')
> +        self.vm.add_args('-kernel', kernel_path,
> +                         '-dtb', dtb_path,
> +                         '-initrd', initrd_path,
> +                         '-append', kernel_command_line,
> +                         '-no-reboot')
> +        self.vm.launch()
> +        self.wait_for_console_pattern('Boot successful.')

This is an identical kernel/initrd boot to the existing
test_arm_raspi4_initrd() test, right? I think it would be
preferable to add the "check the RAM figure" to the existing
test, after e.g. the checks on cpuinfo and iomem. That way we
save the time it takes to do the full kernel boot. Our
functional test suite is already quite slow because of how
many "boot a guest" tests it needs to run, so I'm keen on
keeping the runtime down where we can do that.

> +        # raspi4b's default machine RAM is 2 GiB, but raspi4_modify_dtb()
> +        # used to compare the wrong field when deciding whether to add a
> +        # second memory node above the 1 GiB peripheral hole (it checked
> +        # the boot-loader's kernel/initrd-loading RAM budget, which is
> +        # itself always capped to at most 1 GiB, rather than the board's
> +        # actual total RAM) -- so that second node was never added for any
> +        # raspi4b configuration, and the guest never saw more than ~1 GiB
> +        # regardless of the machine's nominal RAM size. With the bug,
> +        # MemTotal here is 943524 kB; fixed, it is 1905824 kB. Guard
> +        # against a regression back to the ~1 GiB figure without hardcoding
> +        # the exact byte count of either, which depends on how this
> +        # specific pinned kernel accounts for its own reservations.

I think this comment is a bit more verbose than we need -- we can
just say that we used to get the RAM size wrong and we're guarding
against a regression; anybody interested in the exact details of the
old bug can look in the git history for it.

> +        mem_total_kb = None
> +        cmd_output = exec_command_and_wait_for_pattern(
> +            self, 'cat /proc/meminfo', 'MemAvailable')
> +        for line in cmd_output.decode('ascii', errors='replace').splitlines():
> +            if line.startswith('MemTotal:'):
> +                mem_total_kb = int(line.split()[1])
> +                break
> +        self.assertIsNotNone(mem_total_kb, 'MemTotal line not found')
> +        self.assertGreater(mem_total_kb, 1900000,
> +                           'guest RAM (%d kB) is far below the ~1.9 GiB '
> +                           'expected for a 2 GiB raspi4b -- the second '
> +                           'memory node above the 1 GiB peripheral hole '
> +                           'is probably not being added' % mem_total_kb)
> +
> +        exec_command_and_wait_for_pattern(self, 'halt', 'reboot: System halted')
> +
> +
>      def test_arm_raspi4_pcie(self):
>          kernel_path = self.archive_extract(self.ASSET_KERNEL_20190215,
>                                             member='boot/kernel8.img')

thanks
-- PMM

