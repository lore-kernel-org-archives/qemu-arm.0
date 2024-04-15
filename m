Received: by 2002:a17:907:1751:b0:a52:4db9:938b with SMTP id lf17csp1200321ejc;
        Mon, 15 Apr 2024 05:52:13 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCV4kqbJMIyA1fJVeN9Pa5EkHIoR5wJTj0rFRUO5C37uItmnKsEoYPbPu2fJMubDR9lQKsYpaHftaCr28KcrAoipEZu+nCXw
X-Google-Smtp-Source: AGHT+IEpxqol5iHv9EblTeO9d3TZjVdy9R8vAisJkGuhAv67Ynt+0O2FLrftDcONlEiIvPlPHlwQ
X-Received: by 2002:a05:620a:56d3:b0:78d:6966:bc26 with SMTP id wh19-20020a05620a56d300b0078d6966bc26mr10654204qkn.25.1713185533425;
        Mon, 15 Apr 2024 05:52:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1713185533; cv=none;
        d=google.com; s=arc-20160816;
        b=BtLTWfcf0c124GHxZRB7WijyAJ7fwrabV0oWhRqJizXPwZhqJEsNMoMke3o+Q+lGKd
         N64upVrsIVKvIAgy4GSr6LTdFX3jyrmg5wuHC8KH4oOMd57bcvk0EDANAqV0gWzkmKt+
         e8a2aWUpdnLXtISUOQmvFE7h655bQoqDtbdiRClyYE5ClOVe2+Dunmrq2W51OucYQ/NF
         CVJdzbeyCXNIgWoUb1QxVzYCC2qp7//CxX36B8vbufCQAYLvX26it+u1mAJvblN5rNce
         GuzIVRz7xxRtc0l6daOn/khcYI9ttClJrkgVIyTgugRLlfWAh8ekuvxEsS10NsqUAExa
         A1Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=z8AepQQxvUrPrG9q2kSM9bsltAFNkulnFvczKTzhPCw=;
        fh=gRGqrGqz7ZPYXeqe2+/FpThRxYfflOmGoGu1LlIbgQU=;
        b=f9mv7KBFM36weLsaiGJA9XYARlefet60ES6xhFr7nyQf8rxHBxVmO4Groot0bSQ4AQ
         pQOi3U2Gn/748MzBjU9VkmDQBnAM18Ggrg3M/0Pezt+efM+VTODkqBw+IxvghdxN/vxV
         wHCrhSEoffjIsT5MuP8t5mUQ9/XuMLXChAFPHZYkVtU3Pr9JoPCmPw1u1gEwrsmpT28T
         XkdS6patYkjjas94e54d5uG9t8le6A7SGY9k74xK4kCYjIwqD8STfcR9HBqSDjhT4lwy
         kMtoJRIZwrnfAYYMoQuiOoQIWuYGAd8tqV22DNvxHRCeq7rU23qMosL1QJwvToApN0+M
         Kxtw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ivJXcFpo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id p14-20020a05620a112e00b0078d53eeb8c0si9621188qkk.621.2024.04.15.05.52.13
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Apr 2024 05:52:13 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ivJXcFpo;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rwLoS-0004dh-IK; Mon, 15 Apr 2024 08:51:56 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rwLnz-0004Dj-1h
 for qemu-arm@nongnu.org; Mon, 15 Apr 2024 08:51:33 -0400
Received: from mail-ed1-x531.google.com ([2a00:1450:4864:20::531])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rwLnw-00030H-2Y
 for qemu-arm@nongnu.org; Mon, 15 Apr 2024 08:51:25 -0400
