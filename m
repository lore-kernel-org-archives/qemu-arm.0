Received: by 2002:adf:ef42:0:0:0:0:0 with SMTP id c2csp2997675wrp;
        Mon, 23 Sep 2019 11:46:37 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzrt4rY1MNyinkpz/F/gDx/ajdrSbuKLON+HjdcGc8/6fOk1ZSAScmwJ7Div4WPdGoFMygo
X-Received: by 2002:ac8:1492:: with SMTP id l18mr1497564qtj.307.1569264396970;
        Mon, 23 Sep 2019 11:46:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1569264396; cv=none;
        d=google.com; s=arc-20160816;
        b=mAbL9g7XY52xN3kEr0lDYl18WesSplhcmk5vu1Co0iYzRL4TqP4uCLcyikhIvipYBG
         WThviEUnoyUC/jlrZ6Kz4T3g88UY+bcJgDdqGIZfMV68vs0IrUz0MrP+56AWTaE3DpvS
         IAFNiexG7wi8aMXNGZ7ItT5JbXVlg7RfCaYTucIBYyZIvv3hoRryv2CJ/dwOzqEvQcpE
         uXppbXSSh5mEiHTVk+8r/Y0qFa8+DbE2CQvsLf+J8UTDT8VozoUdnlAtsaKP2V5iKDph
         X0n1zzNWKuhwvSCJkxwmESzsqCHRF7GSLrJoWTC6PQjF6fDaMqnpcoA2y57g2KWn5LES
         z07Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KMDbN0XbMZ7rBzqGtCLrNofny0/zzxmpSX7mG9zel2s=;
        b=urMTLyYvIEGPG725u2NCzTmfLM3QvogYT7S5fbK/eVShOkl7Dnr7GGkZ9vqY9qVK4B
         g+w+6EL+ZsN7vKJNnbJni1HvtqjGY6YZTY87K3vCFUb7MEIbnZhNvvwrN2nWLxbnrbVP
         5dMLe/j6lROLec+ByrAen2tr+QOASZulsIn/CflAZEhaQnCweZwFOCe6EkYGR3J4/mus
         L3mB8C/n+yP4H3kHMZ2j8/ei3+jsOAy6Q1YshAuaUiCJ4WHIfqM88Osmss48wYiGhPwX
         3g59toKROmq9hyPGYFIv93F2PyN/op3a438rF6vlp3ltdq5jL6bpEuZbSVPCjMN7o801
         Wl/g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=n0Nyo+WZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u24si9069273qte.225.2019.09.23.11.46.36
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 23 Sep 2019 11:46:36 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=n0Nyo+WZ;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:32870 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1iCTM4-00080J-CQ
	for alex.bennee@linaro.org; Mon, 23 Sep 2019 14:46:36 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:53219)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1iCTLf-0007yz-1v
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 14:46:12 -0400
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1iCTLd-00077v-LM
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 14:46:10 -0400
Received: from mail-ot1-x331.google.com ([2607:f8b0:4864:20::331]:37735)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1iCTLd-00077h-E2
 for qemu-arm@nongnu.org; Mon, 23 Sep 2019 14:46:09 -0400
Received: by mail-ot1-x331.google.com with SMTP id k32so13081852otc.4
 for <qemu-arm@nongnu.org>; Mon, 23 Sep 2019 11:46:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KMDbN0XbMZ7rBzqGtCLrNofny0/zzxmpSX7mG9zel2s=;
 b=n0Nyo+WZNw/mDwitZSaK52HIQin/uriYLSURUSM1D+n1wEAy2xWLkjembti1ZGPtD2
 /GCtzsNFv4ZF2Yz8/XOxeUJ/eROmeLY00rwYCf7d7Bw06od+MHUbevwBfAGJkU8YvwBh
 SrjJBuaS8/khFc0T5h1Oj2yfqdh1ZRneXY1arTQACqmr0HKTDXjA18UOoK29lV247389
 cqj0iIbw1uaHZFH9HRTYijKcYn6VEZgA7SCIq4/y6MxC1m1SYxV21+M9ngy9v9v2ntvf
 97ITlESQW6xcXUls0HKXgZLZ26ApS60aD6N9XfHxzaVHJzb9rdQrKm2EE/pEZSqzxsmt
 +DQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KMDbN0XbMZ7rBzqGtCLrNofny0/zzxmpSX7mG9zel2s=;
 b=EN3vhDFhf0/knzZN+QrEiC9FgTKu9E2aptRkACltV78X91LHhevbDOzj/0Brljar1Z
 ktvF7Vt48V6GjqXpYV7pYX2laOWrpBGXxTQlNymvw7eKo6KeyoBIENDfhntX69s89FA/
 XefgDruB5VxBw3hyPLsxBJOnjA8HOtUgHPRKXfYKqGY7wX8kdSTeUs1LaWuVVByJ5Ezu
 8ugrr19KKZvecSoNzxNUX8L4nrcbNBaiZ/W5KoyyUfnD+CNWbn5sCCmpDr4f93NTj6V/
 qK+lBlbPyG1gifvj0QLmduvsp7Qgza2kgVgWsGDyGLo7oSBuEGTzmzZ0FX+vFaM0qdx/
 /AOQ==
