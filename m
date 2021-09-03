Received: by 2002:a19:5205:0:0:0:0:0 with SMTP id m5csp1401966lfb;
        Fri, 3 Sep 2021 08:30:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwy0pbV3P1FyP971tQmETOIcPwRNIJfqApVbMoLxaQn18CSindLjYu9mUxeptLc/ZGzKn4n
X-Received: by 2002:ab0:64c9:: with SMTP id j9mr3228556uaq.92.1630683011864;
        Fri, 03 Sep 2021 08:30:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1630683011; cv=none;
        d=google.com; s=arc-20160816;
        b=XpAGKqoyXgLFRwDA0rrPxmS62ikTE/4TJAX7eV6aqXdhYjYf+eX9MbqfigqA+d5C/k
         EpjRBmnY8bVMyHPkJ6L2dfHcES4Fke0t/yRQO+8W/uniOxVezU+1GOq0g7FU4VyXaSpO
         r4OiBnazY9TJwtZno8jvg92P6hzRj4M3ReqbZECRm7IGJw6pa73tSGgOQSOfeeJc7qd0
         yeZos3OSNdCbrrP2Ll1muqT4rng2qNNZo2evvxks191LVCwaDfq0P3S5dSvf6tY5JRH6
         P+e4xEwfrh0h0nzsCzIzc5ocetwikrQSCXWQR505jhNepzMr4ZVMYISwIGEjd1WhIPJ3
         jPAw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :content-language:in-reply-to:mime-version:user-agent:date
         :message-id:from:references:to:subject:dkim-signature;
        bh=V+zN+8J6jP0DGFMja2o+XrL5hYnhM1z0E3lRgqpMKrw=;
        b=Xa4nh7qSPpDVhqIU6mOunJaolb/+NWnzAplIqpjFWwQS8jUnIV3P6B1c1nDnOAGDqi
         jqEunkzR2NKhtv8b4bJiR9RPgqc1pyVgMXYYXE05geM5lC7ldiXci/ahnGQBmviGhkWw
         W5q2eNr6qxY6ONM5FJoQyXp91RIfqcoDTucnzzpOXrcXy9MaGwe/HdJxS1lvLOuTVUTK
         bqzlIwHPe4RWwakAs5zZX6FSMHrBco8qUvFKOX4c0YbtIily3/tpdN//79VqAMQqMtWT
         JoqX4Z41AOVsfNgO4qRCF/ziIefxnRKCd7BSYssALDwVTUOYMeFZIuStOpEBBjMm1w5C
         gZlg==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i+L2gbwU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y12si3163049uae.239.2021.09.03.08.30.11
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 03 Sep 2021 08:30:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=i+L2gbwU;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:48906 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1mMB8t-0001oi-5J
	for alex.bennee@linaro.org; Fri, 03 Sep 2021 11:30:11 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:50412)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMB7J-0000Jg-2c
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:28:33 -0400
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e]:51889)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1mMB7H-0002D2-Ap
 for qemu-devel@nongnu.org; Fri, 03 Sep 2021 11:28:32 -0400
