Received: by 2002:a17:907:270b:b0:a66:557b:2f6e with SMTP id w11csp191830ejk;
        Thu, 30 May 2024 05:30:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXBkrtA6JE8Gz+ovNTKUQN1ggCD1MVW3buLMtVwhGrXr0MDmCX9yyz2jzVU/1EXnUSSbnkwXiyGzvL+OvQF27zVqIEiKtiR
X-Google-Smtp-Source: AGHT+IEgCGL0PSCJnwLqCvg4QxKFMv2TZLyEXEeZ4W0gMRzEpUKxvUi59yWUL2RW03bZmCcC8ati
X-Received: by 2002:a05:6871:284:b0:250:66f0:2a67 with SMTP id 586e51a60fabf-25066f08e1bmr1815992fac.37.1717072231360;
        Thu, 30 May 2024 05:30:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1717072231; cv=none;
        d=google.com; s=arc-20160816;
        b=wxMA+Pju0qFkWOitJsXccIAVqYaeu+pXN0+w6FeWj3BZDV1qMpL5XDwDseh7MHp/53
         lTB9WlXWeM1Zxe3XvFOFyVLfgCQpGHlZsCj5ORVcT8H8g5OEu4uGhKn//gUAz80J/DQZ
         viQCdJhPxGMNzWw7HC5Y4zMLpCa5QXEbpbaAjmNrVaoU+IvrXEIbLLaiwAgpn9vRG4N4
         n1zKv0LNOEEB+IColohoBSMnDylZGzJu88PQPTfvlWaAoG5TXmQ0ErUkJdjYBJ6Mopyv
         XdHtb6MPVUujhXDGtKilPx5RF4RcmI7lBJMN0ybjQ50ijTLPt6UYFzBsZkhJCBOxiw3K
         iNQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=mdqq5OfvF34fn5ebcEhL19Xw8v13R2F9/z4VSD3FqgE=;
        fh=FPAUP9IfAyKiNCV5bzN7a2pg5JcfLi6TY/NyeuUTG/M=;
        b=gV4GtFKuqCbFPtyzpv0PURRsJ2hmvQ6e5i6a4O1sF7Dz8XOCX1m3lXJl6umSix/UAy
         rf2jG+2YNgZ9rPsnnApugPdvKq6UTozGnXKaYezJGbiZ+ttjCahKtaZaIAXZmsjrMP8V
         ETPUb9aC6mcRWN6E9Vro0iTUnd9VkXYUy5WYk0WCzhu+PAcPe8JOuH+8SRw7zFkg5cEW
         w9v8OZyHxG7GV3aQ282R/FfKOUf/5z5UNYUc6xkSWmlAGxUSoen6zuYPjFWfNuyoqRdi
         N9v6Whr4/9N6PCsOfM04tk3RT8HHti0tDwGeAmJWIh62B+zyWLjYNClTS8qQjeWzq7sS
         NAfA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SSvnMAYx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-43fd57c58e2si75920941cf.734.2024.05.30.05.30.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 30 May 2024 05:30:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=SSvnMAYx;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1sCev7-0005k5-5g; Thu, 30 May 2024 08:30:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCeuw-0005g6-Lr
 for qemu-arm@nongnu.org; Thu, 30 May 2024 08:30:02 -0400
Received: from mail-ed1-x52e.google.com ([2a00:1450:4864:20::52e])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1sCeut-0006xt-V9
 for qemu-arm@nongnu.org; Thu, 30 May 2024 08:30:02 -0400
Received: by mail-ed1-x52e.google.com with SMTP id
 4fb4d7f45d1cf-57a1fe63a98so599208a12.1
 for <qemu-arm@nongnu.org>; Thu, 30 May 2024 05:29:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717072197; x=1717676997; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=mdqq5OfvF34fn5ebcEhL19Xw8v13R2F9/z4VSD3FqgE=;
 b=SSvnMAYxqJCHAabprvGN8+5ptumJ11SYgepU9okbqxHTuJgPdTJ1XPmf8xmmfG+eFz
 kAeIcccarteGK0YYwSferPUULaNEfEh1UV71JTU63cF5W7KIRt7XIUUgFWf1XPLaCR+R
 JG9QdCYi3M4uYHUnMYVQoxWH0jgiq4wfSYcKstluVh3+De0cPjlM9KeBuORN/tGs/BvW
 yVvnj8uM+TJq53hmMczLroq9TRpxLrfSP4H4MZyYZuZyy5m7tfPi97J5d87PPdlm98Sx
 Txh9DSVvFnqsQCb27GXQXDQ0u0OvXd71I4NwVHZiwAXPfO98E+6yxa5740TNDNZEGbLG
 K9Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717072197; x=1717676997;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mdqq5OfvF34fn5ebcEhL19Xw8v13R2F9/z4VSD3FqgE=;
 b=CXfqGFzuAM63p36iH9/bb4P0uL5zpXnrYzw2O2ymVbkGM2MCMB16HX3tb/NLPxxprv
 DVWrhMjpZco61NPWHqVZ+u0JUIH5nwVy+/yiYDe5gwILBeMpLyxD0MuOBWfQkPy9UlCF
 csyxFwI5ePB+Lb8JWDINDJURzhNGN8InxwX4vztOgjuHnobIImCj/lWXEDMVMI2Nt8hO
 5F4ULxSbZJ45gpmzX9yZCJs9gqo0XEGNztKG11rC0ojHSabpQZfj84QTlU2GFA0o3ZDA
 xjVcdVl/rR3wy5p+aL9oD+O/ssmz3AnqYX2viyvsOYCjMoZwVSm+niVyVSKdN4y1wqs3
 n8KQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZlwZ5SlKDtYxABhVmAXF8iudjLNFL4BMKBzqII6HmbVk0rCASVafNR4yg6pPywBFllSBCmrB5M+7iK8U9oMJpm2SP
X-Gm-Message-State: AOJu0Yyc3CgdOhRDkLpaqk9163zbwKexXCW/ACp+dyAictU7fKp1nKXY
 3zdY9k81p8wIsQeHDivufXgVUedFJbdniCH0TeUVJFVJro2c0B3lOVWjnPMYtKM7WashL24iPMd
 K7pmeiGUwBN6w30poQaMkkbt+kxrtqWkDoFRZ1g==
X-Received: by 2002:a50:d654:0:b0:57a:20f3:d32f with SMTP id
 4fb4d7f45d1cf-57a20f3d3d8mr913100a12.16.1717072197188; Thu, 30 May 2024
 05:29:57 -0700 (PDT)
MIME-Version: 1.0
References: <20240519094106.2142896-1-rayhan.faizel@gmail.com>
 <20240519094106.2142896-3-rayhan.faizel@gmail.com>
In-Reply-To: <20240519094106.2142896-3-rayhan.faizel@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 30 May 2024 13:29:46 +0100
Message-ID: <CAFEAcA-GHUzcjK+ooCq-D2iaNhTVa-A1QQwgeabMFwZdU7r-HA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] hw/arm: Connect OTP device to BCM2835
To: Rayhan Faizel <rayhan.faizel@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@linaro.org, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::52e;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x52e.google.com
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
X-TUID: FVqDlC5vCZrv

On Sun, 19 May 2024 at 10:42, Rayhan Faizel <rayhan.faizel@gmail.com> wrote:
>
> Replace stubbed OTP memory region with the new OTP device.
>
> Signed-off-by: Rayhan Faizel <rayhan.faizel@gmail.com>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
