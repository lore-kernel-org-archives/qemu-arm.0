Received: by 2002:a17:504:1dd4:b0:1be9:327d:8ee3 with SMTP id b20csp774648nji;
        Fri, 12 Jul 2024 05:54:48 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXMWMhC+SHoF6evl1imKmuJaigErVTWQ+Xv/d7cfiTzjplwOK0iSKdgUGvNebfc9MoyKU32WYGjIA09lteLcwzaw12qW+0J
X-Google-Smtp-Source: AGHT+IF6GbarS4lbPLzBrHATB4DRQmCI/CaKdtEJcNe6Dp4v8md96Brtn81KvVem4i3sRrR/t0tU
X-Received: by 2002:a05:620a:4711:b0:79f:1860:5629 with SMTP id af79cd13be357-79f19ae5370mr1519389285a.55.1720788888035;
        Fri, 12 Jul 2024 05:54:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720788888; cv=none;
        d=google.com; s=arc-20160816;
        b=g2hg4LJmAqJc3RJn4cZ22Ka9eFOhhgkJJdDXMN6/BDEISXS+lLUCvZ0Is1SQtp7vIZ
         3bUMmvtytK7ZPGC46s5yIbFnpHdk5uBdHbzBS4rAr8WGA1cQc64/EaubaiSeH3HgKHVu
         5D0Vn9D/hTzLeaNrZiEqRXKGshEGF07FuNisLryr7fbmO5AxQpWHjhSLHZ9eLbmmyUXW
         WzWSvK4J44m9SgqnHT8e5P740PHeuhfidu/y8ZFk9b17vGdn7t6Vylem9sifWHFVF13H
         HdxCCuYD7SG6xog+Z9wFXwEjMTccwYeGs4O9J5OpCsTCD4+8iNnEhxG9vkehPVVwgDh8
         Yfcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=w3LFhu/HGc++2pHpMUYF9LvJeoWIcHgg9CKQjzdkSME=;
        fh=Cy2DHmTIaDwfCD3iBHY4vrhoFm5uSkiuV8R7bIL3+no=;
        b=MFHAhT7eypo1ysBdamfQkv/zjIAoa4PnkpZRZCUphWRq7eWZCynFb1lD2loixd4WOJ
         mJapCMwd965Tfj7tvjl6XMomS0NPDxAjlS0tZTNjlgQz9H/yswFZrxo2zsuJQ50hieAI
         geziuDnnuf4IwZePHbdVBkN9XHriNfNOy+FrbYnjb7wioor+xHr1E/SCjtC9mhDRO4l+
         LUtLJLhzXfC02T/ULcwrpziMclLde+W8v7o7yyOKrw/ts3HGaJkmP4jFc3hkNYfCAqwE
         ur3NOprZv4Zv7b12Ca+VefhrVBcgjSPhHJeGLddIQ5iv63sBEpLMwrVl5MsK4RoopURk
         wDRQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wPshzpHm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79f1900f4b7si936598585a.87.2024.07.12.05.54.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 12 Jul 2024 05:54:48 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wPshzpHm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sSFmz-0002lf-V4; Fri, 12 Jul 2024 08:54:18 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sSFmw-0002T0-Ae
 for qemu-arm@nongnu.org; Fri, 12 Jul 2024 08:54:15 -0400
Received: from mail-lj1-x229.google.com ([2a00:1450:4864:20::229])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sSFmu-0002ox-G5
 for qemu-arm@nongnu.org; Fri, 12 Jul 2024 08:54:14 -0400
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2eaafda3b5cso18607621fa.3
 for <qemu-arm@nongnu.org>; Fri, 12 Jul 2024 05:54:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720788850; x=1721393650; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=w3LFhu/HGc++2pHpMUYF9LvJeoWIcHgg9CKQjzdkSME=;
 b=wPshzpHmVZK6dZkeKHfmaHpCEtYpOUEHyGdWUPeThj0evv7Sq/AUrGkTQOa6/YdKse
 uXreh3GNKERMVzQqad+pdKGXAALyGI5/z77enngPKJDH4vV00cDa1L/6kabWMuvvVBYE
 n0iVKIvLSRqXAKPEFDax2qXnPhfDv4DeeKKWDPQZ37DoX1hJALKpFy2p65Htx7piGU6m
 D5BI5U9udOqDMyMNy1cbYRuTI7VgdWE2/9Rg66XtX1OGHPbFRFaZ0lj7vOfyptUogBrb
 Lqz/U1jC5VMcvDkLTS2hN9375agAQmTNiGIC2Ks92+LR71fK7H/oVtBF5J4NutPlLbyy
 XxTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720788850; x=1721393650;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=w3LFhu/HGc++2pHpMUYF9LvJeoWIcHgg9CKQjzdkSME=;
 b=gPX2lKnREno+6y8X6w/6AIho88/da1oCe7TwKbWjLvO2L1HYcUW8+2RR4y8stNrD2q
 9vzsZFCCMfJJCAsXHHutBcYWehLsUhaU14FPMVjMMLjE5YIuY45jtZdK/8WrzRhvzUQp
 6vW3qYTgkkcj1Jp4bVpHYx1rUzjr9YKc2P1CC2UFPkgYPrNlUJ6rPBDVkYWebySmJjVM
 wXAQCz3swLrRm1qGtlfjG4H1jbjelx7eyeXGwxE01npio/xDX/Cr0tvTIVH4al8aDQjY
 IBa/J9zjkUUj3UAJqrDqORi/KO9fGdmYjXta5mbj0B9Tq3paVmXMUiat5Pily1wUZL2Y
 EDlg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVWG7RNbPPErQP7liK1BbMk4RQpvTktlH0NEcTFdqwTNvdQmQOSTJXjbta7ksNiv9W9o7rwDgodr8kdn7/ETk7rX66x
