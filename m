Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42963CD8CA8
	for <qemu-arm@archiver.kernel.org>; Tue,  9 Jun 2026 10:55:24 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wWu70-00006I-3o; Tue, 09 Jun 2026 06:55:14 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWu6x-0008Tt-S0
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 06:55:12 -0400
Received: from mail-yx1-xb129.google.com ([2607:f8b0:4864:20::b129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wWu6w-0002pM-9G
 for qemu-arm@nongnu.org; Tue, 09 Jun 2026 06:55:11 -0400
Received: by mail-yx1-xb129.google.com with SMTP id
 956f58d0204a3-660512d80b4so5839270d50.1
 for <qemu-arm@nongnu.org>; Tue, 09 Jun 2026 03:55:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781002508; cv=none;
 d=google.com; s=arc-20240605;
 b=FVZ1BA9JCdySjQccJJSBdQc4pQ5ExZG+W4j4F39QTjZq5ZdM/czNRL2dlWu9WzrRiH
 I9hZdhePV96jY0re0UAhNTkm14qVPQYuaH4l4wos0hDV63dbNMOUZCKNXpaVcyrjmNL2
 L6L+l19KghB22RMRUxxiAR5ZIbQ2d7p4PI+1xhAuXP12/Zxjb/C8yPUb7pALAZ/Zcd3F
 JjwFh+MWIE3+JLPKNDQdhQylKIlftsyRKBVsrhGhrWrlPBHi+wv05Cof1dOaY7Mrdhd7
 gmEMugoU84g4Z5eJRXYaOklkqksKXtucdNK5XzArEcZoklaIsut1cBqK+/8F0Gn7lUD+
 BB3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=bAtaAFGZwzjrH775iZLAsakth7XvKzHJ6AENtKI62AU=;
 fh=pG8GkprjOxxINsDbxHdUY6+JCji1HaIEAn2vvgfZZck=;
 b=AhzwGoAe2hkh++RZHjQjMPjwNJ9FgikwoycrVI4Pmsk/KIc+RDqaRKHKAys7PAp1WZ
 TitBv3+okzUoAeVzJW3qEz+gCHd0+DSRQOKLloQy/SrAIVte04XxvrpWz4sPsbXyh9fu
 RzuX/i6S5lb2UldLQ5P4zUw9nHSDAqm20lrK53X+DnNLHmujPKNc4Ap35CzfHknqoxne
 kNxa6RBs82gd6VWM9lLC6G7cPMGCcJsrL0PAOLFtUHTzJCFpBawDUDH0bileE/8ylmv2
 FfZn+4XJXmiTpJCeNGAQ5Y95TfhcwRmHcxyHMO8LaeUIqamnjmrI/oMyCmYgw8+KAZp5
 zEJw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781002508; x=1781607308; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=bAtaAFGZwzjrH775iZLAsakth7XvKzHJ6AENtKI62AU=;
 b=pkW5ozBZzpFONWIZbA6ooPLcbfFWDg714/GOXPS4FJBBUz6omBYOhRv693T9/K4MyP
 6vcEyp2A+2nePzS6jcZKKR8qz6XhbndhyhFkEg8e7y5dFZ3rUu6QVGaS3fOtzol2lmjJ
 gq7Qg89SjAAL9VTgxuuOWIE5BTCqw94dWB+uzKWc+J5P33sYGqLD4RT8+hB6CY1YUFpP
 trbH6aPJV/wZyALmG+QdVTS9ZFOLvk47kPzSJTN26b2WPPM7eaLFh7W6Zm2fIilt2749
 zv+GdK65dN2tHZr+h/2Y0pkHHVnbRvgQiQ5m4LPY16BhHZPv7UIQmcOIoJjNBJH7x35q
 xhUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781002508; x=1781607308;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=bAtaAFGZwzjrH775iZLAsakth7XvKzHJ6AENtKI62AU=;
 b=VO5fwMqdoHDj5AvitZtNsM8QsEEE4x49/ejk7LVaUgkZR0w92Ia05XIzMAWb/RyfUm
 +YpOu7nhojAMpUzKOD/liEpZHUSnEmNr+Vd/8jjLEoZNscC9WxKq1EGvJhlnjUzyvnUw
 bAOrEsBxFUWhPuLr/i6AN/gM52emoXzVWiBbwbjH5IpWqowfxeBiT8Nf95Gpx0r9IXY0
 hRnZYqMwNi2FNQjlH16HIlgTe/w1u+Uxk4JMa6XWvNrRz9i3jdqurwIIWXQvZcW3BpA/
 k0f9fssVQjJ0Mt+xWCHDqPmbZVzqoGXWi3K2EnBeg8AjKorXKRysqfkOf5oE3MZMwu8d
 wOIw==
X-Forwarded-Encrypted: i=1;
 AFNElJ+GXVpEDMf79m1sOOLzRjHNBLj8qDa4TQoAwjzR19mw+uel+0htGMwPDEXNGwxwJjUbQJRt/Nc9sQ==@nongnu.org
X-Gm-Message-State: AOJu0Yywo+pLrpTE/DaDc1sta+YS0waSEXiggaftnEAivUeus5KGw7Zj
 AR+YfKit0rn85x2dVQ6R8T/SqmFCHO79L+RBPJhDnJPe5yF71nx16JhCmN18ACXoWdh8NiToU6g
 dCGRXjP/Y4/k3Fup2Y7Yba4Pclx/e7rgcOL7s1vDBIRgvtMG+tw0q
X-Gm-Gg: Acq92OEECnPI5/6J3uZFGcQOtixs5xQFGEe/RR2IIx0Cg2Q8hXkwpBOJkvueGPV3j0w
 1WirjOzOGbghG3+SuHVzALlXPtp7H/0fh6jQFJPbdEnWCCfXQVmPzNUONcJvKzExtq0SVfLjnWc
 F6JN7psTD4WyBqT8dOHhvxR5K0jJWWv9dYlTkMwJrPMuwtqwpftA/O3GnY4iHiPvvk5wflC73hJ
 B+p27f1P4XETzZdgVFoVppWVc11ibAhw2usUN6Jl2FPKjNmGqH5hTJmKA1c89MA/qYc1AEOhkAC
 aVPkqojVLAL9yNIO9r3rQw3ZadNMwjjGO7R2kNNxIP0HfEAoREL5alvmlYWe3Ng+wK0Ug7MVDai
 Rp8MVb8svqVdb
X-Received: by 2002:a05:690e:1689:b0:660:38c6:8160 with SMTP id
 956f58d0204a3-6610a626fffmr12296040d50.2.1781002507594; Tue, 09 Jun 2026
 03:55:07 -0700 (PDT)
MIME-Version: 1.0
References: <20260521112806.504961-1-kraxel@redhat.com>
 <CAFEAcA8hbObntY8Tp+kOV7btb-io92O9GW99-6SPxigPJUjPrw@mail.gmail.com>
 <aiE5LrpfnJRbkx-A@sirius.home.kraxel.org>
 <CAFEAcA_ow2ro3h0nfhY3jA_XToAnjdVFNPrF25aWLd=X2cnmaw@mail.gmail.com>
 <aia8iXGozAclWQCb@sirius.home.kraxel.org>
 <CAFEAcA9oB_-ao5C8fGYonE7njUMWLHo5-iETeN_XtnFL4PzyvA@mail.gmail.com>
 <aibALjyPTXVUDpDv@sirius.home.kraxel.org>
 <CAFEAcA-VQWKzJ-aNnzYHZ7a+sVP1y6tkUnE3YCPydsqP0uVXvg@mail.gmail.com>
 <aiflCrf0iDwcpj27@sirius.home.kraxel.org>
In-Reply-To: <aiflCrf0iDwcpj27@sirius.home.kraxel.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 9 Jun 2026 11:54:56 +0100
X-Gm-Features: AVVi8CcrerybwJGdaDfs1LfeQ9Yqbhb9iHGmu50RaWYSsjt4SmMagGtGA9gERmc
Message-ID: <CAFEAcA_+fZnFG_2xH2gXF7ZtGo-WVwAhwkz9ucuS5kXZOYShnw@mail.gmail.com>
Subject: Re: [PATCH 0/3] hw/arm: add support for shim loading
To: Gerd Hoffmann <kraxel@redhat.com>
Cc: qemu-devel@nongnu.org, "Michael S. Tsirkin" <mst@redhat.com>, 
 =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>, 
 qemu-arm@nongnu.org, Richard Henderson <richard.henderson@linaro.org>, 
 Paolo Bonzini <pbonzini@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b129;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb129.google.com
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

On Tue, 9 Jun 2026 at 11:10, Gerd Hoffmann <kraxel@redhat.com> wrote:
>
>   Hi,
>
> > > With firmware qemu exposes kernel + initrd (and with this patch shim
> > > too) via fw_cfg, and the firmware can pick it up from there and run
> > > it (instead of trying to boot via disk / cdrom / network).
> >
> > I don't really think of the latter as being direct-boot, and
> > nor does our documentation:
>
> > #  - specify a firmware and pass a hint to the kernel to boot
> > #  - direct kernel image boot
>
> That is a technical detail which doesn't make much of a difference
> from the end user perspective.  And often people talk about "direct
> kernel boot" without drawing a line between these two cases, because the
> user-visible behavior is pretty much identical:  You pass a kernel to
> qemu via '-kernel', and it gets booted ...

As an end user I find them majorly different -- I usually
don't want the firmware, because it takes forever to boot
if you do that.

This is probably partly an x86 vs Arm difference: for x86 there
is always some kind of BIOS booted, but for Arm there
by default is not, and direct kernel boot is much more
common.

thanks
-- PMM

