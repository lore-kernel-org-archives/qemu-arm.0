Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1425145ejc;
        Fri, 3 Mar 2023 11:04:30 -0800 (PST)
X-Google-Smtp-Source: AK7set97wioG7INDC75WK1avYov8zwncdknnSkK8pP8d08Iif4MQo69KHC+lBD4iuOPCvpdq96gA
X-Received: by 2002:a05:622a:1ba6:b0:3b8:2504:e90a with SMTP id bp38-20020a05622a1ba600b003b82504e90amr3542833qtb.3.1677870270577;
        Fri, 03 Mar 2023 11:04:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677870270; cv=none;
        d=google.com; s=arc-20160816;
        b=r4XjX25zLnlobippqvNdg+rO4ldFdTHJwKzF8BpK/f2gStal83PCYrgOHBzAgowtPB
         S1LkEVmKuZYVSrYzJY/F7j2P5EipmgQGMhqyiMnFg3gIZ7jVIVk/Vc8bjHNyNsipaaY2
         8GxFkhK6mQPHMGrjl8Ju8t6Ox8j1B3BhfoXjWqpjTGptI1ycZ3QEP8wI32DXf/UVSa5A
         Nn6aBP7HvDnRBZxMie8/pZ5E/N+mcp++6PUN+ZNCCkEPiyQbjQdJ3z+tbvo/qefNR6Hb
         IVmvQFHJWwlkON+2Y8ngfcQEz4I6f0c60Y2+07ILdph0PmZOS+Rpj3GqSIQF1erYrmtv
         D6VA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=n2J3wBfnS9D62Jug7rilIGkXLvaZLQkBK8tQ3uA5ZPo=;
        b=vRP5irfFiktUJ6pTUxBg4r+CFodIzKKneaNGoyr8dG76CHkuoQ5YW7CSe5guCjH0nI
         6BvtbcyMOp/VOqtgweedqhACHObiHXj3oWiti/dsVqaXQcdxYRTxLbPPoSAyPGuYotJe
         xgiL5iXzNcSxu8Kh4KB1xzngxu0MQF4MQY9AUJwP/isGMCjCT+PknWptfmQZbNiUn4Ca
         iJQdMwh6v07qm4LOqRkVLL+5T1AbMAf3nQVuYwpAitdwSTGFXdOe1Hpn9ewHHBVRZCTF
         MPX+3zNbtt3YC/1vHLFkSI8WbB3EcD6Htcb69leFNCkFs6L9SeEEQpAgaOERUBt79aef
         hY2A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nrKNqLVc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x17-20020ac85f11000000b003b9a3e7e113si2411291qta.87.2023.03.03.11.04.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Mar 2023 11:04:30 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nrKNqLVc;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pYAhR-0003UL-22; Fri, 03 Mar 2023 14:04:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAhP-0003Rd-Ij
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 14:04:11 -0500
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pYAhN-0007FJ-SH
 for qemu-arm@nongnu.org; Fri, 03 Mar 2023 14:04:11 -0500
