Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4583C88E53
	for <qemu-arm@archiver.kernel.org>; Tue, 15 Sep 2026 13:31:26 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1x6TFj-0001JN-Uj; Tue, 15 Sep 2026 09:31:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6TFi-0001J0-Cn
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 09:31:14 -0400
Received: from mail-yx2-x11.google.com ([2607:f8b0:4864:41::11])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1x6TFe-0002dQ-8N
 for qemu-arm@nongnu.org; Tue, 15 Sep 2026 09:31:13 -0400
Received: by mail-yx2-x11.google.com with SMTP id
 956f58d0204a3-66e4ab20f4bso3010098d50.0
 for <qemu-arm@nongnu.org>; Tue, 15 Sep 2026 06:31:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789479069; cv=none;
 d=google.com; s=arc-20260327;
 b=D7v4mRhlG+TqStjVSQW2d+p6DgLGiBL5/NkgYzhymby+a3GyHUIIkFFDgmu56+odQn
 /ODFbxZBOw0Bhl0Gz3ugFLhKzoNEz0TcrM5mGOf6g8BkkSmBfeppyiBrwDnwZsWrL0UF
 J3Xtiz8DBLHc34n2Cix44sOckVBALDgspZL6RM2O8OQbaQ/HN1+4mNbIDf0lKdiAHm9H
 H/1ZqZn8SkWxERfaomXOt5l50gSCHdL5Ok6dHzjZZT0b8KY8wdZBee//Vaqt0yYBcJdN
 cRQ6OhCyt1RM+9DflQRo8Y4NoxhpQoI7Ds1ITthnEpO/9dq3C/Vd7FFk33gtNf4xxfZs
 Fnhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=fEhOrvP/PY+ycmNwRjKVQCDmoJyCRHPJYQDd+YEQUVY=;
 fh=+X3mTj4SpqkDbsdXUR9UU+Vo8PlgU3Ha6upNYmyrbEY=;
 b=scLBUpMDtmXKRMaeRlt1H7Cf63FRgn0N24hsllSivONg/w409WGDmjFuW9pTI7t2Sa
 gWxXJt0tElX8f1f/5/D+e3fpikAWMUZO3zRXauuZnR+6MyK725FkZyJHVRT+3VBYLvLV
 LOaZjKIO3dORr290WkJDhiSBFJ1OynEE4KgUa0BsEey+IJkWzI5+GWyr5K/B1vqtF8sP
 kEWQsj0MumObH6yIpx+2oQm9O+yzvyAv15cfNWiCdabHrJoNMkvXwyVuU7GzmU7tDb30
 nKovzd07YRRCWL61Oa5hKidRAcDxTplRfU/6upBNBpYNWXJuW/wJHH4REUakLNTT8Eo2
 XInA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1789479069; x=1790083869; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=fEhOrvP/PY+ycmNwRjKVQCDmoJyCRHPJYQDd+YEQUVY=;
 b=FfTpY75GApHj3kfL0Ja355prwtc3NK6wfVQeq2spMfhH/cRhRhKJAia90qMb/LvaBy
 LpcXwSev4mHhzrpJTs2cfTtEDPltBLd0nINEk1rRPBRP18251H0Fx4/f4r3gcijhJXzF
 rzPM7MXNl5wdALTle4iNwSzGGIUgXu9tPKqC4c4I22/CGqeQNY3roSJrshUDNISJMvh0
 h4FZPnnfQmTcyKOFALxxmZ5SZilz2kItWo/Lv4vzJasHI9cwXk3BxyAoiHDHzljNTStA
 70iLcn6HhDmPUV0u361SXkAQm8Tan4vYrsa3eKiECV/bkgmT9IhBSriDjZttpkuRMQAj
 UELQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1789479069; x=1790083869;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=fEhOrvP/PY+ycmNwRjKVQCDmoJyCRHPJYQDd+YEQUVY=;
 b=PN/WyoRmS+YJKWT9MTRkMu0KHbNx94J7H1AOL3fgFB/te2OYqrV6OXGQ6igAwziryx
 zi8XRgbC3UKmbLeQgJg/JOZny7x3JLJ4xvTSOTFTlb9QH+hx9kNCn7UoiKNy1nmIY//X
 OplL2Ryb+2DYe/vXZGJvtgpj3Y3ZnTm0zu6I9OiIU/CeTgasKxJ9BFw9W3zeoKPs7iwr
 lBgDSxFLbuG/d7eNDWOJtCWfaotITlho1wil379NYfDEHVR35aCpsNt6jmUo3KY5kNvO
 Pk/y5u8rONCUPW00esk4YwwL5QgrDZ03pKAptFjQnjS/53hn3+d59q+1fHCzx/844QMC
 lHgA==
