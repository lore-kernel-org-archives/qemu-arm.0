Received: by 2002:a17:906:f20a:b0:98d:b2f5:1316 with SMTP id gt10csp1323110ejb;
        Mon, 7 Aug 2023 02:54:29 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGd88hmFB+LU+3t3cwQ57agY8oY5RzUGi3EsNkQEsmTe2EbG6JhxyyZ1N+J8xHOcBGk4aHt
X-Received: by 2002:a05:6214:aa5:b0:63c:f2ba:ee82 with SMTP id ew5-20020a0562140aa500b0063cf2baee82mr8386986qvb.31.1691402069606;
        Mon, 07 Aug 2023 02:54:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1691402069; cv=none;
        d=google.com; s=arc-20160816;
        b=ZKZnbhKkHFdiY7E1AcnrAAcTV5Z6MPiQu4kRladUzFcHog5FXpyd0kuDfb9SmEMMK+
         N/W7Ktwr+6p22Vbo0BJ5yiDw87mzEoKmfgGML2ksRmUy9Wqnr8gWrX44/5UY53lVwNAg
         G9t3fXOExiy4RD16AxNebzKrD+bYUYbUl2sDLDqBOfGIlyMO3XeLEhOypDARygnDGViw
         ngiRqRvKfUZNGeGMPZp2+AuguDotGeWluPepgBmt9LWVAglPNE3KGTRXuom5QLAqHT7S
         H20271beDzkpPBZ5eQcXaBeyH0DQ9//2b3J02n89RIVLtrvF39NedaQ4fw/xaNfRTmpR
         s6JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=5AgXqcGWgizO9h0h7Vjhp2nLOL60iwt7LetHDUyXzRU=;
        fh=CEa3UdY0L+UQ/2T/5R8rkDkdq4jlW1F1hWJjDNQD42w=;
        b=tuv/t/EJdos4m+PEDC/ZyD7JOSCGygHpZD4HEikQUJvBFMiHYlmDy3SS2BSIfo4G1s
         T4568RcwA/TbNRXRvOW40LzVytDuTdLyYlYCexzrFSX0z9JKk6nktWhs0Gm3eXcWPHP2
         m4M116gK9F3DsYjC92QZRcK4t6QOFSuPuFAUUF1Dk+PTH9hlJwr4xn3eXyTaoqlL7qZ2
         ebcutGeskVVE0AxJwZZPqANmWlIa+eQ9pyB/AMByDBYBDwc1XDZtjtGIvkVWdDOzf8mf
         ythGprMn7Dlz0PS4L9+a3wWJfFPvqk+iBPONPo4UGcT9E2IoDX8hdge46C8ryzPnGd7/
         CxWA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RqejgfN4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l10-20020a0ce50a000000b0062877820931si4423867qvm.323.2023.08.07.02.54.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 07 Aug 2023 02:54:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=RqejgfN4;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qSwwS-000877-EM; Mon, 07 Aug 2023 05:54:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qSwwP-00086L-5l
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 05:54:21 -0400
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qSwwM-0004WT-Hs
 for qemu-arm@nongnu.org; Mon, 07 Aug 2023 05:54:19 -0400
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b9f48b6796so64673321fa.3
 for <qemu-arm@nongnu.org>; Mon, 07 Aug 2023 02:54:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691402056; x=1692006856;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=5AgXqcGWgizO9h0h7Vjhp2nLOL60iwt7LetHDUyXzRU=;
 b=RqejgfN4nrQkFkpGlwiJ00kJtk6a6VuF+UhKEbANZ3g6gXOnz3j4zUGQelM3+opDsa
 hvxr2/RnJhWbjfyDaZ2hSIUWqsDUFGg5ujlvKIr36ZwfMlftAYCu8LcFSrHlLaFNjon6
 hzcjk8q/ER6hKxiF/TssmISqpz1yPQDOYSOo4LuGBRDzhQPcQg9ct6F3g1AjrwnqcOJ5
 hAcNVv2dLphn9/3c7zrFrhEAbRw12UXfCpfWrMabOUCRNLWlyXbHkZ9K4NaP8ss/qXoy
 jNTXuyZg/essu7b1fnch2hteJGX/AOzwOFZvhzhqsvxK3mAU2GCKO3UU5TVKSgEhDqo4
 WfLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691402056; x=1692006856;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5AgXqcGWgizO9h0h7Vjhp2nLOL60iwt7LetHDUyXzRU=;
 b=iRUt73rA+yivJD82sIsQ22vLHut8/mjT76a9dsai5dz9lsS35M7A6IhErSjVReBxjp
 OugLvVIsCamZl/KeG9rokCk1BJ7ctgiWsa0m1aUIIBL4v/28thltVA3tuGJOkX/15qcQ
 VaizdFparRk9RMdGTtH17pgjg3G4tpXXc/UbaujuJaMYFOedqF1n/1uYFeHLPQ9X+RAD
 KvkFKAJIXLUO2EkNcL+1S6d/4Qjxvkli2kE8BaEi4iibBj+BcRMFcSnqqRn2xIGnyQgD
 SGyubvXhEV3x22RK0ueKxdP0sgrQVSl9I3CG2IPPbdqLpWFmtS+1ffk7KGIBcB6Xg6ED
 3QHA==
