Received: by 2002:a17:906:80c3:b0:7ae:d8f:8937 with SMTP id a3csp629616ejx;
        Thu, 3 Nov 2022 06:24:30 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM44kh4mW5b0SYPb1Anq2QtxCPaCwh7pX7A5wqiXjBCoze+FQk4o8zQu2/CXHMZCte2e75oR
X-Received: by 2002:a05:622a:59c6:b0:3a5:3bfc:3faa with SMTP id gc6-20020a05622a59c600b003a53bfc3faamr11774223qtb.184.1667481869986;
        Thu, 03 Nov 2022 06:24:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1667481869; cv=none;
        d=google.com; s=arc-20160816;
        b=HmMmiPgvQwyhbJ713VAAmPF/rci1/tp1ugx2GDTCsRSKhEojxTZ95PgTl6T7VdH33Y
         yHEqp/iYqqqwxpaUDpiBZMUPoivS4oKMv3g4y6yvbXoaROpm6mg1rgG3rz/RhJwsLxhJ
         pEjucAaVkZR+gN+84AITAdmmUsgdEi0vUsE15J2KfSVByqdWew/zc6slyik+7FDogiwI
         Z90AanL50SsQ4j7ZRySTn+khiZpnAiNnfOzG9xSspH4Z2mA0sdPYNrqyVNXQLxKofDVO
         +M1diy5S5v1rugc082bAHnUr5iI2Bsf73oYIhHiNO4WIAYXR8w0OmCtL8lm50xGcU9dR
         7kmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=errors-to:sender:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=dUcG8eu+T5Tt5XdWgqz+j2jbBEUf/7Mklz9kPc5OdLo=;
        b=KYIFkvW1NZIUIAL3g1KCyTO2HqKPQipr8NsiliKyKjBXKQC5PtzJXeYrfjEaC7cez8
         +kioSxVGqvxc44YX5Hh9ulENMAP+Ppobat2AMQChgnd+k05lqvWy78nksuDMQ4gPttjB
         SzOp5LIA3OTsXakv4nOY7b3OoNuMyrghz5pKTgceWTHdGAwkE1Ts9lJyP3d0T/Hbo1GQ
         B9tTZ+Sum9QbLgf9qyxOL8nkqoTRXHxz4GLv3/m1gmeMsl+Yqxk4VVzluzmjqvKKz5fj
         lMKtxSi1ZE7xbcXxuCs7LHIjLbYHavFbs2xr/iXHZU5lhWPIAu6T0ZnX67lzVhjqSFGw
         kBgA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RGpCTaBz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id jr9-20020a0562142a8900b004bbf28f47f7si397485qvb.53.2022.11.03.06.24.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 03 Nov 2022 06:24:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RGpCTaBz;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1oqaCf-00016V-J1; Thu, 03 Nov 2022 09:24:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqaCY-00012c-Q1
 for qemu-arm@nongnu.org; Thu, 03 Nov 2022 09:24:12 -0400
Received: from mail-pg1-x533.google.com ([2607:f8b0:4864:20::533])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oqaCW-0007sB-Bj
 for qemu-arm@nongnu.org; Thu, 03 Nov 2022 09:24:10 -0400
Received: by mail-pg1-x533.google.com with SMTP id v3so1649177pgh.4
 for <qemu-arm@nongnu.org>; Thu, 03 Nov 2022 06:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dUcG8eu+T5Tt5XdWgqz+j2jbBEUf/7Mklz9kPc5OdLo=;
 b=RGpCTaBzvpkYFXhvgoJ1gc7Q1XsaTDqD59XgctYGpoejDpbxMbmJC7TQouCeCyBlI4
 RdFW66Enayqbg7POGPKteOtUv+Xe6npgccfLszruE8PHIALPHoaq/HVm77X7oJ2RnWpJ
 UqXHaz1I0UrTEMGd+x529JmmMD4EgA6E07s6OoVMWW0bA2njJ94FJepKCDeJC4vEwtiY
 otds3fU4iR5yzesLvPZKN1803wpwH3P4jt4TgR0ez71qhXVMw0YOX5fLzymj9tWicgmu
 SrUZXdPbJSgGFf1/LfvgSYZepZusZ6nLfRZnY7i0XWw+d/WN7+kkdSv+3AwvyZCehx9b
 +VPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dUcG8eu+T5Tt5XdWgqz+j2jbBEUf/7Mklz9kPc5OdLo=;
 b=pCpH/18aT20yFjnlRUZpWpNKokh4x545j7SjNNb6XKEQe26yjDa3YcBEKsOFhHUYxa
 aG3Gl5BPoeOUH0+C7lE5k7JtW4RmO1aylJOqX5YhTHXAHs3yip1IQVtDPXt8oh1mjbKD
 f96LxGjuZSzR6MEPSLnDGz6L8FerG01ggKirb99OdKHB2AIJowYaKMgT3DjqhuVZWp5/
 GLS/QhSlq8y3DxfRy/gyO5d0VMsYBUVM3d26yzLHB19RE6Y1mba0tCqyl1NkLdXwIEJ3
 0gkc/5WqaxyXavRTLG5t2f/Q/cJO5v3Wv5wNukPjxQNs5R6uC2o52G/6jNv6GmRpYkU8
 /uXQ==