X-Forwarded-Encrypted: i=1;
 AKwUvByJSqAGoji3Dn9JZTvhQZbaxeK/L/IIo4JCqN9nrleMRWzyH6noV+DjR66Ff1mWI25leRr/JG5j8g==@nongnu.org
X-Gm-Message-State: AFuF++lFn5upToGgDSTyiChIKFgeebhT4EhN9Kjq6mvEsLylROThFXh4
 cHQKTdjZ1FL0HB+cnTylvenJeyLjpgQm0Hl1Ld7EqUFQsit9u2SXxWZlqqRtEsE8qnHxNy++IHj
 /VpGOUJ+g5qS95+Dlsw9uvLsuks2qSZafwyHC23MPtg==
X-Gm-Gg: AYBFou1KNFHYMarttDsGliFasZFo8c7cc5CXF5V/H5tXeLJswkvnRekuZnc9EKsqTDE
 5mlgCc7HokfBeJzIH49z0PW4OucPhTSQH+yT6EWcCzDQp72csmIXwp9qMxhuhXzjC0m5YzZ/gLJ
 JZWhoqxfUa9doLzvIZEjhVZxTpjwWUk7MHdzKEcaGCpx06ymAG4pQAKNr5EddynLneJvpCJUiQL
 fjoZuQyxkCmBPQqlQceENPUFpDWjbiemJu/w1l28oa4s1YkHn/+PH+Uqk2weW+3yT6b19x+sQpE
 AmMDzGYaFuOnnut7rTXg+JVT2yG6Ep/wsMRqKexQHjC9Hjk0TVmHzOpOWDQRPpr9LiXnSUFjdgM
 wzjETPXJTMWmLA1s3mpRNIWL3o0aiTc9fP4qb1RA=
X-Received: by 2002:a05:690e:1249:b0:671:4fbc:2452 with SMTP id
 956f58d0204a3-6714fbc293amr1834521d50.49.1789479068335; Tue, 15 Sep 2026
 06:31:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260914192323.29250-1-gilles.grimaud@univ-lille.fr>
In-Reply-To: <20260914192323.29250-1-gilles.grimaud@univ-lille.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Sep 2026 14:30:56 +0100
X-Gm-Features: AcwNN1VcHT47mpqUdKbYo6ksjx2UUKFcENSyTE-sQFRSvQFLxj56zCGvaCZldAY
Message-ID: <CAFEAcA90mCJ60BmimEYWAx9YsxGSkWU54pbq6FTOxfQ1GsqSeQ@mail.gmail.com>
Subject: Re: [RFC PATCH v1 0/6] target/arm: improve Armv6-M support
To: Gilles Grimaud <gilles.grimaud@univ-lille.fr>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:41::11;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx2-x11.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Mon, 14 Sept 2026 at 20:23, Gilles Grimaud
<gilles.grimaud@univ-lille.fr> wrote:
>
> This RFC series refines the Armv6-M support in QEMU by correcting NVIC
> limits, modelling the optional Cortex-M0+ privilege extension,
> tightening MPU register access, fixing MPU region size checks, masking
> TEX bits for Armv6-M, and reusing QEMU's existing PMSAv7 implementation
> for the compatible v6-M MPU.

> Gilles Grimaud (6):
>   target/arm: enforce Armv6-M NVIC limits
>   target/arm: model Cortex-M0+ privilege extension
>   target/arm: MPU - limit regs RBAR/RASR A1-A3 to Main Extension
>   target/arm: MPU_RASR: mask TEX bits for Armv6-M
>   target/arm: fix MPU SIZE min for v6-M/v7-M/v7-R
>   target/arm: extend PMSAv7 support to v6-M CPUs

I had some comments on patch 2, but patches 1 and 3-6 are
fine and 3-6 don't depend on patch 2, so I've taken 1, 3-6
into target-arm.next. I plan to do a pullreq later today
so those should appear upstream soon.

thanks
-- PMM

