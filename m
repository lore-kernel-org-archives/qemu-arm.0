Received: by 2002:a17:907:1627:b0:8ed:b3f:fd98 with SMTP id hb39csp853648ejc;
        Thu, 23 Feb 2023 07:58:02 -0800 (PST)
X-Google-Smtp-Source: AK7set9r1DEvRu7otAxQUle43al0OSw3VbtZRgFgzO9QiKamyDiV0U0oHqNgvWH2KbpPmzeHCv8a
X-Received: by 2002:a05:622a:38a:b0:3b6:35a2:bb04 with SMTP id j10-20020a05622a038a00b003b635a2bb04mr8767247qtx.7.1677167882429;
        Thu, 23 Feb 2023 07:58:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1677167882; cv=none;
        d=google.com; s=arc-20160816;
        b=wQ/BjsCPfHBeOYyElXtPgkcLz1cagtJqxHOh11/OAshoLsp8Me7pu2zDVDXm9nAuSH
         bEM5UHQm7mOZFK7ATem5F2WLgcUJsuendERhIX2UnolYtPWjxsNFbEBuuSJNwElLjpn+
         YyWY0UXFO7d+2Zp3xDVna1uXyGx0ppl85yndfF1gfWjx5V5Ee+HtKaHlu9QhhqbXVFuI
         VzUGAgHrAyzr+zt22eFgZ7xZ1hoCdsRY+2d1T1zemshy7V3hzf7URBwjMtSIldKpdwoZ
         2MJ1gk9bkTGi4bTTbCThDpCeF3W0jJ3/OPKaWQvajqyCEqAXw02DXQ+PF2Ft6ya0X3PM
         utqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Oh5p9J3BuZ1/9RppLhkTsllNcPKrX3GbfinbJi8Me1k=;
        b=XY27XArfvSbu2R0VvafvITMGCGRwYl6x4w2TssYAFHnGkSIaTsCoAsR9zg+houzonH
         JQcZBeIvbrFPsLlBr47XU5Ejc7pd7lzS5HQ1JrFL2oYIIuX+0LAuKMzpg3Yam0NSYIGT
         n0AnKSOtHtOwC5dI9a1KGwxG4PeRZVUAg1Q4AMw7BDDZL3fYKOm9jPjKe+8FECy7jWV5
         ZRC+a5u1+h+S3nvvmrw710+jQxy5R8g469KfwXzPwwqLFip8Wv5hjy/8Ve935Uz3XZWk
         LD2jAgLxj/rFs8QeHKcDZFKeIgPugpoQRNcgLlhl9ssi6yEEMTMJlpajN7jivTecaxcc
         ZEKw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fJ+WS/Nn";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g9-20020ac85809000000b003bbd8bdb933si821184qtg.791.2023.02.23.07.58.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 23 Feb 2023 07:58:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="fJ+WS/Nn";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1pVDyf-00017d-VA; Thu, 23 Feb 2023 10:57:50 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDyc-0000uC-RP
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:48 -0500
Received: from mail-pg1-x536.google.com ([2607:f8b0:4864:20::536])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pVDyb-0004qn-FH
 for qemu-devel@nongnu.org; Thu, 23 Feb 2023 10:57:46 -0500
Received: by mail-pg1-x536.google.com with SMTP id h31so5935996pgl.6
 for <qemu-devel@nongnu.org>; Thu, 23 Feb 2023 07:57:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Oh5p9J3BuZ1/9RppLhkTsllNcPKrX3GbfinbJi8Me1k=;
 b=fJ+WS/Nn1Enef24s4guueD1gsn/MreWymZ1DcACdQTRziUc1ltgHhWKURpDmq0Rl0X
 JYEU9ZMcLCfHI/3rkLQ2AjucT+hkCzNoChVOKZisetTAzC2OY38pCzWI4CaeaWYKK5JS
 fkCOkzWlLgQgDofzTbm9PSyDe/6Owpynxx0SF45eb3b4Aw6jPqtNez9RXIrgab6K2igh
 H8/X7Kot41+91HTKvnshoxg4PctbLJA9p8CamkDlwPUNgqqMitIjxRh2+Zaap0gl6xPb
 /+jCO4ddtu6bTO9G9OJZVeJ6Zoix5AWX+fTVU28dmHHuvGs2RYHgfYS+DPBkRPQ0FRwZ
 4xJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Oh5p9J3BuZ1/9RppLhkTsllNcPKrX3GbfinbJi8Me1k=;
 b=7Z7AtzjLA13K/qX1DGXL5jzA4+65gAz+c7Xd+jRAGij0gTht83bu0beViigKvzRY7W
 H3tE2FdhUZHRX3BEQIHy9Hjmb+6T7puya9eCAkOjDVRIYDuA8N5Ayucy0gRRbz3wGFbY
 W0g2FxtMms/e49Pg/1RFNYXZRDoC0tYDilM6QvtOVSQav673Igj+FBCtJ83IrC1WDsqY
 iEYiqvTxgF0jsn2O8K1CN+x17C4iAQWxO5K5Klq27a6HUjUTm0wAe7K2VHktze3mP7BS
 2VWXqNEuMEARIeZbyHbiZ8vIxWS10cSZ97GvJlSxTRZGiqzNGYoDxIw7iD27bOjmjr50
 z6oQ==
X-Gm-Message-State: AO0yUKXINCRZMBSeQVh+ErLkpOQvaPGpPxQkKPZIBdfL2rJVnbHfHojc
 d2gs2niTxTSdoHWKlB6RhMxX8uuEQ3nNV94RqcMIfw==
X-Received: by 2002:a62:e401:0:b0:592:453c:320a with SMTP id
 r1-20020a62e401000000b00592453c320amr1812827pfh.5.1677167863519; Thu, 23 Feb
 2023 07:57:43 -0800 (PST)
MIME-Version: 1.0
References: <20230216030854.1212208-1-richard.henderson@linaro.org>
 <20230216030854.1212208-10-richard.henderson@linaro.org>
In-Reply-To: <20230216030854.1212208-10-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 23 Feb 2023 15:57:32 +0000
Message-ID: <CAFEAcA_aQbPH_Siho35_R7EKDe1BJvfM=qRyzsPf5-Gdx+e21w@mail.gmail.com>
Subject: Re: [PATCH v1 09/19] target/arm: Load/store integer pair with one tcg
 operation
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::536;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x536.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 1fes61xCQFy+

On Thu, 16 Feb 2023 at 03:10, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> This is required for LSE2, where the pair must be treated
> atomically if it does not cross a 16-byte boundary.  But
> it simplifies the code to do this always, just use the
> unpaired atomicity without LSE2.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
