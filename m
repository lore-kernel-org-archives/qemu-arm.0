Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp3829599lfy;
        Tue, 18 Aug 2020 06:28:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzL+oRhRxHGeNck1M2Hgn46FdTeJaJvczEMNM01K/jrmsEw/O+FC0BjIe/zKXhltBO3D1tP
X-Received: by 2002:a25:d347:: with SMTP id e68mr27653051ybf.123.1597757333654;
        Tue, 18 Aug 2020 06:28:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1597757333; cv=none;
        d=google.com; s=arc-20160816;
        b=viLC/oV++ObTVaGvAUn6DPDXFX4hqMZOUVxLw0Ww+FvYJHvY5W3oxZEbiHZeR0+KmH
         tMYva6qb0/t1LLdmKwwzehXT8HPmcOsGwSFHw7yW2XRZMNtDI1yPVt6vxFoBzFaRtuW1
         SpyMyZYvMLUZBjqHZ0YQx/ZQZqQHBHsOss4+E4u+YhH87yoQNOz99isx7FKurpWK1ODw
         hv9ts+DDSQRQ9PfoeNGH/odbwGRNo1uFdCrlRCri/fSEg72Mw2ah7Eqx5vq/+tprj2xU
         1YM3SpzmXNg9YNhs/S9orZzGRumLRYHd9IL+xBzfeVXZV3GJDKwuYdAE9kgZ8oObWLob
         riMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Aj6+N0KacoqNx2hzp4MQKE14dQcqhuZ8hti9MdI+XWk=;
        b=QMpJfH8+jRXS4m3R1eYWtf4ni1GBQ5WwlGr1zYM3C+OpR97V3cynN0S0U3ept4mXs+
         4qx3MzSu+B0A5aub/+fDhVULbRgqtJunqDZiHhkF4zLxBy36y/zqg5ewIi1OwERBmVsN
         k/4zo5BNPgw8zFtX/NhAysDn4SGi9u3CCKgHijBQTNtZs2Wbb6tTKRLBG5T6sscy5Sjy
         8YasF8GJApGSSLyOYBauQzVRspi9hxq9Jc/AfDd/KFjjYd0C1Rd0miFtvQggO1Aw3Hov
         HTJZhVBMNb7zHamYCzAmCF4NrRH+EzaIn6Gx8oKRiSiaYdbkar/K69UqPM0ycVGBVoAj
         tyTA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wtgXJ8to;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id k23si23283662ybj.389.2020.08.18.06.28.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Aug 2020 06:28:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wtgXJ8to;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57010 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k81fZ-00019y-3Q
	for alex.bennee@linaro.org; Tue, 18 Aug 2020 09:28:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:49204)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k81fS-00019f-Tv
 for qemu-arm@nongnu.org; Tue, 18 Aug 2020 09:28:46 -0400
Received: from mail-ej1-x636.google.com ([2a00:1450:4864:20::636]:38637)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1k81fR-0001uu-Ds
 for qemu-arm@nongnu.org; Tue, 18 Aug 2020 09:28:46 -0400
Received: by mail-ej1-x636.google.com with SMTP id d6so22072005ejr.5
 for <qemu-arm@nongnu.org>; Tue, 18 Aug 2020 06:28:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Aj6+N0KacoqNx2hzp4MQKE14dQcqhuZ8hti9MdI+XWk=;
 b=wtgXJ8tossrWGQzwKzGCT3pe/4q0Jc6gx8JTkmvvoAS8ygR/Z1uFtBwihy0iT1i3lK
 rR3YPKOqxaMHEK1pdok38V6blcyA73IZm4KwFuZSWWK2oKHCQ/wX7nKfME7PWp1rx7Lk
 ZqvfbqMV27lH0j+VULqMbHuIohZj/1aHnHwz+947Cv7TkXZVsPWD9gEYz8dViEZetnlG
 9R9IXlUHm55InpkDhNaIWxtAn3F+q79MV+c8fNs40B1RbpA6KW0dmAFDwItKy5xVtJnW
 vEg2SvOl8g/oHYLQKDFOznjUHTlmD9uMtaeC+esxJzfg5bzs2w2pOkWiOrif0FUIeg6I
 j1fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Aj6+N0KacoqNx2hzp4MQKE14dQcqhuZ8hti9MdI+XWk=;
 b=iYORypbRvso/lXKIBvTqMl/tQSlsO2xh89oW8VWa1aKNYz3jLsUlWzCpT1y6c/UmV8
 9jpkGCGjkFmDImJyngBXm87i0OJFWvXiW+WA57pAUhhg5Z58UcgCrIW+0M2tKf+Ijh4d
 4LUjCz0m+RqghtdbKGAOSm1RR1hcDN9S+QXTiB4BLs5PYo1SI63jB4W1UXzk2OsFpSTI
 jmMnyW86up7BBK7vD0Eg7xf08yLcVtToSEqCE7uTk4riEjI7DSTEz+ZNQQBkrNV+ptMA
 tuNheDWwarwz7ick5JSEVNXIUXBVO6sNVcrvd829wxXjbA3CN8bBk6IumDQWowbwDeu+
 rUhw==
X-Gm-Message-State: AOAM533J8yhVaiETxwoZ+f2hYFwvcAf5J4Z3XncLN1lFOmhNLyt2o1ad
 Uq3RmXPft/UTRgQrijb9cUYyvxDVeGYICMPxeBq4xw==
X-Received: by 2002:a17:906:b248:: with SMTP id
 ce8mr19496077ejb.85.1597757323445; 
 Tue, 18 Aug 2020 06:28:43 -0700 (PDT)
MIME-Version: 1.0
References: <1995755327.3077884.1597670507808.ref@mail.yahoo.com>
 <1995755327.3077884.1597670507808@mail.yahoo.com>
 <CAFEAcA8OAWdW8MS+7Fe-WUt+B7rP1AruUZWuAo9rAgP5P_0udQ@mail.gmail.com>
 <2127347711.3710404.1597756636356@mail.yahoo.com>
In-Reply-To: <2127347711.3710404.1597756636356@mail.yahoo.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 18 Aug 2020 14:28:32 +0100
Message-ID: <CAFEAcA89ydoNcWyBxRvdc648ifOD1sS6e-p0pqoiQe6w=bj=wg@mail.gmail.com>
Subject: Re: Arm Cortex M4 floating point
To: Mircea Cociuba <cociuba_mircea@yahoo.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::636;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x636.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: OOXbLbJ24jRB

On Tue, 18 Aug 2020 at 14:17, Mircea Cociuba <cociuba_mircea@yahoo.com> wrote:
>
> Hello, the netduinoplus2 is not part of the machine list in qemu "QEMU emulator version 4.2.0"
> in which one is it?
> in the 4.1.0 version release notes it says "ARM: FPU emulation support for Cortex-M CPUs, FPU fixes for Cortex-R5F"
>
> Now, is there an option to be passed to qemu to get the FPU working?

I think from 4.1.0 we mostly implemented the FPU for the benefit
of the Cortex-M33 model; we enabled it in the M4 but I don't
know if there are any board models that use it. (You can use
the M4 in the linux-user mode also).

You could either use a newer QEMU version, or see if the QEMU
you have supports a Cortex-M33 board and if that would be
suitable for your needs.

That said, I think looking at the code that the stellaris
board will put a Cortex-M4 in the emulated system if you
use -cpu cortex-m4, though if you do this you are wandering
into unsupported may-or-may-not-work territory. You don't
say what actually goes wrong. (In particular, make sure your
guest code actually enables the FPU via the relevant system
registers before trying to execute fp instructions.)

thanks
-- PMM
