Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1997873lfj;
        Mon, 16 May 2022 06:35:28 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw7q0cnfe7kmEFkfpuHWJE9bFbMl/ZvXfVbd5HsOSkwYZLd63/9e2loCgN4yAROWfGnG5zm
X-Received: by 2002:a05:6214:c88:b0:45d:6bfc:9fed with SMTP id r8-20020a0562140c8800b0045d6bfc9fedmr15517671qvr.10.1652708128278;
        Mon, 16 May 2022 06:35:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1652708128; cv=none;
        d=google.com; s=arc-20160816;
        b=otqkhWxqVFBSR03uBv1HyrlMSVe+xwbidf4aYb9xG722az5v4jwvAsNiiDubhfE1mq
         e3UUCFvtexdlciF1IepGIiw7m2mlkEgxfqZm24frizIDZ56+lymS39JWVYeE1kJkxby5
         NAL0zk68gWok6haEiMbAEQCN60E628rpUR3W2uu4mQXeSbGXdWp9kpIrfolCfZIb2sLd
         4h2A8dVw8gGrJy+OD8tesgILaxEuibiceGMElJp7UpqNyewm3Rg5JboQTFCLOyn83P+9
         VvuTBEWrN2sQpRfC9dwdiyxNeGKTU+COZZPfwxCBTGaVDHozHiTD2SNfH7oXqIYj2twn
         YQug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=jbhyEbyvD+uYSBvHJ8EQP/lrd64If6VR1aJBV/+Npxg=;
        b=bHG8GB5NAfBjYZuZ0iMzUpeEv517V/01tVjchz/sTF0/j8C+mJpLPu+y6OXMAY57CT
         Ryiin4iJVkVYtdQEhm7UERh0CvsNbzquQcDe0x3mcXbWlnQRKnaIWuDFwMWclo/Gjsdc
         VEdgP4+jurVey/LeMrRmzx8XfgcNx5zqx7lN+uuwE0L7dxH1D22V0Uvp2IU1FDaAQFUG
         qC79HWq3IX/kBY+N2PDTqqBHz+Kd5fobrycqbbxe9uTN6x5oy5hVj9gcTeQyN1SrsK5s
         xFa5OADfPUGCg9kkEO6elZ1Yg6JJe5TMUmiOCqJA0fFNSPgbdRLv9vklRtJspkMnCG7A
         kpmA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=in4G59uA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f18-20020ac87f12000000b002f3ad5568d0si6163360qtk.532.2022.05.16.06.35.28
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 May 2022 06:35:28 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=in4G59uA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55522 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nqash-0002je-Pg
	for alex.bennee@linaro.org; Mon, 16 May 2022 09:35:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:60478)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqasW-0002jT-To
 for qemu-arm@nongnu.org; Mon, 16 May 2022 09:35:16 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:45501)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nqasU-0004Mu-Vv
 for qemu-arm@nongnu.org; Mon, 16 May 2022 09:35:16 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-2fed823dd32so42947507b3.12
 for <qemu-arm@nongnu.org>; Mon, 16 May 2022 06:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jbhyEbyvD+uYSBvHJ8EQP/lrd64If6VR1aJBV/+Npxg=;
 b=in4G59uA0irOQ75L835YFRIWJ33B+ZOW2yhmU2rTzacbBPaqmmT+15UPdLvkUg07dp
 mjCTGkZrrQJbrWu2csVj0cUS2nUA5btzTg4rEtVXpV0UkmdDB+oymShxkp+80L3/ImTo
 Rr4/l968itg/mfao6Z/UpmNpZFYMhOEUcGyWAGy8CGnoM+JgYc0i3A+RvthMtXV6djND
 7gtoHVzmO7ZVXFuQtdKkGyh5ZXymx1EhYEYKqd+h+APGI1xhuM8nxnRDepQPFYJeyneq
 33hcrJjqBqGrhGtmyNa8Lu+cUVKMxvuNqgWLF63MDUgHwB2SxFMaY/tuP2OTiDIEyEqg
 S5WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jbhyEbyvD+uYSBvHJ8EQP/lrd64If6VR1aJBV/+Npxg=;
 b=JSlYtGanXDhdt5ODXv3h9Y43THJG42JzdHpW+K5Qa84x/qHLfzJ3kUFEOS1a5L2UQ1
 JHGZWZkXsIonTXz5JZAIetGf6K6zDojWHz1Qe874TwpyMdQM5KuIPmQsHcrXt2jHkpS7
 9igp7rvyFTe+4biNKS/Xtmhhm8Pa1QmVvs+IPxOQGEKDQbgSLcgeZ/w3O3CpxS5kfFdm
 MsaOhBRqfv77G26evQjZQJBoxUqQhQkikjinw51gRASUAYyu1SJ36lxZVw7h49CryVAe
 nQHkTcRApkqIyB77tuecbhOJC/KznOhupXrY0noSCrpwsfhizBgasgx/hLJ0udDTFjQH
 wu8w==
