Received: by 2002:ac2:4c26:0:0:0:0:0 with SMTP id u6csp294532lfq;
        Wed, 23 Sep 2020 02:44:52 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJycKxCOXsls40Fi0m0yNgUyd8enHDpNgRNow6KIZuWGdnHpuWd9BBSH4SuJHoaz7tT3EAom
X-Received: by 2002:a25:b341:: with SMTP id k1mr12580389ybg.66.1600854292782;
        Wed, 23 Sep 2020 02:44:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1600854292; cv=none;
        d=google.com; s=arc-20160816;
        b=qLpr78asgQ+PKc6f4eHxfTSOQPHqfReR8HJm1MMb3ntzhTl8TC1tW8FTrKaC+0XyTw
         SNQTaY9UkFzSuT/5UIgIC2b3hLvinW7JJdfkyTQR8Ei0beK6EiWBsVvDGoId/EiD6++q
         jA74ESyPO10TkD4RiaMvvPryGpDC/BUsKNg/Oy8GCix2U9LDFjFMJo3k2ZJfG68zWuRR
         SBQ9N/BhCNyXE6UUNUQavCYIaZgGna1r8Wk9eUzDpHqegWYZGnk/MUcnIAQjEqZI5NOI
         eIHL7dtqMwPuOsUxJHb5HNWPGzBkcnGMLe2sunGm4Srjfatx0y5yjiiuN9qmjkDATTQZ
         eAfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=1ZnNbtfupsgqOD1Yk7v80MSHT3FW/EvoYQTW37rAaFg=;
        b=kY/p8+9Sw38LISSLoqb5XghSakozgF677vJc3Dx1fJ+/6Q93PTZLpYDWEdz62Ez68G
         N3QDhXRJ5aJQcyZbtJlI5lVtp/s6u5YyurmOgHVcIHbG5+MxkPu46mOE2in2ZKNV0zbE
         gjos9/pU9nCsAkrj+tefHa9gVHjoMY19ui7Snj+6lljNG7BqG3mkjpM5ardAAD406MMy
         9Ge8SGg1iKYjuxAaljnG8mGMaIweIpHd38yqNACXGcK/5TafrXngNcR40GftHIDcfFOy
         0CilsoYfwrrFz/Upl89/kb/xmB/G0c7VOrvLqLY+ej27wS5xnSOE0pzd0sOFXSxQqeFy
         /4GQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NYA7V3ty;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id n132si9564798yba.57.2020.09.23.02.44.52
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 23 Sep 2020 02:44:52 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NYA7V3ty;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:52336 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1kL1KW-0004N7-72
	for alex.bennee@linaro.org; Wed, 23 Sep 2020 05:44:52 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:34486)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kL1K2-0004LU-TM
 for qemu-arm@nongnu.org; Wed, 23 Sep 2020 05:44:22 -0400
Received: from mail-ed1-x533.google.com ([2a00:1450:4864:20::533]:42593)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1kL1K1-00070D-51
 for qemu-arm@nongnu.org; Wed, 23 Sep 2020 05:44:22 -0400
Received: by mail-ed1-x533.google.com with SMTP id j2so19122632eds.9
 for <qemu-arm@nongnu.org>; Wed, 23 Sep 2020 02:44:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1ZnNbtfupsgqOD1Yk7v80MSHT3FW/EvoYQTW37rAaFg=;
 b=NYA7V3tyvErG/mzxvWM1FuPJ4nHKY70lcpmmJGcHeMNUxvNfI2oTU3oGgO7Z1rUkQg
 3VWIL/LIq33qiz9pSumv4ubguyktDBhubmEPVPCzBQarV/L2PeBvkHLxOt1sxAHlG0Yb
 IvzZfCOacA3iwTDEnoPU+b3fPgPCh/SR653SY14Vzc1lkZdQyMLGDPy0CW4HkkU9UZsk
 j1gpj8KxtDCct/kWGOLpxgiHzscNRzRfVJjmNQWZxx1VVLIzALX5adioU6OvIXlmVevR
 08TGShddQAbGK9elvyJLRUlG3B916N5aDo1mTQWkNYBhAL/+RoFfwoMk3UoT/5OKpknH
 lF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1ZnNbtfupsgqOD1Yk7v80MSHT3FW/EvoYQTW37rAaFg=;
 b=eDNkBGNnmUB1X00cJKCpJVgD9Ak9IzclzRFFtxBdlAxsU5vZ0UNakSdDWGWtEHEZ6x
 BpmXGu1fO0nLmNs6V6/kfqSGXMoiBpqVlRo1CLmXVcsbh/a2+g5NVpjyRvsUgJ0nEaan
 HBx5Nc0Y1uRsLJIRm1FtSD9QMHAuV3hlRjyEhAervxMxcwzJZE6nog8WvbHrawvgbvAn
 cgcOQ/Vn4nqILg6xY92LTHKtHslnrw162YIoD60drDqkYtlry5UMrRPzVIjHIgGkgzis
 VEu/9aamfiZF0qUWGrnRGHVcx+vhBdfqhqR61eKP695n4bxMvQHDsFrXdtbwAyB8j3AI
 D7sg==
X-Gm-Message-State: AOAM530KYrThCEgYX9dz4dBrG1h0VpYCImiekZtiketBzyzjibr17YPf
 VNFkzRvVTqPUvCmhpvW6B6Ea9m0nD6KIR+Pdt0sg1w==
X-Received: by 2002:a50:e68a:: with SMTP id z10mr9047469edm.100.1600854259306; 
 Wed, 23 Sep 2020 02:44:19 -0700 (PDT)
MIME-Version: 1.0
References: <CAC41xo2yEoDvy15yExroY+ZX+qQns_rxQiqP9D2Xo3dqquP7KA@mail.gmail.com>
 <CAFEAcA-gMfOntN=up20vjF00Mbf0MOeWyTWufmcZ9E=AKKYWEw@mail.gmail.com>
 <CAC41xo0mWv4LoHbzvxkq+vhw=kn8iyi2vhgZhv4vxODmJcnngQ@mail.gmail.com>
 <1bfa78a6-b478-118f-c284-466dcddde468@amsat.org>
In-Reply-To: <1bfa78a6-b478-118f-c284-466dcddde468@amsat.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Sep 2020 10:44:08 +0100
Message-ID: <CAFEAcA8OhKmg5R=h4E4qO_RwPGbP50p711j_zjoSY-fhjeMAjA@mail.gmail.com>
Subject: Re: gicv3 maintenance interrupt not triggering
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::533;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x533.google.com
X-detected-operating-system: by eggs.gnu.org: No matching host in p0f cache.
 That's all we know.
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
Cc: Jose Martins <josemartins90@gmail.com>, qemu-arm <qemu-arm@nongnu.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: VkvmbqjxHiwO

On Wed, 23 Sep 2020 at 09:06, Philippe Mathieu-Daud=C3=A9 <f4bug@amsat.org>=
 wrote:
> On 9/22/20 10:46 PM, Jose Martins wrote:
> > I've compiled QEMU 5.1.0 which I configured using: ./configure
> > --target-list=3Daarch64-softmmu
>
> You can enable a trivial tracing backend (displaying trace events
> to stderr) as suggested by Peter in (a) by adding
> '--enable-trace-backends=3Dlog' to your ./configure.

That does work, but it's much easier to use the -d trace:whatever
suboptions, because those are always built in.

thanks
-- PMM
