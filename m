Received: by 2002:ac2:5fca:0:0:0:0:0 with SMTP id q10csp496803lfg;
        Thu, 8 Jul 2021 09:47:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzQGVeDrQflgUAMAaE2IToa2vwrSu1sY89wcjzVYxFQUZLd8cS1yuSbfNC1Y//tBfy8DIjp
X-Received: by 2002:ab0:6416:: with SMTP id x22mr30515261uao.130.1625762829699;
        Thu, 08 Jul 2021 09:47:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625762829; cv=none;
        d=google.com; s=arc-20160816;
        b=CbxOzegmP6DeUXcfGBUPn8whSi2ELGbIoBjqPtpJ6ALGUt6qfIBL59SKVTsbL4Pxtr
         GAKz5xa2lJdMdOkzzSE09jmB/M/U2uqqZQFSmL2BanOioTmcLH1ia9GST3CleOhkU9Q3
         RsASA9SMMuWztNDrRV/ixZ3K0od5Ek7wf8t4KXZPKPh4M1euMZ2JmI51TVMGE+eWwmFh
         ghIfHnKMHvRdrYTzBhTPcPvzxaSvPazqmbQbwS/UZpbw9hKHi1mLs1C13UyNudJghYf8
         xNLRp/7rVnAR7ONKWpZBuWY0CE5+0sOXY/rpAs00fT3tPZh5DyKEAAMgrIM7lO9EOEUk
         +XEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=49PI5WBY3Pvxqfof2TOhUpfgHH/EfMKzNfo7c+g6lRc=;
        b=g7d21xlmnPpSJDwnUo+CSXZaYpsZWzat0gEs4ZuBnCr2DFfhf5zYZYf/YZ/uWjUS7d
         KksiBUPArTk9uaWJrxCFqu9qkhFNl6Xa0/xJ9MRloIkLdkNCWbKbANhlHFQLm1eIBf8h
         0n8lsXUVKsQRqCUPcZaCi+lcGM4Q/HCppL4X+8RWQtp6Dn7p/OiCQXAwRup0KmnX8rKC
         D9EOMUvT7Yh8XVyJ2tZI2opgOH/oiKsr12AVeHZ7PMIks9837sHW5MFXr2BgczOj15pK
         seYZV7PIHaI6+pl/lGuNJYfj+uua12GX/t28SlPqJIIXwB2XtPJ/5J2W2CzTIWQJ6EQD
         iUYw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D6Wnr89h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b19si3045297uap.170.2021.07.08.09.47.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 08 Jul 2021 09:47:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=D6Wnr89h;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49768 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m1XB6-0006Bv-V9
	for alex.bennee@linaro.org; Thu, 08 Jul 2021 12:47:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:37798)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Wcq-0002Tv-6L
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:11:44 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:46782)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m1Wco-0008Aw-Gj
 for qemu-devel@nongnu.org; Thu, 08 Jul 2021 12:11:43 -0400
Received: by mail-ed1-x533.google.com with SMTP id s15so9246980edt.13
 for <qemu-devel@nongnu.org>; Thu, 08 Jul 2021 09:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=49PI5WBY3Pvxqfof2TOhUpfgHH/EfMKzNfo7c+g6lRc=;
 b=D6Wnr89h5MG/aA53VBjotyrRPizqT971yL9eznGMqrmex5B9wf6z7uzdbLYfFJJDxS
 xnYahVWV2OBJgRW12G+cWWQRfhpe5nWuAuO3n2UJliZubvqkjwuTWiUhjw06ysbQ6ZYi
 HQfUiWgFIvsbNPIx6FELFfISs6lrtG55rRqRktQqPtreVulp49iPbDUj9/dIDS47+5j8
 BP89NQB3bhfyfFu7DgrKn46lfEcZhfSkzQfF5ROfE4SW+geMBb8VozHcW6JFnoHbWlTO
 gjQojPUo9Ti69lUlKF8mal/vRzhlZfkLIJx6j0ehVsGtBAlIXCDPYbG2QZ1jF7qZrVt9
 rW7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=49PI5WBY3Pvxqfof2TOhUpfgHH/EfMKzNfo7c+g6lRc=;
 b=np6X9/Vc4kMG/Gt8u7R8uRzs3Ydb2G1EqXWFlPUZtdfooPjrzYb21hf95+IAZK7UGA
 oK5INPc0QDEzs+DHieR2wDirwGWFNS61kpajkvXXB0yRjB7QOvnoCchYFu0Qoxl8feHq
 aNdunv+u/pA5K0g6C+iSU0aiMSTv4XwX/KguteUeKyDoRj0IBuht7EPBihGf4tipQ6D8
 Qli6SYhnRrV7dXf66h/K052h6aD7VuFZ3YJenX+R2UDZd2eiWIFCBOfW5ixrb2/4o39x
 ag0imRr/3auvggFiHBgbgbi0OitOL4mLbdG13NF26O4RuUMTG4ht9X4+i9KL65RyZYOM
 O8bQ==
