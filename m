Received: by 10.25.21.96 with SMTP id l93csp591303lfi;
        Thu, 23 Jun 2016 08:47:24 -0700 (PDT)
X-Received: by 10.55.92.198 with SMTP id q189mr34596853qkb.155.1466696844338;
        Thu, 23 Jun 2016 08:47:24 -0700 (PDT)
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id l4si698557qtc.12.2016.06.23.08.47.24
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Thu, 23 Jun 2016 08:47:24 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:37519 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1bG6qh-0001r6-IQ
	for alex.bennee@linaro.org; Thu, 23 Jun 2016 11:47:23 -0400
Received: from eggs.gnu.org ([2001:4830:134:3::10]:55409)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG6q2-0001QP-LW
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 11:46:43 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG6pv-0004eZ-12
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 11:46:41 -0400
Received: from mail-vk0-x236.google.com ([2607:f8b0:400c:c05::236]:33151)
	by eggs.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1bG6pu-0004e4-SR
	for qemu-arm@nongnu.org; Thu, 23 Jun 2016 11:46:34 -0400
Received: by mail-vk0-x236.google.com with SMTP id d185so112045366vkg.0
	for <qemu-arm@nongnu.org>; Thu, 23 Jun 2016 08:46:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=YwE1v7WSVqDspWoGXHa+GMLJnbrtbcQ9jlncb0CHSww=;
	b=HZLJwJvzDIck/Hkwl7wjD0byuGkxkc0F1cNU0RPYu/BuYa8ADNkOW1ewXncMuQBYAC
	jcVkDR9OQlcDsK04lmAoQLF1amp1p7KO0HK8XbDjw9Qy96lryX6jG5o8c0obj0d9uPZG
	ED8QJYGPVuGzXPAcZKfTt7mjJLtl77DCho/5I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=YwE1v7WSVqDspWoGXHa+GMLJnbrtbcQ9jlncb0CHSww=;
	b=fYZXkuQXU/+thawl1ySTAeca0lLWD07Mr8JYSQGSDwOHqitM2AC39TALNzBUkA5NE+
	nQ08HugTpDzAcefXPxKB1Aak2awYMNjJEzlSlRXlJuy/ec/Km9ad2Ik0Y8hjomQmiIfo
	uwPFsbprRTPoywflZFYTtlWddjqojlsoQs0cg3jDPqM5FZ4GI1aI7YgGA2SZY7eHYPIn
	oGudP5QSm13vOOuLEbC4b8Qpq8LQaWtl1PlgP+2Yw5QCa1EkwE3JUz6u4TN6mAg2/UZP
	vQbBQAmoKoXxqo2r/o0zutOCgX9eQfMmM+M/KEdge6lxIlluIIecFLXFtG5fM5efgJDt
	WFSA==
X-Gm-Message-State: ALyK8tK0fsnGCrrelu0sZfY1HbqBlP+BTvNz21Wj21FFfurWJzApgwu3+2kWQLxMKxY6VuPrzn1nqY6D0nGt462z
X-Received: by 10.176.69.138 with SMTP id u10mr15868706uau.24.1466696794334;
	Thu, 23 Jun 2016 08:46:34 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.31.157.141 with HTTP; Thu, 23 Jun 2016 08:46:14 -0700 (PDT)
In-Reply-To: <1465552668-30084-1-git-send-email-aleksandar.markovic@rt-rk.com>
References: <1465552668-30084-1-git-send-email-aleksandar.markovic@rt-rk.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Jun 2016 16:46:14 +0100
Message-ID: <CAFEAcA_4fMipG0cuOYMZVxgydVig1UbocdJGr-DVzh=qXg5QkQ@mail.gmail.com>
To: Aleksandar Markovic <aleksandar.markovic@rt-rk.com>
Content-Type: text/plain; charset=UTF-8
X-detected-operating-system: by eggs.gnu.org: GNU/Linux 2.2.x-3.x [generic]
X-Received-From: 2607:f8b0:400c:c05::236
Subject: Re: [Qemu-arm] [PATCH v9 00/10] IEEE 754-2008 support for Mips
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
Cc: Ethan Hunt <proljc@gmail.com>,
	Bastian Koppelmann <kbastian@mail.uni-paderborn.de>,
	Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
	QEMU Developers <qemu-devel@nongnu.org>, Alexander Graf <agraf@suse.de>,
	Blue Swirl <blauwirbel@gmail.com>, Max Filippov <jcmvbkbc@gmail.com>,
	Miodrag Dinic <miodrag.dinic@imgtec.com>, maciej.rozycki@imgtec.com,
	"qemu-ppc@nongnu.org" <qemu-ppc@nongnu.org>,
	Petar Jovanovic <petar.jovanovic@imgtec.com>,
	qemu-arm <qemu-arm@nongnu.org>,
	Aleksandar Markovic <aleksandar.markovic@imgtec.com>,
	Paolo Bonzini <pbonzini@redhat.com>, Guan Xuetao <gxt@mprc.pku.edu.cn>,
	Leon Alrae <leon.alrae@imgtec.com>, Aurelien Jarno <aurelien@aurel32.net>,
	Richard Henderson <rth@twiddle.net>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: NLB5qv+pCDV3

On 10 June 2016 at 10:57, Aleksandar Markovic
<aleksandar.markovic@rt-rk.com> wrote:
> From: Aleksandar Markovic <aleksandar.markovic@imgtec.com>
>
> This patch series provides number of IEEE 754-2008-related features to
> Mips platform. It addresses the most sensitive changes that require
> modification of SoftFloat library, also used by most other platforms.
>
> In order to make develpoment, testing, and integration easier, the patch
> is split into two distinct parts:
>
>    1. Part 1 (patches 1/10, 2/10, 3/10, 4/10, 5/10) that does not change any
>       calculation or behavior on any platform (and, for that matter, even on
>       Mips platform). Its sole purpose is to address platform independant
>       issues in a non-invasive manner, and to make Part 2 possible.
>
>    2. Part 2 (patches 6/10, 7/10, 8/10, 9/10, 10/10) that sets some Mips
>       processors to use provisions from Part 1, and additionally implements
>       number of IEEE 754-2008-related features for Mips, while, at the same
>       time, mainly dealing with files located in directory target-mips only.

Hi. I've reviewed the patches in Part 1, and I'm happy with them
apart from a few trivial things. I'm not going to look at Part 2
since it's pretty MIPS specific.

I'm assuming that Leon will take these via the MIPS tree. Leon,
it's up to you whether you're happy to fix up the minor things I
raised when you put the patches into your tree or if you'd
prefer to have Aleksandar respin and resend the patchset.
Either way, it would be good to get these into a pull request
by Monday since softfreeze deadline is nearly here...

thanks
-- PMM
