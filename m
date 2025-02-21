Received: by 2002:a17:504:5c6a:b0:1be9:327d:8ee3 with SMTP id dm10csp203468njc;
        Fri, 21 Feb 2025 03:07:06 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVCBXqyYCHR0pPPToIHi926eKQRVAIHLv0QEC77f7mckMzbtfmvfS2FamfN211Tcz8Bw7bHI08q/e0qeQ==@linaro.org
X-Received: by 2002:a05:6902:2009:b0:e57:4226:8ae0 with SMTP id 3f1490d57ef6-e5e245ea305mr2019506276.18.1740136026709;
        Fri, 21 Feb 2025 03:07:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740136026; cv=none;
        d=google.com; s=arc-20240605;
        b=QMHQhqysmoVoh0gRTjf9AmptK0M6HNlhtWGPKn+MhNyV4AfnvJIVip8xks5ao48bPD
         IWBvurod4aGghvczUbSNhTxznXFvYH/3RDvp5CzdHXJv27ntM5qyU6OiadCsYft3Od9p
         0kfHsiNuQBdrSdCEsYUobXHE+/tGR+avHegs0hHILa3x5JUBaiDTlZgRl4Y29skAY2nx
         xg0vNRjPQbusy9jW8z8q5etx6R7JJzQvPqjUMOGVsfcByInGSCBHN0MCVT0P6xcOknUk
         e74yxAcYw6Vfd1zTGHA8ZPGhItBFUzRCRyUsnBesUbK/YPX0Qi9Sb/yKxL1XWfWiFbOU
         HFbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j0iuVL5uRNjEBhv19j5iFrLDzJIsMvGVoVmD/PbvVyM=;
        fh=I78lkKmRgiCsM/GLrzg4e1YQwCitZjx+v70E0Ushnhk=;
        b=WGrR3loSniw2FgB/7NTlkXW+V7lS3Lzste4KhsmhxpX9gv3mUyxi1xtD7TA7YxP9MH
         4MewdCTVWNo6qC/Fz2V+Qnvfy3Oca/MTP/av/SQzZ68Hr31UvIx/diCOM6a0FqNrH4ip
         JerWmY+icGz+4I+yD7mrK6rp7fHv+pfkE8Ijm2yBnpKe/ax4iXNXdytI3WVnmU7s2aNs
         uJQK3nNAO7Y/7a5Cc0wOv2ayOVOagvVIHR6OVae5Wb7bZkzA/lF1dVcWmYmd8/I9muTn
         bOtFzcBS+YZFMVZplpNkfNUvF/UhvzqX15r9MzaDOVZhtDhcUPXzR7vUnG067Y6rsTqM
         zV9A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=msMZ1SlS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 3f1490d57ef6-e5df9014425sor3939809276.8.2025.02.21.03.07.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 21 Feb 2025 03:07:06 -0800 (PST)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=msMZ1SlS;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1740136026; x=1740740826; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j0iuVL5uRNjEBhv19j5iFrLDzJIsMvGVoVmD/PbvVyM=;
        b=msMZ1SlSjPeerTq/IukD3WntWg9GBRKYdvP5Uv4aqNOUG8fFHektIvjeByEoDC1O/H
         F1cY/ao/lThYrDGRJf+Migt5sJxV5ncMciwc4jFfhwogfMtck+2fbA7hla4L7F4o1WhV
         ZiWd6Lz6w539VCQ88wfyBQ8VAI+u5dZuMaXvBh+n9s6W0jEi49TZGJZ6F5PRNbdFSEto
         l/MQhSPb+71yLjTV60X0D4RwFBnZkywJx1oNMUx1yguv3BDiiFbeXOBarxGHM/imYwGl
         9Jlk5oQlWfCXDwwxHYrBKHOUMNp1CpZYL4ZQF5jxsahAuHlAbT7nCOoLmlMD509kDr+S
         ZdOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740136026; x=1740740826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0iuVL5uRNjEBhv19j5iFrLDzJIsMvGVoVmD/PbvVyM=;
        b=BfnE7o9CnuSZphYYcqRV5fDrZxlE8J/qAy7otY/SRbVy1dK+jG56zbTZbdUcBDb7KC
         WY8Ff3+wpYW+yH5eogZ5wNVf11xER+mii5n5G4NUg+XgeIWwVlC0p6JboBEkYGMyCTdY
         Ezqf/z1Z6+UgrVnvWVM+nlkoQHCa9FfclI4LihWq1yQqDdqH5Q+q+IUDny4T/1Hae4fU
         bAt6qkUGH+A6is6MoY6jcjNxDBz0oLU3r26d4acJ3nGP93T64T+j8CZA97itgDurAU3x
         +q5dMGcL8QMcR7PtysaVROn7su4dpT2eR/4g1d3a68a5wdCLCcdba1sxWT3+YnkNexMu
         FCAg==
