Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp4193239ejb;
        Tue, 21 Mar 2023 08:26:51 -0700 (PDT)
X-Google-Smtp-Source: AK7set8hCt4zWOyDHlgwR6VI6Ctr4cq0TZUZrUf0BYEGNI/r9g+snv7NBxCKfdHzoKbKmiwjuUr6
X-Received: by 2002:a05:600c:b55:b0:3ed:6693:138d with SMTP id k21-20020a05600c0b5500b003ed6693138dmr2740136wmr.4.1679412410963;
        Tue, 21 Mar 2023 08:26:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679412410; cv=none;
        d=google.com; s=arc-20160816;
        b=UFypTU7fvSk2W0q88K3heoF2ANrJbpjuZKORK6YfTJEZN0k/v7Clowm9WEgVWJnIcg
         1WJJXwc40tJ3HMDzm0EU4MwB398LMzn/FFRqcje4ChdXVAfJlPqSCFTasuWV+kzmDmcR
         Y0+kcrE30AAsQipjgbgbrJacq0k+e36RAHMXLDvC2AmCm6LmGB2xYTSGJ0Icfv7QxkBy
         NxkVUuooABdePQfV3q874u4urVPeJrPIHRhrL3miAsU56/9+16epTtN7gzyiScWZMmAJ
         qXSvfGpMYGSlEpVlOF3Z83yrmQOkyt1V5Wf+M9/D2uaO0hzkylD2WyXZ9PfHuaxTrA2f
         oJGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from
         :dkim-signature:date;
        bh=FgYGwRrLAUU0RjVaToMoeANvITEEdSg9WXChDyLn7uI=;
        b=GUz/VOdAUKdoZ+vx2vxcm+xXPqepzXi8RaB7CK/K82kVPJK9LD9nG8ewQVnV3OJOzm
         OKOClWH1EorYw1RYllSVCaCXCH4KA7qixsokcaMRK8EQmyQRjd1ldnhXvDdE0ERrOjWw
         m74jA3BdwnPk6yThChAvsLPy77jtr4me33BZTAINEKtR7xIXoVCCfw65asLVRnkYFHU8
         n4NgDLvmzrsygPYIx8+FxPPfTf2cKiW+2osYHN59kfZDvBI8OnRymIMxFoGnN/WliMK+
         ElWjaEs3VMwIW2FiTyVFfseH6vHuctonm7L2/NR/BD9BTTdcJEQbOQEN9qP0FrxoOc8g
         ZHpA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=BgwrBKkk;
       spf=pass (google.com: domain of andrew.jones@linux.dev designates 91.218.175.26 as permitted sender) smtp.mailfrom=andrew.jones@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <andrew.jones@linux.dev>
Received: from out-26.mta0.migadu.com (out-26.mta0.migadu.com. [91.218.175.26])
        by mx.google.com with ESMTPS id z10-20020a05600c114a00b003ed33bd2aa5si10136343wmz.148.2023.03.21.08.26.50
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 08:26:50 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrew.jones@linux.dev designates 91.218.175.26 as permitted sender) client-ip=91.218.175.26;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=BgwrBKkk;
       spf=pass (google.com: domain of andrew.jones@linux.dev designates 91.218.175.26 as permitted sender) smtp.mailfrom=andrew.jones@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Date: Tue, 21 Mar 2023 16:26:49 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1679412410;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FgYGwRrLAUU0RjVaToMoeANvITEEdSg9WXChDyLn7uI=;
	b=BgwrBKkk7UIj9CZ+Psd3r/T+xBfX8hsAzbGUjZFLWCLCscBOQGuMrWw38k+Fgnnz/y2GKP
	yyhRhcoZ5cL+4z0tBG2wpTYcdQ/vbX/UY+SLBm5/S1Jqn1D1C1VMNkKNe9OSyL+7JztlH3
	bN/+cXfIvX7s8Rjlvwk7IU9umD01zQE=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
	qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.linux.dev,
	qemu-arm@nongnu.org
