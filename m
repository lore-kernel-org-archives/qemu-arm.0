Received: by 2002:ac2:596f:0:0:0:0:0 with SMTP id h15csp1250812lfp;
        Mon, 18 Jul 2022 04:39:18 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1uO43iGLqlcn/KW1uxHfZ6QO2SU3eiMKGiTxq0NKX4JxcP6rr6/LmMj33BgqObwW+q60LOU
X-Received: by 2002:ac8:5a0e:0:b0:31d:3055:b6d6 with SMTP id n14-20020ac85a0e000000b0031d3055b6d6mr20526367qta.205.1658144357873;
        Mon, 18 Jul 2022 04:39:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658144357; cv=none;
        d=google.com; s=arc-20160816;
        b=tNg7fHQQp/4eYfD2NAJFaL2jR5s3gCpmUYvD0pCnEWEAk8ro4vALPh6W5xDsqB/iBH
         n5ThNguniD2yeUUKaPLgQaXVAbRsltwaQNV1WamlpNQOK43GLH23MS9aQoRqu0+rfpWG
         QEvRx/OF5i2drFSdxGYpDrXPpQ8OYmHSmGTkFdS95PjNi3jiQptw3++6lTiMTgds9+3/
         4Eiuw6RK1ySmzNDvdtobSb9c+gNUQX99jUEM2mij/l4Aa97ctP7AcRMXxY1Xngdpnnm+
         FtxqY5nPXk4+IbXkK5KTuYGL0q+fg2TBx2ljaNpD2ISTFbQ8OfHTRsqQdaL/bsi5Qtn3
         5GjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=3RB0D8Gy1sjal1YEu+U9y7W1b0qKui6+rYeQwb/RYkI=;
        b=z4Wk9Z3EYhi1sULQXDG7bGX1Y+6qKudpdHC732illVkYIOVdta6fkO0m+d1NN7rSKD
         XOaF8gBcL1D8tBRjMTh9GWaCI/2C6TLwnmrFQC8IJ9lHZLKWvIxITFaBaTvSwaSeRA9b
         X4Kb7Svm0765kld0PqSRk868cvgVmkYIMCoTr29OQMW2FdN9dNQQN0bFoieORrPhPAuu
         3g0HM3kTb4GSrhBvYuLagGP5RfsJhi6E1aWkikFI94m3WK4JV5R7aP+rtAPDIcljrFnQ
         lYZSWeJjq2IbeSbRt9D/gQXOQJWqkETa0aHUqrusx5hPnL2M8pmkpuMaUqGxTGe/mCl/
         MRXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mcn3S9Xb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id lm2-20020a056214568200b0047347cb18d0si4560470qvb.347.2022.07.18.04.39.17
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 18 Jul 2022 04:39:17 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Mcn3S9Xb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:57856 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oDP5p-0005t8-DA
	for alex.bennee@linaro.org; Mon, 18 Jul 2022 07:39:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:41400)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDP5Y-0005qV-3h
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 07:39:00 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:35409)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oDP5W-0003OP-O1
 for qemu-arm@nongnu.org; Mon, 18 Jul 2022 07:38:59 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-31dfe25bd49so66199737b3.2
 for <qemu-arm@nongnu.org>; Mon, 18 Jul 2022 04:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=3RB0D8Gy1sjal1YEu+U9y7W1b0qKui6+rYeQwb/RYkI=;
 b=Mcn3S9XbZAz3v8Dp5WKd2ro4ruQsE8mruihtSjZeNXsPBfF7F9xODKf7j8XmPQTLYt
 j9HY37vtv57y9m+L9ICQ/5LnhvA6Mjwk7/bHXd8n9cBxi6T/eVNgVf95nl4xqt+B4v1J
 EWetX39XtL5ijZ5Tma7Zru3BgfiOlFzFwX5NTqEKeTTnVT0K0hXVOZZpfJajYmwn0+Q+
 kCJJRBcBl6gguFt9mbiWBzoliYFddv/kH3oUpM49FLAHxS81mYtjB03aUDroIroasK8A
 p/RmKLVurr8kdDODR5JH05+2E8RAlrGFcKsEGAzMDsXqyAuMZsOVBVcY9MYXijSymad1
 6zXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=3RB0D8Gy1sjal1YEu+U9y7W1b0qKui6+rYeQwb/RYkI=;
 b=idakTz6MyNktMHcR/xPEGZvQ1yLYFViegV/ZxQLo0U/qf2dldN5PJERjMqOWsEZLKK
 7O2Eu/mRe+AiSKpyS8dpH89BRWtUl2FOyr+f7b9vK85jx2XGHz3eWZSs7C2z7A6Xaig5
 pnX7SjzsmQvj/I/erToxHaG7/qAXUV+gCMijUlWfUE5/g7cT1uvg0kLTS84FEqplnr/t
 LwxK7CtmFmlBWsrYu3NI9Fes234pufcFN9mcRn+xglGwe7Uiu6ZpjGvCKA5uVcJQ9eYW
 h1VBBfZhzc4s7eH5X2Q7C2bXYlg6OoY3SX0ydVTM5KL59YqW3mtwHozYP7Wds0n45sEf
 6sWg==
X-Gm-Message-State: AJIora+azhjEY2Vie+m7CGQ0P6GPPc40iYtHgJcb+62NCNiXBvvSwmz/
 MNU2fd+digDv9XhZVCpL8ZtUSjYm7nlre4IrEvYBRQ==
X-Received: by 2002:a0d:eb83:0:b0:31c:8741:a033 with SMTP id
 u125-20020a0deb83000000b0031c8741a033mr30101974ywe.455.1658144337905; Mon, 18
 Jul 2022 04:38:57 -0700 (PDT)
MIME-Version: 1.0
References: <20220708154700.18682-1-richard.henderson@linaro.org>
 <20220708154700.18682-20-richard.henderson@linaro.org>
In-Reply-To: <20220708154700.18682-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 18 Jul 2022 12:38:47 +0100
Message-ID: <CAFEAcA942DAgdTHd=aa=6EzprqH4tr6unpf_C2fuHe-rtcYCdA@mail.gmail.com>
Subject: Re: [RISU PATCH v4 19/29] aarch64: Assume system support for SVE
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
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
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: uZUapNPlK68k

On Fri, 8 Jul 2022 at 17:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> SVE support is no longer new, assume it's present.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
