Received: by 2002:adf:9061:0:0:0:0:0 with SMTP id h88csp1765240wrh;
        Fri, 10 May 2019 01:47:01 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwVIZ7vBbatYat5YO/VxVa9c14Z7F08K+S0mDaUrtDoa7LpOxtLF5bMTH0Q7Ti+ekX0hFyN
X-Received: by 2002:ac8:534d:: with SMTP id d13mr7102406qto.217.1557478021461;
        Fri, 10 May 2019 01:47:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1557478021; cv=none;
        d=google.com; s=arc-20160816;
        b=QlKzpQPJYqHKNZmhvLA0YoTklzEgNfupEliy+rFoOyNee+97sh0hYJ8rWpS9FABoKB
         2mRK3rMX8dQKVfSjSfUVB9a11d4wFJPyTf7ipxLgZfmLPyskUPzbRshmC8I473Bk39lj
         Uor5DtPTC8muNDeancliYuJ5At0KGvEniPNiw1l1nHRY36d79xEKAOy94RWJlKYGjNgF
         fH8S0covtE5uHPtOaExEiKKD++AZm3bhZvUb2S7gkJe1d7yLUKSkJS9BUn/Osuk+OzgB
         Qz2bBOe+138dYJQPOG7MJ9SQ9Oi9QFORlS36RhC4/AHSLsHeOZFBpw8L+VmTpfND/ikW
         m28Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:content-language:in-reply-to:mime-version
         :user-agent:date:message-id:organization:autocrypt:openpgp:from
         :references:cc:to:subject;
        bh=pjtKqKqbS0xIX18Agug6Q/DPxmB5RTfOx70tJLsWTok=;
        b=CNo0PgOsVd7Wm7LoTXz5nEky7w9XDKvpsTjqZcRWI5mNyF1aTJQyw2mYZJ3kAgOPfk
         pGIlW/Z2cuwtm6zlhprnopI2NH+1/Fa2cZlSJDHAzv4jiI7DL5MdlWHOOvjXkOliIuCV
         aimvVCqDHMkyGqng2+Y+f6GeS6l2ISrXiNZCJk3QG4jISexzEaSWQhE0RLMzpod7iU2q
         LuluqO41szHAhoyK6rrOPvz4RCXzMevCwumvcPdtXxxb7jg5oLUBSUyDqfCXSQGPbBhz
         +2skCgVI/gCKUVB8V3iIKtXHwM7WgkMUHPln2Y6CtWJ814igMO5Y7YAOgb99ShUAYw4K
         2+NQ==
ARC-Authentication-Results: i=1; mx.google.com;
       spf=pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Return-Path: <thuth@redhat.com>
Received: from mx1.redhat.com (mx1.redhat.com. [209.132.183.28])
        by mx.google.com with ESMTPS id l186si2006442qkc.229.2019.05.10.01.47.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 May 2019 01:47:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) client-ip=209.132.183.28;
Authentication-Results: mx.google.com;
       spf=pass (google.com: domain of thuth@redhat.com designates 209.132.183.28 as permitted sender) smtp.mailfrom=thuth@redhat.com;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=redhat.com
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.phx2.redhat.com [10.5.11.13])
	(using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mx1.redhat.com (Postfix) with ESMTPS id 622153082E10;
	Fri, 10 May 2019 08:47:00 +0000 (UTC)
Received: from thuth.remote.csb (ovpn-116-72.ams2.redhat.com [10.36.116.72])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 80F7260C81;
	Fri, 10 May 2019 08:46:59 +0000 (UTC)
Subject: Re: [Qemu-devel] [PATCH v1 23/23] tests: Run the iotests during "make
 check" again
To: =?UTF-8?Q?Alex_Benn=c3=a9e?= <alex.bennee@linaro.org>,
 qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org
References: <20190509165912.10512-1-alex.bennee@linaro.org>
 <20190509165912.10512-24-alex.bennee@linaro.org>
From: Thomas Huth <thuth@redhat.com>
Openpgp: preference=signencrypt
Autocrypt: addr=thuth@redhat.com; keydata=
 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
Organization: Red Hat
Message-ID: <9dd37620-091e-cc58-be5b-cea01d916d07@redhat.com>
Date: Fri, 10 May 2019 10:46:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190509165912.10512-24-alex.bennee@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.13
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.46]); Fri, 10 May 2019 08:47:00 +0000 (UTC)
X-TUID: I2GcBDWJRvxu

