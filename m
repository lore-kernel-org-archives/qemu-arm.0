Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp674417njb;
        Thu, 4 Jul 2024 08:13:11 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWv0AO+OCb0mYoBULi3xG4/Iygc8Za9Y9mLvOrp3if+/rg0HoOCTRlRpxmryAu2qbcum2mW6l/fI5ASNTm2fWgVmarvqvrR
X-Google-Smtp-Source: AGHT+IF/gv//diyI6Sdw/VnK7c47wgbHNmfMVxY2BqsvHLDDaYPDA40ZSpWqtDs2UhU3DtdDMuIs
X-Received: by 2002:ae9:f107:0:b0:79d:6169:7ab9 with SMTP id af79cd13be357-79eee286b6emr231842485a.68.1720105991026;
        Thu, 04 Jul 2024 08:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720105991; cv=none;
        d=google.com; s=arc-20160816;
        b=MQUJ0+SpvHam4scuama1EVsEAyIBiwl/FGMC8Z5IDXiHaZ2yg40+hxzFpd8gK0km0N
         xu+EmZK+B0JlZrirp7vFu1pCeXDwQF45wzxlBduTaLHu82pt6ls1cxAW2aOanMGv7dxf
         hGEdpj5gpPZdhGYLDzgQe+RLrwdCf9Rl5VvA8Vq1NgV2+qT2JWyaFZAoGq/8n4P79nGJ
         nCw3wjM77egSY0RCnrkCQsNRHKv0yyhcfI+WgYYEo+7YU9Gc5V8JKUNY8SGbuJxtdWE8
         RmS5Us34kgEF5Sz8nbJL3G2KawLDKiFImmz68H8/EUhYixyLa4T0++gknxqpwUfJ25Nn
         TrXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=iZY9lL/puiaybLWGlFSfXvw+LZrP1SoWXpkiflhRIt0=;
        fh=3J56Qmsu8Nw3eYuP44tBuQzhn3DAGnaDdXR/oUTqB6k=;
        b=teEQAEn08aEAgQYMLEMEEKjnwS5Z4zKqzX06G7ZQhpCdgOVzYtwytAtas3cWoMxQ2c
         bk4JjcHC6mYW74QjPl8sq7qfhG+nPmWe2kloA4XsUTre3FojWSTGRXOkXbpvej5sO2sN
         srQIhGbUi8U0EXnCQkztfdBU6O+B5t0IqOX8rEzltpjTMzZCVgU1/bcmn/Wj7SVg0GGY
         JioYM7LDQzEC2bFw9ieB2iFoXrLKfR4M4x2VQwWPzVGM2mK1MBNHr4WwHE5u7FQtS2kN
         mKAH9aoVUPWULjAcZ5xfAqq9YEwAQ67VUkiaXm0ixOV/lt23V+0qhqJ5ZYx1XvYS9MC3
         DT+Q==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L9OqazyI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-79d69339740si1617238885a.603.2024.07.04.08.13.10
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 04 Jul 2024 08:13:10 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=L9OqazyI;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sPO8s-0005b3-Up; Thu, 04 Jul 2024 11:13:03 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sPO8q-0005Zc-KZ
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 11:13:00 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sPO8p-0002tb-3a
 for qemu-arm@nongnu.org; Thu, 04 Jul 2024 11:13:00 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-58bac81f40bso1116546a12.1
 for <qemu-arm@nongnu.org>; Thu, 04 Jul 2024 08:12:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720105977; x=1720710777; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iZY9lL/puiaybLWGlFSfXvw+LZrP1SoWXpkiflhRIt0=;
 b=L9OqazyIqdG0a55LkzvK0LYOpCSnTunqzSBvt4hsW3QyFPGx/csBN52aStPLvT5xQN
 P1DvZUFqfUIDFH72Rm+J9PjP8XKuAniSsCKydnfc1mSZPdNN8TeMTZOxaGzW90ZKVURx
 9v9hozDSvtiT5+JmUeVPGv+Pw0cypKpJeGee8WV6L8zDuGVC8YF0yqooKBixV5O3C37G
 O4GRq73s0lCBhuwrUjz761O9k/Sb8fWAOkxp2J6mxJOTLeHtqKfaeIO9yuQIC3ZVFEmf
 XeOlQMGG8LozoJw6ly9G+NQgI78vICDbEDBY6lndOpmNL7ED9W+8XQBHO6VecHCCuolp
 GdrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720105977; x=1720710777;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iZY9lL/puiaybLWGlFSfXvw+LZrP1SoWXpkiflhRIt0=;
 b=FKa/HyYwZnhtgYS/mimf1GC0U4Iq9A2BrgpCVMfX1obAj7i5nPuF/6xllCnUKUT6rv
 uhgKyVAKvp2pgotiUtzSH/WlvCOxyyPtKbVTa2X4fNDrMhz+bExG04XWj7WqjQ0A7Ptq
 dmHPdu1PNshWygeltOxGQNVtOn4hSTihKiwpqY5E3tGMFImR2GhfuBGWw9jOltewRB0U
 khOXJAO2AaiDmrIv/77B/i/7isy096KUh6HTKFeTWMS5SYBsbSfIA9QQzjR46JsU03/h
 66maetOagb5RzXm+Lza/dPoyhG2H2kDAiM/w+pVQGh07WNWMSW5BkfQZpp+UZ6TvsuR0
 29BA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsOz8W7dOc3ZqKz+8GSFnnXJgTbSUBLYtxbg7y05BtwxcOC74vjJ1X4+yiqhohdT4faCw4/iwceoq7poSxYM2ceP20
