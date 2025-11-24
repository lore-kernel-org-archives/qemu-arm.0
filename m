Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28597CFD317
	for <qemu-arm@archiver.kernel.org>; Mon, 24 Nov 2025 10:29:36 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vNTos-0000d5-7I; Mon, 24 Nov 2025 05:29:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vNTmm-0008TE-Ru
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 05:27:12 -0500
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vNTmj-0001h5-NZ
 for qemu-arm@nongnu.org; Mon, 24 Nov 2025 05:27:06 -0500
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-63fc72db706so3345802d50.2
 for <qemu-arm@nongnu.org>; Mon, 24 Nov 2025 02:27:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1763980024; x=1764584824; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=IH+tVktUvnIYfS+s5xTGqoXsukiAMNrSam2SRoNxLp0=;
 b=UX1b+5EmUIwD/LQ9rbGwhKwacOHQLLYr12sgpr973YQvwpKghpr1kYnRfJxI5wO2gN
 l8gswmkasIcfeeY3KV3S7/gqmcuznpLAxdIDEeWX3PoITu+4oFWObCXbhg/BXtBRKv42
 6KFrTij9cloevMTIMQHj7Dj1Cl/HjY2wxfpVjiMgc1LuulI9jZj9QzSk1auua2jn9i6n
 IhbQ79tdb0ljqZcaA9qAfw2fQ7T8o7/pW90yEVuErzeI8Oi3RRUDCTj5qHan6iBONjdm
 UOybq5b9iI/E8uLqpi2GOnkvv4IX8muSOeJrYKqFZJPPSPVS2KftFclqJ0uszISLLjye
 ewRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763980024; x=1764584824;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IH+tVktUvnIYfS+s5xTGqoXsukiAMNrSam2SRoNxLp0=;
 b=H3llwpG3/junMxbICqiYdeR5PIx0DK0xgGeLobRyjwlptgFMLumY852ep+1YTL5yt9
 6+ENYLKBMwBoTqQYtPZ4mgSceGADxaqdHBSOrMk+STVjn6SZlRVW8s8ZiI9Nn1kAsmhq
 AIS60emPfnzY/MqAuNP7NbCVbYOqxrPaVHRMdSpchf/lgwoSwkThPxREtcdZ8tNXoOQ7
 UPobrH0w26xcA0utXh47vMWKwrDWCLrlnDdxN++shA1/Wbw8u7K6GM7Uc4UODp+VwlA6
 Ods9JvGrLXa0emMuyvghtBXIKw+M0XhJ7PS37/zQeAlubnLP5VE5F1J+2r9J5gIrYUiA
 LX0g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXoVD46x2m42uDkd+UYlVuiqni2+z2Dee7rcSgYnYiDELXhMvkLhtIdu5m1QB+P0AwKlVeguE1FkA==@nongnu.org
X-Gm-Message-State: AOJu0YygORF4T6NDnrtVdOFWx6lsCZAARR58NnFCqIwliZDDWcpRcdSV
 zRWWqrLeJ2yO1Ql0F7OAcNMTwCeG1rdsL9ZrAKFgmXmCBqVHP7NZ7GslP1bHgHsYJiro1T71D4S
 vVX/jbNE23l8nBKWnn7qUT1BEn8CZs3K0B0MKrMdSmg==
X-Gm-Gg: ASbGncvHXXTGSMvA8g4GZ/GDQyDK2uyJlE5Aok1YETKHpgmT+uTku4uLxQeyl951v88
 v7sOcI/A6lT/XsDgbFm9y34BrJCObcUggix+0KFyuZJvUbwW1/fHm1C/324KVRY9bhU2BTkUeW6
 8BDUP7BZsaXhtvrt79QadfdZ7xAXQL7Z9/UgSy5gZKrdzk1GZdCYONaXajJWXzxKzumjsLBzQh+
 wFJ9DqxM+9llWnani9LGMUm0KQU1eNlv29PvjHwsjbCh1rOba8/uWSDI1f8BYyF8a6eN0Fk86YX
 Q+Id9z0=
X-Google-Smtp-Source: AGHT+IHLvF0XUMkdzCYS7wNsFiewY9ZPICNofUVb0vrbbFFwhNEmm3Nc5Sz9bfxwKdoQq0ZKQTUxq0ngYggKVztaxsw=
X-Received: by 2002:a05:690e:d8a:b0:643:79b:fb1b with SMTP id
 956f58d0204a3-643079bfda1mr6196627d50.21.1763980023760; Mon, 24 Nov 2025
 02:27:03 -0800 (PST)
MIME-Version: 1.0
References: <20251119203759.5138-1-shentey@gmail.com>
In-Reply-To: <20251119203759.5138-1-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 24 Nov 2025 10:26:52 +0000
X-Gm-Features: AWmQ_blpWYofeSl5Nfpn4qBG3wJ-LHn3DxvM2zqvgF4u7cdi9xrle6lVf8P7PEQ
Message-ID: <CAFEAcA893XcTzwwivboB_T252mwFjH8jQYh3PJbkkyXijgV8kg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/Kconfig: Exclude imx8mp-evk machine from
 KVM-only build
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>, Cornelia Huck <cohuck@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Wed, 19 Nov 2025 at 20:38, Bernhard Beschow <shentey@gmail.com> wrote:
>
> Fixes make check failures on an aarch64 host when QEMU is configured
> using '--enable-kvm --disable-tcg':
>   qemu-system-aarch64: unknown type 'arm-gicv3'
>
> Reported-by: Cornelia Huck <cohuck@redhat.com>
> Suggested-by: Peter Maydell <peter.maydell@linaro.org>
> Tested-by: Cornelia Huck <cohuck@redhat.com>
> Reviewed-by: Cornelia Huck <cohuck@redhat.com>
> Signed-off-by: Bernhard Beschow <shentey@gmail.com>



Applied to target-arm.next, thanks.

-- PMM

