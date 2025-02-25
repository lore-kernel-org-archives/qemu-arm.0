Received: by 2002:a17:504:4644:b0:1be9:327d:8ee3 with SMTP id d4csp246914njg;
        Tue, 25 Feb 2025 06:21:50 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCXAr7uQgIFK4R2w5MuXImV8fG+eunTeNAm3jLg60JSWlhqNvviaFW6QhaYkQ2FTuMWKeNr4Tfr7JDolcA==@linaro.org
X-Google-Smtp-Source: AGHT+IGmWbk3IFjYFF6QPTPUE8ZqG7HlSPHRqeSU4J0tig5VieXh9+OgAczYSw1I4NV1eEmOFhOI
X-Received: by 2002:a05:622a:1994:b0:472:70e:8995 with SMTP id d75a77b69052e-47222978129mr279546641cf.52.1740493310384;
        Tue, 25 Feb 2025 06:21:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1740493310; cv=none;
        d=google.com; s=arc-20240605;
        b=IauSx4jjliUTZJF0OebEZ1JGgztg5wEybI24W0WkI96AJ7pX+AKdjrpOy19ShijFGh
         ZzgygaiC5N2axl1EQfT4WCV6wGFJQTYVxaCcicPuv2jj7FAWS2VhAt0Io4k701SSxhEz
         QrV0ssrMdB48qF3BkWGa9yHJabWteWVoRHxWMcmwbjd4ho/zslD2sEibiIBwXpIjClDj
         TxyiwTWIs3rVrJv1T99SUzA+tia5SIWPIyccyxLJhBhkk0HB49CXqqiOdcq9LzUUbApl
         DoMXsmMU9OYof/FmsC9hRDaY4QLEGrSpfwYH5Avi7AWWI7TZ5mtzlNAS+QD4AxuvybGm
         R4Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=82DEW22uAFsv54Y58YBO4EhI2WtyZctL9L4mAS15Np0=;
        fh=ypIphaZMwmSQiiX4EGNJqiGVm39aaHBttopYevCtOeY=;
        b=VEeWzo9mk0wUsZCRsF7Omt1PXcEanVH+KgLFiZpnvx5dKlL+t1aIlF2FLf1JL0MR1V
         lW5U8ik8ZhPGB2hpEkSaYGKazSw8jwXpvkz+9F3L+telA4/BbrBJJG8afN8WaHqTfPqY
         G6ONVZPMvs9KfHFeCtlaAHyHcSZBnXmU0LlvnEjP2ITXsbqFaqsHJhQB1K0l3GP9X50i
         0acgUM+h8UUTNtDuDYAWHdLTsglVuv3PM44utc8DOn3xUU2m9m7jWKPzemdKNshmdO4t
         WD6DfnwXYzpKeG1vYHRQ3u2pVWzc+cIQcJX+BqT8V2vWNZz3rvLcYEx+ZOsyp+uLKUW0
         eXuw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZYs0F4wu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-473780818d6si17711191cf.249.2025.02.25.06.21.50
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 25 Feb 2025 06:21:50 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ZYs0F4wu;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tmvoh-0006ZB-Ey; Tue, 25 Feb 2025 09:21:47 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmvoX-0006UZ-LV
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 09:21:44 -0500
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tmvoQ-0007Qs-FG
 for qemu-arm@nongnu.org; Tue, 25 Feb 2025 09:21:32 -0500
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-6f74b78df93so53558517b3.0
 for <qemu-arm@nongnu.org>; Tue, 25 Feb 2025 06:21:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740493288; x=1741098088; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=82DEW22uAFsv54Y58YBO4EhI2WtyZctL9L4mAS15Np0=;
 b=ZYs0F4wuLn+BYDxTSBlrSNKUWWi33JoCHn1B0ISNa08rTVGS5A73qykonf4EisX9Vf
 SXbSztKpLTwhMVcekgWBByKE1evipLJ7wNpboEd4qApVUhAHp1S/1LJujIiRsNmkW8ft
 t6Bijh7xnFLryzKQMYUMh8UxtLj3S+bjnGPqk5bSiSTvJZMudOpbZGd2Z9q7jLkbssJE
 wzToXViwgyMbM/Bl2bjY8M3u7XGnytHGDlGpCTum8ck/hFuRxbExfMo1SYlC43xcOBpC
 Ztg1qkGtoW+HqhYCG/asvwolrbQCKjP+Iv/EEQrJCTaInFnG5OGPuZ7BwC7e750ZCNCQ
 PNLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740493288; x=1741098088;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=82DEW22uAFsv54Y58YBO4EhI2WtyZctL9L4mAS15Np0=;
 b=YYQYstjNBVNsLrUdhaOijQ+Us1t728iMKcS8WKVGkpxD21nJGtA0DY+o+i/GCdEYEF
 Dde3xxyp/+n0bGuBx1055w2s54en+6XCwZ7jL4meDzRVl9PIqpKxoXJFbwAeErC7UKkd
 fuIhbgve1VQojfmL0h+xKi7CJYc9GK/SoPvs4lXM5oZlkEDo99NtNolu8QZw8DDouImG
 8mBvXsjy2Yk70t8p03tDQx/OIC9rdUKy9vEkikZsexcOLlDtaty2b38uF5/1pFcYQ27L
 A2Guap5U10tTz3CgqFOg2lMCjCS9Q5zMA23uYpEnbm6mCpf/YhhQ+JrJhAkp9AB856vY
 xqFw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUe+fJNghPQ9KgpY6c2Yz0BQehTOwOv2IlOfFK0rAM2sNaoNWQKmZw4GzhyJoim4GqAi/tWRIUirw==@nongnu.org
