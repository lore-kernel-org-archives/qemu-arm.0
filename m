Received: by 2002:a19:ca1d:0:0:0:0:0 with SMTP id a29csp4863016lfg;
        Tue, 29 Jun 2021 04:51:45 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZXDb6riWUw86DSDKmHb6mEqYAWonsDfY6HHr4Vt4DuYyOCtdT7cIpoAJNZiYqpuhGgApk
X-Received: by 2002:ab0:7c58:: with SMTP id d24mr1062892uaw.95.1624967505276;
        Tue, 29 Jun 2021 04:51:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1624967505; cv=none;
        d=google.com; s=arc-20160816;
        b=PSGy1MRRd2dDkSV/GXIjM2Bfmtnj5mnF026IkP94T3TbCCJo4wlhY0CZDIaIk/0lZw
         czPgm27UHoAWldb/0PeDz+3OU7DApmMJfSAHpiDV6+g1F/x9H7uCW+1sfBYloF0UPbyg
         W1pyBqBCIBhV91gOdKLek2WwgnT6NwMrfVcbk/KKILpW51PghXD7/Xr+BZJA9iiueAL/
         RcJFpK2q/RRY0Y1an4TIAloKYSwYk0f5SVh7511zmX6DBJeXPEpWdBP5Z1tNT6vtBite
         k3nmRqWuwy7YljMIvScSBQ4EQ+Cr1ZC+xFakGPnaqnf5AOSkmITIMtp4fL0hbN0BI5sF
         eQ9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v3IXpGUjc8qI5vhQ4wc3cozPxAi1jf0ua+NuDgJhUQQ=;
        b=zjebWH5Env+YQ6E1SUWqKbnB5S6prITI9DFsLXzKT35H0KdE6/7jHA1nppR672aS2e
         T/FB3Fi5SeBBHuUqT7fOrvwpwjgqA35RoRY7AmMcxcRwbdXcpSxlbmahXEqeLpnLgoe3
         s/lnb+naMCUc84TbnCCdVO7MACQlU4jHQaz0xmWJcGIc/bjzgYbR1L454Xa7lAghnZXA
         bm8SReV5ExknO9zKsyjx/k48k/JLWQii0lKN4/h80gFEvnK4CK3OvXLtOAIbXguauPRr
         Be11NuB96gY5zCHkBtXVPMRDNBNbvZfNsI/lOkoiKt0C3JQ07ZCLN+jdv2w6q9N16PtY
         zS1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mPusSC6Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p23si8944594vsm.394.2021.06.29.04.51.45
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 29 Jun 2021 04:51:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=mPusSC6Z;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44500 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lyCHI-0002wh-GQ
	for alex.bennee@linaro.org; Tue, 29 Jun 2021 07:51:44 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46430)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyCH9-0002vc-27
 for qemu-arm@nongnu.org; Tue, 29 Jun 2021 07:51:35 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:38798)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lyCH6-0006N1-U9
 for qemu-arm@nongnu.org; Tue, 29 Jun 2021 07:51:34 -0400
Received: by mail-ed1-x52e.google.com with SMTP id q14so30877935eds.5
 for <qemu-arm@nongnu.org>; Tue, 29 Jun 2021 04:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=v3IXpGUjc8qI5vhQ4wc3cozPxAi1jf0ua+NuDgJhUQQ=;
 b=mPusSC6Zc9bGX6mGQ2MkMhwo7Zjrsq2TVmCk6wHRfymwAKrE0zQJELCdItuQ4r+C1V
 e2EuBOBvnayPBGjZJ+tlQ8bLBxFPgBja2OXBW8aCzHhx6RG9CDfRsFAF9OnuNcHX/fey
 OnMdFf4PsBFr5wML8eH1Hq4N3ujS7JESkfm0/7Qq0ic3FwC84eeaWNImvWKDGTdzKo0Y
 Z7BMg21Aj2EtO4wk7beeqZ2rr2vWP6gERvOVqKH2zo36cFuJVhsded2UJfbZHjszXlfp
 ubOj2nDkjFUo0+yAJPht9plZBgvlKhFxEQvLRW9lfP30s3Db7REgJE1yyk1n0GA+qb4p
 r95w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=v3IXpGUjc8qI5vhQ4wc3cozPxAi1jf0ua+NuDgJhUQQ=;
 b=jvVUhXHYpUURLQVXiyvoTWyrG9xj3+7MsFIjsD47Ghm7BrvavJCD/EklN5zOjqFrTJ
 R1g9RW0Tbmt8d5AKw05JCQY3Vm5KruKYx3DN+tC36yTGjIYX+dF7aUixiAu9W80nWD4Q
 vj9LJgdoUFUSorxvw6DHlf4oxZZgrkZxhNL0qwa+0CKQHm/A9318tNKqVqgU7f5r2koh
 mIk6IdlmtIdeZ/k10tdiRW3hxGfKqUUzIPukMOh4fht3YBaVpEEepd1RfcNKGKfHNbXW
 JuVlYnC/NNGjPphv1xDMF9SFh8rJ+kOM4JeNB1cpNteRIJBO7hhU+AeJQ+KScskRysJn
 gzzQ==