X-Gm-Message-State: ACrzQf26NHkm+ZmUn5SEF8hhOYpaKUkraazZZ8nYn+Jz99ZpmCmXMFTl
 RR9k2N5vdhzmP57UJ7zWhu3/+Pi19xqyVuKhGbrxEA==
X-Received: by 2002:a05:6a00:1595:b0:56d:e04d:e0ab with SMTP id
 u21-20020a056a00159500b0056de04de0abmr11944380pfk.51.1667481846147; Thu, 03
 Nov 2022 06:24:06 -0700 (PDT)
MIME-Version: 1.0
References: <20221102054706.1015830-1-richard.henderson@linaro.org>
 <CAFEAcA_meGSRv=Fa1D-F=a3VF=TnHHORGAZoi5aPOkVAbGPm4w@mail.gmail.com>
In-Reply-To: <CAFEAcA_meGSRv=Fa1D-F=a3VF=TnHHORGAZoi5aPOkVAbGPm4w@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 3 Nov 2022 13:23:55 +0000
Message-ID: <CAFEAcA_dfNpVKWorvprdywGEaquDDVfdRf2-RJHrAm0aKYKeBA@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Two fixes for secure ptw
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x533.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: RWMJH0lj6ndA

On Thu, 3 Nov 2022 at 13:19, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> On Wed, 2 Nov 2022 at 05:47, Richard Henderson
> <richard.henderson@linaro.org> wrote:
> >
> > Reversed the sense of non-secure in get_phys_addr_lpae,
> > and failed to initialize attrs.secure for ARMMMUIdx_Phys_S.
> >
> > Fixes: 48da29e4 ("target/arm: Add ptw_idx to S1Translate")
> > Resolves: https://gitlab.com/qemu-project/qemu/-/issues/1293
> > Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> > ---
> >  target/arm/ptw.c | 15 ++++++++-------
> >  1 file changed, 8 insertions(+), 7 deletions(-)
> >
> > diff --git a/target/arm/ptw.c b/target/arm/ptw.c
> > index 58a7bbda50..df3573f150 100644
> > --- a/target/arm/ptw.c
> > +++ b/target/arm/ptw.c
> > @@ -1357,7 +1357,7 @@ static bool get_phys_addr_lpae(CPUARMState *env, S1Translate *ptw,
> >      descaddr |= (address >> (stride * (4 - level))) & indexmask;
> >      descaddr &= ~7ULL;
> >      nstable = extract32(tableattrs, 4, 1);
> > -    if (!nstable) {
> > +    if (nstable) {
> >          /*
> >           * Stage2_S -> Stage2 or Phys_S -> Phys_NS
> >           * Assert that the non-secure idx are even, and relative order.
> > @@ -2671,6 +2671,13 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
> >      bool is_secure = ptw->in_secure;
> >      ARMMMUIdx s1_mmu_idx;
> >
> > +    /*
> > +     * The page table entries may downgrade secure to non-secure, but
> > +     * cannot upgrade an non-secure translation regime's attributes
> > +     * to secure.
> > +     */
> > +    result->f.attrs.secure = is_secure;
> > +
> >      switch (mmu_idx) {
> >      case ARMMMUIdx_Phys_S:
> >      case ARMMMUIdx_Phys_NS:
> > @@ -2712,12 +2719,6 @@ static bool get_phys_addr_with_struct(CPUARMState *env, S1Translate *ptw,
> >          break;
> >      }
> >
> > -    /*
> > -     * The page table entries may downgrade secure to non-secure, but
> > -     * cannot upgrade an non-secure translation regime's attributes
> > -     * to secure.
> > -     */
> > -    result->f.attrs.secure = is_secure;
> >      result->f.attrs.user = regime_is_user(env, mmu_idx);
>
> Do we also need to move this setting of attrs.user ?
> get_phys_addr_disabled() doesn't set that either.

I've applied this to target-arm.next for the moment anyway, since
it is definitely fixing an attrs.secure related bug. I can replace
that with a v2 or we can do a follow-on patch, depending whether
you get to this before or after I send out a pullreq.

thanks
-- PMM
