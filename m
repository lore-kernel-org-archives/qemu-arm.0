Received: by 2002:a17:504:6810:b0:1be9:327d:8ee3 with SMTP id f16csp1610395njm;
        Thu, 6 Mar 2025 08:43:02 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCUvuVJyerrXLgQnrZwNXKN7AXilfdI2cPRrzo8FLRGDp3BmTCjBm2f6oE3qkbEWQBSlB8azIGoA81Kssw==@linaro.org
X-Google-Smtp-Source: AGHT+IEgxBqBfLxVsnJ/ByQtX0e/KdY7XB/ow/YUMPhM00VzyPQhDHl5PMRKRYWoPo2K89+v7FEY
X-Received: by 2002:a05:620a:2606:b0:7c3:d63d:7bd0 with SMTP id af79cd13be357-7c3d8ef2cc6mr1191669485a.46.1741279382208;
        Thu, 06 Mar 2025 08:43:02 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1741279382; cv=none;
        d=google.com; s=arc-20240605;
        b=L/XNPDCp6Vna2nAyTrGdJXL0AuRsz7Tg3QVjMmGBrO+8EYHKwUmkFi/kfSaLjWi7Yz
         vcXMxJ2HnAOF0OIuxOtqaGoXuTQ7z+Br83XIB3YePi1N7UnDV67O/oiGd+DeQHouQW6v
         VwHQSFrldjg7kx6VShEb2ttMAhETK35hvLJ5IDZmHE5JxP0GI3RULInSMNF0aJ3Prupo
         e1f/nZz3gQBSHMuo8BRsu5T5wAJO51ephYMlFNLQhx5nWmJvGC+BKt70quqBrJGJjZQM
         RpAzJP+VRhkL/pb7AfSBf6t829zmQpdNU/6spIXCz4U7q7FeySWWaiitcFN2023EfyQq
         Ojgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tuE7sAT+n3xPBCauhqafEUU/Z7tC+IuzsmyDxqxYy8g=;
        fh=oLQfvCrdehukhkIj+Fy5TwLGoSpxJawtNyjCosK7/4M=;
        b=e8bsnaUwvzu0y+E1j5eb/XUwWscpygkGeeQ+fqXOHrpnHg7dBJrIxVtUWnQ/ALXwI9
         HrouJctE8VZimXuEuGNLgIybPIIyCQOTc4ascAM2rIj+VlKQx5358iM2WYP0FaLe8dmE
         l1Vqvv7CAJkWNHtIxl22KHiFpWJa72FovOXrd9B9HWQghifonRg+i/UVOjSyDDHdlN+7
         /4pQcJ8i90i5AYRjQRsH+z2t9VvywlT9nkxR6wr6o/LELGA58fN8+0yvvVREQIuuKTxK
         NU7/0HmBiQ2lhUcRKb7WtRB+tGu/9Ure9p0IB7c/3pcSiWLhCIDkl8wA2hq/9Dmpskvi
         azww==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tyHbUL4r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7c3e54fce5fsi151261285a.254.2025.03.06.08.43.02
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 06 Mar 2025 08:43:02 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=tyHbUL4r;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tqEID-00011K-KK; Thu, 06 Mar 2025 11:41:54 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tqEHw-0000iR-Ks
 for qemu-arm@nongnu.org; Thu, 06 Mar 2025 11:41:38 -0500
Received: from mail-yw1-x1136.google.com ([2607:f8b0:4864:20::1136])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1tqEHu-0005PW-Vm
 for qemu-arm@nongnu.org; Thu, 06 Mar 2025 11:41:36 -0500
Received: by mail-yw1-x1136.google.com with SMTP id
 00721157ae682-6feb0742878so8457927b3.2
 for <qemu-arm@nongnu.org>; Thu, 06 Mar 2025 08:41:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741279293; x=1741884093; darn=nongnu.org;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :from:to:cc:subject:date:message-id:reply-to;
 bh=tuE7sAT+n3xPBCauhqafEUU/Z7tC+IuzsmyDxqxYy8g=;
 b=tyHbUL4rlx98W5EgQ0sj5oW3mGJJLm0fA4QmbIOcBm9XQ1i3ldISatUGC4+LO1dfsp
 98veupZrN5t+B9/z3q/mU4z69sVYLyXxR1Fhd1l7yhqWX/vudFgZSNKsFw/WjlKkIJqz
 ulWhskTiCHjCBwqn264BdZFXAS51B6GCPjYvgRAC19EmA8pHGuRzivmwwET7QVgg660l
 tbGLwqy8g4y6cDiJaJcciQ0iqj5uQZTmP+T/09hl3626UYA657WePHxcxfb3WiHobyxq
 asX2kUeulBXZk5Cuq/vFJ81HDWX/yNoFyP168LNfCzUterfuqxC7e1W+Dmqg4qqK1gt7
 YTtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741279293; x=1741884093;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tuE7sAT+n3xPBCauhqafEUU/Z7tC+IuzsmyDxqxYy8g=;
 b=s9EzQ8MOPEpd+WZqxOT+NdaBQ6ApnXu6XdLnujotmP5fFO8xNNZ3zYDxb4aCcQsu90
 OZuGLl21e4CwDflRXuSE5NcKQuBq6wp86HdosXhfo7JQY05yK/IBez0vAQZKkCK1Fr7/
 Yi3UlugLV9yv1IH98xHgoFA79j0gnK9TSsVSnQq6EOGdVZ2niAGi2iZFzxDcxwDSw5AX
 UXh8YqGbOkc7FttDeCSsGl+4NEkoxFRWjLmZ147sjixMcAgNqxd/idIojk3Eq7DTfELS
 agCxunYpZcUgjFBE+69LKzQEoCDefqSZoVeE2PelYu8HiEqCmBZdXb+3gsvdqsgYXmLH
 WYJA==
