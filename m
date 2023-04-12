Received: by 2002:a17:907:2c4d:b0:94e:1233:1117 with SMTP id hf13csp265360ejc;
        Wed, 12 Apr 2023 04:53:55 -0700 (PDT)
X-Google-Smtp-Source: AKy350Z5Ybuyw3VyxyP+7U3Orseeyz3fULq9xzA2sTJlP6rFmfxz7yVNo8U5K1JtdSljJQqOT0yA
X-Received: by 2002:ac8:5a81:0:b0:3e6:5141:e7ea with SMTP id c1-20020ac85a81000000b003e65141e7eamr7397246qtc.47.1681300435088;
        Wed, 12 Apr 2023 04:53:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1681300435; cv=none;
        d=google.com; s=arc-20160816;
        b=YL7KRvlPKrcqot1FV5I7QhQ9xsiPCRbm/fVRjVkbO3fVq33zme9T1jcT7dya9O4nqB
         yusW872k+pnUo9LLSM/elyZlMo3b1082y18d+bWjOKovU+Eh/uTJzbQxfOKD+FYwoRnA
         8dVMh6GMz0nmwRg4xY6LTLL7OwWN9dA056J/mW7H3qRJJDpdy8dOgndaAnLRDfjcavBM
         kMJipiJcjxaIlP1x7zcUBf4z1Cmd3oaF6pYjg5zTBLRNM18MYQ1KEXbz5cahRMIbXf7b
         +wHQWQKUR48jnGwxHVIr/opoCQ3IlUvSHiFb1MdPjyOt75tKVWfS/j1xbu6+XIYVQijM
         6Rjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=p9w+Fh6RHRhKmmUbadYmyOcQQgxtYPYkf0akgCNbrLQ=;
        b=cN3Q+HJA6D+fL8o02Blr5Tv9CT8f1FSBhktEVvJIkTChpoRFK8tj7L5snge0GWpt4e
         16nVZ/RkgUIgwtWnt0xiJ1O0zy/dwlkhTTxr7GCKo7QD4g5h5rTK3bKTg3kGppNrJ/5B
         tAU7ATLsz54NpXQiywROcWpzIv+153Li/Y2/FLBNrEtr5MGuYJ92C27M1OyDmb1JTIdn
         QlvJMcFi57rCVQSjAPehnAzH8mOmNldI8StOqwuPIOIN1GogyUJ3qOmo+s8WZFV9maEY
         S17K/5jhU7p+yzveCW/dfI7VKk1CYJgIhwYPlL+kc5nJCNWX4uX+j/Cgs+eyCtyI0nEc
         Aa2g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zxB6QLlC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y8-20020a05622a120800b003b9bf110a36si10132436qtx.719.2023.04.12.04.53.54
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 12 Apr 2023 04:53:55 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=zxB6QLlC;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1pmZ22-0001qT-16; Wed, 12 Apr 2023 07:52:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmZ1I-0000uf-0C
 for qemu-arm@nongnu.org; Wed, 12 Apr 2023 07:52:19 -0400
