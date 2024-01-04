Received: by 2002:a17:906:6698:b0:a28:f940:7a27 with SMTP id z24csp189229ejo;
        Thu, 4 Jan 2024 08:25:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG1GPnV9ixVxxpQw3/8p9DrDZANQJ0WPn54oXUc4Zc8cDzDz8WhjEMrEp6iwUyIlaYmlttN
X-Received: by 2002:a37:ef0f:0:b0:781:6d22:6bf4 with SMTP id j15-20020a37ef0f000000b007816d226bf4mr806441qkk.86.1704385517762;
        Thu, 04 Jan 2024 08:25:17 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1704385517; cv=none;
        d=google.com; s=arc-20160816;
        b=LBrlYQq/wrQG3RCbg7RdKk/4xY5dS4nRNxyCRK28DZLvaW4vXzT6raT0OFxB4DgEdA
         luWCZnGex058eGboHCZ6Z7uZKefXH4D9+X5pVRhUdjg2lhPbNLbV855EMojKehUAVnNR
         gO8komuqiJ6PGTHamz379DaYYMgOVIOVTpjjACmfzlO/5jLbsDQhmnyE5JOdcKwXQoeW
         YTtlwyBfKIP1b9H+sEo7Fy8avgik7EGzZ4IzCKDIwrGttnrkvjt+PLTYuEsltmw6tN5z
         +hi+es1AurZjwD/ewpT4rX1hQtaNjm4pHCzq5QyWuloQZnLROxgnNwi10YUkipOtN/MS
         AZow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Hdc5ZyGzqm0akkLt7bQ4+HgnyTVp3YFbEgfv/BjOLgQ=;
        fh=PKodlsZ4sLOulf3vcyB9a9UvxkkwctzJ7UL5PZ8dNXQ=;
        b=O5VOW4k2cueCWsfD46bg5QJoEeEn1aDsezlkG2iffzdaSrFoWDfAvsClhlx67cB/yU
         iqMFIrtJLRITM0ghQITrORJccJ0fyq3wHtlC0oysWNP1Zu/Tgvdxsmr8QyD/cfAohtqS
         d8dShje8LaaKMHVv3j2A6l/5/zGobpxhbz/Dr7jDcerSMTrv20kp38apVPpTRQ3PkDVm
         E9HckJOctwFdxwcuxrumYM5c4TQmJpCES//5AKY1Su1rEgOwG/6gyuGaVyHgeS5odY5l
         ZZaXhRrYU5yS1kOICw1uR9V04RDT1V063pHOiIb/jFikvaLiRQ9YMDSPfJ9DLyy/phMN
         sE8w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CrkjYyjk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bq36-20020a05620a46a400b00777731bf89csi33254869qkb.150.2024.01.04.08.25.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jan 2024 08:25:17 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=CrkjYyjk;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rLQWv-0003Tb-6L; Thu, 04 Jan 2024 11:25:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLQWs-0003TO-9O
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 11:25:10 -0500
Received: from mail-lj1-x235.google.com ([2a00:1450:4864:20::235])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rLQWp-00075s-9i
 for qemu-arm@nongnu.org; Thu, 04 Jan 2024 11:25:08 -0500
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2ccabf5a4beso8270631fa.2
 for <qemu-arm@nongnu.org>; Thu, 04 Jan 2024 08:25:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704385505; x=1704990305; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Hdc5ZyGzqm0akkLt7bQ4+HgnyTVp3YFbEgfv/BjOLgQ=;
 b=CrkjYyjk8HfhRNLXaw7qJ93wgNLkucNX5s+AiZiAKrjRdtKHGHCcCtiAR2lOsM9urb
 I5g4Bh3mgxsfo8U+73kezy/m8D/2PA1K43ETKQ5r9Ii83sVpqSCQ03rwvHYlfXPfpnYV
 KGS/oMi7EA0izQGI1O/Omb0bpgtFZS7D9KEuxI1cxAftc8IVSLJtgOg3a1DgYgk+2TaA
 3gmo3sD0HlpB1NP+xDLFKmoboCnV+rcgTo+D54tEM7vqaG5pATTTCVesg4//i9UGmz0L
 Ga7aSqPF+Z3YjtyhGdhMyvFernUcGozgjGrCZCZEzlGPWQ3EsSbimm92sEuaBsc2Jn4e
 uLEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704385505; x=1704990305;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Hdc5ZyGzqm0akkLt7bQ4+HgnyTVp3YFbEgfv/BjOLgQ=;
 b=oJVbfpJRZQZnhxFBlHDAlXNnaN7rjsEdYpTiT2V1SGqTvpRf/1R4YugswxmqtAq2HT
 pioEXQkmPjv8gqCQPFQ2k/EPiz01Lp1wL2Ojhh/SD3QQZ3HgDr55eQnclakiFPNZfdCS
 GIiEOC1sV+mYdEoQIK3rqP0y6FAoCs+VuMjZno5WIerSviCwn9e5rhwAcrUJUyA04FxE
 B4SOJoNTBguhP2I7X9Vf3Wohe2AucduBazmNtaYk37MvUWItw5pmST5iyZso1pv8Cs3y
 Em3SBguo8BGEe7AXt/C00jK0gVy4AkxYF7otTzTMJt8qdAIIjUmpAtaRh+Xhjn1K8EdD
 Vi9w==
