Received: by 2002:a5d:6089:0:0:0:0:0 with SMTP id w9csp3730752wrt;
        Fri, 30 Nov 2018 07:54:25 -0800 (PST)
X-Google-Smtp-Source: AFSGD/XCRAb1AdM8P9SfFe2TRjFSKodFRPazurUZjmQDnO/ViWwXLNjb25WccY4F80t5omR4PPQO
X-Received: by 2002:a25:a08a:: with SMTP id y10-v6mr5857409ybh.378.1543593265110;
        Fri, 30 Nov 2018 07:54:25 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1543593265; cv=none;
        d=google.com; s=arc-20160816;
        b=eUbfRP5dwmqdndNM1Mls+NaNZOSAv+tulzopbYHIlPMAAX9FVNwloSRPKU+Fblnz+J
         ezSKqxBBLhRy5LoIjjsi3Ken//hsdYNRDIsRoFaqOKoXQ5rSvfNU/aRVlXuBxRXLZiDB
         WimJ86E3WAFDHhC++UoALAjiDRfp6jdhtGDz+u4hlYVuH4HXf7nYs7bAWYFykh5qBUVe
         nOq7JLAsrYgxhpDRK/3Xq/MD4569Y3SWIMl3YOd423AmmzLMPRnqXpi83YBLTxkeaBDf
         TMfhEaFt1vW2Ea3qCVJD5jvSfxp+rpsrbGiur+cG91Y+TIVEWpiK/+UV+hfEGc9Mr2Xs
         5lfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g3VqBBLZrcIQDC9GG5PTQlbzzoYz66oFznqVQbnb0uo=;
        b=Jm2qrwRiwrj4opa0A046fedzYtDLkygHqe80mKggNQLj+5iamzr4sQAY/6FU9nXXaL
         YXnZGkFyzeOFfWuVrsJwcDpfr9+1/1VuH8jXEMzlPw/Q2iqRmRgeV0wVqUxD9OnBf1vZ
         +M2wVXY7Sr+Jm4UsqabcrkDyaOOkf73f/rOoJlI30vgUgdPRW0e2hRa/UIbHh+wVcRTX
         g7FEf+BV27UNTZAKDtISenT0i2BhP70nArD+rW2RILb1XgI0vUX4odIGUgzPkwq/X7Ob
         xmuuogInTDfAkIZb2gCEjYCRqFD+IgbiZtNclCcc3T7P/mwTqIA/CE5LT4xqaovF+oq/
         NGKQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AcHZ66Ma;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id b6-v6si3086400ybh.426.2018.11.30.07.54.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 30 Nov 2018 07:54:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=AcHZ66Ma;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33487 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gSl7Y-0008Gt-Fz
	for alex.bennee@linaro.org; Fri, 30 Nov 2018 10:54:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:37018)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSl7M-0008EW-5x
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 10:54:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gSl7L-0007BU-Ad
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 10:54:12 -0500
Received: from mail-oi1-x244.google.com ([2607:f8b0:4864:20::244]:45646)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gSl7L-0007B5-3q
	for qemu-arm@nongnu.org; Fri, 30 Nov 2018 10:54:11 -0500
Received: by mail-oi1-x244.google.com with SMTP id b141so5074076oii.12
	for <qemu-arm@nongnu.org>; Fri, 30 Nov 2018 07:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=g3VqBBLZrcIQDC9GG5PTQlbzzoYz66oFznqVQbnb0uo=;
	b=AcHZ66MaUnln9Ea1ISZKMaCbibhBuwxbs80B65KoLt9zbwGFKYLnck0Iqlrc/vWSZb
	PwOfIBQVlvY759x1C+nuV2SEGDxmfFwuI9Yzxfsrt1tw9sZ/tJ5RUQk8b0l3SKL43oCX
	pCUbmHj6IzDXfg5yCiLPWphvJosP0Sx6Anflk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=g3VqBBLZrcIQDC9GG5PTQlbzzoYz66oFznqVQbnb0uo=;
	b=P/KKs8zGz7mdhuhk07nonEHIU567cjo+DzyvZiaMrgKXGYLgEDsZGMjlzzI4g99Iji
	2dkJ5IxIzyBv8MFnWmgXfTjj3nH+m2xZV/UumKFEDJsINoqZMSPEwZorXHMJhiaKq2X1
	AClzp8NRSp5PQJTl7UcQFGHPhpjRqf6qI7Tp7UzrQ01zPaBVVZDSNkRrl8C/u1kDgkfS
	r+7pxDq1aj21pKioxZYAQqoJoqr08qIrbvNzQU2fZXGFZCFPEmLJrn1wrVZkN0l1ctZC
	rLtCT/JC6hPRcirHGiwbKo68+llZpzIIbfifeUgpN19t72P7oTiuFEvAIroovSfPjC5r
	iWUg==
X-Gm-Message-State: AA+aEWb8vD969cWv03wUqhpfd8huLkOFCNNpeoxp9TePlVavN0fUnK8o
	oF8694ZInJZIkGUmLqN/xJjV/hCXXsuzSet4PsZEIw==
X-Received: by 2002:aca:2dc9:: with SMTP id t192mr3807149oit.325.1543593250404;
	Fri, 30 Nov 2018 07:54:10 -0800 (PST)
MIME-Version: 1.0
References: <1543407172-16175-1-git-send-email-peng.hao2@zte.com.cn>
	<1543407172-16175-9-git-send-email-peng.hao2@zte.com.cn>
In-Reply-To: <1543407172-16175-9-git-send-email-peng.hao2@zte.com.cn>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Nov 2018 15:53:59 +0000
Message-ID: <CAFEAcA91j803VhAKrey3pvHC+L139EGVvkN1rULbUD-JAFWBdA@mail.gmail.com>
To: Peng Hao <peng.hao2@zte.com.cn>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::244
Subject: Re: [Qemu-arm] [PATCH V10 8/9] hw/misc/pvpanic: realize the
 configure interface
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
Cc: Andrew Jones <drjones@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
	QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: ieWXQEEKWMms

On Wed, 28 Nov 2018 at 03:50, Peng Hao <peng.hao2@zte.com.cn> wrote:
>
> Add configure interface for pvpanic-mmio. In qemu command line
> use -device pvpanic-mmio to enable the device.
>
> Signed-off-by: Peng Hao <peng.hao2@zte.com.cn>
> ---
>  hw/arm/virt-acpi-build.c | 5 ++++-
>  hw/arm/virt.c            | 7 +++----
>  hw/misc/pvpanic.c        | 1 +
>  3 files changed, 8 insertions(+), 5 deletions(-)


> @@ -1330,6 +1328,9 @@ void virt_machine_done(Notifier *notifier, void *data)
>      struct arm_boot_info *info = &vms->bootinfo;
>      AddressSpace *as = arm_boot_address_space(cpu, info);
>
> +    if (pvpanic_mmio()) {
> +        create_pvpanic_device(vms);
> +    }
>      /*
>       * If the user provided a dtb, we assume the dynamic sysbus nodes
>       * already are integrated there. This corresponds to a use case where
> @@ -1551,8 +1552,6 @@ static void machvirt_init(MachineState *machine)
>
>      create_flash(vms, sysmem, secure_sysmem ? secure_sysmem : sysmem);
>
> -    create_pvpanic_device(vms);
> -

Please don't make changes in on patch of a patchset
and then undo them in a later patch. It makes the
patchset harder to read and review.

thanks
-- PMM
