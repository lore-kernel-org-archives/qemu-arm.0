Received: by 2002:ac2:4841:0:0:0:0:0 with SMTP id 1csp49157lfy;
        Mon, 3 Aug 2020 17:21:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTMLc8mYqNiC8PNQHhleU9tOPLRGElRY4thOpGfFCP/nGApwQq5QPEaYjz8tWjtwkKTkVk
X-Received: by 2002:a25:cb49:: with SMTP id b70mr27247116ybg.361.1596500500315;
        Mon, 03 Aug 2020 17:21:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1596500500; cv=none;
        d=google.com; s=arc-20160816;
        b=pdDl9WbmyY0ybROK+X8mLHoZ2IgwuOEMQlUam7raojAAiYN9zGRCf/Piyxos9HY3Zi
         JAqzGIIMLN3uQ8wRp3rCaGBU/mFz976WdGLk6VO7S5b/0DsXjyGhVz8t5BDSTQNOBRSJ
         RCG8mf3nhVfSf7VzN+d+WrGysSaVWOWFhg3Z7/BZtWQWh1wVBy+ACc+YPdYQI8seRe0T
         T3spqHI1HBpRB0xSOTo1rn4FKabVxdrHJYIvZZIjZBu7itWfzNxuTYvuo0dsWnW0mJYm
         nfrdkdzS/1UeVOJHiLVUN9AeH8TJX2ItjW1cW7Qh3j/h58SS6zw9hL+3wUIWB3I4X4/L
         wUXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kGPCxaRkq75wl/3koH786wgCsWo4Ch0XQ6yueKJ/Uuc=;
        b=BQ9gSr8F12ujMHgDTsF622hgkUw1SC+RsSMGsR8edzPdmrYtsulCxwKk70hSWo4KGQ
         Qx1navQNzscJavj7D6hyjWWqTUoKizgMfwFVfuGlVM5sbrwsN2VDXkOihW9mgnvrPrMU
         MlcFoYZrDb6xZF+HeOZ0TitMVF4/DDBAuxpczyyBnu8b84fWHkWvKLMqZAfXia1jsfbO
         JmKZ0OkjRyteu89i9xLH+XTH85ZMEBQH0fk8eLIMj1354Z9HBrC2qd8xVzia7vlkChNj
         V0NXQHsAYYnd9wzOsvXQ0s3HRoR4oNg2NmuC+a1tqyZi5b2NcruoVMjquYxaYmHZyevJ
         9Zrw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=Q4WwY3WA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c4si4762007ybo.90.2020.08.03.17.21.40
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Aug 2020 17:21:40 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@google.com header.s=20161025 header.b=Q4WwY3WA;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=REJECT sp=REJECT dis=NONE) header.from=google.com
Received: from localhost ([::1]:42698 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1k2ki3-00009A-Lo
	for alex.bennee@linaro.org; Mon, 03 Aug 2020 20:21:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57000)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1k2khv-000093-RX
 for qemu-arm@nongnu.org; Mon, 03 Aug 2020 20:21:31 -0400
Received: from mail-vk1-xa42.google.com ([2607:f8b0:4864:20::a42]:40662)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <pcc@google.com>) id 1k2kht-0005uh-2T
 for qemu-arm@nongnu.org; Mon, 03 Aug 2020 20:21:31 -0400
