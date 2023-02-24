Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp1762558ejc;
        Fri, 24 Feb 2023 05:15:11 -0800 (PST)
X-Google-Smtp-Source: AK7set/l0El1xz7oiJpF3tO3DHlsdcHAwVx5Vc9iOccL720/Pj6kDEY5Ic/KW/nsdRRtUyKPtXWe
X-Received: by 2002:a05:6214:d4d:b0:56b:f4e2:cb21 with SMTP id 13-20020a0562140d4d00b0056bf4e2cb21mr28881732qvr.19.1677244511755;
        Fri, 24 Feb 2023 05:15:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677244511; cv=none;
        d=google.com; s=arc-20160816;
        b=dGn85bchFNbxf2SbWDfkdgEJ7czOa9sRAxVtbPKV+L9d/py1Af4UvKgKvrbk7cS5YK
         6R8Rhya7H4RSZf5F3SwJ1ZjdPvVS+yLTkpTX5zi+rKu0k/2Z7DpR0oEjU8V1rCcXKCE6
         xcnbiu19irSPi/2q7eNqmJUPiU9xibs0ugOFZ0d501Gd28Bg4ixVB9dLgM4mnsQT1KMI
         RBSd8obsoV9cIPvP1NTz5kjFzL8Hv9nkRUHMSCDhZqvBBjkocN6kZ8t9Su/gdilFAAcC
         ne9fIhH4XNY4WT6P53Y/F5OkbrxJZfUCECEGtnKS+LkjGSsEck79x5qlqiMnKkiXaVWb
         hebA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=nTskzxdbRXMuApPPtFPWVNUXvgpe96eOCwx8YeHMGfM=;
        b=Mzlz579LaGHd3iTKKG0A2T8RdmDPKbdMd9MfvqKdnrcDqn3jez5nSGJdBd76pBu3PU
         OjNbHqN2XtgmmxrSwbpGBUsxP5WYFVaP+oUTSd0mdPqZOUKxiHKzwSHmDqAbbSMIdrtv
         1ifquSwGGCNsSrPeXMl5Eil7CrX5wCQFRXmgQW+eghcfmYd7mZjG+X9kla7ChtHErJI1
         0pAceTrBhQHnvVKXTxqkxaYcWJJ3XdXBn2yskcD8QvsQF61vXsBDCdPZri+Wx2BrTH82
         arl+V/tfaTfJmTigUkbOOXDfxvYCxoJwD8ivAhTL0m1cTtY7HkJnuFCYJC/1Qba/LAds
         OIOg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YgGwCry8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id l3-20020a0cac03000000b0056f0577c36esi2628021qvb.574.2023.02.24.05.15.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 24 Feb 2023 05:15:11 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=YgGwCry8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pVXuj-0006Fn-WA; Fri, 24 Feb 2023 08:15:06 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVXug-0006FJ-Ps
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 08:15:02 -0500
Received: from mail-pf1-x42d.google.com ([2607:f8b0:4864:20::42d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVXuf-0001v9-7b
 for qemu-arm@nongnu.org; Fri, 24 Feb 2023 08:15:02 -0500
Received: by mail-pf1-x42d.google.com with SMTP id cb13so7826599pfb.5
 for <qemu-arm@nongnu.org>; Fri, 24 Feb 2023 05:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=nTskzxdbRXMuApPPtFPWVNUXvgpe96eOCwx8YeHMGfM=;
 b=YgGwCry8I2RVfoUYtKCauBWNf+/qLmpxi1D8a/dkc9lmlXkFrS9ytoDm6CRJN4gLP4
 o2zYe3nrf+JsM5m5cbcuSA8t5WnSa9pbSBPUKJwBSg7cXf35IW0lsr5ENRMYiaqR30qM
 2HPss1Kt8IedQejLMDy44sekE/Sfr3EioyV5yepLANu33Qj96tvYHxyL9+8JXMF2xjv3
 povRqmV8A0zaRN6vP/l6Kz7ykXmBnNTjY06t5nOrWJGoBSuSW/huwMcWAb3Lf75sFUGD
 7ejrqJ+ZXmCuG5pQUfGPEDgJse4bNyGTztzN8xZq041ifAQb5od1rZ77J9GT/ykxTc6d
 5hDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nTskzxdbRXMuApPPtFPWVNUXvgpe96eOCwx8YeHMGfM=;
 b=xyK3uND3yebNAMMJPkHRSASjqzXZkG9AWRgwaVFYjyJhRsq3tcm7D1kAYYJgOpRroi
 +bbD6ZIyND8bjCjY48GkvZUO8cyJLmP2q1fxBIb+CWfZ4HVUgGE+MkfbWCAW1Mmz+bKF
 9XWjAnUvEwx1xCIeRR4zuSjWiKd9G0yDmtCt9gBRaqUQP60FHKvYChR6pmfUgibnTv8B
 VgQA6yNvAkp+T5RRpQAzPmPr1O5oPtmiqaHmkSgFC/PHJEFVoMmGGFLYGo8OjFwsoPcO
 qGLcdEpB7n6K2b3O+bMc4pJZv7C9Wa3K8M9f7wS6N3OLb0xolSS7EGxS5XmhEPPLc+b6
 khEA==
X-Gm-Message-State: AO0yUKWaZWQgoaFx3srkdJxX/fQ6wst6L1+LIYb3ENDEnAAzzVC3yeLM
 ZWR0zQ/7NTPI5vSsUoJ6KXJld0VrBN/cMj1yaAQIyA==
X-Received: by 2002:aa7:8a0e:0:b0:592:41a:1054 with SMTP id
 m14-20020aa78a0e000000b00592041a1054mr3126292pfa.5.1677244499180; Fri, 24 Feb
 2023 05:14:59 -0800 (PST)
MIME-Version: 1.0
References: <20230222023336.915045-1-richard.henderson@linaro.org>
 <20230222023336.915045-2-richard.henderson@linaro.org>
In-Reply-To: <20230222023336.915045-2-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 24 Feb 2023 13:14:48 +0000
Message-ID: <CAFEAcA_fMoJ_yrNZG9juARQLhujJWha5tTOkTWFgsApM3MCAFA@mail.gmail.com>
Subject: Re: [PATCH v3 01/25] target/arm: Handle m-profile in arm_is_secure
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::42d;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x42d.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: dSslvq5cyFxI

On Wed, 22 Feb 2023 at 02:34, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h | 3 +++
>  1 file changed, 3 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
