Received: by 2002:a17:906:18b1:b0:a2e:1324:ea5c with SMTP id c17csp369268ejf;
        Mon, 15 Jan 2024 09:02:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH8D8rWimJTPpuXzbGvX0L4zGSsNaxqD6wWUgFnL/7WeVq/zjgbeXuqSXDNjUb4yHG1bGme
X-Received: by 2002:a1f:7d0c:0:b0:4b7:6c2f:fdb0 with SMTP id y12-20020a1f7d0c000000b004b76c2ffdb0mr2468025vkc.0.1705338141356;
        Mon, 15 Jan 2024 09:02:21 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1705338141; cv=none;
        d=google.com; s=arc-20160816;
        b=i0EVo8M8NoF4oQm6TZCACodnb9MoGQRSfmQGo5peUzTwQPxAs7aG8kimZZODkRxoPK
         /WY/Z3t2Jrk/EpTwQtNIjhLwnez0CB59oitfbXKn5U73w7fKCSvGiQFVFGMPj61usYR3
         oq51Z6lycr58a6IMSP3+U6JtB4zhRxurfDWv94g2NdI6LTzx4rCLCNF8SmL7P437mxng
         1pRQKGwZ83xxMWaAWJjCuM8Ewnmmd9Ybko8NaQoW3AdDE7xokAzv0O2ra4nUIP3pJSpU
         Fh/oJhc06JoAC8/oMJI01Aj7aasoqCGQWnTnIx41jfKsl7/SXPl/Osjqj7n+4wP5AptA
         36Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding:cc:to
         :subject:message-id:date:from:in-reply-to:references:mime-version
         :dkim-signature;
        bh=AGwlGAhd0mA1JYn1BCHmVsL+RAIJ122TLrnq5kJ+q1k=;
        fh=R0Uk93c2UowJAnA8LybPaViTSfjsv755BgrHgmmG7As=;
        b=MD1yRW1jJgRPHcdNsswS8KbjGCOmWM0I0jKWntX2TH0gKdh4aV6UNroVDJErIFQgFI
         DUrFUBaZ8IOdych4ARnSIVAeEA33epzBtNQ3frd9CVm3JiC0tGhaJcRxGGD05clRHwYQ
         geDuIlrb9SDYUqMPDq5aU6y79j/d74NaDWVydl8oOIixCjOKQO9LBD3d+9G1zj/UNlD1
         ErXh0HBUCvYdQZXQhk7oy/PMWr3a6IgQWyliLTEqdl0azcDl9q0PoK0gmHYWSySt+H2B
         bg+rOUIoKVbr8J1d7W7gQNd+dqyBQET9rcSMSfgPAjGH3I93yR0M94isRJwPX+aSjTWr
         ZX7g==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fQoYGGp8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id y16-20020a056122055000b004b6f5245593si1311161vko.48.2024.01.15.09.02.21
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 15 Jan 2024 09:02:21 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=fQoYGGp8;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rPQK4-00007C-Q9; Mon, 15 Jan 2024 12:00:28 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPQK2-00005y-IX
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 12:00:26 -0500
Received: from mail-ed1-x535.google.com ([2a00:1450:4864:20::535])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1rPQK0-0002JZ-NP
 for qemu-arm@nongnu.org; Mon, 15 Jan 2024 12:00:26 -0500
