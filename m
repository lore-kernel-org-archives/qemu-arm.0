Received: by 2002:a17:505:564d:b0:1be9:327d:8ee3 with SMTP id jl13csp3322660njb;
        Tue, 9 Jul 2024 07:22:01 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWTDR47dvlnTefJGO42DIl2QCRGVOBdOcd5dlxkXZLoqVD2DKKxBw3Wpb4MlZ55RVCvBSpnnSbjLf3XFOXeUsfpl8PVYjpJ
X-Google-Smtp-Source: AGHT+IEnGVI9uHH2rGp5i3qZrAftIEhleYnkLXH+0593xL1CSj8CH9kzF4SdKlT/LoTpcPg8XXgz
X-Received: by 2002:ac8:5807:0:b0:447:dfa0:282b with SMTP id d75a77b69052e-447fa8eb1e6mr31437071cf.25.1720534921546;
        Tue, 09 Jul 2024 07:22:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1720534921; cv=none;
        d=google.com; s=arc-20160816;
        b=AxdGLXcvmIGxrU1D0zJgH5/6tbS9Bz7rAjkZD4gu6pOY0qNLbpTPtSHdlyudtj43dZ
         Kf3+1+2R231Gh93LiP3RLYOnEB6Fl40oJtkGddp+PKVVu4wzoJdj6bHrFZp81tRSbdzc
         fxdz5p/J5PX6r5oqmG9dqkwaBfk+rUKomeSe4OhT8/WjtbidkR3TgQMv0/DA54+Sntgx
         fboQYVnuTwKkhNS0iIwcAUXq4WSSlRMgDS7H1yfitkJC5T82QIx54bcLae18IWMEeNhc
         GgMruyeLtORObKQQyWMbiOMDarFhe8eKFAuvaCrhOQKfb+oh4SlG+Fs9xMRtZTZ3Eeq9
         3Bng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=JqKHucI2Jyi7c0em15pkqGeMYcE3Z5p3FPgBx0iS8hY=;
        fh=pqIwUV6a0zkUqo+Nk/8qkrDw6WAZrMgfw7h+xAHmkTY=;
        b=JaB9UnKttSwmRwGJ/7/fEEgNpysah59SNS8nFOjAmSRRG+AIf6OTE/z+4O3yBX07Ys
         6HVh3HHVGxt/tFcOYo+vxYJO79Y/UwAmsTotpNHnytYNSaeGoMhFOcEPkxs6zrK2Uqsf
         tO6GHkhPrPbdQOLUtmY3tZkWGAEL3PEnIZzt/XHtGKBSS4WIML/qlRkS6l0m0V4OEcVT
         OJUR44IZ6/IwPDQvyqWJqFOI/iHTUbg1qxgMSu+CVmzZXpMEspiseCGtNUPrjd1mSLyv
         X8ySRIDvHmEvAYE4ieCs0Xjkm7DEU5saPYIVUtRED09B1tw8Z1odXdWvGBm64MYmTjn0
         G2uQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jMjhDP8D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6b61ba1d81esi23186026d6.153.2024.07.09.07.22.01
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 09 Jul 2024 07:22:01 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=jMjhDP8D;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sRBij-0007zj-8h; Tue, 09 Jul 2024 10:21:29 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sRBih-0007yz-U9
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 10:21:27 -0400
Received: from mail-ed1-x532.google.com ([2a00:1450:4864:20::532])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sRBiW-0001kn-6v
 for qemu-arm@nongnu.org; Tue, 09 Jul 2024 10:21:27 -0400
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-5957040e32aso425755a12.2
 for <qemu-arm@nongnu.org>; Tue, 09 Jul 2024 07:21:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720534874; x=1721139674; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JqKHucI2Jyi7c0em15pkqGeMYcE3Z5p3FPgBx0iS8hY=;
 b=jMjhDP8DS25ZW9Zzf8+TqnDkgIODMUkymZgon4FfwY3dwgyxGVqcExskCh82Yl6Zqs
 wEfe/flfgcz2cyxKj9UXKIbS6rrjGI42JUE3pwUhyslNENUSZ4yFjXNSzA/cOQPz9nmd
 2VVXLxqFP+6ZgfQG4NImV3JQyEEDGMTWtqU3B3evaUSFZlAzEHYhLEo1MS2rHH9RhCzQ
 4sDwUkJHlCaRIjA2QjOycoS8l+2Fj/Q/j3t7IW56JOzPCqTvjyab8anyeRPlcv+a3ecr
 n0xzRGCcpyYWS4cnbhYQdnJIH0R9VZiQUFNKkJeokuk+u4vcD/s5FrutBtdzzdxtc1+j
 S+YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720534874; x=1721139674;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JqKHucI2Jyi7c0em15pkqGeMYcE3Z5p3FPgBx0iS8hY=;
 b=RCj+pNIQL5758yImg58Nh79HNeFPFNGSERN9zZDkC0WM2ps/KZeZnKtBx8GqIXYQPU
 AfEBMY92RTw1hDneSUqKyHWn/vuSg4z5gfkf7ATvXzEhhuCJ3WW02HyTnTR+UGLWqrXj
 O6FPkZKwi9lrhaD08K4AnWapd+Yewkya7dOSMOoJQ092RMdHtzckdmzD297hR/bqDwbo
 hKdV7ThfGot1Df1mOxDwFEhE4QyeoCJOxe9nH+h/ZE914qv417ETIyuRz087IXH7gvZ0
 Re+O9TtGEUZVk2UsAdBO0oBtdcdI4v+fIBXTfu7t4xm9BN6ED/+r7LqY48TYOzdoxGyk
 eZhg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX5vg0kTzfbsLzn12lazjwSAz1xC5bin7nbBq+q+9u7eJ6qrQtTnSa+5p3juQkomoCWskUXXqsoHzVB7rZzGJzId9o
X-Gm-Message-State: AOJu0YzfCONthMKdw2Ozq2KqNAyR+xYG9+POnZtlywTDPNwE6v5te8H3
 DDsmvJvbvUurdGneRgS+q9U4PJ6zofodfs2pG8GLsmpb3GLR7Hw0WLTOuODHr9xfD0t4/iacXK4
 hBmIV39E2EgeZbBnU5vW8SCQb85Kqg9IkU35c0g==
X-Received: by 2002:a05:6402:13c7:b0:57d:4f47:d9f7 with SMTP id
 4fb4d7f45d1cf-594b7e7d0f0mr2623777a12.0.1720534874553; Tue, 09 Jul 2024
 07:21:14 -0700 (PDT)
MIME-Version: 1.0
References: <20240709000610.382391-1-richard.henderson@linaro.org>
 <20240709000610.382391-3-richard.henderson@linaro.org>
In-Reply-To: <20240709000610.382391-3-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jul 2024 15:21:02 +0100
Message-ID: <CAFEAcA9807by+dye=pEXfpzDdtjK0RgF0FBLuaTOx5+iY5QFNQ@mail.gmail.com>
Subject: Re: [PATCH 2/6] target/arm: Convert SADDL, SSUBL, SABDL, SABAL, and
 unsigned to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::532;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x532.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, SPF_HELO_NONE=0.001,
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
X-TUID: SACB5HkZfmJy

On Tue, 9 Jul 2024 at 01:08, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 150 +++++++++++++++++----------------
>  target/arm/tcg/a64.decode      |   9 ++
>  2 files changed, 87 insertions(+), 72 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
