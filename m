Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34EDE606A31D
	for <qemu-arm@archiver.kernel.org>; Fri, 30 Oct 2026 14:42:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=ppIBHENw
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xMno1-0004yv-V0; Fri, 30 Oct 2026 10:42:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMnnz-0004yb-5o
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 10:42:07 -0400
Received: from mail-yw1-x1132.google.com ([2607:f8b0:4864:20::1132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xMnnt-0005BF-GH
 for qemu-arm@nongnu.org; Fri, 30 Oct 2026 10:42:06 -0400
Received: by mail-yw1-x1132.google.com with SMTP id
 00721157ae682-8b0f59a5fdeso6854647b3.1
 for <qemu-arm@nongnu.org>; Fri, 30 Oct 2026 07:42:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793371320; cv=none;
 d=google.com; s=arc-20260327;
 b=Qg8Uwtj3f21TA8PGDuAkZ59vMYs7+eCO8gfx3W5mfjS9+XQt+lHmgSbj2BbIcur5HI
 OHfklQZPWKFDKvqvRLn1GBayX27RTMAo7Uj38SrIsjgajkZOsIYr17ia1l+9Sv8TXs7y
 4yFwekgLUhvk3ArCwnmJ5iL2m9jVJg+PwC7UAmP3pZro9AXn/SFfRQ5g3peAuTK5PBiQ
 5pRXwkcscgw7O360B7auxnKrOCgw2AC3RCdr7E1J5kS7wMBBSjyznyezAsifYsmKqtRM
 R6LdVHJZVGjAEEVnegOxqYDhmTO4m90mwIv7dFOe6zplJSxQQCh8F6pU7aHx5l14pRXp
 F51g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=gapw+KcNZWU+ikQlgPzLdw+ct1Lqqn2Tg9Otb2s+/eI=;
 fh=CzhQnQNyzR2QCuxnCmw8aI39BtHw9r4FcXD4hJWstDI=;
 b=VT4r1SuHGcWhv7RVspKmJbstAGOXJUmg8yWTbPoOMRQs++Zr62arNzxKcK5gUgrTdC
 QdreoGIjod0PV07rkjngWNaFQ//n2uJRJ1Cn03heXj7PjUID457c9uke5pxczKQTdIIU
 oE/b1oQ4yinsOtdLvXRCCDsiPFQ0NcJ/WOJrWdzSskkrY3a1Bdidoe8HlO7oS0zMvKF/
 BB8l61PHy5b1gzWDMu7FS6sbCzm7ubA54kxSJfgsETI++chEt4X2tcD4SnhvZpU1sdaN
 PEsc6mScP5ulzxC7Dzd0Z+y558a6ysJ0cCHenpU0gMQgRO7+K3MRCXOER84jxPLB38Fq
 owPw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1793371320; x=1793976120; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=gapw+KcNZWU+ikQlgPzLdw+ct1Lqqn2Tg9Otb2s+/eI=;
 b=ppIBHENwcVh9kILs5pSiLj62oQOzAKJ1AaD7F9X8weTB90uo9W5lGny6h6bimGnKGx
 H22L9iajm68XxJjXWNDgEt9+7SYq4LOdzKqNHdWsNy0x157Il8/DTDfZdMpitMIJo5Qu
 Nuj22yqKuLSd4D7XsG9OMr9WNlDdZBKCoSTLgZzo5o6ldyxngvIGuXBfRQANW4DLsqy0
 lJ/YgXz9CozVLAm17jAi/T2m15SttCVV7Mv/0rozFnN8gnTiX3oIrFnSs3H1PwPBJJyO
 O+k0C22Nq8cD7cIpRMGSAr/mqKKNbHrMZCttCBcv0DYxDEt9mQza1l+bLvIBk3C1bGWH
 +fwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1793371320; x=1793976120;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=gapw+KcNZWU+ikQlgPzLdw+ct1Lqqn2Tg9Otb2s+/eI=;
 b=ugPD+8JcKFj4RvIPiIS6r+s/nZIZtDlu3Dg9fDi/pNtiZhb1VO8+htV/Pugj/2qLCd
 qFfHKQstbCRhRR0sQ76/n2Y9NigegbbxIdOH3VFu2y2ppQGePmSPh7xdrM9Ou7f8fJF+
 TnRqJsSChUlCfZUtnx+b5c8F1F97S3cyZnO61DjExH0Z6RS+h+KKhM6qdwXCgWNgBJpH
 MKeE0pX8bMX3yrDESziq76n0WlNXfdxNzjWxRJamk6owvFzP7Qfd6ZpPOfDFegNqwOMG
 R7lptZZ357gsb/H2CggkwU3VOvP4t6U3rG1Y4kuqjQG1JjLpiRRdL2JStBJ7zB1kYA2/
 AXQQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBw+4a0gKq1JUxF3WEEyWOYMZEUexkutwYgnJXqwJ6Gqbm9aX2KIl90+PT+uLH7KKEcv714/NozrHQ==@nongnu.org
X-Gm-Message-State: AFq9FYJ3+V2lFwd0rhRiixa0z6pHelSNj+ClhAQdOcVHE7hT2nSxxJD7
 nOP2K9l9sFW8/9Ldm3RCeYkALjoCqd3h0YM3VE3a+UqDLhSjR8t0bxZ4VYJyiYrwyHtlK/vc3ql
 i6ci3Ya4CAM01m2U25V70QYCaaoF5QY5OeHtMghQJ1w==
X-Gm-Gg: AYBFou37U6Ouoh/RAPlkGDy3ejAhnzgj+w94hqwWJTBdZjVyf6jKPshu4Y2bpkepYTG
 FbZZW3bDaLl/Pp9xOARiIuXXlxkoLvlCYeWjIrT1p89T2JA3IuoTsC5qSroHT9UXyG+0pqCG/8V
 LzAtZWZsMI/C9zQ4HcFGk+o0pAU8tkgsxcQ9Ex0jBV+EncX4ZUMAjPR7AvpBOakTCCmn5YFx/s3
 ilA2nmYrmn6RnPOlbEQT050lTtKOOZV3wHI90dQb3I5qHk5gjXXCCkmSNhRpaJxz5K1H7bTtHYr
 vezY3wOQ/K8r1YraNQCcmzfNA9qM+qWRrDWIRCys4XPtCopl8YvOJExU01eH2OcuWCzpUBT7pHF
 wVBGucX4ooQEPoey6uTSbxgARAdaxtVwJkuPqWjHjmwf5VCpRuy6OQzjW8i1nAConadb8VOzq+F
 3sNnXjjUbv7GcnR375F4kV
X-Received: by 2002:a05:690c:660e:b0:8b0:ad5b:d487 with SMTP id
 00721157ae682-8b2b6594f19mr17597007b3.2.1793371319634; Fri, 30 Oct 2026
 07:41:59 -0700 (PDT)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
References: <20261030141046.2710206-1-alex.bennee@linaro.org>
 <20261030141046.2710206-4-alex.bennee@linaro.org>
In-Reply-To: <20261030141046.2710206-4-alex.bennee@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 30 Oct 2026 14:41:47 +0000
X-Gm-Features: AclHuK-EWDk5Qyojad4VZyhSRBazgVRsio9eRAAor9pxoAeC5bbyTe53sI-_unI
Message-ID: <CAFEAcA_vh2WhO8wAX8=6cmZx0Fe2UQYJBoRjaJb1YVAG-Lm8Jw@mail.gmail.com>
Subject: Re: [PATCH 3/4] target/arm: simplify wfxt_timer_cb to only trigger
 cpu_interrupt
To: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Richard Henderson <richard.henderson@linaro.org>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_PASS,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Fri, 30 Oct 2026 at 14:10, Alex Benn=C3=A9e <alex.bennee@linaro.org> wro=
te:
>
> HALT_WFE will always be cleared when leaving halt via
> arm_cpu_leaving_halt so we don't need to worry about atomic games in
> the asynchronous timer callback. Furthermore, a WFET timeout or
> event-stream expiration is not an event that sets the event register;

No, this is still not true. WFET timeouts don't set the
event register, but event-stream expiration does.

-- PMM

