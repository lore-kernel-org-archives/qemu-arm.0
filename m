Received: by 2002:a19:cb43:0:0:0:0:0 with SMTP id b64csp591667lfg;
        Thu, 20 Feb 2020 05:55:51 -0800 (PST)
X-Google-Smtp-Source: APXvYqyNEB1cvExf7r1I4nemniIfPzdtU9EvSsJPyxFcK91y62401/vId9O/qwp9vVtnQ+kukd8k
X-Received: by 2002:a0c:da08:: with SMTP id x8mr25391100qvj.166.1582206951066;
        Thu, 20 Feb 2020 05:55:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1582206951; cv=none;
        d=google.com; s=arc-20160816;
        b=cq2eZteS1N63gBnF6QxXWaql9SB5Hq2HigrhRLde9h7nRPGcddAKGfE/3hsaCDFFuV
         xP9giiBB3Is4P1f4F2VdsoM2CHnXYoAlCVfr6Nmtl/Q0wi/HwMi+GAhUu35fC5GGfEPk
         e65UtnybfChdtgYQHKJmOFTM33nl/w8ZsrMggc3zjA1iQ6wB6XW28zY6BB/sV9JmROoX
         C4NoXC8kC8+ES9k7qmgWMUsd31cfNqQjEPJ6Tmd67l0aekkP+eS0S+jutnXaFX+2/2Dt
         d5DWqjGImTYuxKwMO2wkrYSHSEH7VXbhMzw1fiCMoJtGRAGZmb/HGhHZjOhElrHbmSpt
         Ndeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+5dM/sx+zcu00CYYCxGQ5572PnoowsWQu2t+5Gckbm0=;
        b=BJCByHIcdm5jp32ODlWijqjN+42PvnksGm+knuncTYJ8VHeNiBuiCT1p1gXSXzy7L4
         YTmLG+jh1HoxfJRsoUULuO0oqvEGxE8S4a/AcymDdJ7zsttTVcw12Xce9LOgybGpk9r/
         Zek8/8aIJD3fwsXdDfF30Luhwijck9hoZMwPIkA+aUU/V4anWNxRAk3Te5DtKts1jWHX
         +LwA/rGa59ECZ5Z7TDqn2giEo6cNfbhgUl8eD1g7u7Nqru/op9ZF3eFoVVA0QHmYih4R
         3gu1qpoxZHUk7vMxRF4XYG3/zT4/FewaANpunpUhnq7AEDozCUOiq12+7sm5R/x5DUxN
         /5Gw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VcytvJHD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3si1499681qtd.25.2020.02.20.05.55.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2020 05:55:51 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VcytvJHD;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42690 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1j4mIw-0000do-Fk
	for alex.bennee@linaro.org; Thu, 20 Feb 2020 08:55:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:36072)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1j4mIo-0000aP-Pi
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 08:55:43 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1j4mIn-0000Z8-H1
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 08:55:42 -0500
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:42508)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1j4mIn-0000Wz-BO
 for qemu-arm@nongnu.org; Thu, 20 Feb 2020 08:55:41 -0500