X-Gm-Message-State: AOJu0Yz0hY3eR6mj3JI83DnWpGVI0RVyhVUpX2yUhlh2D9T3Isn7tBh8
 zp/UY+7msXesG1WyZdvtKn/l9B0Emve2h2JfBFiEHw==
X-Received: by 2002:a2e:98cf:0:b0:2b9:e053:79d8 with SMTP id
 s15-20020a2e98cf000000b002b9e05379d8mr6547585ljj.18.1691402056436; Mon, 07
 Aug 2023 02:54:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230802170157.401491-1-jean-philippe@linaro.org>
 <20230802170157.401491-6-jean-philippe@linaro.org>
 <CAFEAcA-0p2UhURwgLRnUxSK8ktFsULsHz5x3pu+h80VOPBrZvQ@mail.gmail.com>
In-Reply-To: <CAFEAcA-0p2UhURwgLRnUxSK8ktFsULsHz5x3pu+h80VOPBrZvQ@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 7 Aug 2023 10:54:05 +0100
Message-ID: <CAFEAcA88J5QnuoJWOsVJj4qOhDHy-P4LMo+v5UdMLOQxy=pvQA@mail.gmail.com>
Subject: Re: [PATCH v2 5/6] target/arm/helper: Check SCR_EL3.{NSE, NS} encoding
 for AT instructions
To: Jean-Philippe Brucker <jean-philippe@linaro.org>
Cc: richard.henderson@linaro.org, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x235.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: IDrRxGIxcycL

On Fri, 4 Aug 2023 at 19:08, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 2 Aug 2023 at 18:02, Jean-Philippe Brucker
> <jean-philippe@linaro.org> wrote:
> >
> > The AT instruction is UNDEFINED if the {NSE,NS} configuration is
> > invalid. Add a function to check this on all AT instructions that apply
> > to an EL lower than 3.
> >
> > Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> > Signed-off-by: Jean-Philippe Brucker <jean-philippe@linaro.org>
> > ---
> >  target/arm/helper.c | 36 +++++++++++++++++++++++++-----------
> >  1 file changed, 25 insertions(+), 11 deletions(-)
> >
> > diff --git a/target/arm/helper.c b/target/arm/helper.c
> > index fbb03c364b..77dd80ad28 100644
> > --- a/target/arm/helper.c
> > +++ b/target/arm/helper.c
> > @@ -3616,6 +3616,20 @@ static void ats1h_write(CPUARMState *env, const ARMCPRegInfo *ri,
> >  #endif /* CONFIG_TCG */
> >  }
> >
> > +static CPAccessResult at_e012_access(CPUARMState *env, const ARMCPRegInfo *ri,
> > +                                     bool isread)
> > +{
> > +    /*
> > +     * R_NYXTL: instruction is UNDEFINED if it applies to an Exception level
> > +     * lower than EL3 and the combination SCR_EL3.{NSE,NS} is reserved.
> > +     */
> > +    if (cpu_isar_feature(aa64_rme, env_archcpu(env)) &&
> > +        (env->cp15.scr_el3 & (SCR_NSE | SCR_NS)) == SCR_NSE) {
> > +        return CP_ACCESS_TRAP;
> > +    }
>
> The AArch64.AT() pseudocode and the text in the individual
> AT insn descriptions ("When FEAT_RME is implemented, if the Effective
> value of SCR_EL3.{NSE, NS} is a reserved value, this instruction is
> UNDEFINED at EL3") say that this check needs an "arm_current_el(env) == 3"
> condition too.

It's been pointed out to me that since trying to return from
EL3 with SCR_EL3.{NSE,NS} == {1,0} is an illegal exception return,
it's not actually possible to try to execute these insns in this
state from any other EL than EL3. So we don't actually need
to check for EL3 here.

QEMU's implementation of exception return is missing that
check for illegal-exception-return on bad {NSE,NS}, though.

thanks
-- PMM
