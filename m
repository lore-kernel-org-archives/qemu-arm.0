Received: by 2002:a17:906:b2c6:b0:930:eaf4:5c09 with SMTP id cf6csp4167527ejb;
        Tue, 21 Mar 2023 08:05:42 -0700 (PDT)
X-Google-Smtp-Source: AK7set9mijtQjdO4ITZurENDsznytDI4sEljZSi0s7HtZASr0U/Gtk4I8k88L2/9xLP2di+vROi1
X-Received: by 2002:a7b:c015:0:b0:3ed:3268:5f35 with SMTP id c21-20020a7bc015000000b003ed32685f35mr2798866wmb.18.1679411142639;
        Tue, 21 Mar 2023 08:05:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1679411142; cv=none;
        d=google.com; s=arc-20160816;
        b=W3l2b+GmsHNfTKUcLoprJM7LKbTaCzz5EW65BOxOohRAiVXoUQjhNWdeKxNDsu5um6
         dXv7eLyUJzWleF9dSsvW2kUsmCR1SxDYBer7OPkKoJx4GLg0k+oKj2M0rajP4Hzgr3JM
         xmnRdN+PExLViPe/CqHC9fuo5CNNwFQEWkV9+Q0Cf3dtRbLu80izllu0dq8Q99a4RTIs
         g5141cYgwv77MuZcaMTacdEGvqEfUmznjGTYryPTZu8DmMkiR7ktNMcAuiCgaj4ex/NO
         qq6XYiQvPavIF7lR0rQNfNEVFPP7U+nDQ1QFu2lhAkyEZCoIPn6nNgun6p/YlEiacW+w
         6Ofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from
         :dkim-signature:date;
        bh=JyvQw2WBRS/YLRqGgensv+vuNhTLTecf55q+CfuCMpA=;
        b=aBOVhCGb6Wael1oMtDMAwuiQER0gY+n3RZ+lr6ekvEbkPx9RoYvY+7UWsB3KosEmai
         OH2Fe1/BekNyHD9CJuX4tc+1IZ7pxeFzL1dShN+X0tgOgUR3eYyAFJe53OzN1wgIGrjh
         PNX655WpXynI9TKEokPJM7iAbUM2LpidA1tZ9Xq4Uixfi58WThBqq+Z66HaVxrczvoJV
         Eaww3pD56RxJraG1rUV1D0iZpr5CWtlqYkd9h37vD18TKEUEKHdAuMkMMW8POsbXJy7T
         u/irV7eUPV5Rdob68qfe2CLIpB1so2/b4+wm955LKUTTiUJElhYw6ZP7cGR+Vl5CFVy3
         ERFg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=Dg7Lu5uJ;
       spf=pass (google.com: domain of andrew.jones@linux.dev designates 2001:41d0:203:375::18 as permitted sender) smtp.mailfrom=andrew.jones@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <andrew.jones@linux.dev>
Received: from out-24.mta1.migadu.com (out-24.mta1.migadu.com. [2001:41d0:203:375::18])
        by mx.google.com with ESMTPS id m9-20020a7bce09000000b003ee289a3c27si2198232wmc.2.2023.03.21.08.05.42
        for <alex.bennee@linaro.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Mar 2023 08:05:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of andrew.jones@linux.dev designates 2001:41d0:203:375::18 as permitted sender) client-ip=2001:41d0:203:375::18;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=Dg7Lu5uJ;
       spf=pass (google.com: domain of andrew.jones@linux.dev designates 2001:41d0:203:375::18 as permitted sender) smtp.mailfrom=andrew.jones@linux.dev;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Date: Tue, 21 Mar 2023 16:05:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1679411142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=JyvQw2WBRS/YLRqGgensv+vuNhTLTecf55q+CfuCMpA=;
	b=Dg7Lu5uJmd2wB6AmU7Llz8L584EHLEVAf793bPL4VUZ5t3eNaLIcBtz00PL34pqbj42uLX
	UxvCu0T9yzj1CQMJtdSAvWyBhx16NjiDqHIQazvT4ld/b5JuaepEZ5A3VcGLHntsn9Nvqm
	tNs3lf6bYG5vH+S5RPFwl8Pli1kodV0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Andrew Jones <andrew.jones@linux.dev>
