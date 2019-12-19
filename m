Received: by 2002:a19:c345:0:0:0:0:0 with SMTP id t66csp2202613lff;
        Thu, 19 Dec 2019 05:13:38 -0800 (PST)
X-Google-Smtp-Source: APXvYqyDxpjQfVmPzU57aF1nT0qPsM4kWKMGO2alU+2EkI4+g1XxOi2j2USoS5Fv8O5mV4SqsXtG
X-Received: by 2002:ac8:6f75:: with SMTP id u21mr6970362qtv.52.1576761218432;
        Thu, 19 Dec 2019 05:13:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1576761218; cv=none;
        d=google.com; s=arc-20160816;
        b=i/yIP4vBplpcoH6BMrTjAtg7Rp5XKw5KVDUIthnatUduUc8dEioqyCm2jAz+62H21P
         qTUM3DCYdoTbx8rFKyh93MKPn+XC+QtZr36i2tksCha8934hC42PquRVCIo+F8lBuqW9
         KOxT70hP6ayxYCi5CXKQ4GUwsxty4lna744Dktbqh3vEHUq9BX2n1QC6AyE1lOYJ6OBb
         DP7CurLZ3DglSMu7uSjHCwrqVXVzmx5tOO6WHV7L7tCENyaAsRk8DxVPnim82pWxfMtH
         UumEYTVaVkCzEWQBgvNiBcqZzzw4dFCciDv6/H0+4XxPwka2gyczaHmRjZLBQHVGpnHA
         fgOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=j03bvTj8hmciPAmrh7pM7iJu7uCWP2HD0yo3OK6rh70=;
        b=ZBccP22aGovm0MlGJEiyZJr7Fc/9u0vAG/PfVcGbJUgApyuoyuxycL5fvwHVblA+NB
         QmrllcYZ3meTXdMzQcqZ1RM5xjj0G6LCd5SHVRU2nOEgPbC6eFtdR7n9KlaIhL/hZJWX
         RtRRXGEL5PzOFopgP3/WruPY6b3c5kcNsh6lqUoR49+k1y26knMfxU8HM0HhH/T0CB5j
         hORGAIF2gAVcuePmaWXI1kltyZt4R4hJeqdiRnkHt4L9esttwVoyCSHmiK5MxyxGCyhv
         KLXYA1B6VSQLwGTm30q/3XJB25HdOgC5MQnD705ZnQleiN71L199zCmP035YpxOfSyAj
         CT5Q==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hqZnlI1W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p11si2971565qtc.78.2019.12.19.05.13.38
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 19 Dec 2019 05:13:38 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=hqZnlI1W;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40914 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ihvcX-0006qO-M0
	for alex.bennee@linaro.org; Thu, 19 Dec 2019 08:13:37 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10]:56257)
 by lists.gnu.org with esmtp (Exim 4.90_1)
 (envelope-from <peter.maydell@linaro.org>) id 1ihv9t-0000Xq-NO
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 07:44:02 -0500
Received: from Debian-exim by eggs.gnu.org with spam-scanned (Exim 4.71)
 (envelope-from <peter.maydell@linaro.org>) id 1ihv9q-0001FO-48
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 07:44:01 -0500
Received: from mail-ot1-x341.google.com ([2607:f8b0:4864:20::341]:46294)
 by eggs.gnu.org with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.71) (envelope-from <peter.maydell@linaro.org>)
 id 1ihv9p-000182-Q5
 for qemu-arm@nongnu.org; Thu, 19 Dec 2019 07:43:57 -0500
Received: by mail-ot1-x341.google.com with SMTP id c22so7064580otj.13
 for <qemu-arm@nongnu.org>; Thu, 19 Dec 2019 04:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=j03bvTj8hmciPAmrh7pM7iJu7uCWP2HD0yo3OK6rh70=;
 b=hqZnlI1WgGL0a2W2GYcjcJNnZG18GLBC5jaC7cOmKTLG0kOkC0ZzPwzoMVHTY5SH5g
 kDwJ5SgOhPMi0rpbmMXiF6X1h3lgPPhCXKjhIbd9i1Nf2pBaIv8nIOM+Zgakzm0CxSik
 12i1X1wmdBzK8ejvKq7ylj4xb3yMzYy8hMOWKCv7GZKIl07+wcc+B87HgMKSfxd7hKqP
 a1G+qEINv8zhZQWDlA2bdaPVn63IEkMOsf4iK0osd25xtUoPllGh6Hx0r2OjkgAwtIDJ
 kHINPG5ucfA+7ySpCqoktCfKDJIzpJqYYI4pHhexWk5vxHmpwTr68iZqo3eqvJyI9KUJ
 AsHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=j03bvTj8hmciPAmrh7pM7iJu7uCWP2HD0yo3OK6rh70=;
 b=q1PaMThuS2DIXTNc1MzzC3D31Dh51tU+z2+OWZ+oYExG0TPhqZZI8UERp+69rXGUXx
 q9sI2L9ZJiiUwqdV0us7L0xvwYjbpVeXjl5xqnDHeYIlaz0+lBbAL31YZO0a+N6VmI0k
 9k2IHmGb4TiRF+/c6jswHI8Dzy+3jY+8TJ654vUpAdl5/mDnBUMij4s9HstcbuPVXCbe
 2VX6NgnSXtjTzIyV3M7ViFIfgSk5FTe5+g8O425HTtCWK2qioom+yck+5zTLOztbwDZZ
 0xUNyazPiHRMSqn3JQYjqg9g6R64siO69POE/pw9y+0Kfvqng/K22hx0dySAcbRH1ZiR
 C+sg==
