Received: by 2002:a17:906:779e:b0:94e:fe67:1757 with SMTP id s30csp2289796ejm;
        Tue, 2 May 2023 09:07:16 -0700 (PDT)
X-Received: by 2002:a05:6402:517a:b0:50b:c896:12eb with SMTP id d26-20020a056402517a00b0050bc89612ebmr4885217ede.31.1683043636436;
        Tue, 02 May 2023 09:07:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1683043636; cv=none;
        d=google.com; s=arc-20160816;
        b=Ay+KT9m+fBMJ4xcJycnhn2M2mG6vMFdhit8eLP2nXh+6/MBy6200sfOKUYGLeDvJMi
         CcipWNu+mYuQgWAPaoc0m1taxGpaZtPO92EZtyVD+qaFWxretzXEmfpzgEDiruVlgID5
         WnWfFpaHx2z0bGp6ozgdA4rKpam3XA5CpuKKAPet+GZxYCP9CKAhOr7CDBIF9uUC4tgm
         esvvYnJRW8XVlbxhfuHxGOpYXIlIhonCLWz+o5tXWf2Fi7ZspB5tA+ixXUH46+/GOsXq
         fhgaDqTUQbC+NPu0HFusHSQZ7a4AueAL29PSnOOV2ThyorZEjlDhtyHZQCOrx4an8QY+
         oEkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=rPdQXw/fq4j47T9RvnrT5HtF67OlhxtSoj8vnvwsf4U=;
        b=gdIAT6wX9LrZZCALyKnjGKs02zrRCGxY5yUd+Otqj/RB0uCCpIBnbQ1DNF+3EujaoN
         FddT68/+kzyclMJb3qvf7lbgJ/FSPfrt19wQhP8k0jjz+ocKD/q5No1O8cv7jgGR6QKO
         0gGU3ubLFqCeRCHN6CfvrsVf/8FhZRWSreF7AQKQvvMMPQ4mboNRf0NwPBtJgKylea4c
         24iG9UFA5/CJZJsQnO5iQ7t3DUBYT/3g08N2UnvQb2sYoNJw1snOXleUa0dVgMt35vbg
         KvWZoFmYvX8BWwFWmF8jS8qy0MSKapjwvnlh1iJS8e7tOjCktFcRrHzpyWPptexBUFH4
         AFmw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZytMXUKi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id k28-20020a508adc000000b0050bc5887685sor1019734edk.5.2023.05.02.09.07.16
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Tue, 02 May 2023 09:07:16 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZytMXUKi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683043636; x=1685635636;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rPdQXw/fq4j47T9RvnrT5HtF67OlhxtSoj8vnvwsf4U=;
        b=ZytMXUKiMkhBbWSBzzO8fL2RXS0hgY1QpN7unfu1p735kVxzJLII24/VUPiV+oFG6P
         uyyBug4WgOTISuBAVvc0DNvfaHpbsqggYez74e4X3ffuQIPdMvcv3WBJuABIv0agZ5P+
         h3TnkSIAOKsgXbbtOqRM0zrH93LfMbqUBksf+wFb7+7l/QV/3Tyj99RXml14ekFQzZYr
         NUuLsMJD49iUiHAJvevaQ7ewowDhocWNHGJbYIXILkJlBLDbsyDAOH8laDTSbKhtjOHi
         h6gZ02q6hLVeExS8KQg8/jigFciIg5dvU+Dz6HNJzr68b3ySe2802wppDhjfPirGbj07
         qatg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683043636; x=1685635636;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rPdQXw/fq4j47T9RvnrT5HtF67OlhxtSoj8vnvwsf4U=;
        b=Ym0RAAVC4qwlpWwh5A4eStlzP8LQqo/prcxjY9nO1slajWMA5Dgfs0raT7CyL6n/v3
         41J0G5SLvWYd7AEzIJuAGKMYxhB/jZY69u75JxXkJMlGgpjgnmuud8+gafjfh3loK8bE
         l1Mzow0p12f3QRMyon073/mQWbwEACqz5pVhrjy4UOQEh7paw1zI15kNxNUWBMceiV0K
         EjywPmOq9ssPhqQooN2oYjySRqd6xWdU+YS74/RHNGdn+/lDe/z6SiVyn66pSwuijtgy
         dG2BcQqnYgN4auihSNwfGGLuRI06VB62QKGjtT9TXnTlannnmMSR4wHrfATVxYXn/wDl
         9+Vw==
X-Gm-Message-State: AC+VfDyavUxIxK8u9F0M45d3ZcRwZVpTbcZu/mbTnnXYyeAQWfn9EiYC
	uckD4v4z+XloYRQ7lFPbir0uQcuY19z55j+S4UlGNcnN
X-Google-Smtp-Source: ACHHUZ7JzyMTWfF7fY2sU/0wP8hSU5gPNGrpjyc68+eWLV8NY46UVMkpEu5xqTN2NXY29ls3nbgj/FEpJkbhw0I6P58=
X-Received: by 2002:a05:6402:517a:b0:50b:c896:12eb with SMTP id
 d26-20020a056402517a00b0050bc89612ebmr4885194ede.31.1683043636081; Tue, 02
 May 2023 09:07:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230426180013.14814-1-farosas@suse.de> <CAFEAcA_ZVpZzuvZ71NzgweRC5Uti0T_fqG00paqDDe18QP-veQ@mail.gmail.com>
 <CAFEAcA-s6P2Y5nNQMyACeK3+4cuSrFfqqEdFW-BDToy_YXj64g@mail.gmail.com>
In-Reply-To: <CAFEAcA-s6P2Y5nNQMyACeK3+4cuSrFfqqEdFW-BDToy_YXj64g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 2 May 2023 17:07:05 +0100
Message-ID: <CAFEAcA-7ci6PRYCOcrPZcGq8x+Wxtx6wwSk1C18cOO=dXOq8Dw@mail.gmail.com>
Subject: Re: [PATCH v11 00/13] target/arm: Allow CONFIG_TCG=n builds
To: Fabiano Rosas <farosas@suse.de>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
	=?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-TUID: wNAhPLMJwZnw

On Tue, 2 May 2023 at 15:51, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 2 May 2023 at 10:55, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Wed, 26 Apr 2023 at 19:00, Fabiano Rosas <farosas@suse.de> wrote:
> > >
> > > Hi,
> > >
> > > Some minor changes:
> > >
> > > - new patch to move a test under CONFIG_TCG (broken on master);
> > > - new patch to document the unsupported CPU test (Philippe);
> > > - changed the test skip message when no KVM or TCG are present (Igor).
> >
> > Applied to target-arm.next; thanks for your persistence in
> > working through the many versions of this patchset.
>
> Update: I had to drop "gitlab-ci: Check building KVM-only aarch64 target"
> because it enables a CI job that fails on our aarch64 runner
> (because it wants to run tests using KVM but that machine
> isn't configured to allow the runner to use KVM).

We fixed the runner config, but the CI still fails on that notcg
job because it is trying to run tests that explicitly use
'-accel tcg':
https://gitlab.com/qemu-project/qemu/-/jobs/4212850809#L3595

Something is weird here, because we built without TCG support
on an aarch64 host but we still got qemu-system-i386
and qemu-system-x86_64 binaries, which then don't work
and cause the tests to fail...

-- PMM
