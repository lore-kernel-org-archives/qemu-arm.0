Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp516422lfg;
        Thu, 13 May 2021 06:52:53 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxCtoX8u0cXQo+u0kvnRkPlDpzSpsXjBEBm27LLtCeLLaE9U9JlumAM1qg0IL/iXH9lX2Y6
X-Received: by 2002:a02:b717:: with SMTP id g23mr39230525jam.109.1620913973105;
        Thu, 13 May 2021 06:52:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620913973; cv=none;
        d=google.com; s=arc-20160816;
        b=pmD11v0+dGGHreYRr9FGdwDJD1HXhFSKSFl0fvXLYKdacsXBRf657XV+T1qJpflR6W
         XizQB6/68LYfnb/fwPfKTYHO+PmJvJd2UKHaJrNnfk6sEP3q+A4dpE4K163qp5kS/Fom
         hIUi3czTShjHU7B5/z5tcODVdxwGcdKw0ElYfECtUJANkWMFa5x8LzCnLwMIlbG/fLDy
         fvKSx58wn87q8xcrj6b7xiOQRmZBivIfBSLa4j6QGsIbH8bsZmTRtkWukTQBmCYKFgOl
         7292oUbClEioHwUWQyXr6KrsWXexPfqG4urIVxGsxQF1kU7JY5axSSLZvIML9j/BpSgd
         SMaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=awOl4kkRLfFKp3F8DhUo9jdhNL3A5trvAAb8ywp6EhY=;
        b=fCxXvBaM/MCFU3dP5fNV+TMHAO82SaGegH0Sh/vsTojS7nhs4pHLIpDLcGPsgkbgeb
         dgnbzeK58iNTDSj32mihC9HEcd0koSyjBHsB0grKdKFrcqw1myHuuxTQfWFhmGDJ8yiY
         62pd5auDILbJMrgnKbONwjt/6tDcTECfBdI/dKb5cdnYqSY3gbE9gAYlXp4kO9IubPqT
         Kc89XsFcOW40WnQFK6nddktIx4WtK1+UKz7VlIlz6ox6J0EUvGAvofG2pPH48GXxG30/
         jv79hC998qAoV+uaviPvJ0KZeE4k7pbvlszEhc3r3WfIHqFKRIqGGec5AtvPDH9P8fmy
         +6pw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YWb3Mdn9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c7si2058360ilq.140.2021.05.13.06.52.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 06:52:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=YWb3Mdn9;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33546 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhBlk-00056j-FW
	for alex.bennee@linaro.org; Thu, 13 May 2021 09:52:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50732)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhBlc-00056R-9n
 for qemu-arm@nongnu.org; Thu, 13 May 2021 09:52:44 -0400
Received: from mail-ej1-x631.google.com ([2a00:1450:4864:20::631]:41519)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhBla-0005ZT-Nw
 for qemu-arm@nongnu.org; Thu, 13 May 2021 09:52:43 -0400
Received: by mail-ej1-x631.google.com with SMTP id k10so8746071ejj.8
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 06:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=awOl4kkRLfFKp3F8DhUo9jdhNL3A5trvAAb8ywp6EhY=;
 b=YWb3Mdn9W522tDe2aUWcFN6o1bB0/FI+MtMweTzA7ejm9zCEyA559F1+ZmndyL31Di
 AOngokAZRzD3DVTx5xp8dFFgOQEUpdo6KjVGdMftf5hSl63gQcu02x/lC4w2Wo1wUMF7
 esTrO0zDr1O32S2FHuqZ8dTajfQOpOAjVR5hff3vRXL83iCaGeBIhHVWHlLwNJ2T/KLO
 U0w5unFvmNyS8ei3iC0OkM5yQCmWin3o93bf61djdC70wion0YL9iYVmfdGaq0tazVLH
 94d3L7iOHP+92WACPNXUjCG9noafytJqtd312Se7m++2xvcE6vNc5L6i4o34rlTnl0CE
 Hezw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=awOl4kkRLfFKp3F8DhUo9jdhNL3A5trvAAb8ywp6EhY=;
 b=PF9CYqBELhWsZjwbV2Cu/ktmXT4EPkD0hAZmVGvCwTZ/bVU9qejYBne398c0VSVNdZ
 4X3Tg63zrZVHxLrHo6Qn2eaO9WP/TM26KktIZv67RJP6uT7qWS5W/OYEs5+u4tuv+OUI
 YJ6h4Oh/wymku+Aa9/EtVY5DHPjy+ee1Ic02zNwl2BX7sSNkRz3hTcRXXm9a3ZA/0jrY
 F/2L6g/jyg0TIHwaoqSdabZEAZN3eReqhEGEY0FKBpEHvt4jDxcm0spAi38wtM0nBU6P
 heQhgDSuntAi6XMBp5y5cXgJvnJQf1LYj30PbNQxhLSSlwbOaA8ONgaIeDqe4dlfaw3a
 vm9g==
X-Gm-Message-State: AOAM5314w0pHVBlvQMvawdwVpiAqKydhVFXyU/zKBhD+x23OXaS7V+Kq
 VsEtc0mkWFZ+Jxc+uAIOQzy1olUUDM8hl9LA9spyPw==
X-Received: by 2002:a17:906:d1d2:: with SMTP id
 bs18mr21859704ejb.56.1620913961093; 
 Thu, 13 May 2021 06:52:41 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-64-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-64-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 14:52:29 +0100
Message-ID: <CAFEAcA8KJaun7ifacGbtvFboiqieB+gB3+9pcMzi7NL-GYF9=A@mail.gmail.com>
Subject: Re: [PATCH v6 63/82] target/arm: Implement SVE2 crypto constructive
 binary operations
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::631;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x631.google.com
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
X-TUID: DPcHA0Pwv11d

On Fri, 30 Apr 2021 at 22:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h           |  5 +++++
>  target/arm/sve.decode      |  4 ++++
>  target/arm/translate-sve.c | 16 ++++++++++++++++
>  3 files changed, 25 insertions(+)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
