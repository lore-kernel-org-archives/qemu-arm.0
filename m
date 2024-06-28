Received: by 2002:a17:504:7599:b0:1be7:c013:c773 with SMTP id j25csp220611njm;
        Fri, 28 Jun 2024 09:28:18 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXG/1BytdqscmlNhg5x0mE3Uir13+1yGf7vM9bIaWrcLU/hXngXqPWVFQpjI18wbn7OveEcWgJw1UCiUvWqhx9+pXHZcUQ2
X-Google-Smtp-Source: AGHT+IH1yBDXGHCqi2R7BaotKJsSU529qHrnPVYTZ2g8p8xW65LmynUPJZpuD/CRn6V3jRQst6rr
X-Received: by 2002:a9d:6288:0:b0:701:fef8:1531 with SMTP id 46e09a7af769-701fef81e3dmr1138872a34.12.1719592098167;
        Fri, 28 Jun 2024 09:28:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1719592098; cv=none;
        d=google.com; s=arc-20160816;
        b=XHas1I3dXnF2ydanGgovLELmRaB9D1J6kv3bHRg2rKT9hxN7qyJglrLJ5ped2EJS0G
         C/mjL23M/vNvmZU0Au3WzkAWONPxLfxOYAp2MZcv0x6M4Hceiy/KD8OPy+reoL8U+Eix
         4TaMgVRDYxwpHgkxFsi0V0uYGCpDtvTwPgSo+4W68Rz0AIDa+cUkmM5xT7xbSZpl2j8J
         k1WaurAAt6j50KkO2+9BE5P3q11L2pctplkOwAp8GaKJYrXQJAQNZQiJuyedFJ/0zYTZ
         jCYsfuAcDbIo2V2ZG6AkwN3VUVYMGyWgHHe7/grg6yEXfEqVOSRKgKIwP9PGoWfqnjld
         hbrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=yL8FuGKU73EXqaXpsQFCabNbWF8pEBccj11qb+fKFbA=;
        fh=PKodlsZ4sLOulf3vcyB9a9UvxkkwctzJ7UL5PZ8dNXQ=;
        b=ZEmr87LjlGvjLlHXSd5aVaHj2OiQahbCmGhgVdg1L7dFv9VMGc1SCLZnE0Mw/xFxy8
         KxtI5PGQ+bVD8k48MT+ahD3XCtlDaDZJ8JtPehXjwAcFPHtfC6wVdqfl5F+YSmYL7lCS
         Sp7pITLjlskgRNSXbiQaKR7E7zxCgwwir6z3VFmkzETFXkLNMXIKD0H6Prs7pa/8agox
         gWg/gA64588blgD7W5AzX4sQYHIjcTvK8GUpSl7nPfX1INDZqj1lFg76p9ZfhyAIGpMd
         x8XCVgkaozJh1m+wrxXywuST28MnQi5Nu1HUdG0VBOxqTfmU/DwkAB8j4ssBzQN5bCQW
         K6+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QOag0ezy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d692f0943si243230085a.243.2024.06.28.09.28.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jun 2024 09:28:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QOag0ezy;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sNERr-00021M-DQ; Fri, 28 Jun 2024 12:27:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sNERq-00020y-53
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 12:27:42 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sNERo-00013G-CW
 for qemu-arm@nongnu.org; Fri, 28 Jun 2024 12:27:41 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-584ef6c07c2so2911952a12.1
 for <qemu-arm@nongnu.org>; Fri, 28 Jun 2024 09:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719592054; x=1720196854; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=yL8FuGKU73EXqaXpsQFCabNbWF8pEBccj11qb+fKFbA=;
 b=QOag0ezyvI4gq+NS/8CcWp3nLJYgOn1752ZY3v2G0bhUsxTzfGXGzRz55J1B9cz8qm
 +F8viHrUheIGlC0l6ZQ2bpJhMFhRrhDQytWjXufXTS02wrf0DfaMKlzBzysL1NkkFcOE
 io9qmpdyCukSlfQfLlmtd9YcyhkNo6Ak4KiXr/MDfl9L2f/hrshezspv5K6EsisoohaR
 rJr+i36lFvJlGRtHSAWYXn39G6uLQWjNqBj++fG7ohxK3W0RdD/7RHFluLPuPl9NK5vg
 fd6jP//fnqxahwEzMP2RuG1//30G8wrDjvhjy9J6s4TJflZDdodHaFZN7j1JJAbZGER1
 mDqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719592054; x=1720196854;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yL8FuGKU73EXqaXpsQFCabNbWF8pEBccj11qb+fKFbA=;
 b=BuicXPvJ/A4qqV1sSbiHmKMJTYVWYy+dlDL9qvvUhfw4H6bzNwww058S/f57gmvGna
 NSbG05/z9DjXyox+CEZYYfZDj0iKfjA3Na1Pj9y8FLlOJj0ZySlRtm9U+u9ZCbp7Qmra
 VSyrHaGpNvznP/Eys6V7ftWVlPVSDI0RXWywfpIWvrCUaUiHEFQz9rS1s+OPps17LtWp
 Wu45t4t5E7N4sHlBKbYSABOkySPdD3Nck6MR/cfI8WeRzaNospW/xO6H+dLk0M0aa4ca
 tBoecPnsTc4pvSBvY66O61XOtsVEeNysxeylhwKUcXpPR9aZMV96ZltpVgdMDujfAz+r
 FhOA==
