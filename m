Received: by 2002:a17:906:bc5b:b0:a47:c39e:cbe with SMTP id s27csp1241367ejv;
        Thu, 28 Mar 2024 09:15:31 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXmZ3aqHVSBntaiWkE3gbbxouoyUTp++fSKqjd7H11ZoaXDyte/EQAO7sYTEdUa5DkwJGFC4q/q34FSkZLW2JAong5FaJBO
X-Google-Smtp-Source: AGHT+IEZSVip5RxHZGNQ4EBMxrHhkvV5tcM3xOQshqtGICi57BaRbgaTr2y7KFvO0Ln469lgU0EI
X-Received: by 2002:a05:6808:2b07:b0:3c1:41fc:d012 with SMTP id fe7-20020a0568082b0700b003c141fcd012mr3771988oib.34.1711642530740;
        Thu, 28 Mar 2024 09:15:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711642530; cv=none;
        d=google.com; s=arc-20160816;
        b=F0SVFgemShOKXe1rsUFtmldQmbIusbl0kLRGvKVTuHLll1h1PJ9Daq2yjEYME0sLfW
         HOJwcJdmbyJeKVBMcHSUK7i+G9So/8jqf1W1YXgU9ZmDzL7/UhhCXGQ8fliXHoD0H0YI
         1bnT+gtLvByLSWTYbdHOg5KVoK44ZBEJlsBeW7DuWWVPtBN3O2ViL/LaMUyyV6NhKCzW
         gwthSx2Hi6pCJcD6qtld6NF0N6iA0Hc5SUolon9reRHvIJUXXz46GHl98lqDQILTK+Kz
         XXPFFsEMeu5I0D7uGMAqEyUN2lPh7OOU15VveV7YD97pOD0j3fnEAjQNkAAioLvqDKpg
         iQkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=fjVpOpA5Iq00oSecG01Q6+gTpD1AUnFdn7uVkFV+S7E=;
        fh=cD1y7dtIiSQnm3mQ3LZT0/qS61OqzyZGHOB37bgLsl8=;
        b=M7Vb/LmawXZDMXkmusHYjrXI+vyQkye0yCxoLiPK/JdPRanHcb/NnRgL1oIu7gr7A0
         iPVAuizDR1TFM8JI/JuElzRKwtAt5sU//k8dTGQtwCLCirHbkuHBxTWhUz5o4xktP66L
         QyYG6cY24pvNhz0svfsTpcaYj4RbWwtC+U7IzEI5dEKB0RCpYKAQFAfvj2ffo8yTt31O
         ulndn4hOOGMlv0ED0eWoSHzKn04qIV9rs2bZR7bs99yxkYY/x4uMi/ZdahFkPyrG/+8i
         zAw+FQGxOL0PMa/204qA8fAdEqqcpv+NkDJB7Etmb6J7R1/v4pHD6G8avaHGRI5IUMkw
         PxXg==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qPGM8hbX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id di5-20020a056130258500b007e321f8a3a0si215612uab.157.2024.03.28.09.15.30
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 28 Mar 2024 09:15:30 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=qPGM8hbX;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rpsPE-0004kp-Jo; Thu, 28 Mar 2024 12:15:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rpsPD-0004iy-5F
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 12:15:07 -0400
Received: from mail-ed1-x52d.google.com ([2a00:1450:4864:20::52d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rpsPB-0006g3-8u
 for qemu-arm@nongnu.org; Thu, 28 Mar 2024 12:15:06 -0400
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-56899d9bf52so1545837a12.2
 for <qemu-arm@nongnu.org>; Thu, 28 Mar 2024 09:15:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711642503; x=1712247303; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=fjVpOpA5Iq00oSecG01Q6+gTpD1AUnFdn7uVkFV+S7E=;
 b=qPGM8hbXMNgwurXo3u0Bshl1ZFVnYhtZYuXXIUk9Jrseh58ytYWSJi+jGMKePkOW5j
 S5NY871P56HWh42RkyvURpZ5DgtZKF+3lRqnY+7sWLJQo/5WUojbrfamCH3N9a+7ZdDz
 4dNpujoHLlP2KA8qcKn6+W6PjCONVKTNJfKX0BfT2R/tWUc+DqDcGx22FjU/XjyDxHoO
 EWpSiJzFaIMjilFYSIrbwz/+M7F5SfnjY+5aMvGX252WVZ8Ik7BXjJIUkA4MsZnqinK/
 JK+ipaGeFW6zdynt1B/Bn7Yx+uxPazY5eO4WxV9GmsOmI+vi3DCtnpMrHsP9b7xXmT+h
 grlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711642503; x=1712247303;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=fjVpOpA5Iq00oSecG01Q6+gTpD1AUnFdn7uVkFV+S7E=;
 b=QcIq+F+Q+4y9QpCb6/7itsUdFbtsQEWeFr29mf+0Vl2mrQ1JsqIfs1AC3EkElOqKGB
 nU/y58a6gYcUsztjf4a70GJcYrxGmCvHdaoLtRQd4GFwtERISj3oGRq1fbE1s7zxwIyL
 wcpdIyAcZYK0PlBrRM/fPEtowg/fLKmyYIpPEyLVzcLkHumJ0qLU953l3v2QXX9btFkq
 6FnI3kICU1cCnU32cDeQigH2fNW+jAMNII0D0MIrfrCwdvRZJ22Z6SnjDly1x0ziqGAB
 RvHNs3tUdW4j0x9gG5ZhDlVtoCB0jFM6CZxPGyCHnZmmJpt52NzWI0vvEhADeVysuoJL
 Z5mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUgG5zAWDvqlN8qV0qMJM+mXRku1jrzXU3etLEyWD7dbtQWvmUUCY+dQ0nkoslJZKWQSwnrXoZEpiRX0+jH/0BpkTsI
X-Gm-Message-State: AOJu0Yx/w4cnFqpHRePuKyyt9UItsRDUVZ88XxvghrvEVQaz4EZkLkuQ
 pFVrB1wpNzrRL51puoVwnh+YRsU8S+omUTJYp+CQneTjVIB0SGq43Xd8UDzc42ddda2xGmId7MV
 bHNeETfyYhZ59KzfTGJdKA9TUKDShwHAqQi+Vxg==
X-Received: by 2002:a05:6402:2552:b0:56c:5a72:176a with SMTP id
 l18-20020a056402255200b0056c5a72176amr348883edb.3.1711642503467; Thu, 28 Mar
 2024 09:15:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240324165545.201908-1-arnaud.minier@telecom-paris.fr>
 <20240324165545.201908-7-arnaud.minier@telecom-paris.fr>
 <9e6142e9-83b1-465d-b29a-01f60f9cbc49@redhat.com>
In-Reply-To: <9e6142e9-83b1-465d-b29a-01f60f9cbc49@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 Mar 2024 16:14:52 +0000
Message-ID: <CAFEAcA8ERinbcx9+2mtRMvJqDRxFhMZxzTiHXD_aLRA0zrsSfg@mail.gmail.com>
Subject: Re: [PATCH v2 6/6] tests/qtest: Add tests for the STM32L4x5 USART
To: Thomas Huth <thuth@redhat.com>
Cc: Arnaud Minier <arnaud.minier@telecom-paris.fr>, qemu-devel@nongnu.org, 
 Laurent Vivier <lvivier@redhat.com>,
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 qemu-arm@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?B?SW7DqHMgVmFyaG9s?= <ines.varhol@telecom-paris.fr>, 
 Samuel Tardieu <samuel.tardieu@telecom-paris.fr>
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
X-TUID: AVf4beuwNKwz

On Mon, 25 Mar 2024 at 06:19, Thomas Huth <thuth@redhat.com> wrote:
> We are now using timeouts from the meson test harneess in meson.build, too,
> see the slow_qtests[] at the beginning of that file.
> You seem to be using a 10 minutes timeout in your test below
> (usart_wait_for_flag() function), but you didn't adjust the meson timeout
> setting in meson.build, so this does not quite match...
> How long does your test take on a very loaded machine (with --enable-debug
> used)? If it could take more than 30 seconds, you need to adjust the timeout
> in meson.build, too. If it is running very fast, you should likely adjust
> the 10 minutes timeout in usart_wait_for_flag() to < 30 seconds instead to
> match the meson timeout setting.

I'd forgotten about the meson harness timeout.

tests/qtest/microbit-test.c also has a 10 minute timeout but
isn't listed as a "slow qtest" (that's the pattern I suggested
Arnaud follow for this test).

If the meson test harness now handles timeouts, should we write
this kind of test to not have a timeout at all, so it simply
waits indefinitely for the UART to become ready after writing
data to the socket connected to the chardev? Or are there
scenarios where the test gets run but not via the meson harness
and where we would want to still have a timeout?
(For running the test executable by hand for debugging I think
hanging indefinitely is fine and arguably more helpful than
timing out and stopping.)

thanks
-- PMM
