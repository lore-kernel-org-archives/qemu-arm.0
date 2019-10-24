Received: by 2002:a5d:4890:0:0:0:0:0 with SMTP id g16csp2112530wrq;
        Thu, 24 Oct 2019 02:59:15 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxw3YeFXRWJ7CVGkWafLNna+zhm93RmFCx5Wmz6aIMRVTqW4L6TkcJ8tJOI+n5o6dM4BWBE
X-Received: by 2002:ae9:ee06:: with SMTP id i6mr12456757qkg.362.1571911155502;
        Thu, 24 Oct 2019 02:59:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1571911155; cv=none;
        d=google.com; s=arc-20160816;
        b=kfi3RnI5H7OMwErLcksxcXeVmxEcMYGIQv5DY0LVfrCHUtHzji+uoAbyBtGVqnMwQ0
         yKuiSg8Lmqcc9nPEhQadL4EH9sp7r9SFQKEnjrjf57kp8tGRl5moP9z8ONnwOJfZA4HU
         Uu8N1ItbMfyCh5tvhaRbzMqO26/TxHViUM/K/mocPc2sL0DIiFwQmXUk9BnkChXCe4wO
         Xr77A/041n5HkPyDbEauwB0QvKT3lVugi/5duWNVmF3R1zM8Z71Sh0zcFwL71L1mnyfn
         BuEGYy2yCcCsrmt9wxhizLuyqvGjPf/GaNGHhQvozEFAnut9uyz3xgO2N0NuHZbU5UzT
         uUbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:user-agent:references:in-reply-to:date:to:from:subject
         :message-id:dkim-signature;
        bh=xJZGkKh8fZ9kCKCk45SiDZFkdbshXyCaxMtp65tdQig=;
        b=kr6vRLML0ePPCGX+uYnFYqDDVI96pDGw8t6tUSJDbY1cseS7YYmQm58AIrz6hw2Pe4
         FZcwYa0b6HMJjN2zm67dz5RUC2SGSutzHfoaK1urnE/31qDV/YInKT7jSAiVNp/nNFbT
         dN3rKcRuaa0RwCpYpHn6zyfGdY3h0kCLX/8ZJNZfMNsh3i80HebHly2XZPQC9wNoEvXf
         Kq3MyurFLT02fzbhJXrnI/At+khPT/a/J+Z1OIuzDpuW3RTyMHlPMU1ASQdtg8+5v34g
         fIP1fzj2NaNiUUY5RjsjiSCFnuRaGJLXak9FMSc/noYLhCbbiVhekD4v0yA1gwNUMP85
         BeHQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i8Vs+o2M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e62si5437642qtd.192.2019.10.24.02.59.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Oct 2019 02:59:15 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@gmail.com header.s=20161025 header.b=i8Vs+o2M;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Received: from localhost ([::1]:37132 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iNZti-0007wC-Gv
	for alex.bennee@linaro.org; Thu, 24 Oct 2019 05:59:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46592)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <estebanbosse@gmail.com>) id 1iNZPD-0007bs-2D
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 05:27:44 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <estebanbosse@gmail.com>) id 1iNZPC-0003q9-0Y
 for qemu-devel@nongnu.org; Thu, 24 Oct 2019 05:27:42 -0400
Received: from mail-wm1-x342.google.com ([2a00:1450:4864:20::342]:35021)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <estebanbosse@gmail.com>)
 id 1iNZPA-0003pt-W9; Thu, 24 Oct 2019 05:27:41 -0400
Received: by mail-wm1-x342.google.com with SMTP id v6so1862187wmj.0;
 Thu, 24 Oct 2019 02:27:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=message-id:subject:from:to:cc:date:in-reply-to:references
 :user-agent:mime-version:content-transfer-encoding;
 bh=xJZGkKh8fZ9kCKCk45SiDZFkdbshXyCaxMtp65tdQig=;
 b=i8Vs+o2MncpWwXW9pGHNXaGee3eJpV+p7x5qDVvjUKpn+nV3oSkkkiBU5Gd9rgv6Rl
 KAciwuw2d6oZT08ozqHF7D1ByoB2zyjA9iaeyhd8URh0OaB447MVturdrPWxXg2ySoty
 jQhh2yrA5ll2DOx/pwFCbMnXC1F4BgzbkXUqHJsD4uu8oHUNAwI/O7lOqddTBWq2uoYZ
 GSpG4BI4OPKb8YlPFM+mtRTCOsSQKLWDsBsRHZVv1cOcv1KjloUTluADeKoPeeotfcGT
 5/z2Gop1fUzyVMYPOFcgjfWHn7kw00XE98Q7gMpmAkLWY3r8Mgq200+qzjTFgSWJihXR
 Vi5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:user-agent:mime-version:content-transfer-encoding;
 bh=xJZGkKh8fZ9kCKCk45SiDZFkdbshXyCaxMtp65tdQig=;
 b=fKx5ivCbbkNdukdvxyJMFE4+PbX8rTBxkvJUXgO5IluInkEae6M2FPOb2Ff9KoxPEd
 t5QW+hkE5kXM5xjrviam7MA5l1pmralrh5rTqeT2erR1TkiAUz/j6riXFxUvBLU5yE5o
 7BwrBhmmzCaCFRHDqSMS8B7Qyq/1sR9Bjfr7D3WB+nL4uog8uL18FlPYW2vkD9+OOiyp
 RXdYNjoF6gGclhKoXg7zTHw6J3XhXtCdT4zFAEUMCXHPLMt32g1iLfAlM5SzKDEtqfVv
 yHAyZBAa13avcJwK0zpo4OoPid7H2lGG3QmfnRN5MlGqdURjhWpYKtjiNW3dCckWKIlL
 YACA==
