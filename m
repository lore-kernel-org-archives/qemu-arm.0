Received: by 2002:a17:505:a38d:b0:1be9:327d:8ee3 with SMTP id rs13csp2358027njc;
        Fri, 23 May 2025 00:12:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCU8eilJ6c+eigPddgsvtJ5u/0n/XWvbnNBEQyyHyJ66cBaSm1yRhsAU0UzJBEXMcthZ0YXxHn2y5LenBg==@linaro.org
X-Google-Smtp-Source: AGHT+IGHstvflibfT49zKGEr50Qh7qW0X1qNfa702BvzL29t+C6WicGVFatvTz0UHrg4EOo2fqE3
X-Received: by 2002:a05:6602:388f:b0:85b:5494:5519 with SMTP id ca18e2360f4ac-86caf06dcb1mr203631639f.5.1747984343086;
        Fri, 23 May 2025 00:12:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1747984343; cv=none;
        d=google.com; s=arc-20240605;
        b=eBQerimdLuxIX9PVnX0624jqopYGE9OeHWh7F2mpNp29EsDtcFDjPptbtUOZmyTKy2
         s2R/T/hZZ4VC+04fVOh5c0T7zyRGkdmBhXBVXYJfNmqEfXN2NVCFFx8YrHMrIg09GoJO
         sPYgVSCKt51if9fkCPdzVn1//2k0CE+aFctJp7oFaiszsat5SIB3Z9g06lACh3DEf7ak
         MIRPaCdt8kSQx9e40lekcojz+FBYaHP/5aPIklj4LgTwcsmHbdiTqu5Z2wsYpGvab0+E
         92QFynCJp/huaFVQx6KnGVBH40oq4AdfsKv00ZfDOOwjxAHK/fNUjlBDn0XYXxU6hDRP
         ptWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:in-reply-to:content-disposition
         :mime-version:references:message-id:subject:cc:to:from
         :dkim-signature:date;
        bh=Z14A0a3u8kB2J/zGRzHx2IwSMKs1AKc3y/w9qkOU9Yk=;
        fh=kUrNE5BQL/QjObzK8qAnpSY6tadBpONtuwT2SklB10Q=;
        b=aUbZxGVWraWB+6Io+wq1knypP3tPNa4GHXtpHCj90VhYHsy63hUrlStPzkV6UOmFTx
         zuUhsd3ARt97H8+vAk4V2phuNkrAOtutDqWw1OCDUIbmQw4zFOLIJHhUqFUAE2Xzql2F
         C01wBKBGr5EVNjQ+rjPG4N4fm/xEUGUqeYaib+olRJ6c5NSq54GwkqO0cArDt/sNO41m
         Cpmw1kmc/FrxDgy6MbWR/ac+SVRqMIASM6sPssicHiSHRqltg4U/2Y9hpu5HKH6xERKX
         k8GsQEbe1FOglq0JQJToAGkhINL0r9pzOJfbi5TieNcTjSnDrU7iVgo1fMDLoe4SSk1V
         nM9g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=M8J6yJoG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ca18e2360f4ac-86a23736767si837431139f.96.2025.05.23.00.12.23
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 May 2025 00:12:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linux.dev header.s=key1 header.b=M8J6yJoG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linux.dev
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uIMZa-0005EL-Tx; Fri, 23 May 2025 03:12:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oliver.upton@linux.dev>)
 id 1uIMZW-0005By-9k
 for qemu-arm@nongnu.org; Fri, 23 May 2025 03:12:03 -0400
Received: from out-178.mta0.migadu.com ([2001:41d0:1004:224b::b2])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <oliver.upton@linux.dev>)
 id 1uIMZT-0003us-Tv
 for qemu-arm@nongnu.org; Fri, 23 May 2025 03:12:02 -0400
Date: Fri, 23 May 2025 00:11:35 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
 t=1747984306;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Z14A0a3u8kB2J/zGRzHx2IwSMKs1AKc3y/w9qkOU9Yk=;
 b=M8J6yJoGpcJW9jnWMjkh1DXuXC9/cT8YuBx0LlSz+QIV+W3hnw3qLXPAWWVeywKAlVDi15
 Z4qdrTHUNeSDI3elGhZnuB1mtBjtnZjyefaHNWEKmQKldkB3LYfjsW65EOVyDm+mg3TLxk
 84jy2cm30oJy+WfyWwgMdagbfCWMp3w=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and
 include these headers.
