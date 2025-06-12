Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2432059njc;
        Thu, 12 Jun 2025 08:36:04 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWJ540YHV1R02HsV1OyaQW15WXmXHyGOa1hRVr6wvrgY00R+C0RXW2JrRfur8oZ6TsMs+d3zhanelorvA==@linaro.org
X-Received: by 2002:a05:690c:60c1:b0:70e:53:6741 with SMTP id 00721157ae682-71161f29c02mr4771847b3.28.1749742563610;
        Thu, 12 Jun 2025 08:36:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749742563; cv=none;
        d=google.com; s=arc-20240605;
        b=YrRsOxb0SkVa9kGJm6FEgIxZE3wZ3s2d8io58Vuim0RZftzeVTVajmDH3JTqmlg+aI
         1yW7tqNsu+/XA+xZFqT7XTVgdsc4DYOTEm1T4EbcBs8TwNXjzd2qRCtw3wg4wJzU/5J1
         zJBGc4gu3AFqdWQK7E2fk2taghoXGAMK/fsB9Zd6DLG5/O7LMZJWKlYemXaWgmOIvFPD
         E9yDZSxtr1O0Y2vbXEhjYIBs58F0JgOitLt210fuMtnluCL/ueaNlt0UfZ97RL0ZF0Mf
         NEhh4EHLzJ2nsiOh8Z4Us0gGz0aG/NPV1d087cPLObMAmmzde8Wl2ADQIPUVNuglBp9w
         TbBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=pE3dXpj0aU78BzL+r7JOJkXrxfff4V+18vm+u08QL6w=;
        fh=wX2LjRRneB79+BxHe3L9c6HWHsP3eKbuQUar1I3uMoM=;
        b=VbWlUTnQbXMGacHikx5YkpcJm07EsvyRCPvN3NHCuzERdpqog62LsFFLTgGxP81JH5
         cNdgp4iVDF38XqifYl8wHbUU9H/vIKHGuyBBakA6xqm/QmDu3TefKmIjFe5FNguW6HVR
         LHgfN8lJpnyZZFajthGI1EQWsw2JPlkUhcMm2TE68YbIsIhlaNTlNmaDKLSyToajs5wo
         vytYHEaE6Ep2MA2RZl7RUC9boU6mZTzQr6rkK0XUfRzPwmr6T2oDBU/Ghgz6VeVlEM0Y
         060uGx0ivt2aHFHT+rP2eNeseS82hHEw2InVEgU9SJKOk47WLSSoqFl/y6X5sB6jSM/G
         zi0A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gkHbqlY8;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-711515ab339sor12834047b3.4.2025.06.12.08.36.03
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Jun 2025 08:36:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=gkHbqlY8;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749742563; x=1750347363; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=pE3dXpj0aU78BzL+r7JOJkXrxfff4V+18vm+u08QL6w=;
        b=gkHbqlY8yu3IFfv+rtXl0VtneDLhsjlIDBHvVubIY1FqnG/YToE8jV8J75yF3rMTRI
         N9ZwWE4baatyJdpCOzQOdXSqp8LAnFdngPj7zjqckdP0zWLWuompi5EMbq4ARxCGhIF4
         hchgzodBCH6lrE6h68lmLvxHCRl1MllkdSQEb+noIZlPyQUDbvSWOyn+S5zpy9cCQdNx
         eFHtn/OGOgzVbzt4ZSDRzZyZlMAgBM73MiaaEyxInPjdh6KZswdsvWo+b2TgBt1MJwMx
         B7s2MJHOW8CpNTJIgyrY1d2IMUoXKalmRM3ANj4VYLQCYTywHCwoIvtbkFqbOdQJpcR/
         515g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749742563; x=1750347363;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pE3dXpj0aU78BzL+r7JOJkXrxfff4V+18vm+u08QL6w=;
        b=nKTJPIhNaUQzh+VrACM5GWeUphcj2yorL9beEPQM8axlwVo4o4DCu+zXwXDzbKIErg
         VkxQ5Qz6wvrJeXHOxjRfrGrOehDxfdUKv0+7BbRjvYn2jhcIv8+lctyrIOtvuWfwsh6v
         SMDxoumJKMdCT9bJE2Zrr5BywCwimiWHLdq2AU3UrtPKIUBhPEY4uqOKhrl01r5xjUp6
         1y+8QQq4Z2mMW8ATFgqYubC8b2Z9bYoYM14031nhdm/s3pxG0m5rJpbeaU0Ri/Zbz3J5
         2tsIlLlN6DEWVbiAFApqQkwwPN7uDrkiiSqRHo3+90tftz6QVA03Ccp3U6tBsAQXA3wv
         +xtA==
