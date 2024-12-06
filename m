Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp908941njb;
        Fri, 6 Dec 2024 07:04:21 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWc37tlsGmn+YOQwH0erLZInevMa/ZT6Pty2Zeglq49pJY2UVpgYH+0CbwD44ata1IgYw8B3kKIg9OFQg==@linaro.org
X-Google-Smtp-Source: AGHT+IHqP/rq6kPc89zy+QElN+oenf9YygZi3Dcf4lK3G0iuwbwB/Tm/FM+Qe6/aqurwLJcJRS02
X-Received: by 2002:a05:6102:5107:b0:4af:bc0b:735c with SMTP id ada2fe7eead31-4afcaaf116amr3664547137.26.1733497461359;
        Fri, 06 Dec 2024 07:04:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733497461; cv=none;
        d=google.com; s=arc-20240605;
        b=bEmqWzcQT6QztObzwbIs3Ts9loTVi18WFk38U+27kjSb4Z9Ulf6iRKRE46IBefR/kM
         O5xLQi4d8BGyZ1EEb2+fOh1cYNTGMDBhuR6ctHCQ1fNnJNrIKYEh+SrSqnHjP+QLu/0H
         3FKtqRxmuIEqGdz4t3LoMzCk+Yc8P6sRkGlnYRIVLh+ZKtAJzlHxTTvWCwUfNShOjwbp
         PiInGfYoGtN6BUM0GOIbpk/uLbdbyfYm0knXqVDUVTXLaX0cRuMchwXCzsh50W8eg7CD
         1qPhVR1ObjHomWWYfTw762FAsNdOcSKXXJD5DqZfYVMMk2pg3sSvviEZmiguNn8on+Wm
         OsKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=4nyMkgs9IjhYqg0/+lboPEpqbbXpcekADgozcythdL8=;
        fh=ov9Aij/3uTn0SrrOC2Qw18Ez+ueJGAFTR6CGoWIG934=;
        b=A1l8HxhCJvU/v1NfFMmue9E1YCB2kflVki+6ntpwDhj/1Qi/evjHP2PSy6gtMLuenY
         foZdbQxYD3XkYQHEepUcgXaLgVXNmstQw80oJEVyZDpIdrFX3t/H8KKU+hVAOGN98aKW
         m3yOMlM9CrtzRr6pnkcyLtyr51O6vAdmZQ8EQa4YSI51iiifY/BkYnxk6vXWlTo7VUPw
         7FjwlraIEClpocH97tW4+V9ynMttEkScJVx3b6mkpUX64nROgBs0GIOKiTVeM6sBG3iE
         hGfkQ7kZl957VlCX42KDA1wVKgzdYYrU4PXuoqqFlwqVk29aRMU3dB8kFJJS1CWDKDG5
         b+qA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wW+1ykBC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afbc50f794si1138679137.28.2024.12.06.07.04.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 07:04:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=wW+1ykBC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJZs8-0002PC-Dw; Fri, 06 Dec 2024 10:04:00 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJZs2-0002J0-CF
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:03:56 -0500
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJZs0-0001zk-NC
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:03:53 -0500
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-5ceca0ec4e7so2466015a12.0
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 07:03:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733497431; x=1734102231; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4nyMkgs9IjhYqg0/+lboPEpqbbXpcekADgozcythdL8=;
 b=wW+1ykBC/lvSSnvN9Ibx0G6qyT62x2iIOZ2fV5BKhQEW25+m6l+k8HGYOLu2t96W9C
 mo72JUXxWKHDat3SsqDAip80/CXfE5OnF3bGL7pmqopNkir3kKn234jbq5vEYRh/RChw
 VU7yD/9IeMHvuPcpFypphnWVfGq3mqr7yomKaDrvGorwXGca/hsXRPFa9eTmx1TYmrPW
 JaQthifpTGh9hK4enlO+hKt+RZ/CGZMtkCiwU0oXbnQEyX1mbUdGqorxjDQnqbgXW+wJ
 msw597D73bfrQIWS+43H2CetNyPvXly72H6LGmBBmws5lNpYWrRle07qAmilsN12ql0i
 Ct1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733497431; x=1734102231;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4nyMkgs9IjhYqg0/+lboPEpqbbXpcekADgozcythdL8=;
 b=h6t12teWRWVW+rLpD/LhCIuzLXcMglxDxK40sPwVDX/Gb0oX42QLZyqIMtvRTUnwC6
 XEB7t8TuLd7vU4sfshi6HCtY8CU1P9z1fsYkvSCCa8YY3N/7UKwSelUaqgTVL+gtHHzJ
 uR2ajeDyeFeDjPrrnW9lzTJiOhopVl7dGj4+ecBmoE9GZA1B0LLuKtbKWvnilP8spEtb
 XJEIWdeG6L8duybGwUKGLu+5JHoZY1PpdH6/cVTV2INdRs4BUBs2nqig3I6FkLzCPA5c
 fktAmk1sygOMMUdEzNTG9vWmrnSlp9LXtCvv7TLQwWZrWf+RVWhM59iscoQiXc85qZ+9
 7AVw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmsAsOVVKPL+Vwj65KjebdZz2+ZTRdCyWXz8rniZMEZSZdIwliKe3XE4CwyHZCmuGGtanhrctjNg==@nongnu.org
X-Gm-Message-State: AOJu0YxHkLt4GJw2TiQGd88uwrQBe1L6x8xsV5d28ah13fdDFkTLaqrr
 cE3/+RT7IGnBHjWES+Ndyh6ri2vFIoOhZ6755UaJc9sFs3y9Avg3dIS4rehE/uasbmLR0jxWsgQ
 ZqCZfOK+N7DspC8dUe89h8O5vj5lLonmlOuQah7Jc41oug2Xz
X-Gm-Gg: ASbGncu4/HfGnwnNjXMN2I8Yt4dFYWfxgorwM+//5JrxUW6tx13rbtIJbk+zBCdcF5m
 pHUa8aubOqH/wxItDIiZNemp7ftKdZiUN
X-Received: by 2002:a05:6402:40c3:b0:5d0:c67e:e263 with SMTP id
 4fb4d7f45d1cf-5d3be678280mr2681696a12.8.1733497430834; Fri, 06 Dec 2024
 07:03:50 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-40-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-40-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 15:03:39 +0000
Message-ID: <CAFEAcA9t+tKHiWvE3nt_6+Hgz320pdSJOfwyL5c_OKeQfsy0GA@mail.gmail.com>
Subject: Re: [PATCH 39/67] target/arm: Convert CNT, NOT,
 RBIT (vector) to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52d;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52d.google.com
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
X-TUID: MU1WZYVKUFeA

On Sun, 1 Dec 2024 at 15:09, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 34 ++++++----------------------------
>  target/arm/tcg/a64.decode      |  4 ++++
>  2 files changed, 10 insertions(+), 28 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
