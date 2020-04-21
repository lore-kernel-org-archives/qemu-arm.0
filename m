Received: by 2002:ac2:52b1:0:0:0:0:0 with SMTP id r17csp4794559lfm;
        Tue, 21 Apr 2020 01:00:21 -0700 (PDT)
X-Received: by 2002:a2e:8999:: with SMTP id c25mr12665966lji.73.1587456021314;
        Tue, 21 Apr 2020 01:00:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1587456021; cv=none;
        d=google.com; s=arc-20160816;
        b=hs5+YL3U25AVOgUN7rVQ2I/Phz5sv2MtscJG4qlxjmAX4bKp3lHr1TYw7jbkWODWFs
         vo8yo1WsSO6D7xxBnRynpoPfXUDkSzTyt6Bt6KhJVwLxfx3UqkfIlQSIWER+UXcC3H7q
         HDBTpVokkb2bNhYtR6rFH19l3aPVOqj6u+Yqmn/2wn0kix/OLRgJilM2XEvhhuNl0lmH
         Sn+8s8J+48Sv6ZRreHKEkSNVyTeeuYzCkEcDTb5Gtyzbsr2C/4W2SiYrP3sggha1SN/+
         0HzWRSMyUN5V1dH1p6xRGANOViRwsSDBqzr8Km3EzHAjHRU7A0zPalHu8EVgTfabA62f
         OyhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:mime-version:references:message-id:subject:cc
         :to:from:date:dkim-signature;
        bh=zgtUMHiFlD687NvfhFnZKGQkOdSQ2faAAYThPLxUtHk=;
        b=QPsx0TvT9/ZHF5CZ7Ynd95Q5r/MGGyFIDzRm4OZtzqEeTJKB+3SVeEZ9fYmXMmZlY9
         Br3/KbIBt4W7mk/GHZIVOBCTA+0KGD51BPE4UiYkNbgRz+8lk330AfrXzDYH8E/6Z7jw
         2pKxibaqEOHYeWfNobikss6zS2p+79runpBwyAyukGHSOpZfpHyIhcw9sG/i9FjINFBh
         tUZUgH1cBa7HTOm9kLeR+LLiXnWA0zSY+A9yrdf4HYJ5jeJDloRmoZIClBHBFjpqCJnu
         Sa2bfrLA7a9YppQKiMjOAvi6m7ye8c85Znb/LZfS7xngGa0B2Q9pIy1x03nCHPMD08b4
         EOvw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=YE0FtTrv;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
Return-Path: <edgar.iglesias@gmail.com>
Received: from mail-sor-f65.google.com (mail-sor-f65.google.com. [209.85.220.65])
        by mx.google.com with SMTPS id t16sor1068764ljg.47.2020.04.21.01.00.21
        (Google Transport Security);
        Tue, 21 Apr 2020 01:00:21 -0700 (PDT)
Received-SPF: pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.65 as permitted sender) client-ip=209.85.220.65;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@gmail.com header.s=20161025 header.b=YE0FtTrv;
       spf=pass (google.com: domain of edgar.iglesias@gmail.com designates 209.85.220.65 as permitted sender) smtp.mailfrom=edgar.iglesias@gmail.com;
       dmarc=pass (p=NONE sp=QUARANTINE dis=NONE) header.from=gmail.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=zgtUMHiFlD687NvfhFnZKGQkOdSQ2faAAYThPLxUtHk=;
        b=YE0FtTrvFR3Tx4tjG72uo65WJagkvd/Y/q+qdinUluCI/XOQEUG9xAN4EDVMJQP00P
         jVhuTyoSlp63+7TcgyiMk9fOJOf4T8qki6cJiCicBkW8IRwJ4leVJV0s/PkNuTSdM3ro
         zb3jLxOu7ooSkXWtq5JubxG33c+WwYsOqP7xjtJ2c8xTmF5xsEp7ELIRyg5MeXGqmR91
         5xFPrJPXQIoXQdLwJBEXuTbO+H+dFRD0ZHCvpY+iAELQ/FEnVNlYzQ+NCTUNRzRFMaa3
         OdZB3PhxNk2Xo8YUTdqFa4gUHV+wM89iDa7n0fJ+6qONIwoToKRVhbEipCyuuvr6ST9l
         fMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to:user-agent;
        bh=zgtUMHiFlD687NvfhFnZKGQkOdSQ2faAAYThPLxUtHk=;
        b=BMgHrOsEYqGkSwexmC3aGZ5iFRcD3DhyF2cQEBP0pEv4quo5ZPgfrgS8GX08e4mnGA
         2gXmmdDOAs0tHlGbp+4DrAWzcopDaMxIC8Cmy2/e17vYOpj7cHE2yuAy9eNB+cK3R3pl
         0zOSvEcP1ORpM/JpgSJyPqSVAv0rCvzsitDx/TJRl682A1pNwXj6RwVK847aeITzDarM
         xJrnm4bp1KZ7LBBo+Fz0i3a2ZxoAG5rvWFCxIpuE6AhqY27bfClrfz7er9b6RV+QBE2d
         hlayaPTIVwevIEuryjiCB8ZJxeqUu6RYcKTaXDsUAr+ZNYqESowebN75kIRvDZsgMLXH
         D/7g==
