Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp1014333lfp;
        Thu, 23 Sep 2021 02:37:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzydjHZK2a+cjbGNEAWIqOTLvlbo+HdddO09XyHZYrys9XUtV7miUVco5O3y2rFEXI6mtzN
X-Received: by 2002:ac8:5b8d:: with SMTP id a13mr3671136qta.130.1632389846207;
        Thu, 23 Sep 2021 02:37:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632389846; cv=none;
        d=google.com; s=arc-20160816;
        b=FL+oaTXwrpqwJY057StYg9JhdXtXKW29pCm8UbSS2N84qG6KvaQt7cwuL9ovTrDiRM
         W8H0m3quyLLHJLSXZb+t5eL39aqQukR3PnGgncUVCfFXsYyMuQYgc8XD4cf1sf5rfrvw
         5KJSOwGzgAKCi/yz/9DpYBvqmuvqz9TDUz4vRyN7qzw4l9zXKk0kUKij2sHzL+/wRRG7
         oFnd+99eT/uw0WcPE58OrUeHRiUildESFSVs8VkPflgqTz1mrw5u6yhoHSHiQ9REnYdF
         4c81QoqcyxG1u8TtpKbl2mMYyPEwkJ5L4Yz6+sHD3e2p2UgtUtnermyujZeb/OiL0BKZ
         RasA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XhaAd6fDb+qUsl7dI6O1hxfHorBgAdpVmsnayenwmIk=;
        b=KB836e1Bz3MCnJJvHla085dga1Fnm4KH3ZjJotnMR+3KluHDUgCtuchTPvYuh+QSJi
         fACrXkFSWiiY81tlNRfMs2JTiQPYh7U16uMvaO5xPc6jW+5ugW87AKFawo651AvCMa+x
         OnOGGa61nPNughQi4FaG2EJsTuV5ELi3EyvXjWiI6qjR6HSqG58axfr6JIYHmjNMj70q
         q9LxnyZjBjWVZjh15A0nHXr28+ukxVcUKYhODnGBkkb5xMvb2EaKA4CUR08BjULV90tI
         3Re+QZEoQkT44iHewLP2qLuGvMzw2URTMbj4AP1iNXtVfu1yGkLXpwVLlQdzT8p7zTU5
         vUyg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fa/WAv1v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d19si3898635qtd.314.2021.09.23.02.37.26
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Sep 2021 02:37:26 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fa/WAv1v";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:39500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mTLAS-0001pI-1C
	for alex.bennee@linaro.org; Thu, 23 Sep 2021 05:37:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43454)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTKpu-0004WA-CW
 for qemu-arm@nongnu.org; Thu, 23 Sep 2021 05:16:11 -0400
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a]:35359)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mTKpq-000184-Ny
 for qemu-arm@nongnu.org; Thu, 23 Sep 2021 05:16:09 -0400
