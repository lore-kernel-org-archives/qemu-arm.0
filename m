Received: by 2002:ac2:4318:0:0:0:0:0 with SMTP id l24csp3406665lfh;
        Tue, 31 May 2022 05:13:03 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJywwjQ3hZYiWd5dCkpZA9rD5mzIjaqhSrH+r8FF3BZobldqGD9f/uIO1lwJNXmODU4qavQ7
X-Received: by 2002:a05:620a:29c9:b0:6a6:4f4d:637e with SMTP id s9-20020a05620a29c900b006a64f4d637emr2182987qkp.43.1653999183623;
        Tue, 31 May 2022 05:13:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1653999183; cv=none;
        d=google.com; s=arc-20160816;
        b=GoqbfHzA4urjtZR5pchNUIPXGwtBQ5vMfcIOM4DfJAwz4t7hEM+gU3+WwTBkij2uIo
         vxUejcEyK/EwuaFAYxkopbQBhETCE9OjMdwxWJMI8AaZjXyt5nKggF+PnB4fzUigc1tV
         b5ug8oH4gIEXlPuUSaK+Ijp1G78gxxewsfVyyJso3NdM8bi0Okww11rTeGLProBlBpnJ
         09B6q6j8yRhN4OofvkEmk7pS4aqu3BbJoOh+hJI+FW9mnqE3w62yx7HoYQ87LPvDmPfL
         rO4UfyY1co6QJAlzDBgvtEUxoxFJv1myNCf5Is1z5besUTOBsMsyO5GQJY3Ee31/BL9J
         Ta6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=XQVXiaYIei9ZECNg97vGelbwxgGo/LE7041Uyi1Z6o4=;
        b=Lh+qSglDpaGCXZLYITx/ctTZpUdbpjuL/x5BvNQYJYFF1HZ+hooM50w43VQDcZEm/A
         iK7mTxu2dcXImBxQNt4uQU85HELF/vlYz456A2+MIcowdwztP6f7+mLI9trE+OkZaCLV
         9dmz/AvzHTP4DkD5yxGDmgVV0+uN3rlJjhwQaAldtICxdhNuw3DMyoYFmgdFUNRW7+b2
         bJFCbldi6zH5z030fLUxgTVo3OhRgk468kqmPY1KrBt/jHsUFlS/Y01w3gENtp+t6uza
         oDJPLFFyw31GOgPVhvAFiwqJBPQ+xTzJtWVqierruqeiZBCxKB9XAJMdGzBsliAXciZe
         38cw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FhIwkXpT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y14-20020a05622a004e00b002fe7e8111f8si6699561qtw.220.2022.05.31.05.13.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 31 May 2022 05:13:03 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=FhIwkXpT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:55770 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nw0kA-0001TA-Sp
	for alex.bennee@linaro.org; Tue, 31 May 2022 08:13:02 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:35986)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0e7-0005jY-40
 for qemu-arm@nongnu.org; Tue, 31 May 2022 08:06:47 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a]:43259)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nw0e1-0002L5-US
 for qemu-arm@nongnu.org; Tue, 31 May 2022 08:06:43 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-2ec42eae76bso136704167b3.10
 for <qemu-arm@nongnu.org>; Tue, 31 May 2022 05:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=XQVXiaYIei9ZECNg97vGelbwxgGo/LE7041Uyi1Z6o4=;
 b=FhIwkXpTKrGg1fxNCj4wCa/6nB7fw7BkNjH79880DHJGuMT4QCSaln5FgbmUBxa0ly
 k9LgOo7qL9uKEz2n4SK50LoojbhujV6Xc5mW4tMeZy+ztlQJtGbKtm/zqx2ckfqb2CSO
 fXY5Tzjuv0oo5Dy35U99CUuclgwjwMlYnwiYOL85R3xZT/SkSpoyTMuigfwinv9odmxG
 VWAzVLQyBfEqIS9QQQEUZ66hHzWuPLDAp6Wt4yGf73X+9+gZBAthDAfcSBhyd/l3LPjG
 GjowRHCFy19QwqVHmqiPAj0h1tWjiMFIeOX5f0Z49kJcch7rNQAbgnmyZpV4QHNjmvxc
 /MXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=XQVXiaYIei9ZECNg97vGelbwxgGo/LE7041Uyi1Z6o4=;
 b=vQtxFSQXIgJ8w+enYY96fyGg+ZxbouOaZmp4iROag+UD713p1rEXT1iXw0jj6Tcyfc
 kmBKAOwnPcckaAKxbbzXsE5rolOtNOpYdaqPHzwsLyA5SugKuVZjCP8Fcspgf0252HE6
 Vro4mQIFlIJ8FhJuuJFPDSDvl5qYs8ySuAuI2csKesBJA37O9iSCqqp5E7IudCGB80P4
 w6MPbPldQLTGTXmykkxQQ5IM90vcJ+LSv7neobHn8PvtZhZ/Me3pPUd+YlbJ9dYIXx8T
 fB5BVwXZCrXpYz+Y2dpfm8cqouBjHGHj/0sQzY2n1SGukXqe3J5KY3D8EbhNg7NLtRCk
 Snhw==
X-Gm-Message-State: AOAM5307aPNd/VR87nV39Zz52CBPe643NpMSCCx2fofmuYOjd6Zc1Pkb
 aQAY/hyn7WI3TB3/xW+4b6QlCwGpRq7TuANe9fPEgpbooQs=
X-Received: by 2002:a81:6904:0:b0:2fe:e670:318a with SMTP id
 e4-20020a816904000000b002fee670318amr63685128ywc.329.1653998801044; Tue, 31
 May 2022 05:06:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220523204742.740932-1-richard.henderson@linaro.org>
 <20220523204742.740932-12-richard.henderson@linaro.org>
In-Reply-To: <20220523204742.740932-12-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 31 May 2022 13:06:30 +0100
Message-ID: <CAFEAcA9ON7VHFMsSLW7UD8PmnA_1qHDvfScUBr9ZOU+HNBy+VA@mail.gmail.com>
Subject: Re: [PATCH 11/18] target/arm: Move arm_debug_target_el to internals.h
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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
X-TUID: 8q+MqrPpQBJ6

On Mon, 23 May 2022 at 22:05, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This function is private to the implementation.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
