Received: by 2002:a5d:4308:0:0:0:0:0 with SMTP id h8-v6csp3804601wrq;
        Tue, 10 Jul 2018 10:12:57 -0700 (PDT)
X-Google-Smtp-Source: AAOMgpe9WT8blZKn2PRkZU2pqn2N9Wd8kYXUzTz6GQ0zYU+cLrYh4O6p8XlCDPv2cYC3YYDOFwjY
X-Received: by 2002:a37:de04:: with SMTP id h4-v6mr23096533qkj.442.1531242777419;
        Tue, 10 Jul 2018 10:12:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1531242777; cv=none;
        d=google.com; s=arc-20160816;
        b=RhYtYPTvJFX8IW1f4eKW0nxrl6XDkg6WK32460XgiruxmHWqyOGJfdfZIy6ZfhIBwh
         Y/c/nrWEa7QYb/KybDqVc6YXOzP20bXgFHufoWsOmncovUG2FI7kgRI319dL2n6zLpbC
         jonzW01hyDTiaAtSl/Cq5glTud8A1GU7ROTaeu3M0O64pYjgH/EKixVVCAaBwpMsvumX
         VLtvI1oJS6r311KfOIyxY3YDD+qfP8eoZkvt3bEa7HqcGE7XmKUCTPArwukoCpTYEM17
         oQewmkuG513Z6PmRuT5PuC2oEGSnccXt6E0bW+n3DS1sH5Wq0FDQrTWfsS7HfFY/aASn
         YzdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=7Re2kr+G7087YZSbpW7aoXNQPtN8Ku7Rdf+3SF6gjAA=;
        b=i7Dyl/xZU22Ar7YpDYqXEoiYDx3qkXFlrCg7pTLqTBb/a0jQXfFkg95zQfKi4xoyKL
         sEQgrg+yNIgXj/EGLubC9jsbqbeXfv9WlpRz6SywdtAdgp6TB/MBT+5xGoJjQA/s/Y4m
         rveCPbXMCP9+51CxL2HYuUsXE/MAq9kcrNaF2BnS36FSPC0pAE0a4n2Ci2dCAsTm0RGY
         LnUNzCXzuhVvJO29V87gr0T4mdtlLGPCbeSJnaKCeuwj/gEn32ld3roZNCHAXfsYZLzG
         0mEF9lV5qLTj8ZSfC0dUKv20RGNjuqjSWU21Ey+rKq8mAeKLVyxA/vXcW53LM+txLBnk
         zftw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cyqyHVkd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id u5-v6si1817031qvi.177.2018.07.10.10.12.57
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 10 Jul 2018 10:12:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=cyqyHVkd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49030 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1fcwC8-0007S8-QW
	for alex.bennee@linaro.org; Tue, 10 Jul 2018 13:12:56 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:41525)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fcwBj-0007Pi-HK
	for qemu-devel@nongnu.org; Tue, 10 Jul 2018 13:12:32 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1fcwBi-0002C7-HI
	for qemu-devel@nongnu.org; Tue, 10 Jul 2018 13:12:31 -0400
Received: from mail-oi0-x243.google.com ([2607:f8b0:4003:c06::243]:42512)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1fcwBi-0002Be-CW
	for qemu-devel@nongnu.org; Tue, 10 Jul 2018 13:12:30 -0400
