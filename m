Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists1p.gnu.org (lists1p.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5F1FC43327
	for <qemu-arm@archiver.kernel.org>; Wed,  1 Jul 2026 03:08:07 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists1p.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1welHb-00005i-LE; Tue, 30 Jun 2026 23:06:39 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists1p.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welHZ-0008Vx-Eo
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 23:06:37 -0400
Received: from mail-pf1-x42c.google.com ([2607:f8b0:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <richard.henderson@linaro.org>)
 id 1welHW-0003pL-Mv
 for qemu-arm@nongnu.org; Tue, 30 Jun 2026 23:06:37 -0400
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-845eb7b96feso104453b3a.0
 for <qemu-arm@nongnu.org>; Tue, 30 Jun 2026 20:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1782875193; x=1783479993; darn=nongnu.org;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ls0T9EHio6ON4SVMOxDwfUlFQWjpZwELz7O6LMgd1Rg=;
 b=Qy7okZTjDCgzczLBIwg3kmnRnQOUuhcRZujoALx7GFwESArOKmEafPHzGnb5uTkvsJ
 MKad1lGi0PPo1lS+UvbUVkwngIO6ptGOB79JqhpDcEcc2CqpDVIIDm/JCc0YMDh2W3xK
 cHNrfOjruSVCX+NgQdgRMmTICQxpIRruO2dUtnQbNa82foQeZ+sDYObCjMSiyp8C1fWC
 AzvnGv4RNSOVdi51AY/RlAsZW9JJUPUnidb3YS+YdMYGahftpD7r3SKkxhmuIHWqmLxV
 osVk5+EmEaKk6cKdQmftXcHVsbAd0qFgRvVhpveQbShlELEYkymILmc7yYmt/XPkxGg9
 dyYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1782875193; x=1783479993;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ls0T9EHio6ON4SVMOxDwfUlFQWjpZwELz7O6LMgd1Rg=;
 b=stk6P8yhvNMwc1Q0gIwRJbFMeBofhe/ePuHg3YEXFfNd0r43E2KjaKKWfmEei0SdaO
 gWv8pULMDh10qXrSlaYOb+lJEfL/4ZRo0rTwz+DlL8Lj14Qptw25En1N9879pA82cKYN
 WlyrZOvSHtzn6KrNqBCSAgQuzaik3zUKqsh6w+500wQsBwT7Z80NpkmN+tZ+Wx7ae7QT
 oXfm2P96NOyBDeApzIVkzb1DcFJrR1akSqmoTRCMTR4WnFSbFdjHWhd+Z4Jjg2lhKzGw
 yWgP9fSyN4jcdBHrplgSWBMjrd7n55g1iCuLlsUVt4Vm6+R+mE+wQovcq4uxVZIuaX7o
 xuUA==
X-Forwarded-Encrypted: i=1;
 AHgh+RqmXILxr7I0iDUIyulZex8EBe1myBczgkyO43CX7yJKdYNeObyc89Qy+jDWnHVz2OQJ1iZkAocXuQ==@nongnu.org
X-Gm-Message-State: AOJu0Yzq1OCW+SefDBwKWmKjqxEUxV+kFxoBtyOlX/61CTfxMkZ+XTZP
 Hd9cL0HJOvDxrAXqoQvtDjl3qEGA9NZLY53yTxCGgFUFfUZwNDhQlsh7+zXbNw6gUTk=
X-Gm-Gg: AfdE7clwp1noQhEbGQJLJd4g+STdVMmRbEKp5VXZFAUvpCK68oFQ8x3y9EK/nKPojzh
 0JbU3n30kJY3ePBRSpoW8a8V0ZGZre3liRxwCZ8aqvVYgPXSlgyOQUsEE+MGtMim/4ur6lJEPG4
 IhGfmmsJPdrDc8Q1Gm4wbqPuVVGkEXjxCBGBw9d4V6uZzVh5HBsJL/cyoseou6dSYl/EYjQtdsz
 Gc8NoG/ukUpAamDUrCjEgXAK5sLbMjrfuGMlL8MHHO76+194Ynuo26VKZn+RJ06nd3VRlSR6TjC
 cAoM+3Q3sQE0LI//oBXR5RwVFcf0SrZCnbdqG79FCzxILfGEgeZlRJXsWNTJVeGJkmrIgWW8MhX
 jLl8RB2FocaK3ghgDd4NGQ32+WcEaN51ufPzx5ouiwJUky9Q/RKoaeNvfvFC2PpxI+yrnECWtnW
 aCCnzpl/uOG220KwTx0OSWLhC5N9/ez4Mj52a1JBzWjxRm5EpYMoaxsix9WA==
X-Received: by 2002:a05:6a00:4fc9:b0:846:4d4c:23f8 with SMTP id
 d2e1a72fcca58-847add62e06mr2948367b3a.1.1782875192944; 
 Tue, 30 Jun 2026 20:06:32 -0700 (PDT)
Received: from [192.168.0.4] (174-21-129-215.tukw.qwest.net. [174.21.129.215])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-847a0329c22sm3076883b3a.40.2026.06.30.20.06.32
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 30 Jun 2026 20:06:32 -0700 (PDT)
Message-ID: <00f3bf40-b9da-462f-aac4-b956163193a5@linaro.org>
Date: Tue, 30 Jun 2026 20:06:30 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/17] accel/tcg: Use IntervalTree for breakpoints and
 watchpoints
From: Richard Henderson <richard.henderson@linaro.org>
To: qemu-devel@nongnu.org
Cc: shivangu@linux.ibm.com, qemu-arm@nongnu.org, qemu-riscv@nongnu.org
References: <20260701030443.1382447-1-richard.henderson@linaro.org>
Content-Language: en-US
In-Reply-To: <20260701030443.1382447-1-richard.henderson@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Received-SPF: pass client-ip=2607:f8b0:4864:20::42c;
 envelope-from=richard.henderson@linaro.org; helo=mail-pf1-x42c.google.com
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

On 6/30/26 20:04, Richard Henderson wrote:
> Follow-up to 20260630171555.114844-1-shivangu@linux.ibm.com
> ("[RFC PATCH 0/2] change cpu->breakpoints to a GTree")
> 
> Beyond using interval-tree for breakpoints:
> 
>    - Pass the matching breakpoint to the target debug hook,
>    - Allow the target to record an id/index for each BP or WP
>      so that the target doesn't have to search for which item
>      triggered, so that the target doesn't have to search again.
>    - Convert both BP and WP to IntervalTree.
> 
> 
> r~

Bah.  I was mid-rebase for this, and it's missing the CPUWatchpoint work.
I'll send a v2 tommorrow.


r~

> 
> 
> Richard Henderson (17):
>    accel/tcg: Pass CPUBreakpoint to debug_check_breakpoint
>    accel/tcg: Constify CPUWatchpoint for debug_check_watchpoint
>    cpu: Move cpu_breakpoint_test out of line
>    exec/breakpoint: Move BP declarations from hw/core/cpu.h
>    qemu/typedefs: Declare CPUBreakpoint and CPUWatchpoint globally
>    *: Add missing include of exec/breakpoint.h
>    hw/core/cpu: Remove exec/breakpoint.h include
>    exec/breakpoint: Introduce BP_CPU_ID_SHIFT
>    target/arm: Split is_wp out of bp_wp_matches
>    target/arm: Set ID for watchpoints and breakpoints
>    target/arm: Use bp argument in arm_debug_check_breakpoint
>    target/arm: Use wp argument in arm_debug_check_watchpoint
>    target/riscv: Set ID for watchpoints and breakpoints
>    target/riscv: Use bp argument in riscv_cpu_debug_check_breakpoint
>    target/riscv: Use bp argument in riscv_cpu_debug_check_watchpoint
>    target/xtensa: Use BP_CPU_ID_SHIFT
>    cpu: Use interval-tree for CPUBreakpoint
> 
>   include/accel/tcg/cpu-ops.h         |   4 +-
>   include/exec/breakpoint.h           |  39 ++++++++--
>   include/hw/core/cpu.h               |  39 +---------
>   include/qemu/typedefs.h             |   2 +
>   target/arm/internals.h              |   4 +-
>   target/ppc/internal.h               |   4 +-
>   target/riscv/debug.h                |   4 +-
>   target/xtensa/cpu.h                 |   2 +-
>   accel/tcg/cpu-exec.c                |  48 ++++++------
>   accel/tcg/tcg-accel-ops.c           |   1 +
>   cpu-common.c                        |  54 ++++++++-----
>   gdbstub/system.c                    |   1 +
>   gdbstub/user.c                      |   1 +
>   hw/core/cpu-common.c                |   1 -
>   linux-user/main.c                   |  13 +++-
>   system/watchpoint.c                 |   1 +
>   target/arm/tcg/debug.c              |  76 ++++--------------
>   target/i386/cpu.c                   |   1 +
>   target/i386/kvm/kvm.c               |   1 +
>   target/i386/machine.c               |   1 +
>   target/i386/tcg/system/bpt_helper.c |   1 +
>   target/i386/tcg/tcg-cpu.c           |   2 +-
>   target/ppc/cpu.c                    |   1 +
>   target/ppc/tcg-excp_helper.c        |   4 +-
>   target/riscv/debug.c                | 116 ++++++----------------------
>   target/xtensa/dbg_helper.c          |  19 ++---
>   target/xtensa/helper.c              |   1 +
>   27 files changed, 174 insertions(+), 267 deletions(-)
> 