Received: from mail-ej1-x62b.google.com ([2a00:1450:4864:20::62b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1pmZ1E-0004G1-QI
 for qemu-arm@nongnu.org; Wed, 12 Apr 2023 07:52:10 -0400
Received: by mail-ej1-x62b.google.com with SMTP id
 a640c23a62f3a-94a9bbfe3ecso182061166b.0
 for <qemu-arm@nongnu.org>; Wed, 12 Apr 2023 04:52:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1681300322; x=1683892322;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=p9w+Fh6RHRhKmmUbadYmyOcQQgxtYPYkf0akgCNbrLQ=;
 b=zxB6QLlCL+Npv/EFDd2bb1P62Bxyri1Bwy0iEpdBKGQpFp0kQxxvst611wFEqGGMUX
 bzNaI2koG/wKLowwFRhuiJh8OnXu0H8DnNF4V1HiwX8q+3P+jy/241DroCVdakJvtqsJ
 AQ2e9aDmwMItS2LL/suXpuHoxBACU/X44rCeMnXVyC6TOR/QCfWaLrNRBa79UzzSMzGy
 0HVjsI7/lt2sxrhX/NmDQa4YsJrldtNCyEIV2CvZPStvChXM9SsXrS2TUlUOdhoSgBlG
 btTMh/VV601avv4XUILzu1ppJIMgbHGkwgo4q6gX43RyORJKphTV2BmLKX+ULyLHbFpM
 ZXzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681300322; x=1683892322;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=p9w+Fh6RHRhKmmUbadYmyOcQQgxtYPYkf0akgCNbrLQ=;
 b=CTYn5fdWV28OcZXQ7RTaPIeBCO9mSOTyDTuuU0q5NHI+rZcppYqVtfKoAEDtOFcmdC
 1rfxDx2Z0EFXsdeBmr6c+kfkcwt2gYNkT3phdIgPOTqY4YtNPRx38pIMeswwl7R3FLkg
 75mo0G08Wu5lieO61r8w30k816Tt/iWBont/dL42HR7uFjxN77GlWUOjkiKX4q3gm+l4
 xK1ly64xA0MYfx3z6QbaOeyC7AYZbrjZq2E+/6cQQoTI7rS2LmiKAYrdwd4BSl+oJYov
 MfwHmKc8qj2WTFFhW+9ujKMCExZYOea4i9lbw/ummtzcF5p+gy9z2Q+M/9GYCW6EXfeC
 mPcQ==
X-Gm-Message-State: AAQBX9c0TOSeUFB/mN91NVRmM4+8G7I84YkxrD5F0CLff3+Hhs90MNl1
 KNjDL5gJN8dtCo1ytJ47AZaHJw0tBcPUkIuGLuuzcQ==
X-Received: by 2002:a50:9fe1:0:b0:504:87d8:ac39 with SMTP id
 c88-20020a509fe1000000b0050487d8ac39mr2888655edf.6.1681300322278; Wed, 12 Apr
 2023 04:52:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230408000118.50854-1-pbartell@amazon.com>
 <c56f4f56-6cba-ceaa-9f89-228fafcbc2ac@linaro.org>
 <E3A05628-86C2-42B7-B17B-64972FE60834@amazon.com>
 <CAFEAcA8pSvbFwcbstF1q5y3yE8S3R-X4LKgihq-PFY0F02fw7Q@mail.gmail.com>
 <F1E57852-8712-4BB0-95B2-E3853B59F0D2@amazon.com>
In-Reply-To: <F1E57852-8712-4BB0-95B2-E3853B59F0D2@amazon.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 12 Apr 2023 12:51:51 +0100
Message-ID: <CAFEAcA_uUj02NSq3i0ANSWMNtp6Hwk5exmU-xfg0dpxLCg0fJw@mail.gmail.com>
Subject: Re: [PATCH] target/arm: Fix debugging of ARMv8M Secure code
To: "Bartell, Paul" <pbartell@amazon.com>
Cc: Richard Henderson <richard.henderson@linaro.org>, 
 "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, 
 "qemu-stable@nongnu.org" <qemu-stable@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62b;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62b.google.com
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
X-TUID: wiIk/CQWXRnE

On Tue, 11 Apr 2023 at 19:12, Bartell, Paul <pbartell@amazon.com> wrote:
> Bug filed at https://gitlab.com/qemu-project/qemu/-/issues/1590 with binary attached and some additional logs.
>
> Adding the qemu-stable list since semihosting and gdb debugging for all ARMv8M targets is broken in the current stable release (v7.2.1) and previous stable (v7.2.0). v7.1.0 is not affected.

For qemu-stable: if we do another v7.2.x then the commit we should
cherry-pick to fix this is 9094f955 (which unfortunately didn't get
the Cc: stable tag when it was applied).

(Thanks to Paul for tracking down this commit.)

thanks
-- PMM
