Received: by 10.28.91.67 with SMTP id p64csp2673117wmb;
        Mon, 5 Mar 2018 07:33:16 -0800 (PST)
X-Google-Smtp-Source: AG47ELvUvarAPpFMN8eCkbA0rO9mxdIttRSpvUZpNFat8bfdMwOeUderXpyEObAqoniLKvZXxiut
X-Received: by 10.13.210.68 with SMTP id u65mr9381129ywd.410.1520263996360;
        Mon, 05 Mar 2018 07:33:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1520263996; cv=none;
        d=google.com; s=arc-20160816;
        b=XEbrRk7fLgXm1LkHIrL2LgI74vddix1ejE8Pqr1eZGcsjyF6Y3Dc1xIS2ZNq/pAvrY
         d3z5qNjagyFaguYvW1HPZGroFGi0wJBGso4kaJ5iqO/MvZ7rRhRiEJWn/pofrvUefeSL
         KbxWrVI6JY8LoOVoofLZ9QtIWgXF1Nnz2PpGxN5K8cnTP2zM0BhFPatTaI2Z6Olb19qF
         p1a2b5uMglfcRwTV+K8QMDez5bXKQ7kJzY/BF2u1F1jHc/eCXKuAMTklQ5RZWabLBOPh
         0Vm3cgAA0K+ZZy1htfVws5GFYlBUhm4ZzJChHh8P/bQLVw9G3eMzF4n12I/sTOZTfIm5
         631w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :references:in-reply-to:mime-version:dkim-signature
         :arc-authentication-results;
        bh=kjAmmoqnHwqeG1p6nr59ePKF8dWAf5edH24IdwMAU6s=;
        b=O2FMZ8Ab1loKyd5pFcAniXZ7Q/nJunLjLlKDix2SU2D61Xybg3MKGgPvdikNbjxz9f
         5FqHbTq3STgMOf809aZI+fZYy6aufUjilt0UVM2R8pMWVEP2faWjMRIWVORHfciDZOEc
         nZnDpPr+LBmMM7vJ93nIndjv9Q94hiNGkAWkdicNPo7J77pZz5y4JMcr+GRCZaN2wo6m
         zwvZNfzH+vNr3Eab6mS78o4m5PL75aHk1DEalmhGjDz5UB/KOZUm3uMD9OP1K4j4Hj3R
         tzZhnn5YWoGiO1Ze70QRA/jLRkB2zahKMCnes5iW/NE08dkQoMLcni1rMhzU6N3zD42z
         Tu/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S/8SWTT6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [2001:4830:134:3::11])
        by mx.google.com with ESMTPS id j17-v6si1314844ybj.357.2018.03.05.07.33.16
        for <alex.bennee@linaro.org>
        (version=TLS1 cipher=AES128-SHA bits=128/128);
        Mon, 05 Mar 2018 07:33:16 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) client-ip=2001:4830:134:3::11;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=S/8SWTT6;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 2001:4830:134:3::11 as permitted sender) smtp.mailfrom=qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org;
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50004 helo=lists.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ess71-0004V5-TB
	for alex.bennee@linaro.org; Mon, 05 Mar 2018 10:33:15 -0500
