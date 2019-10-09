Received: by 2002:adf:e804:0:0:0:0:0 with SMTP id o4csp1283856wrm;
        Wed, 9 Oct 2019 11:43:04 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzaRuwqAVGCFD5iOQD3tIJB/yKeoByKE/U4DaP6GmHkXWW/pnTKrysiX2m9qiG2bbkU03ji
X-Received: by 2002:a37:a704:: with SMTP id q4mr4914473qke.385.1570646584531;
        Wed, 09 Oct 2019 11:43:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1570646584; cv=none;
        d=google.com; s=arc-20160816;
        b=wesOP+XVsnSkecmpC9zzQ3CMfMMPSJALove6yLnhBCoIr0hVikC6FsA4IC0iGjtXc+
         Y1NfRrBhhSeRj8BOP6NKlj9Ss8XqJShf0otgsgFtKAQrJvf5qVoggZyBh7aqsn+GEB7t
         o+icmnKfYOv4yDnTUTzrVNMlwCMGkFdPvueJv04CaNUXEoFii5YYQo3Gc1hwvo3aS07a
         CQgXN/ggulZ/l24pmdshFjCrTtRM3PMu6+/OFi4/N0089b6Kqr1nUZO7jH1ag/jlVp3L
         6pYJxOZ7LhHNty3T5tn52JWyR29hSag6sCE/jSgjNc2/y2VzmfI64Hss92doScpyNYJQ
         5fKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=P08TWrCBDxKZrMV6zgQNMe2wlSOlc9XxZTTE8PdhRGc=;
        b=02oNm3oU7giH7tOmlVZyHBAHr/bbHP/g1/t8lxHKR3jJWMvl44EfLHY1A2vhiQXFCR
         1n21LId/7TIfG+zeQp0/EC1MnAzaM/msa8R3wzloZiKpSG/sZCmSVDINqm3tI78HVW8W
         2ESEAhC0XyfS5SoT+AuDe9hzrkd1AhxlRORWlCN2m6qJN/Poke+IFNmM0Vv3424h/4U5
         mT5P6akApttEKPACU/3VooW/Hjg7zCLlPDwCXh1zhyIHbqZeyhyjVS9qbzXdeHyTZW9w
         xRTQLBmXJxWcwFnTRi9PVAqibiJzPU4tjVqGSgZp4wt9uPcS+DG9GC8GYwclccVoYYpR
         9h2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="TVSHSz/W";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h15si2809585qtk.18.2019.10.09.11.43.04
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 09 Oct 2019 11:43:04 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="TVSHSz/W";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54084 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iIGvP-0006AZ-Gh
	for alex.bennee@linaro.org; Wed, 09 Oct 2019 14:43:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:55381)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iICAV-0004tp-4d
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 09:38:21 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iICAT-0000W3-GX
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 09:38:18 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:38962)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iICAS-0000Ut-C0
 for qemu-arm@nongnu.org; Wed, 09 Oct 2019 09:38:16 -0400
Received: by mail-oi1-x243.google.com with SMTP id w144so1751955oia.6
 for <qemu-arm@nongnu.org>; Wed, 09 Oct 2019 06:38:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=P08TWrCBDxKZrMV6zgQNMe2wlSOlc9XxZTTE8PdhRGc=;
 b=TVSHSz/WazGxwIns/A5Ojm8ySjkJR8mt1AHcuqDlGqLTBMXQjRZ3+4WntOwOJ2PDt5
 zVMCHRcOhffPNMpkL6IOnaylGvnAF/S/Teq37s1LuVXVQ6zzAcOl6ZEWViCjrcIZMMfo
 bBkS6iIW8gy8zjBCLx97/HxWQSAynPueto1SDzNxvrg097yBpBo1As01qNtJH0gsc9Mh
 AHLZpjC+7WOaseJulgtYo8UEV4FXJD6qJrTPwLL43lNA2HQ9yhgd2vceLJbNSXIFl7Ac
 ynHWIlD9o4J8OEeIuVyHNyZw6oDeHNzWKEKZbDld56O582fHSJ520BjQopIDt6gIOuMZ
 U0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=P08TWrCBDxKZrMV6zgQNMe2wlSOlc9XxZTTE8PdhRGc=;
 b=ISds+hLQyl993BfA++PXBnXno4MlQ9M5VBq5Eiij/pa41lCo0+EKnQwyzOGpmTA+Q4
 tdUPb2/heqAVDkPTFf7jBX+dX5nvhiKUMHROXjxOn5ikhGCRw9p0wQUTQR8uV2kskv6/
 RLKWoTK+lKn1m/gFdd2pozcHT1NuShh4+Y7Cv8oskWPI5GFc0ekK7L3ne6LfmOFsbXYe
 mCqcAiqDtz0o3GqUtYFbB6HwEuYXagAgNjMITie1mD+fM39eF3UAb1bD5axqSSR60s5y
 lOWoB2VFDtW4jwyckUt4aguslaDBSRPoVUeCfw9Yimtbm3qQY1R/pjqy+GwxcAatXOpu
 TAjA==
X-Gm-Message-State: APjAAAVA3EN1j0+Wb03PmX2v/npKTrStyYTb5bmfhMcnVsXFM+KaeRTe
 oMIBeZL/qdxDhNaRM7n3vA7LAVOH5tNltJyjTdYYeQ==