X-Gm-Message-State: APjAAAX1iYT93AVhGleBpBMZtLSvVL4AsFen1iXjfDYF2cnBoIEgTPxG
 xMzcYjxRtLSgqGjOrILtRBr7nrlhVG2vhGwYXH2T6w==
X-Received: by 2002:a05:6830:2001:: with SMTP id
 e1mr8197502otp.97.1576759436211; 
 Thu, 19 Dec 2019 04:43:56 -0800 (PST)
MIME-Version: 1.0
References: <20191217210230.99559-1-jeff.kubascik@dornerworks.com>
 <7a274247-e593-5828-73f8-2042971e8633@linaro.org>
In-Reply-To: <7a274247-e593-5828-73f8-2042971e8633@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 19 Dec 2019 12:43:45 +0000
Message-ID: <CAFEAcA8Egy=Jkw8yKSumkeX=+Qxi8bPy-0fJjopHR6gCmz3FLQ@mail.gmail.com>
Subject: Re: [PATCH] target/arm: fix IL bit for data abort exceptions
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
X-detected-operating-system: by eggs.gnu.org: Genre and OS details not
 recognized.
X-Received-From: 2607:f8b0:4864:20::341
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
Cc: Stewart Hildebrand <Stewart.Hildebrand@dornerworks.com>,
 qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>,
 Jeff Kubascik <jeff.kubascik@dornerworks.com>,
 Jarvis Roach <Jarvis.Roach@dornerworks.com>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: xCW05Gr8uH+X

On Wed, 18 Dec 2019 at 01:03, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/17/19 11:02 AM, Jeff Kubascik wrote:
> > diff --git a/target/arm/tlb_helper.c b/target/arm/tlb_helper.c
> > index 5feb312941..e63f8bda29 100644
> > --- a/target/arm/tlb_helper.c
> > +++ b/target/arm/tlb_helper.c
> > @@ -44,7 +44,7 @@ static inline uint32_t merge_syn_data_abort(uint32_t template_syn,
> >          syn = syn_data_abort_with_iss(same_el,
> >                                        0, 0, 0, 0, 0,
> >                                        ea, 0, s1ptw, is_write, fsc,
> > -                                      false);
> > +                                      true);
> >          /* Merge the runtime syndrome with the template syndrome.  */
> >          syn |= template_syn;
>
> This doesn't look correct.  Surely the IL bit should come from template_syn?

Yes. In translate.c we put it into the syndrome information by
passing true/false to syn_data_abort_with_iss() depending on
whether the issinfo passed in to disas_set_da_iss() has the
ISSIs16Bit flag set.

I think this is a regression introduced in commit 46beb58efbb8a2a32
when we converted the Thumb decoder over to decodetree. Before that
16 bit Thumb insns were in a different place in the old decoder and
the 16-bit Thumb path passed ISSIs16Bit in with its issflags.
(We should cc: qemu-stable@nongnu.org on the fix for this.)

> > diff --git a/target/arm/translate.c b/target/arm/translate.c
> > index 2b6c1f91bf..300480f1b7 100644
> > --- a/target/arm/translate.c
> > +++ b/target/arm/translate.c
> > @@ -8555,7 +8555,7 @@ static ISSInfo make_issinfo(DisasContext *s, int rd, bool p, bool w)
> >
> >      /* ISS not valid if writeback */
> >      if (p && !w) {
> > -        ret = rd;
> > +        ret = rd | (s->is_16bit ? ISSIs16Bit : 0);
> >      } else {
> >          ret = ISSInvalid;
> >      }

Rather than setting an is_16bit flag, we could just use
"dc->base.pc_next - dc->pc_curr == 2", couldn't we?

thanks
-- PMM
