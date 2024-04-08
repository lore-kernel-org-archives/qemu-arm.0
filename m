Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1238482ejh;
        Mon, 8 Apr 2024 05:37:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUMe9+ryXcMF/HXhX1sBVkiV5EithehJFcjXc7BJxjE6o0aIVnkz7PLyBnYjTVNTmzKq4mm+XTS7nESUCWekxbT7Ma+Vlpi
X-Google-Smtp-Source: AGHT+IGZYmbkoEp0sqWMwX/2IKJSUkr7QCIGhlT5FHUhlUG5YryGe/lg0xtVczCknWvUAMLBCFCf
X-Received: by 2002:a05:620a:1788:b0:78d:641e:826f with SMTP id ay8-20020a05620a178800b0078d641e826fmr4374212qkb.43.1712579854378;
        Mon, 08 Apr 2024 05:37:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712579854; cv=none;
        d=google.com; s=arc-20160816;
        b=rGyY6qbPsdvVMSXDEo+HpSTfWNZ79NoUlKyYxCNZHQYNC3/w3D8ZmKXGpVg77zgSMQ
         bREk3L1+U8ETYNGnHQORioEElNjxeyVy87jYvVuSUscSd5U2nVTBtqSTGNcH+rCe4hGs
         3lrDOE2KgR2/iRIi4pTRwkraX0FjGslaVbYmanxKNyJudxDViyLHPmNLZngZ6F/ZgB/u
         pUDia578G+4t4FOmXdVTKPinJYm+iCvLCvQ2cyb5vRkVT7np5pfXy2pVmmoyl/VGIJjD
         lXKgsSuUZwr5eR9dfeBaTxHicDDPe+IjmbOQ3wwIKAcy0XrHcU5zqGM72rOcm+5qNZcq
         xKKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=9J/ZVhREruH9TnriC5uGWKBw96sf+KUPfNqRr+GOaVY=;
        fh=5vgTseY4GfksZPCqE1pAaSTEOm++X82P/Vaq1Fas6/s=;
        b=SxcoI7pDxkWExxn0R+Nj37AVq1jWHi+FkOGkbSiM8yfFGJ0+1JkoEI6ZvI8dXQNVGj
         5MUaHTWvN6BBSf/pOF8b7wP3cuyx8gGjulp/K9FnFRiFAEybyYjRiI9YDfbBulRy0t/j
         1h7nHQAqlAPBL79tTLSmWB0PLnBeiNn17HspXateRFXaHk5zqQ+KApFtwuC8liEV/Vry
         9zivuTiFonqai6TCvoGUVkpvwacRTBEOEZsGBDp/fG7enxK3qzdrqwBsR2JgCSDezK5t
         e6BE5b5QMCPggC0rSBAJsOY+WA8GM4i4/q87bbqI3e+MAeSv7x03XCsLp1H373ePy8Ox
         d16g==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yYUKt/Kn";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bs7-20020a05620a470700b0078d54355829si4014658qkb.525.2024.04.08.05.37.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Apr 2024 05:37:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="yYUKt/Kn";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1rtoFT-0004Lu-PK; Mon, 08 Apr 2024 08:37:19 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rtoFS-0004LL-Cr
 for qemu-devel@nongnu.org; Mon, 08 Apr 2024 08:37:18 -0400
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rtoFQ-0001X5-Rb
 for qemu-devel@nongnu.org; Mon, 08 Apr 2024 08:37:18 -0400
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-56e47843cc7so1435937a12.0
 for <qemu-devel@nongnu.org>; Mon, 08 Apr 2024 05:37:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712579835; x=1713184635; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9J/ZVhREruH9TnriC5uGWKBw96sf+KUPfNqRr+GOaVY=;
 b=yYUKt/KnNzg4DLng5jfVquVEh64TdiKYesJW7fLFR05AKOG4fl+8QpkVSXnqFVzY1Y
 Mj2v1yLY3LYEH8gN5BGDCmP5OFO/jWQXdnwLR46A6pOTPcrvupswhT6pVSGMK6MxK/BE
 t5FguxflC2s5vD577C3px2xQGnZdHPw1Osy0vhbu0MteQ9U4HhxAGzJVCVpxLSRnGRLA
 Ey/g/JeIdRxyuLPehHeCLwVpOg+uXbbkOSd3xVJsAaIMaR8yzl07LE7vJCzifK7NHgUW
 RERM0AWuUavEzZ+/Esl47TfQM4ki10ZTtBlRPX3FGY8Mu/5HNr6pDwHatxof3cDjRfzO
 iN6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712579835; x=1713184635;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9J/ZVhREruH9TnriC5uGWKBw96sf+KUPfNqRr+GOaVY=;
 b=gIiphj4BFFbllGQQm9+qeQw/x5xr1QnrGFHhmymhqicqB/ACGVa5e0Xc0UpM5GMWOE
 5dp+P0iEUIYusQUlMN81P+8nBVCvpuAB+O8XI8qY5KH+IdPRuk+EVRKuXrbT/sUqKrjf
 gVKt+ypO7mWLQ/d25K/iaXbypPzpGx5024RbUIXF93h5DH7VEjFJam6OFr8OHuHDVNnm
 2doZqO64x7lIQmxXIGy0Dm+Sz+xFHpkb6xkB85Of3V9D+SUgjvQitgkb8xDi/CXS8T4U
 5oJMT+04JlJ9d57k7tYbeAgWRkZDjZofJTrOVbpetlBrLJ2IzFBDEf/wTxS7cf08q3bH
 xpkw==
X-Gm-Message-State: AOJu0Yy8FSsIVJKPrlq8FqzId/0qcjo5kbyXwVSYarzzIYhI2cbjD3hJ
 Hr7z/3akE3A29KrZiUvfXdMygZ/YjePtLB/vcw5+O+3pPlOL8/1g+7WfRQUJluhOLAwxIslZCtQ
 T553AWvmCMm6z9GxfiBkkwpz5GAv/IHIiqIhMSA==
X-Received: by 2002:a50:8e4e:0:b0:56c:2f3a:13a7 with SMTP id
 14-20020a508e4e000000b0056c2f3a13a7mr5645901edx.25.1712579835336; Mon, 08 Apr
 2024 05:37:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240408105149.59258-1-philmd@linaro.org>
 <20240408105149.59258-2-philmd@linaro.org>
In-Reply-To: <20240408105149.59258-2-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Apr 2024 13:37:04 +0100
Message-ID: <CAFEAcA8u4HG+g_6Vpv53yq6SW5g3GSUYsjo=S0vc3sZ2Dzgs1w@mail.gmail.com>
Subject: Re: [PATCH-for-9.0? 1/2] hw/net/lan9118: Replace magic '2048' value
 by 'PKT_SIZE' definition
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Jason Wang <jasowang@redhat.com>, 
 Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Chuhong Yuan <hslester96@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
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
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: 6DSfMXqgxpbH

On Mon, 8 Apr 2024 at 11:53, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> ---
>  hw/net/lan9118.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
