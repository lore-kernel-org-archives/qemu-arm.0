Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB461C5CFC1
	for <qemu-arm@archiver.kernel.org>; Tue, 11 Aug 2026 10:36:54 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1wtjqX-0003bv-Rp; Tue, 11 Aug 2026 06:36:37 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtjqV-0003Wq-GR
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 06:36:35 -0400
Received: from mail-yw1-x1131.google.com ([2607:f8b0:4864:20::1131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1wtjqU-0006Yk-0J
 for qemu-arm@nongnu.org; Tue, 11 Aug 2026 06:36:35 -0400
Received: by mail-yw1-x1131.google.com with SMTP id
 00721157ae682-81f36179dd5so38058197b3.2
 for <qemu-arm@nongnu.org>; Tue, 11 Aug 2026 03:36:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786444593; cv=none;
 d=google.com; s=arc-20260327;
 b=fiLjLgfqSMc9cf5VVsq5GpRL8YbxTCYmF1lPNUak7ZF2gpy7Gnz/gLKakU7j5XhggM
 /VNyaaHOmnCr5TpRe+JqDzMxh4x6QfOXo8IkGnw7ry4hOP/+Hw4GI5EWvT51SeTZ8CDf
 Y7ciUgNz7XFIW3DWjG63PlvjJ3cvn5XOudq/GjW5RqwS1jSozdXF54U43akwP0ndjqo5
 5gF0YaKh7R1fxH1gkmfTwV4Noumx0Jktd/OHDWtnJBjxp4+vLfVM8GPm1uwUt/rwyhZE
 eeVX4kBqmZ+3grwXh/Mr5P0Z97orD2IiRwayWthZAZcXHi0tqRh9DYfskuj4r7xC0xdB
 u/9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20260327; 
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:dkim-signature;
 bh=Gm0XULbSxQTlWawHD7XwU7KoRE003Cuaudv2NO9XgsI=;
 fh=GhyKVBZnPeyDD6oK8T/h5p1y+zgAC3jdmH4ypwY5PM4=;
 b=MVlTa9V0e9vTUa6F5C3/haTPlxptlKrRAtNEf72dRmsGBZVGr5ctvnyDRtKx/HFLcV
 iLyiOZGyferTt+4wK9qTghk+xWbZ48Vjr5PgKUKcD60a1UH48lqUzd3N72Xjb2yWC+sJ
 S3rw7aWqv1IcfemegS6it8BsjWn52vSNnSx+y3F92U8QPklqe9YoSUBXI/hl/1VWU/v7
 +Y99MDiQI0dwyV8JYv9knxAOxfNfcBk7ktYVMCSxIdG7vV+ButX0hPGTTN4+v3ymS4f8
 mdHRNton/OBgyGaTCWQVzWMt4k/r+NtvjEQ+dXFK2Vaoa/VQK1k9vTKX/NQtFkkzeMJS
 FTvg==; darn=nongnu.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1786444593; x=1787049393; darn=nongnu.org;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:from:to:cc:subject:date:message-id:reply-to
 :content-type; bh=Gm0XULbSxQTlWawHD7XwU7KoRE003Cuaudv2NO9XgsI=;
 b=byN+K+nr0hdJVroGxpJYPgWGFxS965FGUtkt+czWmgIWvEUHjQYTGTN7Wg3lN8ICJ/
 jzi3uY8QEq2crHR2RwiYCh+FFzduaw7J3qDrf2PjzvCVlV49hHfuTVjz+v/SPi5v5cpk
 v9q8ofJCV2CwSjjIthTdv1jQp/pIyU/q2AyTQQjnbdO1aKajnhDM97P0sm/Tk5vkehQP
 hvpGaEvbsNzTqFf5eo+u4WLtVGm3MqE4T+djp0UZJVZDUktlpNeeivrQbW0nFlgr1HBJ
 GJivMhHLgauinHJoqmRGTra5cq+0yB5b0jZeisvcYQF2Ld+0kmbzPcge7cjGg4aiHGdM
 wjpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1786444593; x=1787049393;
 h=content-type:cc:to:subject:message-id:date:from:in-reply-to
 :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to:content-type;
 bh=Gm0XULbSxQTlWawHD7XwU7KoRE003Cuaudv2NO9XgsI=;
 b=oe76L3gpJajhAHwVLxjPZjAj/lzfpdWhTa9c7DPAAk9pxaBflIeTNwT3tD0ryrkDFB
 3i5P8nB/E7F1duA1ODxCUdjXrvevSgZ84GxL7TEj81SDtQAhV18N6VBJKKu5wYLoT8/C
 qITC6wk9MSCNWrPxln9uDqPP810TMWU5jw/uMZoyEz/PqxbqpNya8/4XpdRJb0afqs8b
 LpQ9CuXRO/Yvf1CHBhAGhVCmNYWwiQg349CKii/Fa2+o9GcFEqsMs0s+Vl26OPLbb5PA
 3yLnqKQuz6snKDY9PmeWzY30Mb7QnzenvlowlZV0YEsersSyKNxtsXWExYx+YiA7yvZo
 GUIw==
X-Forwarded-Encrypted: i=1;
 AHgh+RrC38Vyp8E0sABfEdHxgNf/x0XYLSpw0ALYfDaaT3SzHpJ9o56rbd2KKNccs5PR5D4+Lqt6v70sgQ==@nongnu.org
X-Gm-Message-State: AOJu0YwXJ5OHuEEqxa8TPRUScdOQFpHe2L67s00p8QdeTaQ87ylysMpv
 f/Pz3/PlhPKi7D0Atn3x5gDdezbHtXnHp52L31nuSrWAazgvYnnyzQ0n4R+kT5mIjdJzcrS8Poy
 7tXOc4+mL1lO3P0epVdnQE/md8sBnlUmxYSeuxFdPRQ==
X-Gm-Gg: AR+sD11fEOx3s1FmdJGGecE51/WgslWlc/yh5lPiY2U7H83ctRnhlAqDnJPGoNG0/wg
 nBwPITLSf9/LQbkuZimjhhaAeB51hTW7tZZgix4XYBAcT1NfiVz2ft0WL409ksKG6pcQK92PiYy
 7gAscs21eMVGETVhwxxvvsRdcH+RUmUgvNhGZbX4jA/+qXOP4g3Fg6NXiATvUw1KuxyfXIUThJ4
 2AcCHGarZKh8PyPZYghvi9VcSRDotkU1yt0hHcm8A/U4Pup8vsj3OzHUid5hwOkt+StgpvyWCoi
 iGdRfJdNbLUMdAdxId1b2P8RB+wIqwMJghZsph2lOFbU1kP/gZfaYodurStUNcM15yuN4as8+dK
 ypP3EAJKjqM1JXPyqzth2JsbernWD
X-Received: by 2002:a05:690c:3692:b0:814:585f:73c8 with SMTP id
 00721157ae682-82f20de3471mr16100137b3.0.1786444592678; Tue, 11 Aug 2026
 03:36:32 -0700 (PDT)
MIME-Version: 1.0
References: <20260804144611.31735-1-huang.botsz@gmail.com>
In-Reply-To: <20260804144611.31735-1-huang.botsz@gmail.com>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Tue, 11 Aug 2026 11:36:21 +0100
X-Gm-Features: AUfX_mwsoVjRpZBKE9oGqAf9A2BOIEBhCFVSjW3BDXJOKIdmJfEtFjQzUiPv9_c
Message-ID: <CAFEAcA_Kmqp60+Edu1kKCH8=GbK6RH4ebgTaUjBPB_L=QZtPFg@mail.gmail.com>
Subject: Re: [PATCH] hw/i2c/bcm2835_i2c: Correct iomem size
To: botszhuang <huang.botsz@gmail.com>
Cc: qemu-devel@nongnu.org, philmd@mailo.com, qemu-arm@nongnu.org, 
 sef1548@gmail.com
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

On Tue, 4 Aug 2026 at 15:46, botszhuang <huang.botsz@gmail.com> wrote:
>
> The last valid register is the Clock Stretch Timeout (CLKT) at
> offset 0x1c. Since it is a 32-bit register, the total memory
> region size should be 0x1c + 4 = 0x20.
>
> Update the size parameter in memory_region_init_io() from 0x24
> to 0x20 to accurately reflect the hardware specification.
>
> Signed-off-by: botszhuang <huang.botsz@gmail.com>



Applied to target-arm.next ready for when we reopen development
for 11.2; thanks.

-- PMM

