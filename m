Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC0D2C5DF67
	for <qemu-arm@archiver.kernel.org>; Sat, 15 Aug 2026 14:53:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wvFlB-00084c-EB; Sat, 15 Aug 2026 10:53:21 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvFl6-00082R-AF
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 10:53:16 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wvFl4-0007FX-8L
 for qemu-arm@nongnu.org; Sat, 15 Aug 2026 10:53:16 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-836ce6cbe1eso24591177b3.1
 for <qemu-arm@nongnu.org>; Sat, 15 Aug 2026 07:53:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786805593; cv=none;
 d=google.com; s=arc-20260327;
 b=FI+20MI3SDPrU691YUq3Rl6tecnB2HRiRQk3nwBAZLkflPmpyMcgmPNGSJJYLv7pxK
 ZvsbRqzrIhkA+Ljx40gKGcBh8dW4Zzu4lTr8qMREcUIdpcN+g8qTuRX6mX6y+yDJ2BzT
 fWBAGfSXIihhJa3U629I6LKMvYUQD3e6AiBizheVRt7rmmrshKxvVQlEhrHczDsKi+9t
 ip7xltBRMWZsdY/L9m+0piG18pvWj3yuQdOF0Bqj7Mk4czGEx6yKCcJwAtBEaa/3UHdJ
 ZGeauULyACePBqClFsUTW5wWGKG3zPy+71AsOCFTn1yCo1RkLnBRbbBuiGBSxeOvrUB/
 M9fQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=gbwFturU1lhddObbcEkxPnxbVvNHsQRAHmkziIayWcc=;
 fh=ARA60nWkjtgRycPXip6HcGboWG/OfO3/jJWO8ioPi9o=;
 b=UqQokBHky6HlM2/6X1nWniyEZhL//ZA9hQ1iz5GAjfCuPibJd7of09Si8TJONNE1iv
 gqWZ3GzhhAx8pZ2t7/TFfyPzJh/oEBJCwLY+oLJ9We+M9DFjVKstaGCpQ4pqEPtJ9pNG
 VJQeA2W7t6/EKKhHhqGGEdNf/cl4XSf+QB8Kr39nlrZ6YtRrI6uiND+JdKOJB6jDfsab
 evhLhuwn+QStc6NKE6Yhlfkg5E3FYa0mBImPuUiz8y7LPcL7jbpGInmgSPGtNER+HVKt
 Du5WivqmcciDFjwwaYRj1hGe7f4w62F6FCZ/kwcKq1DCIzmF9ihfuc3r6L+N2ycJkf3Z
 WSGA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786805593; x=1787410393; darn=nongnu.org;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:from:to:cc:subject
 :date:message-id:reply-to:content-type;
 bh=gbwFturU1lhddObbcEkxPnxbVvNHsQRAHmkziIayWcc=;
 b=HWx7Ad2qEwVDlMlX1g5mH01DtCU7YMHOyQ3ouC6L5CXk+JTBlN/yEmtgNBlgS3OrzU
 y8sapCV2d4FZZp6l3h6QqHFr5/rDVp0NItiy6qsAwYQrlYe/aJxWG7fUp7heBNQSKK3O
 O7kChxnXQvzf+qoygso4lznBDipm8zhY0VjJlLPOwfBl8d/0kfa64kc2chVH7UQETYfR
 LDVNzEtyCwls5Ql2xbxEl4kVP4HW1BFxMQTQ7JDmWuHq9hTTAAKRVEVrc7C2HDwlJLlh
 2KzK7zNsY8ZpGIlVjuKUrHYeL2wbfl3KkxpLzN8lLuuvBlDgWrS1gAz39aN0DOlaMbu9
 fIxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786805593; x=1787410393;
 h=content-transfer-encoding:content-type:cc:to:subject:message-id
 :date:from:in-reply-to:references:mime-version:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
 :content-type;
 bh=gbwFturU1lhddObbcEkxPnxbVvNHsQRAHmkziIayWcc=;
 b=gXOo911V6ymiqQf0Xb6aKmFs6OdlGOtRm7C1e9uoBfhQHLXYwtjgJIaUWUcsJMLlJF
 MN45gEDG1ugmp1114DWWqdrR813K1W8fteo8nVmpKYq3Cr1gNq6sihqJctqEG1slHVPB
 gEegvCFERyTFNGYu8EIJXoTit3ZdHw1dfyp2aR47R/eouyOojVPO4kZvrJj894t/L99V
 h2g+BtDXEQtVRL/uuqdXbqIyLpDBR9/bRlsxCx1tTVghmGJLuPhFa+tmqZidOf44D0k3
 f6AVzK3JRmcVoQjTHA8RMgtTN5C9+ZrJwBKSgf47JNB3nhFez/PHFBOe4R+270OF92M/
 jTqg==
