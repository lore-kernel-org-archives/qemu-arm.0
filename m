Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1F8EDEBFF
	for <qemu-arm@archiver.kernel.org>; Wed,  4 Mar 2026 02:07:41 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vxbeB-0001dO-HT; Tue, 03 Mar 2026 21:07:36 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <thiago.bauermann@linaro.org>)
 id 1vxbdx-0001ZS-Up
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 21:07:22 -0500
Received: from mail-vk1-xa35.google.com ([2607:f8b0:4864:20::a35])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <thiago.bauermann@linaro.org>)
 id 1vxbdw-0002au-4u
 for qemu-arm@nongnu.org; Tue, 03 Mar 2026 21:07:21 -0500
Received: by mail-vk1-xa35.google.com with SMTP id
 71dfb90a1353d-56a8fdaddebso2224959e0c.0
 for <qemu-arm@nongnu.org>; Tue, 03 Mar 2026 18:07:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1772590038; x=1773194838; darn=nongnu.org;
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vnddJ1dU0jsRySyXHa3Oltw8L8oZe09VDB8l9emP4vg=;
 b=NFD0QjlYsQGyQMqEMnICaCkh3F2spmi/74NzXULeMy/sHZescHycxs6OfTfjT/p7Mg
 6SYb/2TUdtCDjFdFv7G9KW4qlFBK7XUHmiFNRzlDVg0cVkb1HNs3o12cTwKEmlpk48Ky
 mCT9veiTh/MvfJ73OSsIlUB0SBDyWic5SXbY3vBvRpTuvQYexPO7rTB2vpFLtyk5SVuG
 R6VW4B4kNc9JiWT/QlBarQ+yomiANDQ4ebzV+TJtkPaF6AW47NufgyS9T/HSL73DwnRm
 5pkq8CtvUEmNwMRi89HjpLQ2AYJZ261tA5N8WT3tK056Yfn2tKB4wovfvsVR9C+W1CxL
 zcfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772590038; x=1773194838;
 h=mime-version:message-id:date:user-agent:references:in-reply-to
 :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=vnddJ1dU0jsRySyXHa3Oltw8L8oZe09VDB8l9emP4vg=;
 b=HSonNLfFzDUvSn98YwO+t5wmqIn8mcrtRu5DuGVK5iwwx2Ehd2Wvjm94VGBsTZnkfl
 Y/ACA1q9i74Br79RqSGYZlDZt3wKusVrHQ1uJZQJQqud0vq8IjyGhqbr62aaQBp6bpjT
 A4nS/MzJG/AP7/x6gVNzGD9RLnfihSNIrptgJhkCBPzjghBt6WsMGe5ffMKdBQzJKKfq
 Kp3bQmHnRagtWff5wAtTf52I+TC3guUTenVG4fuccsUs7SmegECuDlggzkSj8PId91nn
 SF8lLct6M2MMXNpqVUHPxkWoJlocmNkRRIhH4wXDhWd6mEmsy3vG7ufCN/ola+B4PWD5
 pqfg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHYAq86U5xdbgmcswQdSVbR6glkom/0H06SOdHZkOyUE3jPqlGV9Pk79tlpaxdgx6++rHiF1/ejQ==@nongnu.org
X-Gm-Message-State: AOJu0YzDrDPIJYc+VO0H+eEu8CCFEBOOKYvwxZ2lEAZ/S+aWNkm0LOcm
 i3wjFv55wgekCd0u+0pdezzUn4VgPy5j+0EN82j2rxKiir2Knxxgt2NhQKO4e/hCgiE=
X-Gm-Gg: ATEYQzzV2miHFBhx1l5CFs8MeFV7EzHIdQ0FH0744TVByRwAYiOMwQsB+2r8Yr2Tlg3
 5KusVru6hstzDliS3WriPsiYfKTNaTtFjmTLr7yJnr8RrIrXMYogeMBgoN+qbOqRVU+aOHQZI/K
 iO8yFlQBLn2TpX0gVtyZ331guXzJHRFKymBOujZeJ1a+Z3YQYuWiuWQXOiVUVP0lDlC2U0z7J51
 4R0xIMEhaoWd+1Hyzg/XCaj1yjvEC5fXX6DlHcQeSXkhp7LGiNylVuwD/vBLWfgArNxpANS5y0p
 +jEybEeaqENW/K+3YW+gjvMZZccceqkRGgoVnY9vF2iqjqi1j+UiRlbLflAokoD1fHil8sfZZ8b
 iU1h0aUQHyAc7VMwR/K8qCdJnsKdJRmiTzxVMiqBNm0f9y/3q5i7FMThOMD64u/vVM/1QuyNsTV
 aAq0vGFbV1Te34gkYfqQwnHWBQPzH+kvC9EUMGF/I4Wjxj
X-Received: by 2002:a05:6102:3050:b0:5f7:24db:fdb8 with SMTP id
 ada2fe7eead31-5ffaaeec1bemr229182137.25.1772590038405; 
 Tue, 03 Mar 2026 18:07:18 -0800 (PST)
Received: from localhost ([2804:14d:7e39:8083:f04c:42e3:5943:38f6])
 by smtp.gmail.com with ESMTPSA id
 ada2fe7eead31-5ffa300c3f8sm1506831137.6.2026.03.03.18.07.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Mar 2026 18:07:17 -0800 (PST)
From: Thiago Jung Bauermann <thiago.bauermann@linaro.org>
To: Richard Henderson <richard.henderson@linaro.org>
Cc: qemu-devel@nongnu.org,  qemu-arm@nongnu.org
Subject: Re: [PATCH v4 00/84] target/arm: Implement FEAT_GCS
In-Reply-To: <87tsv1fr54.fsf@linaro.org> (Thiago Jung Bauermann's message of
 "Sat, 28 Feb 2026 01:06:47 -0300")
