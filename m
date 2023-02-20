Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2445377ejb;
        Mon, 20 Feb 2023 08:50:58 -0800 (PST)
X-Google-Smtp-Source: AK7set9ll+9ALoIHd6gorFFLKrxHik4MG1Z2LHChWYtPqElXjJ9pXPmxtzDF4DtAY7v/0IOPRfCQ
X-Received: by 2002:ac8:5a08:0:b0:3b8:3c4e:d334 with SMTP id n8-20020ac85a08000000b003b83c4ed334mr19587039qta.50.1676911858031;
        Mon, 20 Feb 2023 08:50:58 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676911858; cv=none;
        d=google.com; s=arc-20160816;
        b=OjH2MsbX8uOl9pkn4iDDNVDqRVdEJKL60HUl46tcCMAH07yOb8Jdgu4VpuVJcJlb2Q
         IVN+2ZZa8ii3Jtv7pI6lgZN7ljwxyBXQaPgCVkmEdMu2zO5T9OS/e7yCgSENVTKfsITM
         tv5DvlR2XxCL5w1CemVGK8c9aF4unl6EbRHBSjHZ27I1l0GyhluoXrUGEWsseXCjRGqW
         22oiv1x1Y3yd2GCmT8rexXBjHbLhubBw/Lu+DJspez2D0HJZZGtHNDf1mH2F37sDwHWe
         H4q8ogrlZ3Pp00X+FYwWEvfRZgf9A9KQugPo/TxD13+cwCzZEYW6Mn5Sp0GZXmrWRvUI
         pe9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=9FWFgb/x2LH+v1tyjo0ceacshOWHKgvwOgsn0eycxtM=;
        b=zJPmoaMnjNH/3r1n7zE8BGjKP+j/lGfYyB5oT+jV79Tt41uywaTTBEKcA7gYZg2cAR
         Whb2q9O7gN+NsT4xfG53xNXb1mK9b6+ZiXMW8O6Ewp5tyZol8HyFrzIuHB4ioB8VugWP
         FqeJYhTNwwg3KGrPJS4lPmgm21L+tvWVH+Txg6O1doWqwj6e9ME2SIBLUXpg+gOs+AS5
         N+o8LAwheGBwpwOMhqjGgqi1+Cu3/wVqc4bFCV+22OMexMO3dXyuvw+sF8AOJqzYTX5M
         QNHJnz9APytVLSFhHRVwRSRABJ9qOkZgleuedlzZkxpk0fioy/CfRHQ5ZGfTeF8t1Y+Z
         63gg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p9zJs8La;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id b13-20020ac85bcd000000b003bbd8bdb937si535576qtb.795.2023.02.20.08.50.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 08:50:58 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=p9zJs8La;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU9Mz-0003zP-Am; Mon, 20 Feb 2023 11:50:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU9Mx-0003yy-DH
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 11:50:27 -0500
Received: from mail-pj1-x102c.google.com ([2607:f8b0:4864:20::102c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU9Mt-0007ro-TJ
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 11:50:26 -0500
Received: by mail-pj1-x102c.google.com with SMTP id
 co23-20020a17090afe9700b002341fadc370so2025558pjb.1
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 08:50:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9FWFgb/x2LH+v1tyjo0ceacshOWHKgvwOgsn0eycxtM=;
 b=p9zJs8LaJgX35JFYTtEl2HPe7ws5POARdfWlB/EOEfSxQjlnfqdlLEZ0Uap83Y/l/x
 Q2kPJnZwEchhqUa94TmLla2rS7RhwXchdMHm7yLLTnBzVdr9lEMUZqR+mUW+SwckU0U1
 3Gz/ifKX87LAeyDVeNwDQflA4amM7yqoo+wPuAwrW9366vMFGc945qFDHeu1LKgbkk37
 WX7DkzhYZpWkUr1/QVgGvl/hnBLUWoWu5r1BTJ8GqWqWf2inwj4xSIJd/2956mePgBUi
 SsdjWmq7Gl96C0H/ojI7DoPPU7XFLmVE7xuklVbDf7fvcNZijT8aUFGSCcGnG3V/Wu1i
 PVvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9FWFgb/x2LH+v1tyjo0ceacshOWHKgvwOgsn0eycxtM=;
 b=nne7l6wKDCxPNMp2gE6PHWlewqGeNsfXY0iNTFkKqKOg92he4woGl79m2dRxh+ENpw
 RbbplptaUa2ga7YoLtYlnIxQOypri4HOOC/npTjkc3biBraMfxO3TZ9OR8VffNjXXtBt
 i38ChjS5ili5s8sP8laSqW4+CDSvv/s7lHkjMtvN+pRIhBFKVq8UyUE9fl3pEB/fmIh8
 IjYF1ituXa5gQTC7d1mgJUuitgrdBhq5Aj08cOIHmjpBAoZTZGHVY2QMKqvjOvnHvcS2
 wROj9S+TMe5DBg25G3i6B1k9l7E9rPunNDLwkty6aPPc5t095mLbFga76Aga2HOn8692
 hb1g==
X-Gm-Message-State: AO0yUKWlmV6wZWGPXUfNrSqW1uFyMSpsyWwmjHXcoWAfaQ2SP+mhJzbI
 +S+kPro/D3nbB/da849M04NjHARbWuTcOTbrYEttyA==
X-Received: by 2002:a17:90b:5109:b0:233:dcb5:ee15 with SMTP id
 sc9-20020a17090b510900b00233dcb5ee15mr1021912pjb.92.1676911822107; Mon, 20
 Feb 2023 08:50:22 -0800 (PST)
MIME-Version: 1.0
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-13-richard.henderson@linaro.org>
In-Reply-To: <20230214163048.903964-13-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 16:50:11 +0000
Message-ID: <CAFEAcA9Ba8Zw4u68g0qr03FAgy-Oe8yQvCymmKYFrF17MyPHGg@mail.gmail.com>
Subject: Re: [PATCH 12/14] target/arm: Export arm_v7m_mrs_control
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::102c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pj1-x102c.google.com
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
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-arm>
List-Post: <mailto:qemu-arm@nongnu.org>
List-Help: <mailto:qemu-arm-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-arm>,
 <mailto:qemu-arm-request@nongnu.org?subject=subscribe>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: QrULqCOHE1SN

On Tue, 14 Feb 2023 at 16:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: David Reiss <dreiss@meta.com>
>
> Allow the function to be used outside of m_helper.c.
> Rename with an "arm_" prefix.
>
> Signed-off-by: David Reiss <dreiss@meta.com>
> [rth: Split out of a larger patch]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
