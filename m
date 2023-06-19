Received: by 2002:a17:906:494e:b0:982:8c08:340e with SMTP id f14csp2706686ejt;
        Mon, 19 Jun 2023 02:22:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5lTEiIXq8dU5BuQrXhX6BSG0vgGeEOqY89gJrG201p8+fUN+nadA8ML72muRvv3zeBAsRS
X-Received: by 2002:a05:620a:4606:b0:75e:c200:fa8f with SMTP id br6-20020a05620a460600b0075ec200fa8fmr10869255qkb.29.1687166539098;
        Mon, 19 Jun 2023 02:22:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1687166539; cv=none;
        d=google.com; s=arc-20160816;
        b=o1UtP+0pHv41V2IS3jd8pEAwu/ImjvNOW2p+gQgTT1Whgtj36lHqsGLu+XQB9spd9y
         as9pclXQ7+8+s4nYLJ+7922awM5SMTz3mROEJVtP5De8WZ35iV0fn7rJsr/3YRj0NJkf
         As1XdF8zsMn0ePoPlECwNAyOOmxeM4NjwLxpWu/jOGahD/uvVMDV91WoV60ea41BvBtR
         Pv2ESptrDW6yRKDWZ43C4CutIARv4fRR3dHN9faeAElmwgqWLktkO1vkadEgWWkrgDD0
         YK/uH4iQZ675tri4q5dAKk83B8oPM2kGDNmHED44cpRtIKJAX+gZAduCF4eKy8gTZ3sE
         eMoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KCnoTN2GTnhN3pD24DOt0QCvfhzASjQbjXktZ7uERKg=;
        b=FxjZIxLhDCh8d9JQgd1FdldpeJBM/nDuE/qF90CoQ+q8qGNpUQkbLbHrb0IXmzBXzk
         NX9o47DthTgLZM2NM/GKs11T2wWdepdps8mr+3RG5AOIsMlCEUPAYcf9K9oSJUX7vwQY
         hhipedLTAYxgXzK5UL4ygwHo9rbEq4umLvASOMOaXtj49l+dUUkFpsFJthkUrS41KrS2
         bhnYhnPUOUtoYEkvPrrGNlZmxB6dPm3Ygte+g9879IKfgT31ai2ny3hgKf2IcX38JfiJ
         eYhU6paCOiC9RSVJ9Rt0l5kI9wSyPMq2mIVm+3TAL8gMkpiGS6m9dvEcRXCSjPbebLXY
         jItA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cKDKW7Yp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6-20020a05620a070600b0075f02d4d588si10939870qkc.117.2023.06.19.02.22.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 19 Jun 2023 02:22:19 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cKDKW7Yp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1qBB5O-000673-1b; Mon, 19 Jun 2023 05:22:10 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBB5M-00066q-3d
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 05:22:08 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1qBB5H-0002iV-M3
 for qemu-arm@nongnu.org; Mon, 19 Jun 2023 05:22:04 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-51a20c744ebso3814785a12.1
 for <qemu-arm@nongnu.org>; Mon, 19 Jun 2023 02:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687166520; x=1689758520;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KCnoTN2GTnhN3pD24DOt0QCvfhzASjQbjXktZ7uERKg=;
 b=cKDKW7YpJZ5fsp7epKYuo4hkiuEwfiZIZMHBtZPQwJ6OLSCCnFyhlt6dsCE27INGDq
 pG1Z9opmIiOGrGknx9SvXBZxbjkURVH4YKoL+eahod09UyXVSiI4DqyOTlFeWatkyNAj
 p3bufD3RKaZscln0xen12qv/w6sNaJ7Yu99C713VJ/1U5uB0669RREXQFICdMQjQTZxg
 hngUYdybl46z1OO7drq1cjqRw102Hlfgud16uW0NKwM64G0Ag1aHkKkaYlVHlZsTL0yJ
 dzG22KgzYrCjtPS0faw4mTtd82JANvcC6dwkPBBmJWInGYBIsIggW0LZn5H3fSJJP3dQ
 o30g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687166520; x=1689758520;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KCnoTN2GTnhN3pD24DOt0QCvfhzASjQbjXktZ7uERKg=;
 b=VDONwTCe8EA865dRF0etzAKzLBBtvMWeclNQ43M3oQB3u8k42hZtmWktvPGxjRyVrj
 LD1znBVPvEUtCJeCralkDWnEEdXkT95s8ytRuBnQYmNtuqybq1LOgzqYONv+L0D17A5t
 fl1v8ZxznIZl1BoYpw/JRnn3wAwYbm75ALw8RdRId4Nf5iAOUxzmwl0muTkjhefQiZ8J
 EwWYuPHUOmuRedBafhk6NC4IWVPiuT5vEzTIszt/aBv9XBpWVOcbecW3IzgFWYbwVfdF
 gwEm1X3ifgcnzhM2q2i1HPY/QO2F6UNv7bAbbdEZhsa1mADF43sj/XaYGNzTucZdY2d3
 2Hdw==
X-Gm-Message-State: AC+VfDzMVJDWHOp7qMB1+xmtYbDfr3A5aQAevz4cZ9KV0hD0SsJpS34e
 lvdssToPok66U3cSQUGJ4shfLRDrR1wh2r+gQOyflQ==
X-Received: by 2002:aa7:d9c5:0:b0:51a:593e:3d66 with SMTP id
 v5-20020aa7d9c5000000b0051a593e3d66mr1497400eds.42.1687166520359; Mon, 19 Jun
 2023 02:22:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAC583hEYC3V2XGg6af=Ai=JLpTxkV74kT98XMNNdT47m8ruS4g@mail.gmail.com>
In-Reply-To: <CAC583hEYC3V2XGg6af=Ai=JLpTxkV74kT98XMNNdT47m8ruS4g@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 19 Jun 2023 10:21:49 +0100
Message-ID: <CAFEAcA_O3WQdC0p=kKrV8QOWf8KSG4bS5gsp_+N8vKRNNUEN8Q@mail.gmail.com>
Subject: Re: Support for ACK and PWR Leds in Raspberry Pi
To: Shivam <shivamvijay543@gmail.com>
Cc: qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: JzpYMBsyaCKy

On Wed, 14 Jun 2023 at 05:50, Shivam <shivamvijay543@gmail.com> wrote:
> Hi, I want to add ACK and PWR leds support in the qemu raspi
> machine so from the terminal of emulated raspi I should able
> to control these leds, I coudn't able to understand the hardware
> level controlling of this leds , so if any can help me to start
> on that then it would be great.

QEMU has no infrastructure for displaying a graphical view
of board LEDs, so generally we simply don't model these.
For a few boards we map them out to tracepoints so that
if you enable the tracepoint on the command line you
get a line of text printed to the terminal when the LED
state is updated.

thanks
-- PMM
