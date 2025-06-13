Received: by 2002:a17:504:5d2c:b0:1be9:327d:8ee3 with SMTP id et12csp363095njc;
        Fri, 13 Jun 2025 09:08:41 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUk+nLwwIl3BKD4RuUJljKBa9kkn3gyASHs0N2tc/JlILQf3Mtby1v062qvZSzlzeY1R+u/0uZgwh3H8w==@linaro.org
X-Received: by 2002:a05:690c:650a:b0:710:a3d4:ed39 with SMTP id 00721157ae682-711637fdd45mr57855677b3.35.1749830920833;
        Fri, 13 Jun 2025 09:08:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749830920; cv=none;
        d=google.com; s=arc-20240605;
        b=FkztsN6U3WH2Ptk6Du/vT4x2Wqx98m4IRvcduMvXjH1c6u4f0PjwFpm862mjUEAZ7L
         aml6FSEjHnYcdCn5+Z/vlLsTbT9fU9G93f6gOemmNLJlscaEe9D8ge3Xou6xExKV6KX7
         JC2bRrK4JOe9Y0Wq/YVZi7ffKFtn/0UC8FsW8LZz3EwDRnopHhOkOlsQKsKXV6KgClYh
         Uujcu2nrqYMq/VDhBPzgPR5iYFaIJHEOAx/YEB3RaZ7XByqbfOxzZ4ROSfkDliqPCKeQ
         Y7qWTEsYqsc+kXhk0QS4RfZIlzQ2LXJZyVMoHIXpnACf+eW4299TAJk61AJ9Ntw5aeof
         bGKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=q0AGVEj3qEhFG+8N5hRJQD66tcaORTK0Qv/mJVuZYFI=;
        fh=SRtk6DZPPWG7Cp4IGT/CJ5oWMcrf9L9dhgQqoyDIb8U=;
        b=bhexddblVmdfWF7p3zlyS/mq4yRAOCDe862VUPLzYro77zyFxDVgXOCDF8PqEKg/dG
         hXLyB+whPXMmEmu3vg3rvcQawuKVRL1c96pR5fyhxeh2bUx5ICa63lf+Yx75jFgnO19u
         eP1hFBB8omWDIwn2HUScXZFfu/B9iQSINOHOQxoiBuEprCQz3PeLvCBb6JS//13/hdE9
         ie3uYNy5IlsHJXFU2kz1ARWDqXfCq25HrrKq46FB3l69pzQPxvU6oqUxy716O3l0593q
         LiOwOtmOuk1BLVpsEv6XmvVnEE4WfEo7bXqWs3ehDoug7+/GuBQL84mmonrmpVNuPKqT
         oa4A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kuGdvP87;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-711518ebc23sor25250847b3.14.2025.06.13.09.08.40
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Fri, 13 Jun 2025 09:08:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=kuGdvP87;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749830920; x=1750435720; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=q0AGVEj3qEhFG+8N5hRJQD66tcaORTK0Qv/mJVuZYFI=;
        b=kuGdvP87oVNPhhoD845In4T+muwt2uUNq9zQRMmw4JPsC9vm6Dgm54epGJbCKtekL9
         CHSgYSr6Kx950ZvU3XM6xr478QxVzsf779oHHXDHzvI/VneTnUBYSzycmWwLU0hcIPrM
         LL0Ca2+AwmKyBjxZBfI5uP+8ulzsxV+2GqSWXNre/LAVUSvFHmSL9K9oMFQzLwbkYcqT
         nTuqa7G1OQQxMBaWP8b4QwrEdWU37OajSi2c96bEE7ZpDbjq914Jyz/Rf+1JEhAKqAJO
         yMh8wj/fePX+YwibI5El3RICaYrRQQX48JxMH8h1s0iTapUsCpyoVpBKWCtrScHFdCWh
         QknQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749830920; x=1750435720;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q0AGVEj3qEhFG+8N5hRJQD66tcaORTK0Qv/mJVuZYFI=;
        b=TC1OAKSQx2KINBG4IRV/s6xT4lokAB2VRhrUpkpCS0mhJ+dbfd5M9qbJpQYtHvSrxg
         +rXfpadaWccHG/6PwG08n+4o60KYybdrlV0ENagvgN6OHqwtcRGx1dhhuECJzydBvE2I
         q713c/OrE7X+qTCzDQnhniyOjzRIJHmU5Xuhf9LZw6tVTISUrdV/RxFm7p5JiiOIFjnw
         GQMK5QCmWQzLILIK5cSaxpjipV9pMXtdhn1bu2/OdZe7QpEj3eBMd/XnihiZ7uJQAL1b
         f1e5H9gSECPUJNlymYco0/otSbh4KabY/U4W1edrBP9whdXQK6WK87FmLnPpY4rygJDZ
         tVJA==