To: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
Cc: kvmarm@lists.cs.columbia.edu, kvm@vger.kernel.org,
	qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>,
	Paolo Bonzini <pbonzini@redhat.com>, kvmarm@lists.linux.dev,
	qemu-arm@nongnu.org
Subject: Re: [kvm-unit-tests PATCH v10 5/7] arm/locking-tests: add
 comprehensive locking test
Message-ID: <20230321150541.bkqkcoyc3hb443tj@orel>
References: <20230307112845.452053-1-alex.bennee@linaro.org>
 <20230307112845.452053-6-alex.bennee@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230307112845.452053-6-alex.bennee@linaro.org>
X-Migadu-Flow: FLOW_OUT
X-TUID: Z8M5IoIuOfBt

On Tue, Mar 07, 2023 at 11:28:43AM +0000, Alex Bennée wrote:
> This test has been written mainly to stress multi-threaded TCG behaviour
> but will demonstrate failure by default on real hardware. The test takes
> the following parameters:
> 
>   - "lock" use GCC's locking semantics
>   - "atomic" use GCC's __atomic primitives
>   - "wfelock" use WaitForEvent sleep
>   - "excl" use load/store exclusive semantics
> 
> Also two more options allow the test to be tweaked
> 
>   - "noshuffle" disables the memory shuffling
>   - "count=%ld" set your own per-CPU increment count
> 
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> Message-Id: <20211118184650.661575-8-alex.bennee@linaro.org>
> 
> ---
> v9
>   - move back to unittests.cfg, drop accel=tcg
>   - s/printf/report_info
> v10
>   - dropped spare extra line in shuffle_memory
> ---
>  arm/Makefile.common |   2 +-
>  arm/locking-test.c  | 321 ++++++++++++++++++++++++++++++++++++++++++++
>  arm/spinlock-test.c |  87 ------------
>  arm/unittests.cfg   |  30 +++++
>  4 files changed, 352 insertions(+), 88 deletions(-)
>  create mode 100644 arm/locking-test.c
>  delete mode 100644 arm/spinlock-test.c
> 
> diff --git a/arm/Makefile.common b/arm/Makefile.common
> index 2c4aad38..3089e3bf 100644
> --- a/arm/Makefile.common
> +++ b/arm/Makefile.common
> @@ -5,7 +5,6 @@
>  #
>  
>  tests-common  = $(TEST_DIR)/selftest.flat
> -tests-common += $(TEST_DIR)/spinlock-test.flat
>  tests-common += $(TEST_DIR)/pci-test.flat
>  tests-common += $(TEST_DIR)/pmu.flat
>  tests-common += $(TEST_DIR)/gic.flat
> @@ -13,6 +12,7 @@ tests-common += $(TEST_DIR)/psci.flat
>  tests-common += $(TEST_DIR)/sieve.flat
>  tests-common += $(TEST_DIR)/pl031.flat
>  tests-common += $(TEST_DIR)/tlbflush-code.flat
> +tests-common += $(TEST_DIR)/locking-test.flat
>  
>  tests-all = $(tests-common) $(tests)
>  all: directories $(tests-all)
> diff --git a/arm/locking-test.c b/arm/locking-test.c
> new file mode 100644
> index 00000000..a49c2fd1
> --- /dev/null
> +++ b/arm/locking-test.c
> @@ -0,0 +1,321 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Locking Test
> + *
> + * This test allows us to stress the various atomic primitives of a VM
> + * guest. A number of methods are available that use various patterns
> + * to implement a lock.
> + *
> + * Copyright (C) 2017 Linaro
> + * Author: Alex Bennée <alex.bennee@linaro.org>
> + *
> + * This program is free software; you can redistribute it and/or modify
> + * it under the terms of the GNU General Public License version 2 as
> + * published by the Free Software Foundation.
> + */
> +
> +#include <libcflat.h>
> +#include <asm/smp.h>
> +#include <asm/cpumask.h>
> +#include <asm/barrier.h>
> +#include <asm/mmu.h>
> +
> +#include <prng.h>
> +
> +#define MAX_CPUS 8
> +
> +/* Test definition structure
> + *
> + * A simple structure that describes the test name, expected pass and
> + * increment function.
> + */

nit: This and many comment blocks below are missing their opening wings.

Thanks,
drew
