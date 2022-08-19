Received: by 2002:a17:906:3b11:0:0:0:0 with SMTP id g17csp1055595ejf;
        Fri, 19 Aug 2022 08:49:47 -0700 (PDT)
X-Google-Smtp-Source: AA6agR7UP6QnV7TaBI7GOUTTIVIKO9OBaWLP7tuR6k6KwDRKuO79wIy0kj7xq4R1IQFT+yDDm2JN
X-Received: by 2002:ae9:e518:0:b0:6ba:8d21:5f41 with SMTP id w24-20020ae9e518000000b006ba8d215f41mr5743956qkf.106.1660924187163;
        Fri, 19 Aug 2022 08:49:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1660924187; cv=none;
        d=google.com; s=arc-20160816;
        b=eltUQk1w13srL3lGapEMXSK6wtn2dTxGUUnWp4KPz3xnXJ/HXXvpc5XRhkzWMYcP2v
         6mYo2EZVhbkZx3lBRGUzAAjY7ejIiUQ8wCc/4Pa5JS1SvQu5NgQsSq9IAgQ9nmNqZFds
         nruz4KsO/i5qlmuFagqxZcn3/Q6p87rKNVLHZsl0WC6Kn4FYB/QuxJ/tW4t5R3tZcdig
         DvuavrmsrptRdTTy6mU9R3LvsVM1x5PwACaZ3ZnGBGOZPx1deH6x6rtaom4zYtER0tty
         01MOaRvql2aEyjIxqS/J38gY7g9zzndScuB+8jDgHsNsk/CxshVLRRINmc6/cJ4QVW/H
         WDxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Exxc/hnK0XGx+QDCfFlGgFUo5+l1QPVgPrN1nU4pmcg=;
        b=O8cDn3cMwFcsqxE02MjLRmHtfgsbSKEe/uvbsqUe7aNIUF/SXgPcTA3Nr4W905fmYH
         yzJ1RNaYIHuRNE8hEYkzirF+od9kpXH8r/BR7MLuUhNk1Bcx6BMMTTFHyojNHG47mwDB
         BrlTF/jBteZfzzH24P4BI0JlvQI6eXepIKpsxiiLLKjZEW3IggnUrvrHWPREA4HjKsBX
         m+nxfNpEWvBwfNXgCkLvv/G0Ge3zcfQfnLUcsVuzjmnWoSvOGrl1/IzfWsEWYZbAa+wQ
         1i7fgz7Hgn4AHjgvCc9s6YuaTj71/zUGPEyCnPzCmnmMsz5zxY1mIj8cxK1H9HUb3aTx
         Az9w==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IIeUA8gG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f1-20020a05620a12e100b006bba2860bcesi1873491qkl.385.2022.08.19.08.49.47
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 19 Aug 2022 08:49:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=IIeUA8gG;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44186 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oP4Fm-0004Z6-LJ
	for alex.bennee@linaro.org; Fri, 19 Aug 2022 11:49:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:47082)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP4F8-0004WR-9R
 for qemu-arm@nongnu.org; Fri, 19 Aug 2022 11:49:06 -0400
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136]:41648)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oP4F5-0007Sm-F8
 for qemu-arm@nongnu.org; Fri, 19 Aug 2022 11:49:05 -0400
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-334dc616f86so131954617b3.8
 for <qemu-arm@nongnu.org>; Fri, 19 Aug 2022 08:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc;
 bh=Exxc/hnK0XGx+QDCfFlGgFUo5+l1QPVgPrN1nU4pmcg=;
 b=IIeUA8gGtRtPZbUYur3RW8TCKLMJQ6+MxLvExHWT2rj2rgAsKB1ssC8pLVYeOKVcYZ
 J/7KDS43ddeOsL8szmY5d27QChAvHQ3n5st5aV5ePvxgLCpGtiNakeC3grDNcSlK8gX1
 iXPBa6tlENRGZXAH2tY0WulBqLTx+3A+IxuFUEXt/nqoh+XnXDaZbb8OphWi5L/GD2J6
 WhNC82xqtnnmmsPN2VdUmLneBrtIAwD1qfNjG8SuTjnYwsWvZPubkmHb0cSVf/bSMQrZ
 yiZe+92ZH3B+w/D0L5WNcfQtTCRJots1wSQ26xZ9WF/RXExfgAc6i6mW0m5SXCQOeUI/
 Pllg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=Exxc/hnK0XGx+QDCfFlGgFUo5+l1QPVgPrN1nU4pmcg=;
 b=vuWFsjv8xYCitmBpVWfeOHeSF20wmCaz5ai6zg01IEHGkv8yBxg7Qkdrg7k2sgAwIv
 a7bHqL68VoJbD8Jp/g8iAuKvXBa7hR9nJkwkxBYnFOOn+i46O4S2mfnqc8HXfK2gIjgW
 RSXkRYTEMXvRxt3VzKkB2QwUQx4yU+Lo4kA44DIMwkYwQSKsgHLQPSG8Jp1G6tbAjA7A
 d5USRfHFwRHysIxuAwfTG+0RvFOjaBfnbHXHGrmovlmkEkk+lQMetWkQ1mfuE2KI4gqd
 99VfVUggmVcidq96C3udzl7IkzOX8IY8UqiP970c2KJFIebY+s3EV2T2NSaGjpdanxx9
 hEfA==
X-Gm-Message-State: ACgBeo3xsKrApCl9R4nj0ScoN12r9zmNpUreYrIUZAN1nZx05HefIZKW
 g/jCl+40SEIGBsMUuUQ4h0s6HAjWedxPdDjrFmrEOA==
X-Received: by 2002:a81:10a:0:b0:333:618e:190b with SMTP id
 10-20020a81010a000000b00333618e190bmr7748083ywb.10.1660924127744; Fri, 19 Aug
 2022 08:48:47 -0700 (PDT)
MIME-Version: 1.0
References: <20220819002015.1663247-1-wuhaotsh@google.com>
In-Reply-To: <20220819002015.1663247-1-wuhaotsh@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 19 Aug 2022 16:48:06 +0100
Message-ID: <CAFEAcA-K4gFor7-YeiHRaiCAe=Yu0BMoRHpR7tFzYPj-793Mcg@mail.gmail.com>
Subject: Re: [PATCH v2] target/arm: Add cortex-a35
To: Hao Wu <wuhaotsh@google.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Joe Komlodi <komlodi@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
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
X-TUID: pBxRMNlCKCkt

On Fri, 19 Aug 2022 at 01:20, Hao Wu <wuhaotsh@google.com> wrote:
>
> Add cortex A35 core and enable it for virt board.
>
> Signed-off-by: Hao Wu <wuhaotsh@google.com>
> Reviewed-by: Joe Komlodi <komlodi@google.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
