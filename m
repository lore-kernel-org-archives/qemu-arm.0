Received: by 2002:a17:906:b088:0:0:0:0 with SMTP id x8csp2030912ejy;
        Tue, 20 Sep 2022 13:57:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM7gzxS2rzQvmnBIGkwCP8L9glIY7fOGv60fEWd+j1L/Xk0J+F4Pkkm8dnNVcbQAXG1OzoDN
X-Received: by 2002:a05:6214:27e5:b0:4ac:c227:2111 with SMTP id jt5-20020a05621427e500b004acc2272111mr20451093qvb.127.1663707449903;
        Tue, 20 Sep 2022 13:57:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1663707449; cv=none;
        d=google.com; s=arc-20160816;
        b=YgXfiDcAhZ8y8aiInAfMV8Ec2+xdIUIAZfBcK4pLJFSQpXbKnXR8bwZdqZrA3JMWK7
         c9yPV8wUWDyZcQ2Nos8DUjTEszJ5j2BSlmfxWpDD3B4bp0jiARCCgGglhj44ntutIxpk
         1AAmXjmGq9xemu0ZhkK0tU9nl56sEZuR0Y4TeYBTeLyL0Gd8hllVtB7IghPhTPMYIu5X
         gvl8sO0bsdGRayzmia+sQW30//ow5+s5Vt+epJJFHs4vFoajGGhGF5Z33lkhoSfgxpf8
         KubfB16duJCZRaHrM8GjH2SGG9nwQOr4jneRNlgWpwN93bGFhsBVEhH0WjjLxXcBZlGk
         RYqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4HCElNzxi9fXay2wgMg1C/+5kWB6SjuogoB7SUnuQ9Y=;
        b=gb9qoMs4EBxmjfWmjSQodTGOflHC956wIInCXJlZi47Y3n9ho9iekwi3B6jbjpMArR
         ICD6BQvj31i6t8mkXCE+SZ3dTjkyBtdO0dY8C6lBOd+9p1maPrvdvijJWuhf/V2XgRGG
         v6sSTFEVzOVwzYn/NCRfyMJmx+m6fLP1pj6CoHKnB1A50GOoEQFqO01NxpP7t/TRcUYh
         3eme8zwaUQBmlP3Q6vvFhN71EBmI9k2+PKNo4gB3x8fNnw/scpCmLDD9xr4sYbMHPyl3
         Ff/QuiGmP8FNJ1PxvAC6mPRCHbQjRN92+jp0DAwB2WWeS+uGZ88Qa2spvqVGzn2uclsj
         DW4g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XVETZK3P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iw9-20020a0562140f2900b004ad0df810cesi441262qvb.545.2022.09.20.13.57.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 20 Sep 2022 13:57:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=XVETZK3P;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:34158 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oakJ7-0002vJ-BQ
	for alex.bennee@linaro.org; Tue, 20 Sep 2022 16:57:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52198)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafgo-0004uT-4o
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 12:01:52 -0400
Received: from mail-ej1-x62a.google.com ([2a00:1450:4864:20::62a]:46801)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oafgl-0005HO-Ns
 for qemu-arm@nongnu.org; Tue, 20 Sep 2022 12:01:37 -0400
