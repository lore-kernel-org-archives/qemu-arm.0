Received: by 2002:a05:7300:232a:b0:178:84eb:402c with SMTP id r42csp3033804dye;
        Tue, 1 Jul 2025 02:50:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX+C0SbAQxc1w45dwX8ip9CoDxEBBsT6m7RVPDwSz57c9uFXR9ejRbI3Ynqv0DTq1icnKeXc1tpyFYEhg==@linaro.org
X-Received: by 2002:a05:690c:3691:b0:713:ff2c:a7aa with SMTP id 00721157ae682-7151719b132mr260633537b3.31.1751363406561;
        Tue, 01 Jul 2025 02:50:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1751363406; cv=none;
        d=google.com; s=arc-20240605;
        b=AdOOV4dnPkroyZJf0LxXU64NJjrZ/2E7VrD1/FSADGaSu8kA/bjaN8Qwgl/tibFtTR
         4KXq1bxzawcM9YbJGmkyINgzXJLsyvSc+bioAxahbX0tFyvNPo+zTcCYXeyC1yq/P9lP
         Ngi5VDGIgqEiEHixm4bNbGLO77aVqSKuD/N52BAamzA9R5xR7l1AUit7wPHIdZg75yyK
         1KpKwhx8MaLuSzTuqMghEcN1YFSZD4xIKnIWLINKCK1F0zdWNXPWgyb500qxaOuSpY0p
         hfVeSGxRLrVcDKucRXGw6V6cq6h6PmH345R+PyI/7l2fqIoKrmoeF1wsl7QTk3AiG49r
         m8Dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=L3ead+uizm1Vc976UnfrINanFTxCKtIjchE+tw+EPsA=;
        fh=HFNhXL6MstgvXhHccbj+32U3iet7fYuxKIDeqEj1oXI=;
        b=Q1+CvFBtcnxgwsAht4AOZZueJHu4INW87GHtNtlPWt4kzdVuCOS5KKLwYVRKz/luAS
         F7zCKseW+h3JImlfBD4GVtlAUqVtFDAbb76Og+AUELaO3XlmT0PBGWb0DK2AKTn6+r6J
         SLq10D3loygrH91tWMUiJnru/sWCHUa/H1vYng/6X30UuYb33w1RpJXmOXM5eTBlYztQ
         FvzdpU9i2+EdceFqjvKIFNr1hQXEmazo7bM9SE35vgtlMlDvl7h40diKGBvwVAWSTx65
         37dZz9HXGR/kdE4dC2v2Dty+/Jt8T5i5vjvFXqzJdtJsP+hWLh/ohAes1COtSMuqm0UK
         zpVA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VBQeMyzQ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id 00721157ae682-71515cd0b3fsor62728747b3.12.2025.07.01.02.50.06
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 01 Jul 2025 02:50:06 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=VBQeMyzQ;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751363406; x=1751968206; darn=linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L3ead+uizm1Vc976UnfrINanFTxCKtIjchE+tw+EPsA=;
        b=VBQeMyzQ8Vb//a4LqPey5O04CTiXmZ3RVGZKZiqg5bl7TcW0lqfdafZ6fQcs8vej9B
         K6mTiOBxQ0CHealHifcM4rnaTilM2uuiPXYHh2OSS52X/bv6YOnvolfLaK6DO4jKD5LT
         7NsQnt1wWbUq4T90i9ScNcPFvi7s8Dm8Go2DcGmbDWbj5nnKk8p4iFc5j7OUBZ1dQFxU
         heywD1Kt766cCN02xnzQzFqUI6C0vHU4V31WRYKHDIyXpJCG/Hk4roDWmrJOdDYl/VsO
         3yAbgABRkcRwCBqdC6zB19HCX9htjoPWAqoGnQ8YoczhOJN/l1AgYKOJ8HKY7pJ7tI4U
         xanQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751363406; x=1751968206;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L3ead+uizm1Vc976UnfrINanFTxCKtIjchE+tw+EPsA=;
        b=oifU0TICSeEYS6jbJ9lPwt6n7FLGAKBwsVDPZjmKCHtaLUKlP1+9w6kHFzqItvu1CX
         t2zhL34CPqVKS/eOkEndgGz2PUepa/f4xiPJ53inDMDUzDD6sA1rezgIPeIxFCwPL3/K
         7at1ppCbxAHgodZCL4tj8ghigWw79M5bLqQqOomysyx7actAz2vPVOIp8s9wo3yYGkw/
         cwpMbe3XCH4Ba9F2mN+JDR49gt4/rVYL5XUZx4YLxPpJ/rt1LVcH1qkT+Ff1GCxQlLjz
         Z/Rv7tDOY0pX2n6w32CCGQYtHQXVK7yIed1w7uv0IesOM6q6wey/iyeSPHAVldDrFY3G
         ebyA==
