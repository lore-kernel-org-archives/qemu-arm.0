Received: by 2002:a19:e20e:0:0:0:0:0 with SMTP id z14csp777825lfg;
        Thu, 13 May 2021 12:27:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJy/78inS3/BQPFMtx9itX4k5EB50oeJ2Lou6dNxNSFaL6o0TBqVkgqPCQQYWQ4U/rZSEmBF
X-Received: by 2002:a05:6e02:1545:: with SMTP id j5mr6446502ilu.35.1620934062343;
        Thu, 13 May 2021 12:27:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1620934062; cv=none;
        d=google.com; s=arc-20160816;
        b=YcBnODY7C/Booli3Ma1wIukbXZ00iEeIDn7Qw+xKG7vrdb+Tet+R64a6VxpauTaGRz
         zrhYC3/4+1sulOk7y+28JCA8/Go2/wrYvVSQWzby6aPYDhKCKvBHliuEllE8A8ShaVeP
         jS7CbOAh0xaOags0JsMBWgZe77MaQmOjCsI1419QyXb5Oa8oMjIl2L7fyqf/EDW/nCGw
         qL8rELnJYrnK3LYQmBcCrmztqcGALFgJnFhMcBiZC6vRdkFC+r81cOQdI6pM738T5q08
         ODAufVjXAO1F0oNDHbcyTRkHh9Xz4w+HPqRm+BwOmuakEUQwNi2d+VxeSt3eSKsG0nvT
         QNHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IPnPXZ0YHJp6YkeGsmM3JguXdK/Y6nMelQAfs+ufzrU=;
        b=KtL2a1Z9WWoKZy2FCE399GwZrWjMcvwGIZ2PiKX2qY7g91A+5wEJuqnc4+hZzYDREJ
         jC8w3muOzj8cEPmKYluUfYlBoQqFIAtF6E3wF+rbDoqftlw0eroce4/AQSrdTwxZYR5l
         H7PkYIkfoQva6b+CHD4oAtyVYc0CjyizwgFX3F9P09jFKBBsKR78Yrsyl771+8reuQY0
         QpUvujbxATzzwq1hCREqTWXNveMDq9aJMGkAs1SSTLhI74p+182H6aouo+uJbfj99b7m
         mh+JJwSDcFO07Xubdgw5mvOqcIgTVXHSsswfRRt8qFLEhFTpHc3pp9xEnc9h68zhHvAY
         IE3w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CRD5TgQ8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c25si4529185iob.45.2021.05.13.12.27.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 13 May 2021 12:27:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=CRD5TgQ8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43680 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lhGzl-0002Bx-Lg
	for alex.bennee@linaro.org; Thu, 13 May 2021 15:27:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48892)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhGzd-00029S-2m
 for qemu-arm@nongnu.org; Thu, 13 May 2021 15:27:33 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e]:38870)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lhGza-00087M-7p
 for qemu-arm@nongnu.org; Thu, 13 May 2021 15:27:32 -0400
Received: by mail-ed1-x52e.google.com with SMTP id n25so32213570edr.5
 for <qemu-arm@nongnu.org>; Thu, 13 May 2021 12:27:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=IPnPXZ0YHJp6YkeGsmM3JguXdK/Y6nMelQAfs+ufzrU=;
 b=CRD5TgQ83CVVp14Zh6Lpoj+3aB1CtjAKoFm1Msz/jqNV5WKIou/OheP7pDXPZrbXbq
 oneMEVPfdPQkwnshLfjx9aQZ0LtfXLyERpF0qkkzVsnhN3P5ag9w+htefGX1s7XW/uqZ
 xJAuSQx3IEeZGNX82YvTGdnpka1bF/jtLgImvW7Szn8JVRXEbw5VrO2sxzugxznE/FX0
 iB5MqFcq8PYuiXqmcj7FKFMOcqck/9Awjtp2/wX9R9nU2F77S/aiv3cSKcbzG7ttkuIV
 ai5vwodajKaZ/d/JguCJy4GAcsUVekV4JkI6UnRYPuNkoyPMixPtH3usqw2hfAcIRjtd
 hgKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IPnPXZ0YHJp6YkeGsmM3JguXdK/Y6nMelQAfs+ufzrU=;
 b=f2Z3aPTGBf5l5ppHIw/2wq96vlI85MB4rlsmqegkr0WO0nH8hb8t+v9FGPRrTAx22Y
 cMoCjA6x09FjxYr4Bfm0egR6gK1AgsnF5ylzUXPSfQRvcUpotvcanRA2RWaRpoemXoEr
 ZZUPLPR7OLGplVwShSVkETNBm2JEFW84ZIPi0MWxSDA7LQeYQBsBWSBs5ZXvuV/QI6o6
 QzyKFGfQZ7n67NcS79pmLv/6616XGHPNxZGclI9zQls8/up28kFJSge55rVa+3nJv3JC
 C1lxjjyn5+f9Eeg7fgWCEIJbgautqTMLB5GjT8gNYachGYe9gMyJF09CFGL0m5/XQcrK
 rFqg==
X-Gm-Message-State: AOAM530M2w6j041NCX/uQ5GMqgtm9rKnwfFCZNNlg7RrMk8Q9osiOWDs
 h+9KbNB/uQilwz6p8Ni8MZMGGSOEb2HYPqCyq+72hQ==
X-Received: by 2002:a05:6402:19a:: with SMTP id
 r26mr51338435edv.44.1620934048764; 
 Thu, 13 May 2021 12:27:28 -0700 (PDT)
MIME-Version: 1.0
References: <20210430202610.1136687-1-richard.henderson@linaro.org>
 <20210430202610.1136687-79-richard.henderson@linaro.org>
In-Reply-To: <20210430202610.1136687-79-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 13 May 2021 20:27:17 +0100
Message-ID: <CAFEAcA9tscqNj0Z9u0Tm+zCa06XDu7KG6=m=gfCq3tM84-j1Wg@mail.gmail.com>
Subject: Re: [PATCH v6 78/82] target/arm: Split decode of VSDOT and VUDOT
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-TUID: GR3ZiPAAOSiD

On Fri, 30 Apr 2021 at 22:21, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Now that we have a common helper, sharing decode does not
> save much.  Also, this will solve an upcoming naming problem.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/neon-shared.decode |  9 ++++++---
>  target/arm/translate-neon.c   | 30 ++++++++++++++++++++++--------
>  2 files changed, 28 insertions(+), 11 deletions(-)

It also deals with the issue I had while reviewing the
previous patch of trying to find "VDOT" in the Arm ARM and
failing :-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