Received: by mail-vk1-xa42.google.com with SMTP id m18so8805756vkk.7
 for <qemu-arm@nongnu.org>; Mon, 03 Aug 2020 17:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
 bh=kGPCxaRkq75wl/3koH786wgCsWo4Ch0XQ6yueKJ/Uuc=;
 b=Q4WwY3WA/mwt/U6iOCh0fTwPt36VN59hm1INGUdt0VPw98QI7L5U0pmUgWOxBJEvM3
 Ic0vc+dq8g+gzgie86f2Zn/32ADPj6FrFqYNCq4i/eP90C0Op27kK81Jr+KbBjDAiiXg
 ufoxlPK8HLpuKyNTh6lkFelB2uQGW9tKb3BTNR6Y+42ySEcN3Df1CEar/Wsq0NP/sI2n
 yz15uhFROpf08lL98SWvHVbxK7IMZtN+w8gkLmJOBi8HZnZkRGSUI3GExPz7yzFvYG5Y
 EzXT282/BwjPAITvf/FcM9kDGP286erjxPRLs4iZZTTW8qra+MsGkFipC4d1ycgACpEd
 RCyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to;
 bh=kGPCxaRkq75wl/3koH786wgCsWo4Ch0XQ6yueKJ/Uuc=;
 b=TuoFpV9Njf/PMmJfIdNE/XtJmXneVZ/1hPhwzF+ptzHVcPGGprWgZ8FRFwbuxpzUOL
 lsIoLu4bjNlQuYp2spPNnlU8v3vPK5kTm/SU7Loqfu5tG2QwlUFMiZByezxWJ/7R0NN0
 eQZYkvgpW1XQOVpARW58jylrpxZrErcIk5cZlANh9D8uHB2MvqwPDQaGm/aV1YWOMW0O
 3HWmeuJzsFU+gEX8LDaSI/QQA7kviXlSC0G2FuWDk6efLFcHYFx7UWV2cjhnlRfHFayz
 iHM1r2rjeaud0lUHxzLhm2Rzlo5sTvFDniGgLecVSRg9H+shVwaV9DD62Jq6ANsfQw8j
 vOjw==
X-Gm-Message-State: AOAM5318QwSFNYh347MxhUREDdYQKsfM/m9Mqi0Wpm+EhrriNuJg4KUq
 d6TGL/AdNFsjU9Slpne3anAoeKrBA5tBJbSC762vlw==
X-Received: by 2002:ac5:ccdb:: with SMTP id j27mr13053309vkn.43.1596500485985; 
 Mon, 03 Aug 2020 17:21:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200803222656.63936-1-pcc@google.com>
In-Reply-To: <20200803222656.63936-1-pcc@google.com>
From: Peter Collingbourne <pcc@google.com>
Date: Mon, 3 Aug 2020 17:21:15 -0700
Message-ID: <CAMn1gO75w=oaCp2TjhFzr2nrbKhHOP6Q20bnvuuAzgSVe+thMg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix decode of {LD,ST}RA[AB] instructions
To: Richard Henderson <richard.henderson@linaro.org>, qemu-devel@nongnu.org, 
 qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::a42;
 envelope-from=pcc@google.com; helo=mail-vk1-xa42.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -185
X-Spam_score: -18.6
X-Spam_bar: ------------------
X-Spam_report: (-18.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-1,
 DKIM_SIGNED=0.1, DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 ENV_AND_HDR_SPF_MATCH=-0.5, RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001, USER_IN_DEF_DKIM_WL=-7.5,
 USER_IN_DEF_SPF_WL=-7.5 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: lDc86PBXlnCc

On Mon, Aug 3, 2020 at 3:27 PM Peter Collingbourne <pcc@google.com> wrote:
>
> These instructions use zero as the discriminator, not SP.

Oh, there is no such thing as STRAA/STRAB. I must have been confused
by the name of the function, disas_ldst_pac. I will send a v2 with a
fixed commit message, and another patch to rename the function to
disas_ld_pac.

Peter

>
> Signed-off-by: Peter Collingbourne <pcc@google.com>
> ---
>  target/arm/translate-a64.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/target/arm/translate-a64.c b/target/arm/translate-a64.c
> index 8c0764957c..c996ca1393 100644
> --- a/target/arm/translate-a64.c
> +++ b/target/arm/translate-a64.c
> @@ -3429,9 +3429,11 @@ static void disas_ldst_pac(DisasContext *s, uint32_t insn,
>
>      if (s->pauth_active) {
>          if (use_key_a) {
> -            gen_helper_autda(dirty_addr, cpu_env, dirty_addr, cpu_X[31]);
> +            gen_helper_autda(dirty_addr, cpu_env, dirty_addr,
> +                             new_tmp_a64_zero(s));
>          } else {
> -            gen_helper_autdb(dirty_addr, cpu_env, dirty_addr, cpu_X[31]);
> +            gen_helper_autdb(dirty_addr, cpu_env, dirty_addr,
> +                             new_tmp_a64_zero(s));
>          }
>      }
>
> --
> 2.28.0.163.g6104cc2f0b6-goog
>
