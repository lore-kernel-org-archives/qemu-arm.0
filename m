Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaroharston ([51.148.130.216])
        by smtp.gmail.com with ESMTPSA id dq22sm406518ejc.100.2022.02.17.04.48.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Feb 2022 04:48:42 -0800 (PST)
Received: from zen (localhost [127.0.0.1])
	by zen.linaroharston (Postfix) with ESMTP id 302EB20329;
	Thu, 17 Feb 2022 12:48:42 +0000 (GMT)
User-agent: mu4e 1.7.7; emacs 28.0.91
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: qemu-devel <qemu-devel@nongnu.org>
Cc: Richard Henderson <richard.henderson@linaro.org>, Peter Maydell
 <peter.maydell@linaro.org>, Philippe =?utf-8?Q?Mathieu-Daud=C3=A9?=
 <f4bug@amsat.org>,
 Emilio Cota <cota@braap.org>, Idan Horowitz <idan.horowitz@gmail.com>,
 qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>,
 Cleber Rosa <cleber@redhat.com>, Oleg Vasilev <me@svin.in>
Subject: Analysis of slow distro boots in check-avocado
 (BootLinuxAarch64.test_virt_tcg*)
Date: Thu, 17 Feb 2022 11:19:28 +0000
Message-ID: <874k4xbqvp.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-TUID: FLhJpsjI7iaq

Hi,

TL;DR:

  - pc-bios/edk2-aarch64-code.fd should be rebuilt without debug
  - -cpu max needs pauth-impdef=3Don=20
  - PageDesc->code_bitmap is wastefully thrown away
  - the kernels memmap_init_range interacts badly with pages containing fir=
mware code
  - kernel features like KFENCE also contribute to TB churn

End of TL;DR

I've spent some time looking at fixing the slow tests in check-avocado.
It was a surprising slowdown because I regularly run a full fat Debian
Bullseye system (with systemd!) and it boots to a login prompt in about
26 seconds. A full-fat EFI boot which my distro built EFI image takes a
bit longer but does get to the login prompt in 56 seconds (with some
time taken for selecting grub menu items).

I initially thought I could just replace the heavyweight Fedora image
with the lightest of Alpine distros:

  https://dl-cdn.alpinelinux.org/alpine/v3.15/releases/aarch64/alpine-stand=
ard-3.15.0-aarch64.iso

which has a single busybox userspace task and a very lightweight init.
However this very simple setup still takes 160s to get to the login
prompt. Using my distro EDK2 shaves about nearly 40s off the boot but it
is still slow. Clearly something other than the amount of userspace is
to blame here.