X-Gm-Message-State: AOJu0YzcFGwdD4iuATNV175+/gNGV1VePJrQ95iBbIvS4CeiPtnYH/7H
 JlBtK/9zwgt99rhGXybFaOc8LYLErNIgo2g1c6VmMs3cMfIRjKhuPxUjQnXi0e35XE6nfhA6RAW
 xJetVrcK5DNY1hTR0Bpr++JOHacioCjCr9/yNyw==
X-Received: by 2002:a2e:9d88:0:b0:2ee:db2c:5754 with SMTP id
 38308e7fff4ca-2eedb2c5827mr139581fa.42.1720788850328; Fri, 12 Jul 2024
 05:54:10 -0700 (PDT)
MIME-Version: 1.0
References: <20240710032814.104643-1-richard.henderson@linaro.org>
 <20240710032814.104643-4-richard.henderson@linaro.org>
In-Reply-To: <20240710032814.104643-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 12 Jul 2024 13:53:58 +0100
Message-ID: <CAFEAcA-R7Bh9oLcxPPx+Nr6DmsqKkMKzc0NF5Q8jpw206YtyUA@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] target/arm: Use set/clear_helper_retaddr in
 helper-a64.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongu.org, 
 qemu-s390x@nongnu.org, qemu-riscv@nongnu.org, balaton@eik.bme.hu, 
 max.chou@sifive.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::229;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x229.google.com
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
X-TUID: F+SBdNUUWoOA

On Wed, 10 Jul 2024 at 04:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Use these in helper_dc_dva and the FEAT_MOPS routines to
> avoid a race condition with munmap in another thread.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/helper-a64.c | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/tcg/helper-a64.c b/target/arm/tcg/helper-a64.c
> index 0ea8668ab4..c60d2a7ec9 100644
> --- a/target/arm/tcg/helper-a64.c
> +++ b/target/arm/tcg/helper-a64.c
> @@ -928,6 +928,8 @@ uint32_t HELPER(sqrt_f16)(uint32_t a, void *fpstp)
>
>  void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
>  {
> +    uintptr_t ra = GETPC();
> +
>      /*
>       * Implement DC ZVA, which zeroes a fixed-length block of memory.
>       * Note that we do not implement the (architecturally mandated)
> @@ -948,8 +950,6 @@ void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
>
>  #ifndef CONFIG_USER_ONLY
>      if (unlikely(!mem)) {
> -        uintptr_t ra = GETPC();
> -
>          /*
>           * Trap if accessing an invalid page.  DC_ZVA requires that we supply
>           * the original pointer for an invalid page.  But watchpoints require
> @@ -971,7 +971,9 @@ void HELPER(dc_zva)(CPUARMState *env, uint64_t vaddr_in)
>      }
>  #endif
>
> +    set_helper_retaddr(ra);
>      memset(mem, 0, blocklen);
> +    clear_helper_retaddr();
>  }
>
>  void HELPER(unaligned_access)(CPUARMState *env, uint64_t addr,
> @@ -1120,7 +1122,9 @@ static uint64_t set_step(CPUARMState *env, uint64_t toaddr,
>      }
>  #endif
>      /* Easy case: just memset the host memory */
> +    set_helper_retaddr(ra);
>      memset(mem, data, setsize);
> +    clear_helper_retaddr();
>      return setsize;
>  }
>
> @@ -1163,7 +1167,9 @@ static uint64_t set_step_tags(CPUARMState *env, uint64_t toaddr,
>      }
>  #endif
>      /* Easy case: just memset the host memory */
> +    set_helper_retaddr(ra);
>      memset(mem, data, setsize);
> +    clear_helper_retaddr();
>      mte_mops_set_tags(env, toaddr, setsize, *mtedesc);
>      return setsize;
>  }

I was briefly uncertain about this, but since we restrict
the size of the amount of memory we're setting to not cross
a guest page, if the memset() does fault it should only
be for the case of "the whole block went away", so you never
get the situation of "successfully wrote a chunk and then
faulted partway through, and we should have written the
tags for the partial write and did not".

So

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