X-Received: by 2002:aca:3b41:: with SMTP id i62mr2234816oia.48.1570628294186; 
 Wed, 09 Oct 2019 06:38:14 -0700 (PDT)
MIME-Version: 1.0
References: <20191005154748.21718-1-f4bug@amsat.org>
 <20191005154748.21718-2-f4bug@amsat.org>
 <CAFEAcA8ME5U5=rNLRSvNx7LmanqHhn_KWj6qtgym_=W1M9WDoA@mail.gmail.com>
 <20191008214907.GA28137@localhost.localdomain>
In-Reply-To: <20191008214907.GA28137@localhost.localdomain>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 9 Oct 2019 14:38:02 +0100
Message-ID: <CAFEAcA9DzeObmtsc2VJmw=1yruANZ6ajY2SG0cAPdehkeRN3wA@mail.gmail.com>
Subject: Re: [PATCH 1/5] tests/boot_linux_console: Add initrd test for the
 Exynos4210
To: Cleber Rosa <crosa@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::243
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
Cc: =?UTF-8?B?RnLDqWTDqXJpYyBCYXNzZQ==?= <contact@fredericb.info>,
 Eduardo Habkost <ehabkost@redhat.com>,
 Evgeny Voevodin <e.voevodin@samsung.com>,
 Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 Krzysztof Kozlowski <krzk@kernel.org>,
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Igor Mitsyanko <i.mitsyanko@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Dmitry Solodkiy <d.solodkiy@samsung.com>, Maksim Kozlov <m.kozlov@samsung.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 Guenter Roeck <linux@roeck-us.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: zFsnUUjM+wj+

On Tue, 8 Oct 2019 at 22:49, Cleber Rosa <crosa@redhat.com> wrote:
> On Mon, Oct 07, 2019 at 05:28:49PM +0100, Peter Maydell wrote:
> > Do our other acceptance tests download random third-party
> > (ie "not a well-known distro") binaries for the tests ?
> > It seems a bit hazardous for reproducability and trustability
> > reasons...

> A quick and dirty grep shows (excluding comments and docs):
>
>    boot_linux_console.py:        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
>    boot_linux_console.py:        deb_url = ('http://snapshot.debian.org/archive/debian/'
>    boot_linux_console.py:        deb_url = ('http://snapshot.debian.org/archive/debian/'
>    boot_linux_console.py:        deb_url = ('http://snapshot.debian.org/archive/debian/'
>    boot_linux_console.py:        initrd_url = ('https://github.com/groeck/linux-build-test/raw/'
>    boot_linux_console.py:        kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
>    boot_linux_console.py:        kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
>    boot_linux_console.py:        kernel_url = ('https://mipsdistros.mips.com/LinuxDistro/nanomips/'
>    boot_linux_console.py:        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
>    boot_linux_console.py:        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
>    boot_linux_console.py:        uboot_url = ('https://raw.githubusercontent.com/'
>    boot_linux_console.py:        spi_url = ('https://raw.githubusercontent.com/'
>    boot_linux_console.py:        kernel_url = ('https://archives.fedoraproject.org/pub/archive'
>    boot_linux_console.py:        kernel_url = ('http://archive.debian.org/debian/dists/lenny/main/'
>    boot_linux_console.py:        kernel_url = ('https://archives.fedoraproject.org/pub/archive'
>    linux_initrd.py:        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora/li'
>    linux_initrd.py:        kernel_url = ('https://archives.fedoraproject.org/pub/archive/fedora'
>    linux_ssh_mips_malta.py:        'be': {'image_url': ('https://people.debian.org/~aurel32/qemu/mips/'
>    linux_ssh_mips_malta.py:        'le': {'image_url': ('https://people.debian.org/~aurel32/qemu/mipsel/'
>    linux_ssh_mips_malta.py:        kernel_url = ('https://people.debian.org/~aurel32/qemu/mips/'
>    linux_ssh_mips_malta.py:        kernel_url = ('https://people.debian.org/~aurel32/qemu/mipsel/'
>    linux_ssh_mips_malta.py:        kernel_url = ('https://people.debian.org/~aurel32/qemu/mips/'
>    linux_ssh_mips_malta.py:        kernel_url = ('https://people.debian.org/~aurel32/qemu/mipsel/'
>    machine_m68k_nextcube.py:        rom_url = ('http://www.nextcomputers.org/NeXTfiles/Software/ROM_Files/'
>
> I find it hard to judge precisely how much of a third-party some of
> these are.  I remember Philippe mentioning that one of them, I guess
> the images used on linux_ssh_mips_malta.py, were "as official as it
> gets" (my words, from my often misleading memory).
>
> Reproducibility is definitely an issue, in the sense given that some
> of these can indeed go away, but as long as they're available the hash
> recorded in the test should guarantee that we're running the same
> images.
>
> Do you think we should do something different here?

I'm not sure, which is why I asked whether this new test
was in line with what we've done previously. Since these
are just test cases and we don't redistribute them to
other people there's less of a traceability/reproducibility
worry, and if we check hashes on download that cuts off
a lot of "fail to notice if the image changes for some
reason" possible problems.

thanks
-- PMM
