Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A819CA5FF1
	for <qemu-arm@archiver.kernel.org>; Wed,  7 Oct 2026 12:52:55 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1xER8I-0001Bi-Cu; Wed, 07 Oct 2026 08:52:30 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xER8E-0001BM-Gi
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 08:52:28 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1xER8C-0006e5-7p
 for qemu-arm@nongnu.org; Wed, 07 Oct 2026 08:52:25 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-8ac525c1f05so38453047b3.1
 for <qemu-arm@nongnu.org>; Wed, 07 Oct 2026 05:52:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791377543; cv=none;
 d=google.com; s=arc-20260327;
 b=LDxWkeL4ij+53V7EXmYkZhEuC2BRJJzHQxA32PmX0ZeOm44vegCwjBHhkET+YQawRe
 4PGDrK1Bj95Q3FNlbI6sVLDCVlAxZ0PlkmCtEmFajduQOz8AxcX3FsPZ3vQYL1SXMK2d
 eHh0zZ/lDeEEUagrBUVOVX/1MTGlYQGH6De6imhAgUI9WA5Oo8kvgLZfwKzAuQzctLNB
 ru/r7qvyjF/5ve2EFw/Ne863YlShAExQmXzWW4XuzsBHJJBx3frBiI5tAqhm9DXkAGO1
 JjUAhlMFqpBNLfzcUVWhJtYnv/GPJPYvYbonvxlcstbZCIffbF7pYqJbuWN+/JEVlVUv
 5pfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=/M8ny6Z7tZvO9/2DnAQg/U+xG9tNzcjhn8IlIp4a7Z0=;
 fh=NHYibxx6YTYPLYzwPG8cfJGfCstKuT2Vxm6yB3l+oNk=;
 b=K7dP8Ms6yFt9LH3UKPStrpVhlF7HtT7W3ECeKs1z7oMV5PxQwAzXyqeWvxuK1kCuq/
 Als+Hqo5P7kZ8qQhIaSEm78xlVSfRjfeYpNynV5TmGOw3mFbM4d2jXSX7Uz/AJ7aGK2q
 NTAswLBGJBxJ5dJ6d8AFIam2Oeb/JbVmGZDZjansWnK3wGYkzioSd18jM+k1u9kZpJaH
 YsLy7uYWt6Yt6/oHND3mrqPJpMeRsXc9NMGhxQhv1qH/YIhIv5ZWcUagMKYPT8YhxhlF
 +6awvynmMddOuQ96LF1COpAf+IGIJi5BgFXcWUxby55cKkZhdZWAoLdu4pxh7eQwTQV7
 C+5w==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1791377543; x=1791982343; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=/M8ny6Z7tZvO9/2DnAQg/U+xG9tNzcjhn8IlIp4a7Z0=;
 b=BRtuJev0fNbvbt7L+MVJu0zAxlZ5Xw6ypmJy0B0mU9qroHOoch3eTr2omqBDR8Pyp0
 K0bNT7rJDMlIgzpjzM1/CMQ0UT6+RnO42reg8HfD5869I681GkUqCq5CFMFUl/bHokBt
 NhyTuFV+6sMox2xtIzkWY0jTF8+KN/dyEl+TwbQGZ4RD/vdzLdymoqxclSi+cTzDm0Xm
 lBKdzfA23/3OxkN1YBco3IYl7jsM69wAOZyZmpMz7FQ5HjHo5IA9EhWqOkV8txzEtSU/
 SavIaI+8GQZR73H+FIqD1C/rThT9Ey2L3yj53ezp75KMa1qg2wvmy8tEO9+GUBLH8Jmv
 ZXWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791377543; x=1791982343;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=/M8ny6Z7tZvO9/2DnAQg/U+xG9tNzcjhn8IlIp4a7Z0=;
 b=AxcV12VM15Eu6AR+Nj8CXLrejC8l6nJzMObq5DXn/0hFT8puNcYXN3wMNS9nRHVLrA
 BGuFBZ+BM8lRjBib53/P0gisxgSUOtu7GwHz55RnYRMEtQYhnZVQxoOmDB70O65mX0RP
 mepiOti+56lixrsSwuXi2hu9QA2imn7csrVyptKezBYkfgrgyiifNCIxS7M/Nbq+jeLC
 /qrEDVDT66nIZeD+hAyk3C2YTtFNmosx7YoyK6g7j4IDMl/7ghYJFCttdDKA3uEdXm6t
 We9t2gQEfRAFCm+Npo7ifsbQkwFMBB4pPtmNppX3Y4Kw7j+gj+rHaXhIXkwteZ8a3MnK
 weUQ==