X-Forwarded-Encrypted: i=1; AJvYcCVwHN1cfvPW4+E+rqZHKzFi3lGfwpGQgbcxi5xwTgxzgxZYYoSrl2fitLo/As0SHgzD2xX0cPwDJnNK4Q==@linaro.org
X-Gm-Message-State: AOJu0YxIljIKQY0dqh1a6PZTvGNmvtY+urZhcolZSYTT/vDz+dcs2AY4
	2a8VmEo8LwPSlW3ceR0jOamoo5/4EY56h2WwVs8ZjdpB4tcqd8k3791jQP6PZsXj9y5pPxzNZ6b
	ZflMPD6xHtoRIqtV5vVl2ayT+kqz9t5R/EQ62dUJfl3ZC
X-Gm-Gg: ASbGncv6osDYlnWID0xT23Fiu7jItftoKmDSND7JyJ0T9Hids/pmPnMsUJtg8yL2OSg
	VBIxoIZol2qZZBxOqaClNyF99MoF9ybV3OR0VkReq1NYWN/kyDwcZWQyA22qLbHsvilyMQIq7Sf
	PqEyqcj1NixetSV9LGXkpLgNQCo8o7CZV2OVLHbFRUDCD+
X-Google-Smtp-Source: AGHT+IHElaU3RUXZGp1oeZWJCJPSrUK/n0tHMa2uBoZHgT+aAWen+V+PnRFJAoQg0vBu1VZiHvd4z51Hi6eHefpTBI4=
X-Received: by 2002:a05:690c:dc1:b0:6fb:1e5a:fcdd with SMTP id
 00721157ae682-711637ab1e3mr54822697b3.17.1749830920354; Fri, 13 Jun 2025
 09:08:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250612134338.1871023-1-Jonathan.Cameron@huawei.com>
 <20250612134338.1871023-3-Jonathan.Cameron@huawei.com> <CAFEAcA8eC9TpGyrMARRUWs4q1o7LACD03zLAwPnTRU+m98LrWQ@mail.gmail.com>
 <20250613140954.000013f5@huawei.com>
In-Reply-To: <20250613140954.000013f5@huawei.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 13 Jun 2025 17:08:28 +0100
X-Gm-Features: AX0GCFtBfo3kmQAF6wwgQG8QxEjF53UX0ugXUJJfukHAY7fltSOjcRO4-bqAPPo
Message-ID: <CAFEAcA_ZbAnUS4Ufa+jsOgj6aeRS5JHJP=scw6d0qXd3NNtqdA@mail.gmail.com>
Subject: Re: [PATCH v15 2/4] hw/cxl: Make the CXL fixed memory windows devices.
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: qemu-devel@nongnu.org, Fan Ni <fan.ni@samsung.com>, mst@redhat.com, 
	Zhijian Li <lizhijian@fujitsu.com>, Itaru Kitayama <itaru.kitayama@linux.dev>, linuxarm@huawei.com, 
	linux-cxl@vger.kernel.org, qemu-arm@nongnu.org, 
	Yuquan Wang <wangyuquan1236@phytium.com.cn>, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Alireza Sanaee <alireza.sanaee@huawei.com>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: QNYLB/tQk5s7

On Fri, 13 Jun 2025 at 14:10, Jonathan Cameron
<Jonathan.Cameron@huawei.com> wrote:
> For these specific devices (the fixed memory windows) there isn't
> any state as they are representing fixed configuration of the system.
> The state is all in the host bridges and beyond. I'll add
> a comment as you suggest.
>
> Currently CXL emulation is completely broken wrt to migration and
> there are some known issues for reset as well. Both are on the list
> of things to fix. Migration is less important as the only current use
> for this stuff is running software stack test cases and for that
> migration isn't currently of interest - that will change for some
> of the virtualization related work that is just getting started.

That's OK as long as something somewhere is registering a
migration-blocker so there's a useful error message if the
user ever tries it.

-- PMM