References: <20250830054128.448363-1-richard.henderson@linaro.org>
 <87tsv1fr54.fsf@linaro.org>
User-Agent: mu4e 1.12.15; emacs 30.2
Date: Tue, 03 Mar 2026 23:07:15 -0300
Message-ID: <878qc8e4a4.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain
Received-SPF: pass client-ip=2607:f8b0:4864:20::a35;
 envelope-from=thiago.bauermann@linaro.org; helo=mail-vk1-xa35.google.com
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

Thiago Jung Bauermann <thiago.bauermann@linaro.org> writes:

> I tried using GCS in current QEMU trunk (commit d8a9d97317d0 "Merge tag
> 'pull-target-arm-20260226' of https://gitlab.com/pm215/qemu into
> staging"), but I get this kernel oops with a simple program (attached)
> that just tries to enable GCS using prctl:
>
> [  226.334899] Unable to handle kernel paging request at virtual address fffff1ffc36c8008
> [  226.335033] Mem abort info:
> [  226.335088]   ESR = 0x0000000096000004
> [  226.335117]   EC = 0x25: DABT (current EL), IL = 32 bits
> [  226.335137]   SET = 0, FnV = 0
> [  226.335153]   EA = 0, S1PTW = 0
> [  226.335172]   FSC = 0x04: level 0 translation fault
> [  226.335192] Data abort info:
> [  226.335208]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [  226.335224]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [  226.335241]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [  226.335284] swapper pgtable: 4k pages, 52-bit VAs, pgdp=00000000dbe9b000
> [  226.335306] [fffff1ffc36c8008] pgd=10000000dcfcd003, p4d=0000000000000000
> [  226.335475] Internal error: Oops: 0000000096000004 [#1]  SMP
> [ 226.336917] Modules linked in: tpm_tis tpm_tis_core qrtr sha256 cfg80211 rfkill fuse
> dm_mod drm backlight ipv6 btrfs blake2b libblake2b xor xor_neon raid6_pq zstd_compress
> sm3_ce
> [  226.337746] CPU: 0 UID: 1000 PID: 950 Comm: simple-gcs Tainted: G   M                6.19.0 #2 PREEMPT
> [  226.337963] Tainted: [M]=MACHINE_CHECK
> [  226.338035] Hardware name: QEMU QEMU Virtual Machine, BIOS edk2-stable202408-prebuilt.qemu.org 08/13/2024
> [  226.338281] pstate: 21402005 (nzCv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [  226.338411] pc : __get_user_pages+0x4a4/0xc0c
> [  226.338889] lr : __get_user_pages+0x3fc/0xc0c
> [  226.338977] sp : ffff800080e236f0
> [  226.339042] x29: ffff800080e236f0 x28: fff00000c3c21e80 x27: 0000000000000000
> [  226.339203] x26: 0000000000000000 x25: fff00000c1a988c8 x24: 0000000000000000
> [  226.339327] x23: 0000ffffa3200000 x22: 000000000000000e x21: 0000000000000000
> [  226.339453] x20: fff00000c80bc300 x19: 0008000000000000 x18: 0000000000000000
> [  226.339573] x17: 0000000000000000 x16: ffff95c0712386b8 x15: 0000ffffa363bfff
> [  226.339699] x14: 0000000000000000 x13: 1ffe000018271e21 x12: fff00000c138f10c
> [  226.339824] x11: fff00000c138f100 x10: 0000000000000001 x9 : 0000000000000001
> [  226.339962] x8 : 00c800011b200f41 x7 : fff00000c138f108 x6 : 00000000000008c8
> [  226.340086] x5 : fffff1ffc36c8000 x4 : ffffc1ffc0000000 x3 : 0000000000000000
> [  226.340207] x2 : 0000000000104a00 x1 : 0040000000000841 x0 : 0040000000000800
> [  226.340392] Call trace:
> [  226.340554]  __get_user_pages+0x4a4/0xc0c (P)
> [  226.340701]  get_dump_page+0xe4/0x150
> [  226.340797]  dump_user_range+0x64/0x2e8
> [  226.340886]  elf_core_dump+0xbf8/0xe10
> [  226.340955]  vfs_coredump+0xea0/0x1c80
> [  226.341026]  get_signal+0x644/0x82c
> [  226.341097]  arch_do_signal_or_restart+0x118/0x3c4
> [  226.341184]  exit_to_user_mode_loop+0x104/0x16c
> [  226.341269]  el0_da+0x8c/0x90
> [  226.341344]  el0t_64_sync_handler+0xd0/0xe4
> [  226.341419]  el0t_64_sync+0x198/0x19c
> [  226.341626] Code: eb00003f 540029a0 924d0113 b6982d88 (f94004a4)
> [  226.341893] ---[ end trace 0000000000000000 ]---
> [  226.851631] note: simple-gcs[950] exited with preempt_count 1
>
> This is using Linux kernel v6.19 built with defconfig.
>
> I also tried the QEMU commit corresponding to the last patch in this
> series (af0bd678df72 "tests/tcg/aarch64: Add gcsss") but had the same
> result.
>
> The same binaries work as expected using Arm FVP, so it seems to be
> something in QEMU.

This turned out to be a kernel problem after all.

Using kernel v7.0-rc2 with its defconfig works fine, so I was able to
bisect the problem to this kernel commit from last week:

commit 8a85b3131225 ("arm64: gcs: Do not set PTE_SHARED on GCS mappings if FEAT_LPA2 is enabled")

I did try several kernel versions (as early as v6.13 which was the first
one with GCS enabled) to try to determine whether the problem was in the
kernel or QEMU, but failed.

Sorry for the noise.

-- 
Thiago

