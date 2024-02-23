Received: by 2002:a17:906:e92:b0:a3e:79c1:d636 with SMTP id p18csp614519ejf;
        Fri, 23 Feb 2024 07:04:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWOg/PP5UnRKawSoFoXRBLEoc0z2K5+6LqFvgifK/y3wM7ANrCoPZSu51J4Ru6MeRhsvApZGEFZQTVOvsdWyJsJJVTJn4JC
X-Google-Smtp-Source: AGHT+IHeacxsfZoJ43OW1xi0mU9uoZd+jfGE9Zd+8LQj/99rhBSuIT6ZLt5bC0fx6iI6V66mYkK1
X-Received: by 2002:a0c:cb01:0:b0:68f:a819:2ff7 with SMTP id o1-20020a0ccb01000000b0068fa8192ff7mr61211qvk.9.1708700643543;
        Fri, 23 Feb 2024 07:04:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1708700643; cv=none;
        d=google.com; s=arc-20160816;
        b=athu0BLpxy5y6QTakXsaTBi5obRAJy7Amm8rUjaazm0sZRD8GCzd0x6RMpYt3JO2bh
         jH1I2c2WrgtTvG6HH/HvZ/vr+/EyevP4vNY/uT/JZnlp96Ou6qHfuszHTkb00rEmm8wz
         aEcGZTlLuRjVhKkjx2WY5rckUY1MZqRWgxQHBztit8vKx9CpQw9DBWdgwvTV0Se0LpXx
         V+KZ1nCFnCC5dT5HUztvalrgwZyArDPJA64rkZz8mT7tFBCYxeDRz510K48zr0LYS8P+
         MMuDQorq8Zi2zBef6+5Ud5wrlWi7Zc6xqMPCzobphj0jzaZUPzi647A04ictNVzzxdro
         K6oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=WPQfjQWIvQBLRJ6qvfBoFUVUFt5Qf/N+PgIdEHrJilU=;
        fh=WWlkDuqytkxGe3bfelVzHtF1qDaeYrvsZL9uRsAugoo=;
        b=JpaoAmBaxXNVnBfNr2sHZLoWE8e7B0GIJioOUvxTthlQgqnZhsNBX5shufwlA/8XjB
         HvQuwFfQQBbJ0Z2ISHaGF8yDW8CnGQ+EqRm24xxbupBTCT1HlgWI+cJuxBNR7irNiA4H
         80+VSlh1rTNFvW6VQi9TedcnZTdKCulRjjc/8ThHSf5ohymVJbYsII6wZmoi5tsTO7/j
         tFmaBaHfD3QjBXkDFGNvs26ZK2Wla6BIp3xXctM+ySZ5SWLpM9nJIu6/pRO0b8XYVJe2
         RnPQovHgeOZiOCj1NRYiMlHVapnI4sXjoptKP5T0tykloCtNgW7+vicIEJ/HG34o7wgx
         +ttQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wKs4m66S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id g6-20020a0562141cc600b0068f0699ab3csi15576854qvd.400.2024.02.23.07.04.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Feb 2024 07:04:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wKs4m66S;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rdX5E-0007Or-Lg; Fri, 23 Feb 2024 10:03:29 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdWwc-0000Ua-Fm
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 09:54:34 -0500
Received: from mail-ed1-x534.google.com ([2a00:1450:4864:20::534])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rdWwa-0005xB-N3
 for qemu-arm@nongnu.org; Fri, 23 Feb 2024 09:54:34 -0500
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-55f279dca99so1358132a12.3
 for <qemu-arm@nongnu.org>; Fri, 23 Feb 2024 06:54:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708700070; x=1709304870; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=WPQfjQWIvQBLRJ6qvfBoFUVUFt5Qf/N+PgIdEHrJilU=;
 b=wKs4m66SpUeojcxrG0baQVYJj64GQvgMkpRo6ugRKhjrHaR2sKsu+1GN5fxzIiHi3N
 XTxE5EJPGEqLn8CTDMbV2tt/QbdlF0lTOg5HC5yf3iKMHp0FtvH+eKTErjGUoQBUoMPT
 56LaSMQxSKnN18uUEuWRq7h54oRpRq6LDncbSzkMpi23X/6oA0FXOfMyW7pBknaYY2bR
 HzEqru2t/ThCYEs6JGFXk20jzRKaxZVtzCSrLpuQ2tAS6kf+U97xK5/3THAhDQChX/pb
 cdySDi+ik3XJ7+lKg2L8cPB4ZO0Bi3D9PdWWpYADL6SSs9QXdfT6uBbP9uGkwajjWvIQ
 aLTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708700070; x=1709304870;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WPQfjQWIvQBLRJ6qvfBoFUVUFt5Qf/N+PgIdEHrJilU=;
 b=jls5FebOYkfugtMO/kPU1jyYFesRev1Xr31yZ2aCSZY/W7wOTy87GD0wMJCSdR9WpF
 H+joapnvALIXJrBqngaqkvy/YCgQTBpmHyx+NfMnjHIs3tw9h7gRydcK8zBlj8r3Oy5S
 2+aEG6ivrk2pFdj5A/qMRUZPb5CxWI9zuYAWYL6i5y4YbnY+k7a8Q4WdAaHnQY5YU3KD
 Gom1XGhcXKhFTsw+16fSkjldmebjokYeCxTwTsdEOUV10r3hgoH3A/vOl/TkbiDEf7oj
 SABxtzIzh6FBxSYo/kR0budeO8/qHwwUW3jxh302AuCNCtvxfytuAcSwSa4UqEgNY422
 3BkA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWIs0kxl6VZjFTw2mSi0yEZtQc6WErm+xAjBqfS2IMe0+hlUD50VJ3R/pfx44+IyEc7ORYrKhzE76JcM+sR6RzXxyty
