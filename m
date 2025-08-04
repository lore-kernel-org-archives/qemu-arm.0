Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B13BDC87FCB
	for <qemu-arm@archiver.kernel.org>; Mon,  4 Aug 2025 13:44:52 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uivUd-00025u-6x; Mon, 04 Aug 2025 09:44:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uiuYZ-0006c9-Lr
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 08:44:47 -0400
Received: from mail-yw1-x1133.google.com ([2607:f8b0:4864:20::1133])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uiuYY-00069C-3P
 for qemu-arm@nongnu.org; Mon, 04 Aug 2025 08:44:47 -0400
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-71b737ec362so30271527b3.0
 for <qemu-arm@nongnu.org>; Mon, 04 Aug 2025 05:44:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754311484; x=1754916284; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rFoj7MnpEndK52mijVzk6UFCQmvSzCFXq9sOHwEs7Nc=;
 b=kTeJ8lK+/lIr0mHXDfXyZq2gENfocHawuwkMfDV3YxQYoVhTsno3L4mgw9yYCj1tKz
 S5WzM7z3Qs/4lBuluQnZPTKDdGeVaBEboaRTAypAt4Pog+XuhjRHLfTkK43KSR5ZU83i
 lJgkcrOPdZH7kT95hKJjdJD2p9rKaRiaZxIZchhrv999SstLEPHOjveo/x7xlEHSVRLl
 geQ8T9GvaSe0S+GzIT8335jDHW3Ry/cBbIYkqt93ctvOpc8CW02puB6RWxXPU47JZsJl
 FUb5pCjuWedbxV7m6OAkBaWZhA9ysu5RvEEAjgcn8gLgPG3aujcRNSBjZPo8N7CFX/tA
 Sa0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754311484; x=1754916284;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rFoj7MnpEndK52mijVzk6UFCQmvSzCFXq9sOHwEs7Nc=;
 b=mmoW2C/p8q37L6zQoKLdVrPNoIontY9JjLWlH5V0iXMeCkZfiwKe3KkgUaIF/SiEbK
 IBr+USuJrOihVzL6zMHpmAYxxZl+x3VS6DWDXTQWV35URYZa0obC3QYk4e3XZlT5ABU2
 orXcxWUb0F/5VPN5GPbf5rbUAxf/T0YpqimcdtRH3Diu5rTxSByI2CmCOsOiWZMI5VVG
 ugFDitiF811w6HsUDK3FxUEtxVOtmdagIRY+7ExBiSf96KoIlgfeG7t/4T7QvwqDJOHH
 cSVGZPrYK1gsknK1tlfB4vs2/Ssn+4XTlEqjMn0zX1eF4TG5C9nBtml5uEW2DdQwzfyE
 ZsEw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUAQNzexxJCFrgjd+lL/s7EQkEiDdYMSHHOx3gtTczxjVJ96D1jNfgz7iwGVBG28oObAeeeWK0/Rw==@nongnu.org
X-Gm-Message-State: AOJu0YwxryvCFs2Azh0/PBIEGIr2DX+tGl5kzSvzmgdqA2B/iA7A+TC4
 bCYKnsWjSpX1hVG+vb9ATjHivZvp8ggmMTInTn8WrSZBJwyPwHGPuT2R8QLDQfHykfc5Rehqv2f
 5UWUCfNmOFGcaE4oMFy+oitR/v3SsQHasqolKkCwQ/A==
X-Gm-Gg: ASbGncs/qmC8aefaiXrtO0mR5knWEDVXjUUMtlgIdd9vg635BUQY0HixLsjhexddcCJ
 QtaDFHPFRI/7SWqY76c/zJOvA6t/QSkQNk4+FFaogsDPzvdPpj2c3zhoma0WJ3ABxYhxxZ9uA2D
 HCPfOVsf7YjzMdC2K4qZpMzP7I4fo4FYD7hK5QCkBUzAkBHs76nXKABORE4a50dysI6mexF/Wbo
 7nq6yp/hHu2eE6w/Lg=
X-Google-Smtp-Source: AGHT+IH8GVBv4oakwliN/cWF75AEwH3exTqeQRZRqkpQTnx/PyGHv9mls9fLf9h/ZqJIX/fQH1W2GK/MXuUx4Yb99Fo=
X-Received: by 2002:a05:690c:fc1:b0:71a:20b7:44f6 with SMTP id
 00721157ae682-71b7ef23bf7mr120162047b3.6.1754311483902; Mon, 04 Aug 2025
 05:44:43 -0700 (PDT)
MIME-Version: 1.0
References: <20250716095432.81923-1-luc.michel@amd.com>
 <20250716095432.81923-41-luc.michel@amd.com>
In-Reply-To: <20250716095432.81923-41-luc.michel@amd.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 4 Aug 2025 13:44:32 +0100
X-Gm-Features: Ac12FXwr6Q8xC_moZvV2U3xHSSDwoZK5a7Q0KwSMiSl1ukNQitWZrAI9EwCfat8
Message-ID: <CAFEAcA_WAAUeLe9Kee4cmCC9NsDnHTOgwmiGvHje0Po+SGW6mw@mail.gmail.com>
Subject: Re: [PATCH 40/48] target/arm/tcg/cpu64: add the cortex-a78ae CPU
To: Luc Michel <luc.michel@amd.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Francisco Iglesias <francisco.iglesias@amd.com>,
 "Edgar E . Iglesias" <edgar.iglesias@amd.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 Alistair Francis <alistair@alistair23.me>,
 Frederic Konrad <frederic.konrad@amd.com>, 
 Sai Pavan Boddu <sai.pavan.boddu@amd.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1133;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1133.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 16 Jul 2025 at 10:56, Luc Michel <luc.michel@amd.com> wrote:
>
> Add support for the ARM Cortex-A78AE CPU.



>  static const ARMCPUInfo aarch64_cpus[] = {
>      { .name = "cortex-a35",         .initfn = aarch64_a35_initfn },
>      { .name = "cortex-a55",         .initfn = aarch64_a55_initfn },
>      { .name = "cortex-a72",         .initfn = aarch64_a72_initfn },
>      { .name = "cortex-a76",         .initfn = aarch64_a76_initfn },
> +    { .name = "cortex-a78ae",       .initfn = aarch64_a78ae_initfn },

Do we really need to specifically call this the Cortex-A78AE ?
Is there anything we would model differently between this and
the Cortex-A78 ?

thanks
-- PMM

