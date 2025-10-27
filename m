Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8E8CCF9E5
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 13:48:27 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDNZv-0004c8-Dy; Mon, 27 Oct 2025 09:48:08 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDNZr-0004bk-E9
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 09:48:04 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1vDNZe-0008Ov-Kw
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 09:48:03 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-63e17c0fefbso5001711d50.1
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 06:47:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761572865; x=1762177665; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JnVoZT7sodXirfrArD3Xk4OH/feoGFzhhfQYD2cLoO8=;
 b=PnZw0FTFaQvRgu1+NXS0Yq1+ZLol8brtW2BTFVbi8O4dvTVBORc5F4A0OU5o69ATTu
 r4bLFUS8x7xXTz3f6hmJatbxhurJLHWROkDrEMVfDgVXPgSVn5OqhupCeBIJX/nQczAb
 F0x0kGjrC6FynRcSWeWmyUA3T7Yc+jgAE5WgXlijfzabeb7gdV0tBiFh5SW7vSYe+bWx
 jHDcE9eAMZPrGeM+RpgyC3v5jLSotwJkkhRHcqvAf7FFFRo2+I7Pv94RMrmwJidq1o1S
 41ByY+XAs7sF6g0GERZshHjIkle3MNlyaQHtj2cVjfrOyRvZAXfotx1U7K44GP7SMw8b
 fZ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761572865; x=1762177665;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JnVoZT7sodXirfrArD3Xk4OH/feoGFzhhfQYD2cLoO8=;
 b=GwA5YTAuB31uMC2lSbQ3s04+NvG5gJ7SHaURtcRfK3HCerDEurpDbOxozDtaQC7w8O
 JG4hN1dXBqvxd42xRkQ9NnHgSTAKGpZ1nGXNdAkCeY0mR1GD5nk0zlcwhUw41/eLJaDp
 YIq/zbCfrdLq74VlJ/4VHt6BEwavO85aqw06UBBCLFS54eGYLQ0mY2L1VrgT2HtJfn6v
 0At8IyYmmAunf1fBbyvNd4cQBiXkedSc49GIwCZjOnm0PiF9AMEomWDGZ9BGc+jIDZFm
 yPvnSA0YWBf6y+LJEj+RXzKBZ6v2fhYEu1nyA7wHk8pEciugkoErAxrrxTX86xCyGObP
 60AQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWEU7Obxz5k3OOwi/WwUzInU/3LSoU3yjOgAP3fwqhm+bWdQU9gQGUx84xon3s208AEzA1sSqfjbA==@nongnu.org
X-Gm-Message-State: AOJu0YxiLIgI2lGI7vBXMVGsBS4hhSSsxSZUTWS7uZ9uBHUYpOlc2jsZ
 6Hh2wMbteLZqv3ZSLJ8euXXAeOks1imej8TjU0iC8nW15j23Vu9K+YHwsEdrvxwmTyrMRZmGR5v
 CY78PCL4e6SCcHyr7XutHmBT7VIzGbj5QUy+nk2YXxw==
X-Gm-Gg: ASbGncu0lrTdrCqVr/LlmDY6jQu4h9NVxEw/Otbcs/whybXro9J+ljKPaBZ4bFL++Fp
 ulBQ0F4uhNo1cVrJqXaPOrBV0IHO09+iCfT4JquziNuGeLG/rxjXieqh+QUUDQjndcYMKuSoQEh
 c5H+rk3wSeUmAEYhrJSv50Dsfuxpg+g7UOlfxTBBzx5YW0C/jv8pDnmdckK0RrpFXIxUAkcJiew
 6Q+zY/QYWUeBS7f/BL0ChmAnZbqedJ/7VQsALlrSYIGd0rL//yKXWTGV9mR/w==
X-Google-Smtp-Source: AGHT+IEM61JjLbKFAoubdh0ZAA9tyM2Daf+J6xnuDO9+ExFDsD7BA7ZUSfretDEdD9lZiXLGvz5B0/7TU63AU1GJZMY=
X-Received: by 2002:a05:690e:edb:b0:63e:26b1:2148 with SMTP id
 956f58d0204a3-63f6ba78badmr52856d50.35.1761572864913; Mon, 27 Oct 2025
 06:47:44 -0700 (PDT)