X-Gm-Message-State: APjAAAUHrR2bZg+rypioYLAtxK/cZVlZXZy4rzF2xZhNwWX2D33v/OQG
 E/sFd4XU7Usld3fmMzNWnkcg1hc5mwkcaLdmf/xWxA==
X-Received: by 2002:a9d:562:: with SMTP id 89mr1156080otw.232.1569264368542;
 Mon, 23 Sep 2019 11:46:08 -0700 (PDT)
MIME-Version: 1.0
References: <20190921150420.30743-1-thuth@redhat.com>
 <20190921150420.30743-3-thuth@redhat.com>
 <bd6efd14-9200-98e2-4f76-dda101f85274@redhat.com>
 <8585b93b-e239-829b-d634-b89941f27aed@redhat.com>
In-Reply-To: <8585b93b-e239-829b-d634-b89941f27aed@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Sep 2019 19:45:57 +0100
Message-ID: <CAFEAcA9k59CRG23qP-o5PF0mdXvXpszhuxx+GpbpWO+hFdHOOA@mail.gmail.com>
Subject: Re: [PATCH 2/4] target/arm: Move cortex-m related functions to new
 file v7m.c
To: Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::331
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: Auger Eric <eric.auger@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 qemu-arm <qemu-arm@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@redhat.com>,
 QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mpjDXtkS1oOr

On Mon, 23 Sep 2019 at 19:09, Thomas Huth <thuth@redhat.com> wrote:
> However, there's one thing I currently don't quite understand in this
> code (since I'm not an ARM guy, sorry) : There are references to "v8" in
> m_helper.c, too. Is that related to a separate CPU type, ie. should the
> v8 code also be available when CONFIG_ARM_V7M is disabled? Or can the
> code in m_helper.c be disabled completely if CONFIG_ARM_V7M is not set?

QEMU's naming conventions here is a bit confusing, for
historical reasons.

Architecturally what we have is:
 * "M-profile" -- this is the flavour of Arm architecture for
microcontrollers; it has some big differences from A and R
profile (eg the exception mechanism is different and it has
a built-in NVIC interrupt controller). All the Cortex-M<anything>
CPUs are M-profile
 * "Arm-v7M" -- this is the v7 flavour of the M-profile
architecture, eg Cortex-M3.
 * "Arm-v6M" -- this looks like it ought to mean "v6 flavour
of M-profile", but if you look at what features it has it's
more like "cut down version of v7M" (fewer instructions, cut
down exception model, etc, but some things which on A-profile
don't appear until v7A are present in v6M). Cortex-M0 and -M1.
 * "Arm-v8M" -- v8 flavour of M-profile. The big change here
is support for TrustZone. Cortex-M33. v8M comes in two
sub-profiles: "mainline", which has all the features like v7M,
and "baseline", which is cut-down in the same way v6M is a
cut-down v7M.

In QEMU, we implemented Cortex-M3 first, and then added -M0 and
-M33 later. So mostly our function naming convention uses
"v7m" when it means "any M-profile"; a few v8M-specific
functions use a "v8m" prefix. Everything in m_helper.c is
M-profile specific; most of it is used by all M-profile cores,
and a few bits are v8M-only or v7M-and-v8M-mainline only.

From a CONFIG switch point of view I don't think it's
worth being able to #ifdef out the various flavours of
M-profile individually.

thanks
-- PMM