X-Gm-Message-State: AOJu0YwAyy94g3dTr3t58OmMYmzrcW461v9XT6HLlNU/fW+A2G+w8gir
 P9ewduBCS24zHV9dRBy3GAgv55v2hOroVbfzNTtcO92nJafF5u3TB5SsImgFPT8gr64VdG6dlLv
 4owT7Yh6ERNSH66Hf0qEsE4CCKMkd1woAEWcS3g==
X-Gm-Gg: ASbGncuux4BEvL/jNR1ozLHMWPgm4qH/wjY8B5ySUgokntKr882+RUpINNzz1tGFGUA
 K7Pxx84TR4kSFKjSdXObtkYl3bPYm/P5uVuIUWOFkbEbHr8eZgtgQgbTO65iKj5S4W0A2x9YQQS
 4HrmZcyiLa
X-Received: by 2002:a05:690c:6a0a:b0:6fb:9495:1650 with SMTP id
 00721157ae682-6fbcc235dd8mr157385117b3.11.1740493287754; Tue, 25 Feb 2025
 06:21:27 -0800 (PST)
MIME-Version: 1.0
References: <20250223114708.1780-1-shentey@gmail.com>
 <20250223114708.1780-6-shentey@gmail.com>
In-Reply-To: <20250223114708.1780-6-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 25 Feb 2025 14:21:15 +0000
X-Gm-Features: AWEUYZlRVKWPPJQVmvT2l4P7pv6igPT3SESkS6yWN2IcVJzWFnlS0ZpTsSWNVD0
Message-ID: <CAFEAcA-5g2=2JxorPGkkYR1X9LmR2HBiW_zz7+4ZGwQT4y19fA@mail.gmail.com>
Subject: Re: [PATCH v2 05/18] hw/arm/fsl-imx8mp: Implement clock tree
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, Paolo Bonzini <pbonzini@redhat.com>, 
 Jean-Christophe Dubois <jcd@tribudubois.net>, qemu-arm@nongnu.org, 
 =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>, 
 Laurent Vivier <lvivier@redhat.com>, Andrey Smirnov <andrew.smirnov@gmail.com>,
 Fabiano Rosas <farosas@suse.de>, Alistair Francis <alistair@alistair23.me>, 
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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
X-TUID: oMOXpJMJFjQe

On Sun, 23 Feb 2025 at 11:47, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Fixes quite a few stack traces during the Linux boot process. Also provides the
> clocks for devices added later, e.g. enet1.
>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>
> ---

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

thanks
-- PMM
