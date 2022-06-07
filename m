Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1933424lfb;
        Tue, 7 Jun 2022 01:52:27 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwvNX/MUj/o7XzcACTnsZf0JPcLm1iTNdM5Ui6diqj6GnEfd82UWrYml637Of2NIhtHnQ6G
X-Received: by 2002:a05:622a:1349:b0:2fc:d2c3:98e6 with SMTP id w9-20020a05622a134900b002fcd2c398e6mr21266412qtk.421.1654591947613;
        Tue, 07 Jun 2022 01:52:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654591947; cv=none;
        d=google.com; s=arc-20160816;
        b=Mzo8otYq/C4Lr7ws+bPtREE+99TvFwKNU2DRkPzBMOHd9potT1aTzBJtZsunUq8qDO
         wFdgWJ/5LAsdI9avRSlzrqP9joSSDrcVV4+IOOt9Zr4khO+joNxR71PTVpFwFmW8hG8Y
         M99ANnjfq1UQJyl88gau35vDThYQiLADb125cisY2/GYdGqLd7h/QEP9jC2jUiTFIe4p
         QMkqx4GHbffFy/hX4d4gz2c2C5ZryOEjEzOTFARHtGVMwedI7gG5J13BRJNyOJ/PJ47E
         uYGQoHHNW1EofXMYab4fN1/XPcBiUlKT4VpQ6n9zS3JxTMpmnzUbD7LduEtqh+RUD6eK
         yr6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=/DbeVl4nC5VRE2nOshMbHkeFj02vSvPL4ibgVAjbCtM=;
        b=NccsYhmnTZxYt8J4qoy+tDcAvbefvn29wVwpRjH0FSGxEE9/Ca55FE8qvj0g+hXBaS
         U1elBXBXVFqEYeiSnCpc21BQhtVw3l5LgDdfLhD61HlxfCQkL/2nWt04B8XeMiVuRVeQ
         yDtFxcjuMgHPQqjfuXE3fJq6nwJO1lxQiNRhNPPdSi5FP0z6OEo7EHCtQlZJSu1f6zg2
         O8QjxjEYbBlwKynfGxcXR5ud54JU2CyM1SqjHcrGMVxfsjwMVe3l1IM+R6bcWSz1A+PQ
         CzPrxnkhJeUQZJwKHHUV/Oly0ydVkyCOdSFao+wueVVBgxUGVuUb2TjG1FSnh/xejWCS
         cMvg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ljx+mHu2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id e24-20020a37ac18000000b006a6ba9251d4si2606985qkm.678.2022.06.07.01.52.27
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 07 Jun 2022 01:52:27 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ljx+mHu2;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42636 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nyUwt-0008DF-3K
	for alex.bennee@linaro.org; Tue, 07 Jun 2022 04:52:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52782)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyUtf-0005Ri-Ql
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 04:49:08 -0400
Received: from mail-yb1-xb29.google.com ([2607:f8b0:4864:20::b29]:42966)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nyUta-0003Nu-Ov
 for qemu-arm@nongnu.org; Tue, 07 Jun 2022 04:49:07 -0400
Received: by mail-yb1-xb29.google.com with SMTP id i39so1971971ybj.9
 for <qemu-arm@nongnu.org>; Tue, 07 Jun 2022 01:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=/DbeVl4nC5VRE2nOshMbHkeFj02vSvPL4ibgVAjbCtM=;
 b=Ljx+mHu2iny6v5P3aJEQVYMBXVn7PG9C4qP8aTtcnNA4R8JZJwZ1HMhqBJHo2iJ2cy
 PvvHB3ocnDQ3IQYPZVjYrZXJ6Vtio8eO7dMaA7oINp/ixj5vftPRdRfF0Dq2beEteUxD
 x9vHK8JJMqrtLQlyWaOYirY0sOcm8dOSDIUBpz7VnR3xZKk1rbrOsFo8O0TTnRPSXAZT
 nWBSSgei2vJB0O7TDtR7ACG5L/t3sNEmJguwYGMZkJEk2Oc5VxYWg/gXmBrBLl3a8XPS
 pjYuV8yZ/vF/v/+hAQ4tosuhhPXG2Pi+3ukSPAqG9sWDSExN+ODHFWAJ6yV6IdF9i/a+
 3Awg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/DbeVl4nC5VRE2nOshMbHkeFj02vSvPL4ibgVAjbCtM=;
 b=2Gttm8d/0j+zametpolg7rPPpxarDGFq5UeBV++Vt3CobKIabR2fEvsI3I1h+StVkD
 WBf6kih3HeJ3yhx7FHlFBzqAm/5OBSEg2ltCkEogZSTYpOO1s9Ooe19bDGJJ+/aa5+yp
 gyAGKL0fg87ss/zhZHkTyh69SvLhOrQ3smxx8vjhC/SMMjlmhrRDrZGqzvh1BalbP1Tn
 JJVu72mNQwsI2R8ihVUi2C7hkLYakmvcfuMC0uH06b8118WCLFdOYXIMy9mVexSJRJrq
 8naAkzgFnH4LD7JnzZ1czm/cOgLQIxuhf9tV+PnnBJob+yWDr5tc0o878E/ErYZDrxRS
 0xpQ==
X-Gm-Message-State: AOAM532qe5d9tJBRgU5FTOTytGQGiP7c6/NSx6t+h67EsMmKo3gR1Ub3
 s75UHay8kHJjIAJeCkhr8s4FSHhIZ2rTIsixJ2rDWQ==
X-Received: by 2002:a25:b94:0:b0:663:e6e7:c5 with SMTP id
 142-20020a250b94000000b00663e6e700c5mr697163ybl.85.1654591741699; 
 Tue, 07 Jun 2022 01:49:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220602214853.496211-1-richard.henderson@linaro.org>
 <20220602214853.496211-34-richard.henderson@linaro.org>
In-Reply-To: <20220602214853.496211-34-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 7 Jun 2022 09:48:51 +0100
Message-ID: <CAFEAcA8j7sPr9J0N_R2BVTuYwfD5Q0tJtSSDKw5udPhtriA9yQ@mail.gmail.com>
Subject: Re: [PATCH 33/71] target/arm: Generalize cpu_arm_{get,set}_vq
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b29;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb29.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: Kx43xlK52XnC

On Thu, 2 Jun 2022 at 23:29, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Rename from cpu_arm_{get,set}_sve_vq, and take the
> ARMVQMap as the opaque parameter.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
