Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32777CD6E44
	for <qemu-arm@archiver.kernel.org>; Thu, 28 May 2026 14:28:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wSbij-00041e-KP; Thu, 28 May 2026 10:28:27 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSbif-00040z-8a
 for qemu-arm@nongnu.org; Thu, 28 May 2026 10:28:21 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wSbid-0008D0-PQ
 for qemu-arm@nongnu.org; Thu, 28 May 2026 10:28:21 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-7bb0d18c7f9so121986787b3.0
 for <qemu-arm@nongnu.org>; Thu, 28 May 2026 07:28:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779978497; cv=none;
 d=google.com; s=arc-20240605;
 b=jVqAT8lIL0+s23fHZb1vVNDvQrDcPdOEqxACTtFim1WyM0EF4qrGLrBofBUPnaDyBz
 EuI7SuGOZl94JlgQRboezGOOdnVy5qkqYVqO2NI3mcLxas3KKGozv3b/FR0Ux/RzAKaG
 SkepJfE0LiRURgjpAXVOTgLeGNJwPRpik62nNh1zG9wY4p5dHZBTW1yzoKQ5bFAmNLXV
 TfX4xpVoI4pD+/4CuC6BErV5noG7yY9nuD/nbgoofN5U7ZVl5pJI5wtpOZMIY5FgPrpT
 uGrwWgyrLj9Z6X30x0tEGTzaOQGG/+VrV2zkIb4FiDZKcpoAMOwGgkvGZ/GQX3ayG0Dy
 MUQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=8ct7jLG6nYI6De/B/xTcfdYl6028bsiYvvbbLGS1MqM=;
 fh=hke+1lF8if4Nqw4L9U7tKdCEitKb5nBkLQkXOYGZh0U=;
 b=htb63biFA+73tQLxN01wi0QdIKQ0K1Q/kNtRpPTYrZ0F0tt/UiQErXfpAGBmZYRr4j
 I0ornw3dgVm3pkZNkDvTugtgohjcFE5nYcb22r7n6nF1hHKzDBJM6paxxX8hPQHfZWRE
 1ygjJDKquOgp/o30p+e/olPj+ors2Y1lht88WM7cZZM8wU85jd++zy64J9DSovUrGZWj
 qmW9jb9OmabPT49sc0co402upWZqZU6sG/QWbnu8g7maEeje5Ra6l8wO9LLZ+6roLYZF
 KM4Q93xmOxMPfG4Fnmj2Og47qXU12gbh55h3p5p5dh8ZZL9IqPIFEcviEIayisxhMjDg
 EfXQ==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1779978497; x=1780583297; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8ct7jLG6nYI6De/B/xTcfdYl6028bsiYvvbbLGS1MqM=;
 b=Ej1Gjt/5WfQP3LPfyO9SYOgvGD9SbdhdvR+dv8T0MAATRtub83Y1Z1fmnmqgSGeyW6
 Hrf3yfebcXJHy44TZ3Efx4AymEioqqleBAwbi3GWtUxhQGducAfZS5XWr0Ydak99mmgA
 CA0JlTXq3uKEENtXok3r4QaOatTofqKFHp4v/eWTdcXgvy8XK6G8s2Xei0MQYZnHnKC1
 blZeYAqjLpcS4Xi8x6juHKGS2/nqcX3FDoRWkN5d0PZMd28wG2Vj2vNWBD7DiTAMdglK
 L0co3oRb88z0Kfo75bTymiLwNKUzgYHagvlqKd5j9/GFC2cyeUku7WvlEJxtR2cf0luZ
 2IKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1779978497; x=1780583297;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=8ct7jLG6nYI6De/B/xTcfdYl6028bsiYvvbbLGS1MqM=;
 b=VAx+eSGMOkzVfrpljLPi2v69H2/CA6w+SvFs/aJxeHHcWkOqz8DbcdjR6TCGm7zkxx
 5ELPm7F8xwl5W4+AdAilI9UqIXn5ghUJc9P9IUChBypJVc3LYSlZYazkdJn51vNfjsH/
 bIWFWa3r1WZKUqjbNQGOLKFeGL/XBELzAbvVo7oTy7a5smYTOoe09Ppm9kX1362Ycndi
 fo6SZqHQ88O4XCcFdi46oc75fmyOcM70rTvkplzXAaQOXYKr246CSlk/L2fu/ix7f805
 Zgx9AY4Bhr/o0MRueaX/M+By92asdHXL+Hm5dJKNkTQF+IF1L+k9gz75MYxLarZcMr+0
 /8SQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ85m585uIftjdK3ihiELVrTME3ENt2M4TprkvU83KCKicWNmeOdGsR1MjrL1EZPwc35nPF4J/k9RQ==@nongnu.org
X-Gm-Message-State: AOJu0YwG3J9743KLpcksbJE4e+Q9h99YoTwxHtIgc0LkiofAGTORMgPe
 asuBpcpP6r2ep4jztPPFk5Wrv9XXcfMJlgtQrf4uAEDCQgytd6h8y/bOqpAAWPB7I065aZ2jCr+
 HY26qTwGOFbZaLeWJCIbB+eEj7UkoxEJqRiHI1dMMYw==
X-Gm-Gg: Acq92OHr7fp38MDH41EjgN0aP7GSZdj2UHusWyqAC3C9W2qZKokS2zqsunvedfp63Ge
 HXxYeclxGDAct4/9F3bTNbf8sJhV1PpklbAcYC3SxD8svrzkDOetp1HJSJABWlN027sE/GTCd9G
 pcv9BMy8WrdhK4/2+kLnQN49l0KVSGc55qcn5KzKk4xujpEE0k9Uv07+g1ZWtm71AzwkG9T3yJG
 IKODpsCkKfHNEnfFht8GWwlt6yp924BZoc3z+nMYltSTJe4htK54n5UiIastDs3/U5rL9024hdW
 KMqlZjwk5EgLlhCjOaLQcMnLqbnUhNZkVcT27YgIgYOSs1kwKvViXsz0nzvS5t00tNkcSeA7aix
 6gSWbDs//F5Jg
X-Received: by 2002:a05:690c:4883:b0:7d1:c256:b5a8 with SMTP id
 00721157ae682-7d33ac50c26mr284710027b3.40.1779978497225; Thu, 28 May 2026
 07:28:17 -0700 (PDT)
MIME-Version: 1.0
References: <20260521112806.504961-1-kraxel@redhat.com>
In-Reply-To: <20260521112806.504961-1-kraxel@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 28 May 2026 15:28:05 +0100
X-Gm-Features: AVHnY4JnM6IPyy5CnDL1pkD4ue-X8IKL9XJ6YXa4ODlXiauZLNXJttCH7g2egEM
Message-ID: <CAFEAcA8hbObntY8Tp+kOV7btb-io92O9GW99-6SPxigPJUjPrw@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/arm: add support for shim loading
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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

On Thu, 21 May 2026 at 12:28, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
> Also little refactoring in preparation
> to avoid code duplication.
>
> Gerd Hoffmann (3):
>   hw/nvram: add load_image_to_fw_cfg_file()
>   hw/i386: switch shim loading to load_image_to_fw_cfg_file
>   hw/arm: add support for shim loading

Any chance of some information on what this is?

There's no real description of it in the commit messages,
and as far as I can see the only documentation we have
is the rather cryptic:
  -shim shim.efi
    Use =E2=80=98shim.efi=E2=80=99 to boot the kernel
in the "Invocation" section...

thanks
-- PMM

