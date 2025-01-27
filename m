Received: by 2002:a17:504:1e0a:b0:1be9:327d:8ee3 with SMTP id i10csp2415833njk;
        Mon, 27 Jan 2025 04:59:32 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXpvDia2gy40VPqPv/tute1drPLHi8ZrR/TZ/gfYv4E8TU8Ni4TeuIBe4f5JMYy5wzzLXSHpRun6eS+Vw==@linaro.org
X-Google-Smtp-Source: AGHT+IHyOO83RyGVvmpp9q1y3JVTdwRuj3rHCRk54GC5wMixWhwDjb++KeRawZHM82A+Sos3AodX
X-Received: by 2002:a05:620a:1b8d:b0:7b1:161c:ef58 with SMTP id af79cd13be357-7be6323ef52mr5675341685a.28.1737982772533;
        Mon, 27 Jan 2025 04:59:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1737982772; cv=none;
        d=google.com; s=arc-20240605;
        b=XZxHbAx+PAOdBULKTaQS86MfzHmFiV62g8IIM+1ysp+yzX+NEfffMo0rh96p2cQwYD
         eVzzOTFyTOGlB78N3rhfC+LXx4pOQpAYGVAMoxQlACqH84qPnXdN4WuRrweEcwslZNik
         /h+CH2/cqbfhAfGzYMpntuxB0JhtJ7iICmqqlKPdWFF02Vbb5gyQE4hIZFOIEtihMXSI
         CT4MTDOxvQawPQTsAQpi4n+BvLuVQ1aWVmVAjhd6/SNc+uqO68ab2zJYsj67Qati9rR6
         OBbmVUwtxjYMfhFmq5ZV0qYL+Fkx9C8xpUgeXVE306DGjJYswvN3rVV77PetzV9FFR12
         MuEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=fdylYNFuYbClYGwW5Wsg+W2PQ/s62I5CyPgXo9hpFiY=;
        fh=Jn4/MzzF/CwOzVEz5QbfEMExp30Z+ChL2/lmVy9lI+o=;
        b=jb1+IPt/3T1yMfU57uiz6ZJ/QLNMqBipKHUMim9vu9Q2pDzURhIVBDkdSUVtlyNnMl
         o/QPOt7DvpAmuiPh1lYFYsQ0nKHMUYdmv4mnVf7GL8xXBmfrKAVNVygHzk0DdJfDROUh
         /1OwSwgOM8yN3FPkxcUGEEo8s4iBZfoV2s7SxBh1nItZAII0pjoOMhxYqsEQ0C21hIxM
         W4uZMgZh4TuziO8hv4kaNF0eH73/LI5hXKo3sHJtf862xx7W1MtvIwBiIEU1kh2CMdgW
         o66HfmqN0jTHd3fvzv+S/giv11R3CcCM9TES87kfuS3/Vi7HtyZpAYPesIFf3nqI8yMm
         R7/A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QmnAAb7k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7be9ae81aedsi973051285a.49.2025.01.27.04.59.32
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 27 Jan 2025 04:59:32 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QmnAAb7k;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tcOht-0008DT-C4; Mon, 27 Jan 2025 07:59:13 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcOhp-0008D6-UY
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 07:59:09 -0500
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tcOhn-0008B6-AI
 for qemu-arm@nongnu.org; Mon, 27 Jan 2025 07:59:09 -0500
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e3a0acba5feso5909124276.2
 for <qemu-arm@nongnu.org>; Mon, 27 Jan 2025 04:59:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737982746; x=1738587546; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=fdylYNFuYbClYGwW5Wsg+W2PQ/s62I5CyPgXo9hpFiY=;
 b=QmnAAb7kNBU8Xmi7mMNU6piTLQwP7bFp1E3VY5OdL9YRt0PlUWyJjvhjREQp5AVMNW
 OGymn+mC3ZqI/NmpQHx8m71i9jn/noU081PyO++407y8o6OCtgb+OkPNwfJMcDKLxReI
 QPvK60uNBWgTdrLcfukT/3OFZQAn4upL5ju4Zpyn9JdJmSzJIW9Qgv1NlCcMLrOWNaqm
 /4cWXQQ0CUmmW/p+hTQCUYLVKQjzZejN27UB5TBAtGt6+UJxDXbTSN3AxkmWBkxu510o
 +mHim21AP3CPNHRTB3JUHFJ3iISIeoMKtwJ3sMcEhURhRdYSJDZicdqnHuvlmmGeujfn
 LX2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737982746; x=1738587546;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fdylYNFuYbClYGwW5Wsg+W2PQ/s62I5CyPgXo9hpFiY=;
 b=cci6A4P0g7yI//jbmmEuEJIFLz7RyyE5xfSLaCq9Nk5ehb09Q1yzYiU8EFdrUmqN5f
 h4lZM/b6gcWF2xvNRn8R6JYJ9LrNMqUOuqbWhI3qheHj2DHyVbSvZSG6borGuBmg7SZA
 Pm0EeC+dGSelvEc2qfwZPyqD4r0LduW+H1RWN8tm3xBJFGmWhQ/Znk9YOdfHaofjaIV/
 lB0nH2WpCBUm221/4UJgTtu6aFRjYhmc+Yd1kjtGLilsMqPJrlmcSDcAjR9GCGwHZER4
 ZSvhx3SNIsidJYLEz9YfwD4yK3cTrpUP8mfx9seSICjlqyRVdHiZ53bct7HBu5iyw9Lk
 TlKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYA9bLs6HiKR996pskQByo/9E+YF14Hf9TXo7ZXW8p121GxjuLdJglwy9e9ZkUNHn7P22qF8xLvA==@nongnu.org