Received: by mail-ed1-x535.google.com with SMTP id
 4fb4d7f45d1cf-557ad92cabbso8781610a12.0
 for <qemu-arm@nongnu.org>; Mon, 15 Jan 2024 09:00:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1705338023; x=1705942823; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AGwlGAhd0mA1JYn1BCHmVsL+RAIJ122TLrnq5kJ+q1k=;
 b=fQoYGGp8JgKlAA4rDxWXPLpgaVe74NhAbN52k8lLi3M29Evf98Ttnq1UWQfiQm29Yf
 f+nzEWPvAnH9JMlC4nybemjKsDsc1AF9Pujg6ZSzxl/DznYj5PfyUotH994NyRC+Hw0Z
 7pfTDjeDXaFCx6g+wOTyeCcmK/+ZieQe2P9GBujBontmN3hURqPbAbqLny2sQ02lhdlP
 YplKXuW4zCXTyY/awTZcMpaTJ7JwUuNxb5WRoKaehB7qcvyedFtPjRElNKQSwPdYsDul
 A2OLzZ+8vAWHWElCphKu2xXtzccL7Kyr46w+Vr0se1GXhfTaj71aVItoI6V5JAZT5+Em
 YUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705338023; x=1705942823;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AGwlGAhd0mA1JYn1BCHmVsL+RAIJ122TLrnq5kJ+q1k=;
 b=dYSgRgCh73MYJgeLMcsAcK9hm8+NtoWon/r7Gdtilt43lAt2owEUoynX70kzgKHwb2
 6ViYItLw43oxe2CM8JThtVtRkHMMHxo4B2DZd3UkS+mpherzuO7MuVJ+NWiqxmBFQ2IN
 Uew2OZ5cfNDjVeNZ1vMWsee9scMxJQx3rAtJdxz54MZHHXNjv3VHcyyonJKmzoKmtUYj
 ArUuylnd96A3WkeuGbMQ4u5ISSS4EjGXwZ+rCa/wmHEep1piOIjq+91bzDgy7sTqsHM4
 c/AQO9umrn4AdkaPP0EgQIg7DLT5QvHktlX12R1EHQrC/Ko8Yg0lnQC7eJMRaU1Vxmvj
 ceeQ==
X-Gm-Message-State: AOJu0YzHyHyqAePHhk60WhBCtTRRo/aRCA/noOWBEoMKH5vvknIk/utd
 pbR4S/Y2AJxjqjZyAKi8LjINJFnzVRCcqgbYEoh5YlsHmjKicQ==
X-Received: by 2002:a05:6402:553:b0:558:7f0f:aa79 with SMTP id
 i19-20020a056402055300b005587f0faa79mr1590008edx.66.1705338023153; Mon, 15
 Jan 2024 09:00:23 -0800 (PST)
MIME-Version: 1.0
References: <20240115165615.78323-1-philmd@linaro.org>
In-Reply-To: <20240115165615.78323-1-philmd@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Mon, 15 Jan 2024 17:00:12 +0000
Message-ID: <CAFEAcA9vo4BMys0EbqYq0a_eTQahbJnAb=N_fHzWCcGqeoK=yQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] hw/arm: Unconditionally map MMIO-based USB host
 controllers
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@linaro.org>
Cc: qemu-devel@nongnu.org, Beniamino Galvani <b.galvani@gmail.com>,
 qemu-arm@nongnu.org, Strahinja Jankovic <strahinja.p.jankovic@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2a00:1450:4864:20::535;
 envelope-from=peter.maydell@linaro.org; helo=mail-ed1-x535.google.com
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
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: an85OfYL2upg

On Mon, 15 Jan 2024 at 16:56, Philippe Mathieu-Daud=C3=A9 <philmd@linaro.or=
g> wrote:
>
> When a chipset contain a USB controller, we can not simply
> remove it. We could disable it, but that requires more changes
> this series isn't aiming for. For more context:
> https://lore.kernel.org/qemu-devel/56fde49f-7dc6-4f8e-9bbf-0336a20a9ebf@r=
oeck-us.net/
>
> Philippe Mathieu-Daud=C3=A9 (2):
>   hw/arm/allwinner-a10: Unconditionally map the USB Host controllers
>   hw/arm/nseries: Unconditionally map the TUSB6010 USB Host controller

Yes, I think this makes sense. It is technically a migration
compat break for the affected machines if the user was
passing the '-usb none' option, but I think we're OK with
that; worth mentioning in the commit messages I guess.

-- PMM
