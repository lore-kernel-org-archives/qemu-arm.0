Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98973C83F1A
	for <qemu-arm@archiver.kernel.org>; Fri, 11 Jul 2025 11:57:08 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1uaCMw-0002cj-Jp; Fri, 11 Jul 2025 07:56:46 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uaCI7-0000uE-IF
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 07:51:49 -0400
Received: from mail-yb1-xb31.google.com ([2607:f8b0:4864:20::b31])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <peter.maydell@linaro.org>)
 id 1uaCI0-0005wJ-CO
 for qemu-arm@nongnu.org; Fri, 11 Jul 2025 07:51:47 -0400
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-e8187601f85so1770262276.2
 for <qemu-arm@nongnu.org>; Fri, 11 Jul 2025 04:51:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1752234695; x=1752839495; darn=nongnu.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=PkPXSjTK0rVjwGCTVZSTkbB1nNouLjZ8dAkLqd3fm+w=;
 b=tAnWTLhQdRDWeF53r7YhAR+V7YvZBiLeCR5+Xu+PmOSFLKiZNtPgVTRrHe15Faxm1n
 5xXdmr0A0vVQ57FLU/FTn07Iwhw1zJvV4SRrjMWMrSX4pnnuKKmHaXGn9B8nP4abhGzx
 UNJHuOSgGnFQjnqyj56b3v4q25w3Bp9WBjWPZcO7br8rYQd5Hui6seQ5pSNfqPHxSz8v
 yE5TKJ4jIh/egEs3gCLLcJg8swA4LWRtkHg9Z14s9hC/oAba2RA/PW5zZF1+fV017gkz
 zcbIUHO08TnMocx6HmXet8mfFyCssq4g2ZaOXXh//Pel3QN6FLDXQeneshejd+dGBWUc
 yGmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752234695; x=1752839495;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PkPXSjTK0rVjwGCTVZSTkbB1nNouLjZ8dAkLqd3fm+w=;
 b=Whrt7nA6m8wqe5n/OmeRhn3bh5o5sWX2Px+YsdNAumcIihV+fO3J21wuz1HpGbTMMf
 V9pR/cGDUzSVXCqdjD37TssC/n7PyqEhUtog251MdthTB6z/lDMy8rtmzFvi1bw4o5mn
 jh34D3kWHvP38Ke1MtuCA90TYxYacC5kklTQPW3WhQ9B9HfIvcxUNPoTO6Qny0m8KfwY
 tkLIeVWu+P1DInHMdioAlzRGtUOyFYD6lGJSv9W5NdPs+NdY5D5boMfXWI3fVg4cCQa2
 T75BoSuvnYaHjSFa3BYP2g5HG0GDVf4UYk51eLK5DspM+wq6sNw2R8v5OZqu/iGbfrQ1
 WYwQ==
X-Gm-Message-State: AOJu0YySmT6p41ofx3MK1cJHThmLe+DhBPHBdRjbibFLJCdB2JFpa4lE
 h3L3eSBkNKHa59LXt3nf/9D42Efjd+Tx3/n+vMqge7cTxfZLv6xa6wCH/QhWmnKeC98kRx3WP9U
 ngSjWN0QjkNMWBNBKCyzki8LG1kvhWCA8liIUOViAbw==
X-Gm-Gg: ASbGncv8spGeQ+H08PDP87rzUCgqFSctUplWICj4CO/tL23piHip00tO8DdBYJiSp6A
 PYEBJEjghFpXcHectRXBNd/jtaaLdRbavJygIkcvhzvqPBB9J0XSOlVCjyPxf3yvBsB/BiuvdNw
 aGccKqQ2CoXcCZou7b5HYqfw9ZGwHim7KpGNH/cYwqAxyAC3I4yx6GbuppHVYKpZNVEgCVDCxWm
 SmnkLY+
X-Google-Smtp-Source: AGHT+IFoiwOnUpLyR+KN+iyEROq/oXo7XB4Y00qbcU1sD3OMVYrcLEXsQcYofxIiO1h8pBqKO7hvps/4m9x1tzw+ZDE=
X-Received: by 2002:a05:690c:9c08:b0:70e:404:85e5 with SMTP id
 00721157ae682-717d5d7e0b7mr57539127b3.11.1752234694718; Fri, 11 Jul 2025
 04:51:34 -0700 (PDT)
