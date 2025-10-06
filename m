Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE172CAC5B8
	for <qemu-arm@archiver.kernel.org>; Mon,  6 Oct 2025 10:42:10 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v5if7-0004oT-E9; Mon, 06 Oct 2025 06:41:53 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v5if1-0004mp-Tr
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 06:41:46 -0400
Received: from mail-yx1-xb12d.google.com ([2607:f8b0:4864:20::b12d])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1v5iew-0001XX-LC
 for qemu-arm@nongnu.org; Mon, 06 Oct 2025 06:41:43 -0400
Received: by mail-yx1-xb12d.google.com with SMTP id
 956f58d0204a3-635283199a9so4238961d50.1
 for <qemu-arm@nongnu.org>; Mon, 06 Oct 2025 03:41:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1759747297; x=1760352097; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=vwrQcCJGIbsxvMRi/b1fe24qLHYm9LI3TINLoCmsLMc=;
 b=t4bQSWbS/xP4RpK/V46JyDHY8X0mBi3sdXeeWn0SSwva/1lAKHBD9DCu5JMYgzQXR0
 q/i6+NQMv9sRY9aT9ytP8DhjeT3DiZApEwfV7nJqpB3SbkKDqkp6D534QSksDjBIg6Hq
 LXjh5Gey8b/8smZJi+s86+A5xqrgQsgf3XV4QWkEOMfH2o7BzL/Lq/bmVWBbxUl6XIw2
 IbutdHa2AOiqZEjVdYzcTkXgeDgM4Z0ib/gqrqXlyp6wfp02pxW7+MDdKZ7U3H3Fuowf
 oYWCwj+DArrWE8waChFk17zJACh7TpAT56vu814WPwGxb6KMuP15BvBsD5dSqfKULNKM
 4u1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759747297; x=1760352097;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vwrQcCJGIbsxvMRi/b1fe24qLHYm9LI3TINLoCmsLMc=;
 b=mYiQ7NkmzmgA+EW4GDouMUCgqQWYoZNCnVbtX0UwoLtJXA8pluUF8hX4IkOxxDf8+d
 H0wrBITW/GjGwRbb6QAomCvYLB7L+2CVIGByBCvxxX+aM7c9rhvH5rjgD8hhtNf/oOo/
 Pyuef795VOZe5URtTmYEPf69lAHPvpUAwGYYxnACnh8Z3MaejLGDASbFUqsVU6pV2stO
 1hyHFmcyYfIrXCZM4OY2W3++MciqcDju8EYHYGOqJRYvtWh9zJ/7eJuTUrbPUJUOxWQ6
 Q9WWgojF8Uu7AIzmsaikMUbIU2KZZ9ZPTTcqDXTF0bU1+qfubMkxmppGduj/6sFb26kl
 kHYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXY0VLo2p4kQHnvWZ0p8x477g8LzS6WU33YIltrIEHceQ2V2+kRdnMIJ2i4LweygHuaK/CU+GGXPA==@nongnu.org
X-Gm-Message-State: AOJu0YxEtXMywbuXA3F1h/OxJfhh3oV3D00DJyNbiYp7WCUTIKPx5HI3
 JwBXNXC+Jwaphui0vMhPB2bsKAXHk//J4wS8GU0Q9XUbIvQpD58bKsIggmFqH447Xrr9/Ideowe
 a5kF2w0oVoa2Dw0ho03c1/5bG5yQiPOqppYA/Y55IFg==
X-Gm-Gg: ASbGncti9mHBUELEm57AiQMai/F92SlGuoGVRo8nlrxOM0Yy7EDAhRRekvsnECW+WVK
 KNEKT7oXuKdnj6R8kR1j87CXMBarsrnOs7uyp1V8vjlJdEtBFEd+PoVGH5bvCvHEo2iikv9lvVx
 GnHAOL6XaPCxLLwAR3LJxYmtcLfeZIIzy3IueXZTkHsr8JnwWSHD+1tn6Jysz0Z9Sv+4cjKnmV2
 qwm8iXQISm6CktqVvoOghejw2/h1qEO5FUJDr6zCW/NCmA=
X-Google-Smtp-Source: AGHT+IHMERTFx5EYN3CVOYqNP9Lw1HGa0Td0sIWgKn2ytuLOFeid3ejTjZUf5dSxY8/3eAbvuV97bsLfFKiYQrnFcHI=
X-Received: by 2002:a05:690e:686:b0:636:1bb3:2d2d with SMTP id
 956f58d0204a3-63b9a07fdf7mr8736537d50.22.1759747297216; Mon, 06 Oct 2025
 03:41:37 -0700 (PDT)
MIME-Version: 1.0
References: <CC5A0011-CD14-40F9-8023-8BF5F989BCCF@gmail.com>
In-Reply-To: <CC5A0011-CD14-40F9-8023-8BF5F989BCCF@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 6 Oct 2025 11:41:25 +0100
X-Gm-Features: AS18NWB7RZ1o_mn8Z-KGl28zNr88Ka_Hgag4hcQFKeBpYzqAoYX_71A_p7MS-eQ
Message-ID: <CAFEAcA_PbfzTAW2qeFao1MhPG=jn9dtzt0AzwL-aPCEULijsuw@mail.gmail.com>
Subject: Re: [PATCH] hw/arm: add pvpanic mmio device for arm
To: Alexander Gryanko <xpahos@gmail.com>
Cc: qemu-devel@nongnu.org, qemu-arm@nongnu.org, qemu-trivial@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12d.google.com
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

On Sat, 4 Oct 2025 at 21:19, Alexander Gryanko <xpahos@gmail.com> wrote:
>
> Currently, pvpanic is available in three device types: ISA,
> MMIO, and PCI. For early stages of system initialisation
> before PCI enumeration, only ISA and MMIO are suitable.
> ISA is specific to the x86 platform; only MMIO devices
> can be used for ARM. It is not possible to specify a
> device as on the x86 platform (-device pvpanic); the
> only possible way is to add an MMIO device to the dtb,
> which can be implemented by manually adding new functions
> to the QEMU code, as was done in the VMApple implementation.

No, thank you. I don't want to add more devices to "virt"
than we have to. There is a PCI pvpanic device -- use
that. Yes, you might have to do PCI enumeration in software.

thanks
-- PMM

