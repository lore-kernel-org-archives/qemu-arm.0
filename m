Received: by 2002:a17:504:3c0d:b0:1be9:327d:8ee3 with SMTP id y13csp176875nji;
        Tue, 15 Oct 2024 10:13:40 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUO07UwbXUDqOfetV8mqYY5yIzPN+YPhr7KkAv9MVPRrhnAIR0IAQxj4zWpOCB/5OhWkcBo3bduDQj2PQ==@linaro.org
X-Google-Smtp-Source: AGHT+IG1+nQ2aZ5/pDfMgPSZRsT77wX2OJDylbie+QAIJJkjdgzEnhrfsG4Ce+lo7qm6sjNn+6eb
X-Received: by 2002:a05:622a:14cd:b0:45f:6a5:d11 with SMTP id d75a77b69052e-4608a4c8bcfmr16429391cf.35.1729012419788;
        Tue, 15 Oct 2024 10:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1729012419; cv=none;
        d=google.com; s=arc-20240605;
        b=YUC45XgD4HsleMIS79jPai0/onWzpm4+IPZ6kqqNG1gEEvNpc7LfgRXnL6J+rmzB/Z
         ZgEXmSKEYK9vqdp2Ympau5+SMc5Ai0GnVM7Ngk2QPF83RQ31a2nxeGc0Gggx68P9OkQN
         luItEfiKktEA7+J/ET/isNH0lrV4deY/Rvrcn4uRB0N8yGiKm75J79UKIY9sWliAyqhu
         x7ILt/lyrvI42IA+OpFUy/oqAJXLDs8e+9pIVdbdqwM6ZqI+N56KdwqcGaFguDM8YNFd
         8ErK9HUBdcu4IacXBwvSxnyfZiLfsTi5OeCF9dXU7y617hUXpSJRVBY3LWC6spQRYU9p
         fZMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=DiPm4r96ebUEyaZxC+805tfF6sT6Y2BwaLiml4Z063s=;
        fh=dJadopkiTaw2x3SjzOYdqtkRYQhMld7QD6fu8wjzmck=;
        b=NYIrFJZihq60e+gkXlV8C03bRqLjzgM9rEP5rnZIcKJsQucifk3NmXg1QErZwuzFts
         YDlGMA1+lhycjWq5c2UcWxhPVAf3c8Wp04iMl+aUxkOHqAFnYDjdRfiMbiDl4TEcVvF4
         G/p9QdSoisnCJ8JtMRUF1+rBDAVyoNTkBxHMik1FU9uC/xE1ku4jomDJx6HeeBgCRXJY
         6417hbUMhxiRJ6RJIxbIzGfdp9c/FWmZwalHiQ8LS13tM5sTM1cX2Ppyg4xqcvAFL3Jt
         DaiVlopmfN6Ouj0797QkfGWXfwlo0YdxVmi6FzBhH03wFgNb5W66qd4X/aKJhbhGHjR0
         3y1g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cHP0bkqE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-4607b4a479csi19042941cf.490.2024.10.15.10.13.39
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 15 Oct 2024 10:13:39 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=cHP0bkqE;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t0l6n-0002uh-BI; Tue, 15 Oct 2024 13:13:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t0l6j-0002tn-Lw
 for qemu-arm@nongnu.org; Tue, 15 Oct 2024 13:13:18 -0400