X-Gm-Message-State: AOJu0Yz3XpUzF+5tyj4w5X9Z1XeB25gnVsbEXNChiZn8HJaDHbNr0xRK
 skpM+UrQr/zeGJtIdhCNiZT5IaA+1l8IxtZIuORLMC5uEd+C3JDedgw/7jathtSSQuwSUA8T3pt
 OXXaRTGxk7SWSU1VC1xLCiK4TFpq1+hrxE2WBPQ==
X-Received: by 2002:a05:6402:3496:b0:57c:61a3:546 with SMTP id
 4fb4d7f45d1cf-58e5b1b752dmr1547957a12.21.1720105977272; Thu, 04 Jul 2024
 08:12:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240702155752.3022007-1-zheyuma97@gmail.com>
 <8aa595ef-efb2-45f8-a89f-9a4db3b2f11e@linaro.org>
In-Reply-To: <8aa595ef-efb2-45f8-a89f-9a4db3b2f11e@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 4 Jul 2024 16:12:46 +0100
Message-ID: <CAFEAcA9EscdWuy2o2fLQV4+QL8gB0=FdGyP1F7u_vv=oMQ0b0g@mail.gmail.com>
Subject: Re: [PATCH v3] hw/char/pl011: Avoid division-by-zero in
 pl011_get_baudrate()
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Zheyu Ma <zheyuma97@gmail.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org, qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: rgKIzrajuTJb

On Tue, 2 Jul 2024 at 17:18, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 2/7/24 17:57, Zheyu Ma wrote:
> > In pl011_get_baudrate(), when we calculate the baudrate we can
> > accidentally divide by zero. This happens because although (as the
> > specification requires) we treat UARTIBRD =3D 0 as invalid, we aren't
> > correctly limiting UARTIBRD and UARTFBRD values to the 16-bit and 6-bit
> > ranges the hardware allows, and so some non-zero values of UARTIBRD can
> > result in a zero divisor.
> >
> > Enforce the correct register field widths on guest writes and on inboun=
d
> > migration to avoid the division by zero.
> >
> > ASAN log:
> > =3D=3D2973125=3D=3DERROR: AddressSanitizer: FPE on unknown address 0x55=
f72629b348
> > (pc 0x55f72629b348 bp 0x7fffa24d0e00 sp 0x7fffa24d0d60 T0)
> >       #0 0x55f72629b348 in pl011_get_baudrate hw/char/pl011.c:255:17
> >       #1 0x55f726298d94 in pl011_trace_baudrate_change hw/char/pl011.c:=
260:33
> >       #2 0x55f726296fc8 in pl011_write hw/char/pl011.c:378:9
> >
> > Reproducer:
> > cat << EOF | qemu-system-aarch64 -display \
> > none -machine accel=3Dqtest, -m 512M -machine realview-pb-a8 -qtest std=
io
> > writeq 0x1000b024 0xf8000000
> > EOF
> >
> > Suggested-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
>
> Peter, feel free to replace that line by:
> Reviewed-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

OK; applied to target-arm.next, thanks.

-- PMM
