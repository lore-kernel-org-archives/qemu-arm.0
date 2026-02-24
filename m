Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4309FE9B251
	for <qemu-arm@archiver.kernel.org>; Tue, 24 Feb 2026 11:23:40 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vuqVe-00086V-QG; Tue, 24 Feb 2026 06:23:22 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuqVd-00085s-7c
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 06:23:21 -0500
Received: from mail-yx1-xb12a.google.com ([2607:f8b0:4864:20::b12a])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vuqVb-0003QS-Hx
 for qemu-arm@nongnu.org; Tue, 24 Feb 2026 06:23:20 -0500
Received: by mail-yx1-xb12a.google.com with SMTP id
 956f58d0204a3-64ad019bbd4so4913440d50.0
 for <qemu-arm@nongnu.org>; Tue, 24 Feb 2026 03:23:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771932198; cv=none;
 d=google.com; s=arc-20240605;
 b=YYBaXA0T+vWqDxX5p8DlGxhdUqmTBcnlTxD7eE7J1Hs+6IGErRr7dr1TpqYc39BP9h
 PuU3MAxKvVXTrV+pusHlRpT7fZEkvVm3zALATg6PucIO6XIcGe+vIJZrFBV73yE6Fagn
 9OYHTscCrTBAO8Ia5nZKLtuTu9PJcEOusFyygdXiuUcUhT4cn+t+43TyA68h6vPMwJEm
 EfAzQ8u02vrwbW5QXD+pAlhEuPHaGqmwjkRTO7gQazBo/B4U+eNNqLrMPMiMNsJPW8a2
 aNVbWdGkqtDhoyYlD54oNtNVfS40mmZqzID+pN0As/riLuWvOMJ7lLKVHQlRKHDuOXGo
 XwqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=gPNIaGczoKm6TqN06zgo5LuM6yHZBKuS80qJ7rpFt+U=;
 fh=NC8QdRggfzrmtlKbjADpxtd+VEwgqLV9Jo7V0vdK4V8=;
 b=bL7HPGatVDPMi/GLixnJXfVXTOqP3YeymjL/xWoOfK+b2EH3lCDexfVENijGG9mm+m
 /hp2tgbnDo1hujgOf+lAKAQ9e2I6e/ktdvp3xBhquHu9tQYY2JGbsVARnoVVb/odidv/
 y1xcjB+s1NVqzwmOoKj3AREPw0jVHKEyY7U1kxK5qoptQJkT/lPyCLuMMktLpg+ES0/p
 dAkYTBFObI3XO/26MKGU2BNwUr/VtOhr4nI2qcGh2UTYem7ACcV6boweJIkz3y3F8xZL
 LVtKj1KW8Hbp/8HwFd/2OkTuMU2450XDBF8UlPubfZv4g7gBIK90gGs/0RW7ixL+mJy9
 FWyg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1771932198; x=1772536998; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=gPNIaGczoKm6TqN06zgo5LuM6yHZBKuS80qJ7rpFt+U=;
 b=b4sAJFmwawjRE6xBRgMOB6wR1DAQZ4eTYBFiIdaL5Zo8oDIdMMnMxTvlYSp955sjXi
 8KBMyWnmHVcxtE26V08kiKu9l5As6A1IDe6M6Q5Nz+eTCi5N6rkquF0v07MpTjUDkwrS
 Vlcl0zk8FAFfzn+/ESpPRgitFhrYC4fT8//FVxMFU0QjG6ZV6V8eQpEsOuerJRO4QPfC
 BZ0LcaT6796WN3LEUqPb+1W0B3S8XXeRon8SG1+Ailidip9bxNr6oVPFiSv5p95DlvIe
 KjzcZVrYkyj1sbGu5iREBzcK48m0QN0HzV/tXcRSgjW3QpyY+6GOmTs3fIQshu0c1UD0
 qWeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1771932198; x=1772536998;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gPNIaGczoKm6TqN06zgo5LuM6yHZBKuS80qJ7rpFt+U=;
 b=RjoMzJRZVr7IuG5mFZqEmgX+I/FTTb+W3oH9GwxNZKBpqzbcOV256n10ISZ8phhtRa
 cQbqAz+rjpE+EdAp/SQlf72sYPJffsdUiffoc/NErqq7ExjPtQb6vw5AnEpxbeWUxt8h
 X/wo6CHRZ8um/+Ukmp3oWyRN8lbJJPDfQil9aBLrGMyV7Sa2z1vc4UC1blnkaibGTvm3
 oerWXExFSKssqf+vZrnJnAWex6hDI9c6IxmRGH2pp1ou7XTn44sJ3vQEtbVj9xksuSl+
 R/4xPCloH4o9scVrbSbRQz5+JmYaj4XGP50hIe+0+WQuen9+qVPlWdZo89qNOmuRq/LJ
 qipQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVd9zUt8JwzAWilazM3fgOkMSaG5NQP9MSTou4GbPvwazm4Jb3DQQIxBnXoMzFC3vKp6UFv2X5TUw==@nongnu.org