Received: by mail-pf1-x42b.google.com with SMTP id n5so2192711pfv.11
 for <qemu-arm@nongnu.org>; Fri, 03 Mar 2023 11:04:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1677870248;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=n2J3wBfnS9D62Jug7rilIGkXLvaZLQkBK8tQ3uA5ZPo=;
 b=nrKNqLVcEVja41SbtllV+K2AeiwxN0vwdm+wqNfYTOg2h4blhyvjirdfYGHPM+386E
 EQuay4fWkPdGpehwvYYOTnHJqiQEE+6gBKr5w+N0dY44eW9MGwvEoGkgjFyERSIR4oHs
 sVNm25vPEMa7ZrFHYM9N990MgiQKuCmG/ippMs06SSOL6pLPi9++w8XXN4+ekfzMBnCa
 54Q0IKDmClJxfB0cqo7hD2AdhcenzftV/pROBsKF43CP76SOWQ31bu7PVs4+PEqxZT5T
 V5AbpHBQvqj1IrbvWZhWIU9AfgSLaFl36XuWEUpif9QzVvD6bYcMa21lD/IqWW4GWuLW
 hHvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1677870248;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=n2J3wBfnS9D62Jug7rilIGkXLvaZLQkBK8tQ3uA5ZPo=;
 b=ZU2MmA4rsqClzFBxFDBJ/IGoMrZJTkVWDnHNBoW5opIjf2zZu4kDV/rGnHa1JEVhca
 BbbBhAhW+8VF4cdPz1oGaXxxTKLsW2RNLVL7wDyvP+RFu9StMlVm4r2QG46ZxjbmNfeh
 eg4c0IaBiPZZ06vtiB99gDILG/L0FRn6GTs2nzg4dhvWKIsEZ1fVSOZe7uTVLoOOdZC6
 mmIULrXHhBgiX5ZRsTfR2o7S2jPieDVF1nUfMMQ8JZnMBAbw2nQlsYsSZqz4wBKPSezY
 DpNkJuQS7+ntYqn8MFGveDEO2Y+xAlXAnzLrZQYSieTmI7B0CuckFU19pl0YKpqMwdQg
 wcbQ==
X-Gm-Message-State: AO0yUKWQQNd1f3w/bMpxcgRt0qMGwoBF5fUbJeO6kuITUUjriomZhrle
 MiJD2Sd417gsj2dVceWDCNWtafir1aE/TPEr9hAyZw==
X-Received: by 2002:a63:2953:0:b0:502:ecb9:4f23 with SMTP id
 bu19-20020a632953000000b00502ecb94f23mr913452pgb.5.1677870248299; Fri, 03 Mar
 2023 11:04:08 -0800 (PST)
MIME-Version: 1.0
References: <20230227052505.352889-1-richard.henderson@linaro.org>
 <20230227052505.352889-36-richard.henderson@linaro.org>
In-Reply-To: <20230227052505.352889-36-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 3 Mar 2023 19:03:57 +0000
Message-ID: <CAFEAcA-mbUBH4VuobjqAtmspsGtMedcTQuvz+4Ls=-=mF+Yr5Q@mail.gmail.com>
Subject: Re: [PATCH v2 35/76] target/m68k: Drop tcg_temp_free
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-ppc@nongnu.org, 
 qemu-riscv@nongnu.org, qemu-s390x@nongnu.org, jcmvbkbc@gmail.com, 
 kbastian@mail.uni-paderborn.de, ysato@users.sourceforge.jp, 
 gaosong@loongson.cn, jiaxun.yang@flygoat.com, tsimpson@quicinc.com, 
 ale@rev.ng, mrolnik@gmail.com, edgar.iglesias@gmail.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42b;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42b.google.com
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
X-TUID: 4ElrRpLuGYJg

On Mon, 27 Feb 2023 at 05:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Translators are no longer required to free tcg temporaries.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/m68k/translate.c | 181 ----------------------------------------
>  1 file changed, 181 deletions(-)
>
> diff --git a/target/m68k/translate.c b/target/m68k/translate.c
> index d7237b6a99..3055d2d246 100644
> --- a/target/m68k/translate.c
> +++ b/target/m68k/translate.c
> @@ -138,7 +138,6 @@ static void delay_set_areg(DisasContext *s, unsigned regno,
>  {
>      if (s->writeback_mask & (1 << regno)) {
>          if (give_temp) {
> -            tcg_temp_free(s->writeback[regno]);
>              s->writeback[regno] = val;
>          } else {
>              tcg_gen_mov_i32(s->writeback[regno], val);
> @@ -163,7 +162,6 @@ static void do_writebacks(DisasContext *s)
>          do {
>              unsigned regno = ctz32(mask);
>              tcg_gen_mov_i32(cpu_aregs[regno], s->writeback[regno]);
> -            tcg_temp_free(s->writeback[regno]);
>              mask &= mask - 1;
>          } while (mask);
>      }

I wondered briefly whether now temps are auto-freed the
complication of the 'give_temp' argument to this function could
be removed, but it was too unclear to me exactly what it was
doing. So never mind...

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
