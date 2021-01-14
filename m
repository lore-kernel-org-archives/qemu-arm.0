Received: by 2002:ac2:4c03:0:0:0:0:0 with SMTP id t3csp473983lfq;
        Thu, 14 Jan 2021 09:37:46 -0800 (PST)
X-Google-Smtp-Source: ABdhPJycSMYjkHH9c1HLqtchNX8VGnA0db/UxVdN7fSpw42dC2Hw5VY+wihZ5vusdauXk3Th59DD
X-Received: by 2002:a25:500b:: with SMTP id e11mr12014700ybb.138.1610645866289;
        Thu, 14 Jan 2021 09:37:46 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1610645866; cv=none;
        d=google.com; s=arc-20160816;
        b=rDZMEksFVdVcTILWP3w6NvRI3wJbtr41I32wxxxeS+6MD0rFLHqTwDWT5UrSs9ZYM6
         3i8ugcTWkqftH1mneuu0X1EYnR+e5NtsyS815Iw7bIotM5siMp9kdyarG2QbJDa7C8mL
         3KKytjO/06I5KIiTyphSw1D+PSvX0902d2Vu0mvApgNGQYrDoCRaaBjGPf1NNp/z7Ebg
         0wvqJi3+QRRL+v4+Mat/eDe2vC8uMxw7zKiSq7fAZNdiUaWiCH3ErfgkiAcNSpxrcEGd
         +PgHfS3dw9uSSRIRwEm5Ml6wPYmsxGcXjGW2hpEOuBjePFZ2Jlh/wSK27XNqH+0Qy4c3
         FUTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=from:reply-to:sender:errors-to:cc:list-subscribe:list-help
         :list-post:list-archive:list-unsubscribe:list-id:precedence:to
         :subject:message-id:date:in-reply-to:references:mime-version
         :dkim-signature;
        bh=qi9+F5K/4kbWAdzeSzPjCTkIDLkSfOKn9XAu1INEErU=;
        b=HhPNnqXj9s2AxndZcwWcxQQWEyJl0jzUFpb0nAovjxOsNZwKdqE2D0QA/tkzCgMwwy
         ojP559++Z3JNefawVq6IDOlvkN0GOoANUb/mBOwQqih9GaHk8kS0/r8BsvHMGSiMQjv0
         1efVhOqE7mHBzVWlsuaMHJ/V61IUzbs9TSitAs5xViblnQqTGobeNNHZS/SZYBI7MFNs
         lGQomh/nPjH1d/N1Z1QLj+tPOuQ0S7ZueyqNSuw55YmGxXFIUZ+qsIFFoI22MP/xL0eJ
         3HcG2IBOBmsu+I5hJp6Mw+C+i5xXqhcqoRGQJGShAwiG+wDF9hQeiCpKUawn6vSUiFgQ
         Scow==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=CBJCglbO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 21si5604473ybf.441.2021.01.14.09.37.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Jan 2021 09:37:46 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@google.com header.s=20161025 header.b=CBJCglbO;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=nongnu.org
Received: from localhost ([::1]:58902 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1l06Z7-0002Sz-L0
	for alex.bennee@linaro.org; Thu, 14 Jan 2021 12:37:45 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:55586)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1l06Ao-0007oA-BP
 for qemu-arm@nongnu.org; Thu, 14 Jan 2021 12:12:38 -0500
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435]:33530)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <hskinnemoen@google.com>)
 id 1l06Am-0001aA-Gj
 for qemu-arm@nongnu.org; Thu, 14 Jan 2021 12:12:38 -0500
Received: by mail-wr1-x435.google.com with SMTP id t30so6599057wrb.0
 for <qemu-arm@nongnu.org>; Thu, 14 Jan 2021 09:12:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qi9+F5K/4kbWAdzeSzPjCTkIDLkSfOKn9XAu1INEErU=;
 b=CBJCglbOg1ZzkN2oOd+oargykW76CmiV8V6EAOF3Ms/9Tahdt/G+YB04yQLW9s//Af
 VBIZlVWM+Uu7yc88FqX+tx/LhQxvcnwjRh3rkvCqISbuyOG64ECsFnu5hE6XiXiTHdFd
 Z0Qb5u9X52qFk59maTVjD1fSrG174ScIZMzCrsL9mnE5mVhEt4Y20+mdJqPTFfy//TjY
 xDnCrSiVomi/LcGsRwN5Xhi77JfUzuG+jhPDeiFu3z6RQL7RdptscshG041roSCCZZRf
 jh6ZBFrx1ifojRrC/8ULbgJsocW4RHL4kq1PPIYvLHoh4g82BjycG5AWg4kisqu7QIx0
 gNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qi9+F5K/4kbWAdzeSzPjCTkIDLkSfOKn9XAu1INEErU=;
 b=nOPXVqIAwD5vWM6sJHpFv9oOMftiiwB2WpxU4KoB3t9tgi/E2o3+fQdDUBt7k3/3yc
 XYOySrHtr+BYHJqxNYd4Fhy5DtmOlPjdD4eKnI1SwcS62seMxYAt6RBRIE5E3Eq45GK9
 uB5kWkH7BkfF1hWxx3/CvnjKWoyOp5kbubHvrzfBNInFmZNlb1FpTMtWZX1b+z+xxQKf
 wFkp1NgM7nQ3IdguMSnOaAR18aXBAn+1QvnTXRuOWknYnoDbmjSyPGLfY52UUCsGurJ1
 3LqODAG6CmmJfCZKLmz3Sv2XzrJspkS8LPYer9h99z3YXJkpDEbf0e1TizLSOu3BjJGh
 7mBg==
