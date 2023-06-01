Received: by 2002:a17:906:fcb7:b0:974:3dd3:6e73 with SMTP id qw23csp405868ejb;
        Thu, 1 Jun 2023 05:33:38 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7ljLR7zyLXdwE1JcJ2LsKFc8JtkPcig9nxMjG0KzwEItuZoBNDgfuE1dE64D+Ftew3XwZk
X-Received: by 2002:a9d:7692:0:b0:6af:7491:d6e5 with SMTP id j18-20020a9d7692000000b006af7491d6e5mr4498789otl.17.1685622818285;
        Thu, 01 Jun 2023 05:33:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1685622818; cv=none;
        d=google.com; s=arc-20160816;
        b=nIeWD3ZqWIb1Zm4YX8Auufkb4GnWa7pM3FiK8pZ/+Jb5ieXJNXcEUJOOtd2oISK1fO
         sLfKtuamXIaIlIebuXJrH+9bXFBpSism2j/PXGPpjqNT1YiqZy/8KPhuABx12cRSL4lK
         GPcicJk3IWZNBEDuFaC9KrkBvpRvHa0IwyGWbfTcXJq7hn8aNdP3G7RmKIoCRoG6LxZS
         BI4quSXVHgMd6Jj1eeABoudUrntb6HuQ6hpS2+8Ir3+osVIZLRtL/kEwKBpvBnhQhAC/
         RQV2RHaA0Le0BAgSCkYT9g9zG6a1lsjSOupeKaWWrN+FhmCIvonqfxQC7jLxrZZn0Ci6
         XwHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature;
        bh=04k7UDpzzHvZhmJKA8/4wh8d6iuZQ7MQgKPo7ilBNpE=;
        b=t+mrL60IQt431rIzMSkVp9iQDVN73++8XSmoFg95XCJnbi6QjuIWBLsj/E10FUUnN8
         eQRLFDUMv8+5kWbpM4GbF9DZK0922dQViloH6cmfXnYmKWTFk1teoAhpq/eawpcdOhsO
         vnEvsgeoQXZzNCa7zLfFvG58lHWHbWxdC6XDJ8+znUQfUpedtcx+fApBhk2b50rqLQiX
         Iwn0y6Ppi4D6EsnVzvNGQ/+86HRXp7gu6Z5uRj/V2el0vBHhsvDguHICjlcjkXk3LHkB
         uExPpJVKNMf4nr4cUA+oQhf+oxlwI4EXr1JgKhBSKr4bHWALJToSLLw0E/VDUx5fMw9T
         OZcQ==
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=nYF5Z1V2;
       spf=pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Return-Path: <ardb@kernel.org>
Received: from dfw.source.kernel.org (dfw.source.kernel.org. [139.178.84.217])
        by mx.google.com with ESMTPS id h14-20020a9d600e000000b006ac9f392873si1557929otj.271.2023.06.01.05.33.37
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 01 Jun 2023 05:33:38 -0700 (PDT)
Received-SPF: pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) client-ip=139.178.84.217;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@kernel.org header.s=k20201202 header.b=nYF5Z1V2;
       spf=pass (google.com: domain of ardb@kernel.org designates 139.178.84.217 as permitted sender) smtp.mailfrom=ardb@kernel.org;
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=kernel.org
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id D583B64405;
	Thu,  1 Jun 2023 12:33:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E9E1C433D2;
	Thu,  1 Jun 2023 12:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1685622817;
	bh=rLxj2oUWIU5RgAo0EkYZR3VP3cndRSAtSYfcni3t3Kc=;
	h=From:To:Cc:Subject:Date:From;
	b=nYF5Z1V21by5bPs50EtqopAEpDg1gywM3ihhw9V9wnckO1GZS7cCdi+cocSlYNhZk
	 QeIvjhmcfTnuhGCdq3luIW05XpOK82LNXVDo56Frx1yafFx+YrdrLWqJOhW108A6kc
	 CYDCO9NUsn9BnkbUzTzWRHD9bnrhhDu6NhfKM6uvyTDrnIjVumWtO0hl76xSbiBPkj
	 Ul15/yFaDoVtToGn/+tCYyO+ripEH5SN+JPNGI42o2qC678kog4aUGzC/qs9DQIvTo
	 OUNRm/Di6AVXudMd0d3VtOW4JsjRbVMXpQmzDuNxrLtIargm7hCzIF/ADfHEQ1fKjC
	 Kc7sQBNnZHocA==
From: Ard Biesheuvel <ardb@kernel.org>
To: qemu-arm@nongnu.org
Cc: qemu-devel@nongnu.org,
	Ard Biesheuvel <ardb@kernel.org>,
	Peter Maydell <peter.maydell@linaro.org>,
	=?UTF-8?q?Alex=20Benn=C3=A9e?= <alex.bennee@linaro.org>,
	Richard Henderson <richard.henderson@linaro.org>,
	=?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <f4bug@amsat.org>
Subject: [PATCH 0/2] Implement PMULL using host intrinsics
Date: Thu,  1 Jun 2023 14:33:30 +0200
Message-Id: <20230601123332.3297404-1-ardb@kernel.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1613; i=ardb@kernel.org; h=from:subject; bh=rLxj2oUWIU5RgAo0EkYZR3VP3cndRSAtSYfcni3t3Kc=; b=owGbwMvMwCFmkMcZplerG8N4Wi2JIaVigkhwtbxr169I+/0mpbotosFPEk+phHLvsHLcpbldR XnK9EsdpSwMYhwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCKBqxj+Bzdt1D15h0e6RvT5 fF+mVy/sdrALTlFjEbi3Nenf/a7Kt4wMp7hLHfOPxGzKLmuNjGYtO5nGsPu9g6mXTWh6/vF9BYn MAA==
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TUID: M8A+z1nY8vIx

Another set of RFC patches - this time for 64x64->128 polynomial
multiplication. Playing round with this on top of the AES changes I sent
out earlier this week, I noticed that the speedup is rather substantial.

PMULL is relevant for GCM encryption, which combines AES in counter mode
with GHASH, which is based on multiplication in GF(2^128). The
significance of PMULL to this encryption mode is basically why PMULL is
part of the AES crypto extension on AArch64.

Note that user emulation on a AArch64 host of x86 binaries that perform
any kind of HTTPS communication under the hood would likely benefit from
this.

Again, this approach is likely too ad-hoc, but it helps span the space
of what we might want to cover in terms of host acceleration API. (I'm
not a TCG expert, but I guess this raises the question what to cover in
helpers and what to cover using native TCG ops?)

Cc: Peter Maydell <peter.maydell@linaro.org>
Cc: Alex Bennée <alex.bennee@linaro.org>
Cc: Richard Henderson <richard.henderson@linaro.org>
Cc: Philippe Mathieu-Daudé <f4bug@amsat.org>

Ard Biesheuvel (2):
  target/arm: Use x86 intrinsics to implement PMULL.P64
  target/i386: Implement PCLMULQDQ using AArch64 PMULL instructions

 host/include/aarch64/host/cpuinfo.h |  1 +
 host/include/i386/host/cpuinfo.h    |  1 +
 target/arm/tcg/vec_helper.c         | 26 +++++++++++++++++++-
 target/i386/ops_sse.h               | 24 ++++++++++++++++++
 util/cpuinfo-aarch64.c              |  1 +
 util/cpuinfo-i386.c                 |  1 +
 6 files changed, 53 insertions(+), 1 deletion(-)

-- 
2.39.2