On 09/05/2019 18.59, Alex Bennée wrote:
> From: Thomas Huth <thuth@redhat.com>
> 
> People often forget to run the iotests before submitting patches or
> pull requests - this is likely due to the fact that we do not run the
> tests during our mandatory "make check" tests yet. Now that we've got
> a proper "auto" group of iotests that should be fine to run in every
> environment, we can enable the iotests during "make check" again by
> running the "auto" tests by default from the check-block.sh script.
> 
> Some cases still need to be checked first, though: iotests need bash
> and GNU sed (otherwise they fail), and if gprof is enabled, it spoils
> the output of some test cases causing them to fail. So if we detect
> that one of the required programs is missing or that gprof is enabled,
> we still have to skip the iotests to avoid failures.
> 
> And finally, since we are using check-block.sh now again, this patch also
> removes the qemu-iotests-quick.sh script since we do not need that anymore
> (and having two shell wrapper scripts around the block tests seem
> rather confusing than helpful).
> 
> Signed-off-by: Thomas Huth <thuth@redhat.com>
> Message-Id: <20190502084506.8009-8-thuth@redhat.com>
> [AJB: add -pretty to check-block.sh]
> Signed-off-by: Alex Bennée <alex.bennee@linaro.org>
> ---
>  tests/Makefile.include      |  8 +++----
>  tests/check-block.sh        | 44 ++++++++++++++++++++++++++++---------
>  tests/qemu-iotests-quick.sh |  8 -------
>  3 files changed, 38 insertions(+), 22 deletions(-)
>  delete mode 100755 tests/qemu-iotests-quick.sh
> 
> diff --git a/tests/Makefile.include b/tests/Makefile.include
> index 60de085ee1f..e865daaa897 100644
> --- a/tests/Makefile.include
> +++ b/tests/Makefile.include
> @@ -140,7 +140,7 @@ check-unit-y += tests/test-uuid$(EXESUF)
>  check-unit-y += tests/ptimer-test$(EXESUF)
>  check-unit-y += tests/test-qapi-util$(EXESUF)
>  
> -check-block-$(CONFIG_POSIX) += tests/qemu-iotests-quick.sh
> +check-block-$(CONFIG_POSIX) += tests/check-block.sh
>  
>  # All QTests for now are POSIX-only, but the dependencies are
>  # really in libqtest, not in the testcases themselves.
> @@ -1077,8 +1077,8 @@ clean-tcg: $(CLEAN_TCG_TARGET_RULES)
>  
>  QEMU_IOTESTS_HELPERS-$(call land,$(CONFIG_SOFTMMU),$(CONFIG_LINUX)) = tests/qemu-iotests/socket_scm_helper$(EXESUF)
>  
> -.PHONY: check-tests/qemu-iotests-quick.sh
> -check-tests/qemu-iotests-quick.sh: tests/qemu-iotests-quick.sh qemu-img$(EXESUF) qemu-io$(EXESUF) qemu-nbd$(EXESUF) $(QEMU_IOTESTS_HELPERS-y)
> +.PHONY: check-tests/check-block.sh
> +check-tests/check-block.sh: tests/check-block.sh qemu-img$(EXESUF) qemu-io$(EXESUF) qemu-nbd$(EXESUF) $(QEMU_IOTESTS_HELPERS-y)
>  	$<
>  
>  .PHONY: $(patsubst %, check-%, $(check-qapi-schema-y))
> @@ -1152,7 +1152,7 @@ check-acceptance: check-venv $(TESTS_RESULTS_DIR)
>  check-qapi-schema: $(patsubst %,check-%, $(check-qapi-schema-y)) check-tests/qapi-schema/doc-good.texi
>  check-qtest: $(patsubst %,check-qtest-%, $(QTEST_TARGETS))
>  check-block: $(patsubst %,check-%, $(check-block-y))
> -check: check-qapi-schema check-unit check-softfloat check-qtest check-decodetree
> +check: check-qapi-schema check-unit check-softfloat check-qtest check-decodetree check-block

Could you please move "check-block" to the beginning of the list
instead? I just noticed that the total runtime of "make check" will be
shorter that way when running the tests in parallel with "-j...".

Reason: check-block is the test with the longest runtime. So if the
other shorter tests are started first, they will occupy all CPUs for a
short amount of time, and check-block will be running more or less alone
in the end. Now if you start check-block first, it can run for the whole
time, while the shorter tests are scheduled to the remaining CPU jobs
instead.

 Thomas