Received: from eggs.gnu.org ([2001:4830:134:3::10]:42021)
	by lists.gnu.org with esmtp (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ess5y-00049H-Li
	for qemu-devel@nongnu.org; Mon, 05 Mar 2018 10:32:13 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
	(envelope-from <peter.maydell@linaro.org>) id 1ess5x-0001mz-HE
	for qemu-devel@nongnu.org; Mon, 05 Mar 2018 10:32:10 -0500
Received: from mail-ot0-x242.google.com ([2607:f8b0:4003:c0f::242]:34890)
	by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
	(Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
	id 1ess5x-0001ll-Ax
	for qemu-devel@nongnu.org; Mon, 05 Mar 2018 10:32:09 -0500
Received: by mail-ot0-x242.google.com with SMTP id w2so15262953otg.2
	for <qemu-devel@nongnu.org>; Mon, 05 Mar 2018 07:32:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=kjAmmoqnHwqeG1p6nr59ePKF8dWAf5edH24IdwMAU6s=;
	b=S/8SWTT6i5x7BKLQdFsrRUfBv6X/HqEe7LBnwupGNs45/Y4/FKaeNz8MJywF+ukFLV
	aut5p2NeZQB4YeOd20Ylnok+HmSerfbl+e8x4n7iIjsSuF05O/rQRZY6+y0IBmQGA1xW
	JIw/z+uVUkLH/VVWK7I6umZ43YvypGuc9hGOM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=kjAmmoqnHwqeG1p6nr59ePKF8dWAf5edH24IdwMAU6s=;
	b=TA6oySDmsz4ilLwXI7j7Lg8Uj3FYkILecrG7Kg2FSj9OINpFLUmpNUXvzGaxqpFL24
	U3jOnEIjui7goVZlgqSca37W7RrwNw6gzTNGLcnXK2lb4pwYQdZuTkWFW+F2l58UmhtG
	PgmBMAXxEhRPSWYwcVUuFwdhriMLfkNKDgpwWw8V+CZf38n/CmFEAiFCt6jQr4tdOM+K
	+l2/Eu4630Ob1kgaWqBJ6Gvln2ZTNPqQivkZKUegr1D8d8gOIkZKrcKFPqjGj8o07sxP
	Oa5534aQJxAsD4sdGYG2Wk+eIgVHNp7Zufd2g4uK4K3BDyo/9vIwgElm4GN55zGtxdWw
	cYpQ==
X-Gm-Message-State: AElRT7F+ukRAB4E82N2xPjfdKTKOsdGoo5Xi3/PXNkNYhAbgGqlbcUoe
	I617j+yM3GbCZvQS5sjkhBk3ma10o+ZjmTuYZLG/IQ==
X-Received: by 10.157.3.70 with SMTP id 64mr10311593otv.258.1520263928508;
	Mon, 05 Mar 2018 07:32:08 -0800 (PST)
MIME-Version: 1.0
Received: by 10.157.33.100 with HTTP; Mon, 5 Mar 2018 07:31:48 -0800 (PST)
In-Reply-To: <20180305061237.21484-1-andrew.smirnov@gmail.com>
References: <20180305061237.21484-1-andrew.smirnov@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Mar 2018 15:31:48 +0000
Message-ID: <CAFEAcA_Y3oY0w3Xmrs0BTfhXw1s7S-8pESZ-rB2HgXzZ_5Vxmw@mail.gmail.com>
To: Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
	recognized.
X-Received-From: 2607:f8b0:4003:c0f::242
Subject: Re: [Qemu-devel] [RESEND PATCH v7 0/3] Initial i.MX7 support
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
Cc: "Michael S . Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
	Marcel Apfelbaum <marcel.apfelbaum@zoho.com>,
	QEMU Developers <qemu-devel@nongnu.org>,
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
	qemu-arm <qemu-arm@nongnu.org>, Andrey Yurovsky <yurovsky@gmail.com>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8FNNFwcP3Ppd

On 5 March 2018 at 06:12, Andrey Smirnov <andrew.smirnov@gmail.com> wrote:
> RESEND due to botched original v7 submission (patch 1/3 broken)
>
> Hi everyone,
>
> This v7 of the patch series containing the work that I've done in
> order to enable support for i.MX7 emulation in QEMU.

Thanks; applied to target-arm.next.

By the way there were a couple of i.MX bug reports this weekend:
https://bugs.launchpad.net/qemu/+bug/1753314  (about the UART)
https://bugs.launchpad.net/qemu/+bug/1753309  (about ethernet)

Are you interested in having a look at them?

thanks
-- PMM
