Received: by 2002:a17:906:c1cf:b0:a52:4db9:938b with SMTP id bw15csp3183702ejb;
        Tue, 30 Apr 2024 11:43:06 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXtHXwjWie0iRgN3qfZvafncNju+hntsMdgya1K9a4QMyZ2PXNHO+z21ckkZSb+0mFrFz0690A1S/UFpRroRnDMbgm8Ax2v
X-Google-Smtp-Source: AGHT+IHyfd50PFJOGJcc61mVTid2G+4sh72IzS+rGsjueY0e0TbURxGoghi2rgPE4xP52giA6aAU
X-Received: by 2002:ad4:4ee1:0:b0:698:ecae:429c with SMTP id dv1-20020ad44ee1000000b00698ecae429cmr181334qvb.56.1714502585994;
        Tue, 30 Apr 2024 11:43:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1714502585; cv=none;
        d=google.com; s=arc-20160816;
        b=okXIEZWJooMrE3MLKvPZamKhjSt2xQas2VsApB2Cubf1XxZFculyWpr0RtsUnFkHym
         lzcfneb+HJ9ox+nI7zDRjolxtPkRiSR1nnzl1RM7ZKynWfux8wwIi84byvTtuRJwZllm
         6fd5IECRJ7XRYmpz9eapkAMo1wTC98M4ReDpAGT8wTV1IQkcSU+T9eqxwwe2QPf9xACT
         lbwMLPysNjtMoC+BZPDUUCfntiaxAmCHjbQnOhlhwEEyCnbaGPyiBkhtJTQuSzeSGnoj
         znK0V9RQ9Q+NldSljj5REx2GdVW1AC3ERoYoU5i52t+LpwT0eUA77iJpBi8BFqJ7t7d0
         eyDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=8mCUSCLmgKzNcOyOr98vFPv0pYjXNNAruAUVA2i3+os=;
        fh=PKodlsZ4sLOulf3vcyB9a9UvxkkwctzJ7UL5PZ8dNXQ=;
        b=H6bXbKErNwmDaDi27mPaVSgBUz4pqw2ZMsIIAa38lVYlDVULaQLmLwzgsK2GzZCpK5
         g4RIONg/xsVheAeQwHeHLWnBXkXo6Vpm8oEPA4Ff0dtC6fSceNTo61w/XItrjR3F09AL
         /78+O6VRaXsX1k0e+BD1kpNI6LyZNjBycMjs1tHoAI0HQC8LhL3IdagbHkTVVeg4dBPD
         3QALKpHikFiP33lmwevITsStSfjr1cxc3HBN4V7JV4zvW+3mWxiwM8Ff0Qy9jWRNzGga
         8LDsi6ugO2imU2MGFnbp3/FoCty+wrZnj722JoCZGdOxgdXQPXa0YG6WIeZt6ZSIUXgi
         aIQA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hxFVVeLd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id gc15-20020a056214230f00b0069b0b8b31bcsi29348152qvb.429.2024.04.30.11.43.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 30 Apr 2024 11:43:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=hxFVVeLd;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s1sRH-0002Vo-CU; Tue, 30 Apr 2024 14:42:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s1sRF-0002VM-OZ
 for qemu-arm@nongnu.org; Tue, 30 Apr 2024 14:42:49 -0400
