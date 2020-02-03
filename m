Received: by 2002:a05:6512:3aa:0:0:0:0 with SMTP id v10csp3988215lfp;
        Mon, 3 Feb 2020 06:04:15 -0800 (PST)
X-Google-Smtp-Source: APXvYqzWkbnoPEKnRPj2vGA/y0epvOsvc+u+FzL0eePIaYXpEIs9yv5J1k2mMfcqXTan5nbwZU3Z
X-Received: by 2002:ac8:1e8e:: with SMTP id c14mr22254825qtm.330.1580738655527;
        Mon, 03 Feb 2020 06:04:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1580738655; cv=none;
        d=google.com; s=arc-20160816;
        b=IGQXKPBNp/tyh4/CJoGPZ/OvbiTMcGAckLx7ML1jVaFM+1aPZZPIaV6czq0az1zO5N
         F07juMfdlwldZwyV+F6ddVh2GDKIkVg5+o53EWv0jp3w5sFMtVmmfk8CXBVcRUtHW//t
         HEwFVQ9zHwRoE9QhgKrcK2cAuaZGUzjriqo8rJkF02iyM8Kl/OJHbQbpYP3952x0tWi3
         YirCU6dioHPo5er4CyQLPTk5V6zhAWN+vPUWHQbV7oyIxbYghH4hFkU2+RnjonCkM7+M
         EA3LX2DKJ1ZXXVyG/HMou10ewaK3073Yf4Ibb4WVja7YFCrwMnOaMt0z/K+ICwXX/exC
         41tQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=g47PT5lt/iJyYcUt6t9a4d2giehtZw2lN1sbG54X8jE=;
        b=Ldj2VTyjgjmpzP48eSndfsMf5107YAZM7IV4uYPz/HBhH0By//8rxi9yzX8bROnDXl
         Z+sv1qtZ/V7TupOKmbTWMGpufiyZw11PNnMiJvaTHRtmNudR2jprhNa73IqsGpmqhGmT
         MT5d+Ngg6fABP4fr2TQImUB6lxmuiqSRy3LRvUHKIto4gb448YZpkP1KRubua+3i7yU2
         cX7tdIrS7eVyXxrh9s7YUAkCDjnBb+h2RSgrADiEZf1p7bl1VSkPs7FHxwxHgqqH3UZq
         eIFTStDcAGtS/f5Yzq4XP3C6vJisQaroSAyFwh/AbXCPir1A/VkxaapQkxKVoRTz5nBu
         lO+Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h4yNt754;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a188si11786276qke.248.2020.02.03.06.04.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Feb 2020 06:04:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=h4yNt754;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:41368 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iycKk-0004c2-Uz
	for alex.bennee@linaro.org; Mon, 03 Feb 2020 09:04:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:58540)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iycK4-0003t1-Bm
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 09:03:34 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iycK2-0007bo-M5
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 09:03:32 -0500
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:37935)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iycK2-0007bE-Fb
 for qemu-arm@nongnu.org; Mon, 03 Feb 2020 09:03:30 -0500
Received: by mail-ot1-x344.google.com with SMTP id z9so13696264oth.5
 for <qemu-arm@nongnu.org>; Mon, 03 Feb 2020 06:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=g47PT5lt/iJyYcUt6t9a4d2giehtZw2lN1sbG54X8jE=;
 b=h4yNt754J9oq9dRlRUyCU5FsT9uUKfxsBS0w+jAhRlB6lXhOd1eA98BTjJbustxZPb
 cjFx/lLT0kaxJyZJ4iBagN/Pr5m16qD6x/hLAiSjfZDrRLIv0ju2gZ9LmT8Fgtj4XS2D
 meDg2M1MPj4jtMaBZi1Vq6E6UAEl1hrARLjGo7YnhGe3/fWq2pscaZwLAYOc+f7QgWrb
 0Y/UXvB+nXH61znESX5XBxRKiZ7VEtBEINEUiP4oQrSWjk0ZfdmzirlXG/SGJnTXyopd
 o7ZYCjX0kRQv798DJVSgYLO8ivYHsvBfwKliAWj5L+okqBM5vK6xOl5EryemyXw+a5A4
 nncg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=g47PT5lt/iJyYcUt6t9a4d2giehtZw2lN1sbG54X8jE=;
 b=cFMnhQLjCnhZvqq5/hPNGEzMExozFGw5llO/UyicQEdOV3FKv5JTTZUTFMp+Ei3PBn
 hpTso5Js3xAPFfIWftugw/T31AWQkoi9xywy3sLqW5yjCmibzOerFzpswdFZbzSp0yAa
 nKsGeIZ+A1QiF9TsBakn0RyUelKDrCpVwDKA0W+LenNcsyPtz77n01sTj9hTv5Qh9E8O
 SKkKtRx8J1/kCOQAJbgJ9+5YEgoPxT7zlSKHQ8vlZj373a+ZJ1PBcvXjj4+iMyJLeNRm
 3IsrkBR+JUJw4GWF5OlsKjSJeabNVowYqRLXyLX/nR4DYCuY6WqDk87UVyV7OoqtSJzu
 XCgA==
