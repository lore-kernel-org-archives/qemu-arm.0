Received: by 10.25.0.147 with SMTP id 141csp340048lfa;
        Thu, 23 Feb 2017 10:52:42 -0800 (PST)
X-Received: by 10.200.53.69 with SMTP id z5mr23656903qtb.120.1487875962403;
        Thu, 23 Feb 2017 10:52:42 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id r45si3917570qtr.201.2017.02.23.10.52.41
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Feb 2017 10:52:42 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:60314 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1cgyVL-0002nz-Oh
	for alex.bennee@linaro.org; Thu, 23 Feb 2017 13:52:39 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:46181)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgyG1-0002uF-R9
	for qemu-arm@nongnu.org; Thu, 23 Feb 2017 13:36:50 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1cgyG1-0000cS-41
	for qemu-arm@nongnu.org; Thu, 23 Feb 2017 13:36:49 -0500
Received: from mail-wm0-x22c.google.com ([2a00:1450:400c:c09::22c]:37638)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1cgyG0-0000cI-Tj
	for qemu-arm@nongnu.org; Thu, 23 Feb 2017 13:36:49 -0500
Received: by mail-wm0-x22c.google.com with SMTP id v77so7147866wmv.0
	for <qemu-arm@nongnu.org>; Thu, 23 Feb 2017 10:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Y+DxstpsVz+89YuK5DmiUM1FxZCfVBXCywGECmi58Js=;
	b=A8Ht5RNkJyeQ2tU4eDiYPCMmpbURllxq2Pm/VmjuYBKSYOKGiu5CrOZjg54TVSxHV5
	BoCfDRY0rX5PK7PJi0+TeFyVv3CM+fHmCwyV2505hYWyCMLUBslft5u1GL4IGAe1zNOM
	t2v1Z7Zef2lATuuajo8i22PCW421AH8ns9gVA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Y+DxstpsVz+89YuK5DmiUM1FxZCfVBXCywGECmi58Js=;
	b=iD48PMaeExMiOUSd53aPDSaquCrczPxMgwBs8VAawPhrHaEXl9mlfqUuEPx2mn/mXa
	PB8M/Qky+FOEJbeNyfbSGtygX7XiPSrulyq8acOYoFicF424RDufnBctfI7HBbb6ktMU
	iLr8CCLQ+fKumIHK/SmnmCjscsrDhiUrujlD6ZGL9TvVTzaOY735snL+9O5Bx7AL4ain
	6YaGqRQAjqFDfH4qaQHFIrEbH9DXUpWYhD7LOMihu5JMKOYMoSZW/3E6FzL0a4ID2xPH
	VqG7//l+KL20BmPqLBEJNC6HyflYjYBpzL4IWob4fplSqEkRlbJj2+vOhSrg2JjWn9cc
	EazQ==
X-Gm-Message-State: AMke39nKf6rTtP7DlTTKtfHi3LNdgGlAaKguZ5gqf9OEBxiGPTrpOwCjV7nuUxy3JmICbwA3f03xDoL+RHkrscW2
X-Received: by 10.28.157.67 with SMTP id g64mr6100779wme.111.1487875007907;
	Thu, 23 Feb 2017 10:36:47 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.145.69 with HTTP; Thu, 23 Feb 2017 10:36:27 -0800 (PST)
In-Reply-To: <1487850673-26455-3-git-send-email-vijay.kilari@gmail.com>
References: <1487850673-26455-1-git-send-email-vijay.kilari@gmail.com>
	<1487850673-26455-3-git-send-email-vijay.kilari@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2017 18:36:27 +0000
Message-ID: <CAFEAcA8g7S2gwnQ6YRhmq76_gqi=emYftFUoP5CmqaPzpZ4ShQ@mail.gmail.com>
To: Vijay Kilari <vijay.kilari@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2a00:1450:400c:c09::22c
Subject: Re: [Qemu-arm] [PATCH v9 2/5] hw/intc/arm_gicv3_kvm: Add
 ICC_SRE_EL1 register to vmstate
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
Cc: Marc Zyngier <marc.zyngier@arm.com>, Pavel Fedin <p.fedin@samsung.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	Vijaya Kumar K <Vijaya.Kumar@cavium.com>,
	Eric Auger <eric.auger@redhat.com>, qemu-arm <qemu-arm@nongnu.org>,
	Christoffer Dall <christoffer.dall@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tF0yX+b88xOY

On 23 February 2017 at 11:51,  <vijay.kilari@gmail.com> wrote:
> From: Vijaya Kumar K <Vijaya.Kumar@cavium.com>
>
> To Save and Restore ICC_SRE_EL1 register introduce vmstate
> subsection and load only if non-zero.
> Also initialize icc_sre_el1 with to 0x7 in pre_load
> function.
>
> Signed-off-by: Vijaya Kumar K <Vijaya.Kumar@cavium.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