X-Forwarded-Encrypted: i=1; AJvYcCUeND2BXUAAID2dtQLhhbz4H5hAOaxt4NC3k/LPwc+teXg3zH/IL/tLDpT/gITLjo4yy+PAyegBnixfNw==@linaro.org
X-Gm-Message-State: AOJu0YymjC1/SXv5wuiwZrjcNzV6RL1jAkgTUbndYwAOZj95E/q68kEc
	SRtyR2Omnppj8rUjb1NyDyOA43IXJlT3AJt7MV6D0VbdObR/y/JoexjYz/Pc+hSjrIhyE60sPGm
	BFQwz393c7XM3kp3MKbPCE+AMn3ihCJ/l7UNaqCmWJB+BOqDXhOA=
X-Gm-Gg: ASbGncuY8XKwd1S7pqmXEHbZ+uXF/b59oI/LlwjK++CWOuSqoTduDAyhfhZJ+F5MFvD
	Hr8Ws8G4AwhD8i9sgE9sqZuQArbhvThAZqddwo1V4RGj9xaIHdKh2epIsxlgiMICcrUlcDN9CK6
	0SpBmVE2Sn
X-Google-Smtp-Source: AGHT+IGkVfCQCiWgAijZabMDhvzMoHvNhaxzdOpdZB/iuv4LRgBX3V4rf+B1zkpNP9suF4jlznuqxVA1kClW2zqHygo=
X-Received: by 2002:a05:6902:2009:b0:e57:4226:8ae0 with SMTP id
 3f1490d57ef6-e5e245ea305mr2019479276.18.1740136026267; Fri, 21 Feb 2025
 03:07:06 -0800 (PST)
MIME-Version: 1.0
References: <20250204125009.2281315-1-peter.maydell@linaro.org>
In-Reply-To: <20250204125009.2281315-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 21 Feb 2025 11:06:54 +0000
X-Gm-Features: AWEUYZnaaduxKBn4Kxvc0587KaFp95ZqpGxb_reG_aFq8vhRnk7oix-28vY84hE
Message-ID: <CAFEAcA-y7hERhCAE0wyxR=HsCpmq_T3VQVGPW4B4GvwvrMMP0w@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] target/arm: Implement SEL2 physical and virtual timers
To: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Cc: qemu-stable@nongnu.org, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 3+2sV6yp2Dvl

Ping? Patches 1-5 need review here.

thanks
-- PMM

On Tue, 4 Feb 2025 at 12:50, Peter Maydell <peter.maydell@linaro.org> wrote=
:
>
> This patchset is a respin of Alex's patches, with some extra fixes
> for bugs I discovered along the way in our existing code (and
> a bit of refactoring to make the fixes straightforward). It is:
>
> Based-on: 20250130182309.717346-1-peter.maydell@linaro.org
> ("target/arm: Clean up some corner cases of sysreg traps")
>
> because it wants to use the renamed CP_ACCESS_* constants that
> that patchset introduced.
>
> The bugfixes are not super exciting as they mostly are oddball
> corner cases, but I've cc'd them to stable anyway. The actual
> implementation of the missing SEL2 timers also should go to stable.
>
> Alex Benn=C3=A9e (4):
>   target/arm: Implement SEL2 physical and virtual timers
>   target/arm: document the architectural names of our GTIMERs
>   hw/arm: enable secure EL2 timers for virt machine
>   hw/arm: enable secure EL2 timers for sbsa machine
>
> Peter Maydell (5):
>   target/arm: Apply correct timer offset when calculating deadlines
>   target/arm: Don't apply CNTVOFF_EL2 for EL2_VIRT timer
>   target/arm: Make CNTPS_* UNDEF from Secure EL1 when Secure EL2 is
>     enabled
>   target/arm: Always apply CNTVOFF_EL2 for CNTV_TVAL_EL02 accesses
>   target/arm: Refactor handling of timer offset for direct register
>     accesses
>
>  include/hw/arm/bsa.h       |   2 +
>  target/arm/cpu.h           |   2 +
>  target/arm/gtimer.h        |  14 +-
>  target/arm/internals.h     |   5 +-
>  hw/arm/sbsa-ref.c          |   2 +
>  hw/arm/virt.c              |   2 +
>  target/arm/cpu.c           |   4 +
>  target/arm/helper.c        | 324 ++++++++++++++++++++++++++++++-------
>  target/arm/tcg/op_helper.c |   8 +-
>  9 files changed, 296 insertions(+), 67 deletions(-)
>
