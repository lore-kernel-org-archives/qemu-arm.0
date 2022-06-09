Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp437121lfb;
        Thu, 9 Jun 2022 06:26:11 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxdzvSWF6F8k5sxXRd4cEnRSW171F+XO08PQEIzsVao+aIIwS1rmQwCWf2r3WMQtxbyWSg7
X-Received: by 2002:ad4:4ead:0:b0:464:579a:e063 with SMTP id ed13-20020ad44ead000000b00464579ae063mr40814229qvb.79.1654781171019;
        Thu, 09 Jun 2022 06:26:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654781171; cv=none;
        d=google.com; s=arc-20160816;
        b=I2Iq3/E5jeJSZLlJ09OpTTu643QlWQ7QUjNkE5MU5cz8J7i67j9eKsOOb5/V3f9IcI
         zJDmJan2wGYS/j8DokpBkoMXc/5M7pJMiQsbuTu/BVI0TuYiMUjM6Te/jQt6slREip4u
         Yxk3y4ESQ1R6mXP2PTKwTdXFrMPmfDMkomkBLUOyrcSc3pQugF4ZNWc/XJxI/11xf7Xr
         OhbJ9EIejUJUmaDL8fAAjCqFXUkO7poXavT3yqodpZnu/dQwsRjsaKMuwm+EBkYtz6sN
         p+HGjcIByEIeL6Ji8JJ6d5TKjFg6KjPoTbxbsJlra2mKkbAFm+VbgG/GBaB8CW/kz6fm
         jmvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=d/daiqU20WuSLhZzm2pzQu7/oPg5pIxPEgGBkydIoUo=;
        b=ruSc0is81zde33RMvHPgqQxWbdwM1+YT3HdE2ltxqO6m2JtwD14yIgXYuPKBpXsVv5
         c0HnE7Ztlf4rL9vbHQUtnMr2LCtXiHv+JyoWbF0P6klhQSBvYRp2yBA++V1KFKCUUhT2
         VeDhlyjzPWqoaUC5kwDNWYU/aAIzzBXrVz0eB4ZZi//5kU48X30B1ZIz2pkZVKGe/A6n
         wcy2ukvBkRhBCOrgz/sv+f9jpSimrGFGOr0DXW4EBHtzZ/jmMIqyoyTiv+zHNaDJEF+Z
         CutDFxtOwfw1Eyj5iveMjEOUmyzKZey0DsAQ1LBjuoQcmB9pPa3qw+A5T9iVBlT8FxcJ
         isAA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JgLwJvSE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id f3-20020a05620a408300b006a6af50de9esi8966975qko.47.2022.06.09.06.26.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 09 Jun 2022 06:26:11 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=JgLwJvSE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:43558 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzIAs-0006oJ-GB
	for alex.bennee@linaro.org; Thu, 09 Jun 2022 09:26:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:44258)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFzl-0007lO-SE
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 07:06:38 -0400
Received: from mail-yw1-x112f.google.com ([2607:f8b0:4864:20::112f]:40758)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzFzk-0000gz-Cm
 for qemu-arm@nongnu.org; Thu, 09 Jun 2022 07:06:33 -0400
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-30c2f288f13so236966837b3.7
 for <qemu-arm@nongnu.org>; Thu, 09 Jun 2022 04:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=d/daiqU20WuSLhZzm2pzQu7/oPg5pIxPEgGBkydIoUo=;
 b=JgLwJvSE4e2zagGMHZTlLbw3TwLeOJ/FguVkx4Tv2fzjfFXn1Uql1MEzdSlhk+a2ip
 c+Xme188DC7GLK0k3j3altDK1P9MY3lEGbUfgDmO52OVI3/fDJVz6E3FRigtG9HCHmNF
 WQ0vMQ9tVnrHFCmtFL05W+EG+LjbhN05V8l7rvJOETfO8WdqVwM6HV8owsoicGfQkWsF
 SpkQiz62qsf7tipxObOYMvx8OLLnkHf2hFEiP9kBLzngSaitsZPFArataft4a6cMDZIB
 e6qQ1lonoxeToFlPl4nc0K02nWi49wq+vO9FI4ium088Q3KzHMR+LG6qA/9VsEqO75qC
 aWKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d/daiqU20WuSLhZzm2pzQu7/oPg5pIxPEgGBkydIoUo=;
 b=kl/NumK4Sx2O4T5ayXzYojuKG0jEPUHypxFNNwScIHEsyj3LAVS4TFIQdG0ci2T5oM
 o0mmHaCrtgnwvk/drMFtNEqzUqvHU/jgfrmjN+6yXulF7EruWBLt5CQ6x9ovCel6C5sd
 SFbtlBzGgk14iizzzmT/JagsdLHayyaBkzar3UxwfqFgx//Oq/Cqc+DRrmDix6wxMNSX
 jzUrCZ6vEBmEc/uYF7dFhffL1i/PsktFvrSv/d06rDxUqToKGM3eJDvbgsE63Wm17sDU
 jvzgPgPGxXUQ/XOyE6Ihl0HvxHPhUhe1tT2zRgsn6TUOdkUpjn36lI68EEhtcGQFcF9t
 ZJzg==
X-Gm-Message-State: AOAM531oDaZ2nXy/FyG3rEPv5eESny6uaxTk69KCakAQoMKgbcn3fdqZ
 XrUSIDVb8/bTKKHjPMI/WbE4brqYTDLDY9wpkXBtLg==
X-Received: by 2002:a0d:cc8e:0:b0:30c:1230:90c with SMTP id
 o136-20020a0dcc8e000000b0030c1230090cmr43923657ywd.469.1654772791429; Thu, 09
 Jun 2022 04:06:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220522181836.864-1-mark.cave-ayland@ilande.co.uk>
 <20220522181836.864-36-mark.cave-ayland@ilande.co.uk>
In-Reply-To: <20220522181836.864-36-mark.cave-ayland@ilande.co.uk>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 9 Jun 2022 12:06:21 +0100
Message-ID: <CAFEAcA9QrjOMx22G8+nHf3Po5aZDB9KdssrzddOUqY-0UCi3CA@mail.gmail.com>
Subject: Re: [PATCH 35/50] pckbd: replace irq_kbd and irq_mouse with qemu_irq
 array in KBDState
To: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
Cc: richard.henderson@linaro.org, deller@gmx.de, mst@redhat.com, 
 pbonzini@redhat.com, hpoussin@reactos.org, aleksandar.rikalo@syrmia.com, 
 f4bug@amsat.org, jiaxun.yang@flygoat.com, qemu-arm@nongnu.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112f.google.com
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
X-TUID: I+R4D9SX9hth

On Sun, 22 May 2022 at 19:20, Mark Cave-Ayland
<mark.cave-ayland@ilande.co.uk> wrote:
>
> This allows both IRQs to be declared as a single qdev gpio array.
>
> Signed-off-by: Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