Subject: Re: [kvm-unit-tests PATCH v10 0/7] MTTCG sanity tests for ARM
Message-ID: <20230321152649.zae7edlfub76fyqq@orel>
References: <20230307112845.452053-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307112845.452053-1-alex.bennee@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-TUID: USSSx+emRuSi

On Tue, Mar 07, 2023 at 11:28:38AM +0000, Alex Bennée wrote:
> I last had a go at getting these up-streamed at the end of 2021 so
> its probably worth having another go. From the last iteration a
> number of the groundwork patches did get merged:
> 
>   Subject: [kvm-unit-tests PATCH v9 0/9] MTTCG sanity tests for ARM
>   Date: Thu,  2 Dec 2021 11:53:43 +0000
>   Message-Id: <20211202115352.951548-1-alex.bennee@linaro.org>
> 
> So this leaves a minor gtags patch, adding the isaac RNG library which
> would also be useful for other users, see:
> 
>   Subject: [kvm-unit-tests PATCH v3 11/27] lib: Add random number generator
>   Date: Tue, 22 Nov 2022 18:11:36 +0200
>   Message-Id: <20221122161152.293072-12-mlevitsk@redhat.com>
> 
> Otherwise there are a few minor checkpatch tweaks.
> 
> I would still like to enable KVM unit tests inside QEMU as things like
> the x86 APIC tests are probably a better fit for unit testing TCG
> emulation than booting a whole OS with various APICs enabled.
> 
> Alex Bennée (7):
>   Makefile: add GNU global tags support
>   add .gitpublish metadata
>   lib: add isaac prng library from CCAN
>   arm/tlbflush-code: TLB flush during code execution
>   arm/locking-tests: add comprehensive locking test
>   arm/barrier-litmus-tests: add simple mp and sal litmus tests
>   arm/tcg-test: some basic TCG exercising tests
> 
>  Makefile                  |   5 +-
>  arm/Makefile.arm          |   2 +
>  arm/Makefile.arm64        |   2 +
>  arm/Makefile.common       |   6 +-
>  lib/arm/asm/barrier.h     |  19 ++
>  lib/arm64/asm/barrier.h   |  50 +++++
>  lib/prng.h                |  83 +++++++
>  lib/prng.c                | 163 ++++++++++++++
>  arm/tcg-test-asm.S        | 171 +++++++++++++++
>  arm/tcg-test-asm64.S      | 170 ++++++++++++++
>  arm/barrier-litmus-test.c | 450 ++++++++++++++++++++++++++++++++++++++
>  arm/locking-test.c        | 321 +++++++++++++++++++++++++++
>  arm/spinlock-test.c       |  87 --------
>  arm/tcg-test.c            | 340 ++++++++++++++++++++++++++++
>  arm/tlbflush-code.c       | 209 ++++++++++++++++++
>  arm/unittests.cfg         | 170 ++++++++++++++
>  .gitignore                |   3 +
>  .gitpublish               |  18 ++
>  18 files changed, 2180 insertions(+), 89 deletions(-)
>  create mode 100644 lib/prng.h
>  create mode 100644 lib/prng.c
>  create mode 100644 arm/tcg-test-asm.S
>  create mode 100644 arm/tcg-test-asm64.S
>  create mode 100644 arm/barrier-litmus-test.c
>  create mode 100644 arm/locking-test.c
>  delete mode 100644 arm/spinlock-test.c
>  create mode 100644 arm/tcg-test.c
>  create mode 100644 arm/tlbflush-code.c
>  create mode 100644 .gitpublish
> 
> -- 
> 2.39.2
>

I don't see any problem with the series, but I didn't review it closely.
I think it's unlikely we'll get reviewers, but, as the tests are
nodefault, then that's probably OK. Can you make sure all tests have a
"tcg" type prefix when they are TCG-only, like the last patch does for
its tests? That will help filter them out when building all tests as
standalone tests. Someday mkstandalone could maybe learn how to build
a directory hierarchy using the group names, e.g.

 tests/mttcg/tlb/all_other

but I don't expect to have time for that myself anytime soon, so prefixes
will likely have to do for now (or forever).

Thanks,
drew
