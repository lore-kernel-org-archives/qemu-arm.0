Received: by 2002:a8a:1930:0:0:0:0:0 with SMTP id be48csp519708ocb;
        Thu, 6 Oct 2022 07:29:12 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4LHuEBra8ef4g5m967Z2SxeAHxdQLAb1ODnq7j8JMtupAEDCzWfiDZ2hsebZ7RgVaHKfwr
X-Received: by 2002:ac8:5bc5:0:b0:35d:129b:5104 with SMTP id b5-20020ac85bc5000000b0035d129b5104mr231806qtb.237.1665066551903;
        Thu, 06 Oct 2022 07:29:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1665066551; cv=none;
        d=google.com; s=arc-20160816;
        b=ntCNXYBamyL8/DvjwJRGGYlg+KtX4e3K2AksFC9t22KB2nFPK3RF2QRKp+qF3x5zBC
         GOhCTnOhB6G4Z4KShFontCTLDA39YF6Gs7kwsYp0iQ+KyX7ff2yxpDQ023VKTMb4EJDX
         6n5r8gElctmmw85jpCFhbEXWLP+PnZWn/5hH3nyLg/F6nbOr/x3ENx4qk572jbQ7aM77
         2iSfoa1aQcV4EClUqa+kqmwe96YnoMmtfTrS8ZO2MVdIEpgp53icytsjv4WnY7szrfFz
         Fq6/vGP4KPUbxgfxSW5P/dfi+k4hXoo+u2ynG+LBvWVb1NpPoT+mvjQQmvMdBMfvLxqn
         WGvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=xD0NcjiitZycIyQjAKCk7fuemaQrVt4YXEvWt0vMYz8=;
        b=zN4n8UI4LY+nwcStxLnfbot6BZhsZ5mkySWpa1i3Da6cxuFssd4RANVKT52nMyM+VM
         DUhLoNsqmdU5cr47L+HnYYNa4mf7IzhzXKvzNdk9w3CXAw4N7jrA0A178+EOUZLKSzSN
         wLCenUPhJrgzxkVhsO9bisx9Xxi4nvW6n+fjzl0uZcDEYmAFxzcBavpXwv3XTlRpDB0K
         452ND7JKVnyDOL2Q80L4O1nrDKuv0tfwtInCb1sRav4t7uBirUlYMUSFjE9soRY0VAC0
         Ik+6LdI6oYVooTxU1F1fg8oiPfe68H6Gma5nApUfdOFDVKjazKKmMTOE2h+lOIC+5NNX
         kbMg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nJjTmkqX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id q11-20020a05622a030b00b0035cf798ddb9si8400021qtw.235.2022.10.06.07.29.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Oct 2022 07:29:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nJjTmkqX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:40818 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ogRs7-0004eq-Dm
	for alex.bennee@linaro.org; Thu, 06 Oct 2022 10:29:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48686)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogRrj-0004d8-Do
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 10:28:47 -0400
Received: from mail-pf1-x433.google.com ([2607:f8b0:4864:20::433]:34545)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ogRrh-0006N1-U2
 for qemu-arm@nongnu.org; Thu, 06 Oct 2022 10:28:47 -0400
Received: by mail-pf1-x433.google.com with SMTP id f140so2229294pfa.1
 for <qemu-arm@nongnu.org>; Thu, 06 Oct 2022 07:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=xD0NcjiitZycIyQjAKCk7fuemaQrVt4YXEvWt0vMYz8=;
 b=nJjTmkqXhhBtqn6TfI9nwqtVY3NRlY5lGQjjstIQ6A25lgUICqQI+KGl0RZXwFFR6g
 TjzOXxlSvHIvgnmLUit3psnJSsyjaWwpkE7/gvioqmB2JGt+Vno0Km7C2C6qCX5Ve1Mx
 Ory4y3neZJGmaaYRO5CAYISJku/IN6P0p6HyKbfcS5yHQzB0Ctpgo7OyO9o4Fp8BpdP+
 +DaGg8CojxZtftoTlR8syr53lddbgFrPpNF4gV0B3/sRLRKlpUNDnzp5fLAQCo2ePjYw
 vJdr0ASbxH3vNggMYFYhbiDR33zq74E5YE4DaHkPqq9drciLDCGlNAuhrIguWO9zm6FF
 TCRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xD0NcjiitZycIyQjAKCk7fuemaQrVt4YXEvWt0vMYz8=;
 b=m8IARweq1yrDmc+6Ket9BK/LMLgd8yo3pwBnFZkAerN4u10rwmahrV6rOmUmDsj4Gu
 RJHr0cWj73uFHja/VHiCKEpUuUyiz2VPULZhU8rJMmX2u4wPQ/lTNkiT3/8M4gXRPRwt
 wCs2EniSohsFwPl//3bFn734zWd3piUSmSAH1f4LXKZYs0+eBFTUW0wI5PqNZa2PlvUj
 2XgcXMCfSpz1pOWM40dln+xkKht1u/1wsY/cZjiDq68cWZmKnn7Kz+4rlJGCNdqd1P9Q
 /vrvpMSQARHtTkFUUiaRDahfjbgCNU6NkeNsHSMf2TyFkY2nBZHe+TMdg2BjN9ORGUjz
 pa9A==
X-Gm-Message-State: ACrzQf0mcZ5m0RK5Pdt+3Zd/llEVZ/lHmiXsScEWvCPk9zQ5deVdEE3O
 PGogH2BNzVLIbCpF+mcztwgTVOlwWseZptFFMHlgaEsBJmw=
X-Received: by 2002:a05:6a00:b4d:b0:561:b974:94b9 with SMTP id
 p13-20020a056a000b4d00b00561b97494b9mr34491pfo.26.1665066524615; Thu, 06 Oct
 2022 07:28:44 -0700 (PDT)
MIME-Version: 1.0
References: <20221001162318.153420-1-richard.henderson@linaro.org>
 <20221001162318.153420-4-richard.henderson@linaro.org>
In-Reply-To: <20221001162318.153420-4-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Oct 2022 15:28:32 +0100
Message-ID: <CAFEAcA-onDRHW73mr=f1u28aff-037SXoo58nHn11TLb9Rw+Pg@mail.gmail.com>
Subject: Re: [PATCH v3 03/42] target/arm: Fix S2 disabled check in
 S1_ptw_translate
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::433;
 envelope-from=peter.maydell@linaro.org; helo=mail-pf1-x433.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: tMiAovVFLQen

On Sat, 1 Oct 2022 at 17:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Pass the correct stage2 mmu_idx to regime_translation_disabled,
> which we computed afterward.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v3: Move earlier in the patch set.
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
