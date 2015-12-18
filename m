Received: by 10.182.158.201 with SMTP id ww9csp1213416obb;
        Fri, 18 Dec 2015 09:07:25 -0800 (PST)
X-Received: by 10.140.88.51 with SMTP id s48mr6377310qgd.48.1450458445276;
        Fri, 18 Dec 2015 09:07:25 -0800 (PST)
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id c129si16931236qha.15.2015.12.18.09.07.25
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Fri, 18 Dec 2015 09:07:25 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=fail header.i=@linaro.org
Received: from localhost ([::1]:33852 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1a9yV2-0003WT-Db
	for alex.bennee@linaro.org; Fri, 18 Dec 2015 12:07:24 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:60338)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9whv-0001T3-Q3
	for qemu-devel@nongnu.org; Fri, 18 Dec 2015 10:12:36 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9whu-0005Zu-OC
	for qemu-devel@nongnu.org; Fri, 18 Dec 2015 10:12:35 -0500
Received: from mail-vk0-x232.google.com ([2607:f8b0:400c:c05::232]:34267)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1a9whu-0005Zi-K9
	for qemu-devel@nongnu.org; Fri, 18 Dec 2015 10:12:34 -0500
Received: by mail-vk0-x232.google.com with SMTP id j66so66901780vkg.1
	for <qemu-devel@nongnu.org>; Fri, 18 Dec 2015 07:12:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type;
	bh=YvFFHuxDDFJGDhxxyvYq1k6TTKGr0oAb35ohS+0coLs=;
	b=XiKxCgsvr3OpeeztUbysVgvtbx8pklJNfGhLExOIydLbBN2n6pyRHX3Kd7Y6uvF1rQ
	BDhUIaRusBViUENfYN45AqKC5oB+V/WA7UUDkNHYssp8hHZoH3Hmlbw9GV6BckK2XuVk
	TIKoJf6cnOyb7knqwqU9dtkCjOsZS4woL7pBI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type;
	bh=YvFFHuxDDFJGDhxxyvYq1k6TTKGr0oAb35ohS+0coLs=;
	b=bOhd4Q56ZqM34JTh11yArJHXh8ramY4xTTGW9inCj1EDFqbBrDyM/5AgV3qibrKCqM
	VbekRiNaZ3bMnMSJ3vTbszSA0gmGLtQzWwCed/xN1xyLjNJInzAr0YFc/WPh3yJ8aFJU
	mEEwBGGT9XzaAVgW7OWrsUxaTiFsMXmi5iXLBSLPZa6vmmgfGNxDgnkheczCikXDFLE6
	2pOtqxtoI9ZgWs8r8V+GvvhAS+v5f0Lr0rntm2zeLBCHXmkIyA4RccB/l1weFqsynroT
	bvsmj65gV2nUEv02sO21DipMkJrQ3sGhJZVHPNcwAjW5foU/y/6OBPcYmcx2+Yxf06pi
	Frsw==
X-Gm-Message-State: ALoCoQnui8Vq1ehWXuK9Oqko8/rat0D53wLqPhdpH1/s/CMgieEHcbCsVDL3DukrH3LZRI52XHzKw2L88zvk1MAK7YS+ACmm76nWxgSGT6KPsmTYtYuLjDM=
X-Received: by 10.31.0.136 with SMTP id 130mr2291728vka.139.1450451553035;
	Fri, 18 Dec 2015 07:12:33 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.153.15 with HTTP; Fri, 18 Dec 2015 07:12:13 -0800 (PST)
In-Reply-To: <1448785370-12176-1-git-send-email-zhaoshenglong@huawei.com>
References: <1448785370-12176-1-git-send-email-zhaoshenglong@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 18 Dec 2015 15:12:13 +0000
Message-ID: <CAFEAcA9wM6wNuhVZB7pD2P3+QZu3bvU+_m=eCn8ty35z0okq=Q@mail.gmail.com>
To: Shannon Zhao <zhaoshenglong@huawei.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::232
Cc: hangaohuai@huawei.com, qemu-arm <qemu-arm@nongnu.org>,
	Pavel Fedin <p.fedin@samsung.com>, QEMU Developers <qemu-devel@nongnu.org>,
	"Huangpeng \(Peter\)" <peter.huangpeng@huawei.com>
Subject: Re: [Qemu-devel] [RFC PATCH 0/2] Add GIC ITS description in ACPI
	MADT table
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
	<mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 8JDjMmeRyRXy

On 29 November 2015 at 08:22, Shannon Zhao <zhaoshenglong@huawei.com> wrote:
> From: Shannon Zhao <shannon.zhao@linaro.org>
>
> These two patches add ITS description in ACPI MADT table. It bases on
> Pavel Fedin's ITS series[1].
>
> [1]https://www.mail-archive.com/qemu-devel@nongnu.org/msg337421.html
>
> Shannon Zhao (2):
>   ACPI: Add GIC Interrupt Translation Service Structure definition
>   ARM: Virt: ACPI: Add GIC ITS description in ACPI MADT table
>
>  hw/arm/virt-acpi-build.c    | 11 +++++++++++
>  include/hw/acpi/acpi-defs.h | 13 ++++++++++++-
>  2 files changed, 23 insertions(+), 1 deletion(-)

Just a note to say these patches look fine and I'm assuming you'll
resend them when we get the ITS support in.

thanks
-- PMM
