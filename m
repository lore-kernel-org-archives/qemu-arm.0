Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp5039605lfg;
        Wed, 12 May 2021 07:07:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzr7ibTTT/4UIrpM79JMXAHAm2Bh2e/eM7A0hptmKV+eeejisjk68JaGkGB07eGaLkeJYpB
X-Received: by 2002:a02:5b85:: with SMTP id g127mr32707644jab.80.1620828453087;
        Wed, 12 May 2021 07:07:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620828453; cv=none;
        d=google.com; s=arc-20160816;
        b=cOQP15DmfFslk1ODlZOVDTuew83JvErDfyT2VGNtCXhjYBkyLBPGfkpnFTtOvMICjd
         s/BDOxj0785OrMSUHxm4RQ4OH0cffKgb9c2txPvd5XPEiy+71uU4woYZI7bJgmrLlCFs
         dzHVcNdK3MYQlPeVBtARNgDAYyyMcSV++kJIZiTxOqGRgLzVDntBsa+eZsLtoFlh7kZ1
         bz4WaRWM0kRVg3e+PATZaamOxzEs0rcnMbwVazDRR5B+PVji1GDudFoA7IqNNbKvM+Tp
         XHVCEcBlLtarYHSUD807lVJ/AenUuLo+APs4Mfivg2v14DoWUraQKrFUao2NZb5/K881
         /LPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=01xqKkUidVTArTF+vs0qLiXiaq3CdrHf18+C/GHJ3Pw=;
        b=x21pjfIghglrPXXxeET1QX8UiD40/S5vIWxrmPIlwWT9Ef2QvhpY/eWKKuPX7Y8P8/
         5Jcl7Saq1Y5claSsNNlpe6JxvvqpbLRdPlULnVb75/QmtYpIrk9iBhrZMh7mxrRMi1qi
         XwWlFBWMcgd8wIMLiHXFisYC44aYl7eA11fDyEezHqQf/o0O9YOSlNDuYq/JMRFGIxto
         xk5e9tRZ/t6z+PKsyYwyrIjzAMt5GnkhDQWKbQ/ndDk3aRrf7Z23eSlIWznRe79pOFtS
         /jli4sEIhwhzNM0z6Sj2rJeEw3YV/cLIkudT0LfqS2OLg6EU52QR41tv0+Pt8zaRSmFF
         a3LQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PcLwh3IY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x2si5894208iom.61.2021.05.12.07.07.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 May 2021 07:07:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=PcLwh3IY;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38066 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lgpWO-0002Mw-C7
	for alex.bennee@linaro.org; Wed, 12 May 2021 10:07:32 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56820)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgpWE-0002LW-Ib
 for qemu-arm@nongnu.org; Wed, 12 May 2021 10:07:22 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532]:44676)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lgpWC-0007MW-F4
 for qemu-arm@nongnu.org; Wed, 12 May 2021 10:07:22 -0400
Received: by mail-ed1-x532.google.com with SMTP id bf4so27232646edb.11
 for <qemu-arm@nongnu.org>; Wed, 12 May 2021 07:07:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=01xqKkUidVTArTF+vs0qLiXiaq3CdrHf18+C/GHJ3Pw=;
 b=PcLwh3IY6+JiUkI+r6xVc8H+wb+Ej5aSEQAgO/awnAU77x2JHIRknqkNoOo8TC3+8o
 6x3Tz5vP1d9cAEEyljdnCoogMEreFR9ldh89xGimA0CY3otOXXWNM8xeFkymaAyWZHXJ
 hyiALhj5tyBRs8bPRBAQaoG/nirnnStQ5hG9qcpJXSUDLYeKF9J3foT/5MLSkFoyvKgI
 AWeFuw4ynA39gMFxGpjOO50JRL4iAfogZKioTJD258Xr6rlWmEr6K1TPjyYa4QqKxqxl
 PvgGzfj2JTMQGcCQXr7gV0w7v8Mw/kgEu5GtDh614tr7Wvmkp1OX8eYD6FNQjvSGOUqQ
 s+bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=01xqKkUidVTArTF+vs0qLiXiaq3CdrHf18+C/GHJ3Pw=;
 b=BABi2uZUapwPqCerJx3F/vDg6E+lW6IoQWRvBgkZG5ZRzSpv05v49O6b/NTVrI3FaQ
 gtdOhL5FC2SOHQZ2e/SxzslHoJx7GFz3dXAiZpk+qmVzNyf3gD1F6gyBzGud0zA0nDjD
 fDnjBVjOoja31naAfAtthopsHT6n5u/Xtf4u/3GF4Tf1LIFiPBHBgYbKG1x/EKGifd0v
 VwFgNNQeCENUL4Wc4dCTSFOYZZNjcUCIRDHsXWXfE8HTX/zl1XPGlbzUuKmb/ZWPKcEi
 HF3GfFfv4PtByKkHXUh1HBZRiTgH4OQ17UhmiLKlm9f4bmj6qUhh82x6sQ434mDH2A+6
 QN/g==
X-Gm-Message-State: AOAM532M1VZCUPE3Ph+nmTNDMpW8r4BfHw2nu/r7e3Pr780AWJVhiJwP
 EvzXS0QpPvFXw+fZ60+iqCoOK2ooUv6KZG1Jo/r0Yg==
X-Received: by 2002:aa7:cb0a:: with SMTP id s10mr43186646edt.36.1620828437527; 
 Wed, 12 May 2021 07:07:17 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-32-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-32-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 May 2021 15:06:03 +0100
Message-ID: <CAFEAcA96aPjfHG_qD5dVQTOqxBz6aNEi4=EmSB4OuicqMZupSg@mail.gmail.com>
Subject: Re: [PATCH v6 31/82] target/arm: Implement SVE2 WHILERW, WHILEWR
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-arm@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-arm.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 429QmaAOW1CJ

On Fri, 30 Apr 2021 at 21:52, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
> v2: Fix decodetree typo
> v3: Fix iteration counts (zhiwei).
> v4: Update for PREDDESC.

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
