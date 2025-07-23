Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92172C83F1A
	for <qemu-arm@archiver.kernel.org>; Wed, 23 Jul 2025 16:01:28 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uebtg-0005yc-5z; Wed, 23 Jul 2025 12:00:48 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uebtJ-0005bB-Sx
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 12:00:40 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uebtG-000875-U6
 for qemu-arm@nongnu.org; Wed, 23 Jul 2025 12:00:24 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-7184015180fso610487b3.2
 for <qemu-arm@nongnu.org>; Wed, 23 Jul 2025 09:00:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753286421; x=1753891221; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tCgXU9hvOVWLgpDa1UnUUaJctE+NxQ1fcRWcQA1RQD8=;
 b=QhkS+oXeMO5BFtCwEjnAPGl+Ki2SnSFClCDqQlwteTWURsFHJPhWreQqnv2d/lP99m
 y/LDlrgcZY2BU8pJ75RryDOFOiXFLo1IFuJ0BqTcUVdmy0aDdGEWl1MDgwsp9JSDnVwL
 qdRdjRHFM08Rb6t7KgsJ1Npp8HvkleMsjEUmK1BYSliRBg22UZfq7tVdRpjJYgVfaAAO
 0EWE7yYgw1TmgfZymfT92h4zrs36aBQI//A7a+QpBhVdG5mlFpkMlbGfxorPSwaKBO42
 Udpj6Mhu6p0/pnKBOMeTOYABtOyEuTM8Bym4m5wAnxIcEV4dZy0TwUKW0LgRXuK2/OU2
 kINg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753286421; x=1753891221;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tCgXU9hvOVWLgpDa1UnUUaJctE+NxQ1fcRWcQA1RQD8=;
 b=Itb3CtcHRioGJFwu3yQfJuYvoJgvcCt8hZCEMZltbKeXqvsxxkEGqNZ4/+ZPI8kydp
 j6K61NjLltARvH/Sp/UqbAVm8DghDrM5/or+cT5A+JcxSKqRAk8oAlxPH7GE6r4kI0OR
 0Dehi+1pRSWd3ArvFYWr6jXIEMO8GDop47p7JacG8F4RCuWQGcIe02eyxYv+/tp6iGW9
 AZHeLTtWlHG8f21/QFtJpnZ4c6G58LFNBVw0yBc2rmwDo4uwnRxOAXZcr+k+crEMjS7C
 lL2RvH+PlLgdLMBeK1PHoqMLVDkCNYREpWH/OAmaEfTFd9G/FUHPoAlb2K4PZ0MjihWC
 1elA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9VbawWJQKJhYJOJfQrRypK/Kew7Gr6t5/wmUpxIMjAPAaDFrR5AzpXyCWnuaq3g5oXCoaK2TVqg==@nongnu.org
X-Gm-Message-State: AOJu0Yxv9Sp8PPaQcU5/NFWxhxprsY+N6Mb8JkHYI4jSHBw4qW3a4P8s
 ka8DkBBKme/0gilO25+tjh61VQjbw13UCyPWjJo0bWsv73uQ+zg40cIw81m3Cp1nYoGa4g9HlFW
 OD/3VVxtWEfp1xU2pM9O7kKgRkvseUcf5CprpahfkRQ==
X-Gm-Gg: ASbGncsCUUQTBLXYvB4x0xmYDG7Dh5IAPSUlWpAqdnjCN0oJA2SGTXIvm2xbVjM6OAB
 sI/VbB304w2ze2It0UaBxq+wG1bc/4EDQm/YaE26LWYdU1XYBIaNnnEhsBqrIDxFKNoO563d1zs
 rFo8I258hkq48qSUzuw9H80qD08P9hWJ7BvsH+sXrnRrQ3S67nATS4/DRvXfTdu6qWU8Ve+eSNT
 6caUlph0P5M2uEwxwA=
X-Google-Smtp-Source: AGHT+IEXMSF0oYzdv2UBuRMDWeQnuzNa3vpnq8RxJOTWo99H4bm0bk2Cm1G5gSNAafHM7n6L8/AMVOZdSa8GABse4S0=
X-Received: by 2002:a05:690c:350a:b0:711:a598:aa4b with SMTP id
 00721157ae682-719b414aa85mr45335397b3.10.1753286420209; Wed, 23 Jul 2025
 09:00:20 -0700 (PDT)
MIME-Version: 1.0
References: <20250723135156.85426-1-philmd@linaro.org>
 <20250723135156.85426-4-philmd@linaro.org>
In-Reply-To: <20250723135156.85426-4-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 23 Jul 2025 17:00:08 +0100
X-Gm-Features: Ac12FXwOevuQXZQP7NbxE1b29-wfr8tlD8F_vOZQNV80ultj-J3yZ03TfVAAayo
Message-ID: <CAFEAcA9HMvDjKa06iWMUTYsmM6zPQJZ3fAcZHcyF_pwa5pczvQ@mail.gmail.com>
Subject: Re: [PATCH-for-10.1 v4 3/4] target/arm: Create GTimers *after*
 features finalized / accel realized
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Mohamed Mediouni <mohamed@unpredictable.fr>,
 Phil Dennis-Jordan <phil@philjordan.eu>, 
 Roman Bolshakov <rbolshakov@ddn.com>, Paolo Bonzini <pbonzini@redhat.com>, 
 Alexander Graf <agraf@csgraf.de>, Mads Ynddal <mads@ynddal.dk>,
 Cameron Esfahani <dirty@apple.com>, 
 Richard Henderson <richard.henderson@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::112a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112a.google.com
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

On Wed, 23 Jul 2025 at 14:52, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> Call generic (including accelerator) cpu_realize() handlers
> *before* setting @gt_cntfrq_hz default
>
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@linaro.org>
> Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
> ---
>  target/arm/cpu.c | 65 ++++++++++++++++++++++++------------------------
>  1 file changed, 33 insertions(+), 32 deletions(-)

Reviewed-by: Peter Maydell <peter.maydell@linaro.org>

(I think my previous misgivings about this patch were due to
not looking closely enough at it -- it looks at first glance
as if it might be moving the cpu_exec_realizefn calls above
more code than just the timer stuff, but it does not.)

thanks
-- PMM