X-Gm-Message-State: AOJu0YwbrlQC+GUx6ZUbR/cw1JDEGhHOmRzvsJ2mSHP4ocIuv1hrQLhv
 AUksDyTGWSBd9SiDg+7Og8Np6pcyQGAM06w8EvxAF0n6Sv86OP8fYLqh4RQxupbXUL/6aWfoBg2
 5XPG6F8ifoC5nuEig29NklRoDacnajVL8w6qLFtNcsQ==
X-Gm-Gg: ATEYQzxTdHgpkaRXg3fWe5srB3Js0rehdOJiFFcPcUCygat5u4QLqAyEMs7bS4OhCwm
 3TbquXMy9ul9GMyupCbRtXg6EV+14i8JhKw4/L4cLMmf7MxuyJVlcnh0OFhGkHNcWmpX4LbtcXD
 V2oRRPKRD1b9fZaX8I7ubE+kWMfoC9F8y5PIsS422mz8FcouNAraFqvy4NgOGQAMewdO0Uqxe6o
 B8683hyYeFQ4FbWbbGojPH9PgsTy6KQkEC+TCWRA4D9cy6U6m+Q7pbHgiCju/cspNJDh2GFnbkw
 WghFJUZB2zqsixxYC6F8DaA6qIJewqZWGJXh0QfIAhrSVI3+D2D8UIMErJnD7oMmZe+KjyRWpNa
 xdg==
X-Received: by 2002:a53:cb52:0:b0:64a:d6a2:c6a with SMTP id
 956f58d0204a3-64c790a0058mr7286471d50.88.1771932198240; Tue, 24 Feb 2026
 03:23:18 -0800 (PST)
MIME-Version: 1.0
References: <20260219173256.152743-1-mbawa@redhat.com>
In-Reply-To: <20260219173256.152743-1-mbawa@redhat.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 24 Feb 2026 11:23:07 +0000
X-Gm-Features: AaiRm50eD6Qre34J8fKsjnMs6f5YhfQcUg41YGdrbOl6PIklpzKTnaAbjIsX2mk
Message-ID: <CAFEAcA-=wdJMrV8UsHPRqFQK-FqLAXsNGbocBAv_c3+cmq3CVg@mail.gmail.com>
Subject: Re: [PATCH v2] hw/arm/virt: Add virtio-mmio-transports property
To: Mohammadfaiz Bawa <mbawa@redhat.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, alex.bennee@linaro.org, 
 philmd@linaro.org, pierrick.bouvier@linaro.org, shannon.zhaosl@gmail.com, 
 mst@redhat.com, imammedo@redhat.com, anisinha@redhat.com
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12a;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12a.google.com
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



Applied to target-arm.next, thanks.

-- PMM

