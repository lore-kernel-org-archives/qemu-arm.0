Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C7DCCCF2C7
	for <qemu-arm@archiver.kernel.org>; Sat, 17 Oct 2026 14:34:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xI5UE-0000xQ-H5; Sat, 17 Oct 2026 10:34:16 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI5UA-0000wp-1N
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 10:34:10 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xI5U8-00054p-KL
 for qemu-arm@nongnu.org; Sat, 17 Oct 2026 10:34:09 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-8b0db268bd8so4412497b3.1
 for <qemu-arm@nongnu.org>; Sat, 17 Oct 2026 07:34:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792247647; cv=none;
 d=google.com; s=arc-20260327;
 b=NxH6TjZ5wLOPDcXkqLqT5y12c48fJ45ieXHsSbeCldn3+peVsVHskMrIDeaDBVCie1
 FU88ORLfE22/msufAtt7fuwL79WLqhod8KlF7nYCJTWCElgpMCfz8V24ZpCyyjf3l+aF
 X2aKlBUPulqmXM7RJDZpvF3L1ybJFS7r3KAwVeSlBwUlH6qGbY+R04tYgFB157tRAM/d
 jCT4szDjTa3SPhVSJkqVna737BeRQjeQiJu0tbu5IVapVYd7BMY4ZLcDWLs9A7DfAyDw
 GWqsmpsUb7okFedg0TxI7wcQnOuJ/4zXTEM4K9XfKZEz8pC8l+Lmf5nux3vfhcFlwVx+
 JEsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=deJFFRqTbUEFuiNaF+8ltNtvyq5v+1rOyKGwVeiPh1A=;
 fh=wS0XYGKKe6QmIWX2aZlVtbf4e5wUsPqq3tWIJrB37Us=;
 b=sORNKMWCcczV1F1w/sy9G4IbaYAdj4YdyPVCZKYtpcK/a3tzUIz1NgnQujKwcpw7Ng
 TE608H/E9z7xDslAgujiyU7R+rOo5d4pX0/kbsz4ej7Mr0cvLVAv1kbK/sIiSY+axaTa
 R/PWZzAiqE7m3IwnefLlIAdfybR+Q91ju0+RpxFg+KwoIkYDrw0SdCKjoovaiqyCcrAD
 pkhWB0OrFi8ixONHBhFJ/Bi/JE3RCs6omgY++FwS9aoxTICQBVk7c34NQHau9RWN60cy
 NFdusKJiWe0Qvr1JvqrsDMI6vl9L8kMlODONnqKR+kkApgFWworeorL86C+jpvUFvS/B
 XFqA==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1792247647; x=1792852447; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=deJFFRqTbUEFuiNaF+8ltNtvyq5v+1rOyKGwVeiPh1A=;
 b=h6VxW5j0tuqcCgwugrhuXOqOVb85PiMiHCDWtqeQK0WqB847wV52V5Pxlb+J3o08BG
 C1ZcPGYv6iajo1tN+pL2mw6AWX3dBRvprrRc3MaYO0VxzZgv+UxoNcxNiqAufHRWrbbV
 r3XsSysWCxMKj//QwYkqe5AKSK7wg18ufV5RL21dgLq3pdYM4lEHYtmw/bv0bohTFc5X
 CKCxMAY+Q3nqMG3oK8QGza+FwwLp54jrdldFIETqJjvhrCriQsCywPVspthtEpQouGob
 X1gBdZDoHCPyDsE8fJOSF/O9yy9/RfA1phF4s7GqVa/8d9gOM7GbHcY5XeTJz3ei7Ig6
 RIUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1792247647; x=1792852447;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=deJFFRqTbUEFuiNaF+8ltNtvyq5v+1rOyKGwVeiPh1A=;
 b=Pa39cI17SxtSjn8tTfEFZYCNBnPP4C1C6BF9Hmw80gQU/i7gQAF1Olsu9OqzhFgAKi
 ToQxkQAQyFNwrAxoHOpTAysgNXGzpB3HgKEIpXfqUdq8morWwJkaUB93C/fjGCdyvOM+
 +1Tvg3wsTzZpmMO6rmqXorVDZ8/VS/Li4FIyuPBNhL0bNjG8KsEydAApbA72CaH1+WcP
 yJ6td6q/MFwd0mC4cGsj9DhWZNNoDoy9bofn/+Jh6bSRhuoJEVcyy8XHvC3vLVTrFWok
 RoOgOUH5EdbeGNJIH/jzQoKEy9gvIaEZAVLu8vryGME1Nb2yGuxjgNikE0/eK2mEYWpc
 Ye9g==