MIME-Version: 1.0
References: <20250710210941.1098088-1-gustavo.romero@linaro.org>
In-Reply-To: <20250710210941.1098088-1-gustavo.romero@linaro.org>
From: Peter Maydell <peter.maydell@linaro.org>
Date: Fri, 11 Jul 2025 12:51:23 +0100
X-Gm-Features: Ac12FXzA-cj63yHBZqlwutH3ipC8Ek2IE6TweFaRQ0DJASyVHRhZ3vO65k0MruU
Message-ID: <CAFEAcA-W4wHLxPw7QDauQitBPV+JryBb3A2uvKS6UrDgwL8ssQ@mail.gmail.com>
Subject: Re: [PATCH-for-10.1 v6 0/6] target/arm: Add FEAT_MEC to max cpu
To: Gustavo Romero <gustavo.romero@linaro.org>
Cc: qemu-arm@nongnu.org, richard.henderson@linaro.org, alex.bennee@linaro.org, 
 qemu-devel@nongnu.org
Content-Type: text/plain; charset="UTF-8"
Received-SPF: pass client-ip=2607:f8b0:4864:20::b31;
 envelope-from=peter.maydell@linaro.org; helo=mail-yb1-xb31.google.com
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
Errors-To: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org
Sender: qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org

On Thu, 10 Jul 2025 at 22:11, Gustavo Romero <gustavo.romero@linaro.org> wrote:
>
> Since v4:
>
> - Moved MECID_WIDTH from cpu.h to internal.h
> - Fixed stray ';'s in access and write functions
> - Use of GET_IDREG/FIELD_DP64/SET_IDREG for setting feature in ID regs
> - Sorted correctly isar_feature_aa64_* AA64MMFR3 tests
> - Simplified/unified accessfn for cache instructions
> - Fixed how cache instruction-related registers are registered in the cpu
>
> Since v5:
> - Fixed missing checks for ARM_FEATURE_EL3 in sctlr2_el2_access and
>   tcr2_el2_access functions
>
> v1: https://mail.gnu.org/archive/html/qemu-devel/2025-06/msg04598.html
> v2: https://mail.gnu.org/archive/html/qemu-devel/2025-07/msg01799.html
> v3: https://mail.gnu.org/archive/html/qemu-devel/2025-07/msg02338.html
> v4: https://mail.gnu.org/archive/html/qemu-devel/2025-07/msg02488.html
> v5: https://mail.gnu.org/archive/html/qemu-devel/2025-07/msg02689.html
>
> This series adds support for all FEAT_MEC registers and cache instructions to
> the Arm64 max CPU.

This fails "make check":

 16/247 qemu:qtest+qtest-aarch64 / qtest-aarch64/test-hmp
     ERROR           40.82s   killed by signal 6 SIGABRT
 18/247 qemu:qtest+qtest-aarch64 / qtest-aarch64/qom-test
     ERROR          181.28s   killed by signal 6 SIGABRT

This is because running sbsa-ref hits an assert:

$ ./build/x86/qemu-system-aarch64 -M sbsa-ref
**
ERROR:../../target/arm/helper.c:4588:define_arm_vh_e2h_redirects_aliases:
assertion failed: (src_reg != NULL)
Bail out! ERROR:../../target/arm/helper.c:4588:define_arm_vh_e2h_redirects_aliases:
assertion failed: (src_reg != NULL)
Aborted (core dumped)

which is because your entry in the E2HAlias list in
define_arm_vh_e2h_redirects_aliases() is missing an
isar_feature_* gate. Without that, the function will
try to define the alias register even when the CPU
doesn't have FEAT_SCTLR2, and asserts because it can't
find the register it's supposed to be aliasing.

I think also that arm_emulate_firmware_reset() should
be setting the new SCR_EL3 bits when the relevant
features are present. Otherwise when we direct boot
a Linux guest at EL1 or EL2 on a config where the CPU
has EL3 it will take an exception when it tries to access
the registers.

You'll also find the series needs rebasing as I've got
RTH's "move code out to cpregs-at.c and cpregs-pmu.c"
patches in target-arm.next.

thanks
-- PMM

