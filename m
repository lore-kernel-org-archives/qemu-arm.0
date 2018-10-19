Received: by 2002:a5d:4c4c:0:0:0:0:0 with SMTP id n12-v6csp3708416wrt;
        Fri, 19 Oct 2018 04:59:50 -0700 (PDT)
X-Received: by 2002:aca:3a41:: with SMTP id h62-v6mr17357275oia.84.1539950390716;
        Fri, 19 Oct 2018 04:59:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1539950390; cv=none;
        d=google.com; s=arc-20160816;
        b=hkWluHoJ+brCbVEO/fboMJ15Q3eNgCP/7CpSA2aw+w/uLQmxNwVFc0p4keYRK/Liq/
         D/zRVw7B5Q/2upWtxaYzsunbBdbQCB/Zy+uoRf1WY5yGSjPUtyCaKKL3LkiqGatVQq2i
         8wMoR/CMYF8nFiqspejjN4PPCS5cW+6pekPHWsqQJ76ocrY95FNdNCWHrKYFSvESCjWA
         RY4JKh5apT91Lgq3/KwDJkx6hAOXXNz8PHlocmzsuxENshUmA9VQM0coEx5a6yokcuMc
         eNKhvkvC1k97Z1ceNO1sMtRujuxH+zYuaGKM267+70aEY5vtSYW9KkLb3dCYfXHxsids
         wsOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:references:in-reply-to
         :mime-version:dkim-signature;
        bh=MW7yR5AC3GnqAQBSLSZrFo21bCz5QJ1Iu4VPNAh6NJE=;
        b=APyrpjCGbWcrLj6mee5I9ijC6t4RVm6yI+aeGjaSol/U4sXG2y5MWUcBumoXFThy6W
         2hLhMf+sFZfQXIn4h9n7x1Ixn+SBC2UDiDw+bpQYEroAcLi9SZEbMFs0QNJRf0zhBT9c
         2NrMbX2Dcb5xmzUj9BrAJispDLCqUgMHe2OHfKhaCiE932PICWxzdVuxOWauR/wHfInV
         jb/kvG7r+SIopKJBdrOO4IEugFLUUPC/AVZiVOTmu+wXyofEVxiX7mWFM2N4xZdpbk08
         jP61gT3peEGU0GpiF40BDFwT75NLJjHglKrFOEnsGVI5yy7XClc1cInAB7MF3YP+/k04
         00EA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dMOSFySd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id e27-v6sor12183681oiy.31.2018.10.19.04.59.50
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 19 Oct 2018 04:59:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=dMOSFySd;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=MW7yR5AC3GnqAQBSLSZrFo21bCz5QJ1Iu4VPNAh6NJE=;
        b=dMOSFySdr78MlYr5E4ZpzzVTuiDwmqySaWzM7udRXtOEnXg4gOcgDoIPGVSW2jDEzf
         9FXTBrp+zkZyN8Z3aHSBd4toyLz3LhEDqc+oldJ0x3E7as+LTQ2rvr1hT1sZz7eL3s8z
         8MeB952sa5HrkWcwYIRAu6qSOvwJYj6QyxoZk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=MW7yR5AC3GnqAQBSLSZrFo21bCz5QJ1Iu4VPNAh6NJE=;
        b=W0AbRmFtqmtX7INRFGOa4Qf4QhTH6ifGpC/uolEc4UZfFBqjoJqukwsSVVSYPwXIwc
         +TyObKJHVgB0QCyjxr/gHvg9mQ1NTNSyt+QlI8S3P54veEFZn9cEW7ZA/tHrS3AvqxFM
         zXVR9WWuNS8ROIKBGS3zfXclloTD4+OECfIqAC07xp3ybGMx5Oqsg7Jw7NHEhJzN5A+z
         L9KSqxtBdXF8yN59599LeztAc9AIKsyATQxmV3M9p7eQuI3QzcpX/SPJJBNBXgfggtgX
         OIC28wPCNsG8QjWbwlY2DR6ePJxb+NZwagJOk98Uc+6vZ1r+TiX21yiTjnGWAcOi1Jwm
         ziMQ==
X-Gm-Message-State: ABuFfohVk5XY+BeR1XuKNCYtwljIYcMFeWWS3FO74YOaHRfrSxheLFBi
	vqxoLrKDr5Re48v71mIhKf0NAYb7podu2d4uYL3bXzbINUJilw==
X-Google-Smtp-Source: ACcGV61onlwrWoGxeg7vyxCkWH5wuov1hoEVsvcepzad+ZJ87XruOrfGI6kIOEQM765z/HJdz7Au6R6lZUOXCEtjniM=
X-Received: by 2002:aca:53c4:: with SMTP id h187-v6mr17127973oib.48.1539950390358;
 Fri, 19 Oct 2018 04:59:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:7c90:0:0:0:0:0 with HTTP; Fri, 19 Oct 2018 04:59:29
 -0700 (PDT)
In-Reply-To: <1539944335-19556-1-git-send-email-hongbo.zhang@linaro.org>
References: <1539944335-19556-1-git-send-email-hongbo.zhang@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Oct 2018 12:59:29 +0100
Message-ID: <CAFEAcA-MD7aE1phES3RPEH2mk5USfKv0j1tGtbrOnid3hLQmXw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm/virt: remove unused header files
To: Hongbo Zhang <hongbo.zhang@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: fyR+judO35jE

On 19 October 2018 at 11:18, Hongbo Zhang <hongbo.zhang@linaro.org> wrote:
> Remove the unused herder files, 'virt' can be compiled and run without
> including them.
>
> Signed-off-by: Hongbo Zhang <hongbo.zhang@linaro.org>
> ---
>  hw/arm/virt.c | 8 --------
>  1 file changed, 8 deletions(-)
>
> diff --git a/hw/arm/virt.c b/hw/arm/virt.c
> index 9f67782..f0066cb 100644
> --- a/hw/arm/virt.c
> +++ b/hw/arm/virt.c
> @@ -30,9 +30,6 @@
>
>  #include "qemu/osdep.h"
>  #include "qapi/error.h"
> -#include "hw/sysbus.h"
> -#include "hw/arm/arm.h"
> -#include "hw/arm/primecell.h"

Dropping primecell.h makes sense, we don't use what it provides.
But I suspect the others are "unused" only because some other
header we include drags them in implicitly. I think it's better
to explicitly include what we need, in case that other header
changes in future.

How did you determine which #includes to drop here?

thanks
-- PMM