Received: by mail-ed1-x531.google.com with SMTP id
 4fb4d7f45d1cf-56e2c1650d8so2913418a12.0
 for <qemu-arm@nongnu.org>; Mon, 15 Apr 2024 05:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713185481; x=1713790281; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=z8AepQQxvUrPrG9q2kSM9bsltAFNkulnFvczKTzhPCw=;
 b=ivJXcFpoLg20ubV/D6V5trRcSZYO8XwUq/Rj1amhIaJgSTqYKkAcywUSWEz7FTmihN
 koQoj+0TqCM6/WmlMOtUUtfgITxk0pE4Q6XpYRi0CZOxEiewsNwKOQrgdlxve9x9EPY6
 h0S7tP1jo8xON8nIM0ekhbGpTf+RfBZLWOaIfgRr0p7xX7Xssq5sCHl++t/Kc3Cl64Tp
 1bnM5MGhz0p8eCh9IjU1Ll18QT8Iq9+gITjyxwI5iHL+9q2YlqwCT8/BQ4FyhTiBwTT0
 hjDIJBQNfu8E7cjBgmfzaEDTzIvLI0Gf7nsy/vz7Jdm/zNkg0Ej1afcmDjNKitrk/1rN
 UP9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713185481; x=1713790281;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=z8AepQQxvUrPrG9q2kSM9bsltAFNkulnFvczKTzhPCw=;
 b=iRlcEPOwIR9zU6h5B+B/ztjrItnEEqAaQ7fabRQVlbIi2qPiG578I2POP7PRrm3v9G
 L4tLRdh6zHL6aleds4ZRD9OMlm5/+w8IeWpGjvHNYH0wyIzUL82FLdCMKvCMRawXBR4+
 py6SUGTq5Exgs4lu2RPVrpWcTM4EYnpJ2aTr8ryWU3Y9SjJmiBzfZA/y6kDL0Zkjle7P
 aLxYtDjvYSEMByhQPzvKRFrONdkg6JOn9C6oMClF05/16Oz5mTCKFQkxb6hHRxSFl3an
 +AQKaQVsdWgl8aXqy+tPKPnJzQ1JPQfKmzXzpkZJb65vXlsF/w4SF8ftp71y0vAcPYUY
 gj7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJ9MvHDisk4LBS7lHcQTvHBLLNx8qgctWxfg5Q/2WYvZ1kFhiSwEhI7ijwHw+y/rSqLaYBEkxhHPAX1gr2VqWmJ7qL
X-Gm-Message-State: AOJu0YxTtoxnGyoki+q6/yL/eZMXUbVSdRDVeFR1bOnmxC86jbKMFWet
 6+iSbWbZEeT/+JMEd91VjCinkbQRztJc6Ry32FlN8gTtKAXEp+KcSlHMxtl3NweUfTBroKrzjD+
 BYtOasU3yfLrPHpdO+wZHyQULjEmhlI5kBR4MrpFDSCXtfPJu
X-Received: by 2002:a50:aad1:0:b0:56d:e6f6:f73c with SMTP id
 r17-20020a50aad1000000b0056de6f6f73cmr5686900edc.42.1713185481193; Mon, 15
 Apr 2024 05:51:21 -0700 (PDT)
MIME-Version: 1.0
References: <20240118200643.29037-1-philmd@linaro.org>
 <20240118200643.29037-9-philmd@linaro.org>
In-Reply-To: <20240118200643.29037-9-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Apr 2024 13:51:09 +0100
Message-ID: <CAFEAcA_snH+ucZQELesLgf0uDUgON8Sj==4JYPHh=4oLbczxQQ@mail.gmail.com>
Subject: Re: [PATCH 08/20] target/arm: Rename arm_cpu_mp_affinity
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::531;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x531.google.com
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
X-TUID: ldvhi3+CPB5F

On Thu, 18 Jan 2024 at 20:07, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> From: Richard Henderson <richard.henderson@linaro.org>
>
> Rename to arm_build_mp_affinity.  This frees up the name for
> other usage, and emphasizes that the cpu object is not involved.
>
> Signed-off-by: Richard Henderson <richard.henderson@linaro.org>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>

Hi; I just had cause to re-look at this commit. The problem
here is that to determine the right MP affinity value the
CPU *should* be involved. This is because for some Arm
CPUs the MPIDR MT bit is 0, and the CPU number is in Aff0,
but for others the MPIDR MT bit is 1, and the CPU number is
in Aff1, and Aff0 is 0. We don't currently model the latter
CPUs correctly, treating everything as MT=3D0, but we should.
So really arm_build_mp_affinity() ought to take a CPU
argument (which is awkward because we don't always have one
to hand at the callsite)...

thanks
-- PMM
