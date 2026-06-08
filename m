Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00250CD8C92
	for <qemu-arm@archiver.kernel.org>; Mon,  8 Jun 2026 13:30:44 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWa3s-0004Db-8T; Mon, 08 Jun 2026 09:30:40 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWa3q-0004DD-Bh
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 09:30:38 -0400
Received: from mail-yx1-xb132.google.com ([2607:f8b0:4864:20::b132])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWa3o-0002ma-L8
 for qemu-arm@nongnu.org; Mon, 08 Jun 2026 09:30:38 -0400
Received: by mail-yx1-xb132.google.com with SMTP id
 956f58d0204a3-660456349d9so4151052d50.3
 for <qemu-arm@nongnu.org>; Mon, 08 Jun 2026 06:30:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780925435; cv=none;
 d=google.com; s=arc-20240605;
 b=YnWkMWlN+BI2nGPKZC2an1u1yix1PlmQI+A6M4zWKXCmVg4mm5l2yz4AKg5tCFfMeD
 vt2zDttaab5/EYft57mZFXRct+PyaCQiAA5GbPanHvFLojN6pL1kf5ZqC8q2CZCIvdYh
 SfdGQ5S+wUVPDHYqwZ/Dkafvoo5e1PDWKFU5kLQIGlXNGQMYMYCIRItjZ7HMtErIr/5R
 xkOi6tge9YVLl7MsBXY5ua+Bbytd2z3/WbrAns2j8NS5aeJLmiDXBYp20b7uFeBfoExJ
 b7+40IHDoe+7Dyhfw3j/1EsAqLlfVO0EyZDYE1aS6gY7dRhI9NXm2ptUppGOkw/BCOl0
 dv0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=PsLWL74BoRjUjdW6fn0hi8lSYZTAAtYLAmP4Y8UoPqk=;
 fh=hm5TdefFvmg7F1fDuB2i8MPI5PrTYQeHbFy8gtaTaV8=;
 b=OjmBCauhRrzWemZcizbh+OGglLDRDoIpbEcU6RiH2MhZ6Feq8DPCFqBAlTzqqZNSGd
 hJOuzmbO1b9KtofuIsOkJKlmwB/LK9eWdryfiRytXsCHdZe02EjEDMMA7UWeHz1bnk/S
 ffOly/2NtJJvL5mh9ASkVsbu4dRjZJz6y4XOSvPnkYrzPcuLxd3KnGDn+s6bGf3fzEC4
 6myyc8Dz8xonj31ejsQkFUjVLVKRm77rjQmEJJpsIm7GUBYJGBjYOQqSzJl5veZbgAFS
 5vKzf7DVFSZdnak93/oaev+dkgzaUDREmJVHkJ470/tYfBB3RE01avItw7FA7SlnbXN7
 4Jvw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1780925435; x=1781530235; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PsLWL74BoRjUjdW6fn0hi8lSYZTAAtYLAmP4Y8UoPqk=;
 b=iqq10YXkA6SWJgZijndLbVB6Dzbu8hiSmTvMezAV3wvucwL1PAuuTfNr3tJo4FjUhl
 /c/ul0twI4R+KH4Q03KoEUWGnEQfoW+SAk0JT1c7v27ar4Ft6amqiBLO5jaQSqO/SSkG
 N9gLZz8aUKdtMWgnK1jx5zuuFvAEi4996WGzjz8blFTYdqwJyOAtnzYCEflWofxnpS+w
 Rn60AJS5CBF/e2unCPZ4VCGg/LuPg0xGlthZBXuOVSVm5yzkcvzehF1kC1fM7YTptC6b
 tFoGipisbX/4zhxC1kBihL4B9CK/khgGzLRhRvMC94fRMRj7M9ZUIS6cUrDBbBHn83qQ
 jKSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1780925435; x=1781530235;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PsLWL74BoRjUjdW6fn0hi8lSYZTAAtYLAmP4Y8UoPqk=;
 b=ewx+UB/cizhtbaKnGFDLoVmVChGCiKH8jsWBrg9CyZdnTpFVhxLW4ZzP3ZAFGg8ntU
 6PB81ta9UpPxXL7+Wf68IV06P9a60ImLPOCVJHhxLA+dKHSq1wzWr3F6wbmce23XJBx/
 ZgnhIdpWcv9uNZg+SJRpHSFRdZTIHrkl7h1T3OnqBXPxHvfaFi4YhoQEmjyo6sb4K+hV
 Zlhlb6uH+Zqak+IUIISdc3HQolI/u6EjTBg5ay2VJl9eZDutj+cLOCGzv8uCCFW2muc7
 oNDj+B6jB5UZoN6H1Hl252di5PZHsuXC1NvxgqxBxWWvRxIsvKi7Xw+0B0lc4i2oeeR4
 0fcw==
