Received: by 2002:a19:ee12:0:0:0:0:0 with SMTP id g18csp1124285lfb;
        Fri, 10 Jun 2022 06:12:10 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyTPQ1YPGPTSYab2COyHDs/AW2DsoTg+DtA+w+8rRbU1mKF+hGvl1X4XNcn1HRil5DRBkv3
X-Received: by 2002:a05:620a:1336:b0:6a6:b5fe:44cf with SMTP id p22-20020a05620a133600b006a6b5fe44cfmr18592887qkj.525.1654866729310;
        Fri, 10 Jun 2022 06:12:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1654866729; cv=none;
        d=google.com; s=arc-20160816;
        b=SJxNTe9447c6a1Lke4JT4iIwW2CZS1LAXGS08YpCfD8wLjQkwCQvpdPIFESRN9VNmo
         D7CV7UGtKdiP6FvJ4RstCA/rbek7fOcdCFfYjhTomylWZ2DK8A/PuHPf4+TpCrU6lUgi
         3zGZ5hrWVoWl13jx/ipKgryw+ZiKFlB8m0Vff4/b8w0eT6M6Mc8I0ygrDsPuES38SZoJ
         p6MlaOvkFP+hr5Zjje4qmM5ktjvDe12EDoWAUQySqCEUqelalKYf0+QhcQEWgcQcBD6B
         0rMkk+5qa/8hcR/9IplZk7VSaQCmP77tMubp2/ey5YEr2KJ9btCYsD6pNRtXtKR5AI3Q
         xYtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=uTw+gjziCC3HnyLYNzMqwt4ol34oY0zGttpMaqnvARk=;
        b=py7bzluXG3d9O++Sxo7BQe1fCw1hxNSLKzpWGJ7h3c2n3cb1Bvp+FhqfH1Whyb/xWa
         DLXVSK0wwWt2/kP3aVMzLKMlHU9YBkaTPd3xrCDclHmFcF28SqY5tKCMhQ5USgaaxSgE
         pkYk0bZvF1rSUGuT5Gt4PQr9NK2z2d8AB44e92NAxbBEzh3TC4IxtvRncdphnclXRE9M
         7b/g0xmbdzzOlVJfgUFiqtQa1Nam4nco3cX4tCoCZtYJwTJUTeHYuZ1DqFdCBzjDgHog
         aNd3pRJ1nn1Ehhls8elv+WHFSS+BV4RCbJM9aw4Y4OMlJ5/yBCwsF/MAoZGXGqQwP1x+
         gtLQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NiKmnXMN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id ay12-20020a05620a178c00b006a73e1500fcsi2182192qkb.359.2022.06.10.06.12.09
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 10 Jun 2022 06:12:09 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=NiKmnXMN;
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:51806 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1nzeQq-00026u-Lg
	for alex.bennee@linaro.org; Fri, 10 Jun 2022 09:12:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:56300)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzeEl-0007Fj-Oh
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 08:59:40 -0400
Received: from mail-yw1-x1135.google.com ([2607:f8b0:4864:20::1135]:37024)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1nzeEk-0002v4-73
 for qemu-devel@nongnu.org; Fri, 10 Jun 2022 08:59:39 -0400
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-31332df12a6so123360167b3.4
 for <qemu-devel@nongnu.org>; Fri, 10 Jun 2022 05:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=uTw+gjziCC3HnyLYNzMqwt4ol34oY0zGttpMaqnvARk=;
 b=NiKmnXMNiQ0CnobWTP8MG/u8hxbrpXY2tJgA+Mtscf+H0xiv/7jFd0RDtpyphNzPLT
 dkhJnjCIrYVNut6LT+Hy7PpKbBYZFMYoaZVklTdaU4pVXr8BdL+gnMl18rVuDTRHvWhX
 UekpbVqbK+RZcuUzE0qOOFw9QIqQIBiW2AJex53f6nAM2VPBviuKewEkFXKdl+X9V9H6
 TPQ9N32jauYZOT7OSWgttZJzX2qN+R6YNJ2ad/O46jAMBSsULJpY0PZAF12ssvl46rJN
 NhMpJENkRn+6VcD4w/VVghqO/eoKFbr9DbnH0L4gcPIqV6NQ3b6FfrEEooJsVfj1LI3Y
 k66Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=uTw+gjziCC3HnyLYNzMqwt4ol34oY0zGttpMaqnvARk=;
 b=KMgUAEwxvhPv2YQkP9v1ERhXBD/UmOamUlhi2BhZ0D3q+YKcYUdZspEH5rnFEXEX9i
 Qhg2zSU8i2fOIISxlmgmPseMPmEhayumP/GfD7tFzH2POlSd+C8z6aFIZmlruW5x6/Y7
 +3FEX21BVgOmBkRlzzAmr0I/G6EaKED69n+XbQoqmAxUjqEsSYs/4Lw2kEMB7AJ8szaY
 QLy4bHda+/jNUfXRcYmio7XB3K4uXKcqHo1TfsnRood5GqkMS9xZcoT3M/F7X2WhhVC/
 YtIHstv6BNSBqDJxhvidIuRpfOQvYcyl5V6HGnHf8yBwJPAyRkQoqavjSt7ShHDFCVlr
 u8Nw==
X-Gm-Message-State: AOAM531evBeu8qq2SiHWQy528HHhwF3/QiZXPAsHTw4jGRXX3+S+Tuw1
 +Lz5rizlhWW+fP+0TRRK5wd5kT/Wb0uYfup3vwv75Q==
X-Received: by 2002:a0d:cb17:0:b0:313:caaa:7839 with SMTP id
 n23-20020a0dcb17000000b00313caaa7839mr769158ywd.10.1654865976442; Fri, 10 Jun
 2022 05:59:36 -0700 (PDT)
MIME-Version: 1.0
References: <20220607203306.657998-1-richard.henderson@linaro.org>
 <20220607203306.657998-30-richard.henderson@linaro.org>
In-Reply-To: <20220607203306.657998-30-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 10 Jun 2022 13:59:26 +0100
Message-ID: <CAFEAcA94ziZcuU0KfzpPV84sHNCNwdWMePhybRiOHAzmhsEqFw@mail.gmail.com>
Subject: Re: [PATCH v2 29/71] target/arm: Add the SME ZA storage to CPUARMState
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1135;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1135.google.com
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
Sender: "Qemu-devel" <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: DM43roiMFkD7

On Tue, 7 Jun 2022 at 21:33, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> Place this late in the resettable section of the structure,
> to keep the most common element offsets from being > 64k.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