Received: by mail-wm1-x32e.google.com with SMTP id u15so3771326wmj.1
 for <qemu-devel@nongnu.org>; Fri, 03 Sep 2021 08:28:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=V+zN+8J6jP0DGFMja2o+XrL5hYnhM1z0E3lRgqpMKrw=;
 b=i+L2gbwUNp/JXqReYec8oQ0BoHDT4YyCzdvDqp7ARF1r1AsAnsXWKiuuJcI/13kbwS
 K2a2nem1AGA13QAqL1VILdQm6VW+ovPH/BaOClKQQ9iZffWXtQM7T1K3eZC7y6yDCUBo
 JpbIdNQGuA+ZWwISt+WVs83yCnKGPw7dukkd4a5BmsCltQRXtp6rJkHgqCsUt5Ep5Fsn
 0jzM7fj+qnnXzK44tdPwcyhtzh/KA0CH0BLygNBNFxnioAhAwNtUoYdxydq3yPW2LMNM
 RorfNtsRFMdnTw718OuGdQAd4Kzh9yYnTEGLIf+7VuuE5cXE0BzOaIN2QJNItznxu0hF
 EMxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:message-id:date
 :user-agent:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=V+zN+8J6jP0DGFMja2o+XrL5hYnhM1z0E3lRgqpMKrw=;
 b=fzIChQtxkgMoctA6y8HJLWz1SfcDkra7Fki7aH3PYaxZR8WdKfjyEmlLgAuqR3OcG2
 aSa4m+FGqnz18L9dSZ7Am9YKhAtYWFxUO79TyoXiNdEh8kNN5AAuMqovZhy3xgphPZ3B
 saIgAFbPDkEEEYQuo43Urji6WSMbnt0VkI/Cir1k7FzcggLjrh/+kQXm2or9tm7ikYQT
 fYfPFhPepsYvvaeyeIAC2S13vRCcLgevrRNrF8WDvj1AukMkQVBnHeX1wDs5WpYH4/q2
 U0v2gmIbn4cgYZvtmgpcmbcQ+1xOklgsFsqCnqB5Qh2jntmE/KEGq+YAsNGCeWucqCWZ
 sHQQ==
X-Gm-Message-State: AOAM532V3Z69f+6w4uImWgc4XpcPruMsQFjv4kIy8ND/dhu0Ok9eyz45
 woOOovV9PAiH5x97FAplC2B2bIMhR3TLDrebn0E=
X-Received: by 2002:a1c:f31a:: with SMTP id q26mr947518wmq.159.1630682909267; 
 Fri, 03 Sep 2021 08:28:29 -0700 (PDT)
Received: from [192.168.8.107] (190.red-2-142-216.dynamicip.rima-tde.net.
 [2.142.216.190])
 by smtp.gmail.com with ESMTPSA id n4sm5840736wro.81.2021.09.03.08.28.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 03 Sep 2021 08:28:28 -0700 (PDT)
Subject: Re: [PATCH 1/4] target/arm: Add TB flag for "MVE insns not predicated"
To: Peter Maydell <peter.maydell@linaro.org>
References: <20210902150910.15748-1-peter.maydell@linaro.org>
 <20210902150910.15748-2-peter.maydell@linaro.org>
 <76cd3594-f864-232c-8687-19a1d44ff07e@linaro.org>
 <CAFEAcA8EoyaCSzA1vL_SHY50T6Fxjm420_pYgXx1_+E-nV-MBA@mail.gmail.com>
From: Richard Henderson <richard.henderson@linaro.org>
Message-ID: <906c738e-904c-99ba-b6ab-2556e9262c87@linaro.org>
Date: Fri, 3 Sep 2021 17:28:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAFEAcA8EoyaCSzA1vL_SHY50T6Fxjm420_pYgXx1_+E-nV-MBA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32e;
 envelope-from=richard.henderson@linaro.org; helo=mail-wm1-x32e.google.com
X-Spam_score_int: -29
X-Spam_score: -3.0
X-Spam_bar: ---
X-Spam_report: (-3.0 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, NICE_REPLY_A=-0.888,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Cc: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: 8UlZPi0J7mmE

On 9/3/21 4:17 PM, Peter Maydell wrote:
> I don't really understand what you mean here. What's the difference
> between ending the TB now and translating a few more insns in
> this TB before we end it?

   VCMP (pred now on or off)
   B    label

The code we emit for B uses goto_tb.

When goto_tb is unlinked (e.g. first execute), we exit with a code that causes the current 
cpu state to be evaluated, the new TB created, and the link filled in.  This makes 
permanent the cpu state we evaluated, and thus the state change across goto_tb must be 
constant.  This is fine for B, since only the PC changes and to a known destination.

So we have two choices: end the TB immediately after the VCMP, or set another flag to 
cause gen_goto_tb to fall back to goto_ptr.

But I sorta think that it's just easier to end after VCMP.


r~
