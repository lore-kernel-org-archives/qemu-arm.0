Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3819378wrt;
        Fri, 30 Nov 2018 09:19:11 -0800 (PST)
X-Google-Smtp-Source: AFSGD/UO9apnHDY+rFKEMgaxi+K/utS8+bDJfM6YI+Nm5tcXJHq4csPObznFmT5dGjgvo3+nLaD3
X-Received: by 2002:a0d:ea16:: with SMTP id t22mr6516210ywe.341.1543598351225;
        Fri, 30 Nov 2018 09:19:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543598351; cv=none;
        d=google.com; s=arc-20160816;
        b=tgUrpubgKr9YPam6yjxQ+mEo1bDj3n6RiyBi6ijZeyDN84ITuQJkBumcHapUaVh4x2
         BJlws1Ui7BaoIjeLM3f9oLogeAoFPTxLVO3qQb51hhdZ24pVwK3B4Tut5G7XSM6kXMt/
         ALc63Pf5RciTiyKU31QGJbNl0+puQuHiCtgCVNgFWl4anWLA0ZKdMeJaRxDw0j8K0ME/
         2ve+67/AhIfa8Z9HtwWsQHQsw4tTfRdaBMYsCQXUGrCYnaCUDZD0H/vRulUoYGvUZWki
         W7ulk+or10okBzaqgpYlPgtXNyhvtcl8vEr6BY2WYhQSPVSvvvIOvxNzCvUI491sHFmG
         Inow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cAG73pMgFdw8D8j6ebht5G+cqKkiKeG2gy59fepqWQ0=;
        b=y0rqlVBL7AI+cyisN5MOtZFtbymI1InlZOkb1FCvLCNAiFc/67N+CYYWV0KaLzDjmV
         LN1xPomNV0EKAmWCvrJarGAqtIuZyYwkJ1y/AmkJSueBmdIjtlWJKfPFdstxnwGd664K
         2Dxe80RkwJ0qtWjGcfHBsoBsGryaPy9Eel7LhW/1V8/NSUBif5PeG4dt5OXtUD65piAf
         4n6Zz48GryPfvklhpIsB+nqGIYCfSybetornYhlKgkBj6ZcJwgpJ0PugeRusDw1vucoG
         LEIgjjq+dQ8kx9pX9BolErvj/55aa29QjSm++Dr54qr9GV7I9vnJBVljPIn9kpFZ/DK+
         L5qA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="B9tVjs/A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id v7-v6si3318929ybo.315.2018.11.30.09.19.11
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 09:19:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b="B9tVjs/A";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33904 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSmRa-0007xQ-Kt
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 12:19:10 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:33975)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSmR2-0007iY-Rg
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 12:18:37 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSmR1-0006SN-Ov
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 12:18:36 -0500
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:38708)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gSmR1-0006Rq-JA
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 12:18:35 -0500
Received: by mail-oi1-x241.google.com with SMTP id a77so5345555oii.5
	for <qemu-arm@nongnu.org>; Fri, 30 Nov 2018 09:18:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=cAG73pMgFdw8D8j6ebht5G+cqKkiKeG2gy59fepqWQ0=;
	b=B9tVjs/AWfT73f8VgpA7STbNW09uWVBoX0QSEb3+68tsXs6dxhEJfnofSGhjiT8aD+
	8pny9NGo5b4de4ij27dQgTdCSkLbUwQC+04nCWxOw0+bhGDDL7di32CRccUabCEO21eq
	2CPdW73+kC/XE+vMAIxC68/tq03GM59g6eWz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=cAG73pMgFdw8D8j6ebht5G+cqKkiKeG2gy59fepqWQ0=;
	b=oS47H9YJbp6OT3wX5bMVknqYdYTxsnM1Oi01WE8dK5yQ0xtPF1hlaAbxjhTGDXvm2M
	TNZxKEMWhDWPpqFFrMVG9Z7u+NE1KskTGhpp9cjZbTG28Qy52l3CoQQT6A6tjrgnF1Zu
	0A8rZIUr19YMRxYLqFXdTPABX4mR3M/K22xKIXR2PVqQoU2JGlBHNqZNEdpx3ppDSSMk
	HbxnNIekgfN6I+F8hkzAfQ3CubcgDCqkZKBVGHoTyN6auJ/cJ3IRiU2pcy9/TMWFUsk8
	IrfyVmWiLmUHIaPfPetp/fmsiUp5QZSVC+xyv6RZVRq3E/mSAJRg5udlv3erxmijXIey
	KEPg==
