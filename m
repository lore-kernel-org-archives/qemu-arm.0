Received: by 10.25.0.144 with SMTP id 138csp1748147lfa;
        Tue, 25 Apr 2017 00:54:05 -0700 (PDT)
X-Received: by 10.237.57.170 with SMTP id m39mr28452532qte.163.1493106845558;
        Tue, 25 Apr 2017 00:54:05 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com. [66.111.4.28])
        by mx.google.com with ESMTPS id k25si21119540qtb.291.2017.04.25.00.54.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 25 Apr 2017 00:54:05 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) client-ip=66.111.4.28;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.28 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 6E1A1210F2;
	Tue, 25 Apr 2017 03:54:03 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Tue, 25 Apr 2017 03:54:03 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=+DtGIi6Hq1PbGLFsdBmZGqFmjUV
	+3TEVvD9kw888jOg=; b=F0gWYf/9NV1H0Ew6XGgC90T9HQ1jb2TOBo7Bh+yJdDq
	KudTcpygZH8AQi6cIWukcjeLUXKhVaRwLqh8ttnXw7odFn1oRWGR1Nm9kEMWLnbc
	DEkhnxeVD4hh3nsTqU6zKwtawZbm12xPOSMPqDfeRHLHWqmYlVjUApHqabvqgXg0
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=+DtGIi
	6Hq1PbGLFsdBmZGqFmjUV+3TEVvD9kw888jOg=; b=YpYx47yH0Mq+HA1iPiS/uA
	zHtgyKUauOjwQr7b/qw6M7+6hxNBN9+tYN5jKe+cZQRtBvPPBMRUTiMQjMVvuOY1
	WcRqe0qPlFrKGGpu8LPqSnDVSFiHjm15FI5SSiQzeNhA/PiO9ansI+vcY8PCUDBV
	ti5m2U4I85g5u3t+ZO4+Wi8IBMsoGkE9fqM8Wdjno0PdjWnaZOyeKzV2Yiab6vdj
	WcTqZekJAkGnvJV+x1zuXTyoa/w3vAq1BlKO3s2Z/zGA+dWgCESWKpqjxAtHt66k
	C+kfA+IzvJZx4M5CLgUU88lJBO8EkTMJ2unp98wktpAO1Co3XqIcka0lF575DE7A
	==
X-ME-Sender: <xms:mwD_WB8w5LfsSMViEKtcHBKeHNnjqTMi8_tBygORm_JAhdz31YmkKw>
X-Sasl-enc: ePeNvTzL4clW3nyzoVCfcqyZu2z64H3tf2JaKdSpLtfA 1493106843
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id F0A802479D;
	Tue, 25 Apr 2017 03:54:02 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexander Graf <agraf@suse.de>,
	Stefan Weil <sw@weilnetz.de>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Pranith Kumar <bobby.prani+qemu@gmail.com>
Subject: [PATCH v2 00/13] TCG optimizations for 2.10
Date: Tue, 25 Apr 2017 03:53:46 -0400
Message-Id: <1493106839-10438-1-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
X-TUID: J3MQiGdiF/rl

v1 for context:
  https://lists.gnu.org/archive/html/qemu-devel/2017-04/msg02021.html

This series is aimed at 2.10 or beyond. Its goal is to improve
TCG code execution performance by optimizing:

1- Cross-page direct jumps (softmmu only, obviously)
2- Indirect branches (both softmmu and user-mode)
3- tb_jmp_cache hashing in user-mode (last patch)

Optimizations 1 and 2 are optional. This series implements them
for the i386 TCG backend and the ARM and i386 front-ends; other
backends/frontends can easily opt-in later on.

Changes from v1:

- Followed Richard's design, i.e. have a single helper in tcg-runtime
  and have the TCG op (now called "goto_ptr") to directly jump
  to the host pointer. This pointer is always valid since it's
  either pointing to the (valid) target or to TCG's epilogue. This
  simplifies the whole thing; the only branch in the code path is
  now the one that checks whether the tb pointer from tb_jmp_cache
  is valid.

- Much better performance (e.g. 2.4x speedup for "train" xalancbmk) --
  I'm guessing the design with just one branch is the reason. Also,
  I was unconditionally assigning ret=0 when entering the epilogue;
  fixed now.

- Document goto_ptr in tcg/README, as suggested by Paolo.

- target/i386: also optimized ret/ret im.

- Ensure that TCGContext's read-mostly fields are accessed without
  cache line bouncing. Note that (1) every time we translate,
  TCGContext is heavily written to, and (2) the address of the
  epilogue, which is now accessed in a fast path, is part of
  TCGContext. So patches 3 and 4 make sure there is no false sharing
  of cache lines between these two access patterns.

- Evaluated Paolo's suggestion of using multiplicative hashing. See
  the last patch's commit log.

Things I didn't do:

- Apply the optimization to syscall instructions in target/i386.

- Look at the impact of TLB flushes. With these (new, improved) perf
  numbers there is less reason to worry about this, although they
  should explain the perf differences between softmmu and user-mode.
  Thanks Alex for pointing me out to your profiling code though!
  Learning to use trace points is next in my QEMU TODO list, so I'll
  take a look.

The series applies cleanly on v2.9.0. Measurements are in the
commit logs. You can inspect/fetch the changes at:
  https://github.com/cota/qemu/tree/tcg-opt-v2

Thanks,

		Emilio