Received: by mail-oi1-x243.google.com with SMTP id j132so27590719oih.9
 for <qemu-arm@nongnu.org>; Thu, 20 Feb 2020 05:55:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=+5dM/sx+zcu00CYYCxGQ5572PnoowsWQu2t+5Gckbm0=;
 b=VcytvJHDQgv9eQAwnJIw6T4Tr7k7a2XW7QjlwDsCr5uWlILkO7FKH+IKm+pwDMjWpn
 mptuvOaf1hqFk2oazVuJZtJ5UZG0uYO3jjEv31FqfcsNTxxd286Jyp8plG7ZiFfpNYci
 /xbpMN2BfAe3aMzswQBIl9EajrtbCYz79STo/EhXCr8DkuTZLlPsa78sVrUkJvqYKCfD
 3kP+/OIR2tI3S8q22UR+rLX2s5ttlH+ndTF0IdbX/V0EsBBhcd59F4zcVAT/l+nAzH2y
 qzE6Mnu252b63lmq6hQpW9lV0fPa4+guK9zipykEOwGo/vVCXb7ymWsexPVAjF+Wd7is
 19sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=+5dM/sx+zcu00CYYCxGQ5572PnoowsWQu2t+5Gckbm0=;
 b=LVfyJ/pxLPXDFR7HywW7+QwLh3HtFP0EBAqRsWyt7TWF+LCoUvgb64FcjWsixLj19e
 14XHuOUglgO9RFpUUANzzpDBdHFim4K9STgT1nh1zilH7SIZvFZRJjxmRVmgbZrSu/jd
 kax+vYjqPwHCtH7gZmoJeXESz8M8NIs6C2t9KzT2IO/vRWkEuEHLD5QxbLpBZfafQ9yo
 SQlkCwDVWd2ckbOlgAfrxo9OdXsMznpdZaTVRpgR3k6DkSNQOVvFOscgZOYXhdvr1oWR
 ACwWw5hvewlZLMhK0g9gzUrijR9mlM2G0L/eb2MfdDggJHFFtVt3t3pXXvU05GR09q/U
 KzHg==
X-Gm-Message-State: APjAAAVhzO1IqCxxXjBNnQrR5Z/ge21hmSYw2jv0273WrRsw7UQbhEeV
 0j6PlGV8pJvqulazt4Dn7javQcjr/Bvhc2zqcEGE1A==
X-Received: by 2002:a05:6808:289:: with SMTP id
 z9mr2018626oic.48.1582206940072; 
 Thu, 20 Feb 2020 05:55:40 -0800 (PST)
MIME-Version: 1.0
References: <CAK=yUG+jKnNYV=QiD_CHYhjKQOWky1Y2g9gGDbPnABH5hSwx-w@mail.gmail.com>
In-Reply-To: <CAK=yUG+jKnNYV=QiD_CHYhjKQOWky1Y2g9gGDbPnABH5hSwx-w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 Feb 2020 13:55:29 +0000
Message-ID: <CAFEAcA9Bf6wRz2cjBE4EFNLbDA1xKkg0qCH6C5huPSPj093O-A@mail.gmail.com>
Subject: Re: load a freebsd derived kernel on Qemu-system-arm
To: kamalp@acm.org
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: joO+qGg0/QhM

On Thu, 20 Feb 2020 at 10:52, Kamal R. Prasad <kamalpr@gmail.com> wrote:
>  when I try to load a freebsd kernel onto Qemu running on my Mac, I get this error:-
>
> # qemu-system-arm -machine versatileab -kernel ./kernel

First step with any "this doesn't work on Mac" bug is
"does this repro on a Linux host?". Very few QEMU developers
use Macs.

Secondly, what QEMU version are you using? Does this repro
on the most recent version?

> qemu-system-arm: GLib: g_mapped_file_unref: assertion 'file != NULL' failed
>
>
> Can someone tell me what I am missing? The code is built for arm but online linux, freebsd build does not generate a vmlinuz or ignited file. The target is a cortex -arm quad core board (from Broadcom).

This explanation doesn't match up with your command line.
The 'versatileab' machine is a very old development board
which uses a single-core ARM926 CPU. As a general principle,
all Arm boards are different in significant ways. It is
not possible to run a kernel image on a particular board
unless that kernel was built to specifically include
support for that board. So you need to look at what boards
QEMU has support for, and build a FreeBSD kernel for one
of those, and then use the right -machine argument to
get QEMU to use that board model. (In particular, "I
got this kernel image file from some real hardware
embedded system and want to run it on QEMU instead" is
not going to work in 99% of cases, because QEMU will not
have a model of whatever that specific embedded hardware is.)

Finally, the -kernel argument is intended to boot a Linux
kernel, and uses the documented Arm kernel booting ABI.
I don't know whether FreeBSD kernel images are intended
to boot this way; if not, then you may find they don't
boot correctly. If I were you, I would start by seeing
if there are any online tutorials on how to build and
run a FreeBSD kernel on an Arm QEMU platform.

thanks
-- PMM