X-Gm-Message-State: AOAM532UKlczj7lCgLwzPgd/tGATgWh3NTbUyDoQHHRkhVosrXb12qD1
 caS8OWx3B0mEpsSrWr04NLLR14cuNT7VIHfDlQC1bg==
X-Received: by 2002:a05:6402:848:: with SMTP id
 b8mr39517424edz.44.1624967490910; 
 Tue, 29 Jun 2021 04:51:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210629082713.31396-1-hnick@vmware.com>
 <CAFEAcA-vSoriA2iCwyvBWofj1UvtMuRbEnqNuCsoG_hz1Yth_g@mail.gmail.com>
 <35FFA736-504A-482B-B78C-17F7381C7D70@vmware.com>
In-Reply-To: <35FFA736-504A-482B-B78C-17F7381C7D70@vmware.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 29 Jun 2021 12:50:53 +0100
Message-ID: <CAFEAcA-AvYq5ujspY1bxqjzX=1EYP4zY0ortFdNhJwPU+pDJGA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Correct the encoding of MDCCSR_EL0
To: Nick Hudson <hnick@vmware.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
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
Cc: "open list:ARM TCG CPUs" <qemu-arm@nongnu.org>,
 Mohannad Ismail <imohannad@vmware.com>,
 "open list:All patches CC here" <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: cy6ZoSbJZO0n

On Tue, 29 Jun 2021 at 11:41, Nick Hudson <hnick@vmware.com> wrote:
>
>
>
> > On 29 Jun 2021, at 10:49, Peter Maydell <peter.maydell@linaro.org> wrote:
> >
> > On Tue, 29 Jun 2021 at 09:27, <hnick@vmware.com> wrote:
> >>
> >> Signed-off-by: Nick Hudson <hnick@vmware.com>
> >> ---
> >> target/arm/helper.c | 2 +-
> >> 1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/target/arm/helper.c b/target/arm/helper.c
> >> index a66c1f0b9e..7267af7924 100644
> >> --- a/target/arm/helper.c
> >> +++ b/target/arm/helper.c
> >> @@ -6330,7 +6330,7 @@ static const ARMCPRegInfo debug_cp_reginfo[] = {
> >>      * We don't implement the configurable EL0 access.
> >>      */
> >>     { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_BOTH,
> >> -      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
> >> +      .cp = 14, .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
> >>       .type = ARM_CP_ALIAS,
> >>       .access = PL1_R, .accessfn = access_tda,
> >>       .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1), },
> >
> > This fixes the encoding for AArch64, but breaks it for AArch32,
> > where it is cp=14 opc1=0 crn=0 crm=1 opc2=0. Because this is one of
> > those system registers where the AArch64 and AArch32 encodings
> > don't match up, to fix the AArch64 encoding we need to replace
> > this ARM_CP_STATE_BOTH reginfo with separate reginfo for
> > ARM_CP_STATE_AA32 and ARM_CP_STATE_AA64, something like this:
> >
> >    { .name = "MDCCSR_EL0", .state = ARM_CP_STATE_AA64,
> >      .opc0 = 2, .opc1 = 3, .crn = 0, .crm = 1, .opc2 = 0,
> >      .type = ARM_CP_ALIAS,
> >      .access = PL1_R, .accessfn = access_tda,
> >      .fieldoffset = offsetof(CPUARMState, cp15.mdscr_el1), },
> >    { .name = "DBGDSCRint", .state = ARM_CP_STATE_AA32,
> >      .cp = 14, .opc0 = 2, .opc1 = 0, .crn = 0, .crm = 1, .opc2 = 0,
> >      .type = ARM_CP_ALIAS,
> >      .access = PL1_R, .accessfn = access_tda,
> >      .fieldoffset = offsetoflow32(CPUARMState, cp15.mdscr_el1), },
> >
>
> Ah, yes.
>
> As MDCCSR_EL0[30:29] only maps to DBGDSCRint[30:29] maybe it should be all RAZ?

Well, you can't make it all RAZ, because those 2 bits do still
need to be mapped, but I guess in theory yes we should define
read and write accessor functions for AArch64 MDCCSR_EL0 that
mask out everything except [30:29].

thanks
-- PMM