X-Forwarded-Encrypted: i=1; AJvYcCU/qzPQjYU6qNHYA0WQxH2X1bf+nfkLaUBv83AxWWrCvSOx5pc/nUCeLVTJQGop8SRgXBUjznZnlnzlWg==@linaro.org
X-Gm-Message-State: AOJu0YwN7mIz3uMdyBBsnB2TRIgh5owUQEakSlhqWuey1IzzV+xvgyVs
	9HMGN4n3HqiLpUmckzoRzGCxBwREdKDeR6D7i6HLIL0ll2XtHelGceGds9SDCtVdot4Gm6Szu34
	a4Uw0eHMIOXCP4hAfCvjndOEkcqLNXSWypBTvFQUsOMLx
X-Gm-Gg: ASbGncuf8DmspL3unntx4PIpm2FJChHsAq4Nmw0S4DwZb/7q3kfCUkA/zXeieFJkpuA
	FfmZj2jsPwHWqH1AsT28p01lsuWzIvYY+ML7cF0T3fT0v5PZuX9oOKELGiof2D6cBbJUfUP4Bgm
	yrvw3I9sEPYo9YS7xgUVmGGACZa9Mdx3lkrPBaaXHWTBlV
X-Google-Smtp-Source: AGHT+IH2bhKZzKb6cAcO9aAfVWto22hSljzV0S+7R7pK1D5q7Y11fAWUU2asfygNKJWUNlKlB22V1KDNnY4CSfoYMMM=
X-Received: by 2002:a05:690c:6203:b0:70d:ed5d:b4dd with SMTP id
 00721157ae682-71161f29c5amr4894467b3.25.1749742563057; Thu, 12 Jun 2025
 08:36:03 -0700 (PDT)
MIME-Version: 1.0
References: <20250515153907.151174-1-cohuck@redhat.com> <20250515153907.151174-14-cohuck@redhat.com>
In-Reply-To: <20250515153907.151174-14-cohuck@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jun 2025 16:35:51 +0100
X-Gm-Features: AX0GCFtP59qPc4EAjuw9klqXVx2ltBaNeP6BsMTmWbNtC3d5QuHXLs0a9yWRCu4
Message-ID: <CAFEAcA_Ju4QBUwiOyt9thPxuAFMcm6jVTZHpE8FFJeed5cJgsg@mail.gmail.com>
Subject: Re: [PATCH v7 13/14] arm/cpu: switch to a generated cpu-sysregs.h.inc
To: Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, kvmarm@lists.linux.dev, richard.henderson@linaro.org, 
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev, 
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, 
	berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com, 
	agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org, 
	pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: wcX41q1PokBV

On Thu, 15 May 2025 at 16:40, Cornelia Huck <cohuck@redhat.com> wrote:
>
> Generated against Linux 6.14-rc1.
>
> Reviewed-by: Sebastian Ott <sebott@redhat.com>
> Reviewed-by: Eric Auger <eric.auger@redhat.com>
> Signed-off-by: Cornelia Huck <cohuck@redhat.com>
> ---

Does it make sense to include all these extra registers?
Some of them are not simple ID registers at all,
for example ID_CCSIDR_EL1 is an array of registers, not
a single value (in QEMU, stored in cpu->ccsidr[]),
and CSSELR_EL1 is not an ID register at all, it's a
normal read/write sysreg.

tahnks
-- PMM