Received: from mail-ed1-x52a.google.com ([2a00:1450:4864:20::52a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s1sRA-0004bJ-Cd
 for qemu-arm@nongnu.org; Tue, 30 Apr 2024 14:42:49 -0400
Received: by mail-ed1-x52a.google.com with SMTP id
 4fb4d7f45d1cf-5708d8beec6so7673233a12.0
 for <qemu-arm@nongnu.org>; Tue, 30 Apr 2024 11:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1714502562; x=1715107362; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=8mCUSCLmgKzNcOyOr98vFPv0pYjXNNAruAUVA2i3+os=;
 b=hxFVVeLdCwZmHYXYNtKRnYN9yEv66xefyDS51rKYbt/tW1c9t8U6Huz9Bqn2pR+Buy
 8fvv1Dh0mri8uxu4c6u9AaQMTph2wBKqiwKKFbY9puf5Hjh5iHUuSGpUBsStLhljX5b+
 AukHREH77W2I5GWGscBq6wbUnx6zPrdoBw7fMPCLyseGrdiax3bpu2yVqpJQdNsaDSNY
 iDsgBQqT+rvdM07czuwfbx6IMMhRx3PuwHjVKCr7S3Wf8Y4XCEMeylM6OL1Orgs7IkL4
 qGhS8FKuH7Jy4qL/e8kMEuGbl9Lqf+WWNWRgoXckkNLUenK1sybtkp3Pqm1vHORKGW0L
 KvNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714502562; x=1715107362;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8mCUSCLmgKzNcOyOr98vFPv0pYjXNNAruAUVA2i3+os=;
 b=UmUw3H9YEoDdC2X+Y+GhxVnjUOx4oJap+YjiwbcgmU4ahatznlm+Ir7cYLwHsDLF0j
 ozaEjjGtol1BeShpikeVakYhzqh5orbRiIlGlTEOfxuEsFcgSBXfoKUmOYjxK2m3+1VE
 Vf5EEmPM3Txf5bBpzNGKduDDu4yI7HJl7aS7YSs/4EZaSTq5wv2qVLZgAeVpFrzPM3nM
 R7AwVAlNfb5hhWs2KIMNIDzQBXojR4/nsqXNIA6xzx9tzAqUxdJnkaRSmZZ642OhqSc/
 jwrw9fg6d3ULeDPYSIpzIcwzpHlrTf9MNTEDoZ3H4o77K7EOKpfsyw/77/EqybWvgJmd
 4+Zw==
X-Gm-Message-State: AOJu0Yyesw1lK/Y5H8CdzK4lT76EzCS/Yj85a9uzBlPkjsopMyYfla61
 vKz4bXhtJ+OOku/0emA/T4BEMariSQK9FO6XnfRVyh1pp6hw1UKwDTA9iA0G0zN+0rykVxgTsXl
 dUSiVOnyHxIJ4BIw0wgmyinu81eLiWGkIK4Io/A==
X-Received: by 2002:a50:d6c2:0:b0:56e:22a1:a9a2 with SMTP id
 l2-20020a50d6c2000000b0056e22a1a9a2mr415339edj.33.1714502562360; Tue, 30 Apr
 2024 11:42:42 -0700 (PDT)
MIME-Version: 1.0
References: <20240430140035.3889879-1-peter.maydell@linaro.org>
 <20240430140035.3889879-3-peter.maydell@linaro.org>
 <8004c7bf-3185-4eba-8e1b-4a913bc1143f@linaro.org>
In-Reply-To: <8004c7bf-3185-4eba-8e1b-4a913bc1143f@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 30 Apr 2024 19:42:31 +0100
Message-ID: <CAFEAcA-G2YAArmV7Ttg_-iRoh43n5YeXiBafqsjeAyu_9u8saA@mail.gmail.com>
Subject: Re: [PATCH 2/2] target/arm: Implement FEAT WFxT and enable for '-cpu
 max'
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52a;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52a.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: 1HsoCYnGlMbh

On Tue, 30 Apr 2024 at 18:31, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 4/30/24 07:00, Peter Maydell wrote:
> > +    if (uadd64_overflow(timeout, offset, &nexttick)) {
> > +        nexttick = UINT64_MAX;
> > +    }
> > +    if (nexttick > INT64_MAX / gt_cntfrq_period_ns(cpu)) {
> > +        /*
> > +         * If the timeout is too long for the signed 64-bit range
> > +         * of a QEMUTimer, let it expire early.
> > +         */
> > +        timer_mod_ns(cpu->wfxt_timer, INT64_MAX);
> > +    } else {
> > +        timer_mod(cpu->wfxt_timer, nexttick);
> > +    }
>
> The use of both UINT64_MAX and INT64_MAX is confusing.  Perhaps
>
>      if (uadd64_overflow(timeout, offset, &nexttick) ||
>          nexttick > INT64_MAX / gt_cntfrq_period_ns(cpu)) {
>          nexttick = INT64_MAX;
>      }
>      timer_mod(cpu->wfxt_timer, nexttick);

I'm following here the pattern of the logic in gt_recalc_timer()
(which could admittedly also be considered confusing...).

Also note that timer_mod_ns() and timer_mod() aren't the
same thing. The latter calls timer_mod_ns() on its argument
multiplied by ts->scale, so if you pass it INT64_MAX
the multiply is liable to overflow.

thanks
-- PMM
