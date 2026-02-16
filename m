Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D1C0E81A3A
	for <qemu-arm@archiver.kernel.org>; Mon, 16 Feb 2026 15:53:29 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vs0uE-00073Z-5l; Mon, 16 Feb 2026 10:53:02 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vs0uC-000737-Pz
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 10:53:00 -0500
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vs0u9-0002YT-MV
 for qemu-arm@nongnu.org; Mon, 16 Feb 2026 10:53:00 -0500
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-797d857e3f4so5877347b3.3
 for <qemu-arm@nongnu.org>; Mon, 16 Feb 2026 07:52:56 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771257175; cv=none;
 d=google.com; s=arc-20240605;
 b=UlRRwFzCCib92352Rz+JE5i0Ul5FwmQfVorMg6h3WGRzawUTDPF/NPdLwWOt6tkxLY
 XIq+vrjnKDSA5ws8ppORu3A93hDPWl5yBLVG/qNxhNH3L0ZVf6maGgsfU/eqXUlr+FK1
 Gp/zOjqURHFFPLWA5wVS8Pkgc7/o/BRoKm+3rN/OUQCYu45qlzNx22/nCVakng+cFGjZ
 I/OWByfrhM3m4ksAiRaiOutYQV5XEm3tjC1Sp4NP2nlJ3Z8r+eGW1s3AZviw6Wecjhvs
 a4zWZ13Lc4alV+R4EyVRU98SBrz6cfuVrAcGOWMKExZfZegENGwHqhuI/jgyijM10YpJ
 OrRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=dP7OJCe4IFWPzF0ucWa9rG4RGTcEJ98iWAzWk9PebNw=;
 fh=PykF4EyEgubqfAmOc4/WtooI/ur5Llx1JuvMjC9c6nc=;
 b=AXvZybHIKU0wdd8/+jKU334YYzohmO4/Iw4CwHk990GAe7+4Hqnu21LtoD82BVI2sV
 JnwSxXgwGmA6/QBSM7r1f5Qxjqlep0gJzoV/nxh0/LZTiJCD+/FEWWyJWAserM5JBCka
 R+UHjMEFlayKL6EaDUqk65BIH171M3NnzCy6jBEx554E+Y1wcxEr7LRSc4QQnLDdLfMv
 5EfhuyHI93ilp53aneoXZeGjmnXRlMvcrRVMAarmiyLQOPXj2AqT9tZ80iPC/6ZuqzyD
 AvYCCMETdEA04Z7XHh9hQ4TS0Lnzh1Ab2fIb0JQKTD229p09Z00X3nxVQETwJKLJHeVv
 Q/XA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771257175; x=1771861975; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dP7OJCe4IFWPzF0ucWa9rG4RGTcEJ98iWAzWk9PebNw=;
 b=bWLFI05SO3r4bFhIvkP8h2prIy+BCbOGf9Aq7uWqYnKR2YiSfNMHkida9w3iEMykfr
 i5/g7wkTkxmWwKOXnoBtM45xi9pvl834Sq8goCXdQRk9fa2xuyYVA7voj6Ej1dBjZpp0
 ft10i1beZM2y2GufPjy7zM3hg0OwVwVMfv6UT4PuZ/E5IaYNfDrdozSqXqNuQcUHA76e
 Ed5nbvpILi1sKGRUZhVm24+nPJBBseqNfvRUBzuY/esba4E+wgKt1L0fPXEMlyp+3JH6
 nXheY/jrt4VEmxopapfqpg9Y1eM5vkux56PnlbLH7a623cfPdP9726qYFUoOIDuWJu2U
 btOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771257175; x=1771861975;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=dP7OJCe4IFWPzF0ucWa9rG4RGTcEJ98iWAzWk9PebNw=;
 b=lmVzq2gi9rwgP1sQvVNxrcoTDgyLvosjFjfR6KyStRA0GbR9BpvTL44rQK86uv+sEE
 sUXjYol7QkCPgv0hnmig1UVcl3UoowL2eoSomoJFyZr8a7gYBE/Lesi2oWr5KhgSRQh1
 GIuy15uJFug2bX0UUivqnKqeBdk63nm0NrbXipYQ8e3mML53/CKwm7ihGgtXxs3ObwPw
 wk3kiyXZnnDIGNNyUrrCbYuXYrgjGVgXkn/HqNTqOZUl8DjX2O6XEj2JJnD37kDxY4+d
 6UGC/2dkXYsRpEOvzjro30ReMBxNy6IJKncjkGs2PFGrez5wRM7gQeBrpicXhEVXkkCQ
 B9Ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTq+UUrcnMo1HgFBcUJpkOhd2SP/y/9k414oV2c7Ig1nQgxYV+XaAGIwR7a4Z8cYQkCEIdMuhFhQ==@nongnu.org
X-Gm-Message-State: AOJu0Yz7q7dVID0YPHTM5VEaaTAsyB5ZFBY3B4rPWKx/qO/awgwDU/m6
 DKZYmbI4y/seqz0s45eApY1brgDdLK97BHlz5z0yLA0vKfIpyxmsNfMW6NB0M36DHMDreI/6NIk
 5oD81keSca7iBHZEMMJtNqpXCrl3rJ4bTJwr6jitDJMv8HVwLtJk32hU=
