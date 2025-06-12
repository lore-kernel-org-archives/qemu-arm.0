Received: by 2002:a17:505:ba85:b0:1be9:327d:8ee3 with SMTP id zs5csp2432365njc;
        Thu, 12 Jun 2025 08:37:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXan8s0h9Q4gjwl5gLCdKy+I8eLcq3SrIzx68iizKQ/caQdEZZ582nt6dcSdJb0A5m59j5tgktSUt6T5g==@linaro.org
X-Received: by 2002:a05:690c:7007:b0:70d:f07c:f593 with SMTP id 00721157ae682-7114ec49002mr68589037b3.6.1749742621477;
        Thu, 12 Jun 2025 08:37:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1749742621; cv=none;
        d=google.com; s=arc-20240605;
        b=aM6id8NsLJi6rLZuH35sBu5qGvJsTEGo7uLQ8zRphRAKY1GkG+ieO8JGGanZDUbGxc
         zvO7Cs1VyBpgaRssFO7C/tZjXbf/p0Iw3oW5F2nEEB2GA6XcUN6jWlSmnn1fucLy0w8Y
         q4pIEkLtik6+aTUsXcBWLrM+bhZmVxUYsBpeQCN3Zb5mgnu47avS4X1LX5zmH2JnrBEK
         Xxxvjko4SayJnaPGb99TBi0xvt3CnUdepGYYju1LOcZVYm8GUQeg7BBdSCOqwRbq1Xdd
         PdsCzDzl8dZ43GUgGtAmxmTwOzn+Qkc+WDx4oJ+I9+0EAEELWkEykQsScyRgf00+crS9
         I5jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wUzfaRCNXWxAipjWVnsPLleFiVr/W7oIJEdJrgXZxBQ=;
        fh=qhfJTWQ0fzUjuNxOVoB6jGuXNfHaQ68gDw3tIRun9Hk=;
        b=VfYJD688AFt73I1wekf+HB59w8oblJSaf/6VgN9TOUEtX2QWpiwpwLV29QfsGTnVA1
         RY2dfjvLgY0I10GK2cK238qGvAU/p1H8XUBDNRsCh6fAgFkeD0sgqm0HOinn23uSSY1z
         29fvXn33JynldEj3X+vYhyel4L2C9vp71kC6iQqdTZYLhSeWfLd+dN1HdpbN31fLn29Z
         8j1bplIUQ1HK/NODqAO2DnlfZ8K8czp9smof55MC73xcFlCxwLza2KWVAr+PaV48dNYH
         Lp/XipykYBkEclNlm9a4xLs7iNgHmD3t55Qy96vqT6i3OG703gFF6R91f3eaSrSOcLBM
         8GAw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mn6XI6+9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-71151934700sor12305327b3.14.2025.06.12.08.37.01
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 12 Jun 2025 08:37:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mn6XI6+9;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749742621; x=1750347421; darn=linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=wUzfaRCNXWxAipjWVnsPLleFiVr/W7oIJEdJrgXZxBQ=;
        b=mn6XI6+9BZY1wNXidXjFi3D5Nwl4CdfnrGG8Hp6LlM1xDyjgPP6S7ruserg/xa8cfw
         W9Qk1vHLKNeVtPJ/CFoV49FN60oJDucWLtzWIpOYECKo6H2pPAiCBhFTey/WXGyEd46g
         70+/zlwiKTvk6psjOpUvdCrv3QwaKgRkZCb/wwYgQyjshp2idlGzuMXR1kudPEMiSlpX
         0EhMn0iDWbJpynRGGbTvpd+XjbdS1SqKa15Phme+3jsOpMbMVXOZMkciyx9MMZnTKrBj
         rVvsALsHP6I9sgaWHcu85mUtwA4UvTgbfOAL3oCKC152T+XmaJUrYlRz7db/bLC1P+4q
         GpuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749742621; x=1750347421;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wUzfaRCNXWxAipjWVnsPLleFiVr/W7oIJEdJrgXZxBQ=;
        b=FgY5NB57pmOURs6Ugttc65KzTAJLjLYtNsJnyDxNxp6wTE4OJ83cILRit+18u+uAbK
         A8DFL7YmEWyN8TmcYlf6hP4nj4cEjWU3rjnsMUBSTeu5S/ynwKOniAri1+o4HCubJqbH
         ibnJksxwIdvGttXCVF+s00K2M0gegAH2UngLvk9mEAWMNMvQ4Ka7hmxtlJfHt4ZACyRv
         PGwKiZqX4OLq5MhU777qJ7+pelETBVq3Kzd6/XSZACKx7/wHACMYlsExrI+WcD3HFnX2
         gqt5gXS985g/qV4KByNT+7eyRku9OM5/482OBQreGi4jM09U0UUqRaXzIRuWO8GuNa8v
         Vkwg==
