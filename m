Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B78FCCCFA00
	for <qemu-arm@archiver.kernel.org>; Fri, 31 Oct 2025 16:58:18 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vEsRq-0000ex-5Y; Fri, 31 Oct 2025 12:57:58 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vEsRn-0000cp-UT
 for qemu-arm@nongnu.org; Fri, 31 Oct 2025 12:57:56 -0400
Received: from mail-yw1-x112a.google.com ([2607:f8b0:4864:20::112a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vEsRi-00086B-Cc
 for qemu-arm@nongnu.org; Fri, 31 Oct 2025 12:57:53 -0400
Received: by mail-yw1-x112a.google.com with SMTP id
 00721157ae682-7815092cd0bso32121117b3.2
 for <qemu-arm@nongnu.org>; Fri, 31 Oct 2025 09:57:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761929860; x=1762534660; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=/zqAfUZYeziv1avZ5odx+cLX9Ncn2Uiz8SeqeiDkn7Y=;
 b=kKoAE/6vmpAU2k9DAC5BAeHM+KNNgRaX5nOArd56RxoyJQpijc1Ja+jrcJkjy0pmsD
 W+spbdPTwoDtpGTFvJuBJpmGdU759Dpar9wmdiOcsOt6NV2CHvYe08owXwzEn2ecww+C
 YB5eJgNzxo9cQ65c+yCbG+TibTpDqIDeRtDH8W0B2jQoQeoS+CJTdC8R7x3Azq3cyERc
 Rt//cZutpade8OFB8/PPKaM1pr5Xvke6L09LI9Ja2VDjtzltDuvKedKbatUBUcvfk3b3
 SKA4jJCsbcMGRWo3vVk5EYDiZr8KkNAtk0r8O9rXxMQH4o+WNVxY4ducQAcVjGCDacBi
 3scw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761929860; x=1762534660;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/zqAfUZYeziv1avZ5odx+cLX9Ncn2Uiz8SeqeiDkn7Y=;
 b=ZSy3oQRd+2YMtKgCFlYU7IhLPnUK/exfYvrUtHegxWyTgbo6oNZcMyGBCSB7qU/SXj
 J4jzXAy3yZb0yRMiF5D0WxXCWx+mZl5apzIGwLY3EOOWRE+dCN6QalxYIHNssBwrTmgJ
 RduREo7fD603zdmJmUw+Wi+UfXyVG+Vjf88kw/kUX6z8TqsetzU6ajmTTS7KEyxOPr7g
 08vzT2no6mJq/ZIP113F8lgOXklyzFevTXVaoKPUxUiuL+26vgOwDdN6Z0an8o6yiI4u
 DeVaypeyLD2EFkhhu8QmcksFLK/NEpixRjI5e6+I9A7A5rvYJ2tqkSt6XA0iLBvar/iF
 fmHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXIcd7+qPchmUIZ+d3zwrE8rKZoeSSlZ58Xh3bjKAo0gEUqNPANItvKf8OyJRd5fmMeLxKe+Ivo9Q==@nongnu.org
X-Gm-Message-State: AOJu0Ywi3ffSkOjRJrEKdQoEoc6u/jKhs7hNBOb7A86AoN5aZJkchpNQ
 bwojyrk/1N2ikHDyCt818QSFivBoLQzY5JwB1S4ghlzmk0imMjPAeGYcJaMCtVXxE4xOyWu+bwS
 vnltReaCqO66tOGjsculfgwG0V5O1uCfzuwMiqkOvXg==
X-Gm-Gg: ASbGnculy0uKKI+0vXZGmfpkKbYihjzIu1I0U1HM6XmRY58plhuC+UMOQ/XOf6JG0/g
 gtvLVGpfw1c5OLT+DjJ0BiUMI+CwuPYrHoizAWcupD0WUP2PzkUG1DKPst8SF3NC3SCxUERHgEK
 ffoJvgo6d/pYL3V4NSA56+F1Ok51xBw8e0+HDJFN7bBkRgq/mEXtpkaM4Okkab1UQwpoFdBe7tj
 LZYyKhVZbjj4O0q9MhvoIlO9Rszhgf81W7LnDeIjrukXPKMrB1BuR8dQRUl7jZa0cwrywk6
X-Google-Smtp-Source: AGHT+IFDh0Lq09uQ0mMdrengAFCe4Bctd0JoPp/w/vegteTwO6uF/QQhJZNKSo5WYJBbq7TU1Hbi0Ey8zpyGRM+G4B4=
X-Received: by 2002:a05:690c:6a83:b0:784:9076:a0f5 with SMTP id
 00721157ae682-786484df969mr61456517b3.44.1761929860437; Fri, 31 Oct 2025
 09:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20251029142311.2986-1-shentey@gmail.com>
In-Reply-To: <20251029142311.2986-1-shentey@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 31 Oct 2025 16:57:28 +0000
X-Gm-Features: AWmQ_bnbxV3CM7AYGaHx_0JL9Gz9R1Luc26flGIXTnkyRyxRVFFnWT2doySoyKk
Message-ID: <CAFEAcA-CGQ2JwDoBVZNhQyBMNKXbZsy2Ds+=m0MAPq0hrsWHhA@mail.gmail.com>
Subject: Re: [PATCH v2 0/2] KVM Support for imx8mp-evk Machine
To: Bernhard Beschow <shentey@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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

On Wed, 29 Oct 2025 at 14:23, Bernhard Beschow <shentey@gmail.com> wrote:
>
> This series adds KVM support to the imx8mp-evk machine, allowing it to run
> guests with KVM acceleration. Inspiration was taken from the virt machine. This
> required a device tree quirk for the guest clock to be kept in sync with the
> host. Without this quirk the guest's clock would advance with factor <host
> system counter> / 8Mhz.
>
> Testing done:
> * Run `qemu-system-aarch64 -M imx8mp-evk -accel kvm -smp 4` under
>   `qemu-system-aarch64 -M virt,secure=on,virtualization=on,gic-version=4 \
>   -cpu cortex-a72 -smp 4 -accel tcg` and `qemu-system-aarch64 -M imx8mp-evk \
>   -accel tcg -smp 4". Observe that the `date` command reflects the host's date.
>
> v2:
> * Mention various tradeoffs in the board documentation (Peter)
> * Accommodate for single-binary (Peter, Pierrick) by having CPU defaults
>
> Bernhard Beschow (2):
>   hw/arm/imx8mp-evk: Add KVM support
>   hw/arm/imx8mp-evk: Fix guest time in KVM mode

Thanks, I've applied this to target-arm.next. I tweaked the docs
for the bit about security slightly to add a link to the security
policy page:

-* Unlike other machines with KVM support, the ``imx8mp-evk`` machine makes no
-  attempt to protect itself from malicious guests. If you don't trust your
+* The ``imx8mp-evk`` machine is not included under the "virtualization use
+  case" of :doc:`QEMU's security policy </system/security>`. This means that
+  you should not trust that it can contain malicious guests, whether it is
+  run using TCG or KVM. If you don't trust your

-- PMM

