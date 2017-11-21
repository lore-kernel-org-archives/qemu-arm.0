Received: by 10.223.159.82 with SMTP id f18csp778380wrg;
        Tue, 21 Nov 2017 06:56:52 -0800 (PST)
X-Google-Smtp-Source: AGs4zMbGEjcA0+uv744OYQvvyA3p7ETfgEvzxtOd0mJhEFYlAjLKpZ4JJqRCL7f2gTkFEX8efYsv
X-Received: by 10.13.232.148 with SMTP id r142mr11198570ywe.223.1511276212263;
        Tue, 21 Nov 2017 06:56:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1511276212; cv=none;
        d=google.com; s=arc-20160816;
        b=yfue0XGOzCoplD1FGMBp3dP7UUvmTQGKjE9jxmPrV8Ma+NYiO2zUHe4BD4D+4Ni7Tg
         Q79LpLbGofxWwCu4GXGFl7MCyB15ofEUkAMqdmY2EmHW12lfcJuKu+8BsvwnneM+DD50
         S+QF7TFsFHfamq83k6XrQgxG4DO+NXYs4gxvelO600QO/cJSfyrMVxtNp4KgoeBOCa7N
         kFLtDWyOXMjCIYfGnL5GA4TfWjUBq6VQqJadCTLIAy5vpJM+koPIw1RCHzDtWiVTRRA8
         9NoQTVY8boXcAWovvcwozlwNElUHuE5IKG7azlQfYYLRKm8OGZ5RlFprNIrOaMVnpxcw
         rGmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=amkDG8Dr+mhLqATV8qfV5+td9Yu3Y4rcTFivTHby5JI=;
        b=I8/eJO7zX3QhNrG6zPX+hG8Fd0MOorBrV4fBYtXQfPFO1CkkNSgVJvxd46Hy0sQXU+
         xgwO6XUiCN7l9BgKMyFOY334pVuhXFwBloJIiun9ou9ls4OidhuJyjCZdpR2QHu4cxY/
         Oo/aSib0i98V0H2wYQ1INQOyTexHX+xsoCORXB2ByMKhrqzkQbRRSc40CBty5jwDgyhq
         rEQrCkAhs1T0jxcOZKey8Mnc8nJgYsxk/lvKFvxc5/MrOpfn4CWKAiX+9r235GhhV4+k
         JcBBwaSX0DWstGHJxgkFLnbZ601vzqbnBRLxAK2vTXkXLYs/863uaqJXkdsTfFk7ZImG
         QAHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N0JS1k6t;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id d63si2889691ybd.689.2017.11.21.06.56.51
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 21 Nov 2017 06:56:52 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=N0JS1k6t;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34911 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1eH9yl-0007P4-C5
	for alex.bennee@linaro.org; Tue, 21 Nov 2017 09:56:51 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:59346)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eH9xX-0006pD-Ja
	for qemu-devel@nongnu.org; Tue, 21 Nov 2017 09:55:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1eH9xR-00065F-Le
	for qemu-devel@nongnu.org; Tue, 21 Nov 2017 09:55:35 -0500
Received: from mail-oi0-x22e.google.com ([2607:f8b0:4003:c06::22e]:39380)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1eH9xR-00064r-EL
	for qemu-devel@nongnu.org; Tue, 21 Nov 2017 09:55:29 -0500
Received: by mail-oi0-x22e.google.com with SMTP id r190so8690500oie.6
	for <qemu-devel@nongnu.org>; Tue, 21 Nov 2017 06:55:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=amkDG8Dr+mhLqATV8qfV5+td9Yu3Y4rcTFivTHby5JI=;
	b=N0JS1k6tqFn4oTrBZOSTuAOfkByn14G2TBnYxy8kpuXDswtAJGuJq97TpB7AkggTVa
	DSy2VJqDhK7oKzKAceLzyNO9NJ1yAecV2pjUncj62mKud5BclpfrmW3SK/+NiBtbXZgd
	5lm7bi/8sYJktln0B75KRf0wj1ExkvQHBvKhA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=amkDG8Dr+mhLqATV8qfV5+td9Yu3Y4rcTFivTHby5JI=;
	b=V5bABVqYe/CjTGtO2MlgAgDceCqGCa30WBDR/h2AYJkt5q6V3GTptF103aHB3JFp0m
	majZkRCL0ybmzVoGrbHMuXPgGQvKsdnyICJT5b3t20lVjwrBk21YwyBAEXyhyWrZE2bd
	9j98CXn+CBKWkbgzz/lhiNjTHDvrEmL1wz5ZpWd1SKxaLNbIlBRYyauucv6XxA7WvPxq
	JFbsWy71ZYftg349kpnim+3gfy30uzATZtdsjh95ls4x5Amrd9epy7dabsvAkOnOp2dt
	+aIr0w1pdr6kUQEDfxbOmLwBQjpGsFBe2A+K1+Ny9sHcA6nk0CzVtiQgJmrBQKNbz9Kb
	v8xg==