Received: from mail-lj1-x22d.google.com ([2a00:1450:4864:20::22d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1t0l6g-0003Yx-5C
 for qemu-arm@nongnu.org; Tue, 15 Oct 2024 13:13:17 -0400
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2fb518014b9so17640241fa.3
 for <qemu-arm@nongnu.org>; Tue, 15 Oct 2024 10:13:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1729012392; x=1729617192; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DiPm4r96ebUEyaZxC+805tfF6sT6Y2BwaLiml4Z063s=;
 b=cHP0bkqEOFy5G0y/A6GjMIYvBE1HimrGxmyVcWUFnY/+iK02Hxf2FtZtFIGCsOQWAA
 XhgHAexsnqeIxah7g1D9iwOnDxxO2pY6JmhFvSJcq/1Z/GGz994djxmDsmyuL8E78cLG
 w+TX3jDqyDS0vvr896EVb9pdOBfq4kypmLp9IrFNHru0w7JBaQXGJbOfjXtegP7UiJu+
 SyNOoZhQtZVyhKC3soUboeBbEhFschPsUIY+vUKwtctbsrgWi+oeNkpMX91U0g/j3HT8
 +1IK9FMHnAk+lN5HuS4ZcMKnCraoo+tAuLEB9Qth9BnkygBlqFxwm56WVoxeCaRmHSDe
 1NKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729012392; x=1729617192;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DiPm4r96ebUEyaZxC+805tfF6sT6Y2BwaLiml4Z063s=;
 b=ZzWxZT6z+k3mya9LWsHdjDZnmF6cjy1nJDT8Maw4coHZSFgMVCLWdvgi/qwx8W2u7k
 9McDguowk8lFnMP+BnPvIlzA98VGmboHVinfEzqF0dVflcbBOdzX+figssGXAYwLySaH
 tVmkOCtwKnuQJN04BtW/3q+f+wsuHq1ldCy9LFmuduS2hqXgYqp0iBfCk1mmvDpHVG+Y
 4D1MAXErSdbSJFAeS0ExOmD6jQIw4yiJXwUHE60HAxwSFP1uc2cKtFqQTSAa4UgDbacD
 typDQo8Cy0efQhb20+jVj+vstHVyVQsfLW7WGRHGdSvTvlSKp28KA6GqfcI373SulwRX
 d94A==
X-Forwarded-Encrypted: i=1;
 AJvYcCX43pbHrW101g1BqopHcLQWtvyxArNmsWNT/PCj9DdiJ73kl5d7qAtJjTea0f3fZUKp8gkCD3N7yA==@nongnu.org
X-Gm-Message-State: AOJu0Yxs2vOOxaJSqOtXe2yLjfQFK1+uTce66v5X8c4bwNaWUiyVS2OB
 mjtCASpXOeq7QBwcD5F2AQD8pTUROZn2e2QvuypXlZ5b2VOuMNbwPlLaG10yiZ/sHKHm9Ro6qSL
 DPGC+BIWrg4TtHQlB9+OEf1Ygz07t+x01AZIoTQ==
X-Received: by 2002:a2e:2e0c:0:b0:2fb:5cff:fcd8 with SMTP id
 38308e7fff4ca-2fb61badb33mr7155341fa.34.1729012391812; Tue, 15 Oct 2024
 10:13:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAFEAcA88UGhjh8-iBvhxx6GdWg74dinYouiguTcz=qEe51L7Ag@mail.gmail.com>
 <fe5476c7-82e0-4353-a943-7f39b14e1b5b@roeck-us.net>
 <CAFEAcA-bqOM4Ptws-tsEwo2HDZ6YSX1Y+xGkR0WueRD_dUd0+Q@mail.gmail.com>
 <7bd858a2-9983-4ddf-8749-09c9b2e261f9@roeck-us.net>
 <CAFEAcA_-eTfF8tVaLk4yLgWMSA1+KjPBYyS3EjMQNC+59hT0Aw@mail.gmail.com>
In-Reply-To: <CAFEAcA_-eTfF8tVaLk4yLgWMSA1+KjPBYyS3EjMQNC+59hT0Aw@mail.gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 15 Oct 2024 18:13:00 +0100
Message-ID: <CAFEAcA95QmpcsrgCj5uE-Ng8ahNir3MuVEHWBCvjb3UwBbOFRA@mail.gmail.com>
Subject: Re: possible deprecation and removal of some old QEMU Arm machine
 types (pxa2xx, omap, sa1110)
To: Guenter Roeck <linux@roeck-us.net>
Cc: QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, 
 Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
 Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>,
 linux-omap@vger.kernel.org, 
 Arnd Bergmann <arnd@arndb.de>, Daniel Mack <daniel@zonque.org>, 
 Robert Jarzmik <robert.jarzmik@free.fr>,
 Haojian Zhuang <haojian.zhuang@gmail.com>, Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::22d;
 envelope-from=peter.maydell@linaro.org; helo=mail-lj1-x22d.google.com
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
X-TUID: KajMCaH7Q6qE

On Fri, 8 Mar 2024 at 15:41, Peter Maydell <peter.maydell@linaro.org> wrote:
> Thanks to everybody for your input on this thread. My
> proposal is to drop from QEMU:
>  * all the PXA2xx machines
>  * all the OMAP2 machines
>  * the cheetah OMAP1 machine
>
> leaving (at least for now) sx1, sx1-v1, collie.

This has now gone through. I'm now looking for test images
for these remaining boards, so we can keep them from breaking
when we do refactoring and code cleanup/modernization.
Specifically, I'm looking for:
 * QEMU command line
 * all the binary blobs that go with it (hosted somewhere that
   doesn't mind when our CI downloads all the images to run
   its tests...)
 * ideally, exercising the SD card interface if present

Could the people who are still using/testing these boards
help here ?

thanks
-- PMM
