Received: by 2002:a17:504:3e81:b0:1be9:327d:8ee3 with SMTP id v1csp3099294njj;
        Tue, 6 May 2025 06:04:44 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCUmb1bq94Y0yfBnLyXsUwv4s7wNtAx4o1dThEt5hXWAU1l3EgTM7b5LVVk1UxpOafRqqDKc/QI52ahWcg==@linaro.org
X-Google-Smtp-Source: AGHT+IF+iXOOq6xFU7iU1cIgq/0LWp38vW07RHxRpM5o0LFw3Th9q+L8SjqAnr0veVYGfjTx3z0s
X-Received: by 2002:a05:6214:55c4:b0:6f5:3c52:23df with SMTP id 6a1803df08f44-6f53c52247amr19479746d6.11.1746536673864;
        Tue, 06 May 2025 06:04:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1746536673; cv=none;
        d=google.com; s=arc-20240605;
        b=VyKhklWu1wMLicQTMF9y52tJmdOXugutEo3Q11z+rBLXZNIKnbkJc7kCo3jbAAqtqy
         x0BMpW3eXyf2YoPZsZutY2GT8norCB9mpXqDDnx7xznwcWHuH5q/UGFcdWa0epIRT6El
         acVWIFA97aQE2oevFSJKi7sFgHGMAoFrOygKy2i4ZotgrUPsfmakyqcY84auvxJjHeQ7
         7BuRngpY9G2NziWHiE0X9QR5jKwEhgHdlBhGdzzzbardN/m5q3uEXuZIlKCMEWn5BLji
         NhjAbp9QQNf1J06Iem4ZtNozbayBtX+aktfY8gsKN0JPjSuRiQ7dSOlP6YNWmzY55x65
         cNNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=K/bcdDUY+C/t2hToe+Kzm5dxVjMfO/849eno7rwZanU=;
        fh=/JC8PFNO6sULr2VDgvzezYkKHKhVsqwfWqj6NK2rn5g=;
        b=WORz60oENDGlgcv75LmPzqxUjuZBKHyXnGVKzp4NUI/chqGRkilE4z4CNM+OqjhsC+
         2ooF4d6V4nXYVsDhldBFIgGWyXw9Bj45oHahtQz8Hj9N8/XQ96KeyWZALL1I5mEKQGSU
         2gOt+FpkX3odjXDuB/Ly20gJm0elOyRnHcyMSDPnetjnguomi0uPTBVIk8M6zBAUju5x
         MkfXdNPyFy3/1hKDx5xjg47vOmObHVm7rZbdXfGI0QlEAXAoNK+BNoFV+bb1fON7MPsm
         Zga4qfJruE6hkeGpu9dNB9IAyk4QyMSNXr6neK4OaymYyoi5pz5jrnu4DhuDgY1lJ9qo
         kvDQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eGxw7viM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1e0cc1a2514c-8780b293dc7si1736055241.118.2025.05.06.06.04.33
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 06 May 2025 06:04:33 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=eGxw7viM;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uCHyC-00068J-Fv; Tue, 06 May 2025 09:04:24 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uCHxd-00060Y-NI
 for qemu-arm@nongnu.org; Tue, 06 May 2025 09:03:54 -0400
Received: from mail-yw1-x1134.google.com ([2607:f8b0:4864:20::1134])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uCHxa-0004WJ-PI
 for qemu-arm@nongnu.org; Tue, 06 May 2025 09:03:49 -0400
