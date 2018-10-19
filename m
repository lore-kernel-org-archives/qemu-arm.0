Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3889164wrt;
        Fri, 19 Oct 2018 07:19:01 -0700 (PDT)
X-Google-Smtp-Source: ACcGV62pPkvdRAXbeg3lKwb4qGDlY3Hv5WsFPqZOKgGpchBioa21SiaRn0UzfiZpNpQNOFDIAd1F
X-Received: by 2002:ac8:3567:: with SMTP id z36-v6mr33769607qtb.272.1539958741363;
        Fri, 19 Oct 2018 07:19:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539958741; cv=none;
        d=google.com; s=arc-20160816;
        b=WdnVV7aY81zpHiN6Up7MjlXx6zroYhatNA2JIe/H+4jxNvt41mSa8SWezMuTfa8nsH
         CESKo8ghhKr8JcAC3lFe6Tp3h+RJB2FzrUU9U7A9Zgml/qb+6e3i+XcEeIyLZARcgxUd
         oLzb2yjw24rUUy4soOmD5nnbHa6XCeKPbCbQgvRyaJJ1gKBVqRTU7vrfJ9snvGZP3Jvz
         Hf/UgJnm+L1mcLvwYyldoOKcL42wTIBjL2B72ooTH5dHVHgGUqz+vpKaaoTr7Hun5kO0
         KlF/ss3DqDqJmaRTubKKZ0pri+xG243NHLFLOo2M4CEGJbxL77i6rcu95OAEn3TzGz62
         //8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature;
        bh=7rZD9BgBOGi2Za+S7T7H8foVVTgXUKuHRF8vqm+S7Hg=;
        b=Qci/g8ccbY/f1bkIunNYNdbY6SKMnk287YOEfmwvahf9Nzn+lnXtV/f8B6qnj6tmPa
         02+YyoG1UBFvMaBe83HtMrL4G8/GWENMGqyCE0sxUygWIbX0KKtNNEQDndDP0Q+r+VAs
         3vu3kxLEjefWQrMN594SRC1YphK0a6NJknZUzZZIiOaUeos5a2d2kj9IB5lcZAUBBR2/
         dTKZSE6CuWjohj+WfwP9C19HuVTLmzx7cuNiAZUlYnM4f85W+stx9GC2WYiIkMTKQDCG
         KQJQPRe3nFCOT8+IZ+xwaWhStiOORSHOlWoKuJGzrT1402OzNFeSlkL581vkdbEbt8eA
         x4gA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SZJptn0h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j7si4252093qvm.197.2018.10.19.07.19.01
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 19 Oct 2018 07:19:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=SZJptn0h;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50877 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1gDVcC-0005HK-Pc
	for alex.bennee@linaro.org; Fri, 19 Oct 2018 10:19:00 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:52573)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDVbz-0005Fg-20
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 10:18:47 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1gDVby-00010C-5D
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 10:18:47 -0400
Received: from mail-oi1-x241.google.com ([2607:f8b0:4864:20::241]:34344)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1gDVbx-0000zN-LW
	for qemu-arm@nongnu.org; Fri, 19 Oct 2018 10:18:46 -0400
Received: by mail-oi1-x241.google.com with SMTP id v69-v6so26951121oif.1
	for <qemu-arm@nongnu.org>; Fri, 19 Oct 2018 07:18:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7rZD9BgBOGi2Za+S7T7H8foVVTgXUKuHRF8vqm+S7Hg=;
	b=SZJptn0hUa8aOougNXu0LrpzFCdpxd8EUI3FZmv/nkX+sr9eJEd9EOYxzq8llc8oKF
	SieYAuB6Xyk8Dz3PGJmUXbUokj8eIO9oeUqkZrEyt/7eyoPulwb1I1a/IC5ODMZMw+hP
	zR5BdNV1ugxJx0XcYSatKiNEvAcGguZHeMSVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7rZD9BgBOGi2Za+S7T7H8foVVTgXUKuHRF8vqm+S7Hg=;
	b=LQ6a6TFnQ4hBUbYxIKCacGbFMXUHaYPL0K8pYjx7APnr+ehfaGgmdojAEG1vfKRtbh
	F/FW4IubgEZund32h45I5H7t4OXC3KPILblMQaMHBFsahQ0SQow5NWub/eB01uRPFGsG
	zARb5gE/36wnvj5AjUHLLPp2EMRwDCsxvIY+org2/A9h0jXHhg+fF3+8W6IXKsqa1EBe
	BgDbj8l/gz+8n6BUVLUxrnghptS2c5F4iidzgm5lNj9ArzNs62dCKl4kbpYF//hitDKX
	Ut2485JhEVJ3Pzkj9syzbGwV+D835ZveFBfuleLVEmc+OVycZD/CTRz/xgIWH41bkCD3
	Pt0Q==
X-Gm-Message-State: ABuFfoj6+YQIR8Amhbq33PDlmJJKHy6KrUSGsanJbsBUri5Y4hX5B6jq
	rsRuNFPuh5vCQsf/KiWobFJ+oy4vNEDe4Fiv3R2AsA==
X-Received: by 2002:aca:b504:: with SMTP id
	e4-v6mr19229797oif.25.1539958724907; 
	Fri, 19 Oct 2018 07:18:44 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Fri, 19 Oct 2018 07:18:24
	-0700 (PDT)
In-Reply-To: <20181017213932.19973-4-edgar.iglesias@gmail.com>
References: <20181017213932.19973-1-edgar.iglesias@gmail.com>
	<20181017213932.19973-4-edgar.iglesias@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Oct 2018 15:18:24 +0100
Message-ID: <CAFEAcA9Dd3=52zReFVMgitYFeQsRA=guYsVMxy=0zHsLJ_+z_g@mail.gmail.com>
To: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4864:20::241
Subject: Re: [Qemu-arm] [PATCH v3 3/4] hw/arm: versal: Add a model of Xilinx
 Versal SoC
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
Cc: figlesia@xilinx.com, Edgar Iglesias <edgar.iglesias@xilinx.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Sai Pavan Boddu <sai.pavan.boddu@xilinx.com>,
	Francisco Iglesias <frasse.iglesias@gmail.com>,
	Alistair Francis <alistair@alistair23.me>,
	Richard Henderson <richard.henderson@linaro.org>,
	QEMU Developers <qemu-devel@nongnu.org>,
	KONRAD Frederic <frederic.konrad@adacore.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: X1Pdx71MDIau

On 17 October 2018 at 22:39, Edgar E. Iglesias <edgar.iglesias@gmail.com> wrote:
> From: "Edgar E. Iglesias" <edgar.iglesias@xilinx.com>
>
> Add a model of Xilinx Versal SoC.
>
> Signed-off-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>
> ---
>  default-configs/aarch64-softmmu.mak |   1 +
>  hw/arm/Makefile.objs                |   1 +
>  hw/arm/xlnx-versal.c                | 324 ++++++++++++++++++++++++++++
>  include/hw/arm/xlnx-versal.h        | 122 +++++++++++
>  4 files changed, 448 insertions(+)
>  create mode 100644 hw/arm/xlnx-versal.c
>  create mode 100644 include/hw/arm/xlnx-versal.h

> +    if (!kvm_irqchip_in_kernel()) {
> +        qdev_prop_set_bit(gicdev, "has-security-extensions", true);
> +    }

Do you really support KVM for this board/SoC ?

thanks
-- PMM