X-Gm-Message-State: AOJu0YwpaDuO6SpzHsEEj5i9ogNZIGxtqqbopiAdiRZJBcRuVarIFJHw
 ruSYJX5o2XBAahFLgkztqCTKYkA2iM28xYxJnHu6b8vuoZZh6A==
X-Received: by 2002:a2e:a27a:0:b0:2cd:278b:fe5f with SMTP id
 k26-20020a2ea27a000000b002cd278bfe5fmr218466ljm.99.1704385505576; Thu, 04 Jan
 2024 08:25:05 -0800 (PST)
MIME-Version: 1.0
References: <20231218113305.2511480-1-peter.maydell@linaro.org>
 <20231218113305.2511480-30-peter.maydell@linaro.org>
 <bf5e3af4-75a0-4398-8a54-eb8bdf641eb6@linaro.org>
In-Reply-To: <bf5e3af4-75a0-4398-8a54-eb8bdf641eb6@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Jan 2024 16:24:54 +0000
Message-ID: <CAFEAcA8nRWyOqqZZ1iq7uB3BYsnFpZdad-FXvzK_w1RBnQfGVA@mail.gmail.com>
Subject: Re: [PATCH 29/35] target/arm: Mark up VNCR offsets (offsets
 0x100..0x160)
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::235;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x235.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
X-TUID: kjPwcqAPvJUp

On Thu, 28 Dec 2023 at 00:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 12/18/23 22:32, Peter Maydell wrote:
> > Mark up the cpreginfo structs to indicate offsets for system
> > registers from VNCR_EL2, as defined in table D8-66 in rule R_CSRPQ in
> > the Arm ARM.  This commit covers offsets 0x100 to 0x160.
> >
> > Many (but not all) of the registers in this range have _EL12 aliases,
> > and the slot in memory is shared between the _EL12 version of the
> > register and the _EL1 version.  Where we programmatically generate
> > the regdef for the _EL12 register, arrange that its
> > nv2_redirect_offset is set up correctly to do this.
> >
> > Signed-off-by: Peter Maydell <peter.maydell@linaro.org>
> > ---
> >   target/arm/debug_helper.c |  1 +
> >   target/arm/helper.c       | 22 ++++++++++++++++++++++
> >   2 files changed, 23 insertions(+)
>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
>
> > +        /*
> > +         * If the _EL1 register is redirected to memory by FEAT_NV2,
> > +         * then it shares the offset with the _EL12 register,
> > +         * and which one is redirected depends on HCR_EL2.NV1.
> > +         */
> > +        if (new_reg->nv2_redirect_offset) {
> > +            assert(new_reg->nv2_redirect_offset & NV2_REDIR_NV1);
> > +            new_reg->nv2_redirect_offset &= ~NV2_REDIR_NV1;
> > +            new_reg->nv2_redirect_offset |= NV2_REDIR_NO_NV1;
> > +        }
>
> Could use xor to flip both bits at once.

Could do, but explicit clear-then-set seems a bit more
readable to me, and since this is only happening once at
startup there's no efficiency concern here.

thanks
-- PMM
