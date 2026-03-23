Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97FF0EC01C9
	for <qemu-arm@archiver.kernel.org>; Mon, 23 Mar 2026 11:11:34 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1w4dBt-0003vP-NS; Mon, 23 Mar 2026 07:11:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w4dBo-0003ts-Cq
 for qemu-arm@nongnu.org; Mon, 23 Mar 2026 07:11:20 -0400
Received: from mail-yw1-x112e.google.com ([2607:f8b0:4864:20::112e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1w4dBk-00039A-L1
 for qemu-arm@nongnu.org; Mon, 23 Mar 2026 07:11:19 -0400
Received: by mail-yw1-x112e.google.com with SMTP id
 00721157ae682-79a535e7c00so18722407b3.3
 for <qemu-arm@nongnu.org>; Mon, 23 Mar 2026 04:11:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774264275; cv=none;
 d=google.com; s=arc-20240605;
 b=ZZWP/LQADvAOVJzqWqty/k4dGWMuC1AkqlmvDKqqTYMymJTpq8cbRicSdHAgTz8pis
 Y3iIG92LE8jnQAO9AQKQHiQK1Md28UEf4sBKMZTrEqanmpkXMms5LjvYt8bEbtWXbg6d
 8PsPTB+e8n1fLWyFnUqOUnHClGtH+sCy/0jv3PfrRe9mzWJSwXIvHQHye6wLm9jYqWP8
 mRupHu+sMEACXW8NiSrcE7v4kNAiVfN9I2AlCQD+KzBBzmRTdO1urMrZhNM5VwIIr6vJ
 vFK+VNl1jzFsok/MMKMbaZ2ftcDsl+JeQwW0efOPiCCwiYZgaiowExO3BcrSXPWWAXZq
 6KVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=2F2lEXMb2/G//JV0DrWIHHuQfVGU6SP/uEXKNBCtlDE=;
 fh=YS5wRIIksskKfxhMYCHs9JAscA0jt8781LhUM4yKYwc=;
 b=GPUpRFUdh/ed8DkWEtTvT25T6mLizi0Yj0/VAHPBW2wjVq3fKiN3HfwcRDdFuQg3oX
 i/2WZQevRx11yszyxI3UqFeULVnMrQQHteqVfvtaiw+2yjHdMizE8I2cAlYrMYy3kZgs
 hGvWT4bkqzUIDhHY7p2Cd4e9Oqe5ZThWjtBSGg0eXcs+rRIxgggK7ynXROZUmTRGqfTU
 1bCzuGPlmaIs78RHkMBQ7hZs2vTATqPPyqmOWB/K+e1PxEnDVmMrTINAQ+GssA/vuosM
 m8cUUzk57wqMix9I7H3blnSnLeGiNyr4Kh92/Eu3dckl+VByxNl1OZAzXqRQxD/bvp2Y
 bIxw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1774264275; x=1774869075; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=2F2lEXMb2/G//JV0DrWIHHuQfVGU6SP/uEXKNBCtlDE=;
 b=EIEs0BeM868/RSIcaNY0Fq8atXw9XYocnSIR1B3GJO9CdgNXsEgnuQTwhRSQ0DUfFZ
 xAG92SDBAT/kxHhIxgE2fIWR5ys7rLt6fSYnPw4+9aASguFz6pexlNB4eEs6125cvIDM
 RHwsk917lX3vSzIC3gXz4N1l0J7/RjOxHuRtfTOZu2zGUjJVo5Y3N5njFWQ0pY7U3M8c
 uNSiXzutyPUUPTM2hGR660yKhKLCLLK6HEKKVpGlIy8RL11EZ+6I9ZZmHhIm//OeRdHI
 9Z5pDBJj9C0m2YOmMOUuEbuwQ0aVaoxcG581ISFNlQoYbg3pg2fdadkyax/ETnraGIaO
 rqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1774264275; x=1774869075;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2F2lEXMb2/G//JV0DrWIHHuQfVGU6SP/uEXKNBCtlDE=;
 b=iE49YwaaFWCMbHOtFksx635pCdA73kHqWLid/p0SR3kKaSLlV8UdKLPv/lFi3uPzyT
 f+KAH75M69KheJz8agb/wKxz2eL1mW3mmkA8n1JYAYv+GnCT8YGuoxmSbxJXNYKhRQLm
 +B94PIuOCTZSs554a8QGZB5QJaeQK+Q9kahMUCxG9cfmBf75bfOQG+ToS3U+69Hd/DER
 sy98OjAVRr0JxGGnZsm2xL4jmqIyVr4bDnOtQZuiykTine3sTpk9dFWdqXywqKyT4y/e
 fccQOUG5YKs0AV1cbZGpx81lzLNFY27NEb4EHwxKWJNmlw8UXnGKeCKlwu7P7GAqct4D
 Z1GA==
X-Gm-Message-State: AOJu0YwZZZZokefMXv8z11ypIHpJaAhN3Tjm4BwQSYhaSke1xIRZ52+s
 8HDChjaMWeQQGvCjpkXZOKIFXnD2qq47WeiZHeoBWNxxht6VwaS/dvz8TpMF6L6cvknmg2liry1
 ITGwufS0P0/4M5McoHc9vxouB9d5BPM2oxlU89rLXVw==
X-Gm-Gg: ATEYQzz3PE1EVu/oXZCs2q0e0ZZrYpVUe5KIPeUySYz66FxrHHf+apP/5mmhFZSkh6n
 cC7P6Yxzde37oiIPy6x8/J5rmN1Tr+83R3ahbE1t9nIKCG98aU6aiFwivw+kftj8C4rWKQvp7It
 tj+DQONF/QM+n87+m+nMq4CfBv5Uu6l+t33BmAbWEqU4J2sduWuKW99IgriZw5vzOjxKQi5YGX0
 ZAJ+CK1jSGD/j9l3hwbAMTgwenIaTrNVlVtmfoQXT0NbPo5G33IHm0vhHaXmODpBXl4bG93UJBB
 SW/xq+8HF69dCmEOPLTVN2SpbtHpx1V5r9Qk7FxBExYIKH3N3SqPSBe4KrvsJxRczAqkD2WDCWJ
 i+Q==
X-Received: by 2002:a05:690c:c512:b0:795:254a:b433 with SMTP id
 00721157ae682-79a90aa2ff3mr120726397b3.6.1774264275316; Mon, 23 Mar 2026
 04:11:15 -0700 (PDT)
MIME-Version: 1.0
References: <20260321231916.2852653-1-josemartins90@gmail.com>
In-Reply-To: <20260321231916.2852653-1-josemartins90@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 23 Mar 2026 11:11:03 +0000
X-Gm-Features: AaiRm53yESZKrfXMaSfsowO89gNJuIYZLeLjHY7bpNduVs5mKJRogDbPfNkbf-k
Message-ID: <CAFEAcA8N4kMYW1zNmSpiMPXG-MUjh2awiZbZuFtOnqzRW+ir=w@mail.gmail.com>
Subject: Re: [PATCH 1/1] target/arm: fix s2prot not set for two-stage PMSA
 translations
To: Jose Martins <josemartins90@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, richard.henderson@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112e.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Sat, 21 Mar 2026 at 23:19, Jose Martins <josemartins90@gmail.com> wrote:
>
> commit 015cefc0ed65 ("target/arm: Add in_prot_check to S1Translate")
> changed get_phys_addr_twostage() to combine stage 1 and stage 2
> permissions using the new s2prot field:
>
>   result->f.prot = s1_prot & result->s2prot;

Hmm? That commit doesn't add the s2prot field or touch the
get_phys_addr_twostage() function. I guess you mean
a811c5dafb7 ("target/arm: Implement get_S2prot_indirect") ?

> The LPAE stage 2 path sets result->s2prot explicitly, but the PMSA
> stage 2 path (get_phys_addr_pmsav8) only sets result->f.prot, leaving
> s2prot at zero. This causes the combined permission to be zero,
> resulting in addr_read being set to -1 in the TLB entry and triggering
> an assertion in atomic_mmu_lookup() when the guest executes an atomic
> instruction on a two-stage PMSA platform (e.g. Cortex-R52 with EL2).
>
> Set s2prot from f.prot after the PMSA stage 2 lookup, consistent with
> what the LPAE path does.
>
> Fixes: 015cefc0ed65 ("target/arm: Add in_prot_check to S1Translate")
> Signed-off-by: Jose Martins <josemartins90@gmail.com>


> diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> index 8b8dc09e72..e289f88124 100644
> --- a/target/arm/ptw.c
> +++ b/target/arm/ptw.c
> @@ -3200,6 +3200,13 @@ static bool get_phys_addr_pmsav8(CPUARMState *env,
>
>      ret = pmsav8_mpu_lookup(env, address, access_type, ptw->in_prot_check,
>                              mmu_idx, secure, result, fi, NULL);
> +    /*
> +     * For two-stage PMSA translations, s2prot holds the stage 2
> +     * permissions to be combined with stage 1 in get_phys_addr_twostage().
> +     */
> +    if (regime_is_stage2(mmu_idx)) {
> +        result->s2prot = result->f.prot;
> +    }
>      if (sattrs.subpage) {
>          result->f.lg_page_size = 0;
>      }

The code change looks correct:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

and we should
Cc: qemu-stable@nongnu.org

thanks
-- PMM

