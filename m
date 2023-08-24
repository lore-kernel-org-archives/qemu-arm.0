Received: by 2002:a17:907:76f8:b0:9a1:fa4e:495e with SMTP id kg24csp799528ejc;
        Thu, 24 Aug 2023 08:55:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGstBA9Fybo2MdiBRVKpKbXWC/j5oCwx0eOtQ+5ydrlTPLlbuqAdl8vQRMPvST3kX/GO6ku
X-Received: by 2002:a05:622a:60b:b0:410:9d4d:5307 with SMTP id z11-20020a05622a060b00b004109d4d5307mr13608501qta.53.1692892520484;
        Thu, 24 Aug 2023 08:55:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1692892520; cv=none;
        d=google.com; s=arc-20160816;
        b=elBUqvDjseQBYAqLKn+ok/JAuKhP/MCkIdPa4oSH31yLEZ8VhEA68nJwAoq4bAeHF0
         VR32CWFqrIAX5Vpug4zoylDGNr4ceLOjcYWQ9MCqIft2nAxAvj+FpAqsJgiYcVa6uUk/
         HchfBrtu5flYdCx2GW9ueRLnjkzVE1og+7UPOCbrVXzvCC9+YRP617farXFntMei8Iev
         fjKSs54e7OSc0qs8KQm83iWg+Xt9BhFL9PxRW4nNC2eZny84cvoSXwXDgu/A1NKrr8H0
         rgflUK8u9NU9VSUPX1ZU+nwHFHCUtMp+Pu5Pac48IwCcxi4kSUCAwTTDrS2L9YSgP9oM
         1T6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xM76Dis0vR8jkC3H92UUsvM5/0nATYMHEYN5C/Cl5zE=;
        fh=fQSWUkMuRxigFAyrwqJDZVDXvGgDP9IGeNAJ2g03mw8=;
        b=lHP3McOy6M0ongUVay6nlOqrPgu+foGOqnFOkVKVq0xQtSHT8qLJsrq6ddQBOmm46V
         mDuqlK4wyyIldMBXCB8d5ZXMHRyIAwa90FnhSmFARb8yweo2AgukaoSPd4+DUh3JV6US
         k0CVy0na2HY82cQK4vEdOOQ89oIUNriWTZqzdhC+gB3/IbEsuDMIb2nGvPh0/0NFoZKJ
         a2FmyKOA7h3dCrHlV2P56zHsXOvabSgeNeqAf2b/ONEXwKhDb4xW6x6QhT25SNyyLiUB
         hKmY8nCM5hmY0D8Iwda1BzV6sFgk7v1M2kpymskP7HFE75c2b45MdX5lVUr8hfM09cas
         Lu1g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ujJRQLVt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y10-20020ac85f4a000000b0040359cb66bdsi8426132qta.473.2023.08.24.08.55.20
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 Aug 2023 08:55:20 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ujJRQLVt;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qZCfy-0003xD-NK; Thu, 24 Aug 2023 11:55:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qZCfp-0003do-Qa
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 11:55:07 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qZCfn-0008CG-B0
 for qemu-arm@nongnu.org; Thu, 24 Aug 2023 11:55:05 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-51e2a6a3768so92483a12.0
 for <qemu-arm@nongnu.org>; Thu, 24 Aug 2023 08:55:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692892501; x=1693497301;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xM76Dis0vR8jkC3H92UUsvM5/0nATYMHEYN5C/Cl5zE=;
 b=ujJRQLVt+JqWpRnacXiFIi1DJWWW1kwygTMIL+PCBhqWqMAfxFGSdrO7AUNd/GX5Xd
 PUyi/dqudrA2AenfyMruThTr3l41r/PyQRI4VwdNTDw5BBxKW/YZ3dpaxf2cIn+uWPHE
 QDj/yh1EhxTR6g3EgA31tbHWocPYe75bq/UKuty56BDKPhVQoG1nzGXLcnXdct91aaba
 oUlr2AzmxDStwiMrvqMxPMf+iQoyMOO1yvC6jn7Y9iaHVLC3cTdZ5g0F7DiogCzit7Ka
 xPGup2X2hcfCCl69AkWDwkyjpIAJdEnMPVygoJxawY7nHVTYdARmJEmIJE0q2UkB7Wah
 exgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692892501; x=1693497301;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xM76Dis0vR8jkC3H92UUsvM5/0nATYMHEYN5C/Cl5zE=;
 b=XzNek6WgE+x+uqQFNjKc/gaOa2R/mjq9imK+ke5TqRTvmrpJuzIXncKFE9UJfw7F11
 /gSUpExgRaVhDRDQ5r8Sa6qAa9A1hxwJTD7b0W8oautSjQTickPhoJsEr5/SEJDVRo+Z
 G+/0raIgSqjB6HpgK7v4C1NDuzSQJFdsIJJtaJR0JtwShhsX8n8b878LBazUbDPp11jR
 pRZCB29Y1fXy4p5kS+HSGOgB3T8N2NaaXDj/1/0Q6sPxX16oKMxi74QmcxlubHXKdmnj
 35uHDHzYeJskGs6oIb0AmW91FyCBlc+IZFjuBHr2DEUmwX+b+owv1Hyd5r1aZg591fhE
 sd9g==
X-Gm-Message-State: AOJu0YwQSL/0t0oQayNNqb6Ms44j+yOJ+eN6a7FM/TQYpbFAMrkQZGCR
 NVnmm0OEpW0/ip8uLYbj+MvC6q0C0G7lTUusOQ7unbcfl3lE5OoI
X-Received: by 2002:a05:6402:31ee:b0:523:4acb:7f41 with SMTP id
 dy14-20020a05640231ee00b005234acb7f41mr11765904edb.14.1692892501413; Thu, 24
 Aug 2023 08:55:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230811214031.171020-1-richard.henderson@linaro.org>
 <20230811214031.171020-8-richard.henderson@linaro.org>
In-Reply-To: <20230811214031.171020-8-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 24 Aug 2023 16:54:50 +0100
Message-ID: <CAFEAcA-cuHX1bzW+nD+NrxX42z-exNtM8Ge3SO3LDKsAWR2sFQ@mail.gmail.com>
Subject: Re: [PATCH v2 07/11] target/arm: Apply access checks to neoverse-v1
 special registers
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
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
X-TUID: ffUnFou1adId

On Fri, 11 Aug 2023 at 22:42, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> There is only one additional EL1 register modeled, which
> also needs to use access_actlr_w.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