X-Gm-Message-State: AOJu0Yw7IYxBd7MMPz16iHekc/1cg/KscQ39gO+ptBDjbo9nTz7Cxust
 tP/CZdBGq9r3cb0ZzGTgnJVmTZC6Jzl/q1rI1FygBlc9OS+lPafZj1944reE/lmFnOMBjiGdU3C
 EeDQiRZkNyISUDhwff/UrMVZ78izu4sxrSX6a/w==
X-Received: by 2002:a05:6402:3595:b0:57c:bec1:ff4b with SMTP id
 4fb4d7f45d1cf-5865c3f51bfmr1915608a12.10.1719592054546; Fri, 28 Jun 2024
 09:27:34 -0700 (PDT)
MIME-Version: 1.0
References: <20240628142347.1283015-1-peter.maydell@linaro.org>
 <20240628142347.1283015-5-peter.maydell@linaro.org>
 <ea780763-ffb8-4a97-8a60-5128f1ed017e@linaro.org>
In-Reply-To: <ea780763-ffb8-4a97-8a60-5128f1ed017e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jun 2024 17:27:23 +0100
Message-ID: <CAFEAcA8JR0FFfq_Meg2XV5BLmjXJBLcDJjw=7u7PkP4STmRTug@mail.gmail.com>
Subject: Re: [PATCH 4/9] target/arm: Support migration when FPSR/FPCR won't
 fit in the FPSCR
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: d7lf7BeCgvaE

On Fri, 28 Jun 2024 at 17:01, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/28/24 07:23, Peter Maydell wrote:
> > To support FPSR and FPCR bits that don't exist in the AArch32 FPSCR
> > view of floating point control and status (such as the FEAT_AFP ones),
> > we need to make sure those bits can be migrated. This commit allows
> > that, whilst maintaining backwards and forwards migration compatibility
> > for CPUs where there are no such bits:
> >
> > On sending:
> >   * If either the FPCR or the FPSR include set bits that are not
> >     visible in the AArch32 FPSCR view of floating point control/status
> >     then we send the FPCR and FPSR as two separate fields in a new
> >     cpu/vfp/fpcr_fpsr subsection, and we send a 0 for the old
> >     FPSCR field in cpu/vfp
> >   * Otherwise, we don't send the fpcr_fpsr subsection, and we send
> >     an FPSCR-format value in cpu/vfp as we did previously
> >
> > On receiving:
> >   * if we see a non-zero FPSCR field, that is the right information
> >   * if we see a fpcr_fpsr subsection then that has the information
> >   * if we see neither, then FPSCR/FPCR/FPSR are all zero on the source;
> >     cpu_pre_load() ensures the CPU state defaults to that
> >   * if we see both, then the migration source is buggy or malicious;
> >     either the fpcr_fpsr or the FPSCR will "win" depending which
> >     is first in the migration stream; we don't care which that is
> >
> > We make the new FPCR and FPSR on-the-wire data be 64 bits, because
> > architecturally these registers are that wide, and this avoids the
> > need to engage in further migration-compatibility contortions in
> > future if some new architecture revision defines bits in the high
> > half of either register.
> >
> > (We won't ever send the new migration subsection until we add support
> > for a CPU feature which enables setting overlapping FPCR bits, like
> > FEAT_AFP.)
> >
> > Signed-off-by: Peter Maydell<peter.maydell@linaro.org>
> > ---
> >   target/arm/machine.c | 134 ++++++++++++++++++++++++++++++++++++++++++-
> >   1 file changed, 132 insertions(+), 2 deletions(-)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> Not ideal, as vfp_get_{fpcr,fpsr} are called 3 or 4 times during migration.  But unless we
> have separate 'fp*r_migrate' fields in cpu state, initialized in pre_save, there's no
> getting around it.  And I suppose migration isn't exactly performance critical.

Yeah, we could have done it that way, but I am assuming that
the time taken for this is pretty miniscule in the general
scheme of how long migration takes, so I preferred the
way that doesn't clutter up the CPU state struct with
migration-only fields.

If somebody cares about migration downtime performance (which
does actually matter for some workload/use cases AIUI) they
can do some benchmarking and tell us what the actually
slow parts are :-)

thanks
-- PMM