X-Forwarded-Encrypted: i=1;
 AKwUvByc6F29at83TY6qxf5bntuy9Deatwwc3hrOHmUvyVJEdoG3e9JabHzVad34rRDsniF623uVpdHWdA==@nongnu.org
X-Gm-Message-State: AFq9FYLrcyZ77DWJVNuSnHyob9cVUSlkMVtIqF4mLP5xSoj9bLi1vlOm
 NrSCui1+KgmTDZ3B+WnHNDjpKSQNKkZJB2+OGQO6pUb3t1tEv5gFz9I15BzxEA/gB2b78eqx5z5
 fMtPVwmvBP4fM5LV4O9Vwvfzf7X6gVi4velgtPnhS+g==
X-Gm-Gg: AYBFou1fwyr6Zw7gF13SF5SvSA8EllMJCobb8nALlM5AOuFSQlMta4B7HvVUrKMWqE2
 orSmWaPiuKghyXjyRKH7ie5kSY13NlSZ5GRKLLZjIXfyF8PLkEbdgkAEUgkUxP6MlpbzpSCAcKp
 mP977NGiyR3r1pZTK7ydmpujpIUs8R7iAOqSDwCel7PL60yQOM/tRhjmLV7MKujEu85krQNITtn
 DnvDPdqvoLGKoMIakrUDtgAeSX0jU3s79lfd6jVopUuwOz3UMCrxTALj+SIGIRg+GL41pEthjxk
 rRh2soqcdJllpK/eyn9z8/5hAHTB7Lc+6VDPE9ZJAEhbCWY6K37g6Wkf29xHsE1RXHXfNC6TIVm
 rzH1HlSImed7kGFHPBojN7wcz1RofsnAb9Sz8wg4=
X-Received: by 2002:a05:690c:c58d:b0:8b0:f116:11fe with SMTP id
 00721157ae682-8b0f21b53ddmr7259217b3.50.1792247647007; Sat, 17 Oct 2026
 07:34:07 -0700 (PDT)
MIME-Version: 1.0
References: <20261015181122.60608-1-marcelomanzo@gmail.com>
 <20261015181122.60608-5-marcelomanzo@gmail.com>
In-Reply-To: <20261015181122.60608-5-marcelomanzo@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Sat, 17 Oct 2026 15:33:55 +0100
X-Gm-Features: AclHuK-MLJyYHb3lPUbih9uEumDdaI8SaaoFzy5VMgCwmiqCKbinINM6HuyqsyQ
Message-ID: <CAFEAcA-mGcgxbpUicLqrDzDa=7P6U5dnAiMbZdyAg2CetSoyEw@mail.gmail.com>
Subject: Re: [PATCH v3 04/16] hw/net/bcm2838_genet: add GENET stub device
To: Marcelo Manzo <marcelomanzo@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>, 
 Jason Wang <jasowangio@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1131;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1131.google.com
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

On Thu, 15 Oct 2026 at 19:11, Marcelo Manzo <marcelomanzo@gmail.com> wrote:
>
> Add a bare-bones BCM2838 GENET (Gigabit Ethernet) sysbus device:
> MMIO region registration, an out-of-range read/write handler that
> just logs, and a reset callback. No register-level behavior yet;
> that comes in the following patches.
>
> Adapted from patch 19/41 of Sergey Kambalin's Raspberry Pi 4B
> series (patchwork series 829638) against current QEMU master. The
> reset callback and class_init() use the current Resettable-phases
> API (ResettableClass / resettable_class_set_parent_phases()) rather
> than the plain DeviceClass::reset hook the original patch used, and
> headers moved under hw/core/, both API changes since the series was
> originally posted.
>
> Signed-off-by: Marcelo Manzo <marcelomanzo@gmail.com>
> --


> +static const MemoryRegionOps bcm2838_genet_ops = {
> +    .read = bcm2838_genet_read,
> +    .write = bcm2838_genet_write,
> +    .endianness = DEVICE_LITTLE_ENDIAN,
> +    .impl = {.max_access_size = 4},
> +    .valid = {.min_access_size = 4},

We should set both min and max to 4 on impl and valid here;
I think it's clearer and less prone to accidental misreading.

-- PMM

