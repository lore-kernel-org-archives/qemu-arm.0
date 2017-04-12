Received: by 10.25.0.144 with SMTP id 138csp89154lfa;
        Tue, 11 Apr 2017 18:17:47 -0700 (PDT)
X-Received: by 10.200.34.39 with SMTP id o36mr5016690qto.189.1491959867255;
        Tue, 11 Apr 2017 18:17:47 -0700 (PDT)
Return-Path: <cota@braap.org>
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com. [66.111.4.25])
        by mx.google.com with ESMTPS id u28si17906848qkl.160.2017.04.11.18.17.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Apr 2017 18:17:47 -0700 (PDT)
Received-SPF: pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) client-ip=66.111.4.25;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@braap.org;
       dkim=pass header.i=@messagingengine.com;
       spf=pass (google.com: domain of cota@braap.org designates 66.111.4.25 as permitted sender) smtp.mailfrom=cota@braap.org
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
	by mailout.nyi.internal (Postfix) with ESMTP id 9BE7B20B63;
	Tue, 11 Apr 2017 21:17:46 -0400 (EDT)
Received: from frontend2 ([10.202.2.161])
  by compute4.internal (MEProxy); Tue, 11 Apr 2017 21:17:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=braap.org; h=cc
	:date:from:message-id:subject:to:x-me-sender:x-me-sender
	:x-sasl-enc:x-sasl-enc; s=mesmtp; bh=d4wA/DNhCPFc/tGISppLLg2CDMm
	aAwJS2DA2HPUeFFQ=; b=KZIjODO/qh5tvJA+ccgW4lTz+fPyWYcoplMT7/dX855
	kiXZFYr4Qtxc8xhOtcJruSCwAOvfJMJaGHMEXZ1U0ElgN531KYgcsQgIHVNuTNiC
	dQ+yhZbzRdchtk38s7GBpzWx9+Jr6hfI0CluehQbDF5SU2DM75zliBN6ZiDI+y0k
	=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:date:from:message-id:subject:to
	:x-me-sender:x-me-sender:x-sasl-enc:x-sasl-enc; s=fm1; bh=d4wA/D
	NhCPFc/tGISppLLg2CDMmaAwJS2DA2HPUeFFQ=; b=H53hhBQ8SR0f0BeoVC9d9h
	o006aup8lPJ8kyorDBlX3euAAwp6iyvUtd9LhTroy6LZ+/1ohsJJDsmY2lA2YfzO
	tAldMwvdhZnXQtHO07NfQHHreOAZksoLe1tk9PEv+SnisiUbWTzY8w5DpSRp/oVw
	UtWfRFNTqnp06aD0Tsxe65J5CV3flAaES1SgnVjq5qDankeyS6Ofm/u5hxlktZWN
	HMMkZLqMP5C22PB9k9tWTsfEjnDl8+Dwg+iWsAGzffBdjYsRbtHeb7YPaCT1N6fO
	+vNkcSpIGpfr96TGNv7c5sk/gJR1Do1yOFyjtDaNbrZro6w4RTdhKGZvfyAiVgQg
	==
X-ME-Sender: <xms:OoDtWLseVRyzU3Ys1zWGp9B4v4Yrbha9RNioYJu6P7_v69DfOhgQgw>
X-Sasl-enc: lc4c70W2fhoGkKUDWmOtgQkKErDIxaFwR3n+DYN/qAw9 1491959866
Received: from localhost (flamenco.cs.columbia.edu [128.59.20.216])
	by mail.messagingengine.com (Postfix) with ESMTPA id 586D624432;
	Tue, 11 Apr 2017 21:17:46 -0400 (EDT)
From: "Emilio G. Cota" <cota@braap.org>
To: qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Peter Crosthwaite <crosthwaite.peter@gmail.com>,
	Richard Henderson <rth@twiddle.net>,
	Peter Maydell <peter.maydell@linaro.org>,
	Eduardo Habkost <ehabkost@redhat.com>,
	Claudio Fontana <claudio.fontana@huawei.com>,
	Andrzej Zaborowski <balrogg@gmail.com>,
	Aurelien Jarno <aurelien@aurel32.net>,
	Alexander Graf <agraf@suse.de>,
	Stefan Weil <sw@weilnetz.de>,
	qemu-arm@nongnu.org,
	alex.bennee@linaro.org,
	Pranith Kumar <bobby.prani+qemu@gmail.com>
Subject: [PATCH 00/10] TCG optimizations for 2.10
Date: Tue, 11 Apr 2017 21:17:20 -0400
Message-Id: <1491959850-30756-1-git-send-email-cota@braap.org>
X-Mailer: git-send-email 2.7.4
X-TUID: AnYnM6NAi9cA

Hi all,

This series is aimed at 2.10 or beyond. Its goal is to improve
TCG performance by optimizing:

1- Cross-page direct jumps (softmmu only, obviously). Patches 1-4.
2- Indirect branches (softmmu and user-mode). Patches 5-9.
3- tb_jmp_cache hashing in user-mode. Patch 10.

I decided to work on this after reading this paper [1] (code at [2]),
which among other optimizations it proposes solutions for 1 and 2.
I followed the same overall scheme they follow, that is to use helpers
to check whether the target vaddr is valid, and if so, jump to its
corresponding translated code (host address) without having to go back
to the exec loop. My implementation differs from that in the paper
in that it uses tb_jmp_cache instead of adding more caches,
which is simpler and probably more resilient in environments
where TLB invalidations are frequent (in the paper they acknowledge
that they limited background processes to a minimum, which isn't
realistic).

These changes require modifications on the targets and, for optimization
number 2, a new TCG opcode to jump to a host address contained in a register.

For now I only implemented this for the i386 and arm targets, and
the i386 TCG backend. Other targets/backends can easily opt-in.

The 3rd optimization is implemented in the last patch: it improves
tb_jmp_cache hashing for user-mode by removing the requirement of
being able to clear parts of the cache given a page number, since this
requirement only applies to softmmu.

The series applies cleanly on top of 95b31d709ba34.

The commit logs include many measurements, performed using SPECint06 and
NBench from dbt-bench[3].

Feedback welcome! Thanks,

		Emilio

[1] "Optimizing Control Transfer and Memory Virtualization
in Full System Emulators", Ding-Yong Hong, Chun-Chen Hsu, Cheng-Yi Chou,
Wei-Chung Hsu, Pangfeng Liu, Jan-Jan Wu. ACM TACO, Jan. 2016.
  http://www.iis.sinica.edu.tw/page/library/TechReport/tr2015/tr15002.pdf

[2] https://github.com/tkhsu/quick-android-emulator/tree/quick-qemu

[3] https://github.com/cota/dbt-bench
