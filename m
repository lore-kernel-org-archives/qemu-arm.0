Received: by 2002:a19:711a:0:0:0:0:0 with SMTP id m26csp1605710lfc;
        Thu, 11 Jun 2020 10:05:43 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2ArR6obUV/IqH6s7dGle52gbNXaXt9sZAhSw0fc7eq71HgZc3oC9VkhSTOGHIZJ2W6TC4
X-Received: by 2002:a25:8404:: with SMTP id u4mr12099155ybk.515.1591895143570;
        Thu, 11 Jun 2020 10:05:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1591895143; cv=none;
        d=google.com; s=arc-20160816;
        b=AR5x27EwbVjFhId/eBDQEbcJEoLSo708MWE3KbWHEmYJiYbaKr6FD/V5OA11Fp5Cg1
         6kicfoAD8B3iPkDx0W9gRmA0mu42NiimWdUKp3AFR978QzTGS4unkz4ML+Yj8uLagFDA
         fKZl0oQC10dQg+9pGTMMN04uYe3zI/w2x6Ogbu/GOqN4QOsBZc7vnd2fm6lkjAQWBMw5
         7vHcJJrSM+3Lyhk+v4czRzj0mhdAZ/uB9cwyOLzfPK3SpqbjUIHste0X8ad8sa1HoPzk
         GTI+N4tQe8yP65g0scrcNR7IY71zLhb/z/yHaxn6ARYDvaCuMI9ExOYJBe844Grx/t0f
         fsLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jnpMvxPIBKMFACOSSbza1pcMxQ8eGv/1PVQ9OlP6zUE=;
        b=Q20xStoOh2V72CnDj7hF859TZBA4kDSwPaiu1hKzwlipAuD+ncccIwKte3yYfrQ/6m
         PZ6LcaOT4FcNtwWU3Rch+l4FA3+kg4t9odQaNqQHaNT5SntrvFwIU+Amh1RkIOPooyQl
         zFvGp9TfxzAr4kcG2e/V08RW+HFmhztABSc5zHttnL8OLrYytZmn34jduCvDc33vzyS3
         qA/9tdlN1xZ9FvgnMabKcos5xBq8DefFs4PR0f8K+RV5HqsvsEhnh7N9e5Dt7Zzjk2NR
         NgoI3sXiGOpt6qkaZU8YhnEfJKXsqaLZthApuIhpdIMcK4CcjQw+x8Xa5gZCn25ns4Mp
         gSDQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mH2SaamN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l9si2538157ybt.31.2020.06.11.10.05.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 11 Jun 2020 10:05:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=mH2SaamN;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:50820 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1jjQe6-0000kG-Sr
	for alex.bennee@linaro.org; Thu, 11 Jun 2020 13:05:42 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:59350)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjQds-0000hf-TB
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 13:05:28 -0400
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:46954)
 by eggs.gnu.org with esmtps (TLS1.3:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1jjQdq-0007dp-0v
 for qemu-arm@nongnu.org; Thu, 11 Jun 2020 13:05:28 -0400
Received: by mail-ot1-x341.google.com with SMTP id g7so5076140oti.13
 for <qemu-arm@nongnu.org>; Thu, 11 Jun 2020 10:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=jnpMvxPIBKMFACOSSbza1pcMxQ8eGv/1PVQ9OlP6zUE=;
 b=mH2SaamNpLUO+M3uc1nUVlnL7aZb0A/2D1irhUXfqYlCSMPz64HKWTbdCnvido1Oq4
 sO1N901xFuCfR+7x8z7gMgTaG9XJ7gZRZuxov3sqsorlEc0KY7/tbX6ur9CyTmirIZGk
 6CRzhByNoK4ycaZq4FJFoIRLKYYrN3fKh5ZvBYldPolbgGOy6yeIz0XzTbUEzUfjcoXo
 bWyFBnQUHXrsoRUHHOEImGV+90vECDqBYEEt4Mr9/Hjc+npQdTrmUa0uzHvE53NOGTY2
 tfmRvbdNkEXvi/mDinh6d7saOfqo4O0JFa0U3+pJOTz1BDUrGPYRyk1EOTly2OrgrNd4
 AVyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=jnpMvxPIBKMFACOSSbza1pcMxQ8eGv/1PVQ9OlP6zUE=;
 b=SnLGBycM/JIRELyAnvKz87/1LZN1NqMtN1Iafxu4N4s/3RgdRwtKnZ+TOrW+lmBgH2
 in590pShhSLARG4Bdb/30bQJDD7V3SIwHjWxUdbXLawUQKER80ixUAmwQDLgcUEXSC3+
 pcoBASSufN8TruhafTy9ezWx16pFFaxogZWy93916vqdgWVpKRN/HP+Apai7l1roXZxM
 CNs72EiF9B+sg2oC3bugX8jSIuGwNDqp6jOT/UrFAeml7g8gi1v+yMaikc8GNl0UZdKu
 ZiUSv2Vm1OLPNKDDCCa2c4WSkH4chh74UPo0PdS44ib8hO8x9Ish9o++ExzR09NYp3u3
 nKqg==
X-Gm-Message-State: AOAM5326YoaKBLxoWGmhurOjasBIlYefs8esYIn44wieS6YeQMSQ1g1x
 +098dKnow1Pa7CN1R337fznTAX9LFHHIKuSPXZNnwA==
X-Received: by 2002:a05:6830:8d:: with SMTP id
 a13mr7366786oto.91.1591895117425; 
 Thu, 11 Jun 2020 10:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <20200611144529.8873-1-peter.maydell@linaro.org>
 <20200611144529.8873-3-peter.maydell@linaro.org>
 <d32b36c2-6662-91b1-5b18-ff7a56386cd8@linaro.org>
In-Reply-To: <d32b36c2-6662-91b1-5b18-ff7a56386cd8@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 11 Jun 2020 18:05:06 +0100
Message-ID: <CAFEAcA-xw6pHejLVjUze1UWwBpygNWjam_KNOCyfthL-3vYDBQ@mail.gmail.com>
Subject: Re: [PATCH 02/10] target/arm: Add missing TCG temp free in
 do_2shift_env_64()
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::341;
 envelope-from=peter.maydell@linaro.org; helo=mail-ot1-x341.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=_AUTOLEARN
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
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: H7XFwy34k8l9

On Thu, 11 Jun 2020 at 16:43, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/11/20 7:45 AM, Peter Maydell wrote:
> > In commit 37bfce81b10450071 we accidentally introduced a leak of a TCG
> > temporary in do_2shift_env_64(); free it.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> > My test setup wasn't looking for temporary-leak warnings (they are
> > not as easy to get at as they used to be because they only appear
> > if you enable qemu_log tracing for some other purpose). This is the
> > only one that snuck through, though.
> > ---
> >  target/arm/translate-neon.inc.c | 1 +
> >  1 file changed, 1 insertion(+)
> >
> > diff --git a/target/arm/translate-neon.inc.c b/target/arm/translate-neon.inc.c
> > index 7c4888a80c9..f2c241a87e9 100644
> > --- a/target/arm/translate-neon.inc.c
> > +++ b/target/arm/translate-neon.inc.c
> > @@ -1329,6 +1329,7 @@ static bool do_2shift_env_64(DisasContext *s, arg_2reg_shift *a,
> >          neon_load_reg64(tmp, a->vm + pass);
> >          fn(tmp, cpu_env, tmp, constimm);
> >          neon_store_reg64(tmp, a->vd + pass);
> > +        tcg_temp_free_i64(tmp);
>
> Huh.  I thought all the a32 stores magically freed their inputs.  I guess
> that's just the general-purpose registers.

Confusingly, neon_load_reg()/neon_store_reg() do the "create
new TCG temp for the load, free the store input" thing, but
neon_load_reg64()/neon_store_reg64()/neon_load_reg32()/neon_store_reg32()
do not. I'd kind of like to get rid of this weird proliferation
of load and store functions, but neon_load_reg()/neon_store_reg() are
also the only ones which take a (regno, pass) pair of inputs,
so it's not a completely trivial substitution.

thanks
-- PMM