X-Gm-Message-State: APjAAAUJTJbqJUEnhkq3dt6d1yY+xChsITWycAe7mVf/Jd/bp6a7uePj
 9Ocs27oM6SKc9HEVsnFzTcU=
X-Received: by 2002:a1c:a551:: with SMTP id o78mr3734821wme.4.1571909259765;
 Thu, 24 Oct 2019 02:27:39 -0700 (PDT)
Received: from ?IPv6:2a01:c22:b04f:9c00:d5b4:db5f:bfb4:fdb?
 ([2a01:c22:b04f:9c00:d5b4:db5f:bfb4:fdb])
 by smtp.gmail.com with ESMTPSA id l14sm9632811wrr.37.2019.10.24.02.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Oct 2019 02:27:39 -0700 (PDT)
Message-ID: <c88659d6aa590f1ea20bfd86636e14710e8813fb.camel@gmail.com>
Subject: Re: [PATCH 15/19] tests/boot_linux_console: Extract the gunzip()
 helper
From: Esteban Bosse <estebanbosse@gmail.com>
To: Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <f4bug@amsat.org>, 
 qemu-devel@nongnu.org
Date: Thu, 24 Oct 2019 11:23:29 +0200
In-Reply-To: <20190926173428.10713-16-f4bug@amsat.org>
References: <20190926173428.10713-1-f4bug@amsat.org>
 <20190926173428.10713-16-f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5-1.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2a00:1450:4864:20::342
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: Peter Maydell <peter.maydell@linaro.org>,
 =?ISO-8859-1?Q?Zolt=E1n?= Baldaszti <bztemail@gmail.com>,
 Laurent Bonnans <laurent.bonnans@here.com>,
 Alistair Francis <alistair@alistair23.me>,
 Andrew Baumann <Andrew.Baumann@microsoft.com>,
 =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@redhat.com>,
 qemu-arm@nongnu.org, Clement Deschamps <clement.deschamps@antfield.fr>,
 Cleber Rosa <crosa@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Cheng Xiang <ext-cheng.xiang@here.com>,
 Philippe =?ISO-8859-1?Q?Mathieu-Daud=E9?= <philmd@redhat.com>,
 Pekka Enberg <penberg@iki.fi>, Guenter Roeck <linux@roeck-us.net>,
 Eduardo Habkost <ehabkost@redhat.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2WeJXWvFSsEO

El jue, 26-09-2019 a las 19:34 +0200, Philippe Mathieu-Daudé escribió:
> We are going to use the same pattern. Instead of keeping
> copy/pasting this code, extract as a local function.
> 
> Signed-off-by: Philippe Mathieu-Daudé <f4bug@amsat.org>
> ---
>  tests/acceptance/boot_linux_console.py | 10 ++++++----
>  1 file changed, 6 insertions(+), 4 deletions(-)
> 
> diff --git a/tests/acceptance/boot_linux_console.py
> b/tests/acceptance/boot_linux_console.py
> index 8a9a314ab4..079590f0c8 100644
> --- a/tests/acceptance/boot_linux_console.py
> +++ b/tests/acceptance/boot_linux_console.py
> @@ -19,6 +19,11 @@ from avocado.utils import process
>  from avocado.utils import archive
>  
>  
> +def gunzip(in_pathname_gz, out_pathname):
> +    with gzip.open(in_pathname_gz, 'rb') as f_in:
> +        with open(out_pathname, 'wb') as f_out:
> +            shutil.copyfileobj(f_in, f_out)
> +
>  class BootLinuxConsole(Test):
>      """
>      Boots a Linux kernel and checks that the console is operational
> and the
> @@ -166,10 +171,7 @@ class BootLinuxConsole(Test):
>          initrd_hash = 'bf806e17009360a866bf537f6de66590de349a99'
>          initrd_path_gz = self.fetch_asset(initrd_url,
> asset_hash=initrd_hash)
>          initrd_path = self.workdir + "rootfs.cpio"
> -
> -        with gzip.open(initrd_path_gz, 'rb') as f_in:
> -            with open(initrd_path, 'wb') as f_out:
> -                shutil.copyfileobj(f_in, f_out)
> +        gunzip(initrd_path_gz, initrd_path)
>  
>          self.vm.set_machine('malta')
>          self.vm.set_console()
Reviewed-by: Esteban Bosse <estebanbosse@gmail.com>

