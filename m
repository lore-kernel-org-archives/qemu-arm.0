Received: by 2002:a5d:6782:0:0:0:0:0 with SMTP id v2-v6csp466701wru;
        Wed, 25 Jul 2018 02:01:51 -0700 (PDT)
X-Received: by 2002:a24:2105:: with SMTP id e5-v6mr5793681ita.15.1532509311881;
        Wed, 25 Jul 2018 02:01:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1532509311; cv=none;
        d=google.com; s=arc-20160816;
        b=Hz4EaaBwEWrsz4V+CLzoFJPQ3Fi6TwvwBAo8r/1ynNOs2ADp9rsUz6a+VRg7k7MNyx
         c7vVOM785Cv+8nE3khZWmHI+Q84ZBpeRDjKRsqdTdWiYeh6XWY1NTl+xj22Dk8gB/e7L
         4DfMO24/yZkkZMH0a3Z1z7mkLCLfnPT2f9KlLy2WwwsgJYUUgDz/c6L2XkOn3TwBP/t6
         8YWQSaj7e1Mx6bYE3/BMp8IBUJHAXHeQl9w6KIaIFT7+yex/c9DlhE/DSf+UVraqkYKH
         oiDNCs09nEyGW9PNw/vO8U2HWNwRpTdJO5wpPzBo1+GZ364DKccp9RChUYOPPwtFFYoD
         QMGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=0YhKMXfCleLwhl3zkr/M+R/WvteXb0quaUr+Au1z+VM=;
        b=ZObo+5+fi5A2bviVk2MChyg3e+1kc/H1fHTRLcK6dRhcNzR8TQrK83klz3EcPEmHNE
         S/W2K9TDzhXeyDehtm1+82DlnUgL54HBSTVRJeHT86VwJiXoZUP9+gKKPnaRwqAR9k+A
         bgwkk+cPbNjoOdQoHgGgQYCv1rYhSdRxQrVI90mjP8wwbOUKXA2CIihVxEOLj97p5ARm
         frlcutR7s0+V1TjG2aCWdqpsVlqpBuSuBd7zLqCe+m7g3hT86VK4IQn9KhTRps064Jfp
         u6JaWxGVFerVrJoMjglKMhocoQW0B9ETFZeeaPKNtXtICfQyT0uzKdSuYlHDIGgfXFow
         KGrA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VmzxK7Xh;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <ard.biesheuvel@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id x24-v6sor5714851jan.100.2018.07.25.02.01.51
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Wed, 25 Jul 2018 02:01:51 -0700 (PDT)
Received-SPF: pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VmzxK7Xh;
       spf=pass (google.com: domain of ard.biesheuvel@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=ard.biesheuvel@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=0YhKMXfCleLwhl3zkr/M+R/WvteXb0quaUr+Au1z+VM=;
        b=VmzxK7XhoI+DqENeJ57wrZ/95GbWa886wykItAfmBZdr93u179E4N0pzyo6133Dl8Z
         1nzlkKIjVKcHTp4k5Ba+OIut73FvA36uaB6voEFhMSIh1KlrVhi+u6X8WL3RgT0K3KQN
         rUgU/0UqUVN+eE9RML3hrYAYjp0txgxQ7ZH2k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=0YhKMXfCleLwhl3zkr/M+R/WvteXb0quaUr+Au1z+VM=;
        b=D61dczmcI8unhO2jDSC0IxvHW4Ta1erl2ot0WUrDPjDTOd8ktQge57SisvoYFufJs+
         AT5xZ/XolEYEjS8N5WVIpfu14gN3ftIRLzFhILr8SprnHN5wDLYaTxT9dUiozr+ynjrm
         iKPJ56yD2j6F6qK7moJnQ1128upKdNGp8rYv1/+WbjFnx9i9yNu3DPBmDaAvG+1oopCU
         kCqfA+h5QNrXN0b+nbgd45stovo0vsnqtpJvkY1m05o19NqqflbKiTikvrsA9QVgKJ6p
         zfHtn8OiVJODeVcDi/nnKebtbVPQyiIgwmhmvoBE+baQi17xRP2EwQ3tZVV9uwqlxMTr
         F15A==
X-Gm-Message-State: AOUpUlGUn1rqzFTqoG/Is8EDa4eSGu/kBq1ib19Pa362IPapRC0ddWn1
	0t6gOqCmEOWKwa/NTzcgDcYJiHVC77jYQBDwMkTliaiJ
X-Google-Smtp-Source: AAOMgpdhA3o5lxYmHJU6eJ6i5hgIu59Ny6zGu/mgI0Elq4vFNEt5YrgsNBOsqkB3nQ3hI4+Z0f36wsBwJgQZdueuCa8=
X-Received: by 2002:a02:35a:: with SMTP id y87-v6mr18938212jad.2.1532509310584;
 Wed, 25 Jul 2018 02:01:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a6b:ac05:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 02:01:50
 -0700 (PDT)
In-Reply-To: <20180725084824.GA12855@redhat.com>
References: <1532496652-26364-1-git-send-email-hongbo.zhang@linaro.org>
 <1532496652-26364-2-git-send-email-hongbo.zhang@linaro.org> <20180725084824.GA12855@redhat.com>
From: Ard Biesheuvel <ard.biesheuvel@linaro.org>
Date: Wed, 25 Jul 2018 11:01:50 +0200
Message-ID: <CAKv+Gu_RHsed0KAH8njKB8UPvbUDeoTZ5sP76f_br6azisZzSQ@mail.gmail.com>
Subject: Re: [Qemu-devel] [PATCH v2 2/2] hw/arm: Add Arm Enterprise machine type
To: =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>
Cc: Hongbo Zhang <hongbo.zhang@linaro.org>, Peter Maydell <peter.maydell@linaro.org>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>, 
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>, Leif Lindholm <leif.lindholm@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Czwe6I0y/Fap

On 25 July 2018 at 10:48, Daniel P. Berrang=C3=A9 <berrange@redhat.com> wro=
te:
> On Wed, Jul 25, 2018 at 01:30:52PM +0800, Hongbo Zhang wrote:
>> For the Aarch64, there is one machine 'virt', it is primarily meant to
>> run on KVM and execute virtualization workloads, but we need an
>> environment as faithful as possible to physical hardware, for supporting
>> firmware and OS development for pysical Aarch64 machines.
>>
>> This patch introduces new machine type 'Enterprise' with main features:
>
> The 'enterprise' name is really awful - this is essentially a marketing
> term completely devoid of any useful meaning.
>
> You had previously called this "sbsa" which IIUC was related to a real
> world hardware specification that it was based on. IOW, I think this old
> name was preferrable to calling it "enterprise".
>

I couldn't agree more. However, IIUC this change was made at the
request of one of the reviewers, although I wasn't part of the
discussion at that point, so I'm not sure who it was.

Hongbo, could you please share a link to that discussion?

Thanks,
Ard.

>>  - Based on 'virt' machine type.
>>  - Re-designed memory map.
>>  - EL2 and EL3 are enabled by default.
>>  - GIC version 3 by default.
>>  - AHCI controller attached to system bus, and then CDROM and hard disc
>>    can be added to it.
>>  - EHCI controller attached to system bus, with USB mouse and key board
>>    installed by default.
>>  - E1000E ethernet card on PCIE bus.
>>  - VGA display adaptor on PCIE bus.
>>  - Default CPU type cortex-a57, 4 cores, and 1G bytes memory.
>>  - No virtio functions enabled, since this is to emulate real hardware.
>>  - No paravirtualized fw_cfg device either.
>>
>> Arm Trusted Firmware and UEFI porting to this are done accordingly.
>>
>> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
>> ---
>> Changes since v1:
>>  - rebase on v3.0.0-rc0
>>  - introduce another auxillary patch as 1/2, so this is 2/2
>>  - rename 'sbsa' to 'enterprise'
>>  - remove paravirualized fw_cfg
>>  - set gic_vertion to 3 instead of 2
>>  - edit commit message to describe purpose of this platform
>>
>>  hw/arm/virt-acpi-build.c |  59 +++++++++++++-
>>  hw/arm/virt.c            | 199 ++++++++++++++++++++++++++++++++++++++++=
++++++-
>>  include/hw/arm/virt.h    |   3 +
>>  3 files changed, 255 insertions(+), 6 deletions(-)
>
> Regards,
> Daniel
> --
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
