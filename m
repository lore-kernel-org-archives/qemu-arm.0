Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5A90E9B250
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 11:34:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuqfx-0004P9-Rq; Tue, 24 Feb 2026 06:34:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuqft-0004OM-LG
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 06:33:57 -0500
Received: from mail-yx1-xb130.google.com ([2607:f8b0:4864:20::b130])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuqfs-00070f-3O
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 06:33:57 -0500
Received: by mail-yx1-xb130.google.com with SMTP id
 956f58d0204a3-64c9a398bc7so1079751d50.2
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 03:33:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771932834; cv=none;
 d=google.com; s=arc-20240605;
 b=jMqZqSAWGfL3Av/HPJtfTtKL16kiT38AgEI3ysdgZdzYOjwERvzB1XA2PwGsnLG2xQ
 llnAcpyIRKNWCEuqZ+pdkQU+WU2QKL/2DZcWFbfvrEO9Ic7ZhrMVn68mPdcCQTKE8T70
 155m8QEUKvvM7z2jov9w4vb1dW4fYk9Q17CAdSYPUVTclemXgkzXufuV90YK9NZCNUyH
 eao4Bfa9RpRxj/YCPMQN9WfsHcFwRXUhNxWqyuk5XhD4HFcy6rGomIM5zVG7m+Qm1I7q
 u/3vzTVMO+DCObgqPKa+177+O2N6k20Zdjfqb8xdLRw5pv3UtOU7mlJOgTEQCI0p/VaD
 Bnew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=jw6b1uRWo4mfiI+KIp1Eux/GBFRajqTINbXE0wTohKw=;
 fh=qWIbAOLoI01QUTjP2bZAWiGlOy1StKikS3OpeTAi8QI=;
 b=VugKHbeeHD2UMhEediZxw7n/AZkwYAVzsxMsxTzrmb8tzYWcKjdycr84dmtkOROXcu
 y4yospCi+J8IPRJgUzwTyKvbdVjXy0qzZ1h3nKqhsYeI76C8Xjpl15C7hYyLE20nVkDT
 4I6LTDjuFRYs/JXcHo5hlbgs7W3kHNxmnTrV3lRHX0FAbedgRP+DYBmYkKxv3KFhMzNG
 UlIQeBK6VoqygPxfiJ5HtPljWB5VCD+pViXVsADJ4sbn/V+NovVcJfYH+1LQCIYK/hRq
 AVaGuoSOZoZZIIGJnmITjfzGRp7hH7dKKnVO6clnO6UNilOM9nweZpYCLOR176wyD1T4
 swwA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771932834; x=1772537634; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=jw6b1uRWo4mfiI+KIp1Eux/GBFRajqTINbXE0wTohKw=;
 b=LN0R3/B/DeKl6adPwzpTaFI9AFhN//WnbpYTV3BvMCxk/zMelxLTwXni0F4nj8VD2g
 m2VKu27jrmRBz5agA1g5UJXJnJcr1HBbXnY0cBmwvDfeOCRiMS8/SbMm+EWnbi5O/AgZ
 WaUq38LbTF7rRe7fBhdkzT43QpFSe33UaI8SCGjPYjzodv5PC7vZ16sJOOQPQgODObW+
 UpFyzzZC2chBZy0/zDtaiE/IOw8XNuvC5R09/R7LDhJSO2jjJ6vkl9SOoBk3uwr7HdqX
 bZwIKBlDGIdwp5+XApMSPHNygaXw6A76kpDbscbhQQBm4Kx4VQ1P/t/zRlc/fm8qSaVT
 TBCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771932834; x=1772537634;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jw6b1uRWo4mfiI+KIp1Eux/GBFRajqTINbXE0wTohKw=;
 b=ESQN1q4/6WWxFWIvtyWFs6jdmfVHBWlA92pB1tQjDbcar8NkDuPwMbE1tATE8JKiiK
 untGGnocKfaA8bKWprMC1Z4tKcw1IfQWarAK4LijEO0QwMgTFPlLWrwREdP2x155RiY5
 28tK+zTX3Ldq+8wHoo8o6ZfcuH2KhCo5Gf/2qWWE5S00US2NV0LnjYNYpsD77G8EnYg8
 5gbzG+ptFwHMqxYpcwv+dngbq52YHScClPFwf5KZwKH4lV0pbw4DOfNQ+ZCghUfgATIL
 xiIRbYFuse2jR+kYZNfOO3Rgl3bFbAlG9xIvSIAQHgF9HTK36OwIkK18OhXp7xwyzmkK
 qa8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0TjVd1pk9KpV9X1tUtDPHkuykJGGvJbwTd/vbb0UdrYosQN442dsaHxHu2s7kkmAdxdmtJXhXOg==@nongnu.org