Received: by mail-wr1-x42a.google.com with SMTP id i23so15271260wrb.2
 for <qemu-arm@nongnu.org>; Thu, 23 Sep 2021 02:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XhaAd6fDb+qUsl7dI6O1hxfHorBgAdpVmsnayenwmIk=;
 b=fa/WAv1vM44ZDZ6LXpigLHe7LcuFTp9Oba7Xoay+UJo7tMio6mEwht7GlAv8F2zQl0
 00Sy5GYgL+2n6Nwx/xWZUVEEdzebpk4FnopXAJTpTPmLiddD9KtO95hPHf45keF6931J
 wLaw4lD2ocCjhhQJabf9GQRwUt7Ab95ctDV2/y+FvWpaLUhrb4sEtRIw25vZw3b9MqkB
 tUmY5acitOG/n0+sZZGeejiWJPeWCaKdV6a4igJgVBUMCWU3PhUhTjY9SJZ6kOlSKIR8
 qyaDXD+L33fWtF3O8D66GG7NQmnfj7khs6e+Eeb/7lAWpzTYWJOaDTuYSX/8vbAYGX7z
 eUvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XhaAd6fDb+qUsl7dI6O1hxfHorBgAdpVmsnayenwmIk=;
 b=Yre4ibbAmGkEVRzFA32ZgaCk0d4y3Bk5Url0fKMx4lbeZCI2VXDDeLjsZ11BtwX30d
 23q1OnupBuIJDypFGcdftSfIQgxbmQRWZnrDN/bY0YrBCD5+1ql9vbmAheD5NC/LZpRM
 SXXcM8rKXVPOxUtoOrxlYWFVBtCTH8TMbeFd4FF1yBlzssOwW/acJITJt8NYXmsNNEQ5
 Gy+6EJMaGww9jAyKDovrPP5qAB20xb0WjdQe9iy/RWvZd6noL8WaQbfdfAvyFglyk6CV
 COJuddmtLoVE/N3uEjlIzN8sVxS2KaSvuUs3N/tNP3vx+CIveKSU4dkVzkS6d4mhCCbp
 Rxrg==
X-Gm-Message-State: AOAM533yESRFnlzjEGxxmHpyWuPd6ONNVH+tB500cOxwZglE5B1LFW7m
 0w3U3dmvvcHs+4NoM0tqLVPXSIfrsXumH9OZbkl57g==
X-Received: by 2002:adf:ee48:: with SMTP id w8mr3755282wro.263.1632388564918; 
 Thu, 23 Sep 2021 02:16:04 -0700 (PDT)
MIME-Version: 1.0
References: <CAFLP=uCeyj+MK_a_BgC27Gr_=MC7w+-_08xJsrUC+bHvV8KWWw@mail.gmail.com>
In-Reply-To: <CAFLP=uCeyj+MK_a_BgC27Gr_=MC7w+-_08xJsrUC+bHvV8KWWw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Sep 2021 10:15:12 +0100
Message-ID: <CAFEAcA-vpTqu+dX=CFCihWVC1FQSbXvQPdyPHg3P+0Rd40wdWA@mail.gmail.com>
Subject: Re: Failed to execute "SMC" call on Guest OS.
To: Chenxu Wang <irakatz51@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::42a;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x42a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Cc: qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4x1+8BrMyR7R

On Thu, 23 Sept 2021 at 08:38, Chenxu Wang <irakatz51@gmail.com> wrote:
>
> Hi all,
>
> In the Host OS, I make a smc call and get the correct return.
> Also, the Host OS enables KVM support. (specifically, it supports VHE, so Host is running on EL2)
>
> Then I run a qemu-system-aarch64 to run a guest OS, with KVM support. Here I use a QEMU v2.9. I pre-load a helloworld module in the ramdisk.img, in the module it contains a SMC call.
>
> My booting instructions are listed below.
>
> ./qemu-system-aarch64 -nographic -kernel Image -initrd ramdisk.img -m 512 -machine virt,accel=kvm -cpu host -append "console=ttyAMA0 init=/liunxrc root=/dev/ram0 rw rootfstype=ext4"
>
> Then I execute the module, it says
>
> insmod[1086]: undefined instruction: pc=ffff0000008b5060
> Code: 95e2c44a 580002e0 95e2c448 18000360 (d4000003)

This happens because your guest is making an SMC call, which
it should not be doing. Inside the VM, your guest is running
on the "virt" board. The DTB tells the guest that it should
use the HVC call to make PSCI calls. There is nothing that tells
the guest that SMC will do anything sensible.

I don't know what your guest code expects the SMC to do, but
QEMU and KVM are unlikely to be able to provide it. (The behaviour
of KVM has changed in this area for different host kernel versions:
older kernels made the SMC UNDEF; newer ones make it set X0 to -1
and advance the PC past the SMC. TCG QEMU currently still UNDEFs.)

thanks
-- PMM
