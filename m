Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp2830519njc;
        Tue, 5 Nov 2024 05:46:15 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWP84BDBYUpj15op4dKwGTp/PqVnSreBn2WbRopagqpXChn4EuwcKjUyrJtl31PQn3s2xdxx5J7unkIag==@linaro.org
X-Google-Smtp-Source: AGHT+IH07oKuHftepex9nlK6nFOO1l/2XhFlP1eb+YEYweaDm2aO0e5ABrksEfZtN8cuaQF1Bz/X
X-Received: by 2002:a05:622a:609:b0:462:a7b3:985b with SMTP id d75a77b69052e-462a7b3a2d7mr348842631cf.59.1730814375114;
        Tue, 05 Nov 2024 05:46:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730814375; cv=none;
        d=google.com; s=arc-20240605;
        b=GN4j742wwcXzfELF9RZktzYooud1oQVPuAMu6+E/XuIjWFzx2Drfrm6E6+k8EVAlcc
         BIcYdlxlllVvNWIB5lKdxdyMp63q1VkmNJ+EgW440HYAxQTPCgGse5SA06Kcn7KaVZ6A
         eGHXGTfx4NiELVsgeOJX1RAwjE8SAhvKojcbnq3Ud5GeD0XVWlmKxMmoFn+Yxgyc0Bu0
         RW9gBvLp0rtSW1cmYaTbwMj4Cu4oovHmeYnSPqrYIvOe6NYxuh6QxfDFpIyvzmbN3llI
         /NwdpAf5VEcon/TKRboJMATFn2wDm7XY5imOOKuTUeraICvmcINUbxwIZjnx2BpNuOeX
         0eng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:dkim-signature;
        bh=C01sQZepssAiHMS9P3hgHMNUhV2RhwiyEJQq/ppB3JA=;
        fh=zbi2VJB0I5Fs+15xMVQE6OBhosOqzl+lK4pVPw3Yb64=;
        b=Zj4oqByqlkRz9jOj69k8ohCNrwFTB0YFNwzJUFDb0KW9TmzU6gn2KVL2F63UuQKcGl
         9GSr20DiG3qAKL1drEEElXe68JaXexRfsooicufruBdoBif9iksMxx8w5PgKXk2faumE
         s/x+ivbz57F2eqyI/1bZvrRUvB1ammNoP2GmOrAoOLlcSmrJCPOs7jDyPJVNRl9xB4t2
         f5y2uck2j23AWFG/Ge7hDQ/KIRMP5Q5tyA1L9GgxFrlUzxe2fT5YzZv18OewdyypBnca
         PtoefniYyw/cWVX+XOh/SIi8qS0FhHZIsJJGp4i8h0bktFHEdxN8J0UsPmeWQJv0YQKh
         Oegw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DQqw99VT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ad26de10si150026931cf.666.2024.11.05.05.46.15
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 05 Nov 2024 05:46:15 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=DQqw99VT;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8Jss-0004W1-1v; Tue, 05 Nov 2024 08:46:14 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t8Jsq-0004VO-IA
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:46:12 -0500
Received: from mail-ej1-x62d.google.com ([2a00:1450:4864:20::62d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1t8Jso-0000pU-Qe
 for qemu-arm@nongnu.org; Tue, 05 Nov 2024 08:46:12 -0500
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-a9a1b71d7ffso949219666b.1
 for <qemu-arm@nongnu.org>; Tue, 05 Nov 2024 05:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730814368; x=1731419168; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C01sQZepssAiHMS9P3hgHMNUhV2RhwiyEJQq/ppB3JA=;
 b=DQqw99VTmWG1VHZ6Sha6OhOmF+S/KXufqRKYG85bM8Mxh+FGIIS+qOanAXaF/W07VT
 72MEkv/g7kuyBHFIKMCg6V5x6TNoCnbCsWSrq3tp7lF+wirqcWxphqX4fqMVxrtlmqjG
 AoxIBUbXen0QN0Zvdd6D/h1dMiFTV3CkQzVevjeWxrAicH0W/xO976a1JAuilT54lSZI
 PaUygdEzNVVwJ3pGtwt3soqt6RVlE7lkJJnS/gc5+0H9REjV94/DWgSUbcBOTmTWV9pS
 8IdMvPlgdMk7+T0Ki1eyOEF9/QXgY35cpHkNfiVLX1AbJeVKoRoExaSe53cLkLghJo5s
 agcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730814368; x=1731419168;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C01sQZepssAiHMS9P3hgHMNUhV2RhwiyEJQq/ppB3JA=;
 b=LIKj3N3p8yUEDbQRln6cj0JEU8Y/p9FbYlcn/HNpMChMjFLdYwu7Wjm2EwWY+KeFzO
 aqFYyWgusQ+v0Qifm3Odr6n6XfzOBfJ1TG2khpQYHOFHkFR6mg5H4eF4rc22C06kJlOX
 rHI2hB+GcUETVNSgY3UjBiujAv4wGr2Qv4IaEGEOD+tLblOTtYWvmg7kKv/VbF6+J8A2
 hRdm9lnd1ZrU9Tah4Q7pGJ9ENMppLVVOVW6fvHEySfX2I/TKwcNRwntPzzFHR2eMjeKj
 Whbv4924o+Y/DkSQpUCKxuWIaL8kK940ha6zQV/gCLz4LQ3jxgZEFv2iCsjWiCMgWvtV
 wU2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXTKw14By5/cJpqv7ZNFjNHJW+LrAqJvUla8fMppFXL5ri0ly7Gx6dUIScrRYgGoyf3CZIml6ToYA==@nongnu.org
X-Gm-Message-State: AOJu0YzZhPNJTKzdbKfG1XpapwOcE0LVsm0zYCV2QOQA+Pt60x/odQ+z
 kqOixXi9Md5XIbGZOkYzUNnYWIFVqs3vwwGlSlGiFnPAUEiVA+Yzd/xdGKHV6Ss=
X-Received: by 2002:a17:907:72d5:b0:a9a:3d7f:a8de with SMTP id
 a640c23a62f3a-a9e3a61c5eamr2355344766b.27.1730814368158; 
 Tue, 05 Nov 2024 05:46:08 -0800 (PST)
Received: from [192.168.21.227] ([89.101.134.25])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a9eb17cf8eesm134490766b.92.2024.11.05.05.46.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 05 Nov 2024 05:46:07 -0800 (PST)
Message-ID: <28cdd5d2-4152-40a7-86e7-d6abae333209@linaro.org>
Date: Tue, 5 Nov 2024 13:46:05 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 19/19] tests/functional: Add microblaze cross-endianness
 tests
To: =?UTF-8?Q?Philippe_Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 qemu-devel@nongnu.org, Anton Johansson <anjo@rev.ng>
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>, Thomas Huth <thuth@redhat.com>,
 qemu-arm@nongnu.org, devel@lists.libvirt.org,
 =?UTF-8?Q?Marc-Andr=C3=A9_Lureau?= <marcandre.lureau@redhat.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Jason Wang <jasowang@redhat.com>
References: <20241105130431.22564-1-philmd@linaro.org>
 <20241105130431.22564-20-philmd@linaro.org>
Content-Language: en-US
From: Richard Henderson <richard.henderson@linaro.org>
In-Reply-To: <20241105130431.22564-20-philmd@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::62d;
 envelope-from=richard.henderson@linaro.org; helo=mail-ej1-x62d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: pSvfVlpwTbmv

On 11/5/24 13:04, Philippe Mathieu-Daudé wrote:
> Copy/paste the current tests, but call the opposite endianness
> machines, testing:
> - petalogix-s3adsp1800-le machine (little-endian CPU) on the
>    qemu-system-microblaze binary (big-endian)
> - petalogix-s3adsp1800-be machine (big-endian CPU) on the
>    qemu-system-microblazeel binary (little-endian).
> 
> Signed-off-by: Philippe Mathieu-Daudé<philmd@linaro.org>
> ---
> Clever refactor left for later
> ---
>   .../functional/test_microblaze_s3adsp1800.py  | 21 +++++++++++++++++++
>   .../test_microblazeel_s3adsp1800.py           | 19 +++++++++++++++++
>   2 files changed, 40 insertions(+)

Reviewed-by: Richard Henderson <richard.henderson@linaro.org>

r~
