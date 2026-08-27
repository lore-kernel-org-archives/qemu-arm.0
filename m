Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47EBAC61DC4
	for <qemu-arm@archiver.kernel.org>; Thu, 27 Aug 2026 14:03:00 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wzagc-0000GI-DR; Thu, 27 Aug 2026 10:02:34 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzagR-0000Em-Uv
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 10:02:26 -0400
Received: from mail-ej1-x62f.google.com ([2a00:1450:4864:20::62f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wzagE-0003Fe-9v
 for qemu-arm@nongnu.org; Thu, 27 Aug 2026 10:02:11 -0400
Received: by mail-ej1-x62f.google.com with SMTP id
 a640c23a62f3a-c25344a8c6cso171508966b.0
 for <qemu-arm@nongnu.org>; Thu, 27 Aug 2026 07:02:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787839328; cv=none;
 d=google.com; s=arc-20260327;
 b=R21tUR4/a9E/SEjzgU3UbMf6ZuFHZMM3mDAj1qq/0kjuLAJ0edngmewswqz+7+9oCi
 anYL+fuAwrS4Kechr3SOZE1E2a0kRVdpxDs5isRIc5jLX2bVD5Egy/1Fe48CvXfYk6X0
 9tDLBPBGa61H5Gy/ZV9/GYyuFjV8mo41/Ws5eJOBxtQljyuSDuGqvmacvgipeXkJi1MJ
 rQ/Chf2Uk8Z+egwEVpwtkQSv2c8C1y/lYuz/+t+JeO07tPnID5yzoFd33wIcjPCmtCZN
 MyQU0BA2Bdc3r/+59kYFH37kWfZNZ+/C0wYbqT2V0Wba1kTTWjersyANpAG/srAcqPqQ
 OwQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Iojp5tB3ksrfi9AJNVpd1yk7HAvIOlmcl4/gxxl4nWQ=;
 fh=tFtpvdEHF9nX1YkiGFS4mVsZ5S7vpTohGiJj1JAVroc=;
 b=FCCYb4Jueo6FP03GV1e7zlz00VI6mea7nxk5p/c3TgCY1XUOjYo2YytqPzPgqKHEue
 hqdvCcLYxZTuUlf6fZA8NlJ5XgBsrGzleNeXepUN892HvRdpJM0MXt1xrRVB47fCcR38
 W3ki82kwK/AxJr21oN2LPSyv8lLq/BftTlfF6sS06i+zFTbAiptUE4h3MC20rWqz93fm
 Nop3Pj25JswtplQySeLMhKvoRQMSI7kTZ86B8A0rVE3aqPT+c1YRhj7RkGD3X03umt/d
 W1qGlkT0jO8qWEt0b+FqU5UX+lrd5+9p5gjApCtx1WqNEpaz49LrRGJjzHigXt+pAEhF
 W/Bg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1787839328; x=1788444128; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Iojp5tB3ksrfi9AJNVpd1yk7HAvIOlmcl4/gxxl4nWQ=;
 b=CofGPgHhiTs45p9Qb709S7ciO1IIEZdgkuetPMDLSE8MtJJFjUHrTFI1dkrAuleaUG
 0HuDFHOXFSUvX/y7ZKLKqmA1rzl5XdZdOz1zJOfGYFfqH9rNzx+oVlTOAGACZ60vHJD6
 zRrWCV5bXxkljbaSb0k52s3TTZVcLXqD3Vf5d4vZxDiKiQ8IUfTz0xz4nIazEzHp1fvz
 HHbTPRrkuHdp2eXyVi1oAJ6MPXpsjvwEVm/xgPWndy2FPGLZXv9RWydMgs4+3bNtFAM3
 hcm2VBDiaBrp7WC+b2K8TwIFJIhya6d0JQgClhKI5tq2reDHDKvHrzJISXjROS05ePF3
 AkLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1787839328; x=1788444128;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Iojp5tB3ksrfi9AJNVpd1yk7HAvIOlmcl4/gxxl4nWQ=;
 b=RSGAnMYGBT//+UogJk1cDBhS53mYN7YD7RnGmC5ZKz3LU9LBqK199Y+ty6Wx+HgCEZ
 FDoxc2P2vPRWGaB10qsOA8VqtLf2IBy/0yXf+MNzJDVdREZlOSPFulnOv2H1kCCNBmb/
 JQYBuHJPtTPp6iiOLpgNaZS26GasOtYAf0K+nELTjXs3QH3OwDeIwAmlIWUIk7HkZneZ
 LwfWQZzp2RY18lpYOfdM76iAl5xIrIrt/519mNChNq/4utQRoPqu14jJdU24Rym7PrEk
 tEivXChWs4urlSazu9255aKTOUIeDONxSdcXnxwWZ9ShmxwQL4X8/KE9j+p4Cvrqtm/y
 fYeA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqT/iZKNyC6sm+KGv4hI2VxvTguzZOJ7ZVYx00ouo9JymnPcLJOAPXRScwQYYBpmw2hpddYneeQew==@nongnu.org
X-Gm-Message-State: AFuF++nDcusZ/GN/fGYXFSTMosFimwljnngzTePXM8S/n78Z3CgXOz5k
 n/vpKxMZvi3A04tULX594u2f0nBIuMZ7nZvrL9m2CQBGxXYYmLhuT76NvO+5GTgl5dnAHWYrTwd
 FCJwwKDSHzNKCa6xNYiSuh7/Z9+txdzXWbhMiqr0E4A==
X-Gm-Gg: AR+sD126XjHJPBG2JMblpI6A5tZAALinQhNvPIAxiAecwankXQuctfQkRx4+lqWRGxT
 RFgZWrqcEMTL5zUhs3VNSr3ujsXqoFgI7d4qzjm1rJF5qLczPrlFbkIBZ757jWJBSNlDDIjVNV/
 ytu3qUmmhHLcCpa2/ZZSg93b0fdzUIac0zyJzddDSfyCblB5N5wYNVs2rk35DNHleLsjmtK0nxW
 64RXOmBnf7ObwCAaerIqUuJa7TgTZeBYmHOFT9U4GHHT1oZY1F21SPoEX5bs7nPdqyNetZSiOZC
 4xBdK68iT4Bic/nhjq43t+8xDu5J5GIabE+sSXlGpg19iMLvI/R1Mr5gWB0cM8M/NUu9dUv+xbz
 f/iyju516J090QftlWtorKQKVV65H
X-Received: by 2002:a17:907:1b0a:b0:c20:f529:2d6a with SMTP id
 a640c23a62f3a-c250c37f351mr1689563366b.22.1787839328462; Thu, 27 Aug 2026
 07:02:08 -0700 (PDT)
MIME-Version: 1.0
References: <20260818002629.172827-1-simonxhy0404@gmail.com>
In-Reply-To: <20260818002629.172827-1-simonxhy0404@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 27 Aug 2026 15:01:54 +0100
X-Gm-Features: AcwNN1W-CC1I_aDkgeevT4OtefwJK3DkmygajhZdL3CnGXiWnCdBmnAKqnR4lv4
Message-ID: <CAFEAcA-bqCPVV2a_g-nav=GYj20DCOTU8pts4BRct8_qvqwbzA@mail.gmail.com>
Subject: Re: [PATCH v3 0/9] arm: add Cortex-M85, SSE-310, and mps3-an555
To: Simon Xu <simonxhy0404@gmail.com>
Cc: qemu-devel@nongnu.org, 
 Pierrick Bouvier <pierrick.bouvier@oss.qualcomm.com>, qemu-arm@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2a00:1450:4864:20::62f;
 envelope-from=peter.maydell@linaro.org; helo=mail-ej1-x62f.google.com
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

On Tue, 18 Aug 2026 at 01:26, Simon Xu <simonxhy0404@gmail.com> wrote:
>
> This patch series aims to add the Arm Cortex-M85 CPU, SSE-310 Subsystem,
> and mps3-an555 FPGA board.
>
> v2 -> v3
>     Removed ppuintstat variable in iotkit-sysctl
>     Moved add GPIOALT2 register patch before add mps3-an555 patch
>     Add gpioalt2 state field to new vmstate subsection for migration
>     Rebased onto master which includes bug fixes to existing models
>         in armsse.c and mps2-tz.c
>     Patches 1, 3, 8 still needs review
>
> Signed-off-by: Simon Xu <simonxhy0404@gmail.com>

As I discovered today that the Cortex-M85 has PACBTI as a
configurable feature in hardware, I'm happier about taking
this series before we have proper PACBTI emulation. We've also
decided in Linaro that we will add the PACBTI emulation, so
hopefully the gap before it appears will not be too large.

So I'm going to take this patchseries into target-arm.next.
I made a few minor tweaks (improved comment in patch 1,
fixing a few checkpatch.pl nits, documented missing PACBTI
in the mps2 board docs page).

Thanks for your work on this!

-- PMM