Received: by mail-ej1-x62a.google.com with SMTP id bj12so7199897ejb.13
 for <qemu-arm@nongnu.org>; Tue, 20 Sep 2022 09:01:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date;
 bh=4HCElNzxi9fXay2wgMg1C/+5kWB6SjuogoB7SUnuQ9Y=;
 b=XVETZK3PflKUqA6p1y2AZUxA/9sXfRnRyLhFT0y51kA44b3ZFTB/gg5d3Cappmhrzu
 zSFhOmBjKP1whPvzfS3ID0LLhOQxI2q7DzXNUeQOXI/gcL46f21evXbhoaU8F19awkek
 nDoefYlIEf47H9B39p7DmBqQb7TinvIxmj62oi0frR0KadFmNAel3TaPMgc3z/oJSQ28
 Q2Ri+pPkAMYvD8MbQDT7hLYwiELhftxPP6VPDA1w5VFsOaPmQ5pqk9/31HbY84S4y4gg
 iMmST8ZNuhay33PP5dzC3KWG42z1t3/zSKxsPiKfOBw/q9oaMTsdSuAcVkb6y9ygACQR
 V2JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date;
 bh=4HCElNzxi9fXay2wgMg1C/+5kWB6SjuogoB7SUnuQ9Y=;
 b=oMx65JaO5pt7D3tp2fWP28u6sioQNCJimJOJkPFyPO5vyyftySPSNrvTlKmSOoCdsC
 Ux7SyGrwxLcxFVnecbjweFem/DwPI4wS/M+7lmhSzpwllPQzsbGflfYjOvpq69UhDzQp
 n+wulF1NYNVl0Dyc0WNuDXRPdlyG1QtXHaAJk6ZGoA+EIZazvD9qR+0Ih35LN0kef7WE
 t19IhxhBpgg60GpRI0U6Ex3zKrND7W/SfadjxubqFwL7+hLDT/1xKdHg04hYBlH8/NWb
 7A6wZYixTy+yDGjDN3xvIa8SGdoMwgQHNvhW/BhlRlUb/gXxPY8Y6kQkVkztl/VMneLn
 auNQ==
X-Gm-Message-State: ACrzQf07QaDdjm7JB7VKwf+rMnanae4nyj5hU0kf/iO+bWO241JAIgPJ
 Ay4rWD0jN3c6mTk+RaCUb3x7a6owJ1BWK+Pc2DWiTw==
X-Received: by 2002:a17:907:7209:b0:778:e86e:568 with SMTP id
 dr9-20020a170907720900b00778e86e0568mr18056317ejc.659.1663689693619; Tue, 20
 Sep 2022 09:01:33 -0700 (PDT)
MIME-Version: 1.0
References: <20220822152741.1617527-1-richard.henderson@linaro.org>
 <20220822152741.1617527-32-richard.henderson@linaro.org>
In-Reply-To: <20220822152741.1617527-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 20 Sep 2022 17:01:21 +0100
Message-ID: <CAFEAcA9MuZWy1Y7yMLdh-xVb=HhGxi6bzabeiE-KT7r2DLwnhA@mail.gmail.com>
Subject: Re: [PATCH v2 31/66] target/arm: Fix S2 disabled check in
 S1_ptw_translate
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62a.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: /lM4GDXcn/kT

On Mon, 22 Aug 2022 at 17:23, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass the correct stage2 mmu_idx to regime_translation_disabled,
> which we computed afterward.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/ptw.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index dbe5852af6..680139b478 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -211,11 +211,10 @@ static hwaddr S1_ptw_translate(CPUARMState *env, ARMMMUIdx mmu_idx,
>                                 ARMMMUFaultInfo *fi)
>  {
>      bool is_secure = *is_secure_ptr;
> +    ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S : ARMMMUIdx_Stage2;
>
>      if (arm_mmu_idx_is_stage1_of_2(mmu_idx) &&
> -        !regime_translation_disabled(env, ARMMMUIdx_Stage2, is_secure)) {
> -        ARMMMUIdx s2_mmu_idx = is_secure ? ARMMMUIdx_Stage2_S
> -                                         : ARMMMUIdx_Stage2;
> +        !regime_translation_disabled(env, s2_mmu_idx, is_secure)) {
>          GetPhysAddrResult s2 = {};
>          int ret;


This doesn't actually change the behaviour, though, right?
regime_translation_disabled() at this point in the patchset doesn't
do anything that makes a distinction between Stage2_S and Stage2 AFAICT.
So this is just making the code clearer; we fixed the actual bug in patch 19.

With a tweaked commit message,
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

Alternatively, pull this patch earlier so it's before patch 19 and
is the one fixing the bug; then patch 19 is only adding the
is_secure argument to regime_translation_disabled() and doesn't
fix the bug in passing. That would be neater but maybe the
patchset reshuffle is too painful so I don't insist on it.

thanks
-- PMM
