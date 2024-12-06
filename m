Received: by 2002:a17:505:a0c:b0:1be9:327d:8ee3 with SMTP id cg12csp911400njb;
        Fri, 6 Dec 2024 07:06:56 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXiwcSCckJ2XcaOK7RbuSgnkh4QrZpIoebLx6q3oX+3VZKuT9dd4j/uAD0lMWME+CLDQWue5Rq4NEWFVA==@linaro.org
X-Google-Smtp-Source: AGHT+IE5e3b9bf2foMteXMBvdcyLz909X1kzYFSV673Hp5aIB7xym3sMkhOA4FTJjHHkYABYSWkk
X-Received: by 2002:a05:6122:2a4e:b0:50d:69a8:f5d6 with SMTP id 71dfb90a1353d-515fcacafbemr4034010e0c.8.1733497615966;
        Fri, 06 Dec 2024 07:06:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733497615; cv=none;
        d=google.com; s=arc-20240605;
        b=YgmJhc/ZuDUqqnUBA3CFT8KmYH984eUiCHcc/fRxlz6IY3st/+VaAP/IbF7RvOpBi8
         hECnmTIPisnbMx5weHQVwEmHJKkIr0DOWrWxXEL+GzMSAz2neKJ+9Pxqq53aDeBoIp0f
         e4V8OAzN+AvX/6l3lnT2HemaFEU717nY2qfA0LLWyn/wGiccnxDoYOFXXh4T/eD7E12i
         XeQff6ZUUZ9UR7zHFsd8aiqAsO4qJV6zx2JZEoCKS0kK1plLKjC43TyGyT9jWzrWPPiZ
         kZ0g3ie+DACoSTFAK74vKQFMdFyCMj0sL2yf0I3BYHw0bEAxcvfVhwAcpBFcMD/o+UDc
         KX4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=dgFFuH70gyq/lM9gnWJfwiCv3S27xgQExu2iFijFMpU=;
        fh=UO+3nJi5hPQBe9jDpKTO1Gz3bhfyTdBCEI9fxp312DM=;
        b=CCBTtAWTiSzpqK3irx5bjR5OJjHDjJfaFivuFOEUkWqj/txImEM+yCIBdP3HV3Qm8G
         3/KTjYk+fWHh+YJtptfM0uv9HJVEraQTRq0Yj36nD1rV+08/TYx3Q2anJ8f8eMhTDRX6
         6oNzvcEksPzQRFg9kSDaYoWi/fJnrI2r0lNGbdbTUQVWEUiqzfDXFAa5dmI9QNWrewj2
         TlYLYIyXa+U/tPAZtjZwWN2382j8lexUDFZeIDYNoN6GLdIjp5AyukM/xRTdrKtNGj/Z
         92Ui9R+C/EwgAHVgNocoSTpl13fq1QGha+B1HeuxUJ1AnnyUcDfDU4ejec80yzfOdpio
         f4Vw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j5z7rd0l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ada2fe7eead31-4afd20becfasi258509137.358.2024.12.06.07.06.55
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 06 Dec 2024 07:06:55 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=j5z7rd0l;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tJZud-0003ux-1b; Fri, 06 Dec 2024 10:06:35 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJZua-0003uY-OX
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:06:33 -0500
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tJZuZ-0002LC-5b
 for qemu-arm@nongnu.org; Fri, 06 Dec 2024 10:06:32 -0500
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-3000b64fbe9so22056441fa.1
 for <qemu-arm@nongnu.org>; Fri, 06 Dec 2024 07:06:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733497589; x=1734102389; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=dgFFuH70gyq/lM9gnWJfwiCv3S27xgQExu2iFijFMpU=;
 b=j5z7rd0l7GyGk54ikkVIP0YJdF1yAekS8EUk7swYH7Dr0AGmxX2BbUoFsrvSdbtgEm
 tbtkfO1x+74vZhKXPn7eXJKtqS8zkyiDTDAWjvqPy7cWzG+UT4Qv/K+/KYhfhZFdgSUF
 axT+0yKUJxeldF8mvE1tdC7QU/tHGLUwdMZQdNGDCWseR+cZzp+zkANNFmb9KkKTCvYt
 rhwnbvpUPEWfmTV6wZa0/i+yLTd1J+HRb3mOKmJhErqiJCB/t/I6Dr04bWtLGHeA+tVo
 /2DBOAX26rQKNBytSx7U7KmArknwsAf1IbieOgmqIx9016MAv4lS/42oM0po17bspog1
 3tvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733497589; x=1734102389;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dgFFuH70gyq/lM9gnWJfwiCv3S27xgQExu2iFijFMpU=;
 b=vz8Y+qfUWm8l6oS2HaBWpWvcn7V1jr4IMf8p1ykMLpwZtaVr6Y5ZEIOHuSpOtSxIlV
 wBNHxBdh0m2vv4Bo8UMzZb2vVXCf1+iZn/vOlhOmWZYIW2WcDt0wS92zMI7SFwK5hHJL
 RF9m+v/xn9Xk0Yuy4NoEBEuodYmQsfFVviipzbNymb0cdlU+qexs/z1LiLHWFFMa9jCX
 f00TQ8/64nuFQ7YLtoovAQPbJy8eeqJrYLunnI+/yCot2IkfVxoouBUj9nPUMHf7mc4V
 wdhYIEd2AB29ZjWlpSAwDM6RVHjDxm/rG2yHP0t47XYWpjmgV06sN1BWn2fOfj7EEKUd
 /2Jw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8ae12yipfraSUCmSfJGCjaJtg8m9i3dwRu4gwPS2klQNGbdzkFa7SCN67tWth3zl/ihhPgsI0MQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzw4gNS1VHE6W/QcaErFOxcJbbIAzJYaz+TMofJHDtQDIrbk6QZ
 +Fwbhx3pdhaeveGFO89UxQ5NEiTF3ta6LPUj7Y8mUcwesAxKtU74jhQ8hTQZ5+iQwod4Y8znNRT
 qNMInv9QrtZewzKm18+MwAzlhV1F5Nv+PP86xjQ==
X-Gm-Gg: ASbGncsheFzY29AY4wKNZiUc2tJBd0uVla2aJtNyADfMnQoR5zP1x96iUZpKoTzy4M8
 CsIzAKHL9U4JVVC8v8bPYi+HD8sdYjy5q
X-Received: by 2002:a2e:a587:0:b0:2fb:4603:da13 with SMTP id
 38308e7fff4ca-3002fd99ad5mr19445901fa.39.1733497589133; Fri, 06 Dec 2024
 07:06:29 -0800 (PST)
MIME-Version: 1.0
References: <20241201150607.12812-1-richard.henderson@linaro.org>
 <20241201150607.12812-41-richard.henderson@linaro.org>
In-Reply-To: <20241201150607.12812-41-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 6 Dec 2024 15:06:18 +0000
Message-ID: <CAFEAcA8Ljk7JAAfkSgAk+JC2jnvKK6Ejr1bs2jun8H8O=C2xwg@mail.gmail.com>
Subject: Re: [PATCH 40/67] target/arm: Convert CMGT, CMGE, GMLT, GMLE, CMEQ
 (zero) to decodetree
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22d.google.com
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
X-TUID: DiPcyMccfE/H

On Sun, 1 Dec 2024 at 15:11, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/tcg/translate-a64.c | 94 +++++++++++-----------------------
>  target/arm/tcg/a64.decode      | 10 ++++

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
