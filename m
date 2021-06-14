Received: by 2002:a19:f807:0:0:0:0:0 with SMTP id a7csp1860968lff;
        Mon, 14 Jun 2021 04:05:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkyOLj8oCRwuHWHlmYtPenH20oMbDGq58KKhQV90Ce+5kqhXdpgQWivQafivEKG84OI0rs
X-Received: by 2002:a17:907:2648:: with SMTP id ar8mr14584234ejc.521.1623668723056;
        Mon, 14 Jun 2021 04:05:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1623668723; cv=none;
        d=google.com; s=arc-20160816;
        b=SNLZt61Mvm2IA7l3t2vBrvXy4MqtBwvxr5vA86TrdpF9jPWAiUHd+Fqgjwk6o+Qr5K
         3udX2henFGhTlcICdJXXNeGG0hI1BgR6BV7esi1ygZCps9IuEu3VJB3qp3IoBspnDyIp
         zSR29wme/9NZF+zclVaeDSo+ZdnWtZPmzKob5xVIb3R8+rEzR0O6dBG6ltD9ZheC+m5c
         8EMhoDpvzoOqTJmfwqeUbSPEpuDaL+JQKoRvThMmrp7frZ12IKPJLevyJ8sbG3kzWRi9
         7gcYwN3SBK86aWo/3kVGqY/WUOouK98ppWTjYZh28IEGQLmHJMksDiQeQFS1WUPBLokz
         4hDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=E3xvEQx4cPjshDFhyeA5Zcglt5CZHRCgNfqmEMNvzBM=;
        b=LvKlXHJdAcWrb2G6+8CSS3LdGhKp3Acc3pJwpaKHXzYBPyi1ZRYLmrzR8BRcmXxdqn
         +/0HammwPw5L3EyFz30p0rT84wWCyyryqGwFGVTQ2Sc9IS1cxougCAk1sowdWAEpypMK
         DQfD0TfdPrgz/zfsDCwWKh3ndJEFVBYAiY6beTD7+4SSqHoF03A1dr5RE7J6RUjEJ2Do
         RiY10kMSS1VAKK7ii319G3h7TeGYXXbBExX0hjHJu9MoKgJfWA0/A9ZCfTMTswW7SDWh
         kX191QwFV7Ibz57+VwLXhchofu1mVVoNH4VoKjhuvUZr5Qz5swQDxGBPHGvRQtK7AHgE
         xx8g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K/nRT6Sj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id c6si11006927edv.157.2021.06.14.04.05.22
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 14 Jun 2021 04:05:23 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="K/nRT6Sj";
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:44748 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1lskPC-0003qm-7F
	for alex.bennee@linaro.org; Mon, 14 Jun 2021 07:05:22 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:46690)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lskP2-0003qe-Kj
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 07:05:12 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b]:37666)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1lskOw-0006fM-28
 for qemu-arm@nongnu.org; Mon, 14 Jun 2021 07:05:12 -0400
Received: by mail-ej1-x62b.google.com with SMTP id ce15so15962485ejb.4
 for <qemu-arm@nongnu.org>; Mon, 14 Jun 2021 04:05:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=E3xvEQx4cPjshDFhyeA5Zcglt5CZHRCgNfqmEMNvzBM=;
 b=K/nRT6Sj8X78f4ZqWwgi2RQffRLjkqvnAl57Xu5oih1GTIhcpSK0HPGqEtMibo9PQu
 JwTPFFGs15arAh+B0+mk2zs6flJvMioSUzEztv4cg4FPhyRPA/29Rg7GmE0z+7fvZAIv
 eMgKAopioOYajgFFddsIsisNzVU1FHnhPK1/9WWVxu0bzyPA4FokGcY4van1lfCjOK49
 IjeOAp1rwiMqDZ1xTt5VoH/7SGlCRx0ko90aPdBE2lBcw3gUoAMgWhjwLqypstcL81q5
 Z3F72/1iu/H6JoLiCCi4sCy+1iZeua/JHa4PFYVMou5s0vz3Df04uElr09J/YA22DMfU
 gdLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=E3xvEQx4cPjshDFhyeA5Zcglt5CZHRCgNfqmEMNvzBM=;
 b=R+C68YCFeF5aX/WMoZqfrcQsFhntxkqsHobMWDEF4kPoqKUaeULsVmQWmtNzIiEkQ2
 d0uv2r/GFTc1tIkoEtal8g9VmNQuGA4M62ysM2MduQ1oJ1Yv1djwTaKYnL7U9FwsMXgw
 eTkrXA9VAhOFhW8Yn6yCaVREySYLFPEbqNk3hLJsA6p+zuTVSbb9rHZwJQsPXdsADv3r
 uudrpXJBba618OzaLSbb657PTY262vmymm2QVbEMc+Z2stLu+GP20Iiltt4s74oZbLZo
 Vp5Nzxca91ncC654EHeBxzT9CdQn5Y1zFfSDdDRdIc9m8zcB2S9+gk2CDSNuhSdcwa37
 LVTw==
X-Gm-Message-State: AOAM530Je+M0EIRd8UQvrJs+jTvCfe8sIl7jbcLbfunuuYY203L2kVlr
 W0ZGml2bWrjHYriR/xcsnYIF+sqQB3tZ/3jeg18K6HdGKp8=
X-Received: by 2002:a17:906:a108:: with SMTP id
 t8mr14554157ejy.407.1623668704368; 
 Mon, 14 Jun 2021 04:05:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210607165821.9892-1-peter.maydell@linaro.org>
 <20210607165821.9892-44-peter.maydell@linaro.org>
 <5aaa6d24-2b1f-0cc9-5bde-cf0fe73cc55b@linaro.org>
In-Reply-To: <5aaa6d24-2b1f-0cc9-5bde-cf0fe73cc55b@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 14 Jun 2021 12:04:29 +0100
Message-ID: <CAFEAcA92O_8E6CortSu==UHzwWC5-ARbP5T=H1Ok5zZC8tnhrw@mail.gmail.com>
Subject: Re: [PATCH 43/55] target/arm: Implement MVE VQSHL (vector)
To: Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: FKxqC0UC0ZxJ

On Wed, 9 Jun 2021 at 20:26, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> On 6/7/21 9:58 AM, Peter Maydell wrote:
> > Implement the MVE VQSHL insn (encoding T4, which is the
> > vector-shift-by-vector version).
> >
> > The DO_SQSHL_OP and DO_UQSHL_OP macros here are derived from
> > the neon_helper.c code for qshl_u{8,16,32} and qshl_s{8,16,32}.
>
> Ah, from before the sve2 merge, and associated cleanup.
> There are now helper functions in vec_internal.h for this.

Ah, that's helpful. Annoyingly, the helper wants to take a
uint32_t* for the "write to this when saturating" argument,
and I have a bool*...

-- PMM
