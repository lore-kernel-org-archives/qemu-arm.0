Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp4784521wrh;
        Tue, 30 Apr 2019 07:19:20 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyxV17d9G85KNMLwvsnmumTqZbxIZCPp88z+rXnRCTAyhvF9H9QjGG2Yw5+cNNgH0eIGnE8
X-Received: by 2002:a5d:434c:: with SMTP id u12mr47380311wrr.92.1556633960234;
        Tue, 30 Apr 2019 07:19:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1556633960; cv=none;
        d=google.com; s=arc-20160816;
        b=YX/RkHNvBE8v4sV89sp7ZfaSjJto5buyX5cLeOLSnLThC+XyaiojQcTHh3PgEquGgp
         3v/Ex1A0pI5npQlJ5FD1i24/aQ4gqsd9F7nb7k4SjxWhCBVHb39rCrjBYZIjdRO0ypAK
         pXZ0Px5JrpIZ3dLWUSUJ2h8pkdiY4J5pkgq/1+5dd3oMJjkxp9buM+f+PllcDu1A0M5w
         YgF+CuTsYuFlpbZiCWqRB80HKPfacXmPLH46Z+WI64ieHMGFhEqRlgWP8e+9Q5UTAZ4z
         uJl8RS7gO8yd7qasrEFXcIMBKPbactlLd/gS2UO++imAkjO8x3YE1D2vUBfO3rrarabg
         uzxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2XXSvQZMIShsrk3buOnTvMFReUAA0AgZ68Yrj0DtJKA=;
        b=lc4FpzfbhNEtJLAWtd/P0j5IeoGEY/1CVSi6z/Eml/3Db6C1xB7NOoCFqWaI+mrPXw
         QTG1L3ln1efRHLxWzSnQEHZOC58Hb2RMW7W71v46zTpslDs2IKPsdBW886+O0yPdzjdh
         ADgsn6ooOS2bN5H5Ix4m/WDbMV9WuWHsl7ZNu3SmkTVDGy5S4aJhBelDzxHMnrGY8o47
         0SHt8VDre5v6NsfCD/PVhdc5TozFBx3f6sOUutFEj7LBO5b0lKRAx5TevlYtuQNh4ZVR
         J51IXDMWuLitpch5VIsMs9kdGmuGubrZHggY00eCKXIbtDt4wjvmUXAxRNgOvlrJ22XA
         Gfnw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nBnh+OLR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id z9si1662264wmi.28.2019.04.30.07.19.20
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 30 Apr 2019 07:19:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nBnh+OLR;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([127.0.0.1]:47802 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1hLTbL-0002AD-9d
	for alex.bennee@linaro.org; Tue, 30 Apr 2019 10:19:19 -0400
Received: from eggs.gnu.org ([209.51.188.92]:56633)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLTb8-00029t-8z
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 10:19:07 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1hLTb7-0008DB-CV
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 10:19:06 -0400
Received: from mail-oi1-x243.google.com ([2607:f8b0:4864:20::243]:33269)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1hLTb7-0008Cm-8W
	for qemu-arm@nongnu.org; Tue, 30 Apr 2019 10:19:05 -0400
Received: by mail-oi1-x243.google.com with SMTP id l1so9511982oib.0
	for <qemu-arm@nongnu.org>; Tue, 30 Apr 2019 07:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=2XXSvQZMIShsrk3buOnTvMFReUAA0AgZ68Yrj0DtJKA=;
	b=nBnh+OLRDvHXBsU+0h6Qn9dz+WyJxCa363Fi3EQqRBb54Bg/Z+pzigkv5DvAA4sdVs
	RmTo9mXrjCZnXijAn48w1xbzuHEg/CM9vmENCsMht2iQT3G7Du8XcpLsWCGdXWbpMsWW
	RyNYxRe/I8/DDG+jbuh/4lIySniZvVKvhZi5rM59/J/ZeSS8pKv9qLyuiGxla2wwyYNH
	NmNBlW5josmLcZSqCXRx2vDyqR7B6zbHuyBIDVaoBohJRdUkACf6Q1eeOO49VU3AmwB8
	LgellP5roK09D6rcORmwlZjzLkP0oUHs9i4fLEQwfnrdmwsqYtPJWijXmaoqQ5K4NiZV
	8VSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=2XXSvQZMIShsrk3buOnTvMFReUAA0AgZ68Yrj0DtJKA=;
	b=jxmZZK7b/wwwIFqdU/iLW0QXpDTE4C7ufZt2HLehmyCNctpA+D9m4wu6pzli1q5WcJ
	3TzJSRBTS9FcJgKmej2T4yXsq4BPoYeX8HTVUacnwl/cNN5lM3UIMiIa3431vnM9RfPM
	g6eAdXHOsVRDhjl9AgChLTT9lH5N0HwnUAIJcP9RMBwyaSYDa2ReNu8V5QbCZ9buspI2
	2+PFCBXtYGWoxsRcEBdxC96XwKdgEkT0wDMck++RsPbYU/BwX+DUd7HkqKKtiCbmim5v
	Hfvht0rKg8NTJ4WT7OhxBeNLNyBYNW+eUk49JRvZQ0R9LUoDseGY/31WpXSF4gqOEs2h
	idpw==
X-Gm-Message-State: APjAAAXTX9rmvL2iADv9gSXmpT1AeLb5cZK7USW9HT6kr8VI52wsSQoL
	aO/6l3Fm8BiLcg0/ww8H1L6Frz6pPsx+0ME8Od/2JQ==
X-Received: by 2002:aca:b3c2:: with SMTP id c185mr3349730oif.98.1556633944204; 
	Tue, 30 Apr 2019 07:19:04 -0700 (PDT)
MIME-Version: 1.0
References: <1555560291-3415-1-git-send-email-hongbo.zhang@linaro.org>
In-Reply-To: <1555560291-3415-1-git-send-email-hongbo.zhang@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Apr 2019 15:18:53 +0100
Message-ID: <CAFEAcA_AZgLmYRkfKzgWpptkUdz-Qpa=Zwk7x0kONxQ64-WMSA@mail.gmail.com>
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::243
Subject: Re: [Qemu-arm] [PATCH v7 0/2] Add Arm SBSA Reference Machine
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
Cc: qemu-arm <qemu-arm@nongnu.org>,
	Radoslaw Biernacki <radoslaw.biernacki@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Leif Lindholm <leif.lindholm@linaro.org>,
	Ard Biesheuvel <ard.biesheuvel@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 7msN8zOYAEGx

On Thu, 18 Apr 2019 at 05:05, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
>
> For the Aarch64, there is one machine 'virt', it is primarily meant to
> run on KVM and execute virtualization workloads, but we need an
> environment as faithful as possible to physical hardware,  to support
> firmware and OS development for pysical Aarch64 machines.
>
> This machine comes with:
>  - Re-designed memory map.
>  - CPU cortex-a57.
>  - EL2 and EL3 enabled.
>  - GIC version 3.
>  - System bus AHCI controller.
>  - System bus XHCI controller.
>  - CDROM and hard disc on AHCI bus.
>  - E1000E ethernet card on PCIE bus.
>  - VGA display adaptor on PCIE bus.
>  - Only minimal device tree nodes.
> And without:
>  - virtio deivces.
>  - fw_cfg device.
>  - ACPI tables.

I've had a look through these patches -- my comments are all
pretty minor. There are a few places where I don't really know
the right answer and have asked other people to weigh in on
whether changes (proposed or recent) for the virt board should
be applied here too.

thanks
-- PMM
