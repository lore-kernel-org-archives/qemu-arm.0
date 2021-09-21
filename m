Received: by 2002:ac2:5978:0:0:0:0:0 with SMTP id h24csp3069540lfp;
        Tue, 21 Sep 2021 07:08:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhtmFQ+oP1/592EYCoWzipP79Gno3fprNikL09CjnunA1V1aQeGLPbj+VyOvjvNmZ51G9o
X-Received: by 2002:a5d:5610:: with SMTP id l16mr35568477wrv.102.1632233332320;
        Tue, 21 Sep 2021 07:08:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1632233332; cv=none;
        d=google.com; s=arc-20160816;
        b=Nc8JA4vOuFHcFEFccw71D0efttL1i7v11kbQrw+vFliWY2R3FvO8XsHIr+NDRHF67f
         0MkuYG0IfI/lKhUSGLX6uSZX2kY2acp0hh+tLUFYwumqdrwyxp3YZ992JCwCU+YupqYD
         bCg8z27SqAv54+l7WBlEl/hs/6FAsSBmRlBmRaZAs6vODsID4+5750ft9uzbXEbIGPjU
         niLXbvzKS6N5R2B6QAXSJZ5BnJi89z038z7ngUu/RmcnG3fED4IafMXXv9Yx9wJqiKX5
         t30qOQs6L00/Q+xVYRm6pKnSEL1BsDa+hfQLmN/7nVs9+K7raz1JBOr8yBpmxy/kJNBs
         5jSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=q2pXf3ry3gCpm8n6139kI9eHLA3cFnsnVFZLzyuoSrc=;
        b=F8XaDcJVIh473ca0LjTPV4U3RqWgu1HtBlNVOD52/FYRFXMM+jX9TxaHjMqgqUEtsg
         nU3Q5UuQzdF48l0zprCboXnJccguuyD/PMQ6xOkyyn7UuM058Ck0eRFaQzfbRsqNDKyZ
         q4opmv+oeucFHC6pYBYvlmqy8o39eruW+xsRvWLBu13IzmznfqFo825KQsQr97i9G5pZ
         csPxRcaV6ea2pM42a/CMlJXqeumobW5uDTXrEIwKG1SEFiV5gRir51LlFaZABOvN1M9N
         Vn+KT7BBrPwD5C/ILDBeSsGGEFjW4qw76x5bTMqnv+tlO12fDgY/u4oThqLKC1Ky80ym
         moFw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nWcX4Lxu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id s9si18807484wro.572.2021.09.21.07.08.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 Sep 2021 07:08:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=nWcX4Lxu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42526 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mSgS2-0006l8-1o
	for alex.bennee@linaro.org; Tue, 21 Sep 2021 10:08:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:43386)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSgRg-0006hx-5g
 for qemu-arm@nongnu.org; Tue, 21 Sep 2021 10:08:28 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429]:36494)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1mSgRe-0003fe-FH
 for qemu-arm@nongnu.org; Tue, 21 Sep 2021 10:08:27 -0400
Received: by mail-wr1-x429.google.com with SMTP id g16so39574095wrb.3
 for <qemu-arm@nongnu.org>; Tue, 21 Sep 2021 07:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=q2pXf3ry3gCpm8n6139kI9eHLA3cFnsnVFZLzyuoSrc=;
 b=nWcX4LxuQMu7Z1GoT3HEqjkCCOp47Kc/lW5qBKbbUaIPJ2MkEfrlSbzVY08BN0zRpP
 X+1kzPTl5mBgoBhmkhyjztw6Lm6RTSrw4rnMNQ9FKaSH3gP8OkSwQThtV2rf52mrqk5O
 sLnfdWt1VcP/DQam2yC05ZKI2j813I2Lrhg66G3okCVKCXzUjygUnNrD/WPigtyeahbv
 9HremiSf3rjk4gyUOlGkXpP86+uCvMBApYgJtvTpUpheNHfs0To7vn6LcvAzEqEHitm+
 oJfZC8F7mWsAghW757t2iQpxZyaB+MoytAE949kW6DsUvb/nVur/1ATCegxEcRYf6Ry0
 CDuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=q2pXf3ry3gCpm8n6139kI9eHLA3cFnsnVFZLzyuoSrc=;
 b=hw2KcvaZ9YgMN0ip8xu9NWtVplj5SuqSWPW7Ge8h2IM90yl3zLNT2SR07eCS8dM+o2
 pRD8vTZ+2vNeRlaaPirMsxy3XpoBetxC17JCME2RUeZ/PoSj1S5zye41yWmcDjOTZ9cW
 G0vRJSuEz+Fs7QaagJ1m5M8JhaTzpbNxGKPa70iuikaztv0Sf9FeQgQEGtEA+rgo3W/g
 cf8yoip429cHld75FP8eICMIS6GGE2sEyQoRz9GMV37USaQxAMuJP3Ec/dhSlmOaUT/l
 LIZfdABaRwPDLTMENvlhJX8UWIxqgV3mF+J4ZN5MKxehhqw2+BysGt5sfoNz2P0GrVV/
 MwLg==
X-Gm-Message-State: AOAM533uIV4Nv62ucZxcnKiQqpRCWxe9rUe+VSR2Vn25AQrIdJPAYUn9
 ol5CybNVrc4DWyWYJ9T5RdCfFKJoyyQO7cyR8zzDwg==
X-Received: by 2002:a05:600c:2259:: with SMTP id
 a25mr4918049wmm.133.1632233304289; 
 Tue, 21 Sep 2021 07:08:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210920080928.1055567-1-clg@kaod.org>
In-Reply-To: <20210920080928.1055567-1-clg@kaod.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 Sep 2021 15:07:32 +0100
Message-ID: <CAFEAcA_7OojtAnd611zH2YFa7cpLxmowQSp+1QfqaZpxn8XGDw@mail.gmail.com>
Subject: Re: [PULL 00/14] aspeed queue
To: =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=peter.maydell@linaro.org; helo=mail-wr1-x429.google.com
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
Cc: Andrew Jeffery <andrew@aj.id.au>, qemu-arm <qemu-arm@nongnu.org>,
 Joel Stanley <joel@jms.id.au>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: vOrdAuNplXPw

On Mon, 20 Sept 2021 at 09:09, C=C3=A9dric Le Goater <clg@kaod.org> wrote:
>
> The following changes since commit c99e34e537f13a431a80e3e414e5904e9dd0a1=
16:
>
>   Merge remote-tracking branch 'remotes/vivier2/tags/linux-user-for-6.2-p=
ull-request' into staging (2021-09-16 21:09:18 +0100)
>
> are available in the Git repository at:
>
>   https://github.com/legoater/qemu/ tags/pull-aspeed-20210920
>
> for you to fetch changes up to febbe308bf9477767ca92e8ed5f265b0001fcef9:
>
>   hw/arm/aspeed: Add Fuji machine type (2021-09-20 08:50:59 +0200)
>
> ----------------------------------------------------------------
> Aspeed patches :
>
> * MAC enablement fixes (Guenter)
> * Watchdog  and pca9552 fixes (Andrew)
> * GPIO fixes (Joel)
> * AST2600A3 SoC and DPS310 models (Joel)
> * New Fuji BMC machine (Peter)
>


Applied, thanks.

Please update the changelog at https://wiki.qemu.org/ChangeLog/6.2
for any user-visible changes.

-- PMM
