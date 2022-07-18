Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1230890lfp;
        Mon, 18 Jul 2022 03:52:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1vS4MefaisczCTWphEDYbgCxkuHzVw2+voeM1a+dYCuIGDnCd94E7fdD4thiS1la+ZmMSmR
X-Received: by 2002:a37:9907:0:b0:6ae:f76f:3520 with SMTP id b7-20020a379907000000b006aef76f3520mr17011490qke.497.1658141538423;
        Mon, 18 Jul 2022 03:52:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658141538; cv=none;
        d=google.com; s=arc-20160816;
        b=SzOxO2bAZ2nF8cVms1wCdSJjzCrWq2SpfdW01uGzy3zyHyJkdxCnCIVEg4BL/2APoE
         nZMARz8OuGZivf/x3DCeFDcttj2Z+CPcd7F+4gRTl30xipK3DBj/PBHpZjnnfjwNstB5
         1Yc9Iz2nhKWWISH/DLSjP9MZiSiGijd5mbTFcmbSEopoA08shXsNpRd7RSGqZNm2F+Us
         sRqBRWQA38yQzELupcyUPXjIrGhjRjMK9T6vRxO7EijeS+9G/rPnxq+TvPFs7VFtCR69
         OuMfEf/YYZHrVupMTjAKA5+iueEf8/L+RceFTCP033f4kteVGOQOCTaP5AyHt0kKWulH
         Px0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=bf7YmAQv6UI4aD0b0qH8+GjABNuIOUHS5pzZtBPCiz8=;
        b=PFPPfhbJp1hbO6Kbq+DKCVDWLujpPWVQL4wFqlGIEHuAEIGykW7l5tCCSD0lyLh3jK
         pv2T4bP5O6nCXyLa6vHxN1THLTguVAZDV+AQSWq6kvZYDxthDz/8RDVP1Hvx5cCMTdZF
         9k3e9rGHDqzcdrElOH3BTTk+1fgJHOvDmA4SBdf22lHP/9xpubI5Ua1v/QmQ0ef5oD9+
         mgzg+6Nf3nX9b8ykZLyiRLhM5+SbRe3z6ypjwtfFefCEmvTKGzlGMaZx6TjrAO4n5yH/
         3u6gI9sqXEHirj/WTTBlCZuT66lXp0pUbKOA/4xkfNFZNg6GjkeqrMOP8byNAaeCXzqG
         15nQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qq8DSADG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 1-20020ad45ba1000000b00470620d96cbsi5418147qvq.151.2022.07.18.03.52.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 03:52:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Qq8DSADG;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:49528 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDOML-0004WI-Va
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 06:52:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:57524)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDOH2-0006Hh-K7
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:46:48 -0400
Received: from mail-yw1-x112c.google.com ([2607:f8b0:4864:20::112c]:37749)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDOH1-0003ZC-6p
 for qemu-devel@nongnu.org; Mon, 18 Jul 2022 06:46:48 -0400
Received: by mail-yw1-x112c.google.com with SMTP id
 00721157ae682-31cf1adbf92so102381627b3.4
 for <qemu-devel@nongnu.org>; Mon, 18 Jul 2022 03:46:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=bf7YmAQv6UI4aD0b0qH8+GjABNuIOUHS5pzZtBPCiz8=;
 b=Qq8DSADGhM+3HtY3CnOt2XCTxHMc9QRZINAMKnM7Cu7NAAGIdUWJ2JIeZ38kGLGZem
 8w2tbjAXGcPN6xF40wYZzPmamD73BSfdw6SfTg1V/RPTfEO9hgVkeE+V6ni+anadCqT8
 qADHHXh/OGdxdzFBk1LazNlZne/Wby4UCGkgCBnyDjRTvVhxeTLKMq4zHZF//4IFaOmd
 vmQUjBR3aQMY0WDvy0BIPSksQs2lJLPqMiezMB74Aa5DIWafaY1yCNVpRqtAsuv1Aqo+
 QcBuhOMvJCQWshfTWAvet2PkOb8q8z0ELSvxpqhjXN0mpXDUIJyBF9G5N+HrBLRT5dIi
 AADA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=bf7YmAQv6UI4aD0b0qH8+GjABNuIOUHS5pzZtBPCiz8=;
 b=peDq9TyfsjDoWG4r7V6nvr280kWocxRvd23M4qEX0uYSNjP+fosVwiLvArSayz1o1f
 /lH1fUZm1BGg2afjvIgCHFW2EXDmFGlJwdoata/u73S4354XGG4yCw6pcCprbFDKhs6T
 rCJ3P9fZGeaEhCIonHuL3axm+b4cKalp9VshCxiMO7xSBq60T0rNn8T6PfLEuzYWFbF7
 llY9PB6Fjd+SXWLwSh8QlFUQ+fHJ0XFThpUkXuVNxBp2gUzVFNqG+f5KLgpx5dyVt1YY
 P1zhd/u/QjXmk+wj17RadRpFMOzkrZyPQI/8GyYE4+w7h50BubgXLlYmh1Hd9VUr1oSO
 tr6Q==
X-Gm-Message-State: AJIora8x/e/FhUYQNwjfC9rPoFUvDMfkKoqUJ7+bb1F4MGM4GbPqeF6m
 MZLoTqTkIAGMnlX0l4FkgvK/aa9ItR4v8kjBlA+G9g==
X-Received: by 2002:a81:f8f:0:b0:31c:bd9f:31ce with SMTP id
 137-20020a810f8f000000b0031cbd9f31cemr29025718ywp.347.1658141206197; Mon, 18
 Jul 2022 03:46:46 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-16-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-16-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 11:46:35 +0100
Message-ID: <CAFEAcA-TnvruiP2JL2s7u70TYyJSCuFs_CcEgyK704_-vO_EZg@mail.gmail.com>
Subject: Re: [RISU PATCH v4 15/29] Rearrange reginfo and memblock buffers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112c;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: LXzGkrNJulxU

On Fri, 8 Jul 2022 at 17:06, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> For send_register_info from master_sigill, do not keep a
> reginfo buffer on the stack.  At the moment, this struct
> is quite large for aarch64.
>
> Put the two reginfo buffers into an array, for the benefit
> of future dumping.  For recv_and_compare_register_info,
> index this array with constants, so it's a simple rename.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
