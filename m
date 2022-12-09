Received: by 2002:a17:906:a84b:b0:7c1:2a22:dc39 with SMTP id dx11csp1122967ejb;
        Fri, 9 Dec 2022 03:43:47 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5u8q9BkQvKePq9F3CMEp4swjrzhj7h2RUFXqOoEGXwSRdq8NigEwKA45bperqPGUqoRat+
X-Received: by 2002:a05:622a:46:b0:3a6:8f0d:53a6 with SMTP id y6-20020a05622a004600b003a68f0d53a6mr9369814qtw.40.1670586227049;
        Fri, 09 Dec 2022 03:43:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1670586227; cv=none;
        d=google.com; s=arc-20160816;
        b=Qy6qUY3nOyX3aW8jD4ZjN3travsE+F8VN7h00ZZcZfXLAw+6ReOuzZmFvQ+SV6xgXX
         cVmXWrB5oK+iP8Jj9LojzB16MwLMn8U6eWL/HJO7xheeCtvvk31b6KSEfgv9wVLNm8NH
         7Cd6TMRWytN9fBT/O8doi+thlJpmfvoJarx5GDFPlZ9HL5ER91pA8Jir6YXpabGpnG0z
         +bbH2IJ0VvRJzNLpL8664SL3wKo3XUHJA7Db7U1cXVTT/vGSx+CY1XPabbf/YhZo/79C
         nt3EOeS2TKr27h2VH/L6DvUlKtqwb4tW1gbVWhzO1+/5XC3hSHJfZda/XoGPrdnCp2Vy
         DCEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=ex9Fb3dDRS427vhyJTMOPmys/YYJu3WouGuTrBcTKCY=;
        b=fuNrVZyhJliQWXub4dCZws60Vl/aXx8gM9cQHEvqL9gXkhWAjlXIAS+Nri6s4ZyaBu
         agNvCXUMsQbQ6Zyc4EnBLAEPpRl+GTxxAIuD0pq7Vyosz7ijmpUFyr57HBShTptyIbR6
         usTzJa5dSSiVKu0Yy87gXpbbI/aY9/TPFtKY7Cr70JYxf4hzsIDpo6+aiQPIdjgkgIBY
         NyB8QFbxr//nmZ4Md8r/On/i9hcJC2UJejGc7yabKIWxuWVipfhLA0j/aov1fiKizqgQ
         O0wp01YE9+B0WD4rjoAPgbr6uyTCEv8lH1UuH8pcq/fSe9GKXIHUSJfVrgIsTUsuTibG
         qVXA==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gpn11nAo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id x28-20020ac84d5c000000b003a7ee3bf4b0si521856qtv.450.2022.12.09.03.43.46
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 09 Dec 2022 03:43:47 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Gpn11nAo;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1p3bXl-0006WB-34; Fri, 09 Dec 2022 06:27:53 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3bWi-0005ZZ-KV
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:26:56 -0500
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1p3bWZ-0002h1-IX
 for qemu-devel@nongnu.org; Fri, 09 Dec 2022 06:26:46 -0500
Received: by mail-pg1-x52c.google.com with SMTP id h193so3322787pgc.10
 for <qemu-devel@nongnu.org>; Fri, 09 Dec 2022 03:26:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ex9Fb3dDRS427vhyJTMOPmys/YYJu3WouGuTrBcTKCY=;
 b=Gpn11nAo0PgKYqTKlQy5QdQktCL6P+hhsKBUoLac4V/JIgn2Crj52/Qbu1QmV2crH0
 FueDIN3ey7GxkgqhjUB2Thkyn5rR5yYmgKZ3IGVnnQhJFObCPPfxaXxcpro3aZUz9wA2
 fpjpBULCBS+jNT5RHcJ008kh6/d1rM59rB2HYWtBtulRTQ4hpdsfF80Ke7E4fNDBiZC7
 KHx5iHWHmrJm0Yl36nSSEp4Oag9Gt7LjsnAWV2/UksWZP8+FU+JtXmfczkK50XePNIux
 aL6OdnajfFZoSdD/xzE68zPYqluQeh3Rn5fPLsuOM5hHRib1xM6TyKuTmTvBld2iGGPB
 MWcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ex9Fb3dDRS427vhyJTMOPmys/YYJu3WouGuTrBcTKCY=;
 b=AxBZmCHxgHe3oVTai7HlBgOxRQWUwcWjGF2b6rN6fcEwuYhq3udPVYZvmyq8fLBoZE
 6uCJPNA3Swp0CLtgGLE+G4dXcXDdqNv6WwvImXwQNeimHm1OQd8pgCuOxet4Ae04b9ct
 7cQF/5d+EAwb2qD+YKj15eZSycALIdrbPoHGKN3NK8fRY4mYdPmvr+e5AkN2bLR2k/fj
 C26FlZm8vtztsmwBcpB9ORD53Mkfu1lEuJ5IDMlhqu5LWo6JZbwbclnozNn/9yWVK+Ba
 puJ4Sh8W6r0PLaKxP6g33Y+eu+hjOInrwiN1Nf6bAUOIi4OVmFi3hyIYpYqurv/t3wTc
 SO5Q==
X-Gm-Message-State: ANoB5pm/xg6lLXca16kSaA6oqbk//S3QAk3ZqXvDUFYgT6GH1HgsAaGh
 H8H4azPa7KEoRTevYSUJloO0YJCnraIhmxNrIkFtyQ==
X-Received: by 2002:a63:d20d:0:b0:479:18a:8359 with SMTP id
 a13-20020a63d20d000000b00479018a8359mr4234471pgg.105.1670585197540; Fri, 09
 Dec 2022 03:26:37 -0800 (PST)
MIME-Version: 1.0
References: <20221209111736.59796-1-philmd@linaro.org>
In-Reply-To: <20221209111736.59796-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 9 Dec 2022 11:26:25 +0000
Message-ID: <CAFEAcA-OJeuby_E=7FOn7E7CMc6u0uEX4BUunY6ucL1-qQPQiw@mail.gmail.com>
Subject: Re: [RFC PATCH-for-8.0] target/arm: Keep "internals.h" internal to
 target/arm/
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>,
 Fabiano Rosas <farosas@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::52c;
 envelope-from=peter.maydell@linaro.org; helo=mail-pg1-x52c.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
X-TUID: DpeZeezuA/ls

On Fri, 9 Dec 2022 at 11:17, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> "target/arm/internals.h" is supposed to be *internal* to
> target/arm/. hw/arm/virt.c includes it to get arm_pamax()
> declaration. Move this declaration to "cpu.h" which can
> be included out of target/arm/, and move the implementation
> in machine.c which is always built with system emulation.

machine.c doesn't seem like the right place for this --
that file is purely concerned with migration. I don't know
why we use 'machine.c' as our name for the file where the
target CPU migration code lives, but that's fairly consistently
what we name it across all architectures and we don't put
other stuff in that file. I suppose it would be less confusing
to rename all those files to migration.c...

thanks
-- PMM
