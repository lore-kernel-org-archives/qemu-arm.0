Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp1275630wrt;
        Tue, 27 Nov 2018 05:32:40 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XWHDrV14RwIGJrRLmdSSoWxg8ez38TK3LuHz/jmMvUEY3BTuH1nXfD/zRPpgKFMG9Z3xoy
X-Received: by 2002:a25:d0d4:: with SMTP id h203-v6mr32933546ybg.70.1543325560221;
        Tue, 27 Nov 2018 05:32:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543325560; cv=none;
        d=google.com; s=arc-20160816;
        b=d/Kkzg/UJemEIXXGFrIwKLlz5CNZ8JPhMq8zwHgCioxclDs2WzU5Wg725F0BTntirE
         g2A0Ixx+fhzHtW+HL6rGadh9BuO2WL1D5h1ZpD/SgAhSbdoi/k2fqkU7Jon6pglBPB+j
         1ysFkAZJJJLlHabx3yme+sDl/9yGL+7EzS5ZQy6zJCB+plQrql1EerICLz/kFEglM+J/
         ITjPklpqggYDwZnm9Esy9sXLpfG6GVEhLalYU3CUOw+eBiFYNaq7m5xpYgTol3JjQuCX
         DPegMuIJ5dxBLNSN8IPb9fzwzOwIGgQ1SruBFmxe2Y6xec9FSgTjnE67lhb2p+tx8eeq
         dO9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hj9FoyXVRpqLxxlD/o15QqARv6nbDUFFMkmPXByMqVg=;
        b=q3BnE3UbQ8LhFLF9mpL1eArFKi7seQzLWyILL0pV8ZXOkEV6Vt7LCuT+6RNJ29kYtO
         3SzSzE2ibdkwGxvm5/kAyQ2M60jrX9qvuhHJi75JirMOTuWw5HesnG6Jbql2svfEidOF
         5XtZt50D2niJ0oOfH/ensfWHI6O97Dpf3K9Ob6IF5S4BazWjqJrhWZblAHCO00onvqZE
         9/faMCUrW0AlPjN9ciP44F1F8lptqhee4PJ6/WXbYE8amfVbfbKJUBA5daQFC2FMi8N0
         E2mrbOXGd3l0B2hwWhU5lRKSfTyAEI0+LHfsMWpt26XFOCoi4Y9nFoje/GQJheCycSN4
         UDlQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CSu34T6v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 204-v6si2452916ybu.355.2018.11.27.05.32.39
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Tue, 27 Nov 2018 05:32:40 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CSu34T6v;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42369 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gRdTj-0002bn-7B
	for alex.bennee@linaro.org; Tue, 27 Nov 2018 08:32:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42719)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gRdTS-0002aN-Hr
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 08:32:23 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gRdTO-0005G4-Tf
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 08:32:20 -0500
Received: from mail-ot1-x343.google.com ([2607:f8b0:4864:20::343]:40301)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gRdTM-0005Dk-9s
	for qemu-arm@nongnu.org; Tue, 27 Nov 2018 08:32:17 -0500
Received: by mail-ot1-x343.google.com with SMTP id s5so20054552oth.7
	for <qemu-arm@nongnu.org>; Tue, 27 Nov 2018 05:32:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=Hj9FoyXVRpqLxxlD/o15QqARv6nbDUFFMkmPXByMqVg=;
	b=CSu34T6vveXACOTTFol3MVOhNl8IQYdQC5H+q7IequKUQREZ7lx/zPkTAFTE4AZt9x
	lx6XFG8Zizz3dV30BEQykyHzBdt8Un9+kNEj3kqNU9Sa9s8+l8qXfncfC+nVe+e4lk20
	A4CzN56l+8ntNy9cIn3kOqqUvFoiGZG/czV7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=Hj9FoyXVRpqLxxlD/o15QqARv6nbDUFFMkmPXByMqVg=;
	b=tZEKy71E+sdAm9qREOUBW3bT3h+7b7V41BGp9zxpOQjU6Xu1voVhEa3de4U3owHFKi
	Jz0HoGQYmQNDQCSyZerlYV8RHHtxzrpNYRQFC/NsvaWDk6ZK+lSmJwXN5MNTTTN3P8bn
	QOhVJQbZEnxgSVtVz56xoaglkmBEtwGarmYdS4VDUFAhmm6wK0TRD+Yxl3k1z81pC1yb
	pvZvfO0j4ysrDdTdPmj2klB4fv9enD5LKIEhHZiLK7uFBHNy2dEXO8NVaQe/PNApNEaK
	np0H5bjnS18MC2E7j8tNsbNyMBC0ZZIDcPR6OxjT05uQgSC74CESykr0JceBfwGhkysn
	Ny3Q==
X-Gm-Message-State: AA+aEWaPcF3famFlmh9vtD/X7uZ1Ec9neJanU7sheN6V/lsXpIVRAIrM
	ndOC79X5cpeM0GCTJ+p1hTF9YqKHjIUbupJrGQfi4w==
X-Received: by 2002:a9d:5617:: with SMTP id e23mr2470361oti.151.1543325535424; 
	Tue, 27 Nov 2018 05:32:15 -0800 (PST)
MIME-Version: 1.0
References: <20181126154616.18173-1-eric.auger@redhat.com>
In-Reply-To: <20181126154616.18173-1-eric.auger@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 27 Nov 2018 13:32:03 +0000
Message-ID: <CAFEAcA9B_jLiHLzJZrKuhT3SfXB+pzj03D=NiVNWqRc+zc=qTA@mail.gmail.com>
To: Eric Auger <eric.auger@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::343
Subject: Re: [Qemu-arm] [PATCH for-3.1] hw/arm/virt-acpi-build: Fix SMMUv3
 ACPI integration
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
Cc: Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>,
	Eric Auger <eric.auger.pro@gmail.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 95cbXjlbwDHs

On Mon, 26 Nov 2018 at 15:46, Eric Auger <eric.auger@redhat.com> wrote:
>
> The AcpiIortSmmu3 misses 2 32b fields corresponding to the
> proximity domain and the device id mapping index.
>
> Also let's report IO-coherent access is supported for
> translation table walks, descriptor fetches and queues by
> setting the COHACC override flag. Without that, we observe
> wrong command opcodes. The DT description also advertises
> the dma coherency.
>
> Fixes a703b4f6c1ee ("hw/arm/virt-acpi-build: Add smmuv3 node in IORT table")
>
> Signed-off-by: Eric Auger <eric.auger@redhat.com>
> Reported-by: Shameerali Kolothum Thodi <shameerali.kolothum.thodi@huawei.com>

Hi; it looks (from looking at the code) like this isn't a
regression from 3.0 -- is that right?

I think this fix has missed rc3 (discussion seems to be ongoing
and it needs more time on-list for review), which means it's
likely to miss the 3.1 release. So at the moment I'm expecting
it to go into 4.0. (Maybe if we need an rc4 for some other reason
we might be able to put it in.)

thanks
-- PMM