X-Gm-Message-State: AOAM530Y0E1xjZPAjTJrtpRJgM/S9rNgdm5mrm1sMFk6AXDRl4ijwoUV
 yPw0BpTguMboIWR0UUFKEQbOy+CRxrddHPXiTOBrmA==
X-Received: by 2002:a5d:61ca:: with SMTP id q10mr9076983wrv.124.1610644353449; 
 Thu, 14 Jan 2021 09:12:33 -0800 (PST)
MIME-Version: 1.0
References: <20210114150902.11515-1-bmeng.cn@gmail.com>
 <20210114150902.11515-10-bmeng.cn@gmail.com>
In-Reply-To: <20210114150902.11515-10-bmeng.cn@gmail.com>
Date: Thu, 14 Jan 2021 09:12:20 -0800
Message-ID: <CAFQmdRYeCLgv2-y8G3pnwAKgGgMOJ5E=60mVC_XdmZZy86+wZw@mail.gmail.com>
Subject: Re: [PATCH 9/9] hw/ssi: npcm7xx_fiu: Correct the dummy cycle
 emulation logic
To: Bin Meng <bmeng.cn@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=hskinnemoen@google.com; helo=mail-wr1-x435.google.com
X-Spam_score_int: -175
X-Spam_score: -17.6
X-Spam_bar: -----------------
X-Spam_report: (-17.6 / 5.0 requ) BAYES_00=-1.9, DKIMWL_WL_MED=-0.001,
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
Cc: Peter Maydell <peter.maydell@linaro.org>,
 Francisco Iglesias <frasse.iglesias@gmail.com>,
 Bin Meng <bin.meng@windriver.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>,
 QEMU Developers <qemu-devel@nongnu.org>, Tyrone Ting <kfting@nuvoton.com>,
 qemu-arm <qemu-arm@nongnu.org>, Alistair Francis <alistair.francis@wdc.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Reply-to: Havard Skinnemoen <hskinnemoen@google.com>
From: Havard Skinnemoen via <qemu-arm@nongnu.org>
X-TUID: F4nwW1gB6W2J

On Thu, Jan 14, 2021 at 7:10 AM Bin Meng <bmeng.cn@gmail.com> wrote:
>
> From: Bin Meng <bin.meng@windriver.com>
>
> I believe send_dummy_bits() should also be fixed, but I really don't
> know how based on my pure read/guess of the codes since there is no
> public datasheet available for this NPCM7xx SoC.
>
> Signed-off-by: Bin Meng <bin.meng@windriver.com>

Just a quick comment before I look at the rest of the patch series:
The emulated dummy bits behavior has a lot more to do with what the
m25p80 emulator seemed to expect than the actual NPCM7xx behavior. If
the m25p behavior now interprets the dummy cycles the same way as the
rest of the cycles, this change seems correct, but you're right that
send_dummy_bits probably needs some attention as well.

I _think_ it's just a matter of turning this:

        for (j = 0; j < 8; j += bits_per_clock) {
            ssi_transfer(spi, extract32(uma_cmd, field + j, bits_per_clock));
        }

into this:

        ssi_transfer(spi, extract32(uma_cmd, field, BITS_PER_BYTE));

which might have the very nice side effect of speeding up SPI flash
access quite a bit.

Thanks a lot for looking into this.

>
> ---
>
>  hw/ssi/npcm7xx_fiu.c | 8 +++-----
>  1 file changed, 3 insertions(+), 5 deletions(-)
>
> diff --git a/hw/ssi/npcm7xx_fiu.c b/hw/ssi/npcm7xx_fiu.c
> index 5040132b07..e76fb5ad9f 100644
> --- a/hw/ssi/npcm7xx_fiu.c
> +++ b/hw/ssi/npcm7xx_fiu.c
> @@ -150,7 +150,7 @@ static uint64_t npcm7xx_fiu_flash_read(void *opaque, hwaddr addr,
>      NPCM7xxFIUState *fiu = f->fiu;
>      uint64_t value = 0;
>      uint32_t drd_cfg;
> -    int dummy_cycles;
> +    int dummy_bytes;
>      int i;
>
>      if (fiu->active_cs != -1) {
> @@ -180,10 +180,8 @@ static uint64_t npcm7xx_fiu_flash_read(void *opaque, hwaddr addr,
>          break;
>      }
>
> -    /* Flash chip model expects one transfer per dummy bit, not byte */
> -    dummy_cycles =
> -        (FIU_DRD_CFG_DBW(drd_cfg) * 8) >> FIU_DRD_CFG_ACCTYPE(drd_cfg);
> -    for (i = 0; i < dummy_cycles; i++) {
> +    dummy_bytes = FIU_DRD_CFG_DBW(drd_cfg) >> FIU_DRD_CFG_ACCTYPE(drd_cfg);
> +    for (i = 0; i < dummy_bytes; i++) {
>          ssi_transfer(fiu->spi, 0);
>      }
>
> --
> 2.25.1
>
