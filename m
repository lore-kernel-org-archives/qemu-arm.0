Received: by 2002:a17:906:fc12:b0:98d:b2f5:1316 with SMTP id ov18csp472071ejb;
        Fri, 28 Jul 2023 06:41:30 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGqWn3wgJRCBXyrTRQP+AgtQ3caY/O4YCQgMEdiCH3TSZj165ZzLdx4OuK/q9JeF8amJZGr
X-Received: by 2002:a05:620a:2886:b0:767:dfcb:7094 with SMTP id j6-20020a05620a288600b00767dfcb7094mr3375261qkp.52.1690551689772;
        Fri, 28 Jul 2023 06:41:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1690551689; cv=none;
        d=google.com; s=arc-20160816;
        b=vvA2XIB6WdPjUI0qYA5Y9CZ5Smn3Cthca4jHwtRmvOB6zkv264MgTL3XHRc6x+/NUL
         tUyikICmMniQVZdADVaYKE3sTrNU2OwlmYFEq+sdXGQgyRSrpZ16Fkf3ZDuh6micIyYn
         M7iMHzmIcYxfp5W/MbeJ5TurQEPajkInCdeigGFlJBJvBRVd9wNN/pXUaJzrqUd9Lbvi
         2Qzm0fUFA6nFEO50YEp0TbG/DrGglMbh938o1Nn5Lu2Y2XWFNzZDvPA+RLZ4RiPrffgv
         BjB8T64L+mt7saJDQ8p4+Pbibx6WFYUepZS1wELbX0OwFHJIVOrjsLeRn5eFIB8c7U/p
         0olg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=GFbN8q9s4W5AgNtxdnnEe5FyvzzlnPyKwbHX0ggSmbA=;
        fh=fQSWUkMuRxigFAyrwqJDZVDXvGgDP9IGeNAJ2g03mw8=;
        b=fFdG8qkxlIfbBGBrVetnzk2Qabt9Faq/m5iFw7Y6mJmu8nQ/Xuxdzm8gd+eBIO9U96
         mo/7u1d57qtRnrh6D+CTQE8fnWllyMF6RTlGQGuno2CHQl5huFvab/q2U/8a/taZAPBf
         xJCzkqkBRrbkYBmwB9trAI+ik/Pl7ymGg857ZgfwdA6Tj3R81qFxyV0wdNkas1HnqDHd
         yMkTjwS9N2uDDV8oGZV9v8msXDbaeNQJTprJvOayXnHzu5g2eFxbCPZ9YvabsDulzIBo
         +J07cKqeKsp+1cGYCg18gj/Mp7VTGZuHupXz+isSFN3BkwDyf/vtZv/VfhzYMpi+16Ks
         OOKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RSNEGJDU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x20-20020a05620a0b5400b00767d452f030si2117431qkg.658.2023.07.28.06.41.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 28 Jul 2023 06:41:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=RSNEGJDU;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qPNLR-0007Ek-Of; Fri, 28 Jul 2023 09:17:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qPNLQ-0007DP-6b
 for qemu-arm@nongnu.org; Fri, 28 Jul 2023 09:17:24 -0400
Received: from mail-ej1-x629.google.com ([2a00:1450:4864:20::629])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qPNLO-0003sb-B4
 for qemu-arm@nongnu.org; Fri, 28 Jul 2023 09:17:23 -0400
Received: by mail-ej1-x629.google.com with SMTP id
 a640c23a62f3a-99bdf08860dso323664066b.0
 for <qemu-arm@nongnu.org>; Fri, 28 Jul 2023 06:17:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690550240; x=1691155040;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=GFbN8q9s4W5AgNtxdnnEe5FyvzzlnPyKwbHX0ggSmbA=;
 b=RSNEGJDUbI2MY085SAOHyDtcupGzld6MMVCEbA8XHBH/XZaskXk/WsnuDN6sEXUymF
 g7X3L3h7RmLx1X2kgAfRW7CWwOwosyv05Y/MZVHjEQaAtb1ej36b59ayLO0tozvuTh6s
 6cZlRtHBO6JAsgZ5MdcVBamN3UtSsnXRdcjtuLnzHsa2U5OtBqA/cMARaZ2BknRahxiB
 9zE1PgjWxU8AHPfDj+PgAXCPa0j3AJsWLdhqlb40YZJAc5D11zk1EWtptY1PU5ljVV3N
 s8i9alcrZN3lWY2vztLQW8GEx5BKShPJHCJwCe38IoZAhviGpl4sFGUN19QH7tc6NWtY
 LcVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690550240; x=1691155040;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=GFbN8q9s4W5AgNtxdnnEe5FyvzzlnPyKwbHX0ggSmbA=;
 b=GcVpEREUEqkrK3qNF5rpyJtX3EuoyIIN404n98Pl8Eqtq0EliisYKvEj0pKeJodiNx
 0DzallPc8guvkjRlpXufTFc6Q1aMVmElY3vYF7nCfgpxhTm5vfY9NzqahCCtpK85GsOu
 K2zdDf+ZjOHfSywdZqexi9g7QHunYu3vIy/awDBh0thy5T4LMkrk9iMhg2R+tgomsB57
 VjjUwXrHW8LlEobx/qqpOIJ9ofiHjQpluhcrCM+i5SUElq0ri3SHNmldmZTKsv3nb8pp
 mPPruehq0wrBPOcMpk4vJ2Whcz4X9RGwdesq+l63GLh4DV0aUELFJbsXoltKqH70IEOB
 QbMg==
X-Gm-Message-State: ABy/qLajATuNKc8XOVJ2lknp80ImRRsOpXKG4VmLbqXBj0jHBTmovLiX
 kUd9ACxMpStAw9v1oO3LOrKFFVkKcdsCIp5Gq03tow==
X-Received: by 2002:a17:907:3e0b:b0:994:fec:e1b7 with SMTP id
 hp11-20020a1709073e0b00b009940fece1b7mr7215592ejc.0.1690550240326; Fri, 28
 Jul 2023 06:17:20 -0700 (PDT)
MIME-Version: 1.0
References: <20230727162621.445400-1-richard.henderson@linaro.org>
In-Reply-To: <20230727162621.445400-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 28 Jul 2023 14:17:09 +0100
Message-ID: <CAFEAcA_oycCzi9ucp6njiZMs9puO_pshY0xDgT3ed6KQZP=bKg@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Do not use gen_mte_checkN in trans_STGP
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::629;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x629.google.com
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
X-TUID: 2FNc5IU9jwFD

On Thu, 27 Jul 2023 at 17:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> STGP writes to tag memory, it does not check it.
> This happened to work because we wrote tag memory first
> so that the check always succeeded.

So this is code cleanup to be more sensible, rather
than a guest visible bug ?

thanks
-- PMM