X-Gm-Message-State: AOJu0Yz5sHCs14XDFUErnBhDAYcl/memmLPl7KBNu8RYKPpR5zAh5H3G
 Oxlc7x2sn3fPh+gFzmXO63b5i4RyFIF3OqkxkEbXxbTw9a6Jy4MB3saGNnN52UO1NAiNkosBFvY
 8UDZrTBS1vUFdwEgAQB17mFh8kf/6dyvicz/6CA==
X-Received: by 2002:a05:6402:895:b0:563:d16b:a04f with SMTP id
 e21-20020a056402089500b00563d16ba04fmr46877edy.42.1708700070578; Fri, 23 Feb
 2024 06:54:30 -0800 (PST)
MIME-Version: 1.0
References: <20240219200908.49551-1-arnaud.minier@telecom-paris.fr>
 <20240219200908.49551-9-arnaud.minier@telecom-paris.fr>
In-Reply-To: <20240219200908.49551-9-arnaud.minier@telecom-paris.fr>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 23 Feb 2024 14:54:19 +0000
Message-ID: <CAFEAcA-GPocNOoe=dp_3dwXvTbVuDOJJRQvhSkCqiwsLybavWw@mail.gmail.com>
Subject: Re: [PATCH v5 8/8] Add tests for the STM32L4x5_RCC
To: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Cc: qemu-devel@nongnu.org, Thomas Huth <thuth@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>, qemu-arm@nongnu.org, 
 Alistair Francis <alistair@alistair23.me>, Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::534;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x534.google.com
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
X-TUID: qBLmA/3twzFv

On Mon, 19 Feb 2024 at 20:18, Arnaud Minier
<arnaud.minier@telecom-paris.fr> wrote:
>
> Tests:
> - the ability to change the sysclk of the device
> - the ability to enable/disable/configure the PLLs
> - if the clock multiplexers work
> - the register flags and the generation of irqs
>
> Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
> Signed-off-by: In=C3=A8s Varhol <ines.varhol@telecom-paris.fr>
> Acked-by: Thomas Huth <thuth@redhat.com>


> +static bool qts_wait_for_flag(QTestState *qts, uint32_t event_addr,
> +                              uint32_t flag, uint32_t value)
> +{
> +    /* Wait at most 5 seconds */
> +    for (int i =3D 0; i < 5000; i++) {
> +        if ((qtest_readl(qts, event_addr) & flag) =3D=3D value) {
> +            return true;
> +        }
> +        g_usleep(1000);
> +    }
> +
> +    return false;
> +}

Tests using the qtest accelerator shouldn't wait for real
wall time to pass. The system under the test does not actually
run, it only moves forward the system clock when the test
asks it to do so by calling clock_step(). (We have only a few
tests under tests/qtest which need to really run guest code
and so can't use the qtest accelerator. Those may have a reason
for wallclock timeouts, but need to take care because the timeout
that works fine on a fast developer workstation may be insufficient
on a slow heavily loaded server running a CI job...)

Either the device being tested here will immediately
set the flag we're waiting for here, in which case we don't
need to do this loop at all, or else it will only set the
flag after some amount of simulation time has passed, in which
case the loop will always time out because simulation time won't
pass until you call clock_step().

Most device tests don't need to call clock_step(), because we tend
to write our device models so that things that take time on real
hardware (e.g. waiting for a PLL to settle) happen instantaneously.
Timer device tests are the ones that usually do want to see what
happens after simulation time has passed: you can look at
tests/qtest/cmsdk-apb-timer-test.c for a simple example of that.

thanks
-- PMM
