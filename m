Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp554788lfb;
        Thu, 9 Jun 2022 09:28:06 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwR2jWu5LaDZ+awet0iz2UNPLj2mP6rZPSmWK4szT05wGlFtFl4oB2o3wof3tIyezmdI0lD
X-Received: by 2002:a05:620a:2546:b0:6a6:5fde:2308 with SMTP id s6-20020a05620a254600b006a65fde2308mr27624496qko.611.1654792085983;
        Thu, 09 Jun 2022 09:28:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654792085; cv=none;
        d=google.com; s=arc-20160816;
        b=YSvQrgISSze/cQIhiV0os4SdLzzveouGtP3CXHXSD+luJjYmAoxRzt1JxvGPoUo38f
         +tg9xvmaF49/VFpAzeAgxH/86TTv3HL8ULPR/eWN6No1QcSjUIfH5ARk5mwZu4pzH7wz
         wqzp+QhsT82IbsS66xir1ay2HturkajfJ44n3KS5aiSHIW0x4p3FXmpzsH1+dWqnIZPb
         ywrXdCvkvFUV11pHY5wFtcqVyBC0mHG+FbCatkF7R7RhAzmsi3r/Ihj1zC2lVrlR3s+d
         JcOXkqToXEvTFtCiyA8qT2sLK44vb+MzQ1MtedyLqZgBCJ21ClAgjKg0ef6J2ak0xBGT
         LiMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=YqoC/TKER7WUsKXf3Cv30U1MR5Bd+4bzrABfHPp9Vio=;
        b=HIaMy1aGNkpPntOIJFuBMGvEMA3m82MqfVD0Pj7PUiAvHEh8EXJIIgFHv3veoKEjBR
         4IRx9IwdszveX1XcPXpDAsxoMt+yhnErSdHhT+Ipjl3sruY+NlmMKmN3Clo95LB3AOds
         amPUH733VhV08my3j1mATsl0gnoqhDk8nKxh9oNQ9kX/KXHfItlJ0AEwgrXx3zCi/WIi
         jj4rcfqFBS01/1xgejhnYsOtlGytnNcfQVT6UEBvP+nQfcuiQvcsbdrspHan8+FsK0xR
         o2+z8NgAMNEaPBenVs+NwHuRjJnEraaOS0IxtFrwi1Uqljbp76rtBU8o4FeLhrA0uxRL
         ORqw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NEP4YeC+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id hf3-20020a0562140e8300b00454166326besi12362555qvb.588.2022.06.09.09.28.05
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 09:28:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NEP4YeC+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44206 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzL0v-0002XC-Fg
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 12:28:05 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:52982)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK1d-0002Ye-Mm
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:24:45 -0400
Received: from mail-yw1-x112b.google.com ([2607:f8b0:4864:20::112b]:43395)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzK1b-0008NH-8E
 for qemu-devel@nongnu.org; Thu, 09 Jun 2022 11:24:44 -0400
Received: by mail-yw1-x112b.google.com with SMTP id
 00721157ae682-3137316bb69so49946487b3.10
 for <qemu-devel@nongnu.org>; Thu, 09 Jun 2022 08:24:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=YqoC/TKER7WUsKXf3Cv30U1MR5Bd+4bzrABfHPp9Vio=;
 b=NEP4YeC+cNwLb4tcLmPBl032GH/pr7FulmXtGjZd2VMl2OBcvlhm9tKej2FgDzRUW/
 frVidYHw5QkjWT1KKTrOVs0X+H+zbjDajfo8oLpgfcYM92gIHxYEX14+g+rWmQ6c+f5t
 4i7nRarHNTNwo9kQHGNvRkaAci/lg4YtddNnU/QHT0WsPP4Zcu0UUrJS9Us0PXmDZkzS
 0MMNxHBj2qXeJLrcxVwtaqJBFQYrI9Wd1p5jhVgD22jjm0XO0Yi0w6SD0Pg+A2F1Rqrt
 sTYVS9IZVvA/04xayriAC6qgfnxswFs6b2Y/5g5XgqpDez+YH0qKmKIWkGaGD0xLVdkF
 839A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=YqoC/TKER7WUsKXf3Cv30U1MR5Bd+4bzrABfHPp9Vio=;
 b=Ad4FH5uXYEPWNV53+lz5W4Bi079n5d1e73or68FMrHnr+viielCh2RZj5bsb8UHju2
 ClNaj+B9iS2TOhQA9BLH+i/8kxJZzUH4e5nYyDdsvX6mB3LEHPYU0l4FZyfmB/lE0DxP
 8DKpaFMwPz/Ych9ue/2ZQb5+Nt3YrjLO+X/mkZ86+zbN51l2QpxA/Vbbqj7OIqCS2v1j
 70LKaUMSxbhfhLpiKUavrtcnoDVAlHvArVsqOhdLHMRnknZgCcue00OwqWa7xXZYvawg
 hqkLc+nZAB77HeAT0b4DMvvfBxcnsfo6yxhUnDkcAPyAIn8p2Drgj+S5RjgOAbFx/AHM
 xg+g==
X-Gm-Message-State: AOAM532Bx/IpbmUNwxrY9ajJu38SfXqDzoSWwDqPkriYjNkKrXGNICEx
 UOrgrfkjTSFYCYkDpUfg6HH3slhoHPQyuLBI145aBg==
X-Received: by 2002:a81:1a4c:0:b0:30c:8363:e170 with SMTP id
 a73-20020a811a4c000000b0030c8363e170mr42158338ywa.455.1654788282155; Thu, 09
 Jun 2022 08:24:42 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-22-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-22-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 16:24:31 +0100
Message-ID: <CAFEAcA-bM5KsM3_8=y9Zr1oq2XobF=yRJFbLeFVNVZ3axafaFg@mail.gmail.com>
Subject: Re: [PATCH v2 21/71] target/arm: Implement TPIDR2_EL0
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: A8GamBQQbqQy

On Tue, 7 Jun 2022 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This register is part of SME, but isn't closely related to the
> rest of the extension.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.h    |  1 +
>  target/arm/helper.c | 32 ++++++++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
