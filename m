Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EC5CCD98ED
	for <qemu-arm@archiver.kernel.org>; Thu, 18 Jun 2026 10:18:45 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wa9p7-0000OS-Mz; Thu, 18 Jun 2026 06:18:13 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wa9p4-0000Nq-S3
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 06:18:12 -0400
Received: from mail-yx1-xb12f.google.com ([2607:f8b0:4864:20::b12f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wa9p2-0008OJ-GF
 for qemu-arm@nongnu.org; Thu, 18 Jun 2026 06:18:10 -0400
Received: by mail-yx1-xb12f.google.com with SMTP id
 956f58d0204a3-662dc3879acso731865d50.0
 for <qemu-arm@nongnu.org>; Thu, 18 Jun 2026 03:18:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781777883; cv=none;
 d=google.com; s=arc-20240605;
 b=GN4Oo2hW4cGse8hZUqSwk9Rdi60V4QmVCaEfGcKx3IZJkjsOqHE/l4rUCmKlpLM0rw
 8RpFDPKu7uYRzaphqgwFIz0RFHHPJJORF47MGNTex48HNsBLwuzcTtU4ojmGQu/vri4H
 YctVH226V13rgtp/LkuvrnGuXvH7zPdXU06oX6qD4//yL6zhpDc/zUwV7ulGgTdE7GA2
 8AhaBdwwUjhazqpZ+/KHHhJGNPVX9Ik4HhnR8kMWLAtb9UZ3Ch3T4QHiOeT/Phpg+JVV
 qb+j5dSWAe7fseknrClTJqN40KHX+SQ8Qe2al5hMAWWly/+TRPjLpquqc4qNXmm0bZ6u
 Q2dw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=4biI3e+H+eEjnFRRNElJ478o9TT58k6Cx6ZjjZcCIIQ=;
 fh=aY1wQp8+LXzM/R1Le4CryG/h0zrg5wYQCTma4GVnUR4=;
 b=OJzFg8lPasGPPwBcBPuaY/TiqDk0OVCBkHa7l1W8rj0Wn3BvXu7ZYXOZVnsfyUfR8N
 hptnla3chCpPn5+YUsNiNciS4r7xFPNkuHBMoxThrm9AJ63CJVTtCYO8dRvF0WaxMv5O
 sSSlkuTB+DXxXbNA1dsRPr+9pZN8G8wOTiIT6cT3DYGLfqO3S7WeK7zYsbmy5FwLM4ci
 R08EqOlBbsab3+PImHigIBaowuvTSXzk+/xWq5r8QToO85T2H4EyafxnXs5AINyyJtt5
 oLvFvQsufcBhWEMtFHo7+l9hRhHB2OcArVmn+JxMuCCibAHvpi9cfdW43Y/xPtnWdXno
 liBw==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1781777883; x=1782382683; darn=nongnu.org;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4biI3e+H+eEjnFRRNElJ478o9TT58k6Cx6ZjjZcCIIQ=;
 b=bH4l5dej04QhrLUPcxhHIOdkUbJj36OaUGrWfT2le6E1OTcvbCU9GtdQ0pm/8VrDVj
 xrnnnFtTUhedha2P4mZH6/dAK0oAYB2ZcMhVsNfTumG7V1fYqvVemQTf0Kb7+LX2ho9d
 wCzknQ881XZXrM6SyySh0uDN55/XiwfW2caaxodzsqp0INM26cWomzbVN07D5laXv4mK
 tjszl28S8YcP2uTQN5OeRI7sYo3Px7fvUTeNu7zYD1AhkSfrCPbCpZxRLzmnJ/flO6Qq
 UqPSLUJzQQN7KqUk3L8taa6MyiwVFGU9NpKhY+s/L8fqi/KW6PSFNTSBCYEEO/bArYYb
 A5nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1781777883; x=1782382683;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=4biI3e+H+eEjnFRRNElJ478o9TT58k6Cx6ZjjZcCIIQ=;
 b=RUGedGX1u3ivtvaWDFGU9lqHMb0ZzTrJ6egsz5BICzru/nAYssxMSI27JPjP8vO3SP
 k/AQCBNrImOz194qx3sn7S6q1hJk5xdA1Jm1cObdODopWP6HIaUjAWftYRV4/JMmtNt+
 TGy365cOQAUNTTgkIv6jY/DkNM84To4MwsQjne+Q6S9jyvfAAUHyUFoiOaMJicOATEbH
 dAwmggI7WQH9zShQY8cIyBZq7sThYf59lsCF+Br9zOGhSZBco3vFAIESaVXWzTWQM/xY
 9/KHlj4GcUpRLNK9uowNDScRZ8LTTFXWaqbmgI1vEmeTmaEnKAw0VDFe0IyV+boaABce
 1HXQ==
X-Forwarded-Encrypted: i=1;
 AFNElJ+2wW9h5AF/NZaOH3XByr+Dgf6fq7T3w9r6Zc1KAeDy5IYdshgph6zg3TGn1oyEgQBb9hyqzoU3Og==@nongnu.org
X-Gm-Message-State: AOJu0Yw+JXZ3UE5XaijRQObIi2sm81Hbogs2JKSYmI4mZ1RcYItJGscF
 0R4MsUEhLGiboc8pkCgBq1LTJ8cUZEj83/ztVJcmMJ21ad/9ZniacC2WtGA3J9A3XGBeaqAWeDq
 IQ+OFwJxT2PBtTCakCVOaVqrfYdmGmCFVzrH2cZgIhA==
X-Gm-Gg: AfdE7cm55C5gaQA1lhm/oq7Wt8S/CWeiUYkkDVFI+4P+5C3EMUUBck3+rROhlGVIUY+
 E0XPyK2hBVJDoT68rGufnXfaA7CzGK7jX39KFOTVeaK3djILO66+9UswafOsdkj8u31NcXZ4j+2
 SXP/UdOzvBb+TepCS8j/2kcsKGcKFnrBCrGbcraCcCDAs7FEIG6x0LSbeFufI16hLcslBVw89HU
 r8I4DA2uN+WVr/I5jOF2XJXiGoHAhrUKPNdP0GEngqSrh00cw21ycovoaJ99vPQdbRGihVRwAWU
 OY5vUSvYGp/xVYG0ma9aE4E5726CsHDSw4eAqjV4frNy6Pf3Dx1nb3egGISs7azaghM=
X-Received: by 2002:a53:930e:0:b0:660:8253:b836 with SMTP id
 956f58d0204a3-662cb92ae75mr6480129d50.5.1781777883081; Thu, 18 Jun 2026
 03:18:03 -0700 (PDT)
MIME-Version: 1.0
References: <20260618093615.3793919-1-alex.bennee@linaro.org>
 <42927637-2e5b-46eb-9d25-8315cd36fda8@oss.qualcomm.com>
In-Reply-To: <42927637-2e5b-46eb-9d25-8315cd36fda8@oss.qualcomm.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 18 Jun 2026 11:17:51 +0100
X-Gm-Features: AVVi8CcjOb5gM5JtLwhaMA192aJScDhhojp0M1r9Bb6c9w5kj2WFlmtWIzlpqV8
Message-ID: <CAFEAcA9EUJrmdjee2PiLzObN0JagR2swd5x_fydDf6PVvD64Hw@mail.gmail.com>
Subject: Re: [RFC PATCH] hw/arm: use correct base address when setting CBAR
To: =?UTF-8?Q?Philippe_Mathieu=2DDaud=C3=A9?= <philmd@oss.qualcomm.com>
Cc: =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>, 
 qemu-devel@nongnu.org, Arnd Bergmann <arnd@linaro.org>,
 Tyrone Ting <kfting@nuvoton.com>, 
 Hao Wu <wuhaotsh@google.com>, "open list:Nuvoton NPCM7xx" <qemu-arm@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Received-SPF: pass client-ip=2607:f8b0:4864:20::b12f;
 envelope-from=peter.maydell@linaro.org; helo=mail-yx1-xb12f.google.com
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

On Thu, 18 Jun 2026 at 11:07, Philippe Mathieu-Daud=C3=A9
<philmd@oss.qualcomm.com> wrote:
>
> On 18/6/26 11:36, Alex Benn=C3=83=C2=A9e wrote:
> > This should point at the base of the Cortex-A9 MPCore private address
> > space. If it doesn't we will confuse the Linux kernel as it probes the
> > SCU registers and erroneously assumes the system is a buggy Aegis SOC
> > and nerf the emission of SEV instructions, deadlocking any WFE's in
> > the kernel (or QEMU smpboot code).
>
> I'm confused...
>
>    The Configuration Base Address Register holds the physical base
>    address of the memory-mapped GIC CPU interface registers.

Where did this quote come from? Note that the CBAR is an IMPDEF
sysreg, so its exact behaviour varies depending on the CPU model.

The A9 TRM says:

https://developer.arm.com/documentation/ddi0388/i/system-control/register-d=
escriptions/configuration-base-address-register?lang=3Den

In Cortex-A9 MPCore implementations, the base address is reset to
PERIPHBASE[31:13] so that software can determine the location of the
private memory region.

and then in the A9 MPCore TRM
https://developer.arm.com/documentation/ddi0407/g/Introduction/Private-Memo=
ry-Region

you can see that the private memory region has all the per-core
devices; the SCU happens to be the one at the start.

-- PMM