X-Forwarded-Encrypted: i=1; AJvYcCWCNhncYz4iNqUfJ23+Gnh3vtlQIR4fZzz67grrU9P+MEw8zhOs9FB93ghnE623qEyaaLMFYITS4tIFNw==@linaro.org
X-Gm-Message-State: AOJu0YxyLm4PqxYw2VbmWj4sGg3tw2OiSLUAcsjdL0kdCnWIY0LqHCcy
	GF8vkxIgFrES6h+8PoEqjtfOns1+vK+Tde/V4djg/PUc71j8gmCRDF0LMAAT2F7MJvQFg5+74oB
	zbcj9TKcNEnqvHr16P+33Mw9Y4NTb8dxmno7kSEIE7Vqo
X-Gm-Gg: ASbGnctpkR6mh5JOHDKDwkWdv6CG+GL8JEJt6A8aBPro7Q6nolNze8JDIgwMXbajAmt
	3Jy6oQa0iwRGyWKTRNQcw3Ev747iXO5+96My8IztriF5z3JCZ0JZMelPyu3dOGghDQorgzeg2af
	2/HNrlZITodXvu9EvVVnqXTeSGszYRAH5XCS0y4VbtAIkj
X-Google-Smtp-Source: AGHT+IEgNBWX5tGLtftpO87ft/BiEpcXC82wrB1DaQaCVscRFjWWJgGUjii5r8i+5yiViziGpgeRsjHaIy59eNovzCg=
X-Received: by 2002:a05:690c:7442:b0:711:a4af:43ad with SMTP id
 00721157ae682-71517147badmr235251117b3.14.1751363406075; Tue, 01 Jul 2025
 02:50:06 -0700 (PDT)
MIME-Version: 1.0
References: <20250623121845.7214-1-philmd@linaro.org> <20250623121845.7214-7-philmd@linaro.org>
In-Reply-To: <20250623121845.7214-7-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 1 Jul 2025 10:49:54 +0100
X-Gm-Features: Ac12FXyuBHFyZZaOxyOwWqZE-W7vNcGgM_jfizm0gIVdy-6YVWg7T5T5DEF9PnA
Message-ID: <CAFEAcA9ref1SFd2uPRBBjyg=eph+GptWxoyURxMZj8aSVD7zAg@mail.gmail.com>
Subject: Re: [PATCH v3 06/26] target/arm/hvf: Trace hv_vcpu_run() failures
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Leif Lindholm <leif.lindholm@oss.qualcomm.com>, 
	qemu-arm@nongnu.org, =?UTF-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>, 
	Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>, 
	Alexander Graf <agraf@csgraf.de>, Bernhard Beschow <shentey@gmail.com>, John Snow <jsnow@redhat.com>, 
	Thomas Huth <thuth@redhat.com>, =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
	kvm@vger.kernel.org, Eric Auger <eric.auger@redhat.com>, 
	Cameron Esfahani <dirty@apple.com>, Cleber Rosa <crosa@redhat.com>, 
	Radoslaw Biernacki <rad@semihalf.com>, Phil Dennis-Jordan <phil@philjordan.eu>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: Ik3e4GQ9n7sf

On Mon, 23 Jun 2025 at 13:19, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Allow distinguishing HV_ILLEGAL_GUEST_STATE in trace events.
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/hvf/hvf.c        | 10 +++++++++-
>  target/arm/hvf/trace-events |  1 +
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/target/arm/hvf/hvf.c b/target/arm/hvf/hvf.c
> index ef76dcd28de..cc5bbc155d2 100644
> --- a/target/arm/hvf/hvf.c
> +++ b/target/arm/hvf/hvf.c
> @@ -1916,7 +1916,15 @@ int hvf_vcpu_exec(CPUState *cpu)
>      bql_unlock();
>      r =3D hv_vcpu_run(cpu->accel->fd);
>      bql_lock();
> -    assert_hvf_ok(r);
> +    switch (r) {
> +    case HV_SUCCESS:
> +        break;
> +    case HV_ILLEGAL_GUEST_STATE:
> +        trace_hvf_illegal_guest_state();
> +        /* fall through */
> +    default:
> +        g_assert_not_reached();

This seems kind of odd.

If it can happen, we shouldn't g_assert_not_reached().
If it can't happen, we shouldn't trace it.

But the hvf code already has a lot of "assert success
rather than handling possible-but-fatal errors more
gracefully", so I guess it's OK.

-- PMM
