Received: by 2002:a19:3859:0:0:0:0:0 with SMTP id d25csp1529778lfj;
        Tue, 3 May 2022 09:28:42 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxsHj1/5aj4LB+Zfusppyc/ombiKe5+VKFKS5ZpcJ3prSNFEuJ/bBdifBxhLAgmuaoNJwEF
X-Received: by 2002:a05:622a:138d:b0:2f3:ae81:19b with SMTP id o13-20020a05622a138d00b002f3ae81019bmr3393903qtk.116.1651595322250;
        Tue, 03 May 2022 09:28:42 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1651595322; cv=none;
        d=google.com; s=arc-20160816;
        b=BMQaSUTC61ekatlgStssN7LfgbkqEbQPwZ230Uibs6Z+qs3eVMnYdF1ZllQAX4f590
         7/BbBEbB9KFquKNDKnc8U92VSSHwCAQ9OFYTvCaNKlqhUO7w3DEOD3en/QBJINDB+zpb
         wN2aBH8K/KS7MjkT8hyOl3lLKezT/UBaUaVH8eEqMjimX67tdqEFSIeUVk4yQSZA9iHp
         nko8eGAHhOAAzXqiEcYxDR3ZLEA2ip0L3PDJJNm13qC2YRfe1D0nYHaHQ1pkppaPkjux
         z7BJbaYAubqYdDmUlYJlBV+QrpUWrTTx4yOkzBfTuji9LFnpknU+J39ZKphLOm3f6IDX
         LlvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=1fiALV16VmK25BHaY7dI492agzHdhAmJ3CtIdS0HzSU=;
        b=jpASfLrmy7ou97N8IvVd2BTr2ng3ynZB45AUlNAeyPTaaZd0D7yFuh69WmeHEUcWHU
         Tgw1W17GGuPVB9jJpw51CQ8CqrXhJY9mS+hHEscJDuv/nwpUwNJsawOLXd4GMBci1aYb
         J769an+Pt8wzqDaBGmbaOjDjCm1PpTxXe9BG6xm3Ek3m/7SyIMvkVmSOmpZibGaVkUDn
         QFmETXuiWkd+3uGgi/DTZrcseAPzw32s0y2t54QM1FzvDbtqiKI2d81kEMT7dFiyVeSu
         us3yRxGDf0XKU9QAlPHLg9P3c9HpHHHu+hJTZcbf6ZV+bLIAII7RkqDOAtFnnRH9coyq
         hIdQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yWf6tqfX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bp30-20020a05622a1b9e00b002f364655293si8616524qtb.697.2022.05.03.09.28.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 03 May 2022 09:28:42 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=yWf6tqfX;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:53538 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nlvOD-00073E-ML
	for alex.bennee@linaro.org; Tue, 03 May 2022 12:28:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46048)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvL3-0002EX-HR
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:25:27 -0400
Received: from mail-yb1-xb2a.google.com ([2607:f8b0:4864:20::b2a]:33393)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nlvL1-0007sH-1u
 for qemu-devel@nongnu.org; Tue, 03 May 2022 12:25:24 -0400
Received: by mail-yb1-xb2a.google.com with SMTP id j2so32056009ybu.0
 for <qemu-devel@nongnu.org>; Tue, 03 May 2022 09:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=1fiALV16VmK25BHaY7dI492agzHdhAmJ3CtIdS0HzSU=;
 b=yWf6tqfXqFugsYiN8JQ1ujwIsXpC2gNejdUS0EB/rEW8IZxugcw4bY1XqK9oQnOrmo
 grFo/g64JzqAlmDvpKVHWc4x7QIgK/NRaWqSaE7O2casMRza3JMmMugYCMTrUP24Cb/g
 taYN6nYO3bhFowBG59DvFrPKf2kdcsnwIAX6wVWx5h+6vt84g/tB3YlSCLpXn1Cu8aBK
 e4ebiPjwIAve8OWNrTf+viH6of36FpSNLceRTiVomN+Y8gTIIuLVEf3G3LWG6QbEJgcs
 P8IhwqqqGDioCIV2MTdzdWNuPw3/Q8EBhazEGx8+EITgQ+nfxp7I+F7seACwFX/W52Bs
 h6XA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1fiALV16VmK25BHaY7dI492agzHdhAmJ3CtIdS0HzSU=;
 b=UkdaAZXAqIhqG3Ol6y4WeevVfFbLMOOiFucjK9tImt4sb8M76GIyR+sYNvV8ElHQAN
 z0kTCGw21d965580xJvMc5D/qUF9UlbhYRjr3XdSrHUIn7A7GCpp8z9E7jTSPgNw5pme
 /9a8mR8KE+P/p8J3U22ZO66bG5JXWtugFIx00u853WPEuuXUuT5vZ4yoJqVksL306Dmz
 ZqFmSnA/6xx4GnsbXccNA1dZXGO6PnM8cKc7xb5I3McbBoD4k1E8ZOibe1ssIj7TNS4s
 nK6OFGBCh6m0EFBcHnokXUXS03AyzmjbVncRbPm9Ysrc69FtysSLrUxam5Uq8HBg7otL
 hp1g==
X-Gm-Message-State: AOAM532f04RjIY5AAAZHaJ/3OWBb8CzDT5pkufGzN6WhFnY3XZ5MyhS7
 eXVQEIWSRJ4iKtf5RHumh29GceaEW7r0zRHVz8sybw==
X-Received: by 2002:a5b:6c1:0:b0:633:b5c7:b9b7 with SMTP id
 r1-20020a5b06c1000000b00633b5c7b9b7mr14572879ybq.67.1651595119915; Tue, 03
 May 2022 09:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220501055028.646596-1-richard.henderson@linaro.org>
 <20220501055028.646596-20-richard.henderson@linaro.org>
In-Reply-To: <20220501055028.646596-20-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 3 May 2022 17:25:08 +0100
Message-ID: <CAFEAcA9LNL8B9Bwo0O5cdwJ1GGri=D=_-dgLX=S4y_3_ObyxYw@mail.gmail.com>
Subject: Re: [PATCH v4 19/45] target/arm: Remove HOST_BIG_ENDIAN ifdef in
 add_cpreg_to_hashtable
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2a.google.com
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
X-TUID: yauSYUshIY4I

On Sun, 1 May 2022 at 07:18, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Since ee3eb3a7ce72, our host endian indicator is unconditionally
> set, which means that we can use a normal C condition.

You mean e03b56863d2bc (ee3eb3a7ce72 is the TARGET_BIG_ENDIAN commit).

Otherwise
Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