X-Gm-Message-State: AOJu0Yyku+EhYyZVV3U6kf035XHpp2VGYHzbYr+1bvGe6l5eobdoCMgl
 muv2QUxgwVzKLEDIujrcXMqLd+eoeZVmcYXgOGTz+uVaY+OpgpkK0aotpE3pV/mvchCCEPfH+wE
 s/xsLCGkvE/OvZi6rg1zZ74y+uKhbJRSvSlibMw==
X-Gm-Gg: ASbGncu08G19eLlRh6t6ToB61hVf33uCsKN9u7zQAL98ZrBR4Igxhps9MZPAcHDJnkC
 2B2tDTN1PRsHN6LGEuaSMYQJVMhj9wBGGgAc0g+2OWLBPbohMOkEK0grCsVrr58ohC0GZ7Ec6cA
 ==
X-Received: by 2002:a05:6902:20c6:b0:e57:935d:380 with SMTP id
 3f1490d57ef6-e57b13310fcmr28856504276.47.1737982745873; Mon, 27 Jan 2025
 04:59:05 -0800 (PST)
MIME-Version: 1.0
References: <20250112225614.33723-1-philmd@linaro.org>
In-Reply-To: <20250112225614.33723-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Jan 2025 12:58:54 +0000
X-Gm-Features: AWEUYZk9wDYB17YQTnGa-2avBqE2CZbXEEWgjgbGRgURm1j2PDy8jvuZrWDBk-Y
Message-ID: <CAFEAcA-B97c8ziB1UVRSuxNKB8=an=+JpbfsRcWuy3d25oP4EQ@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/arm/v7m: Remove Cortex-M &first_cpu uses
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Samuel Tardieu <sam@rfc1149.net>,
 qemu-arm@nongnu.org, 
 Felipe Balbi <balbi@kernel.org>, Subbaraya Sundeep <sundeep.lkml@gmail.com>, 
 Alistair Francis <alistair@alistair23.me>, Joel Stanley <joel@jms.id.au>, 
 Alexandre Iooss <erdnaxe@crans.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=unavailable autolearn_force=no
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
X-TUID: s/17TAORoJsh

On Sun, 12 Jan 2025 at 22:56, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> After renaming a pair of fields in NRF51 & Stellaris boards,
> remove the &first_cpu global uses in Cortex-M boards.
>
> Rational is &first_cpu is going to be restricted to generic
> accelerator code, then be removed. Similarly the global
> 'cpus_queue' containing target-agnostic CPUs is going to be
> restricted to generic accelerator, thus hw/ won't have direct
> access to it anymore.
>
> Note, Cortex-A boards already have been dealt with in
> https://lore.kernel.org/qemu-devel/20231212162935.42910-1-philmd@linaro.o=
rg/
> "hw/cpu/arm: Remove one use of qemu_get_cpu() in A7/A15 MPCore priv"
>
> Philippe Mathieu-Daud=C3=A9 (3):
>   hw/arm/nrf51: Rename ARMv7MState 'cpu' -> 'armv7m'
>   hw/arm/stellaris: Add 'armv7m' local variable
>   hw/arm/v7m: Remove use of &first_cpu in machine_init()



Applied to target-arm.next, thanks.

-- PMM
