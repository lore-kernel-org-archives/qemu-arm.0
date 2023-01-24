Received: by 2002:a17:907:c68a:b0:84d:2074:29bb with SMTP id ue10csp3545170ejc;
        Tue, 24 Jan 2023 01:49:14 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvhJyYlUy+zjmoX0fAbltWeWGCRhvGsbRuXDHzLEgLBNTw6YBpSOXEqedLS3qd2fWoVq46h
X-Received: by 2002:ac8:4e39:0:b0:3b6:3af6:f2e1 with SMTP id d25-20020ac84e39000000b003b63af6f2e1mr38535073qtw.59.1674553753865;
        Tue, 24 Jan 2023 01:49:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1674553753; cv=none;
        d=google.com; s=arc-20160816;
        b=Hdvc8vlAqDuoHkWx7VYr1Q04V688YU4MiKgkiYu+R0AiwOo/SoakAUjlU9tH7VzUJi
         njg+kc1gpS5EPsVtcVv/AEt+YfXxsb0kpeXdJY5r7R7BoWyTRXAXof0JcJeLQmh0wSz3
         UaS2HQfzMqTjjiBJ+ULXcXPoAC9FFWL38NxygUSW7YMtMP3ljMirOF4tUkstfRIe7Unq
         LIaPwaPAT1kDtzYpmIpXHkr7FAzDIE94utf4lrRgolBYbY7vtjvCRgcTlU4/Ish05lKq
         59uUrpNowZ2vfUg/VS/0jrmTs1DK7xjQd864wScfRdnlneCeWH4lO8NpCcoiWP4g8OCZ
         Z7ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8UEks4CwU1BsFxJqEf8zp7FWxLC2BpuJ+D8cbsxTOiY=;
        b=DJavuzGWxhyKehIrb5d6eRgmOI+xIxvCIyYx9qMBl0rVcwYNDRDxtnVrwk9vyId+rg
         XGu0uOvTNdQEbb/t/9SH1jKo4IjJBfm2yWwpoelCv9N/4Y1Ej7z65LfTZPReWyq3sEh3
         plT2jHDo6qMn+Sr+z2g9tEbjaVrdTgoatDtdFxcpt6decV+a+r+BD+qLbrPXXhoVuwHU
         iwjSWAOqg1YZncodCrMl5oipHONjT2KaoKWtbx0Dl5I1GAFU80OJM69mzzjdy1U+lSK0
         2X6jj/D6jl7t3Qu0fghEhrYC5mFbY51G7eWsPkobLoRZUHouD0tEPeUOwF9QEuaMbT3O
         g1Pg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQDjGgmI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 135-20020a37058d000000b006ff026d41c7si1454538qkf.356.2023.01.24.01.49.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 24 Jan 2023 01:49:13 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=TQDjGgmI;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pKFv6-0007cT-NY; Tue, 24 Jan 2023 04:48:48 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pKFv4-0007bP-7q
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 04:48:46 -0500
Received: from mail-pj1-x102d.google.com ([2607:f8b0:4864:20::102d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pKFv2-0004SU-Hy
 for qemu-devel@nongnu.org; Tue, 24 Jan 2023 04:48:45 -0500
Received: by mail-pj1-x102d.google.com with SMTP id j5so644480pjn.5
 for <qemu-devel@nongnu.org>; Tue, 24 Jan 2023 01:48:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8UEks4CwU1BsFxJqEf8zp7FWxLC2BpuJ+D8cbsxTOiY=;
 b=TQDjGgmIMxwu6DVViWYO9ng5RNUW4tpkNMJvJR8SBgrS1ji7dAc+l4VLWricUEb3x6
 Ts0JsVE2JKQHhTgrB4btZoHadgIy697Myx9QbD6CZakz04ULbybPRrtkrsM/NK7Mpwlk
 rbykcavewsy+7akSGEAS3st5/1ZcCK+LRiwb7BS7+T1KLjfUmME4pXhx1xWKnljggOny
 u5CzcSxXigXSCcv8PWrFvWFUNQp9GaON3YBrNpYMHAbre49AZnHMBrdi11FDGj7BeF+z
 YqjgV2eWh5RO+PR5sYDTH0TUd0kHjejDJhDj2yF5mFkBufCM1kqURsxSlGxKxtL2Ucft
 XG3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8UEks4CwU1BsFxJqEf8zp7FWxLC2BpuJ+D8cbsxTOiY=;
 b=wBeHLzxmlzCs9BLwID2RSHBC1zBFr4RhDAuELzwpNNWySSBj9aZrju5Uft0qVRZNC/
 u7MQmzCWRrWjap7nCZTIKczNJJnFQXEWnlGv9Qko5lDXRHf7cg9Sm4aBQriuJgrCQBno
 fXvgH5SUzUznYwMUXhPxKb9d08RYWt8TVKjYDOaNVikDrLGWLZkWz0WAtT7J3DXxEHnU
 XFhyAohAr9KYpaDfBRJ41RMtAGDKFhTHcJauZ6gIMUFYO5247tXWQG3LpqGf6Pz7U+BN
 wdiPT67R7/TGc4MAYoN+DD024JuPFjn8S4x6OvyN5gs55eOrh1HWM4PFy+rcNeoRs/9F
 ZoUQ==
X-Gm-Message-State: AO0yUKUg+vliM50A/05Pl5aKE0KrDmogyKBZnZOMgvF2u29KmSwBrSjX
 dxFit5NnC8OT0BBj2pex4yuMbpwUWEj4nJbeCIH23w==
X-Received: by 2002:a17:90a:8a0b:b0:22b:e329:7262 with SMTP id
 w11-20020a17090a8a0b00b0022be3297262mr516653pjn.221.1674553722925; Tue, 24
 Jan 2023 01:48:42 -0800 (PST)
MIME-Version: 1.0
References: <20230106194451.1213153-1-richard.henderson@linaro.org>
 <20230106194451.1213153-3-richard.henderson@linaro.org>
 <CAFEAcA9mh+eS8rHwqmyjOAmcnPDJ7K54QbJPd7itKZskQeox5g@mail.gmail.com>
 <3443cf40-4013-6ac6-895d-08f86c229809@linaro.org>
In-Reply-To: <3443cf40-4013-6ac6-895d-08f86c229809@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Jan 2023 09:48:31 +0000
Message-ID: <CAFEAcA8hR3QpHP5UjnyAv1LLV6dC_VcW3bnDmu5ubAV5OAWeXA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Look up ARMCPRegInfo at runtime
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6YA6Y4qDC2Qp

On Tue, 24 Jan 2023 at 00:20, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 1/23/23 02:53, Peter Maydell wrote:
> > On Fri, 6 Jan 2023 at 19:45, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Do not encode the pointer as a constant in the opcode stream.
> >> This pointer is specific to the cpu that first generated the
> >> translation, which runs into problems with both hot-pluggable
> >> cpus and user-only threads, as cpus are removed.
> >>
> >> Perform the lookup in either helper_access_check_cp_reg,
> >> or a new helper_lookup_cp_reg.
> >
> > As well as the use-after-free, this is also a correctness
> > bug, isn't it? If we hardwire in the cpregs pointer for
> > CPU 0 into the TB, and then CPU 1 with a slightly different
> > config executes the TB, it will get the cpregs of CPU 0,
> > not its own, so it might see a register it should not or
> > vice-versa.
>
> Existing assumption was that each cpu configuration would have its own cluster_index,
> which gets encoded into cpu->tcg_cflags, which is part of the comparison used when hashing
> TBs.

Yes, I realized that last night (so my edit to the commit message
is unfortunately wrong). If we really did need to share the TB
between different-cpregs CPUs we'd need to do more than this
patch does, because we couldn't generate "no such register" code
in the TB or the other things we do based on what the cpreg lookup
returns, we'd have to do everything at runtime.

We could in theory share cpregs hashtables between the CPUs in
a cluster, except that at CPU creation time you don't know
which cluster the CPU is going to be in...

thanks
-- PMM