X-Forwarded-Encrypted: i=1; AJvYcCXVfa9SzIXhARaniCKnfOg1+AGodrO70eu6PGY9lhXbgSQ46Nasb4elZFvZi8gmn3xn5zwmZM3G4GbpWw==@linaro.org
X-Gm-Message-State: AOJu0YzzKpO4XbFlmTzhwedBIeMDCdBCXeK9GdfP9W4+eg/c7fRqULDM
	x2po3CUyPM4sEl2eh9Rq7ySdzNW7YhufNn03/bt0dBTKQfzHZQcLoWO4RLcjZBnuTzTPY0bcMX3
	oXl3vm0paRm2COL5MkmwcTzddnBTvFVUz8q3uGD3gf5R5
X-Gm-Gg: ASbGnct97s7fTv3ewfCjC4p0DrtrKUIp+m98lo6EFtRLMILo6Omr7tb8pTtHXQPg2ww
	Jl4IzLHqIOVK+ArY0nKu3DyFKtXe8x1ocgkW4JLO6lKL6qQMr8uhskTbJBYYsRdjcOBQaZ5L5SN
	TVofE4TyEo+jg3pYXD/6AvIhYFlLZxyPaHE+uLB+tjpfuq
X-Google-Smtp-Source: AGHT+IFAtm8qzr6DZ3uaSYxOLv9IeVEoJWiRE3BZrwJ8yLOpfYVXBv3GPKSCSeTz/MFg2VqncxBQeUgBAgmpJHSNC0I=
X-Received: by 2002:a05:690c:6f04:b0:70f:751c:2d8a with SMTP id
 00721157ae682-7114ec48108mr60341587b3.3.1749742620984; Thu, 12 Jun 2025
 08:37:00 -0700 (PDT)
MIME-Version: 1.0
References: <20250515153907.151174-1-cohuck@redhat.com> <87ikl99oxg.fsf@redhat.com>
In-Reply-To: <87ikl99oxg.fsf@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 12 Jun 2025 16:36:49 +0100
X-Gm-Features: AX0GCFvQWjJwiT3qdzhS5zCC8eN_284PdbWsiIoJoiu0vOTKgt6QJf-RLSBsf38
Message-ID: <CAFEAcA-t09k_mcZhHRcHZQqdTfzn8-E3vjGoL4ViFfoZmCBk5Q@mail.gmail.com>
Subject: Re: [PATCH v7 00/14] arm: rework id register storage
To: Cornelia Huck <cohuck@redhat.com>
Cc: eric.auger.pro@gmail.com, eric.auger@redhat.com, qemu-devel@nongnu.org, 
	qemu-arm@nongnu.org, kvmarm@lists.linux.dev, richard.henderson@linaro.org, 
	alex.bennee@linaro.org, maz@kernel.org, oliver.upton@linux.dev, 
	sebott@redhat.com, shameerali.kolothum.thodi@huawei.com, armbru@redhat.com, 
	berrange@redhat.com, abologna@redhat.com, jdenemar@redhat.com, 
	agraf@csgraf.de, shahuang@redhat.com, mark.rutland@arm.com, philmd@linaro.org, 
	pbonzini@redhat.com
Content-Type: text/plain; charset="UTF-8"
X-TUID: d7est0dq63eU

On Fri, 6 Jun 2025 at 10:53, Cornelia Huck <cohuck@redhat.com> wrote:
>
> Friendly ping... anything else that needs to happen here?

Sorry I've neglected this for so long. I'm OK with the general
idea, but I've commented in a couple of places about compile
failures and other things. You'll also find it needs a rebase,
there's a trivial conflict in an early patch.

thanks
-- PMM
