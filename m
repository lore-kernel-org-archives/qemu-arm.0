Received: by 2002:a5d:4850:0:0:0:0:0 with SMTP id n16csp1780557wrs;
        Thu, 15 Aug 2019 01:31:46 -0700 (PDT)
X-Received: by 2002:a05:6830:200e:: with SMTP id e14mr2357211otp.245.1565857906861;
        Thu, 15 Aug 2019 01:31:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1565857906; cv=none;
        d=google.com; s=arc-20160816;
        b=d0wYAvSYkp59R7Yzyok44Nvc9nY8+5buYak8I3Lm+L7d1LoBr6fOsrv6U8BbeKB/om
         PthM8v/dXwJSFIqVWQlhsZJGfN2adpk4kzCStyJxFc28frEieh4Kkb47xWfojsaITXVq
         3+HH83ndSJFoata7YnnOUWXynPAIA9Wli9ScMyazeym62ubfnNXDJV4nfbs12gLx997t
         ZF0IOvj8KEQeLSTa27I56UBaRKQX1EUx/X5BV96mkYNU/KCMNbdN5TSQJPeoj9v2rp0C
         fsZcHzo1LYp3U5D0tk5atrSAa7WImZVs4ThAZREa5TPuYF9kIAQTzB/m0FiRHY207EDp
         zctg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Rdgu4khboK/PEIYNJv3Ay/3DVdC2zV7k910eXnLQ8J8=;
        b=eW9TbYpHYXMitqBHxJa5ekQwT4+0C8EregQxUF4A+JAQYMX3HHzcSv9lsVFC8gXEq7
         fe70WIl7MdFh7FHIg9LexhvSiVg03OsrasRewNiZZTAcjH5hF9jCly6CoEAlD3HJbDnL
         3FHmjdPtVDLBM9Uw94znD3kOW/7X2duj/os9+LFsLKTlDtsIdAi+nQy9iIez7uPvXTfG
         LGd+V2T4Iyz7HUACV+k8aJW8kpDda6JwBNfpZcStU8abdB0wSOv2foI+OCAQn4Y8l2rX
         7KG+m776nNoHVYAbVcB8CGcS5qzjAH47IYaM3duCLyqElvaR667ZUYkWNx1vpsdPuc7S
         hl2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c8kuiqad;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id y27sor1248682ote.102.2019.08.15.01.31.46
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Thu, 15 Aug 2019 01:31:46 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=c8kuiqad;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.65 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rdgu4khboK/PEIYNJv3Ay/3DVdC2zV7k910eXnLQ8J8=;
        b=c8kuiqadEIWEgX8dJ5e6YVYvCyrGXKu4eUixVD8S+eKqaX8FideyXVgwirL6pa4bw6
         sPJgIC5urqkPR4Fem2+Xscb/zGUrwgcNZr25TNZcZJ4t72e8KQDAgTR4UO7taQG6c7+s
         mVbHm9CWvANIj3UaffAqNOBZeWS0dTdVKqk3cHhrHKxlxLtCFrZPWEjg6x7AwZvEAvfg
         00Qlf2pkJQsN+lEDq6MWsJ+8VQFLhTzWq6w0JGvA4y9Nn0PZ8ygWPGHXevd/4mIu5uwo
         wz5NrRpEc2k5drqv0Wtggs68F9DA8GXC4xqAMcOxG0lynaLdt6hwb7iBZ+X3DwMoYtV4
         su0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rdgu4khboK/PEIYNJv3Ay/3DVdC2zV7k910eXnLQ8J8=;
        b=Ol4jONZODM/eqzzToZasHWdJ3eYGBTgaLLuaXhrFZHcn2K/fnxCtaX/JlVgUhuKcb7
         Gf6F97gp4/UypaDugsHBw1JwJtSDnA2ZjwVjzbwbM1jH+ySJiIOUXZim8Xcn6gG83Rxh
         enzIIZNeehscFJC2kAoTs6BP2hy20R4UCgW4Nn8NMzdCnyMY0dEJ8PHheq78gZt3rsLj
         BfxJPf7ACDjZWEmZIenWPN5AdswNJETkoDyCsYNF2EP574IlcZdBb0MAmUBWxjBpyuYy
         PmZk1hfOrntVqeujG00hKYHY1rfMlsjr28fsTk0b0PNAmY7vaYjpO3VBPSBkf/A11DGV
         AruA==
X-Gm-Message-State: APjAAAXktxP5b6Lx5Rlb9uhzdvUbThArfhyV7G8BpiGNFFEBMyBbCLaG
	E86Q0Hs7HvHsKKY/nhUIAF2YDf5sIFBpZZw3lX9x4KqJxgMcKg==
X-Google-Smtp-Source: APXvYqx/GJHWgvbPx/ffXlExl0umDTzIeN44CnsEzUH9S8rQDsTzsZofixl8s/dJsGOwxqwPLnN3ZiOhhpLemITi1rg=
X-Received: by 2002:a05:6830:1653:: with SMTP id h19mr2729831otr.232.1565857906406;
 Thu, 15 Aug 2019 01:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20190802122540.26385-1-drjones@redhat.com>
In-Reply-To: <20190802122540.26385-1-drjones@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 15 Aug 2019 09:31:35 +0100
Message-ID: <CAFEAcA_Tq-DLQuH2-+NtYOE0m4ki_CfEfWpHG+UM4rGhdK3q-w@mail.gmail.com>
Subject: Re: [PATCH v3 00/15] target/arm/kvm: enable SVE in guests
To: Andrew Jones <drjones@redhat.com>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
	Richard Henderson <richard.henderson@linaro.org>, =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
	Markus Armbruster <armbru@redhat.com>, Eric Blake <eblake@redhat.com>, 
	Dave P Martin <Dave.Martin@arm.com>, Eric Auger <eric.auger@redhat.com>, 
	Igor Mammedov <imammedo@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-TUID: DGFJh4J1TnxZ

On Fri, 2 Aug 2019 at 13:25, Andrew Jones <drjones@redhat.com> wrote:
>
> Since Linux kernel v5.2-rc1 KVM has support for enabling SVE in guests.
> This series provides the QEMU bits for that enablement. First, we
> select existing CPU properties representing features we want to
> advertise in addition to the SVE vector lengths and prepare
> them for a qmp query. Then we introduce the qmp query, applying
> it immediately to those selected features. We also document ARM CPU
> features at this time. We next add a qtest for the selected CPU
> features that uses the qmp query for its tests - and we continue to
> add tests as we add CPU features with the following patches. So then,
> once we have the support we need for CPU feature querying and testing,
> we add our first SVE CPU feature property, 'sve', which just allows
> SVE to be completely enabled/disabled. Following that feature property,
> we add all 16 vector length properties along with the input validation
> they need and tests to prove the validation works. At this point the
> SVE features are still only for TCG, so we provide some patches to
> prepare for KVM and then a patch that allows the 'max' CPU type to
> enable SVE with KVM, but at first without vector length properties.
> After a bit more preparation we add the SVE vector length properties
> to the KVM-enabled 'max' CPU type along with the additional input
> validation and tests that that needs.  Finally we allow the 'host'
> CPU type to also enjoy these properties by simply sharing them with it.

Hi -- I see there have been some review comments on these patches
that mean there'll be a v4. In the meantime, patches 1, 2, 5, 6, 9, 10
seem to me to be independent bugfixes/cleanups that have been reviewed.
Would you like me to take those into target-arm.next to reduce the
size of the patchset for v4, or is that going to make rebasing
painful on your end?

thanks
-- PMM
