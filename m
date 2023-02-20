Received: by 2002:a17:906:da85:b0:8b1:202f:4753 with SMTP id xh5csp2445910ejb;
        Mon, 20 Feb 2023 08:51:43 -0800 (PST)
X-Google-Smtp-Source: AK7set/HcJsmsgjhSjNAjJg1m9nVQAls6FIAqh69Ax0yiIb38IWEeEEPwRiCAUQOCV9lHbcS1sgc
X-Received: by 2002:ad4:5aac:0:b0:56e:b251:a8e7 with SMTP id u12-20020ad45aac000000b0056eb251a8e7mr5732169qvg.2.1676911903168;
        Mon, 20 Feb 2023 08:51:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676911903; cv=none;
        d=google.com; s=arc-20160816;
        b=HHXU3CfTQAl73NQHg4QH4hRYfbLxnp8jQAhHTWtp5NQZZZZPw56/c/4XMn7hL1UWJB
         CjP1uwCLTg17KBS40HnaQZ6YZad+vvVZGymPjfQ2EmL6j5cUtjInJ44QeajIuQ9vV36L
         fQOfGIpp6YgB8aSf4ZG/CFoMGJqGuEsa4P7z04Gkz/YChHhMEJ3TZPQL1dAseVrESn/w
         TL8fkbj1lu9beovKpwjm2WJ905o5kjW6C1xs9UWH+CST/GtVItTaQ89EJB0yoiH0Z23l
         +/IxPcDmit8e9jdsGmJsCBUX8apnowEj/hLZpOeK0PqN0BM5gbhxsBIKly4kaYoyFjKG
         K+dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=X5FJk2ng5r/hBG4SF/doTLdyE8K6R1FaA/ifVw+43fI=;
        b=W4PS8wBlAspnlAdNIpd9/n3MfW4OBwYHRa1ZgZPIfVea0tGiz5HgNO+rqHrVY/F0B3
         WTcdqfUh1JDE3drHMcSUmotkwyBP2L8m8nfypYVbRBrBQNKDUsH00B5sYHGieR5YZIjA
         9oi9GQnRycMElhBQn9M74gKmUbZfOYEEBjAxPtZhfW8Tzpq9Rw33AwQuiV1xrr2ubkjZ
         PPFnlzfR+xqNvZJrufbepkS/SG8Rc2h2JHygvTVAUENKy9ZvQdt/j5jlgOqMthtZfcj9
         zn9wwoybhLrFVhdVB/rvzJHCUfrlIGHa8SZ63ymfxXOhpslXFs1X9XAwGd8GkO/MlbY6
         7YyA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Q3fUO/gc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19-20020a370b13000000b00734f32bbe6esi536500qkl.376.2023.02.20.08.51.43
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 20 Feb 2023 08:51:43 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="Q3fUO/gc";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pU9Ny-00058k-Mt; Mon, 20 Feb 2023 11:51:30 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU9Nx-00055v-2D
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 11:51:29 -0500
Received: from mail-pl1-x635.google.com ([2607:f8b0:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pU9Nu-0008C5-Hj
 for qemu-arm@nongnu.org; Mon, 20 Feb 2023 11:51:28 -0500
Received: by mail-pl1-x635.google.com with SMTP id h14so2299603plf.10
 for <qemu-arm@nongnu.org>; Mon, 20 Feb 2023 08:51:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=X5FJk2ng5r/hBG4SF/doTLdyE8K6R1FaA/ifVw+43fI=;
 b=Q3fUO/gcn23baHjpsSNZIXSgsQTa9uGUjJfV5NQ6SGXOTMpd8vU2FZH62Uo2uthuaN
 xMHWASG/MYgJahQpczevW1Oc/NCYD2o4NCFjTSqjq7jMxH8Q48w41qQNaSnQyo5R4h72
 hJ4CAN/WS5DDn/LnvG6Ks3ceJ4/33OTpVKHoh3XnvUvrExeWj4l9Fgl2mKqi+Qbxi9pO
 wuASpnYq4SiZU/1KiYzem3uRcFKDaUsuR3B/T9/G3tTflBm+EanHWPbqvI2HgJS7oArL
 BU/GTucqIYbZX5PcNSTcfPQYOTglIZfcC1VAnQ1ZEp3xZgWQeqd9SelfWUHS71njF8Nk
 2gIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=X5FJk2ng5r/hBG4SF/doTLdyE8K6R1FaA/ifVw+43fI=;
 b=RJRGYkkCczs4f8D0zRt4/zZNrlOgfzVgwnO0xYnZIClcQu44Met3A3Ab/jBaq+f1ym
 HJMASOpqWoSGeeKAnUYh4MQeMyRz7oVR6oHxI1Lmdt9TZSYJcFflZ3jwrXTIyvlXCNo4
 pp0SOtdIvwHZviLbs24m6Ut/BNt18jzgIgkLqkoDO7B1MT6Gx/wIoeJDqhILKNwKsIWL
 F0sp34qmRf+YXqvJLlSR7rDTk310gf1Za9sPWxsjbmqYprrQy9mhgcUL4Qtd+DkIgVkP
 yERpNgjS9FD+xj5mF6ZUnbW202BfEnRAG8Y7/Hb4sihGQhExtO21cEh3ERXkP07dFU5V
 xDJQ==
X-Gm-Message-State: AO0yUKXc0uLR+c6/08RuS2ttDoBGfT7o2jrHzXqRzkDntSvZuLfRCXNY
 wuOvsNIcK2PX+EXJ0LY7Dijaewc40Ed4euiEo42M1w==
X-Received: by 2002:a17:903:4285:b0:19a:efe3:b922 with SMTP id
 ju5-20020a170903428500b0019aefe3b922mr231233plb.9.1676911883512; Mon, 20 Feb
 2023 08:51:23 -0800 (PST)
MIME-Version: 1.0
References: <20230214163048.903964-1-richard.henderson@linaro.org>
 <20230214163048.903964-14-richard.henderson@linaro.org>
In-Reply-To: <20230214163048.903964-14-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 20 Feb 2023 16:51:12 +0000
Message-ID: <CAFEAcA8bC5kR9Hg60MvrkQEDrk5-bf10=bcn=0GKr_h=nwiHpg@mail.gmail.com>
Subject: Re: [PATCH 13/14] target/arm: Export arm_v7m_get_sp_ptr
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, David Reiss <dreiss@meta.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-pl1-x635.google.com
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
X-TUID: 8lgnMpfw0pVL

On Tue, 14 Feb 2023 at 16:32, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: David Reiss <dreiss@meta.com>
>
> Allow the function to be used outside of m_helper.c.
> Move to be outside of ifndef CONFIG_USER_ONLY block.
> Rename from get_v7m_sp_ptr.
>
> Signed-off-by: David Reiss <dreiss@meta.com>
> [rth: Split out of a larger patch]
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/internals.h | 10 +++++
>  target/arm/m_helper.c  | 84 +++++++++++++++++++++---------------------
>  2 files changed, 51 insertions(+), 43 deletions(-)

Depending on the ifdeffery in patch 14, if all the callsites
are inside ifndef CONFIG_USER_ONLY then we won't need to
move the function definition. Otherwise:

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