X-Gm-Message-State: AOAM53144F1bRuHlFwq/IV2FFqEf45O83Yr8Bn9BkpETRvUR/HS11SAq
 EXaQ4Jms/y14HO4qQcVSBc1LFB+oQcoqhPgryfob6A==
X-Received: by 2002:a0d:fc83:0:b0:2e5:b0f4:c125 with SMTP id
 m125-20020a0dfc83000000b002e5b0f4c125mr20022111ywf.347.1652708113958; Mon, 16
 May 2022 06:35:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220516103058.162280-1-peter.maydell@linaro.org>
 <20220516131032.ykidzcfvjhxqmets@debian>
In-Reply-To: <20220516131032.ykidzcfvjhxqmets@debian>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 16 May 2022 14:35:02 +0100
Message-ID: <CAFEAcA94EpfKrgYjupzDacvVn+c45ao_fdYaDjMp7mCUbacN6A@mail.gmail.com>
Subject: Re: [PATCH] ptimer: Rename PTIMER_POLICY_DEFAULT to
 PTIMER_POLICY_LEGACY
To: Francisco Iglesias <francisco.iglesias@xilinx.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Alistair Francis <alistair@alistair23.me>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Jy9bj7HJ/y1Q

On Mon, 16 May 2022 at 14:10, Francisco Iglesias
<francisco.iglesias@xilinx.com> wrote:
>
> On Mon, May 16, 2022 at 11:30:58AM +0100, Peter Maydell wrote:
> > The traditional ptimer behaviour includes a collection of weird edge
> > case behaviours.  In 2016 we improved the ptimer implementation to
> > fix these and generally make the behaviour more flexible, with
> > ptimers opting in to the new behaviour by passing an appropriate set
> > of policy flags to ptimer_init().  For backwards-compatibility, we
> > defined PTIMER_POLICY_DEFAULT (which sets no flags) to give the old
> > weird behaviour.
> >
> > This turns out to be a poor choice of name, because people writing
> > new devices which use ptimers are misled into thinking that the
> > default is probably a sensible choice of flags, when in fact it is
> > almost always not what you want.  Rename PTIMER_POLICY_DEFAULT to
> > PTIMER_POLICY_LEGACY and beef up the comment to more clearly say that
> > new devices should not be using it.
> >
> > The code-change part of this commit was produced by
> >   sed -i -e 's/PTIMER_POLICY_DEFAULT/PTIMER_POLICY_LEGACY/g' $(git grep -l PTIMER_POLICY_DEFAULT)
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>


> > --- a/tests/unit/ptimer-test.c
> > +++ b/tests/unit/ptimer-test.c
> > @@ -768,7 +768,7 @@ static void add_ptimer_tests(uint8_t policy)
> >      char policy_name[256] = "";
> >      char *tmp;
> >
> > -    if (policy == PTIMER_POLICY_DEFAULT) {
> > +    if (policy == PTIMER_POLICY_LEGACY) {
> >          g_sprintf(policy_name, "default");
>
> Hi Peter,
>
> It might be that above is clearer after this patch with "legacy"

Oops, yes, we should adjust the test name string there too.

thanks
-- PMM
