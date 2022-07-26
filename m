Received: by 2002:a05:6512:1086:0:0:0:0 with SMTP id j6csp1529186lfg;
        Tue, 26 Jul 2022 07:06:43 -0700 (PDT)
X-Google-Smtp-Source: AGRyM1v5TF2r1Y6Xf2fo/00T4ERVuTXpJzg+Gii8cOKdMiu7ULkp5ejVNTO5FEr7TZ9golrsMY8D
X-Received: by 2002:a05:622a:4cb:b0:31f:106e:17ff with SMTP id q11-20020a05622a04cb00b0031f106e17ffmr14610284qtx.68.1658844403038;
        Tue, 26 Jul 2022 07:06:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1658844403; cv=none;
        d=google.com; s=arc-20160816;
        b=CLtvMY5uS0fOJTCWcKpd9nX6Nj3R/4R/vtsCVJpm/4pEh+8CQ0osfiXimNGFr3SnSR
         fqWNxBpv8DTl29zDdLjs1j5O7MCVVKIvGJ4V/LJmva+LQzRoUbnL/gz8dF6WHY9G36T0
         E7oSsI1ZDNT1gzWJw9OLBnDl+qpgkzvW9TQsRK2QK/oLEwicETuae9oQoRLog8DJ2iBc
         N2dYZH5Op1DheVzXMhCgNTh47RM0iPbaOuRlNXPhEcSlHJvvlrSM+MEEo7SVcMGKbKuW
         ajFNIPbLmok2i3iVInfvthjZ0CBW+1e3UK2rcZfJ2YgA3dpaJBVpWM/uOte11f6YuS5U
         BuJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:cc:to:subject:message-id:date
         :from:in-reply-to:references:mime-version:dkim-signature;
        bh=O/IsjDxVyOsxpf8S4+/+yGtEeA/Cwn3k2GE/zxqxqsc=;
        b=Nx0Blrc8hZs3xq+gIXnuAXrAaXBa9OOt3nv6w13HJshqfbPiMUwnNEExaypbD6Bl95
         7zUpNvMOIYlFLU8JI5u/s9ams48J7g3eH91gK+36hQKM8kMaLyrVnQiVOfeZsmZ9lSG2
         FKeXtokwbRW2MLW950AHLcsVvo5irsd6CpusnJ8GYYYKIge/7IyGBZenummDCnAcEAnS
         yqwLAM1X7AdkqjRBxmnPsOlo2w3RSm4R5srIGH+g8987T3aDSTCJD20G3KbABzMNNjSI
         rpnoE5rzFOM+Yya1/WAsT/Nerb/oXJC/hzx4MKi/iVKsdVSbZ3w7vJ+yO4ts2r/FPMzj
         OG+A==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=USbaBvFB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id iv9-20020ad45ce9000000b00473724b5b2csi11285341qvb.35.2022.07.26.07.06.42
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Jul 2022 07:06:43 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=USbaBvFB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1]:38656 helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>)
	id 1oGLCa-0007Sh-Jz
	for alex.bennee@linaro.org; Tue, 26 Jul 2022 10:06:28 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10]:58060)
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGLBp-0007Rl-GX
 for qemu-arm@nongnu.org; Tue, 26 Jul 2022 10:05:37 -0400