From: Oliver Upton <oliver.upton@linux.dev>
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>
Subject: Re: [PATCH] target/arm: Ignore SCTLR_EL2.EnSCXT when !ELIsInHost()
Message-ID: <aDAfpy1JCV11cG84@linux.dev>
References: <20250521190228.3921172-1-oliver.upton@linux.dev>
 <dd52d28f-dde9-4506-a850-dd1222a4c903@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <dd52d28f-dde9-4506-a850-dd1222a4c903@linaro.org>
X-Migadu-Flow: FLOW_OUT
Received-SPF: pass client-ip=2001:41d0:1004:224b::b2;
 envelope-from=oliver.upton@linux.dev; helo=out-178.mta0.migadu.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_PASS=-0.001,
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: bWtqnXGxwdwY

Hi Gustavo,

On Thu, May 22, 2025 at 09:06:06PM -0300, Gustavo Romero wrote:
> Hi Oliver,
> 
> Thanks for patch.
> 
> On 5/21/25 16:02, Oliver Upton wrote:
> > Using an EL2 that enables SCXTNUM_ELx for guests while disabling the
> > feature for the host generates erroneous traps to EL2 when running under
> > TCG.
> > 
> > Fix the issue by only evaluating SCTLR_EL2.EnSCXT when ELIsInHost().
> > 
> > Signed-off-by: Oliver Upton <oliver.upton@linux.dev>

%s/EnSCXT/TSCXT/

My bad.

> > ---
> >   target/arm/helper.c | 16 ++++++++--------
> >   1 file changed, 8 insertions(+), 8 deletions(-)
> > 
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index 7631210287..83d4236417 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -7389,16 +7389,16 @@ static CPAccessResult access_scxtnum(CPUARMState *env, const ARMCPRegInfo *ri,
> >   {
> >       uint64_t hcr = arm_hcr_el2_eff(env);
> >       int el = arm_current_el(env);
> > +    uint64_t sctlr;
> > -    if (el == 0 && !((hcr & HCR_E2H) && (hcr & HCR_TGE))) {
> > -        if (env->cp15.sctlr_el[1] & SCTLR_TSCXT) {
> > -            if (hcr & HCR_TGE) {
> > -                return CP_ACCESS_TRAP_EL2;
> > -            }
> > -            return CP_ACCESS_TRAP_EL1;
> > +    sctlr = el_is_in_host(env, el) ? env->cp15.sctlr_el[2] :
> > +            env->cp15.sctlr_el[1];
> > +
> > +    if (el == 0 && (sctlr & SCTLR_TSCXT)) {
> > +        if (hcr & HCR_TGE) {
> > +            return CP_ACCESS_TRAP_EL2;
> >           }
> > -    } else if (el < 2 && (env->cp15.sctlr_el[2] & SCTLR_TSCXT)) {
> > -        return CP_ACCESS_TRAP_EL2;
> > +        return CP_ACCESS_TRAP_EL1;
> >       }
> >       if (el < 2 && arm_is_el2_enabled(env) && !(hcr & HCR_ENSCXT)) {
> >           return CP_ACCESS_TRAP_EL2;
> 
> Do you mind providing a bit more of context when these erroneous traps happen?

Sure. I was looking at updating our CSV2 limit in KVM [*] and needed to
implement SCXTNUM_ELx as part of that. Accessing SCXTNUM_ELx from a KVM
guest under TCG leads to an unexpected trap taken to EL2 in spite of
the fact that HCR_EL2.EnSCXT=1.

The host kernel still has SCTLR_EL2.TSCXT=1 which appears to be the
source of the trap.

> Do we have an issue in QEMU's gitlab about it? What are the QEMU options for a
> VM where this issue can be reproduced and, is there an easy way we can reproduce it?

You could try reproducing with the linked KVM patches but it is worth
noting the current trap routing is rather obviously wrong when compared
to the pseudocode in the ARM ARM. More generally, using the host's
SCTLR to compute traps while in a guest EL is unlikely to ever be right.

[*]: https://git.kernel.org/pub/scm/linux/kernel/git/oupton/linux.git/log/?h=kvm-arm64/csv2_3

Thanks,
Oliver
