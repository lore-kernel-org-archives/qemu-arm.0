Received: by 2002:a8a:84:0:0:0:0:0 with SMTP id s4csp401191ocq;
        Mon, 3 Oct 2022 02:32:54 -0700 (PDT)
X-Received: by 2002:aa7:cb0b:0:b0:456:e744:79e5 with SMTP id s11-20020aa7cb0b000000b00456e74479e5mr18202963edt.191.1664789574526;
        Mon, 03 Oct 2022 02:32:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1664789574; cv=none;
        d=google.com; s=arc-20160816;
        b=PKIxMXP29rGbgDZBtbSEjkQP+xhXosK8AnEF52o3A0VzXkEt98/sQ/PD8t3Du65AFW
         wGR1i6Uu45NGo1Q4tPFCKLHXs/qe4EgV1WYzNuH9+SMJLAmueu94f/B5Ye7QmO9qakRr
         18qMFz348eeEvKNemsfOaaevB4kCZ2h+5DO9ijRbb/dndi+PUmQTyxsYpYIsKUfd6X4I
         XuTAUiSD44ey3eRvSEGQ95WBZZefpl8ImHNJiynZYFPJ3O147iyMJQk1Y8vI1gSn+F+h
         8qVkPy40JVGFt0Ywe2P8H2/CyanwEEyXiBF28clyln6uni1aQ9RK5RVhTrDCwczn2PJA
         HEqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CQoROMgheGkTL+kR6wN5hPqjCSlzO0nN+4WRLqliQko=;
        b=dMHLacLg0KQ7jN/znlzuCYfaKIpLwiEye/HknvQcBUVh2X+1LA9W+kLIi68GIkNlyA
         a3OkPGG9ivDDcFMkVfvbLCs9X7mVBcVss8xz4jkuasN+Sut7qzxmESHOHrWI2j/LJlf6
         88DNcL0txbBrbpBbsFmDkUot+yajedm1aCSNi3+PjSTCJ3Bq5/ERIs8mX7rW3UCJGzkk
         uaRMkB4lTTjAa5QorSBKm05xofxGt07KcqAZg8aXohuJ91d+5yNjERbyU0sWwSqb5Um2
         kuCIXkL4jTA2RqjOcwT//xoo+QrA44qk1J27GRp/8UQtC8eF0vKxlUpYJQ26VayIfBKY
         RWYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aWrTHOPi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <peter.maydell@linaro.org>
Received: from mail-sor-f41.google.com (mail-sor-f41.google.com. [209.85.220.41])
        by mx.google.com with SMTPS id e3-20020a170906314300b0078295fae188sor2981554eje.17.2022.10.03.02.32.54
        for <alex.bennee@linaro.org>
        (Google Transport Security);
        Mon, 03 Oct 2022 02:32:54 -0700 (PDT)
Received-SPF: pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) client-ip=209.85.220.41;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=aWrTHOPi;
       spf=pass (google.com: domain of peter.maydell@linaro.org designates 209.85.220.41 as permitted sender) smtp.mailfrom=peter.maydell@linaro.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date;
        bh=CQoROMgheGkTL+kR6wN5hPqjCSlzO0nN+4WRLqliQko=;
        b=aWrTHOPiRxGScTtlBzjMHzGOU0I2Vwxcdwgnns1bXrHkzN2dElUmXPD5uiXiwvKxSy
         spJcdssF68JFZs7P7A3gH9c5jVoM2tXNrOL06PFTGn8PrNXYUqhJCy0vXZvhPpagh66Z
         SFJEW/5Rgda730HLS+C0Kh5wvmtopi7luH+LxTB0x3/vweZSRJXLNIsJBm436onbICZU
         /QvsJp780gk6FV+c494iEnRIrb6NA76F5+6z/R04EZpnJUGvPg9VKr022fVdBkEwT1rZ
         12CVoiaOP3WVWia+TzxBWEKaFWiZfkAFJhlQrzaCj7WSx+HtgCCdsgFakloKs2ZAlCeJ
         5KEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date;
        bh=CQoROMgheGkTL+kR6wN5hPqjCSlzO0nN+4WRLqliQko=;
        b=L1En9ygznwQ3FxRJPEvgFyrxKrrTcwNB+3GsqyxEMjgBteJqan6q4kMaI7vKfG4PHJ
         iQJDaa1GFbyhJG2XjDCTM+FmMx2YbP/m9FSDdu22P6h4/03FmI17mRuIUtx9gZ0Rs6fC
         cHodZzg6pq2bCtzRuDFfTsHU1XZS/5JA+fbWjF8LCVf9BxJxQlDkYeienIIg7nAyhhGN
         n4dAjcv/0N8AdEPH3utG8NNtTOW4vQ3w5uxPjcYbrWgGrqyLiLb2RyCEdEftHkiXl3Pj
         bsAIPCsVjYOdSE9o83JPII1GqsncpX0unMr9nxQt67xlHq2y6y4llZqIfvVvI4cTEhk/
         gSOw==