X-Gm-Message-State: AJaThX4ZIdWTCj+t7uFdDzMVZIKYoPlEVBk2u5L8/X+WrpfcDlNw1z4X
	pSRUzJxyqcXT9X0A8ENM5pM3Cs4N0/u64MYSE6SZrg==
X-Received: by 10.202.108.66 with SMTP id h63mr1366903oic.305.1511276128583;
	Tue, 21 Nov 2017 06:55:28 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.63.74 with HTTP; Tue, 21 Nov 2017 06:55:08 -0800 (PST)
In-Reply-To: <1509107055-21978-5-git-send-email-costa@advantech.ca>
References: <1509107055-21978-1-git-send-email-costa@advantech.ca>
	<1509107055-21978-5-git-send-email-costa@advantech.ca>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Nov 2017 14:55:08 +0000
Message-ID: <CAFEAcA_jzTqKFVmCu2uiSjr5UCd+53=TGmnWM9+uY=iAFC7AgA@mail.gmail.com>
To: Gabriel Costa <gabriel291075@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::22e
Subject: Re: [Qemu-devel] [PATCH v7 4/5] arm: kinetis_k64_system
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel/>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: r1vgsC/LsTsB

On 27 October 2017 at 13:24, Gabriel Costa <gabriel291075@gmail.com> wrote:
> This Patch include kinetis_k64_system.c/.h and Makefile.objs
> sim means System Integration Module (SIM)
> More information about this peripheral can be found at:
> pag 291, K64P144M120SF5RM.pdf.
>
> Signed-off-by: Gabriel Augusto Costa <gabriel291075@gmail.com>
> ---
>  hw/misc/Makefile.objs                |   3 +
>  hw/misc/kinetis_k64_system.c         | 274 +++++++++++++++++++++++++++++++++++
>  include/hw/misc/kinetis_k64_system.h |  52 +++++++
>  3 files changed, 329 insertions(+)
>  create mode 100644 hw/misc/kinetis_k64_system.c
>  create mode 100644 include/hw/misc/kinetis_k64_system.h
>
> diff --git a/hw/misc/Makefile.objs b/hw/misc/Makefile.objs
> index 19202d9..c5c8589 100644
> --- a/hw/misc/Makefile.objs
> +++ b/hw/misc/Makefile.objs
> @@ -61,3 +61,6 @@ obj-$(CONFIG_AUX) += auxbus.o
>  obj-$(CONFIG_ASPEED_SOC) += aspeed_scu.o aspeed_sdmc.o
>  obj-y += mmio_interface.o
>  obj-$(CONFIG_MSF2) += msf2-sysreg.o
> +obj-$(CONFIG_KINETIS_K64) += kinetis_k64_mcg.o
> +obj-$(CONFIG_KINETIS_K64) += kinetis_k64_pmux.o
> +obj-$(CONFIG_KINETIS_K64) += kinetis_k64_system.o
> diff --git a/hw/misc/kinetis_k64_system.c b/hw/misc/kinetis_k64_system.c
> new file mode 100644
> index 0000000..e547fe8
> --- /dev/null
> +++ b/hw/misc/kinetis_k64_system.c
> @@ -0,0 +1,274 @@
> +/*
> + * Kinetis K64 peripheral microcontroller emulation.
> + *
> + * Copyright (c) 2017 Advantech Wireless
> + * Written by Gabriel Costa <gabriel291075@gmail.com>
> + *
> + *  This program is free software; you can redistribute it and/or modify
> + *  it under the terms of the GNU General Public License version 2 or
> + *  (at your option) any later version.
> + */

Looks like the same comments apply here as for the other devices:
 * coding conventions
 * read-only registers
 * read-only bits in registers

thanks
-- PMM
