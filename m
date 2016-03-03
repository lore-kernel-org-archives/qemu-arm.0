Received: by 10.25.208.211 with SMTP id h202csp2796444lfg;
        Thu, 3 Mar 2016 08:55:04 -0800 (PST)
X-Received: by 10.140.233.85 with SMTP id e82mr4440928qhc.86.1457024104141;
        Thu, 03 Mar 2016 08:55:04 -0800 (PST)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id 141si1491446qhq.25.2016.03.03.08.55.03
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 03 Mar 2016 08:55:04 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dkim=pass header.i=@linaro.org
Received: from localhost ([::1]:36250 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1abWWl-0000Aj-PT
	for alex.bennee@linaro.org; Thu, 03 Mar 2016 11:55:03 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:49730)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abWWj-0000AD-29
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 11:55:01 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abWWi-000723-26
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 11:55:00 -0500
Received: from mail-vk0-x22f.google.com ([2607:f8b0:400c:c05::22f]:34329)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1abWWg-00070h-Pv
	for qemu-arm@nongnu.org; Thu, 03 Mar 2016 11:54:59 -0500
Received: by mail-vk0-x22f.google.com with SMTP id e185so27599060vkb.1
	for <qemu-arm@nongnu.org>; Thu, 03 Mar 2016 08:54:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Qx0G4SJRs6laGrCbjY7GAeycL+1+6wZNqlGkNVJ9Lj4=;
	b=QRD03Rc7457hIUzqWqcpVz48wxhJJ+Bf+SJEl7y1qE2E1Pprua6gLGZlIwZBoxDRWl
	Hnp86AV0gXmCNjIGc8WTB3JDMO71xgDVhAlR2Td9h+Ew278Ks2Aw+ToKrx2dDEV+Bt2U
	CGIpa4ciUupeLdKHLi/pIiTBNG7UE+zgOaxEA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Qx0G4SJRs6laGrCbjY7GAeycL+1+6wZNqlGkNVJ9Lj4=;
	b=IQoE2JItHK0+rL0zunhrddM9tQeurlY9siurOvSTAKdc/kbn1MhDTeFKlRJt9yMayG
	Nf78rQBKIixemQ2agaTxov1TiSHlciztITPwW99LRl5IGqTVwmd3xx8XwvV5e6a8s8gb
	BJhHbydr9LkwV+UIWOZhcYzu234lO3h0hgzYPvnoCz0OgLLe1DRbQ0uuCtYXzg2zGtdQ
	Sy3F1gpXBC84c34twlgva78He8jpOuikqkig02j0sb49cJtF1LYU+tI4n0NgHTT8YLQ3
	fqrLJfNebnj9EDBFGe1IyT63jNJDF3JBuzspHy4XC0plD99J9VUYFmpsWrb+vpKP0qRY
	B5zQ==
X-Gm-Message-State: AD7BkJLI9uNKD1tzHyIjsXHKE6C51x5XLe7dJBTGk29LrBPXrCoK/HIKC3ZadKtA58XNFGPtXlnFXNWAu3jnPExX
X-Received: by 10.31.52.147 with SMTP id b141mr2763767vka.82.1457024098246;
	Thu, 03 Mar 2016 08:54:58 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.56.216 with HTTP; Thu, 3 Mar 2016 08:54:38 -0800 (PST)
In-Reply-To: <56D8683D.1080004@gmail.com>
References: <1456941872-8791-1-git-send-email-afarallax@yandex.ru>
	<56D73CB6.7040702@gmail.com>
	<CAFEAcA9gPrmcn3TNUueei1f5V0QMr-Nox9JHEE23EsQxbEO9qQ@mail.gmail.com>
	<56D84EB5.30808@gmail.com>
	<CAFEAcA9Sp5282BfXFK8W9x8N0HJCbmxZBNL7Cxof7cYRsp8FgA@mail.gmail.com>
	<56D8683D.1080004@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Mar 2016 16:54:38 +0000
Message-ID: <CAFEAcA9dPg9Zs4LMzjb738nsVQXPicQSLU5yHXgG0wffD0M=Gg@mail.gmail.com>
To: Sergey Fedorov <serge.fdrv@gmail.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::22f
Cc: Sergey Sorokin <afarallax@yandex.ru>, qemu-arm <qemu-arm@nongnu.org>,
	QEMU Developers <qemu-devel@nongnu.org>
Subject: Re: [Qemu-arm] [Qemu-devel] [PATCH] target-arm: Fix translation
 level on early translation faults
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.14
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <http://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
	<mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: SfmforRFBj5+

On 3 March 2016 at 16:37, Sergey Fedorov <serge.fdrv@gmail.com> wrote:
> On 03.03.2016 17:55, Peter Maydell wrote:
>> Yes, this patch is definitely fixing a bug; I'm just mentioning that other
>> code path because it seems to be the result of previously fixing the bug
>> for a particular special case...
>>
>>
>
> Ah, right, I think I understand you :) So we'd better remove these lines:
>
>             /* AArch64 reports these as level 0 faults.
>              * AArch32 reports these as level 1 faults.
>              */
>             level = va_size == 64 ? 0 : 1;
>             fault_type = translation_fault;


Those lines come after some code which has set level to something
else, so you'd need to rearrange that code a bit so it didn't
set level before it had determined that there wasn't a fault.

thanks
-- PMM