X-Gm-Message-State: APjAAAX/m8oUfuGiOvPTnfimdzT1tZqnUvXGTNYD3M47x3f2maAsYDNc
 4mJxENC+6eG+GxvJEZb55Z0sxPYext8NzhOoSYEsrg==
X-Received: by 2002:a05:6830:13da:: with SMTP id
 e26mr16817164otq.97.1580738609492; 
 Mon, 03 Feb 2020 06:03:29 -0800 (PST)
MIME-Version: 1.0
References: <20200203001505.52573-1-guoheyi@huawei.com>
 <20200203014246-mutt-send-email-mst@kernel.org>
 <455d16a4-e7b6-af9b-0b7e-43be70e22f7b@huawei.com>
In-Reply-To: <455d16a4-e7b6-af9b-0b7e-43be70e22f7b@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Feb 2020 14:03:18 +0000
Message-ID: <CAFEAcA_g3XXnxiV2O37zpj7gw8For042hg0Vau44qm=ByOuXdw@mail.gmail.com>
Subject: Re: [PATCH v2 0/7] Some cleanup in arm/virt/acpi
To: Heyi Guo <guoheyi@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
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
Cc: "Michael S. Tsirkin" <mst@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>,
 Shannon Zhao <shannon.zhaosl@gmail.com>, qemu-arm <qemu-arm@nongnu.org>,
 Igor Mammedov <imammedo@redhat.com>, wanghaibin.wang@huawei.com
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: HYc2LftGnd+G

On Mon, 3 Feb 2020 at 13:33, Heyi Guo <guoheyi@huawei.com> wrote:
>
>
> =E5=9C=A8 2020/2/3 14:43, Michael S. Tsirkin =E5=86=99=E9=81=93:
> > On Mon, Feb 03, 2020 at 08:14:58AM +0800, Heyi Guo wrote:
> >> Remove conflict _ADR objects, and fix and refine PCI device definition=
 in
> >> ACPI/DSDT.
> >>
> >> Cc: Peter Maydell <peter.maydell@linaro.org>
> >> Cc: "Michael S. Tsirkin" <mst@redhat.com>
> >> Cc: Igor Mammedov <imammedo@redhat.com>
> >> Cc: Shannon Zhao <shannon.zhaosl@gmail.com>
> >> Cc: qemu-arm@nongnu.org
> >> Cc: qemu-devel@nongnu.org
> >
> > Series
> >
> > Reviewed-by: Michael S. Tsirkin <mst@redhat.com>
> >
> > merge through ARM tree pls.
>
> Thanks, Michael :)
>
>
> Hi Peter,
>
> Do I need to send v3 to update the commit message of patch 4/7 as
> Michael suggested?

This patchset seems to be corrupt somehow:

e104462:bionic:qemu$ patches apply -s
id:20200203001505.52573-1-guoheyi@huawei.com
Applying: bios-tables-test: prepare to change ARM virt ACPI DSDT
Applying: arm/virt/acpi: remove meaningless sub device "RP0" from PCI0
Applying: arm/virt/acpi: remove _ADR from devices identified by _HID
Applying: arm/acpi: fix PCI _PRT definition
Applying: arm/acpi: fix duplicated _UID of PCI interrupt link devices
Applying: arm/acpi: simplify the description of PCI _CRS
Applying: virt/acpi: update golden masters for DSDT update
error: corrupt patch at line 68
error: could not build fake ancestor
hint: Use 'git am --show-current-patch' to see the failed patch
Patch failed at 0007 virt/acpi: update golden masters for DSDT update
When you have resolved this problem, run "git am --continue".
If you prefer to skip this patch, run "git am --skip" instead.
To restore the original branch and stop patching, run "git am --abort".

Patchew didn't like it either:
https://patchew.org/QEMU/20200203001505.52573-1-guoheyi@huawei.com/

I think the problem here is the quoting of the diff in
the commit message of patch 7: git am and friends think
that is part of the actual patch body and get confused.
You might be able to avoid that by not putting the
  diff --git a/DSDT.dsl.orig b/DSDT.dsl
  index ed3e5f0fa9..10cf70c886 100644
  --- a/DSDT.dsl.orig
  +++ b/DSDT.dsl

part in the commit message, but I haven't tested that.

So resending a v4 would probably be a good idea anyway.

thanks
-- PMM