X-Gm-Message-State: AGi0PuZMXaL+5Wu19sMEbTtCJLnzG4WTvd5oaURAXUi050iGa8XwtTsj
	FjsJJcgvx3W3weOjV+p0tn8/Ogpou5Q=
X-Google-Smtp-Source: APiQypKsHdBMTej4jSchKdsg0i14LAF375OFb3hr2ZWIrV9W+CXXzHS+B42sTFGSeYT96A7QbLIrWA==
X-Received: by 2002:a2e:6a09:: with SMTP id f9mr12313999ljc.293.1587456020564;
        Tue, 21 Apr 2020 01:00:20 -0700 (PDT)
Return-Path: <edgar.iglesias@gmail.com>
Received: from localhost (81-231-232-130-no39.tbcn.telia.com. [81.231.232.130])
        by smtp.gmail.com with ESMTPSA id k6sm1410100lfm.91.2020.04.21.01.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2020 01:00:19 -0700 (PDT)
Date: Tue, 21 Apr 2020 10:01:30 +0200
From: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>
To: Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, richard.henderson@linaro.org,
	Peter Maydell <peter.maydell@linaro.org>,
	"open list:ARM TCG CPUs" <qemu-arm@nongnu.org>
Subject: Re: [PATCH] tests/tcg: use EXTRA_RUNS to run gdbtests
Message-ID: <20200421080130.GI2669@toto>
References: <20200420133455.25401-1-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200420133455.25401-1-alex.bennee@linaro.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-TUID: NJQB6iNJNQWn

On Mon, Apr 20, 2020 at 02:34:55PM +0100, Alex Bennée wrote:
> With --enable-plugins the gdb tests confuse things somewhat as the
> plugin code attempts to enumerate tests with non-existent binaries.
> Fortunately we already have a mechanism for these extra tests that
> don't automatically include their own binaries. Use that mechanism and
> drop the unneeded .PHONY declarations.


Reviewed-by: Edgar E. Iglesias <edgar.iglesias@xilinx.com>


> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/tcg/aarch64/Makefile.target   | 5 ++---
>  tests/tcg/cris/Makefile.target      | 1 +
>  tests/tcg/multiarch/Makefile.target | 5 ++---
>  3 files changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/tests/tcg/aarch64/Makefile.target b/tests/tcg/aarch64/Makefile.target
> index d99b2a9eced..312f36cde5f 100644
> --- a/tests/tcg/aarch64/Makefile.target
> +++ b/tests/tcg/aarch64/Makefile.target
> @@ -54,9 +54,6 @@ sve-ioctls: CFLAGS+=-march=armv8.1-a+sve
>  ifneq ($(HAVE_GDB_BIN),)
>  GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
>  
> -AARCH64_TESTS += gdbstub-sysregs gdbstub-sve-ioctls
> -
> -.PHONY: gdbstub-sysregs gdbstub-sve-ioctls
>  run-gdbstub-sysregs: sysregs
>  	$(call run-test, $@, $(GDB_SCRIPT) \
>  		--gdb $(HAVE_GDB_BIN) \
> @@ -70,6 +67,8 @@ run-gdbstub-sve-ioctls: sve-ioctls
>  		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
>  		--bin $< --test $(AARCH64_SRC)/gdbstub/test-sve-ioctl.py, \
>  	"basic gdbstub SVE ZLEN support")
> +
> +EXTRA_RUNS += run-gdbstub-sysregs run-gdbstub-sve-ioctls
>  endif
>  
>  endif
> diff --git a/tests/tcg/cris/Makefile.target b/tests/tcg/cris/Makefile.target
> index 24c7f2e7616..e72d3cbdb23 100644
> --- a/tests/tcg/cris/Makefile.target
> +++ b/tests/tcg/cris/Makefile.target
> @@ -23,6 +23,7 @@ CRIS_RUNS = $(patsubst %, run-%, $(CRIS_USABLE_TESTS))
>  
>  # override the list of tests, as we can't build the multiarch tests
>  TESTS = $(CRIS_USABLE_TESTS)
> +EXTRA_RUNS =
>  VPATH = $(CRIS_SRC)
>  
>  AS	= $(CC) -x assembler-with-cpp
> diff --git a/tests/tcg/multiarch/Makefile.target b/tests/tcg/multiarch/Makefile.target
> index 47fd675aba5..51fb75ecfdd 100644
> --- a/tests/tcg/multiarch/Makefile.target
> +++ b/tests/tcg/multiarch/Makefile.target
> @@ -45,15 +45,14 @@ run-test-mmap-%: test-mmap
>  ifneq ($(HAVE_GDB_BIN),)
>  GDB_SCRIPT=$(SRC_PATH)/tests/guest-debug/run-test.py
>  
> -MULTIARCH_TESTS += gdbstub-sha1
> -
> -.PHONY: gdbstub-sha1
>  run-gdbstub-sha1: sha1
>  	$(call run-test, $@, $(GDB_SCRIPT) \
>  		--gdb $(HAVE_GDB_BIN) \
>  		--qemu $(QEMU) --qargs "$(QEMU_OPTS)" \
>  		--bin $< --test $(MULTIARCH_SRC)/gdbstub/sha1.py, \
>  	"basic gdbstub support")
> +
> +EXTRA_RUNS += run-gdbstub-sha1
>  endif
>  
>  
> -- 
> 2.20.1
> 