X-Forwarded-Encrypted: i=1;
 AFNElJ/jzHXp7aFJZuBpTOEDFqKi3t9R7jWY7l3oJd+tvv8SIEYYJQf334H3UpMKm8VZRD3OWkqJaCuOig==@nongnu.org
X-Gm-Message-State: AOJu0Yw8wIbWfFAWw/E6xLZSfd2Jwk6NAGpgwR6dw3quIsniFIGfwchB
 b9S0LiOKIO20MXuIEfEJquIwzsZsUYA0UNQXHCudkq87zfKhh7qtZM2Ckw9l8ePBYcqBQF6y6iL
 HTzXi3xujls2QEpsLzGbW4BO7ocl8gISo/CYMu8qpsg==
X-Gm-Gg: Acq92OH12BSWoMY4ILz7Tq6/+3ykKeANwAZ0ELSwiAnAwSEueEEawboznKtxMAScJK1
 tu4fkDo/w/QYhIwOUpaS9u80IBZ4ebqO71RNtDis2p4j40CNfieC1524IICTiha86D9+HEvLo2E
 XRnWe0DUCw4clUf1x70hpEZJUskGD3u0rGHNrDoMhv06BBzF+gZuhaZkTCX51KqOSEt30Y/4VyX
 3p7O8mji5CTmNKHajxhf4Xiir1T5MGAUJMXIa6GVOppnUUFTaQfp7KkAkwxcMwy1jrSDCI0LQvN
 +Aj1EMJTCpa7h1Qj62r+SG7lxH1HLgS+tnxqm+gfCEVST56DZ7D5BVlVMVq17N4k+Af61v0ZFJR
 bTQ==
X-Received: by 2002:a05:690e:120a:b0:661:37ed:6461 with SMTP id
 956f58d0204a3-66137ed65dbmr3430968d50.1.1780925435175; Mon, 08 Jun 2026
 06:30:35 -0700 (PDT)
MIME-Version: 1.0
References: <20260521112806.504961-1-kraxel@redhat.com>
 <CAFEAcA8hbObntY8Tp+kOV7btb-io92O9GW99-6SPxigPJUjPrw@mail.gmail.com>
 <aiE5LrpfnJRbkx-A@sirius.home.kraxel.org>
 <CAFEAcA_ow2ro3h0nfhY3jA_XToAnjdVFNPrF25aWLd=X2cnmaw@mail.gmail.com>
 <aia8iXGozAclWQCb@sirius.home.kraxel.org>
 <CAFEAcA9oB_-ao5C8fGYonE7njUMWLHo5-iETeN_XtnFL4PzyvA@mail.gmail.com>
 <aibALjyPTXVUDpDv@sirius.home.kraxel.org>
In-Reply-To: <aibALjyPTXVUDpDv@sirius.home.kraxel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 8 Jun 2026 14:30:23 +0100
X-Gm-Features: AVVi8CetmNrwVukKIi-1g4-LBK3y_qq1bRAZUL-3XCNm9LKAy6WWUy7gT_Xf7FI
Message-ID: <CAFEAcA-VQWKzJ-aNnzYHZ7a+sVP1y6tkUnE3YCPydsqP0uVXvg@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/arm: add support for shim loading
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b132;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb132.google.com
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

On Mon, 8 Jun 2026 at 14:23, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > When not booting via UEFI you can ignore that.
> >
> > But if I'm doing direct kernel boot then by definition I'm
> > not booting via UEFI, I'm directly booting the kernel...
>
> You can (on aarch64) do direct kernel boot both with and without
> UEFI firmware ...
>
> Without firmware qemu will load the kernel binary, then start the VM
> with the instruction pointer register pointing to the elf entry point.
>
> With firmware qemu exposes kernel + initrd (and with this patch shim
> too) via fw_cfg, and the firmware can pick it up from there and run
> it (instead of trying to boot via disk / cdrom / network).

I don't really think of the latter as being direct-boot, and
nor does our documentation:

https://www.qemu.org/docs/master/system/invocation.html#hxtool-8

# There are broadly 4 ways you can boot a system with QEMU.
#
#  - specify a firmware and let it control finding a kernel
#  - specify a firmware and pass a hint to the kernel to boot
#  - direct kernel image boot
#  - manually load files into the guest's address space
#
# The third method is useful for quickly testing kernels but as there is
# no firmware to pass configuration information to the kernel [...]

Anyway, I'll reply to your patch updating the documentation
with some suggestions for expanding it.

-- PMM

