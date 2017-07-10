Return-Path: <alex.bennee@linaro.org>
Received: from zen.linaro.local ([81.128.185.34])
        by smtp.gmail.com with ESMTPSA id c131sm9111551wmh.2.2017.07.10.08.17.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jul 2017 08:17:18 -0700 (PDT)
Received: from zen (localhost [127.0.0.1])
	by zen.linaro.local (Postfix) with ESMTPS id 749AE3E014F;
	Mon, 10 Jul 2017 16:17:17 +0100 (BST)
References: <20170710142850.10468-1-alex.bennee@linaro.org> <CAFEAcA-eLe6b-0pKkoam1TBQD680W0nunARrSFxQTgUkoqug+w@mail.gmail.com>
User-agent: mu4e 0.9.19; emacs 25.2.50.3
From: Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>
To: Peter Maydell <peter.maydell@linaro.org>
Cc: Pranith Kumar <bobby.prani@gmail.com>, QEMU Developers <qemu-devel@nongnu.org>, qemu-arm <qemu-arm@nongnu.org>, Paolo Bonzini <pbonzini@redhat.com>, Peter Crosthwaite <crosthwaite.peter@gmail.com>, Richard Henderson <rth@twiddle.net>
Subject: Re: [RFC PATCH] include/exec/cpu-defs.h: try and make SoftMMU page size match target
In-reply-to: <CAFEAcA-eLe6b-0pKkoam1TBQD680W0nunARrSFxQTgUkoqug+w@mail.gmail.com>
Date: Mon, 10 Jul 2017 16:17:17 +0100
Message-ID: <87pod89v9e.fsf@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
X-TUID: s4zph4LRJX4P


Peter Maydell <peter.maydell@linaro.org> writes:

> On 10 July 2017 at 15:28, Alex Bennée <alex.bennee@linaro.org> wrote:
>> While the SoftMMU is not emulating the target MMU of a system there is
>> a relationship between its page size and that of the target. If the
>> target MMU is full featured the functions called to re-fill the
>> entries in the SoftMMU entries start moving up the perf profiles. If
>> we can we should try and prevent too much thrashing around by having
>> the page sizes the same.
>>
>> Ideally we should use TARGET_PAGE_BITS_MIN but that potentially
>> involves a fair bit of #include re-jigging so I went for 10 bits (1k
>> pages) which I think is the smallest of all our emulated systems.
>
> The figures certainly show an improvement, but it's not clear
> to me why this is related to the target's page size rather than
> just being a "bigger is better" kind of thing?

Well this was driven by a discussion with Pranith last week. In his
(admittedly memory intensive) bench-marking he was seeing around 30%
overhead is coming from mmu related functions with the hottest being
get_phys_addr_lpae() followed by address_space_do_translate(). We
theorised that even given the high hit rate of the fast path the slow
path was triggered by moving over SoftMMU's effective page boundary. A
quick experiment in extending the size of the TLB made his hot spots
disappear.

I don't see quite such a hot-spot in my simple boot/build benchmark test
but after helper_lookup_tb_ptr quite a lot of hits are part of the
re-fill chain:

  16.37%  qemu-system-aar  qemu-system-aarch64      [.] helper_lookup_tb_ptr
   3.43%  qemu-system-aar  qemu-system-aarch64      [.] victim_tlb_hit
   2.73%  qemu-system-aar  qemu-system-aarch64      [.] tlb_set_page_with_attrs
   2.60%  qemu-system-aar  qemu-system-aarch64      [.] get_phys_addr_lpae
   2.36%  qemu-system-aar  qemu-system-aarch64      [.] qht_lookup
   1.53%  qemu-system-aar  qemu-system-aarch64      [.] arm_regime_tbi1
   1.37%  qemu-system-aar  qemu-system-aarch64      [.] tcg_optimize
   1.34%  qemu-system-aar  qemu-system-aarch64      [.] tcg_gen_code
   1.31%  qemu-system-aar  qemu-system-aarch64      [.] arm_regime_tbi0
   1.28%  qemu-system-aar  qemu-system-aarch64      [.] address_space_ldq_le
   1.22%  qemu-system-aar  qemu-system-aarch64      [.] object_dynamic_cast_assert
   1.11%  qemu-system-aar  qemu-system-aarch64      [.] address_space_translate_internal
   1.03%  qemu-system-aar  qemu-system-aarch64      [.] tb_htable_lookup
   0.98%  qemu-system-aar  qemu-system-aarch64      [.] get_page_addr_code
   0.98%  qemu-system-aar  qemu-system-aarch64      [.] address_space_do_translate
   0.87%  qemu-system-aar  qemu-system-aarch64      [.] object_class_dynamic_cast_assert
   0.82%  qemu-system-aar  qemu-system-aarch64      [.] get_phys_addr
   0.75%  qemu-system-aar  qemu-system-aarch64      [.] tb_cmp
   0.63%  qemu-system-aar  qemu-system-aarch64      [.] liveness_pass_1
   0.59%  qemu-system-aar  qemu-system-aarch64      [.] helper_le_ldq_mmu

--
Alex Bennée