X-Gm-Message-State: AA+aEWZyLB7Fe+0GTROdvcaYnLYcivhfdfwHXZN7eQoTDsCBmztARk4s
	YNKNWzzhcg6fvyJP49e5EBBmFFEL67KUjpCAHeH8Sw==
X-Received: by 2002:aca:1e17:: with SMTP id m23mr3976612oic.332.1543598314746; 
	Fri, 30 Nov 2018 09:18:34 -0800 (PST)
MIME-Version: 1.0
References: <fe1367d1-33f7-21fa-be84-20b9795a2157@gmail.com>
In-Reply-To: <fe1367d1-33f7-21fa-be84-20b9795a2157@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Nov 2018 17:18:23 +0000
Message-ID: <CAFEAcA_K6S2pB6cP+RHDZjeACU_ROJ6jkkG-2h7TCyiCkejRug@mail.gmail.com>
To: Nick Hudson <nicholas.a.hudson@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH v2] Support u-boot noload images for arm as
 used by, NetBSD/evbarm GENERIC kernel.
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm/>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 4zyjHbf/H6UL

On Thu, 29 Nov 2018 at 20:22, Nick Hudson <nicholas.a.hudson@gmail.com> wrote:
>
> noload kernels are loaded with the u-boot image header and as a result
> the header size needs adding to the entry point.  Fake up a hdr so the
> kernel image is loaded at the right address and the entry point is
> adjusted appropriately.
>
> The bootloader fits in the space that the uboot header would have occupied.
>
> Update the load_uimage API to allow passing of load address when an image
> doesn't specify one.
>
> Signed-off-by: Nick Hudson <skrll@netbsd.org>
> ---

> diff --git a/include/hw/loader.h b/include/hw/loader.h
> index 67a0af84ac..10ff0ff76d 100644
> --- a/include/hw/loader.h
> +++ b/include/hw/loader.h
> @@ -163,7 +163,8 @@ int load_aout(const char *filename, hwaddr addr, int max_sz,
>  /** load_uimage_as:
>   * @filename: Path of uimage file
>   * @ep: Populated with program entry point. Ignored if NULL.
> - * @loadaddr: Populated with the load address. Ignored if NULL.
> + * @loadaddr: load address if none specified in the image. Populated with the
> + *            load address. Ignored if NULL.

This API change will break some existing users. For instance
hw/microblaze/boot.c does this:
            hwaddr uentry, loadaddr;

            kernel_size = load_uimage(kernel_filename, &uentry, &loadaddr, 0,
                                      NULL, NULL);

which is a legitimate use of the current API, but your changes will
mean that load_uboot_image() will be using an uninitialized
variable. Getting every call site that cares about the returned
result from loadaddr to also provide a valid default load
address as input is going to be really painful, so I think we
need to figure out an API for this function that doesn't
make the input (default load address) argument the same
parameter as the output (where we actually loaded the image)
argument.

Off the top of my head, the first thing that comes to mind is
adding another argument to the function:
 @defaultloadaddr: Load address to use if none specified in
          the image. If NULL, no default address is available
          (and images which do not specify a load address will
          not be loadable).
but there might be a neater approach than that that I haven't
thought of.

We should also make the load_uboot_image() function print an
error message if we don't load the file because it needs a
default load address and the caller didn't pass one
("this image format cannot be loaded on this machine type",
or similar).

PS: our coding style wants {} on all if()s -- scripts/checkpatch.pl
can help catch this kind of nit.

thanks
-- PMM
