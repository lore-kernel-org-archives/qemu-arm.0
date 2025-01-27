Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2431352njk;
        Mon, 27 Jan 2025 05:20:09 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCVSJ0UUrEj/1c1CGDKC3k2cLNXSw0cktz3lu2n5/RlUxTW+5j2xntbXKw0cHlf3z7LLX3KAPHi/6bQP6g==@linaro.org
X-Google-Smtp-Source: AGHT+IETICYQZjPNqIJ5H1NdBGUUphYxTP1meYcLuKhohvLwkolBJoLX2A9ULNphkQCJhe/RLXeo
X-Received: by 2002:a05:6214:dcb:b0:6d4:254f:1c8e with SMTP id 6a1803df08f44-6e1b21e2a5bmr654537436d6.37.1737984009006;
        Mon, 27 Jan 2025 05:20:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737984008; cv=none;
        d=google.com; s=arc-20240605;
        b=g74cf/cqFlFU6VRT+2BJiuvTIUV+Gf7YqlJTNS1x3QyaH/p4EY01MS3NBs3mUiZEZz
         Wptp4S1mMLRY9Lk6ACDuHIzNsmI0U/lI4Hzo2+zLSowmcc+MTB6vTio2cFe5Btm9DOez
         GywIYn0zlvICMWepgTMF8ReD6RiHdDLlDpX55W7ObMBFuP3DwA/DHeTkpczP5pDKNpTy
         UEZIn1IF07WXSvYaxYImn3vJYKWXoyzBBvVTzauR43q+uqBHicNkUCu/pxCxGzrDOZ4S
         aD00Rs1PR2v5eVB7XysEnLxryCywidQ7uu5ZdY6iBSha8xfIR7QwGYB17JNq/nqUmqsq
         fVnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=Qq5pagTmWg64q7iYtg/4zR1ulKTM7K9i1CygOp5U8GU=;
        fh=6EOMhkWrCAVDK4+cPz2mUAV/74Ax4/xLfAhkMgE11Po=;
        b=BHGirGym2rxAwyywLQt1fWRuvaVVNhn2opvwoyHSKlSPwm0bxgyJ9NdVWqvgNQ8pWI
         R3YkSyAd2+PJTxtr/BybTJXplusJTHDm4sNoDCHdunaDeOyDgCocRKFC0x8G1sPISUGV
         CfYZFK+6v23Op3XIMm86k+dcBxOl2g+lB153gNtAGgonOrjeGCHYHgsF9Kh3JBLZzVOr
         KLcMHd7WzG/nf3mw9HT6QKOBuJ6aKS474F/4KIGXX5UpEMj/DmvKEIYMG4oiuYYlQvCP
         4J6UEOzwFsWlNmtKOVbHqjGe+Ffed2OojWLvjtbQKjE0JVlFgMv2nVaeMUddR/20Rm+y
         APFg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h+4mb5N+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6e205f02755si98846836d6.341.2025.01.27.05.20.08
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 05:20:08 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=h+4mb5N+;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tcP20-0001Td-65; Mon, 27 Jan 2025 08:20:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcP1y-0001Rk-3R
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 08:19:58 -0500
Received: from mail-yb1-xb2e.google.com ([2607:f8b0:4864:20::b2e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcP1w-0002vv-IV
 for qemu-devel@nongnu.org; Mon, 27 Jan 2025 08:19:57 -0500
Received: by mail-yb1-xb2e.google.com with SMTP id
 3f1490d57ef6-e455bf1f4d3so5897292276.2
 for <qemu-devel@nongnu.org>; Mon, 27 Jan 2025 05:19:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737983995; x=1738588795; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Qq5pagTmWg64q7iYtg/4zR1ulKTM7K9i1CygOp5U8GU=;
 b=h+4mb5N+TDpk0ZB7Cj6qesn1CEn5nfsUSqMcbD5IrO7IGm5jO59e+JrzLU5uTWYq8q
 XNJ700ryxuHM1ZDhTjrFX+3jNbYXN6UCv+bq4yQFlKja64tqotDhAoEsvGD9b5k82eJC
 Mww2dKMTc7RAD9/AthWtmJJH0Bd3zma1wHg9XAxPR31AozJGtXPFuLPPUfINnknG4UiQ
 FnO/SyGJSnFIoSchp/k9/KjrZmYt6B2vaur3PztSbAMACuMOJ11MjCVq+SO2vcfsbaJ3
 G94AWt7bxqLpufYN5SZ2+W4gi25MpE0Z3Ll7yzgql0M+ifuxOeB+TJmGvh2ItleqAPjC
 gEvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737983995; x=1738588795;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Qq5pagTmWg64q7iYtg/4zR1ulKTM7K9i1CygOp5U8GU=;
 b=CxxicZyVQfSoqOzWReWk3ygepKwmWYtIaT0t2fsknBjKi/ntxdoyKS9TSqvyyjdWPz
 gI2sJCj1sFgTBrqI3IsGCIH4mclz6piJYHC6Kke0SJWucdM1Vq6LnoGi1YrUjcICLX2j
 wb+DOEf0wVzUgIcnCdui9j1oDDYdKbjnkV+Op9YinmCVChG0k+tkIca2R2MUR9rqL4V4
 CtXSN0AmCIZJo4RPtkmKlBYCviCIVS52KLQgM1HabDFe0CJzbKBYlFbCmQLBUpwnnIxQ
 9UKvcBdtgMp62pVL6yM1SEGHmkSKW/aN/CuVsg1OoMLInCkQgXeBi5c9FBWzmQ/nmPWU
 xhKw==
X-Gm-Message-State: AOJu0Yx+rB3159qKkW8ikhSKATwB1FM72ngyaKhrtbqOA31auIEFv+9H
 ZzCaD3SfxTt3k9ZTcEwUyQ/I3o9bHhWw7/UiX6DSbai8GpyGjDYyeUOOX52GVoR+TNbw3pfPRNe
 Ag+DmHUfiO77MZ8ROshQ3pfL27cYYVmAref4AHA==
X-Gm-Gg: ASbGncspG/QMRG5gY+606UPngVstgFk+gFQQ5SsA41FyATcimgc3EOJ89p/sHvZiDsK
 DPKgesImAUGpOhJmgI4AkzVz/DHuQbyNIxO/kCK3faopul7C2EGRFyMDL/KZYvm8=
X-Received: by 2002:a05:6902:20c6:b0:e54:ab05:4505 with SMTP id
 3f1490d57ef6-e57b134b2c7mr29100433276.44.1737983995198; Mon, 27 Jan 2025
 05:19:55 -0800 (PST)
MIME-Version: 1.0
References: <20250111183711.2338-1-shentey@gmail.com>
 <20250111183711.2338-4-shentey@gmail.com>
In-Reply-To: <20250111183711.2338-4-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jan 2025 13:19:44 +0000
X-Gm-Features: AWEUYZkwCnINR6VQSu9dWKCuAvyKv_5pEi0zs39IT7Skm3kH6fX2WbHPWwdltfc
Message-ID: <CAFEAcA_75KSS6OgTPbHfkgaOzq3GM7U+mPO9UuiM3Ruc9QZ2ow@mail.gmail.com>
Subject: Re: [PATCH v2 03/13] hw/char/imx_serial: Update all state before
 restarting ageing timer
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Fabiano Rosas <farosas@suse.de>, 
 Paolo Bonzini <pbonzini@redhat.com>, Guenter Roeck <linux@roeck-us.net>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Andrey Smirnov <andrew.smirnov@gmail.com>, qemu-arm@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>,
 Laurent Vivier <lvivier@redhat.com>, Bin Meng <bmeng.cn@gmail.com>, 
 qemu-block@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b2e;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb2e.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: VwhXIxhovO2d

On Sat, 11 Jan 2025 at 18:37, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Fixes characters to be "echoed" after each keystroke rather than after every
> other since imx_serial_rx_fifo_ageing_timer_restart() would see ~UTS1_RXEMPTY
> only after every other keystroke.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