X-Gm-Gg: AZuq6aIlQEyD+r4cPw3CgvXlWgBt41ExP8jDoJwtH6rBhJMZmNKHjraJkluC/rAKKiI
 +sluJEq0JF/g335ubTz9m9j9bBhCJbQNSzKUnMPL6b7fmdHo5PBQmTQ/IwY6ilhsDYGXbNlbRsJ
 IPEUbWhHbQvuJ7/e+JSaGaknpHEwy6uIu1ONCnxjcAMX8CQqa+3aw8Kyk5f1m35ECoVUzC1N7Gb
 dmU0aF4J5Rti+iE3RTCNuE2xdheR35fF0Pv0IqCa0jAa/mXUJH9HbstNHnwl3yjy2dIoXdcp9MI
 fmnX1V8UKHdYc+HdN8EwsGPSZr3u+GgTlievWV7tKjTDtcevzAt2wZf5skCrjJB5F+9+sw+8qSf
 S3g==
X-Received: by 2002:a05:690e:13c4:b0:64a:ee12:e7c3 with SMTP id
 956f58d0204a3-64c21b27b78mr6172226d50.49.1771257175307; Mon, 16 Feb 2026
 07:52:55 -0800 (PST)
MIME-Version: 1.0
References: <20260210201540.1405424-1-pierrick.bouvier@linaro.org>
 <93f8f250-7899-4528-b277-1ddd469c192c@linaro.org>
 <CAFEAcA9YUOxko51ziY3yAOaDfTCEAwqmXnifF=q_mkyotFHTcg@mail.gmail.com>
In-Reply-To: <CAFEAcA9YUOxko51ziY3yAOaDfTCEAwqmXnifF=q_mkyotFHTcg@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 Feb 2026 15:52:44 +0000
X-Gm-Features: AZwV_Qhn_PA25doQjTID65lEcz5xT-1XaHevKcqNoTL7fZxazaWzkWciCHn6keY
Message-ID: <CAFEAcA8XCSjjb2opkf2A5WZwCa5THNswOOUO=fpj7kUJEc79qQ@mail.gmail.com>
Subject: Re: [PATCH v3 00/12] target/arm: single-binary
To: Pierrick Bouvier <pierrick.bouvier@linaro.org>
Cc: qemu-devel@nongnu.org, anjo@rev.ng, 
 Jim MacArthur <jim.macarthur@linaro.org>, kvm@vger.kernel.org, 
 Paolo Bonzini <pbonzini@redhat.com>,
 =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 12 Feb 2026 at 10:59, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Tue, 10 Feb 2026 at 20:19, Pierrick Bouvier
> <pierrick.bouvier@linaro.org> wrote:
> >
> > On 2/10/26 12:15 PM, Pierrick Bouvier wrote:
> > > This series continues cleaning target/arm, especially tcg folder.
> > >
> > > For now, it contains some cleanups in headers, and it splits helpers per
> > > category, thus removing several usage of TARGET_AARCH64.
> > > First version was simply splitting 32 vs 64-bit helpers, and Richard asked
> > > to split per sub category.
> > >
> > > v3
> > > --
> > >
> > > - translate.h: missing vaddr replacement
> > > - move tcg_use_softmmu to tcg/tcg-internal.h to avoid duplicating compilation
> > >    units between system and user builds.
> > > - eradicate TARGET_INSN_START_EXTRA_WORDS by calling tcg_gen_insn_start with
> > >    additional 0 parameters if needed.
> > >
> > > v2
> > > --
> > >
> > > - add missing kvm_enabled() in arm-qmp-cmds.c
> > > - didn't extract arm_wfi for tcg/psci.c. If that's a hard requirement, I can do
> > >    it in next version.
> > > - restricted scope of series to helper headers, so we can validate things one
> > >    step at a time. Series will keep on growing once all patches are reviewed.
> > > - translate.h: use vaddr where appropriate, as asked by Richard.
>
> > Patches 1-11 are reviewed and ready to be pulled.
>
> Looks like patch 12 has also now been reviewed, so I've applied
> the whole series to target-arm.next.

I meant to send this to the list, but accidentally sent it to
Pierrick only:

I just ran this (plus some other patches) through gitlab CI, and
it fails to build on the kvm-only and xen-only jobs:

https://gitlab.com/pm215/qemu/-/jobs/13131658696

In file included from /builds/pm215/qemu/include/exec/helper-gen.h.inc:9,
                 from /builds/pm215/qemu/include/exec/helper-gen-common.h:11,
                 from ../target/arm/helper.h:7,
                 from ../target/arm/helper.c:13:
/builds/pm215/qemu/include/tcg/tcg.h:35:10: fatal error: tcg-target.h:
No such file or directory
   35 | #include "tcg-target.h"
      |          ^~~~~~~~~~~~~~


https://gitlab.com/pm215/qemu/-/jobs/13131658593

In file included from /builds/pm215/qemu/include/exec/helper-gen.h.inc:9,
                 from /builds/pm215/qemu/include/exec/helper-gen-common.h:11,
                 from ../target/arm/helper.h:7,
                 from ../target/arm/debug_helper.c:11:
/builds/pm215/qemu/include/tcg/tcg.h:35:10: fatal error: tcg-target.h:
No such file or directory
    35 | #include "tcg-target.h"
       | ^~~~~~~~~~~~~~

I think the problem looks like it's in "move exec/helper-* plumbery to
helper.h", which has put the "emit the TCG gen_helper_foo inline
functions" into target/arm/helper.h, when they were previously
handled by target/arm/tcg/translate.h and so only in source files
that are part of the TCG translate-time code. helper.h only needs the
prototypes of the helper functions themselves.

Some of the other new helper-foo.h files look like they would
also have this problem, except they happen to only be included
from tcg files. For instance target/arm/helper-mve.h is only
included from files in target/arm/tcg (so it maybe could be
in target/arm/tcg itself).

I couldn't see an obvious easy fixup for this, so I'm afraid
I've removed the series from target-arm.next.

thanks
-- PMM