The initial perf traces showed a lot of undue prominence to
do_tb_phys_invalidate() which is the mechanism by which we remove
generated code when it has potentially changed. We do this by marking
softmmu pages with DIRTY_MEMORY_CODE which will force a slow-path cputlb
lookup for every write. I added a bunch of instrumentation (see
https://gitlab.com/stsquad/qemu/-/tree/plugins/next) and it quickly
becomes clear what the problem is:

  tb_invalidate_phys_page_fast addr:0x3f3ee000/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:42 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee008/8 pc:0x7f6d4c94 wc:1/(nil)
  tb_invalidate_phys_page_range checked:42 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee010/8 pc:0x7f6d4c94 wc:2/(nil)
  tb_invalidate_phys_page_range checked:42 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee018/8 pc:0x7f6d4c94 wc:3/(nil)
  tb_invalidate_phys_page_range checked:42 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee020/8 pc:0x7f6d4c94 wc:4/(nil)
  tb_invalidate_phys_page_range checked:42 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee028/8 pc:0x7f6d4c94 wc:5/(nil)
  tb_invalidate_phys_page_range checked:42 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee030/8 pc:0x7f6d4c94 wc:6/(nil)
  tb_invalidate_phys_page_range checked:42 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee038/8 pc:0x7f6d4c94 wc:7/(nil)
  tb_invalidate_phys_page_range checked:42 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee040/8 pc:0x7f6d4c94 wc:8/(nil)
  tb_invalidate_phys_page_range checked:42 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee048/8 pc:0x7f6d4c94 wc:9/(nil)
  tb_invalidate_phys_page_fast addr:0x3f3ee050/8 pc:0x7f6d4c94 wc:10/0x7fd2=
400fac10

Here we have written to a page SMC_BITMAP_USE_THRESHOLD so create a
bitmap to make testing for hit pages faster. However...

  tb_invalidate_phys_page_fast addr:0x3f3ee058/8 pc:0x7f6d4c94 wc:10/0x7fd2=
400fac10
  ...
  tb_invalidate_phys_page_fast addr:0x3f3ee710/8 pc:0x7f6d4c94 wc:10/0x7fd2=
400fac10
  tb_invalidate_phys_page_fast addr:0x3f3ee718/8 pc:0x7f6d4c94 wc:10/0x7fd2=
400fac10
  tb_invalidate_phys_page_fast addr:0x3f3ee720/8 pc:0x7f6d4c94 wc:10/0x7fd2=
400fac10
  tb_phys_invalidate tb:0x7fd2945b36c0, pc:0x7f3ee720
  tb_invalidate_phys_page_range checked:42 removed:1 first_tb_pc:0x7f3eede0

The page filling code finally hits a TB that needs removing and we throw
away the bitmap (invalidate_page_bitmap) rather than clearing the bits
no longer relevant. Meaning we have to regenerate anyway...

  tb_invalidate_phys_page_fast addr:0x3f3ee728/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:41 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee730/8 pc:0x7f6d4c94 wc:1/(nil)
  tb_invalidate_phys_page_range checked:41 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee738/8 pc:0x7f6d4c94 wc:2/(nil)
  tb_phys_invalidate tb:0x7fd2945b3ac0, pc:0x7f3ee738
  tb_invalidate_phys_page_range checked:41 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee740/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_phys_invalidate tb:0x7fd2945b3c40, pc:0x7f3ee740
  tb_invalidate_phys_page_range checked:40 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee748/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:39 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee750/8 pc:0x7f6d4c94 wc:1/(nil)
  tb_invalidate_phys_page_range checked:39 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee758/8 pc:0x7f6d4c94 wc:2/(nil)
  tb_phys_invalidate tb:0x7fd2945b3d80, pc:0x7f3ee75c
  tb_invalidate_phys_page_range checked:39 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee760/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:38 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee768/8 pc:0x7f6d4c94 wc:1/(nil)
  tb_invalidate_phys_page_range checked:38 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee770/8 pc:0x7f6d4c94 wc:2/(nil)
  tb_invalidate_phys_page_range checked:38 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee778/8 pc:0x7f6d4c94 wc:3/(nil)
  tb_phys_invalidate tb:0x7fd2945b3ec0, pc:0x7f3ee778
  tb_invalidate_phys_page_range checked:38 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee780/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:37 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee788/8 pc:0x7f6d4c94 wc:1/(nil)
  tb_phys_invalidate tb:0x7fd2945b2e80, pc:0x7f3ee78c
  tb_invalidate_phys_page_range checked:37 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee790/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:36 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee798/8 pc:0x7f6d4c94 wc:1/(nil)
  tb_invalidate_phys_page_range checked:36 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee7a0/8 pc:0x7f6d4c94 wc:2/(nil)
  tb_invalidate_phys_page_range checked:36 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee7a8/8 pc:0x7f6d4c94 wc:3/(nil)
  tb_invalidate_phys_page_range checked:36 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee7b0/8 pc:0x7f6d4c94 wc:4/(nil)
  tb_invalidate_phys_page_range checked:36 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee7b8/8 pc:0x7f6d4c94 wc:5/(nil)
  tb_invalidate_phys_page_range checked:36 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee7c0/8 pc:0x7f6d4c94 wc:6/(nil)
  tb_phys_invalidate tb:0x7fd2945b48c0, pc:0x7f3ee7c0
  tb_invalidate_phys_page_range checked:36 removed:1 first_tb_pc:0x7f3eede0

And now we continue to remove the pages one at a time until eventually
the page is clear. There is a XXX message that says:

    /* XXX: see if in some cases it could be faster to invalidate all
       the code */

I experimented with unconditionally flushing all the TBs in a page which
did improve things somewhat but then caused excess TB invalidation for
the normal case. One idea would maybe be to tracking the number of
leading zeros in the bitmap when it exists and if it increases from one
call to the next that could be the used as a heuristic to trigger a more
aggressive flush of the TBs for that page.

  tb_invalidate_phys_page_fast addr:0x3f3ee7c8/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:35 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee7d0/8 pc:0x7f6d4c94 wc:1/(nil)
  tb_invalidate_phys_page_range checked:35 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee7d8/8 pc:0x7f6d4c94 wc:2/(nil)
  tb_phys_invalidate tb:0x7fd2945b3500, pc:0x7f3ee7d8
  tb_invalidate_phys_page_range checked:35 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee7e0/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:34 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee7e8/8 pc:0x7f6d4c94 wc:1/(nil)
  tb_phys_invalidate tb:0x7fd2945b4600, pc:0x7f3ee7ec
  tb_invalidate_phys_page_range checked:34 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee7f0/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_phys_invalidate tb:0x7fd2945b4ac0, pc:0x7f3ee7f4
  tb_invalidate_phys_page_range checked:33 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee7f8/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:32 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee800/8 pc:0x7f6d4c94 wc:1/(nil)
  tb_invalidate_phys_page_range checked:32 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee808/8 pc:0x7f6d4c94 wc:2/(nil)
  tb_invalidate_phys_page_range checked:32 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee810/8 pc:0x7f6d4c94 wc:3/(nil)
  tb_phys_invalidate tb:0x7fd2945b4d40, pc:0x7f3ee810
  tb_invalidate_phys_page_range checked:32 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee818/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_phys_invalidate tb:0x7fd2945b4e80, pc:0x7f3ee818
  tb_invalidate_phys_page_range checked:31 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee820/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:30 removed:0 first_tb_pc:0x7f3eede0
  ...
  tb_invalidate_phys_page_fast addr:0x3f3ee858/8 pc:0x7f6d4c94 wc:7/(nil)
  tb_invalidate_phys_page_range checked:30 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee860/8 pc:0x7f6d4c94 wc:8/(nil)
  tb_phys_invalidate tb:0x7fd2945b4fc0, pc:0x7f3ee864
  tb_invalidate_phys_page_range checked:30 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee868/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_phys_invalidate tb:0x7fd2945b7c40, pc:0x7f3ee868
  tb_invalidate_phys_page_range checked:29 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee870/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_phys_invalidate tb:0x7fd2945b7d80, pc:0x7f3ee870
  tb_invalidate_phys_page_range checked:28 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee878/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:27 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee880/8 pc:0x7f6d4c94 wc:1/(nil)
  ...
  tb_invalidate_phys_page_range checked:27 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee8b0/8 pc:0x7f6d4c94 wc:7/(nil)
  tb_invalidate_phys_page_range checked:27 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee8b8/8 pc:0x7f6d4c94 wc:8/(nil)
  tb_phys_invalidate tb:0x7fd2945b7ec0, pc:0x7f3ee8bc
  tb_invalidate_phys_page_range checked:27 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee8c0/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_phys_invalidate tb:0x7fd2945b8140, pc:0x7f3ee8c0
  tb_invalidate_phys_page_range checked:26 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee8c8/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_phys_invalidate tb:0x7fd2945b8280, pc:0x7f3ee8c8
  tb_invalidate_phys_page_range checked:25 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee8d0/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:24 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee8d8/8 pc:0x7f6d4c94 wc:1/(nil)
  tb_invalidate_phys_page_range checked:24 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee8e0/8 pc:0x7f6d4c94 wc:2/(nil)
  tb_invalidate_phys_page_range checked:24 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee8e8/8 pc:0x7f6d4c94 wc:3/(nil)
  tb_invalidate_phys_page_range checked:24 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee8f0/8 pc:0x7f6d4c94 wc:4/(nil)
  tb_invalidate_phys_page_range checked:24 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee8f8/8 pc:0x7f6d4c94 wc:5/(nil)
  tb_invalidate_phys_page_range checked:24 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee900/8 pc:0x7f6d4c94 wc:6/(nil)
  tb_invalidate_phys_page_range checked:24 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee908/8 pc:0x7f6d4c94 wc:7/(nil)
  tb_invalidate_phys_page_range checked:24 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee910/8 pc:0x7f6d4c94 wc:8/(nil)
  tb_phys_invalidate tb:0x7fd2945b83c0, pc:0x7f3ee914
  tb_invalidate_phys_page_range checked:24 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee918/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:23 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee920/8 pc:0x7f6d4c94 wc:1/(nil)
  tb_invalidate_phys_page_range checked:23 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee928/8 pc:0x7f6d4c94 wc:2/(nil)
  tb_invalidate_phys_page_range checked:23 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee930/8 pc:0x7f6d4c94 wc:3/(nil)
  tb_invalidate_phys_page_range checked:23 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee938/8 pc:0x7f6d4c94 wc:4/(nil)
  tb_invalidate_phys_page_range checked:23 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee940/8 pc:0x7f6d4c94 wc:5/(nil)
  tb_invalidate_phys_page_range checked:23 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee948/8 pc:0x7f6d4c94 wc:6/(nil)
  tb_invalidate_phys_page_range checked:23 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee950/8 pc:0x7f6d4c94 wc:7/(nil)
  tb_phys_invalidate tb:0x7fd2945b8680, pc:0x7f3ee950
  tb_invalidate_phys_page_range checked:23 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee958/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:22 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee960/8 pc:0x7f6d4c94 wc:1/(nil)
  tb_invalidate_phys_page_range checked:22 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee968/8 pc:0x7f6d4c94 wc:2/(nil)
  tb_invalidate_phys_page_range checked:22 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee970/8 pc:0x7f6d4c94 wc:3/(nil)
  tb_invalidate_phys_page_range checked:22 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee978/8 pc:0x7f6d4c94 wc:4/(nil)
  tb_invalidate_phys_page_range checked:22 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee980/8 pc:0x7f6d4c94 wc:5/(nil)
  tb_invalidate_phys_page_range checked:22 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee988/8 pc:0x7f6d4c94 wc:6/(nil)
  tb_phys_invalidate tb:0x7fd2945b8980, pc:0x7f3ee98c
  tb_invalidate_phys_page_range checked:22 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee990/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:21 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee998/8 pc:0x7f6d4c94 wc:1/(nil)
  tb_invalidate_phys_page_range checked:21 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee9a0/8 pc:0x7f6d4c94 wc:2/(nil)
  tb_invalidate_phys_page_range checked:21 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee9a8/8 pc:0x7f6d4c94 wc:3/(nil)
  tb_phys_invalidate tb:0x7fd2945b8bc0, pc:0x7f3ee9ac
  tb_invalidate_phys_page_range checked:21 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee9b0/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_phys_invalidate tb:0x7fd2945b8d00, pc:0x7f3ee9b4
  tb_invalidate_phys_page_range checked:20 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee9b8/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:19 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee9c0/8 pc:0x7f6d4c94 wc:1/(nil)
  tb_invalidate_phys_page_range checked:19 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee9c8/8 pc:0x7f6d4c94 wc:2/(nil)
  tb_invalidate_phys_page_range checked:19 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee9d0/8 pc:0x7f6d4c94 wc:3/(nil)
  tb_invalidate_phys_page_range checked:19 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee9d8/8 pc:0x7f6d4c94 wc:4/(nil)
  tb_invalidate_phys_page_range checked:19 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee9e0/8 pc:0x7f6d4c94 wc:5/(nil)
  tb_invalidate_phys_page_range checked:19 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee9e8/8 pc:0x7f6d4c94 wc:6/(nil)
  tb_invalidate_phys_page_range checked:19 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee9f0/8 pc:0x7f6d4c94 wc:7/(nil)
  tb_invalidate_phys_page_range checked:19 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3ee9f8/8 pc:0x7f6d4c94 wc:8/(nil)
  tb_invalidate_phys_page_range checked:19 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eea00/8 pc:0x7f6d4c94 wc:9/(nil)
  tb_phys_invalidate tb:0x7fd2945b8e40, pc:0x7f3eea00
  tb_invalidate_phys_page_range checked:19 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eea08/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:18 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eea10/8 pc:0x7f6d4c94 wc:1/(nil)
  tb_invalidate_phys_page_range checked:18 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eea18/8 pc:0x7f6d4c94 wc:2/(nil)
  tb_invalidate_phys_page_range checked:18 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eea20/8 pc:0x7f6d4c94 wc:3/(nil)
  tb_phys_invalidate tb:0x7fd2945b9000, pc:0x7f3eea20
  tb_invalidate_phys_page_range checked:18 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eea28/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:17 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eea30/8 pc:0x7f6d4c94 wc:1/(nil)
  tb_invalidate_phys_page_range checked:17 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eea38/8 pc:0x7f6d4c94 wc:2/(nil)
  tb_invalidate_phys_page_range checked:17 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eea40/8 pc:0x7f6d4c94 wc:3/(nil)
  tb_invalidate_phys_page_range checked:17 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eea48/8 pc:0x7f6d4c94 wc:4/(nil)
  tb_invalidate_phys_page_range checked:17 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eea50/8 pc:0x7f6d4c94 wc:5/(nil)
  tb_invalidate_phys_page_range checked:17 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eea58/8 pc:0x7f6d4c94 wc:6/(nil)
  tb_invalidate_phys_page_range checked:17 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eea60/8 pc:0x7f6d4c94 wc:7/(nil)
  tb_invalidate_phys_page_range checked:17 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eea68/8 pc:0x7f6d4c94 wc:8/(nil)
  tb_phys_invalidate tb:0x7fd2945b9140, pc:0x7f3eea6c
  tb_invalidate_phys_page_range checked:17 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eea70/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_phys_invalidate tb:0x7fd2945cd5c0, pc:0x7f3eea70
  tb_invalidate_phys_page_range checked:16 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eea78/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:15 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eea80/8 pc:0x7f6d4c94 wc:1/(nil)
  tb_invalidate_phys_page_range checked:15 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eea88/8 pc:0x7f6d4c94 wc:2/(nil)
  tb_invalidate_phys_page_range checked:15 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eea90/8 pc:0x7f6d4c94 wc:3/(nil)
  tb_invalidate_phys_page_range checked:15 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eea98/8 pc:0x7f6d4c94 wc:4/(nil)
  tb_invalidate_phys_page_range checked:15 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeaa0/8 pc:0x7f6d4c94 wc:5/(nil)
  tb_invalidate_phys_page_range checked:15 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeaa8/8 pc:0x7f6d4c94 wc:6/(nil)
  tb_invalidate_phys_page_range checked:15 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeab0/8 pc:0x7f6d4c94 wc:7/(nil)
  tb_invalidate_phys_page_range checked:15 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeab8/8 pc:0x7f6d4c94 wc:8/(nil)
  tb_invalidate_phys_page_range checked:15 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeac0/8 pc:0x7f6d4c94 wc:9/(nil)
  tb_phys_invalidate tb:0x7fd2945cd840, pc:0x7f3eeac4
  tb_phys_invalidate tb:0x7fd2945cd700, pc:0x7f3eeac0
  tb_invalidate_phys_page_range checked:15 removed:2 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeac8/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:13 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eead0/8 pc:0x7f6d4c94 wc:1/(nil)
  tb_invalidate_phys_page_range checked:13 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eead8/8 pc:0x7f6d4c94 wc:2/(nil)
  tb_invalidate_phys_page_range checked:13 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeae0/8 pc:0x7f6d4c94 wc:3/(nil)
  tb_invalidate_phys_page_range checked:13 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeae8/8 pc:0x7f6d4c94 wc:4/(nil)
  tb_invalidate_phys_page_range checked:13 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeaf0/8 pc:0x7f6d4c94 wc:5/(nil)
  tb_invalidate_phys_page_range checked:13 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeaf8/8 pc:0x7f6d4c94 wc:6/(nil)
  tb_phys_invalidate tb:0x7fd2945d2b40, pc:0x7f3eeaf8
  tb_invalidate_phys_page_range checked:13 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeb00/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_phys_invalidate tb:0x7fd2945b4780, pc:0x7f3eeb00
  tb_invalidate_phys_page_range checked:12 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeb08/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_phys_invalidate tb:0x7fd2945cd9c0, pc:0x7f3eeb08
  tb_invalidate_phys_page_range checked:11 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeb10/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_phys_invalidate tb:0x7fd2945d2a00, pc:0x7f3eeb10
  tb_invalidate_phys_page_range checked:10 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeb18/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:9 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeb20/8 pc:0x7f6d4c94 wc:1/(nil)
  tb_invalidate_phys_page_range checked:9 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeb28/8 pc:0x7f6d4c94 wc:2/(nil)
  tb_invalidate_phys_page_range checked:9 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeb30/8 pc:0x7f6d4c94 wc:3/(nil)
  tb_invalidate_phys_page_range checked:9 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeb38/8 pc:0x7f6d4c94 wc:4/(nil)
  tb_invalidate_phys_page_range checked:9 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeb40/8 pc:0x7f6d4c94 wc:5/(nil)
  tb_invalidate_phys_page_range checked:9 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeb48/8 pc:0x7f6d4c94 wc:6/(nil)
  tb_invalidate_phys_page_range checked:9 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeb50/8 pc:0x7f6d4c94 wc:7/(nil)
  tb_invalidate_phys_page_range checked:9 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeb58/8 pc:0x7f6d4c94 wc:8/(nil)
  tb_phys_invalidate tb:0x7fd2945d2c80, pc:0x7f3eeb58
  tb_invalidate_phys_page_range checked:9 removed:1 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeb60/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:8 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeb68/8 pc:0x7f6d4c94 wc:1/(nil)
  tb_invalidate_phys_page_range checked:8 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeb70/8 pc:0x7f6d4c94 wc:2/(nil)
  tb_invalidate_phys_page_range checked:8 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeb78/8 pc:0x7f6d4c94 wc:3/(nil)
  tb_invalidate_phys_page_range checked:8 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeb80/8 pc:0x7f6d4c94 wc:4/(nil)
  tb_invalidate_phys_page_range checked:8 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeb88/8 pc:0x7f6d4c94 wc:5/(nil)
  tb_invalidate_phys_page_range checked:8 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeb90/8 pc:0x7f6d4c94 wc:6/(nil)
  tb_invalidate_phys_page_range checked:8 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeb98/8 pc:0x7f6d4c94 wc:7/(nil)
  tb_invalidate_phys_page_range checked:8 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeba0/8 pc:0x7f6d4c94 wc:8/(nil)
  tb_invalidate_phys_page_range checked:8 removed:0 first_tb_pc:0x7f3eede0
  tb_invalidate_phys_page_fast addr:0x3f3eeba8/8 pc:0x7f6d4c94 wc:9/(nil)
  tb_invalidate_phys_page_fast addr:0x3f3eebb0/8 pc:0x7f6d4c94 wc:10/0x7fd2=
400fae20
  ...
  tb_invalidate_phys_page_fast addr:0x3f3eede0/8 pc:0x7f6d4c94 wc:10/0x7fd2=
400fae20
  tb_phys_invalidate tb:0x7fd2945d2dc0, pc:0x7f3eede0
  tb_invalidate_phys_page_range checked:8 removed:1 first_tb_pc:0x7f3eef98
  tb_invalidate_phys_page_fast addr:0x3f3eede8/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:7 removed:0 first_tb_pc:0x7f3eef98
  tb_invalidate_phys_page_fast addr:0x3f3eedf0/8 pc:0x7f6d4c94 wc:1/(nil)
  tb_invalidate_phys_page_range checked:7 removed:0 first_tb_pc:0x7f3eef98
  tb_invalidate_phys_page_fast addr:0x3f3eedf8/8 pc:0x7f6d4c94 wc:2/(nil)
  tb_invalidate_phys_page_range checked:7 removed:0 first_tb_pc:0x7f3eef98
  tb_invalidate_phys_page_fast addr:0x3f3eee00/8 pc:0x7f6d4c94 wc:3/(nil)
  tb_invalidate_phys_page_range checked:7 removed:0 first_tb_pc:0x7f3eef98
  tb_invalidate_phys_page_fast addr:0x3f3eee08/8 pc:0x7f6d4c94 wc:4/(nil)
  tb_invalidate_phys_page_range checked:7 removed:0 first_tb_pc:0x7f3eef98
  tb_invalidate_phys_page_fast addr:0x3f3eee10/8 pc:0x7f6d4c94 wc:5/(nil)
  tb_invalidate_phys_page_range checked:7 removed:0 first_tb_pc:0x7f3eef98
  tb_invalidate_phys_page_fast addr:0x3f3eee18/8 pc:0x7f6d4c94 wc:6/(nil)
  tb_invalidate_phys_page_range checked:7 removed:0 first_tb_pc:0x7f3eef98
  tb_invalidate_phys_page_fast addr:0x3f3eee20/8 pc:0x7f6d4c94 wc:7/(nil)
  tb_invalidate_phys_page_range checked:7 removed:0 first_tb_pc:0x7f3eef98
  tb_invalidate_phys_page_fast addr:0x3f3eee28/8 pc:0x7f6d4c94 wc:8/(nil)
  tb_invalidate_phys_page_range checked:7 removed:0 first_tb_pc:0x7f3eef98
  tb_invalidate_phys_page_fast addr:0x3f3eee30/8 pc:0x7f6d4c94 wc:9/(nil)
  tb_invalidate_phys_page_fast addr:0x3f3eee38/8 pc:0x7f6d4c94 wc:10/0x7fd2=
400fae20
  ...
  tb_invalidate_phys_page_fast addr:0x3f3eef90/8 pc:0x7f6d4c94 wc:10/0x7fd2=
400fae20
  tb_phys_invalidate tb:0x7fd2945c0840, pc:0x7f3eef90
  tb_invalidate_phys_page_range checked:7 removed:1 first_tb_pc:0x7f3eef98
  tb_invalidate_phys_page_fast addr:0x3f3eef98/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_phys_invalidate tb:0x7fd2945c16c0, pc:0x7f3eef98
  tb_invalidate_phys_page_range checked:6 removed:1 first_tb_pc:0x7f3eefb8
  tb_invalidate_phys_page_fast addr:0x3f3eefa0/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_phys_invalidate tb:0x7fd2945c0a40, pc:0x7f3eefa4
  tb_invalidate_phys_page_range checked:5 removed:1 first_tb_pc:0x7f3eefb8
  tb_invalidate_phys_page_fast addr:0x3f3eefa8/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_phys_invalidate tb:0x7fd2945c1380, pc:0x7f3eefa8
  tb_invalidate_phys_page_range checked:4 removed:1 first_tb_pc:0x7f3eefb8
  tb_invalidate_phys_page_fast addr:0x3f3eefb0/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:3 removed:0 first_tb_pc:0x7f3eefb8
  tb_invalidate_phys_page_fast addr:0x3f3eefb8/8 pc:0x7f6d4c94 wc:1/(nil)
  tb_phys_invalidate tb:0x7fd2945c1580, pc:0x7f3eefb8
  tb_invalidate_phys_page_range checked:3 removed:1 first_tb_pc:0x7f3eeffc
  tb_invalidate_phys_page_fast addr:0x3f3eefc0/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_phys_invalidate tb:0x7fd2945bc800, pc:0x7f3eefc4
  tb_invalidate_phys_page_range checked:2 removed:1 first_tb_pc:0x7f3eeffc
  tb_invalidate_phys_page_fast addr:0x3f3eefc8/8 pc:0x7f6d4c94 wc:0/(nil)
  tb_invalidate_phys_page_range checked:1 removed:0 first_tb_pc:0x7f3eeffc
  tb_invalidate_phys_page_fast addr:0x3f3eefd0/8 pc:0x7f6d4c94 wc:1/(nil)
  tb_invalidate_phys_page_range checked:1 removed:0 first_tb_pc:0x7f3eeffc
  tb_invalidate_phys_page_fast addr:0x3f3eefd8/8 pc:0x7f6d4c94 wc:2/(nil)
  tb_invalidate_phys_page_range checked:1 removed:0 first_tb_pc:0x7f3eeffc
  tb_invalidate_phys_page_fast addr:0x3f3eefe0/8 pc:0x7f6d4c94 wc:3/(nil)
  tb_invalidate_phys_page_range checked:1 removed:0 first_tb_pc:0x7f3eeffc
  tb_invalidate_phys_page_fast addr:0x3f3eefe8/8 pc:0x7f6d4c94 wc:4/(nil)
  tb_invalidate_phys_page_range checked:1 removed:0 first_tb_pc:0x7f3eeffc
  tb_invalidate_phys_page_fast addr:0x3f3eeff0/8 pc:0x7f6d4c94 wc:5/(nil)
  tb_invalidate_phys_page_range checked:1 removed:0 first_tb_pc:0x7f3eeffc
  tb_invalidate_phys_page_fast addr:0x3f3eeff8/8 pc:0x7f6d4c94 wc:6/(nil)
  tb_phys_invalidate tb:0x7fd2945bcf00, pc:0x7f3eeffc

Having finally cleared all the TBs from the page we finally unprotect
the RAM region ensuring that future writes to the page can be fast
pathed (until we generate new code for a page).

  tlb_unprotect_code 0x3f3eeff8

So my working theory is:

  - booting with EFI leaves a number stale code pages
  - as the kernel boots it clears these pages triggering lots of
    slow-path writes
  - result very slow boot

I think the only real solution is to improve our TB invalidation code
but perhaps another approach would be to detect a high TB invalidation
churn and just tb_flush the whole thing and start again?

Any thoughts or ideas?

--=20
Alex Benn=C3=A9e