X-Gm-Message-State: AOAM532/vu8RTWu+GSAezDpjj3aMwOa9sockweHUdWYprGEMWPIuNCco
 hZAq+uakYf6tK7PeYxePP2LlfYCeXiCtA8EsWg3/Vg==
X-Received: by 2002:aa7:c857:: with SMTP id g23mr38381346edt.100.1625760700942; 
 Thu, 08 Jul 2021 09:11:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210630183226.3290849-1-richard.henderson@linaro.org>
 <20210630183226.3290849-6-richard.henderson@linaro.org>
 <CAFEAcA_EkW7a6SFuAHxdYvu_gdcdDwY4xQVOFnmtatcx+T1qGg@mail.gmail.com>
 <88562e08-3d6c-3224-5d84-67e3ffd3774b@linaro.org>
In-Reply-To: <88562e08-3d6c-3224-5d84-67e3ffd3774b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 8 Jul 2021 17:11:02 +0100
Message-ID: <CAFEAcA8Xs0Ct6hDBAk-N7TVhb66dwv2EJudo83XzJ5dQn9k7VA@mail.gmail.com>
Subject: Re: [PATCH v2 05/28] target/arm: Use gen_jmp for ISB and SB
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: AEI7lUhOHv1e

On Thu, 8 Jul 2021 at 17:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 7/8/21 5:05 AM, Peter Maydell wrote:
> > On Wed, 30 Jun 2021 at 19:47, Richard Henderson
> > <richard.henderson@linaro.org> wrote:
> >>
> >> Using gen_goto_tb directly misses the single-step check.
> >>
> >> Cc: qemu-arm@nongnu.org
> >> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> >> ---
> >>   target/arm/translate.c | 4 ++--
> >>   1 file changed, 2 insertions(+), 2 deletions(-)
> >>
> >> diff --git a/target/arm/translate.c b/target/arm/translate.c
> >> index a0c6cfa902..8cd31feeaa 100644
> >> --- a/target/arm/translate.c
> >> +++ b/target/arm/translate.c
> >> @@ -8582,7 +8582,7 @@ static bool trans_ISB(DisasContext *s, arg_ISB *a)
> >>        * self-modifying code correctly and also to take
> >>        * any pending interrupts immediately.
> >>        */
> >> -    gen_goto_tb(s, 0, s->base.pc_next);
> >> +    gen_jmp(s, s->base.pc_next);
> >>       return true;
> >>   }
> >>
> >> @@ -8596,7 +8596,7 @@ static bool trans_SB(DisasContext *s, arg_SB *a)
> >>        * for TCG; MB and end the TB instead.
> >>        */
> >>       tcg_gen_mb(TCG_MO_ALL | TCG_BAR_SC);
> >> -    gen_goto_tb(s, 0, s->base.pc_next);
> >> +    gen_jmp(s, s->base.pc_next);
> >>       return true;
> >
> > Why isn't it enough here just to set is_jmp to DISAS_NEXT ?
>
> You mean DISAS_TOO_MANY?  That would work, yes.
> At the time I was just thinking of replacing one jump with another.

You've implicitly answered my question, which is that the main
translator loop code treats DISAS_NEXT as "keep adding insns to
the TB" :-)

It feels slightly like misuse to use DISAS_TOO_MANY, unless we
renamed it to something like DISAS_END_TB (which is what it's
actually doing).

thanks
-- PMM
