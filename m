Received: by 2002:adf:fb8f:0:0:0:0:0 with SMTP id a15csp5367016wrr;
        Thu, 14 Nov 2019 03:51:15 -0800 (PST)
X-Received: by 2002:aca:c702:: with SMTP id x2mr2913645oif.167.1573732275310;
        Thu, 14 Nov 2019 03:51:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1573732275; cv=none;
        d=google.com; s=arc-20160816;
        b=JEH9qCTqIm8Ee4CFrQWFg5I6atuk4ZMiGI6MgpWkCV60RsdbVDkhWmgrbWemGdzvlE
         LH9/HPQB1/L/2zmCRCy+ykaF5Ll9o1dk6qoZQIKDfW1KyhqUxwI21zjstjcxkcM9YnpV
         6U/imFzkKE6XwrJqOiJwEJFCffdSPqJLyNFLvB8K+Md3tiYXgiQSbkuP9M8GSfjYqcXT
         YND7nbav5bANBf/+N1Eml9W5lRmBlOSdOa7WGcW2ht5SYzO5FS2dHPQQZ9AXGhpheawZ
         zig0oU4qm3bNxnW1VbHASiLlJHh8XGkGtMbj6/Q8SELSCdsdmKA+w6UN9Npc3VK45GSK
         j61w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IGqLxe2QF0DB/XifXDac/0bqVS6wNU43ZwFARksAUls=;
        b=IR3qXgagdeh1sT4ie9cn+ciXz/tzL/SjUpufWiE4nUpS6yNTLpNc2PTITNPOhMCo8F
         +oTWteZItwNp9N+SZcq1Bi6m8RdoD4rmHCXCgSa/FpVZQmMZHWuuT2VSciQzRuB8ksnV
         r35SbYpSOB0tcIFgCjSEk/+WL04dQCw5UWK/neYC4TRIfEp3WpM5JhAI3KXVnEpkog4L
         2F1n8OVKBGgm6qHyj67j+e6AdVLVhiq8kloA6XdbLh/SPASqiSu6VyaYQlSCZZGsC/HA
         Zt3O+SLRS6cI7xWuGnSMjAPu3bDl1y1P0cVDMWDuwMFs/SigQihw01pYApkl0ObDEai0
         kbyQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HJIdSvgj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id o2sor3191655oib.34.2019.11.14.03.51.15
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 14 Nov 2019 03:51:15 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=HJIdSvgj;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IGqLxe2QF0DB/XifXDac/0bqVS6wNU43ZwFARksAUls=;
        b=HJIdSvgjtLnroe97l7Klo8+zlHcYrX2yWDDlOhSdXcHrmJTI721K4RTrT59QRTRHnf
         Bd+QAbr4sxQwAzPno2wCz4yyKwTGxD33UIO1AqlM4mvOCO4RaC8SD9UXMl99qa8Pq2NI
         V6cm+OshrTBwwyd6MpmgwRwgqGuxl7zYaTVI4u86WBThDQBWgmtky3nlpmpjkCXMKTFD
         mpoXn3wZUzV4B25ZeYja0rqkHVe4bkdKxfGN5tCUVqQWNcSH3cGnQQ2GFOViT2A9+7Un
         RMuuihRs4Of1O4rI4JR1zvVB9cbMojMAtizKH2GIO8n1P9jhZxwGbKLIMO+mfAODEQuq
         S3gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IGqLxe2QF0DB/XifXDac/0bqVS6wNU43ZwFARksAUls=;
        b=OEOM+Ivmzctx7h07ZIRyzYgJab0OiCMMARIEY/8lUo6azGC4RrNqG42pFcnUyP6UNN
         T+2//ZllUsjX3XAbw2qIOMW8oELZJhaIcuLM5KxMrobwwHOKWdJ+f8CmSVEtMFFFOQYf
         Bqdad+C1ZKbK2qg7ruAZd4l1VDfnAjbj34y8XFuDBekIJoO6Z/RfWro1U3p89HEXAB64
         7eU5h1mLbkzBtAGb+bKLAcp/3RHCA1gBOcPQPy7il4hDJlYRqJUysvWmLDZr2sUUOe0J
         OAA3GOBoPy2tGuEXn8zoKl96wcTH1yG6ydG7d+9DVOr0R6/+KETbm6QbMjivU9ttZCzG
         WyoQ==
X-Gm-Message-State: APjAAAW4qIrB/GeMboXywr9ZRvVOidzYoqsGQ2JYxF6X3Eg8sOSWBa+i
	+CByTCkzGVA5wq5MyuvpTZd7w+6wJRY7lwdQ1LYYEg9fguiRHA==
X-Google-Smtp-Source: APXvYqztKxUsfCRwW1jOh+NoYiQYUyMOAOzCH7HxTwUOhmRULT4Feei0nLEWfHJiYN+AW9GaEzIp/LBi6ijisH+4o1w=
X-Received: by 2002:aca:cf12:: with SMTP id f18mr3044350oig.48.1573732274485;
 Thu, 14 Nov 2019 03:51:14 -0800 (PST)
MIME-Version: 1.0
References: <CA+aXn+EtxWUVBBqhtjuY9hyKjtLFiSF=fZ8nSiqZq7+KCJDgfQ@mail.gmail.com>
 <878soi7lmr.fsf@linaro.org>
In-Reply-To: <878soi7lmr.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 14 Nov 2019 11:51:03 +0000
Message-ID: <CAFEAcA_Afy5Fqv+G3hR6mJwYXP7ufzew0=fgwkb2oCe079EkEA@mail.gmail.com>
Subject: Re: Qemu support for mcimx6ul-evk machine
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-arm <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 5fPlsmXE/fgV

On Thu, 14 Nov 2019 at 11:17, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
>
> Pratik Parvati <pratikp@vayavyalabs.com> writes:
> > $ qemu-system-arm -M mcimx6ul-evk -m 512M -kernel output/images/zImage
> > -monitor stdio -drive file=3Doutput/images/rootfs.ext2,format=3Draw
>
> Currently you have the monitor set to stdio so you won't see any output
> from the serial port. You can configure serial output to multiplex with
> the monitor with the command line option:
>
>   -serial mon:stdio
>
> and toggle between the two with C-a c

It should appear in the graphical window by default, I think.

thanks
-- PMM
