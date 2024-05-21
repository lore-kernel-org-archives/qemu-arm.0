Received: by 2002:a17:906:eec5:b0:a5d:17e5:aef9 with SMTP id wu5csp1993319ejb;
        Tue, 21 May 2024 03:36:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUgonL5p20mOyZ9nxJeVrYC4hby9tBrk8ys1/CoDlvItcQrQxUS0070fPy3ypyClF2X2rap0CrLUHbWAv1EOx+nukQk0jE8
X-Google-Smtp-Source: AGHT+IHONuwzntw9q9yVueGiuCX3qOmG+Y26pNGeZIOn/vHpTmTMqhNyy3o7/SdNbaXWcKCBTrI8
X-Received: by 2002:a05:622a:1648:b0:43b:173e:ce1b with SMTP id d75a77b69052e-43f7a30c519mr139852561cf.32.1716287817158;
        Tue, 21 May 2024 03:36:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1716287817; cv=none;
        d=google.com; s=arc-20160816;
        b=WP16dimZdgIqkralTOSjflFr0pzsYm4ym3c718LixjgWtLn1DEWXudhU/YRO5vXwLC
         29nteSc7fdCF61IlEyM8NPgswBL/TZvB59L1b2wZQB/18Hc0/cWXGwra/eDlPhelNSPR
         nZ1k3FvBzgwz9iOpgLk6NFfpU4qpjfhK037aprUWoITeUaYLxLJPt1h9DvIKgiWcLBhd
         jWq5fBF97USk0+Xqq4YO4ZeS9ugJthjpXD/xsa+PMzmZ5/VMppaSZDLZ6306+7gluz3u
         1SU4X5N9LL/ipkhvwZ177TesES7xWDeIyufzXwLWbqEM+/wZU6NowYW2XQ5pRvJrsQ0L
         M4FA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=KDrdFPsEYwoZM+mIonOdgpd36He9kcq1w7XS/0XBLuM=;
        fh=nBY7ebtewKP+H8dhwi+gRmeLuPoB9uF68oAI9EA4b6c=;
        b=tQuVRWrq6tQxmtFMAMKnOw33aEmeQMlMJkpfw2nQM4nk/PACinN8Kp9S2AQG0vtK4z
         z82orR8zjV7Rldl4v5DFfEQZjt+9mTStEV8mEQaI38LfX4R6g47im2vHVtVAY6QMBMNN
         nTqpyn1jh0Cv5v2ByCoTtsX37sZFyzEWDD1yK6KBM/WPUKH9A3XVOnxt1TjpTjQfKgnO
         HwgUTx7R/BTAY9DnMEMi/Xu+i+avQNJXeI7yWhH4Aa08RyHymH3AOUIIr+rzktJsyq+Z
         U6++IhPNc0kMhkxZgbwfEkYJgDZJNPaD1fBz1JP1nfW8NbJOWljo0mkawEz9NaBsdpou
         is4w==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KMFbJ8BV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43df8f159ecsi266285941cf.229.2024.05.21.03.36.56
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 21 May 2024 03:36:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=KMFbJ8BV;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1s9MrL-0006GC-QY; Tue, 21 May 2024 06:36:43 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s9MrK-0006Fs-K8
 for qemu-arm@nongnu.org; Tue, 21 May 2024 06:36:42 -0400
Received: from mail-ej1-x635.google.com ([2a00:1450:4864:20::635])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1s9MrJ-0004N4-0t
 for qemu-arm@nongnu.org; Tue, 21 May 2024 06:36:42 -0400
Received: by mail-ej1-x635.google.com with SMTP id
 a640c23a62f3a-a59a609dd3fso1140541966b.0
 for <qemu-arm@nongnu.org>; Tue, 21 May 2024 03:36:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716287799; x=1716892599; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=KDrdFPsEYwoZM+mIonOdgpd36He9kcq1w7XS/0XBLuM=;
 b=KMFbJ8BVe1NSiFEIPZRgkwuwbdQLOoeTtpseonBlDCKie2sUpOZeMdnDIGMuxCEmEJ
 6sO1jBiqaSnLe8xFmk6J8Sm7SzjHZ2HpSXx0LzDko/Qoe2bRRsdjGNiUUBtJOrwVJ6cf
 7jRva4mJ4V+ZsGL65Ah2uNd0fqTpQdwaBMX7rEFLhpTXZqcVyHLA2xKLYA9HTIUDL8T+
 JtaVxWrKkZ1VSW/uvwsvrQrM2Bbw6Wk8ChamSLuqgIm3zpM5CzirSYcdri20aA1aT6v1
 ZsVHS1Bi3xYhlJxpgj5o2ogAtT6aBvDyY9Y8DLpBmjrfCCkwK82xn+9Il8aS3j1grL+Q
 adgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716287799; x=1716892599;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=KDrdFPsEYwoZM+mIonOdgpd36He9kcq1w7XS/0XBLuM=;
 b=K/KSFFZAw9aj3dyfly4oLc+5xfNm8DSufveNgPlxD7Inpc0F+0eKk6ILAmP+CHXMtx
 amK5S5w/4Op+YtSm+gYO3dcFfk7IxGmFXXUYgsQn7B0Ozmzs4VAT0/WQfg8THRafsGXC
 Rhz10/9nKPSatGK/3waovFGVWC7jugRw4EGbgmekU9lvD/xDVlo7sh0XzGSl61/QLYxf
 9RY4DN8mZVa8J6ICOx0Gsa18tbArVq1rZ2nBtJHaBQZSURIg3Zv7iZhQZrKJKZPup0k3
 Vb7YOHZSpka2ePg4kOYgw1QJNZkBDuuganPi8G/IlURoBGNWX0vXCYE1Y82pXoqIuQry
 Hvng==
X-Forwarded-Encrypted: i=1;
 AJvYcCVMfkrlpXYuR+MuKwPxygHbPn8rxh9WTm1XpLT0YNDCcztfT6au5XquxDzgx2t3E84C2YjQzmuSNCIMcncFKB047bYL
X-Gm-Message-State: AOJu0YyqECVRacjrwBMlzWZBOFP2N/bu4uOpQKfR7TYAsGxw6ddk4DFi
 SHvIMtly/HGsIXmFG3nXwQ/8BXV9WgB+jsvtHVN6uuTCDW9inQ7ImqcbqlohyrHvYWPhfGJEEa1
 qUOVrLX0t/R01/DBGgCzUiUJnKSdot3k5PLf9Ow==
X-Received: by 2002:a17:906:16d0:b0:a5c:e372:222f with SMTP id
 a640c23a62f3a-a5d59cbeafcmr791296966b.11.1716287799653; Tue, 21 May 2024
 03:36:39 -0700 (PDT)
MIME-Version: 1.0
References: <20240506010403.6204-1-richard.henderson@linaro.org>
 <20240506010403.6204-3-richard.henderson@linaro.org>
In-Reply-To: <20240506010403.6204-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 21 May 2024 11:36:28 +0100
Message-ID: <CAFEAcA8aGTtFH2TJoWCqdPvowa5vKA2N_MmGjsjkFhdHsVgYRQ@mail.gmail.com>
Subject: Re: [PATCH 02/57] target/arm: Split out gengvec64.c
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::635;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x635.google.com
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
X-TUID: O8Kin5PB0PXY

On Mon, 6 May 2024 at 02:04, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Split some routines out of translate-a64.c and translate-sve.c
> that are used by both.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
