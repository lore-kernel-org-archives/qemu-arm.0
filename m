Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01A54CAC5A5
	for <qemu-arm@archiver.kernel.org>; Thu, 25 Sep 2025 10:18:33 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v1j3H-0007Bo-HC; Thu, 25 Sep 2025 06:18:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1j3A-0007BR-AC
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:18:08 -0400
Received: from mail-yx1-xb12b.google.com ([2607:f8b0:4864:20::b12b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v1j2w-0000ZV-8O
 for qemu-arm@nongnu.org; Thu, 25 Sep 2025 06:18:07 -0400
Received: by mail-yx1-xb12b.google.com with SMTP id
 956f58d0204a3-63497c2a27dso494424d50.1
 for <qemu-arm@nongnu.org>; Thu, 25 Sep 2025 03:17:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1758795469; x=1759400269; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=CaCP64UrwKP4Wgxn6ein3eHOxagjsn0jyFVx6H8/3gk=;
 b=fM3YVyzISysNFLDdLu19oZf2HPc7Q3bVUIuSS2fNcdpi/fAniRvtRPevVnMG7NP5l5
 xsJBFHHD0KsmBcCU+SxmlW+icGuckEHVRNQiMygO2gY0+DbOQlqvOV82DaeHp23E4ZTI
 R2LReB1vkTt9znXeuPBAH5XhbVUfRS8Q6Xt6OsWpY4I3WLxZv/Nv5x4Rw+RaWTRaRv8a
 aNOz38GLJg6RRihvaEFBd8hnmOJ+D8Njh7awv466cCHImiKYLYqhm0pNJKD36DoDDXof
 nhz4umCNmtpiW6v3RxLWkJ79vv6/Vkh34iLphY2/zdV3VIG5DtTvuuO3N04QEG8dN5iA
 vlgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758795469; x=1759400269;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CaCP64UrwKP4Wgxn6ein3eHOxagjsn0jyFVx6H8/3gk=;
 b=HSZlDLOrCUCLq/rY57rM/F4LfOTLptCCsLHdVDgRYAJjRjSOQ6/+sZNrVvdDkbpQgk
 Neum0TfTiyNQsxoVIJXNJxvybJ1pFHvIsmnPjnTqny2xxP0ch8lCH2jFpoGOoFmZ3BJp
 576Hc+GS8isSnnhq0lkLEeLz3m38o7zwzl7RbK9a8TwaUBuuEAVibS26dF9mhdhH9JhJ
 GOEoc1WEBMrmmrDa7LaQcAIRs1ehDWCi//zu4HYh3NJE/Ibyn+pIu3n2rGm9OXTk0XaJ
 uCqPE6lmr7MuS/hUBLpItGbH1egukOAa8ayIl8r/YOfJe5W5+cWtg2N8sNiKg+whAXV7
 8NGA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhvsh9wAp2L0+pFzQ/+MXDlg9xcXUAmXq7gCU+tFEqpv2TU4dJ0BMYOHNYg/HH4vK8J5/wJMWOxg==@nongnu.org
X-Gm-Message-State: AOJu0Yx4V6SUJ1ZcJcsrl2GCnJ1opA7peHns7PcB0WZMXDIYa5iVdFuH
 8Wxel1D/vu9r32qIcX2wT7hVBYc8gcg4hkjx2wonVw2Xwa4iTpTTG+jZSo4MwqNEaBTZRnKsmx8
 od1H9v3vJBD3tKON5UQZGb5I6hPo/tFy5NMocsP8SXA==
X-Gm-Gg: ASbGncuUbZFxMXUI2wyltZz9ru7CARTkhX9MfKS/kpYq4CaUN6P1GVh3NmugC6ijsVE
 a4K9VHIxkgg2DZy5lUZKnxQp5Q3j123uF7OxN5NAmIC4CQf1Vq6two/QvpSxH22NlFK41IV+oeV
 g9VIrHc9S3mo0uQ8BPCMGtpTDIyzx4tWr6eTpv4ZrUhzQhYFN6McWk0Cy0PAHRrFrPMBPHhIGFC
 8YdeMbXozkMqfjb434=
X-Google-Smtp-Source: AGHT+IGR41dPF1V0goOufSPGPWbN5X9fZqO/iCzls13ivL4E9ybbKwLbK5/8SOlqfic0NzcQyGq8ysMyQrdtwMGonMs=
X-Received: by 2002:a05:690e:251b:10b0:636:cc3:af48 with SMTP id
 956f58d0204a3-6361a716926mr1832676d50.8.1758795469249; Thu, 25 Sep 2025
 03:17:49 -0700 (PDT)
MIME-Version: 1.0
References: <20250903155410.1910145-1-nabihestefan@google.com>
In-Reply-To: <20250903155410.1910145-1-nabihestefan@google.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 25 Sep 2025 11:17:37 +0100
X-Gm-Features: AS18NWAJBq-gYZJ0HoXsE3nstejBfzePtm6cH8tKhdG1WN8D_Lqh3UsGHaQBKOw
Message-ID: <CAFEAcA_OiO9UynBQ4SO_KMRv2Z6S8VMC0NJotpePvmmavoGkEw@mail.gmail.com>
Subject: Re: [PATCH v3] hw/sensor: added MAX16600 device model
To: Nabih Estefan <nabihestefan@google.com>
Cc: qemu-devel@nongnu.org, pbonzini@redhat.com, philmd@linaro.org, 
 farosas@suse.de, lvivier@redhat.com, qemu-arm@nongnu.org, 
 Shengtan Mao <stmao@google.com>, Titus Rwantare <titusr@google.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12b;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12b.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 3 Sept 2025 at 16:54, Nabih Estefan <nabihestefan@google.com> wrote:
>
> From: Shengtan Mao <stmao@google.com>
>
> Signed-off-by: Shengtan Mao <stmao@google.com>
> Signed-off-by: Titus Rwantare <titusr@google.com>
> Signed-off-by: Nabih Estefan <nabihestefan@google.com>
> ---
>  hw/arm/Kconfig               |   1 +
>  hw/sensor/Kconfig            |   4 +
>  hw/sensor/max16600.c         | 197 ++++++++++++++++++++++++++++
>  hw/sensor/meson.build        |   1 +
>  include/hw/sensor/max16600.h |  46 +++++++
>  tests/qtest/max16600-test.c  | 241 +++++++++++++++++++++++++++++++++++
>  tests/qtest/meson.build      |   1 +

No documentation, and no board code user of it? The
empty commit message gives no hint of the motivation
behind implementing this device either.

thanks
-- PMM