Received: by mail-oi0-x243.google.com with SMTP id n84-v6so44036300oib.9
	for <qemu-devel@nongnu.org>; Tue, 10 Jul 2018 10:12:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7Re2kr+G7087YZSbpW7aoXNQPtN8Ku7Rdf+3SF6gjAA=;
	b=cyqyHVkdzmnLDYsgc9jrdOwkTgfs++IIf1QV9ToNJa4VeXbN+9GFdAxVvacJN2NiFD
	88nqGn55ZXaT/M4eYRLc8qpPSbdojNUjHYJ/oZgLX/OXTwM3WL7gINvDO4SO4WEjzLDh
	VAOTlIORPyhTlSlp8bJleYie9H9J06eIiaFYA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7Re2kr+G7087YZSbpW7aoXNQPtN8Ku7Rdf+3SF6gjAA=;
	b=F2Rtaw7XmIYJexeUobDyWTIZCOBgPh87r0reCi1KReTGTXs6mUYl47RHLfT2dPaQcW
	4bA0/hxcl5YW0MDb0j0PEBBfKYmJfnW95yt1vIQ42m3a5V+wQ2HwbSynbZOPP/r5eb4g
	hwVw7sdZ1xbOgVHFCsquVsTG9/syKpK8vjHhGI8b2DUQS2cA3JuriiCHirMwY8g6wIlU
	zYvEdVTrhF6aobzdUZb6DwJN44NoHkPt77r1HHv1y5ZHM04REfIO4HRKJt2kyR/bgm7n
	hOJDMzDHdkAoNp0lH4bBwW28HUSxcaud1BSmjFeJgM2ZFj77ZVn04JUDqLvblobkkpE+
	fcjw==
X-Gm-Message-State: APt69E0SgIE2S/lLA2zolittr3EBqcSVF5Vqi4wyB4H8dkgnODCrKsg+
	UdwqpLNsDEgM+Z6bjXIMNjyxG9NZpvmWzWvvmAHcRg==
X-Received: by 2002:aca:4c14:: with SMTP id
	z20-v6mr26453582oia.164.1531242749800; 
	Tue, 10 Jul 2018 10:12:29 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:5c8a:0:0:0:0:0 with HTTP; Tue, 10 Jul 2018 10:12:09
	-0700 (PDT)
In-Reply-To: <20180629132954.24269-6-luc.michel@greensocs.com>
References: <20180629132954.24269-1-luc.michel@greensocs.com>
	<20180629132954.24269-6-luc.michel@greensocs.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 10 Jul 2018 18:12:09 +0100
Message-ID: <CAFEAcA8xpsuCP7eM=tCxzH5kf6xw2GrPWaEVw6hdhUwMzhSHXw@mail.gmail.com>
To: Luc Michel <luc.michel@greensocs.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c06::243
Subject: Re: [Qemu-devel] [PATCH v3 05/20] intc/arm_gic: Add the
 virtualization extensions to the GIC state
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
Cc: Mark Burton <mark.burton@greensocs.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Sai Pavan Boddu <saipava@xilinx.com>, Edgar Iglesias <edgari@xilinx.com>,
	qemu-arm <qemu-arm@nongnu.org>, Jan Kiszka <jan.kiszka@web.de>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: c4V9ipUvf90R

On 29 June 2018 at 14:29, Luc Michel <luc.michel@greensocs.com> wrote:
> Add the necessary parts of the virtualization extensions state to the
> GIC state. We choose to increase the size of the CPU interfaces state to
> add space for the vCPU interfaces (the GIC_NCPU_VCPU macro). This way,
> we'll be able to reuse most of the CPU interface code for the vCPUs.
>
> The only exception is the APR value, which is stored in h_apr in the
> virtual interface state for vCPUs. This is due to some complications
> with the GIC VMState, for which we don't want to break backward
> compatibility. APRs being stored in 2D arrays, increasing the second
> dimension would lead to some ugly VMState description. To avoid
> that, we keep it in h_apr for vCPUs.
>
> The vCPUs are numbered from GIC_NCPU to (GIC_NCPU * 2) - 1. The
> `gic_is_vcpu` function help to determine if a given CPU id correspond to
> a physical CPU or a virtual one.
>
> For the in-kernel KVM VGIC, since the exposed VGIC does not implement
> the virtualization extensions, we report an error if the corresponding
> property is set to true.
>
> Signed-off-by: Luc Michel <luc.michel@greensocs.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