MIME-Version: 1.0
References: <20251027123644.63487-1-philmd@linaro.org>
 <87pla8xzd2.fsf@draig.linaro.org>
 <CAFEAcA-hWZei6ytAik5sjFcsYqbKaM6K5mzHepmGQpggAdbQmw@mail.gmail.com>
 <0199c5ce-9bb2-42f5-b545-8aaaf47364b0@linaro.org>
In-Reply-To: <0199c5ce-9bb2-42f5-b545-8aaaf47364b0@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 27 Oct 2025 13:47:32 +0000
X-Gm-Features: AWmQ_bnuZU8jn6syclu5JvYJvu1EeYKAYpyWaWtWlF0Pc1NYS-zk6PzJ2Tltw5o
Message-ID: <CAFEAcA-MFBs_Xs3R-FCwk6=8vV2VhkEhZqBrf5e4NsrFwUqjtA@mail.gmail.com>
Subject: Re: [PATCH 0/6] hw: Log unassigned MMIO accesses with
 unassigned_mem_ops
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org, 
 =?UTF-8?Q?C=C3=A9dric_Le_Goater?= <clg@kaod.org>, 
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Troy Lee <leetroy@gmail.com>, 
 Paolo Bonzini <pbonzini@redhat.com>, Helge Deller <deller@gmx.de>, 
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>, 
 Richard Henderson <richard.henderson@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, Peter Xu <peterx@redhat.com>, 
 Artyom Tarasenko <atar4qemu@gmail.com>, Jamin Lin <jamin_lin@aspeedtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 T_SPF_TEMPERROR=0.01 autolearn=unavailable autolearn_force=no
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

On Mon, 27 Oct 2025 at 13:33, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> On 27/10/25 14:26, Peter Maydell wrote:
> > (2) PCI "I/O" BARs. PCI devices can have both MMIO
> > and IO BARs. A PCI controller on x86 maps IO BARs
> > into the IO space, I think. On non-x86 the IO BARs
> > typically appear in a different window for MMIO
> > accesses. Behaviour of PCI I/O accesses to unimplemented
> > regions is probably defined by the PCI spec somewhere.
> > Behaviour of PCI accesses to unimplemented MMIO
> > window areas is I think technically left unspecified
> > by the PCI standard, but "write ignore/read -1" is
> > what x86 does and what most software expects, so
> > hardware that implements something else is making
> > its life unnecessarily difficult.
>
> Right, this is what I'd like to unify, ...
>
> > I suspect we entangle the PCI IO BAR concept and
> > implementation a bit more with the x86 I/O ops
> > implementation than we ideally ought to.
>
> ... to disentangle that.

I think my suggestion (based on about five minutes'
thought, so possibly wrong-headed ;-)) would be:

 * the individual PCI devices like bochs-display and
   vga-pci that currently use unassigned_io_ops should
   instead define their own local MemoryRegionOps that
   does what that specific device requires. (I actually
   suspect that having no I/O ops at all so that the
   accesses to holes in that MR fall through to the
   PCI controller's default behaviour for unassigned
   accesses would also produce correct behaviour, but that's
   trickier to verify and would require looking at a lot
   of individual pci-controller models, so the easy thing is
   a local MRO.)
 * patches 3, 4 and 5 are all defining the default behaviour
   for "access to some MMIO window provided by a PCI
   controller". If we want to disentangle this from the
   x86 IO port handling, then I guess that we could either
   have the generic PCI code provide a "reads as all-ones,
   writes ignored" MemoryRegionOps as a convenience for
   controller implementations; or we could have each
   controller do it separately. I guess I prefer the former.
 * I'm not sure about patch 6, but it looks like some kind
   of PCI-to-other-bus bridge. It should probably define its
   own MemoryRegionOps with the behaviour it wants. (Though
   again it's possible that letting unassigned addresses
   fall through the the PCI controller's implementation
   would be neater.)

Roughly, what's happened here is that various nominally
independent bits of code have borrowed unassigned_io_ops
as a convenient pre-existing "reads as all ones, writes
ignored" MemoryRegionOps; we can disentangle by having
them implement what they're after locally rather than
borrowing something that doesn't logically belong to them.

thanks
-- PMM