X-Forwarded-Encrypted: i=1;
 AKwUvBySpaaNEiMJYdHWlTuJPjs31BUwEv/XM2I5liT59QJKwHB/V+3YsSQp62iz7Bp3jlISINU/4heSqg==@nongnu.org
X-Gm-Message-State: AFuF++nxBcPra1v4K/qqFUGhKWOI3hC8K+ItlpWU2Q0NqdNvd6PpeJlI
 xk1GiBtqEScEc87oX6rlXIgJiNsg2FtdcjYPvTn3aKrmtQKtePeW+FGh3nSPbD1hKinbcpmqw6Y
 YbbkBMZrme0tfiPHjPgXEGOGzVCcgFkx5uPXJdOjAKA==
X-Gm-Gg: AYBFou3Bf4j1AbOQxACVOFuk3oLuZQDUECPwK00yPVYoNODJyMPTqAoWp6YtW+s5AGW
 YG9H1DN8BY+DHBz35naog6PLvCnS0/Ljjk7/7KTjLC1/4jQW86o46cddwyv/pmWjP+5tvdpMLku
 9HBqQ5tbJtYdlB78VMH+kMnCMmjqJdCyZo3p5YqvaTsWRKK1/YUhc8BvF+Hboe0T7PTrQn7cfi3
 eBocphsG81uJnVoj3S8RryWMGbAR5Oiy6VOIOfvJ075uZunr0q3g76u4EIpfq5oHVIkTkEtNpAl
 Kma6oxUyHnx7zyvJDs1HsPe4nbqZQUHKXBb8+LF/0zd6erf1kkEjT4u/qBYvtJ34fbHP2w9ydEm
 o7+VLm/hxrfIUxokHYYqj1ymxq8II7stzpcf1pzw=
X-Received: by 2002:a05:690c:e64d:b0:8a1:2b39:c0a0 with SMTP id
 00721157ae682-8b05af853a3mr13702097b3.12.1791377542837; Wed, 07 Oct 2026
 05:52:22 -0700 (PDT)
MIME-Version: 1.0
References: <20260923214453.45335-1-manuele.conti@archimede-energia.com>
 <20260923214453.45335-2-manuele.conti@archimede-energia.com>
 <CAFEAcA99CSS6RQosZTOuaqeFZ7M0AX_LBduCF0HcHJZLjjfP1A@mail.gmail.com>
 <C2534A00-FFEB-4311-BF33-DF3BC8F2DCF9@archimede-energia.com>
In-Reply-To: <C2534A00-FFEB-4311-BF33-DF3BC8F2DCF9@archimede-energia.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Wed, 7 Oct 2026 13:52:10 +0100
X-Gm-Features: AclHuK_QGVvbUXJ2F9WI0-OAFLiecf1LVZU5iiqT0SSJ1sy594uMsj0VCAw4u-w
Message-ID: <CAFEAcA93+6qBjEzZZxkDpfou6zVvYb+675WdWR2uNwTQ-mDeOw@mail.gmail.com>
Subject: Re: [PATCH 1/2] hw/timer/stm32f2xx_timer: fix periodic mode, CNT wrap
 and CEN handling
To: Manuele Conti <manuele.conti@archimede-energia.com>
Cc: "qemu-devel@nongnu.org" <qemu-devel@nongnu.org>,
 Alistair Francis <alistair@alistair23.me>, 
 "qemu-arm@nongnu.org" <qemu-arm@nongnu.org>, Fabiano Rosas <farosas@suse.de>, 
 Laurent Vivier <lvivier@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>
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

On Tue, 6 Oct 2026 at 21:20, Manuele Conti
<manuele.conti@archimede-energia.com> wrote:
>
> Hi Peter,
>
> thanks for the review. I have addressed all three comments:
>
> - hit_time is now local to stm32f2xx_timer_set_alarm();
> - CNT is preserved and returned verbatim while the timer is stopped, including when it is greater than ARR;
> - both VMState version fields are now 2, and stopped_cnt is serialized directly.
>
> I have also added a qtest for the stopped CNT case (ARR = 100, CNT = 200), and all five timer subtests pass.
>
> The updated [PATCH v2 1/2] is attached.

Can you send the v2 patches as a complete fresh set of patch
emails, please? The automated tooling does not handle patches
which are sent as attachments, or replies to existing threads,
or where only a subset of the complete patchseries is resent.

thanks
-- PMM