X-Gm-Message-State: AOJu0YxwSkEYBcDbMsmZG2a1ppGdGqlY4o/qEP6zbL323fKQbrevvqgU
 9qbyinVhC44+UMfa8SLpF+2kjQJtanS6FzTag+85FaYyS4U96PjuNHAUhqNtqUX5kBFVETAoIax
 xPSoqPQ9pBmSuICjPdrUOyLF7HqoNUzrV4mdtAhxc1FtpuNjU
X-Gm-Gg: ASbGnctgkbVYwayD/CGMfLW6xqMRLFV9VCrb6AAS6ZpKWhKtf6hRegRbTHuZIdDrglF
 vtCD0wDOOsUe4A2zHBkL/4gAxG7NETFUAnN7Lhl6MFvhX3RuLtQSDCuu0dBIWQkW09rKhp91u3p
 d5XgTo34GJqlZnp0F/ja9URfAv5sM=
X-Received: by 2002:a05:690c:6009:b0:6f9:48c6:6a17 with SMTP id
 00721157ae682-6fda3018933mr98932527b3.26.1741279293570; Thu, 06 Mar 2025
 08:41:33 -0800 (PST)
MIME-Version: 1.0
References: <20250306163925.2940297-1-peter.maydell@linaro.org>
In-Reply-To: <20250306163925.2940297-1-peter.maydell@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Thu, 6 Mar 2025 16:41:22 +0000
X-Gm-Features: AQ5f1JoDreMEI4B7qV2l_bTBhgXgesld--17niqj2WiZlEgRMn5BhszwrB0rMwg
Message-ID: <CAFEAcA8g0D_TyRyBGjjC=RaPjp-aNQb-P5K7bUcvDACDpWFFyA@mail.gmail.com>
Subject: [PATCH 00/10] target/arm: Forbid exception returns to unimplemented
 AArch32 ELs
To: qemu-arm <qemu-arm@nongnu.org>, QEMU Developers <qemu-devel@nongnu.org>
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::1136;
 envelope-from=peter.maydell@linaro.org; helo=mail-yw1-x1136.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: zTmV9lNUgmO7

Apologies for the bogus subject line in the cover letter:
I accidentally put a leading ' ' into the file and then
git send-email interpreted that From line as the subject.
Intended subject line was:
[PATCH 00/10] target/arm: Forbid exception returns to unimplemented AArch32 ELs

-- PMM

On Thu, 6 Mar 2025 at 16:39, Peter Maydell <peter.maydell@linaro.org> wrote:
>
> Newer Arm CPUs need not implement AArch32 at all exception levels
> (and Armv9 forbids implementing AArch32 at any EL except EL0).
> All our current CPU models implement both AArch32 and AArch64
> at every exception levels, so we currently get away with failing
> to enforce that the guest isn't trying to do an exception return
> to AArch32 when the target EL doesn't support AArch32.
>
> This patchset adds the missing checks:
>  * SCR_EL3.RW has an effective value of 1 if EL2 is AArch64-only
>  * HCR_EL2.RW is RAO/WI if EL1 is AArch64-only
>  * return to AArch32 when no EL supports AArch32 is an illegal
>    exception return
>
> To do this it needs to start off with some cleanup. This is
> because we need to add a cpu_isar_feature() check to
> arm_el_is_aa64(), but we don't want to include cpu-features.h
> in cpu.h. arm_el_is_aa64() is really an internal part of the
> CPU implementation, so we can move it to internals.h; this
> means also moving some other functions in cpu.h that are
> defined as inline functions and which call arm_el_is_aa64().
> Removing some unused macros from linux-user allows us to
> avoid having linux-user include internals.h.
>
> (No doubt there are other functions that could be moved out
> of cpu.h, but I stuck to only the ones that I actually needed
> to move.)
>
> thanks
> -- PMM
>
> Peter Maydell (10):
>   target/arm: Move A32_BANKED_REG_{GET,SET} macros to cpregs.h
>   target/arm: Un-inline access_secure_reg()
>   linux-user/aarch64: Remove unused get/put_user macros
>   linux-user/arm: Remove unused get_put_user macros
>   target/arm: Move arm_cpu_data_is_big_endian() etc to internals.h
>   target/arm: Move arm_current_el() and arm_el_is_aa64() to internals.h
>   target/arm: SCR_EL3.RW should be treated as 1 if EL2 doesn't support
>     AArch32
>   target/arm: HCR_EL2.RW should be RAO/WI if EL1 doesn't support AArch32
>   target/arm: Add cpu local variable to exception_return helper
>   target/arm: Forbid return to AArch32 when CPU is AArch64-only
>
>  target/arm/cpregs.h           |  28 +++++++
>  target/arm/cpu.h              | 153 +---------------------------------
>  target/arm/internals.h        | 133 +++++++++++++++++++++++++++++
>  hw/intc/arm_gicv3_cpuif.c     |   1 +
>  linux-user/aarch64/cpu_loop.c |  48 -----------
>  linux-user/arm/cpu_loop.c     |  43 +---------
>  target/arm/arch_dump.c        |   1 +
>  target/arm/helper.c           |  16 +++-
>  target/arm/tcg/helper-a64.c   |  12 ++-
>  target/arm/tcg/hflags.c       |   9 ++
>  10 files changed, 202 insertions(+), 242 deletions(-)
