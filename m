Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp936987wrp;
        Thu, 5 Sep 2019 08:33:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqz+ArFD/fWy45fk/M8oy+slTQnzuh7lTQkYHWvBkAbh2QryNVEkPnONAv6sF1mJvi0XyTrE
X-Received: by 2002:a37:ad8:: with SMTP id 207mr3605110qkk.38.1567697597690;
        Thu, 05 Sep 2019 08:33:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1567697597; cv=none;
        d=google.com; s=arc-20160816;
        b=ksvYVJYjvX+i3f4lPCGOfFaFCgndWmSWbbOyc/jDL02aNsFreJhwMB6F8NiCxV5jXf
         0PlnXHrFtTL521Lx4MR/3t/pZnO3CJtgTJRxV/u0BSrxzB0X5bwCPb3EyBx7n91TPdI+
         L1tG+bLnPZdONKPn2ma7nFY1x8FUtClcrHQaiSoIQGwkJP3kbHvlU1FiyThkjyqsLBZk
         wbxxymPYwEW5HuKXhpFUvlmlBiduVIUGDrfd+NnTFoqXNuh1OoLPzFH9RG2tGEm0WnTN
         SaX5duwWog/Ur9wfLaZEoR2Gfx5Jyo3UBYa0KhMHM+PhYlTqjFoZjnw+Wv+K+rszOoVD
         BvEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:subject:to:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GO78lGxWojM+p6UTRnJZayuCpYSCPN28Le22gholJj4=;
        b=1BbRYPxGdfh6nN3qHdYHWrNXPSmOGygvajDCvfWIVDjIUqSrh43wMRllOQkgEfwyAC
         zZcA9C/mw9ImOKrbE41Uhc4O5hRVqsB+2VFbIQ71/GApRkar7NzdSmf8J+oguZYGJJLu
         0GCpN4w+SacjBYyZ+C/uIn3UgBVtAQfe0jb4pUUbDakA7cJ9nuzApXV/mroGG9C6rRLm
         RS6nYpCnK0j2Gg66dPzx5mO5JNb7TQcrJ9AgLWxedDyWWZlaFGtn7OO0Q3LEXCoN0eeo
         WOjalVR2ji+CJmY54CRs/Y31/ifXsMnM+bHqSA+Ur+zg0EtoYEim7TVtber8ndG1lzvV
         ozJA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e32sqkmd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u45si1622226qtk.44.2019.09.05.08.33.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 05 Sep 2019 08:33:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=e32sqkmd;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:47408 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1i5tl6-0002GK-Hi
	for alex.bennee@linaro.org; Thu, 05 Sep 2019 11:33:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44310)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1i5tgq-0008B0-Uv
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 11:28:54 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1i5tgp-00015x-0T
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 11:28:52 -0400
Received: from mail-ot1-x344.google.com ([2607:f8b0:4864:20::344]:37193)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1i5tgo-00015G-S2
 for qemu-devel@nongnu.org; Thu, 05 Sep 2019 11:28:50 -0400
Received: by mail-ot1-x344.google.com with SMTP id s28so2602286otd.4
 for <qemu-devel@nongnu.org>; Thu, 05 Sep 2019 08:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=GO78lGxWojM+p6UTRnJZayuCpYSCPN28Le22gholJj4=;
 b=e32sqkmdybymWvfph30/YIjv3upHYrRMWCQcmwNtLB+X5wM3lS+ffajbI0Xf5QL/RK
 mPUGweP0lUGDzlZgMuC/B8km4GppGeyjeJk+WhgxgyGTXOsKeVUR/qoId4dO7nxgghw3
 n4zB93EN5fYt2+32LZ/dyRGkFqn0M4F3xUlaHjSfI9VQxyCWs3SvWpbWTMj7mEHEy43i
 IFg1a/Kj58s6Jp52AAymzCGlwlLYePqm8tYxIZg/PVglwgUau6T+GBM/o50khuBRdn4t
 Y+QTuvFNFS40beOMnlkZP1b7AhmmA+Puw1JNpmq5tS3p7/ySPEz4mDGs6ES6eJH7DKM1
 dM8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=GO78lGxWojM+p6UTRnJZayuCpYSCPN28Le22gholJj4=;
 b=CgC50hhdQxQQtq5DmTDiy2SfG6dKUl+GDXtQbOqOUeL5/PcjFH3nShx/QEAY5szpQq
 nU7s9tL6It1uuWvP/BGT/OrssVXZD3D5TbJ1zXEunBWrswmoLhZn3ImrwTmS34BIvByv
 vpfUOugjMqPwNlCloHvsQdaNVQXmQsEALIDYZvAsiEOZGLQsILeHDfkk8wQmYBFkiRNA
 +ncKjw2nSD37k93LVTItlPSPEUjp/ucBo8K2OtkzGdAhCD/owPG/6KE4UfpbXkBYnjox
 RA0trRCQhg1lGmrRKaykYhuTdXVCuHCx71cDOH6kcjw7nWvEdFQrPG16W49DA/WvZ2j5
 k+Hw==
X-Gm-Message-State: APjAAAU4mZQxDogt9dXrFRrYqiMP8HO7u1Os2z1sNHA1JIzvmio4fscl
 7tkGXulz/k43ZsH580/otqbdTJgtqvJOyviAmVFNjv7hgh0=
X-Received: by 2002:a9d:5e10:: with SMTP id d16mr3194864oti.91.1567697328591; 
 Thu, 05 Sep 2019 08:28:48 -0700 (PDT)
MIME-Version: 1.0
References: <20190904193059.26202-1-richard.henderson@linaro.org>
In-Reply-To: <20190904193059.26202-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 5 Sep 2019 16:28:37 +0100
Message-ID: <CAFEAcA-sqMSBmUKCaHHCVwPPk8j874Nm9k-PqjdC8oVhmgJ92A@mail.gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::344
Subject: Re: [Qemu-devel] [PATCH v4 00/69] target/arm: Convert aa32 base isa
 to decodetree
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 2lhQ7CkdE0G4

On Wed, 4 Sep 2019 at 20:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This unifies the implementation of the actual instructions for
> a32, t32, and t16.
>
> The changes from v3 are minimal, mostly rebase conflicts.  There
> is one change for checkpatch warnings, in patch 34 in trans_RFE.
>
> There is one outstanding checkpatch warning, but it's in a minimal
> change to some existing code that is removed before the end of the
> patch set.
>
> All patches have reviews now.


Since this is all reviewed and it's big enough that it would
have been a target-arm pullreq all by itself, I've just
applied it directly to master.

thanks
-- PMM
