Received: by 2002:a19:5509:0:0:0:0:0 with SMTP id n9csp1377149lfe;
        Tue, 17 Mar 2020 03:49:56 -0700 (PDT)
X-Received: by 2002:aca:1312:: with SMTP id e18mr3015371oii.137.1584442196270;
        Tue, 17 Mar 2020 03:49:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1584442196; cv=none;
        d=google.com; s=arc-20160816;
        b=DlE+hrANYSo/xPHLa0Ro1xUMGP9Rf18pF0txHrptKIo9QkGyQcONbXznGvV6BM8Kof
         lhohkgscPEqByJSDCt2j35nmxrqDhSjNKyhgYfeXdA9B2cTU5XWfQhZq8CxGvB4tOAA+
         Ez5IMS2eBXYEvfE+PsajuqGEIswytdSM2S20wAAyh0UB4eRMy+NmTraseWvusi2DBlSI
         iAQqqZZZjv6W4j/CBm+4Z0+THEN06kquZLd0iVwh3WqsZ9khtpX5QC+j27QWzxTVYn/y
         sYiFAzw31w+SzuuE3fezrN+E7Vtd0a3IFJYlf36BK57AzSkGvc9/kgfUe/jDrA0aJP/o
         57NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=5jebkakv2QsVGKK+gf+7wsIdub0gn7LKnI+hJ3xjhFk=;
        b=p6t8ADL5XbnODGiVL/SZcS+zauBvG+sUEEpN4SciDFptaU0Nc9lX3CKkMMeyWHzdA7
         iYxOcPz+dcYL9xObHs3YbELfkiw/xaXJ3NgfBhpf8LXCqsehzlgNIHN8nZjAAsJIQTXz
         4cf6Lr0ygvrPRpuufu0PQRj5OVYpqGzRUkLwpLsmCFpxc/qkVsvkeMDy9ymzOK8mC3hn
         6n4omDoGtbGtdXRJLlQ/ORkwMx6d5m805GfkdP/WhWr7j6HT+sFmgukkxB2kheT/Cry2
         UpvoMgmzsK02dfKVPpHz9kTBFZuzF+TGyE7SY01ZYGuEZI4V3IvNxQhczPqJ7eHoP/GZ
         Lkug==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UuqhQFUt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id v67sor2276109oia.79.2020.03.17.03.49.56
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 17 Mar 2020 03:49:56 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UuqhQFUt;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5jebkakv2QsVGKK+gf+7wsIdub0gn7LKnI+hJ3xjhFk=;
        b=UuqhQFUt4+g6xdeiRdCFqb0HYKcOD4viudiBqX0UkqxmeItOHVbVYjLHB3o6fQXCAK
         0UKWNFEs+ixDwQIHnTViDZ420k9qdqCqZsQWi3xc4xcKGl9P7OkoAktqAGsNlUhg+9zR
         Ax0xkzo17IysqmNTXmQyAkg3iAVqyUcBWjPgBs1tu3l0jmpmZvXb9jwoTgV+qATb2UHd
         l6sbnTahsHTVoj+e9Vd9E0LevP5MD5kee81cWhB/AI4bOOrRSHFQpC6W696rhNCJV5Tl
         h6w7riHYJGaBHNQuIh2TFHCnvempr1pVYKnKUgGEbuSIjPceY9hM9+Cf/lzG9Wx69m23
         n0Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5jebkakv2QsVGKK+gf+7wsIdub0gn7LKnI+hJ3xjhFk=;
        b=JyWRQRIUrXWdzNcuw24V/XzFjJtegWxCp+W0n+e7F1d3+QJlltGi4dEKCfZUMvCbNz
         EpyvUy6Wtqpr3yKozi8yn8QYAN8r+999PHVmqAqgvlcrOkgKLPb5X1wOzcS+l30YCfiC
         Jp9qPzjz2TGALQNRBINENBg29u/cTqTgVzvNTPxmIJKZTx24o65/zHla1XdO1JMceFpJ
         g7Mfh81EVUSn4fnuwetrBTs+qbErHV69jhFjtsl3+M+meUWm0fNGCTCjjrXMEQcGr5K/
         407A4+5mKp6Lx3QmimgExsMflKLztef4y7EnmA6ZvnRVgl8P32NvwDMg5+sumLsOGllk
         sUrg==
X-Gm-Message-State: ANhLgQ0Vy/Z5RlNfNgbULfTmcaWJgZsiSKII6xujknm2vLC8Zoo8zOed
	zADpHfTWLPo7PLaTia/1IziDRvYtMZEWnao8J2yGMsrN
X-Google-Smtp-Source: ADFU+vsDyWNYKItBscndIPy44LE4AYtwfJ1XjsMzN7693uDS+5wfYPNtlgpICh0HYyxdO9Ps6SY/ABY2NrBI+p0tm5M=
X-Received: by 2002:aca:5b07:: with SMTP id p7mr2866202oib.146.1584442195840;
 Tue, 17 Mar 2020 03:49:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200316172155.971-1-alex.bennee@linaro.org> <20200316172155.971-25-alex.bennee@linaro.org>
 <3d01f357-eeb6-7fd7-1895-feae05beca99@redhat.com> <CAHiYmc5CtAH-zs38YmyLkrrp2DnxzLUWNKBTcL+oyFNEiCsV8A@mail.gmail.com>
In-Reply-To: <CAHiYmc5CtAH-zs38YmyLkrrp2DnxzLUWNKBTcL+oyFNEiCsV8A@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 17 Mar 2020 10:49:44 +0000
Message-ID: <CAFEAcA8FSwVeOVDWT8qRO_EL2OncxdgGZbNHH8VhaaoKuwS7_w@mail.gmail.com>
Subject: Re: [PATCH v1 24/28] tests/tcg/aarch64: add SVE iotcl test
To: Aleksandar Markovic <aleksandar.qemu.devel@gmail.com>
Cc: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>, 
	=?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: 67YfbFs0VbaV

On Tue, 17 Mar 2020 at 10:45, Aleksandar Markovic
<aleksandar.qemu.devel@gmail.com> wrote:
> I think it is also a little problematic that tests like this reside
> and belong in tests/tcg - since they deal more with elements
> of kernel interface (system call prctl()), rather than TCG.
> Still, I see there are many other similar cases in tests/tcg,
> so probably (at this moment) one should't bother about it in
> the context of this patch. However, in general, the location
> /tests/tcg for all these cases seems wrong to me.

Well, the only reason we have the test at all is for testing
our TCG emulation. Generic tests of syscalls don't live
in QEMU at all, the best place for those would be the
Linux Test Project's test suite.

thanks
-- PMM
