Received: by 2002:a17:906:755:b0:a37:6271:4f3c with SMTP id z21csp1846698ejb;
        Tue, 6 Feb 2024 06:55:07 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHyUDa/y5Dxu2D43RlrTxjBqUmN4EWm+VpfdKcBLk9kQIfIqOantU0Z1prkerxamEqMsSAm
X-Received: by 2002:a05:6102:282c:b0:46d:295d:1d9c with SMTP id ba12-20020a056102282c00b0046d295d1d9cmr3151101vsb.21.1707231307340;
        Tue, 06 Feb 2024 06:55:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1707231307; cv=none;
        d=google.com; s=arc-20160816;
        b=nNHetX2FZvlm1iQXb5CVLAEn2VRPwaEeyg13hSyRnq7p0AcwdoMd7jd3ERU6Z8karB
         LGtgO7GifwO3JRHSmRyw8eVRXdxOb/Ll1bVizRlESrniHuGMa7PGPO+rtZGkcJEcAEDq
         AOz+x0DVtEPAtbuZGjhzBXwJP1AZUmSe4UuGZlYgg/SVnchsN/dX2UkXobB0IcVvZtrp
         6lYeeLvpXBjUAf01EVa/hDnnJ8lGAwubQvEiJUN5/lsg25TipIwGnkEuqo7NePkB+2Lr
         kOR1ooHzlIQj/vhMyMtjiqTk+FtBoT+02NaGNQ3oTKBEyzzaKLcrFJ3vKCbjwLXTtmBY
         R+GQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=wsqqsXRUhKI/xC7kkr9yybEJ2gmcsZkQMLVYDMvexT4=;
        fh=loc0/PZddpAvzKdosSPpyDAiw7DNVh7UR1AOpof0Oq4=;
        b=Cj2uDNRRTJnljib4rrKl0IsiQsuazUIge3Vwq35D1vy96fq7kSeQNF3DYwkqBcn4+l
         Nf+2Ize8Z1h3VLviz/l610/0gNUvk5bM/2XdqzgGLzPeuP+dGUGYEEJLqKl1iiLTQeR3
         tyQteVnbCil3oX94DHelhJQCa5PwPkqanTF9Zx6aPQ6LmHjW9E9gmUvmcRnAn6c25g7p
         u7bHpbB7Npu8RBlzkxbHb9VM9l6BfWhu8neF4iNdNscsQ6Tqf+zaU9Pia+V/WHM8PIqZ
         4bwG5ODlbI6v7nDQRPyZOzEA+PQJrfEP1Jt5N3NP8LKEUAa4KbwHvzJJY0AX4mo8QmXG
         MaEQ==;
        darn=linaro.org
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eRfePh0D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
X-Forwarded-Encrypted: i=0; AJvYcCVHiF9fkOlZq2+IxTOPhDZ8ojgXyNme2Hcfh+3DowFvglaI63l3ewVOajAL/wJuy3QjfaQ13MrHnlkiAm6oJ6l4V+MrefY+
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id dv3-20020ad44ee3000000b0068c71d0cf61si2809805qvb.446.2024.02.06.06.55.07
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 Feb 2024 06:55:07 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eRfePh0D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rXMqm-0005Cm-3h; Tue, 06 Feb 2024 09:55:04 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXMqb-00057f-Nh
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 09:54:57 -0500
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rXMqa-00011B-2I
 for qemu-arm@nongnu.org; Tue, 06 Feb 2024 09:54:53 -0500
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-55ee686b5d5so7512973a12.0
 for <qemu-arm@nongnu.org>; Tue, 06 Feb 2024 06:54:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707231290; x=1707836090; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=wsqqsXRUhKI/xC7kkr9yybEJ2gmcsZkQMLVYDMvexT4=;
 b=eRfePh0DX5VHh8k+Nd9TNnX6pQEHBH6127ZBcup/YknjzTtJUU0d6C/DZXBVUTBnU/
 G/XJIOQTa1/e7bR9krNk6eP47cnTvNbuMJOcJswggkhvrEsARNRkd4Ax13Od2c59ZhEA
 5+L4DJBmlPPy4h2YSsoDwWgv+OI5GHzaouTlN0DuTTaQjC1i4ep4ZhY5Au3ITXTyVC3T
 H8nnRM6kXqH2KdwDtryIrLDDSIaEnoXcDrXzHL4h+xaEkfpIf2xscFyFCCaCCAWI4j4P
 CgGDWZa4ruVgJSfUWKDlak4oiiwND4cKMxfX9ZmQalJgq2Tuw+1yzDRT5fl9sXBBMnwy
 rt5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707231290; x=1707836090;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wsqqsXRUhKI/xC7kkr9yybEJ2gmcsZkQMLVYDMvexT4=;
 b=jEw1qM0VXzuZ9WszJhHWVeyvbwy60NSx3QkUMIYWUjwOrYE1Y3w7zaXxB6lLotXYSk
 tOQQoK0iHEo1U4n36aNHOdK1TSLssEI2ArEd7GpT8k1ZxxBVkfD6jEdvVQp5zuVSudd0
 jUaFo5teRwc4S0xsyWr4HhFb+NUEwn/yRYR9TTF+hIvaQdh2hHd1gX+zSLLyQ77Dn/17
 lAnUjppTh/hfxuORVirUMplbDUoEfEvlVlIFOfPj9E22GlB+zBZdXYRZ0WNY2RX120et
 IhOT+eNvs4KKIrV8MMVH1+rRlSD8mgEYT+BTojrDD/4TEFLy9BHbHpJqcaDM1nat7mkn
 5Tog==
X-Gm-Message-State: AOJu0Yz8Oy6j3tJzvgFfzExec2hYFm9EbpA+SqIkQEjH2jzWkFMOijX/
 /XyMB4cdmwdYwGXFEsEAgTatDW4IkbPfh9rnW5rgWp0DY1gIwAqwIvfdlvearnTy348HiesxXn4
 gtzfb3c5tXgvqvJKH3mZ6XN1Tmt6cJZo/rCiiCQ==
X-Received: by 2002:aa7:df94:0:b0:560:79bf:85b5 with SMTP id
 b20-20020aa7df94000000b0056079bf85b5mr1871650edy.30.1707231290512; Tue, 06
 Feb 2024 06:54:50 -0800 (PST)
MIME-Version: 1.0
References: <20240206030527.169147-1-richard.henderson@linaro.org>
In-Reply-To: <20240206030527.169147-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 Feb 2024 14:54:39 +0000
Message-ID: <CAFEAcA_+H-HHCN=WiwNjvOKRuVU=A-TnsosCSf9aTF_VjSgR8g@mail.gmail.com>
Subject: Re: [PATCH v2 0/6] target/arm: assorted mte fixes
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, gustavo.romero@linaro.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: ZVx6GYBRCRui

On Tue, 6 Feb 2024 at 03:07, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> The first patch is unchanged from
>
> Supercedes: <20240131003557.176486-1-richard.henderson@linaro.org>
>
> while the remaining patches replace
>
> Supercedes: <20240205023948.25476-1-richard.henderson@linaro.org>
>
> While digging through Gustavo's test case, wondering why it
> should be failing at all, I finally noticed that we weren't
> overflowing MTEDESC.SIZEM1, but underflowing (-1).  Oops.
>
> But I did find a few other points by inspection where we
> weren't properly handling or supplying MTEDESC.
>

Should some or all of this patchset be cc: qemu-stable ?

thanks
-- PMM