X-Gm-Message-State: ACrzQf3WRaIAaJLQKqVeShjKrf5LNDzlYEkyD7E9NANzvvsOMit4FP8Q
	5b34RBCTHctunLoDxWUxB5m2uUBejEJd9DPAaFC9WViZ+KV7NWTd
X-Google-Smtp-Source: AMsMyM5EE5JG1EfW3sroYlmCchb853jd7jkeSPBv4U034PIPuhnvXX4WXKzQfk/QlVh8nVN1W0vsniNCYrxaWZv0SlU=
X-Received: by 2002:a17:906:9c83:b0:779:c14c:55e4 with SMTP id
 fj3-20020a1709069c8300b00779c14c55e4mr13976345ejc.619.1664789574173; Mon, 03
 Oct 2022 02:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20220822132358.3524971-1-peter.maydell@linaro.org>
 <20220822132358.3524971-4-peter.maydell@linaro.org> <87sfk5nv5n.fsf@linaro.org>
In-Reply-To: <87sfk5nv5n.fsf@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 3 Oct 2022 10:32:43 +0100
Message-ID: <CAFEAcA8EpE49YADm14BeuX7jBKt6_K3qxVuZGtiwTnCXEXdiWA@mail.gmail.com>
Subject: Re: [PATCH v2 03/10] target/arm: Don't mishandle count when enabling
 or disabling PMU counters
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
	qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-TUID: 5IsY3ITX465u

On Mon, 3 Oct 2022 at 09:55, Alex Benn=C3=A9e <alex.bennee@linaro.org> wrot=
e:
>
>
> Peter Maydell <peter.maydell@linaro.org> writes:
>
> > The PMU cycle and event counter infrastructure design requires that
> > operations on the PMU register fields are wrapped in pmu_op_start()
> > and pmu_op_finish() calls (or their more specific pmmcntr and
> > pmevcntr equivalents).  This includes any changes to registers which
> > affect whether the counter should be enabled or disabled, but we
> > forgot to do this.
> >
> > The effect of this bug is that in sequences like:
> >  * disable the cycle counter (PMCCNTR) using the PMCNTEN register
> >  * write a value such as 0xfffff000 to the PMCCNTR
> >  * restart the counter by writing to PMCNTEN
> > the value written to the cycle counter is corrupted, and it starts
> > counting from the wrong place. (Essentially, we fail to record that
> > the QEMU_CLOCK_VIRTUAL timestamp when the counter should be considered
> > to have started counting is the point when PMCNTEN is written to enable
> > the counter.)
> >
> > Add the necessary bracketing calls, so that updates to the various
> > registers which affect whether the PMU is counting are handled
> > correctly.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> I'm not sure why but this commit seems to be breaking a bunch of avocado
> tests for me, including the TCG plugin ones:
>
>   =E2=9E=9C  ./tests/venv/bin/avocado run tests/avocado/tcg_plugins.py:te=
st_aarch64_virt_insn_icount
>   JOB ID     : 0f5647d95f678e73fc01730cf9f8d7f80118443e
>   JOB LOG    : /home/alex/avocado/job-results/job-2022-10-02T20.19-0f5647=
d/job.log
>    (1/1) tests/avocado/tcg_plugins.py:PluginKernelNormal.test_aarch64_vir=
t_insn_icount: INTERRUPTED: Test interrupted by SIGTERM\nRunner error occur=
red: Timeout reached\nOrigi
>   nal status: ERROR\n{'name': '1-tests/avocado/tcg_plugins.py:PluginKerne=
lNormal.test_aarch64_virt_insn_icount', 'logdir': '/home/alex/avocado/job-r=
esults/job-2022-10-02T20.19
>   -0f5647d/te... (120.43 s)
>   RESULTS    : PASS 0 | ERROR 0 | FAIL 0 | SKIP 0 | WARN 0 | INTERRUPT 1 =
| CANCEL 0
>   JOB TIME   : 120.72 s

Known issue, fixed by
https://patchew.org/QEMU/20220930133511.2112734-1-peter.maydell@linaro.org/=
20220930133511.2112734-2-peter.maydell@linaro.org/
in a pending pullreq.

(I have no idea why avocado reports this as a timeout, because
what actually happens is the QEMU binary prints an error
message and exits with non-zero exit status.)

-- PMM
