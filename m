Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1829796lff;
        Mon, 14 Jun 2021 03:20:32 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxLcqufVAwGa+GE5oYVxOejXyzc1Kx3zD8aG/zYxbAIJwoIZX9y+jV4KQx8WRgGDWl7E24z
X-Received: by 2002:a37:c447:: with SMTP id h7mr15124567qkm.63.1623666032048;
        Mon, 14 Jun 2021 03:20:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623666032; cv=none;
        d=google.com; s=arc-20160816;
        b=cGlOLIdpmuo+xahNg5albJ8+uwWWD/SWgjJg+LCRbn1+e8EzB+Vd6LKRP0svINbPp0
         tVO5fq8iie3mNlHEcEb1Qx5VmPpLpFOnFWZ8LM1nay8zw7sWSmb85RyeGWXn9Lld9G9f
         OqF9Iu5+ycAGqQL0zMVrz7zuMjPLnBaFdedpFt310PIU3oB7ghsg4YH3lZ/TSvlsECq2
         QAbfhAWt4kFX5mH4rCKkz+FTFxVplNNzDXjsSS1+klU4cKTEsgrOFFGrBEOD6tAPWwU9
         pk0cp6jnKDewpduMN82yXbg1r5JLoeGKNLIOtnPUtDWBhPttIOhGQpubw4uS/Ek3ZDU1
         WlHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iLVP2KybRdHHflWmeeMgVJ9wHpwcSrblUuI8dPa8KrY=;
        b=TxtkHC2Ib3FY/DIb5oen2jaH528bGHEK3WkF5TVkwpG+bPABhICt4LzRe+/Y3hiDFp
         wrWUCMroFxAqRjKlyrJJ1WDFUF4yhs/uR8QZz8++jGbnC1IGgQFgZTlRWff522w6ANIb
         zM0iwHlmRmw26b7SQFU//FZJvgBsj0abBR32RLVV+Pxqm6tx1y/GLxttXb/04mxXADrh
         93HNid90yXPzuApWey0+g4CT5iaJNrM3YMZ4OGobrcTS1wpUT4VkhcVo55t3j+VEBcYq
         4IJi8xWfGRl9YK+bGWSzYvxH9U0AsCNQI0BvnpO+yLTBUXA53uccxs+9baQNlax0173g
         AxxA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bu7gLVnP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id h23si8868391qka.100.2021.06.14.03.20.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 03:20:32 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Bu7gLVnP;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:54448 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lsjhn-0004DD-Cf
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 06:20:31 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35186)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsjhe-0004Cd-9X
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 06:20:22 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531]:42712)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lsjhc-0002gf-3c
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 06:20:22 -0400
Received: by mail-ed1-x531.google.com with SMTP id i13so45771847edb.9
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 03:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=iLVP2KybRdHHflWmeeMgVJ9wHpwcSrblUuI8dPa8KrY=;
 b=Bu7gLVnPMtVPWWeotRzgGisuRuw3P381yNPImB4vAOip5tlFv7wwUJ8GPcr6PWwFsK
 j1aaFWMQnIGCF8KacKp5K9+4N9LhYh6SASm6A4ijb208300H1oxKqPVZMm4ZOjXlgBBv
 3topFwRVri4gQ0yF1XV6ut+OMHZzyWCMfGym3Cl+me+2KnUxNp0rt3P4ATGnwh/wkm6B
 5u+XcXAcxJ+hyh3PA9Qs8LwLcA6BhU7vqjvJ5hk2/pIBd1yVs9vEHrXZ2AbOQuH0bEIF
 gFSO23otdoDzXo6E6bA7F6vNBDqrn1zEJbDwReuyzawlsYjXpVmKeisUfQIuBpWRJFZX
 EoHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iLVP2KybRdHHflWmeeMgVJ9wHpwcSrblUuI8dPa8KrY=;
 b=QXXt4xyQfrZtsDi6pCHvbgJ6B/KlFS0QVpGwz8XfJIRCrQMK1cftVARrFvuGqwOruf
 caq81Z20bBt/VGIIz5WmzMT2tZuRWgMMHjS30CtuBOAQBdrth2rLaC5pox1AsSbBoIuW
 8zyXxq89Wp5yk0No2V+q3TD9z0xUSPawedZn8CpNUhNf7QJpp/YXwGpmcdbrqmdBbR3e
 0dYhzK+e1nv7bST6UR2GsNGGeRuDnvupenapesBbCm06zEQmDLDm+87eU0Dz/0LKT7a1
 7LffDznkky6V3IOjFlIgAy4SXRseaTJqfD1Gjxu9vAqr/a2xZ+uM8C5KlnDgMzr9KBdG
 Icpg==
X-Gm-Message-State: AOAM5311xtOwRHvpn1cfU/jzP9las74KfFwhpQMmJiK4z9lnptGVP+GW
 ax4sRfeZJUprQpJM18uS3f6l6v8utwIacJalR9OZjw==
X-Received: by 2002:a05:6402:3482:: with SMTP id
 v2mr15992050edc.44.1623666018404; 
 Mon, 14 Jun 2021 03:20:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-33-peter.maydell@linaro.org>
 <ff13c13a-0014-4930-5a8f-813818d6fcf1@linaro.org>
In-Reply-To: <ff13c13a-0014-4930-5a8f-813818d6fcf1@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jun 2021 11:19:43 +0100
Message-ID: <CAFEAcA9UqJpBU9crxWFQg-8U4XtnVK4tgAGR-mhUZyhiLN6ARg@mail.gmail.com>
Subject: Re: [PATCH 32/55] target/arm: Implement MVE VRMLALDAVH, VRMLSLDAVH
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: nKuDoUKXGIFV

On Wed, 9 Jun 2021 at 02:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/7/21 9:57 AM, Peter Maydell wrote:
> > +#define DO_LDAVH(OP, ESIZE, TYPE, H, XCHG, EVENACC, ODDACC, TO128)      \
> > +    uint64_t HELPER(glue(mve_, OP))(CPUARMState *env, void *vn,         \
> > +                                    void *vm, uint64_t a)               \
> > +    {                                                                   \
> > +        uint16_t mask = mve_element_mask(env);                          \
> > +        unsigned e;                                                     \
> > +        TYPE *n = vn, *m = vm;                                          \
> > +        Int128 acc = TO128(a);                                          \
>
> This seems to miss the << 8.

Oops, yes it does.

> Which suggests that the whole thing can be done without Int128:
>
> > +        for (e = 0; e < 16 / ESIZE; e++, mask >>= ESIZE) {              \
> > +            if (mask & 1) {                                             \
> > +                if (e & 1) {                                            \
> > +                    acc = ODDACC(acc, TO128(n[H(e - 1 * XCHG)] * m[H(e)])); \
>
>    tmp = n * m;
>    tmp = (tmp >> 8) + ((tmp >> 7) & 1);
>    acc ODDACC tmp;

I'm not sure about this suggestion though. It throws away all
of the bottom 7 bits of the product, but because we're iterating through
this 4 times and adding (potentially) four of these products together,
those bottom 7 bits in the 4 products might be able to add together
to become significant enough to affect the final result.

-- PMM