Received: by mail-yw1-x1134.google.com with SMTP id
 00721157ae682-709a4f97149so3263827b3.1
 for <qemu-arm@nongnu.org>; Tue, 06 May 2025 06:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746536625; x=1747141425; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=K/bcdDUY+C/t2hToe+Kzm5dxVjMfO/849eno7rwZanU=;
 b=eGxw7viM1QZBzxdzFSqnxoMNh97qpwxEiue6Xb6RBozTzQ88SzM4Nt0KZEpCgZCI0V
 hBgMbFdZ2zrQpn9M25Qm391Iu2c0SWetHW6teOMcPiH1p1aUaQTkMldPurMNz03yXQ1C
 v2LBDr3XraOxC8xZxX4IsvmfAoG/cnyioFe0pY6jua/uoql1k8jLNK81bWEejVM0u1T0
 y1OV3dkfjd3VkN+lS2EalDL7KvPx22Vt9j7II30FnVwAegxSz5JenHm10uEs2DQn9SK/
 uDpYD0NnjbtG+V15BZN7kHq4WCDsxnN08Itv6OecS+QpPztnAP4DKwFjbyAUeKkzzhm3
 my2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746536625; x=1747141425;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=K/bcdDUY+C/t2hToe+Kzm5dxVjMfO/849eno7rwZanU=;
 b=W2LCN6hoakvgspXaycQx0F598xGIYZtLlSHIfe2No9v/Nr+Uanczvks9Oei6s0Mqxj
 339lF9qdxRKCQzXQ54rIIy+R7n8pQusvQxADwhKQ0Z4iNvZ+Ldvj1ctHaaiV3L+OcQOU
 DupIUruGaBTGMJyUX8HKjXHi25WDwn/GdrnS0BmZMm6HcPaWUoqZsJL/UB9YmnUQxPCI
 XIeiJ6VvymtKYZF9YV7t3WuUquH4wDPM//ZGz0A7dnWyH2cywMhvE7gspntMYjlovl9s
 2esx2TH785Yo0C/K1xp4eD3PtfuHcFIuJ191ky9AyD/cpXNWkvAGiuoZkwmgsl6cXeeb
 klIA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG9UByL9fnodpkgovUBNLwb0uEE0fXgDdbSjS8Jdk3QzDRZj7IAeFrRZtaugk0K+5Qm56etCKThA==@nongnu.org
X-Gm-Message-State: AOJu0YxdXZJ//U7NTkoqCbn7nIZijt0W/5w0MedY0BntaM/HHH4XhlXw
 HvcJd3fpVQYW59m7gYQZtFvAGJUMpczadOqJcfmguKmrV+KFV4P01l//H6bbSyYYOA0pF+fJcjo
 ziX4K1+JmQdMdHBjEShlGz3GB0mHvAHU5f7o0/g==
X-Gm-Gg: ASbGncuYXD011m2sqyH/OTNmbMLXgBPmP5PJOBaI6vVog3PTNdbYAYbmNpYCTwdAkY7
 yrbva9vdhBRP4sQXtnr2aw7378UIxUYkZaJq8qW9fhVxthTkwSdB4gpYngkqOjqsnqh/mmG/8MF
 ookzcYRjkpBbsgPV7b3x7oNkvGpkrN6UCKCw==
X-Received: by 2002:a05:6902:160c:b0:e6d:ad5c:9962 with SMTP id
 3f1490d57ef6-e75bf0f7f88mr5038581276.18.1746536625309; Tue, 06 May 2025
 06:03:45 -0700 (PDT)
MIME-Version: 1.0
References: <20250501183445.2389-1-shentey@gmail.com>
 <20250501183445.2389-2-shentey@gmail.com>
 <e7088647-aa76-4f64-b443-0ca354df8f24@linaro.org>
In-Reply-To: <e7088647-aa76-4f64-b443-0ca354df8f24@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 6 May 2025 14:03:33 +0100
X-Gm-Features: ATxdqUH-AfM-Df-NLOPUcNbneAyvDgmNiQWlUCUUOoruLeLydKlo165fr-PrySQ
Message-ID: <CAFEAcA-8A_r9TooHUcrt26hvP0w5cH+mbjo5wiP+=8VX0chDVw@mail.gmail.com>
Subject: Re: [PATCH 1/3] hw/pci-host/designware: Remove unused include
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: Bernhard Beschow <shentey@gmail.com>, qemu-devel@nongnu.org,
 qemu-arm@nongnu.org, Andrey Smirnov <andrew.smirnov@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1134;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1134.google.com
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
X-TUID: oa9YR9bzs2z9

On Thu, 1 May 2025 at 20:02, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org=
> wrote:
>
> On 1/5/25 20:34, Bernhard Beschow wrote:
> > The DEFINE_TYPES() macro doesn't need the qemu/module.h include.
> >
> > Fixes: 13a07eb146c8 ("hw/pci-host/designware: Declare CPU QOM types usi=
ng
> > DEFINE_TYPES() macro")
>
> The 'Fixes:' tag is for bug being fixed.

No, Fixes: is for indicating the commit being fixed, so this
commit message is fine. We use Resolves: for gitlab bug URLs (though
gitlab itself will parse a URL out of a Fixes: tag too).

We mention this in

https://www.qemu.org/docs/master/devel/submitting-a-patch.html#write-a-mean=
ingful-commit-message

with an example of use.

thanks
-- PMM
