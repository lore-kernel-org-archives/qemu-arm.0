Received: by 2002:ac2:5485:0:0:0:0:0 with SMTP id t5csp1204486lfk;
        Mon, 5 Jul 2021 06:02:18 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyKW6z8N8VOFskx0xbxfwb+x5fxAiH3IGD/ctXBExvs32OxieU+ya4WNZsoR487CQJHeM1s
X-Received: by 2002:a5d:408f:: with SMTP id o15mr15835629wrp.342.1625490138214;
        Mon, 05 Jul 2021 06:02:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1625490138; cv=none;
        d=google.com; s=arc-20160816;
        b=WQdngmBiwDFObsbM0ytY4gQdefxhDUq55MwuBuaDKbaDuEjaQmHKbmRN2YhdPxN0Mv
         FkQiLCkVf8UDQHHcx8r5Iod0TQiUS2TezTVfpcW/3jYzh32l7H52Jq66xtGeyDwSw0Js
         tkqkaLUA8Cagzh6WMAyUzl1461O4yRZtuOdZAORTLGK1J49HgUaq5bksGOpXjIvYf/aD
         r8OKrjeYiamBhVqJknY1AGyLuB0gCQbH0eeZtF8hDmMElSc8Uqj4WRMeu/pMacdiUpSu
         7F1m4H3xA/UVyxT+selmn9N/vaVJi0KqYBJ0v9bCkMMuHhT8sk7BGbMvyCKFvAYwwzhy
         hbYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:cc:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Oq3k3fSlR9b/ax/Xy3ruobjxw1xyHz1X2Yf4fLl4b+8=;
        b=HpRREi2DYzbDVuFUgaTqMHWo/l1ycUfoRcRQ57R3rTPo8YVGcrbaHS35xO16EOE55G
         d+B1WsWNok5B31La5KzcKHC6tUmXBvzdgVJoCQqHbakybtnqGEqvzMVpsGLhHHqwUUAY
         Oz9buU8Uc89RZ/wLNwE9+GjrPVW0GIgfqGlPShmM3Zw2RekaFyRXMXKt6fDMCtfOUemu
         rrZ06oq7YDNG7UxkOKDHnB0B0Ipqyy6pYwhKmDoFpWKREeeKBrdwwcE31Ekikp1Vtl8c
         iFru0bFWO/CPmQaLXQ4serdUkr0k22HVWTXn7Gsvr/igEaH71XwbUcsBmcWn3jCjk8TT
         ABDw==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ewEAxIhb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id di3si12380634ejc.490.2021.07.05.06.02.18
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Jul 2021 06:02:18 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=fail header.i=@linaro.org header.s=google header.b=ewEAxIhb;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=fail (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:42878 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1m0OEr-0007S9-9u
	for alex.bennee@linaro.org; Mon, 05 Jul 2021 09:02:17 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:48084)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0ODw-0007Py-HN
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 09:01:20 -0400
Received: from mail-ej1-x630.google.com ([2a00:1450:4864:20::630]:39671)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1m0ODs-0006sv-Sn
 for qemu-arm@nongnu.org; Mon, 05 Jul 2021 09:01:20 -0400
Received: by mail-ej1-x630.google.com with SMTP id ga42so11654041ejc.6
 for <qemu-arm@nongnu.org>; Mon, 05 Jul 2021 06:01:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Oq3k3fSlR9b/ax/Xy3ruobjxw1xyHz1X2Yf4fLl4b+8=;
 b=ewEAxIhbqdM5dKqqB6QqFJANp2X9S0bSUGFjvGeYmkzHeapwxAfznpKBdbHGMYKI2v
 bzG28KAshQQywIrcRcnKcWfIfv1fYQt+kbo/ChKkdJvVLu+pTKK9cKQTNg/P3uqBE3Qj
 4id7aJn72Hgr6PkAXh1S1xkQt/tJKw1I5zMyx6z5rQ519DdCGovo7rYFm3YPIOFnH2LL
 l6nSSMI6NvKkhgkef+d5LnhbUS0rSZGdowiuIHAhwjxZx9kMfdIsEnr8mRV9A5EBRFwk
 bk77CESYRzMBOYVR0iIqmENL8SkcP2Imw+qL1s/LuMpr5qCKbEte9MXbvsPy54bgMiCp
 O3vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Oq3k3fSlR9b/ax/Xy3ruobjxw1xyHz1X2Yf4fLl4b+8=;
 b=Zn7hbPTHK2j4ln/hmpVLuM4prOHom+7g44aH11hqmxf/24db7SFENRkeebOlnQAZ9S
 OA6RiL6ewt7cqE+c2F7SvvaX68Di+rTCr0g+WmZceDC3GKyv769o5JXLrXz/E0n3dq+T
 xj3ChKhAOME7W7K9O6OBFe1zJVzhkvsYNX76GSlEBATNVNdPMQ6hDYGlnajsauiAJl3g
 T1yC+BmMmsJ4sAboZi4kM+GMH6nLggTXPBrEzRW+QPozxiIywMYamvjZTIr95C7aDdiH
 fv+Cs4zBPEtPcuDYM291GYoHvW6bkhVrteAfjMtJoErH3hh/DnTjI3yUZ3UtnkDQcCsK
 BXFw==
X-Gm-Message-State: AOAM5337CphsHRDIF7LNp8CmlYFWI4Rh6uUWxqTHub8nirqoi8E/Yi9u
 5a5DF7PkLoQjVQgExnF9/QzFoYah7t3zGCkfUWR/0hCY3mk6aQ==
X-Received: by 2002:a17:906:99c2:: with SMTP id
 s2mr7815750ejn.482.1625490075339; 
 Mon, 05 Jul 2021 06:01:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210617165647.2575955-1-erdnaxe@crans.org>
In-Reply-To: <20210617165647.2575955-1-erdnaxe@crans.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 5 Jul 2021 14:00:37 +0100
Message-ID: <CAFEAcA8s8zBEjkGfFrtZVXcQfmajfxz38LuDOkEPE7y1LyVxWQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] STM32VLDISCOVERY Machine Model
To: Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::630;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x630.google.com
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
Cc: Alistair Francis <alistair23@gmail.com>,
 "open list : STM32VLDISCOVERY" <qemu-arm@nongnu.org>,
 "open list : All patches CC here" <qemu-devel@nongnu.org>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <f4bug@amsat.org>
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: mE6rtloGo+AM

On Thu, 17 Jun 2021 at 17:56, Alexandre Iooss <erdnaxe@crans.org> wrote:
>
> This patch series adds the STM32VLDISCOVERY Machine to QEMU
>
> Information on the board is available at:
> https://www.st.com/en/evaluation-tools/stm32vldiscovery.html
>
> v3:
>  - Add test for STM32VLDISCOVERY USART1
>
> v2:
>  - Add documentation of STM32 boards
>  - Fixed number of interrupts
>  - Fixed Cortex-M3 name
>
> Alexandre Iooss (4):
>   stm32f100: Add the stm32f100 SoC
>   stm32vldiscovery: Add the STM32VLDISCOVERY Machine
>   docs/system: arm: Add stm32 boards description
>   tests/boot-serial-test: Add STM32VLDISCOVERY board testcase

Oops, nearly lost this patchset in the pile somehow.

Applied to target-arm.next, thanks, since Alistair has
kindly reviewed it all.

-- PMM
