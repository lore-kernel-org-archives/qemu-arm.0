Received: by 2002:a17:907:270b:b0:a66:557b:2f6e with SMTP id w11csp274659ejk;
        Thu, 30 May 2024 07:47:45 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCW1tcJIWS4m/V5dXs3XlUMYi50xfX2B/k7SSk6HWp4DCXgnd+fyB++PKg5ds/C0idOWWx0IgTZXv5+7vC0Y2CDIcQXgDZgX
X-Google-Smtp-Source: AGHT+IEDxlx/vo4w+4NOA8ScVQb9T06AIiNiJ+L3i/d5Uo8V1eIHgN0H2Xn2Zo1geA4LnpmUm+8T
X-Received: by 2002:a05:6214:2424:b0:6ab:9214:ffd3 with SMTP id 6a1803df08f44-6ae0faf57e1mr37342896d6.25.1717080465070;
        Thu, 30 May 2024 07:47:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717080465; cv=none;
        d=google.com; s=arc-20160816;
        b=FXtvVsEzjzhFWHBnKYHwjUv4A1ZnJbWjbxlVXGsW4QLFQS5yVhuwmtIwr9dWSwja+s
         weyuTYBEfPPV+WIa4D2TsqkMkKs1r3gGLydy9JNKxjVxgzGOHO9tx/kP0r9oE/FtopsD
         Iwfbzq5ISX5k1shWUypFNzqJk/8OFTYj66hEFgqgpzt2itpQZzo09B1ojhumoPjfqpvv
         6HFPp1gdTWqoX4eMSVRR0FPFao7ZhBWFmsZMDND8XyOOwOV4NfjOjAoaGJIjK5MEIFkS
         C6LNE6Kcb36wPTaAyAxoRnynf2PgwX7m8odbtCcfdbP/SjfU13fUhsVHoLb5ScIbS+do
         d4wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=uKtEcIZbgbRMJ2tj3UgRE99DmXA0Hpyba50+nYLPawQ=;
        fh=x7TspwmzEQXM1P2N1259/3qLrJt6WRBG5r3rEbNnlDw=;
        b=fkGeF3GYz1Ro3pM8yRMOrsOsh9ZPTAk7iMCyNS+51BLqRtLbYzxWuGOT3dss2Zwc9x
         0JqHRTH7r9KNqcuCBtWnOZAVQZ17Al1mm3ZDl5Ushx1yI1nZR8xHwAm8AH0bGcYE1aZY
         7qpqgAwO74jeu/Gv1d5KqSNEA1SKyyF2CSqE891mfo0dyxZPriDlVJP+Ntja3ttf2sjU
         hdMcVSRazbY2i1BWHhbvEgYZaPoZk3icCqG3xKXFPaGXYXEzaN1m74nkRcpq9bEF6tYP
         tKmKo5u+HiAb9jDrgrdisT0T220sXxCvZv41yEBiMMYa0bu/wwcXOTc7kPCHLL165qRp
         74rw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nSufcHPm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id 6a1803df08f44-6ae12c8af7fsi11694296d6.392.2024.05.30.07.47.44
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2024 07:47:45 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nSufcHPm;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCh3t-00043j-A5; Thu, 30 May 2024 10:47:25 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCh3q-00042W-Q7
 for qemu-arm@nongnu.org; Thu, 30 May 2024 10:47:22 -0400
Received: from mail-ed1-x52f.google.com ([2a00:1450:4864:20::52f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCh3o-0000co-5F
 for qemu-arm@nongnu.org; Thu, 30 May 2024 10:47:22 -0400
Received: by mail-ed1-x52f.google.com with SMTP id
 4fb4d7f45d1cf-578676a1b57so527177a12.3
 for <qemu-arm@nongnu.org>; Thu, 30 May 2024 07:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717080438; x=1717685238; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=uKtEcIZbgbRMJ2tj3UgRE99DmXA0Hpyba50+nYLPawQ=;
 b=nSufcHPmtPRfvnHc5M3uCDksWQoi7bS0H2xlZZA29WbdlIou1YmzIrlfegljysK+/T
 bEYu49HgySyXsEu+t/n6Viwq1nhYL/ueI9wYm+BOu74mjHcaoMiKZvBJ3CFuVL+m4b5X
 jVRX0Yi13+UexHOG+LsAa8+YOmVLbKoDg7TCD01ypeNppXzVJTyKPX42DegsEOM0bVP2
 3Su/O3Ud0NHkmM/lmzgqUL+/hCS0eyD42pQu603YJN01WGXlJkhL89VB0bpm6rT64k6Q
 qJ8+6tPv6YbC4t/b1FgWopuHFdLZz8FlfmBUd5njfcQqbvoh1N/8497oEiRIXIbE1iaI
 oHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717080438; x=1717685238;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uKtEcIZbgbRMJ2tj3UgRE99DmXA0Hpyba50+nYLPawQ=;
 b=rlrp28sBzI8YKXSdImriXEgX2B3crEZ8VPYEqkqZ48qfFgEe1GnGTeQsnivSSvC78Q
 89v3RyqLpCxFH1hX3RxLz+QDi6vgVH/eNoTifkFUn1gV5kueqMihsTJolcjapye8h8Ff
 mAYyS8shBNaTB2rcDWNa10m4MLe3t+JyBy1jBV31auqWAebtaJei3EEnRZD+qPKp/iQ2
 jC5+5v9ETkkt1OFERylBQbHn6q3p/Xi0Ns1Tcm4WyCJVVwy86GAEzvnZ56Sr/+9Tc/fl
 MJjzA5mtcqz0J6RSTUiQxv8HPlf5XJyoKgVKOSzfQkO7zh+hS/YN52Ulu7abnOoszOJR
 bUMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX4UoXJZ2Azzn7U26j1uA/lcXesWnwOaLEfLPjhe2y3riIzALyuH+Rbok8SMNU8diMz6sucmTl9EP3o7oXn75Yw0UE6
X-Gm-Message-State: AOJu0YyIxyiUA+lyBfDKrmM3Gb2ztzOur1yjr/q9I2kKej9hwUELl9DK
 Vu4Sn4lfwfpwZa6KzHA9yfoCNst8l5b3kH7c3a+lN3skH+NHLNDwEBXQLGFAMF4DvgnMGL7RDzG
 Ul5MoRH9QGeKT+KdSWf2yFlSAfph0WbUjMDq3Yg==
X-Received: by 2002:a50:8e57:0:b0:579:f196:487f with SMTP id
 4fb4d7f45d1cf-57a1793b35amr2083303a12.31.1717080437736; Thu, 30 May 2024
 07:47:17 -0700 (PDT)
MIME-Version: 1.0
References: <20240526204551.553282-1-richard.henderson@linaro.org>
In-Reply-To: <20240526204551.553282-1-richard.henderson@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 May 2024 15:47:04 +0100
Message-ID: <CAFEAcA9i12yZdo3rM2y0+KywJ2EGbcr5ioiygPH83COHa93dnw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Disable SVE extensions when SVE is disabled
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>, qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52f.google.com
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
X-TUID: utUD4UAY5pUc

On Sun, 26 May 2024 at 21:46, Richard Henderson
<richard.henderson@linaro.org> wrote:
>
> From: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
>
> Cc: qemu-stable@nongnu.org
> Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2304
> Reported-by: Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> ---

Applied to target-arm.next, thanks.

(Looks like we already got this right for SME:
arm_cpu_sme_finalize() clears ID_AA64SMFR0_EL1 if
SME is disabled.)

-- PMM