Received: from mail-yw1-x112d.google.com ([2607:f8b0:4864:20::112d]:44010)
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1oGLBn-0001fj-Jy
 for qemu-arm@nongnu.org; Tue, 26 Jul 2022 10:05:37 -0400
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-31f56c42ab5so7341497b3.10
 for <qemu-arm@nongnu.org>; Tue, 26 Jul 2022 07:05:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=O/IsjDxVyOsxpf8S4+/+yGtEeA/Cwn3k2GE/zxqxqsc=;
 b=USbaBvFBjmvSPLgvss74ByLRWMF9cGAg/47K6rLhJ7GFeRJFs7oZGvlyka0QPufjr0
 pV5RPJgRRoiYaaFJzpgfbUABd8xpYUE4Ua/Ekj3oPq8esudsoX2IoV4H0MRsjE5edsaG
 R52xRlEqe3ynRPxxILB/Ix86+xjSQzYp8ubo+5HTpn+JLdrCAES/pjzcAaEH7j7GjL4v
 JPBbiHDZAD0+MqhblPMKm4smG40FoRKUcqF20E6T+3X3Roiy6i8ajfxeEwJTeO9Q6Uwk
 J+gjVFS5IowbRoSBr5lP5uhMZRWGK6UfPbc61rJUvkWu+lk+oFhXyyU5Vc1FbrPbvw56
 c5KA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=O/IsjDxVyOsxpf8S4+/+yGtEeA/Cwn3k2GE/zxqxqsc=;
 b=A7UAqXeexG/JgfCo0BaT6Ql4o9aWvradVyU3llPQ8Q16okCLS7UpJQ/Bg3GeZgHQiJ
 Bfln/aRALJvBa9GFEGiSvifZavfbdaoLJ1lmJYYdVIi+xV0AaH0dmQJKAltYf2UD508v
 IzuUntgrtux4rwgCwJJTT3rNockd4hudr+A+8hkmrDWLrelXn6cw9V/Xj0YKCHE8NLBx
 HE7dj7j98q4FR6icaScJflgzw6fY+6kHReUPBshHyUT3fm6ENJM5FbeiC0awzvOei2/p
 Je892211WD0avyfsUXgb6rYfuzMdVtdnGKy3rfgl7psWOPe4aZ+64VfsAaC4y8QU2G8E
 5eZA==
X-Gm-Message-State: AJIora9LuVk7Jzjc0FwR9WYrwrrhZOu9qB4p4R6n7Cz3nZX8/orILv6w
 6bQX1M1dqeCnI70z9bEzj6QN3FCZcGUMlvN7qThuqw==
X-Received: by 2002:a0d:e004:0:b0:31f:311d:2351 with SMTP id
 j4-20020a0de004000000b0031f311d2351mr5818042ywe.10.1658844334253; Tue, 26 Jul
 2022 07:05:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220725145838.8412-1-alanjian85@outlook.com>
In-Reply-To: <20220725145838.8412-1-alanjian85@outlook.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 26 Jul 2022 15:04:54 +0100
Message-ID: <CAFEAcA_LXAcWcUr9ajFTaGFCpw0Vnmf8Ya25ZM2JO35jEdhU7w@mail.gmail.com>
Subject: Re: [PATCH v2] hw/display/bcm2835_fb: Fix framebuffer allocation
 address
To: Alan Jian <alanjian85@gmail.com>
Cc: qemu-arm@nongnu.org, qemu-devel@nongnu.org, 
 Alan Jian <alanjian85@outlook.com>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::112d;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x112d.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001, SPF_PASS=-0.001,
 T_SCC_BODY_TEXT_LINE=-0.01 autolearn=ham autolearn_force=no
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: "Qemu-arm" <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
X-TUID: Ep1Iw4Uqydsn

On Mon, 25 Jul 2022 at 16:06, Alan Jian <alanjian85@gmail.com> wrote:
>
> This patch fixes the dedicated framebuffer mailbox interface(marked as
> deprecated in official docs, but can still be fixed for emulation purposes)
> by removing unneeded offset to make it works like buffer allocate tag in
> bcm2835_property interface[1], some baremetal applications like the
> Screen01/Screen02 examples from Baking Pi tutorial[2] didn't work
> before this patch.
>
> [1] https://github.com/qemu/qemu/blob/master/hw/misc/bcm2835_property.c#L158
> [2] https://www.cl.cam.ac.uk/projects/raspberrypi/tutorials/os/screen01.html

Thanks. If examples which work on real hardware don't work on QEMU
then we presumably have a bug, and the documentation of this fb mbox
https://github.com/raspberrypi/firmware/wiki/Mailbox-framebuffer-interface
doesn't say anything about using the top bits of the config-struct
address for anything, so the current code definitely looks wrong.

This was the only place where we ever changed the config
struct's .base field to something other than s->vcram_base + BCM2835_FB_OFFSET.
If the .base field is now effectively constant then it's pointless
and we can clean things up a bit by getting rid of it. I'll send a
followup patch at some point.

Applied to target-arm.next, thanks. (I tweaked the commit message
slightly.)

-- PMM