X-Forwarded-Encrypted: i=1;
 AHgh+Rr4OJa/hTvBVtFdR9xJZVtm/uIdftmANOhPFhL93PU2VgqRSFhmhKtqPVJ5wPIuCwUOPsasTI2Jmg==@nongnu.org
X-Gm-Message-State: AOJu0YyiRQjwm/4fKx0h6mzNB6w90oT60/b7yhpon17TOd5vh2/v/QcY
 RQB8iFtfVP0VD9B6zAH9uyaiCPGfde+EvLCPBlf6jKhtmx6EwHnTQwPpkn589Qwo9rP4eJq8jMx
 9/fsFr3Bgpgy1KpDw34QMqPn00I0QXhnBYnOgwWEmrw==
X-Gm-Gg: AR+sD10P88T8+L2l1uLlOOamiujt7H72QNWFbVcVsZUZJO/Rva4eJO+OnKLTLzOvIcx
 Gr8EGD1oKWY5HhZQlSeuz3Pv7YJMunbWmXQef/d4xFVI0D+db9icHsmW31eiT2v5DJDwJ+DcE0l
 SdZanaPhWN35cMUQWlbDGeF8/nMCGPUXIB+hlUGr0OiSbKYMdMkeD785GNtE79OuVgACvQct1Po
 gOnhsaAFlG8j4924aBQremD7t/duRqe2OxWaK1Bp6maocrVQD/kvulqwpEB/bXZjAOH4V+HC2IR
 osapDvsH86ZBZA939LC5D2NBi9PqwlJfi/D8pZ9SV8uxKJJFiAgmSeiPUu7zOKMiyX1geOiOEbM
 dnTy8FXmT7EtH0f80qvuiBqr9rp+Y
X-Received: by 2002:a05:690c:4349:b0:81f:d515:8c06 with SMTP id
 00721157ae682-83713568937mr41110177b3.29.1786805593033; Sat, 15 Aug 2026
 07:53:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260812220816.94034-1-philmd@oss.qualcomm.com>
In-Reply-To: <20260812220816.94034-1-philmd@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 15 Aug 2026 15:53:00 +0100
X-Gm-Features: AcwNN1UXX2k8-hO23AI6Waxf82nkb0U5ItY48GiqAwTTdb6YF5gzr1WWLBydB7Y
Message-ID: <CAFEAcA-NUOtTPuvxKja+bNU6wy6EQFVMfX9nmQ_LbtAPKHqMXA@mail.gmail.com>
Subject: Re: [PATCH] hw/intc/arm_gicv3: Have GIC kconfig select GICv3 for HVF
 and WHPX
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: qemu-devel@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>, qemu-arm@nongnu.org,
 qemu-stable@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Wed, 12 Aug 2026 at 23:08, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> While trying to fix the GICv3 dependency on KVM and WHPX in
> commit 39a8c3941eb, we missed the Kconfig ARM_GIC symbol only
> selects GICv3 for TCG, not HVF and WHPX. Fix that.
>
> Cc: qemu-stable@nongnu.org
> Fixes: 39a8c3941eb ("hw/intc/arm_gicv3: Fix ARM_GICV3 dependency for KVM =
/ WHPX")
> Signed-off-by: Philippe Mathieu-Daud=C3=A9 <philmd@oss.qualcomm.com>
> ---
>  hw/intc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/hw/intc/Kconfig b/hw/intc/Kconfig
> index 097de4efc5d..05e697967d0 100644
> --- a/hw/intc/Kconfig
> +++ b/hw/intc/Kconfig
> @@ -26,7 +26,7 @@ config APIC
>
>  config ARM_GIC
>      bool
> -    select ARM_GICV3 if TCG
> +    select ARM_GICV3 if TCG || HVF || WHPX
>      select ARM_GIC_KVM if KVM
>      select MSI_NONBROKEN

Is this instead of RTH's patch "hw/intc: Fix arm kvm gicv3 selection",
or do we need both?

thanks
-- PMM