X-Gm-Message-State: AOJu0Yz0yDeqOCwU7xGxSItuQDok5SUYb2VZE0gADdQ2Sb3i41MCX+E/
 2QKLeB5ots3HITv6eDev9Lad1oDusH6EtRPWzgODWAY3x9uKLi3PkbuONuxTJN+CvY2vpvObsPL
 JG9ykcJOI8gZk2sxPaxfZISP1Xiuqh/qjYyZJs4T6mQ==
X-Gm-Gg: ATEYQzwTdMgp4d6VKSO1+IE8nIdc0JGFxNPRNTBTl7orrpsSIn4oTkW6IffYsp5LbE3
 DdR0RzDbCBWnz3VnGeTPYnwJ/nHHrk+IZxdVkjaq35FjjPRfZmEvaLccs63Y8Vs0suFG9/sorGo
 RyhsiFBfXk0fcyBpliBO7ivVltUYt9+Go1GZI0/r4gg20ZaLf6JVFKdkfi4fe2ppQGtFDn5SjYp
 RoJcX3+s0x1uQiOoSpiBLH3C3GzhU5SEev7oDyMPTP+5kp1vN48j+FFXBJ8V8Zx+5Mqbn3devgv
 5LSA8u+TAzPkeMk2nGxab7PIslC4vVQuDCKDKjMlK8wUFfNLEVJKmsUDMz+TrLR8jkE=
X-Received: by 2002:a05:690e:1288:b0:64a:e7e0:a723 with SMTP id
 956f58d0204a3-64c786d10cfmr10444477d50.18.1771932833963; Tue, 24 Feb 2026
 03:33:53 -0800 (PST)
MIME-Version: 1.0
References: <20260219173256.152743-1-mbawa@redhat.com>
In-Reply-To: <20260219173256.152743-1-mbawa@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Feb 2026 11:33:42 +0000
X-Gm-Features: AaiRm51KPda6_GbjYDWxvFkE8dUc6UIpQij_WTrbflbE-_hSpv5J4ehItPKeGeg
Message-ID: <CAFEAcA-No=5WiKoeFMC5qLdRzmCAKbqA2oROyvo+WkLVQmpW7g@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/virt: Add virtio-mmio-transports property
To: Mohammadfaiz Bawa <mbawa@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org, 
 philmd@linaro.org, pierrick.bouvier@linaro.org, shannon.zhaosl@gmail.com, 
 mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b130;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb130.google.com
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

On Thu, 19 Feb 2026 at 17:33, Mohammadfaiz Bawa <mbawa@redhat.com> wrote:
>
> Windows ARM64 guests detect virtio-mmio devices declared in ACPI
> tables even when no backend is attached. This causes "Unknown
> devices" (ACPI\LNRO0005) to appear in Device Manager.
>
> Until Windows fixes that by supporting, add a new machine
> property 'virtio-mmio-transports' to control the number of
> virtio-mmio transports instantiated. The default remains
> NUM_VIRTIO_TRANSPORTS (32) for backward compatibility.
> Setting it to 0 allows users to disable virtio-mmio entirely.
>
> Usage: -machine virt,virtio-mmio-transports=0
>
> Signed-off-by: Mohammadfaiz Bawa <mbawa@redhat.com>
> ---
> Changes in v2:
>  - Renamed property from virtio-transports to virtio-mmio-transports
>  - Added documentation in docs/system/arm/virt.rst
>



Applied to target-arm.next, thanks.

-- PMM

