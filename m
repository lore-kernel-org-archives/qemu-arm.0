Received: by 2002:ac2:51c9:0:0:0:0:0 with SMTP id u9csp165775lfm;
        Thu, 20 May 2021 06:25:29 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzfhhWyVRDw2GPtRWnk2XGgU797lqRU3EOIlV6DGRMMtm6n80I5Q8PGJb83HJPpbQjuH6Jb
X-Received: by 2002:a92:db03:: with SMTP id b3mr5889956iln.219.1621517129316;
        Thu, 20 May 2021 06:25:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1621517129; cv=none;
        d=google.com; s=arc-20160816;
        b=gE6Zoe2mvn/Q6PC2o3c6AvEHR2NYnB67y5NY1xmuJFe4NPDOENr+zsIr/RnIHNG8kW
         iXodI1YUEqGRSxEhB8gicr50F/TpmkHrkuJi8FSMVFZEAKs2UmWI75Z20vJOJHojPTGl
         GRcVkRdKWGCh64FkPpGQqI/Cr5WUymJ5aS4j1kmiLmeofI51JQyIhm1fmp3SFJaPUtKq
         QxfCdqdLBvmzSAuHOIbuURIdPSsahMZNVPKBbEOzuZGJo48LZT1uodYPtvA6rnZAxWt7
         Jak/bwu8WnjlKg896/qOmVIA2qR+BjjWnfJumznNajK7d8AAZOZrgfgwYA6+yS4fTle8
         hFlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=q7nhkV8dR1gqqYkRQBangM/CVplsjsHm8X43lQFIaN4=;
        b=dZUI3m6tWh4BIgTLkpVBRB4qOkz3iaRCwojrwomYaIyM7maMZbP2pubSJPsafwxHKb
         mqQ8yBYL37tqNI30yARmMwqbYXERJyF+UrSJvMS7UoWMpCcNToxZAfV5SwtjqXfo49Yf
         JKFYVUsQNZoRC7r0q9n9ipqhbUumyXPxP7ji3j3qQ5swnNKmH4/8oue3OtJfi2HiwvHM
         Vw3J8FnIwyqEru6NyIXWpp/t6Yk5VGJsSvfyyQUGW/KEak1Uz2q85ThBgHnuPVvTwl0D
         bYMWC+ZHlAdRGNsXyWPuouCHThpIrDu2rEHmaaussAzX2E3eyGmxrgYAB4Mz0hHw9cGf
         b92A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K5m6Af5E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 19si2519009ilg.27.2021.05.20.06.25.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 May 2021 06:25:29 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=K5m6Af5E;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:33216 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1ljig4-00018O-KB
	for alex.bennee@linaro.org; Thu, 20 May 2021 09:25:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:45414)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljieH-0007jG-Vy
 for qemu-arm@nongnu.org; Thu, 20 May 2021 09:23:38 -0400
Received: from mail-ej1-x62c.google.com ([2a00:1450:4864:20::62c]:44830)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1ljieG-0002B6-Ca
 for qemu-arm@nongnu.org; Thu, 20 May 2021 09:23:37 -0400
Received: by mail-ej1-x62c.google.com with SMTP id lz27so25240369ejb.11
 for <qemu-arm@nongnu.org>; Thu, 20 May 2021 06:23:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=q7nhkV8dR1gqqYkRQBangM/CVplsjsHm8X43lQFIaN4=;
 b=K5m6Af5EnC1QFJaTFu/+981ZG4I9HbnU83bNxHeQ9+p9+pNihO4m4Ob1pbZQX2JJ2/
 IR2PWJmU5wSEYB725LuewoX7BkxZD8Vc4QMfBDrJ4oufbdmAYO8jkOxY4BXfAwxP9DJs
 owcapw+Iz3c1t9p+QJNh7xoOWfgleFAHzwghx6gdZsGbQi76d4fA+bhTG7DobgSamQIs
 F4nbsa7V0gtzj7UB4LvVtXH+g4i0BSfj48PrjKu3GgkITZFOgb2U2SrsozTHE4p3A98l
 GA0DZdMMkVGJiVBiGZqjj18jNJeJLa/Z7dmivBB8dmcgRQmXG1lkktbnLjk8XaKcvqEW
 A4XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=q7nhkV8dR1gqqYkRQBangM/CVplsjsHm8X43lQFIaN4=;
 b=NSmJRu/oPV8Fk2tPZ3x7fea8PlnVsG4mSd9RaNKiheLuApuRemLljVQxjciCgeip2Y
 tS2KEn4Y8g3CseVxFI7khCmk1GRn58tcbfBw0YgiJFRvatpgR6GAzj+Jzpy3/yAvCQlz
 lkNENmwyb/6nt7jI1LSKZMMBRAw0RjdlqSFHpqTBTRB/uImp51+7c1Fm4PHDxbKqLtcs
 TnOZvYhf+SvclAh4As7Zp+njpIK8Dfhqf8PyL6wyEq3mkUysf8fcOlfYzw1ALwQIVn2z
 IkFFGeGQIuugl7zhiKLCbg/uWI4RXPHDsMP67K6kWkB+PDnVOLwqHjmBDDfaRFfavlaq
 cjWQ==
X-Gm-Message-State: AOAM533WikF5gYTh142etJCoOGJBGIiCPQxwWEkt2NiZvSjgv1g4XDEg
 e8HVLSB892Zr4i+ZiYcXAnLRd6DGeUsgYwiKg6wRLP7zZQQ=
X-Received: by 2002:a17:906:b74f:: with SMTP id
 fx15mr4707742ejb.85.1621517014894; 
 Thu, 20 May 2021 06:23:34 -0700 (PDT)
MIME-Version: 1.0
References: <20210510190844.17799-1-peter.maydell@linaro.org>
In-Reply-To: <20210510190844.17799-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 20 May 2021 14:23:16 +0100
Message-ID: <CAFEAcA-WwZTSGx0tg1msLw2BeFvwdv9_45tEL1gtFntN2MDoTQ@mail.gmail.com>
Subject: Re: [PATCH 0/6] hw/arm: Fix modelling of SSE-300 TCMs and SRAM
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62c;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62c.google.com
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
Cc: Kumar Gala <kumar.gala@linaro.org>,
 Jimmy Brisson <jimmy.brisson@linaro.org>,
 Kevin Townsend <kevin.townsend@linaro.org>,
 Devaraj Ranganna <devaraj.ranganna@linaro.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: IdxneEKBsQoh

On Mon, 10 May 2021 at 20:08, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> This patchset fixes some bugs in how we were modelling the
> TCMs and the SRAM in the SSE-300 which were preventing
> Arm TF-M from booting on our AN547 model; there are also
> some fixes to things I noticed while I was in the code.
>
> The specific bugs preventing boot were:
>  * SRAM_ADDR_WIDTH for the AN547 is 21, not 15, so the SRAM
>    area was too small
>  * we were putting the SRAMs at the wrong address (0x2100_0000
>    for SSE-300, not 0x2000_0000 as for SSE-200)
>
> The other stuff I've fixed is:
>  * we were modelling the SRAM in the AN524 both in the SSE
>    and in the board model (harmlessly, as the board-model
>    memory was just always shadowed in the memory map and
>    unreachable)
>  * we were modelling the TCMs in the AN547 board model,
>    which is conceptually wrong because in hardware they're
>    part of the SSE-300. No guest-visible change, but it will
>    avoid problems if/when we add another SSE-300 board model
>
> thanks
> -- PMM

Ping for code review, please?

thanks
-- PMM
