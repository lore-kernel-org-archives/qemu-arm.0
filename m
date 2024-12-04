Received: by 2002:a17:504:d692:b0:1be9:327d:8ee3 with SMTP id na18csp488686njb;
        Wed, 4 Dec 2024 12:26:49 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWjlubN154WQi2isWcU8FMRv9tyBymVDN+MRi96GnaDp4s3kMjk+WP2OoA/fL0XVUT5H/Klsz7xVrZGyw==@linaro.org
X-Google-Smtp-Source: AGHT+IGVquxC0pXsW/j6/R+4AriG8E1NjtWSZdkEBZJU8GISSeoyvUnfp2VhpqgrgfhKgPU58nux
X-Received: by 2002:a05:620a:3712:b0:7b1:4f5c:a3a3 with SMTP id af79cd13be357-7b6a6217806mr914917585a.56.1733344009717;
        Wed, 04 Dec 2024 12:26:49 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1733344009; cv=none;
        d=google.com; s=arc-20240605;
        b=Ghu2oFm22O1LHcQVBnR8MF0YdZ9IcQ4+tVGURhl6MfxWZcDNAS6vBDfd/chdR68U8F
         1xUb86PdFy5IRW8TMp+7j/wYt7G+EvHARP1GaYzzYxmGoHja9TGqH+P8oEhwRkgkBaDk
         BmIrDU44qVyhNLj+fYLYT9/aYjEfJqsHq1JM/r45tsho6xw8QSTgLh0BmDg/lADNrjKf
         wPeBSrHxWuIBrFyUav4L46DASd0d0b4JyBahDm9iOqSdiHTGzhlzu7vXh3RhLTlNfPcb
         o/BjxJ5ELTIIk6cRfF8+3l0G6d5YxjktswJ/GtyR0g+JsDLfe/rc1hS29lT0IDFRN91z
         w7IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=DhO9ZHtI42fdFY6GyTi3t0JXDrc7gbNjrWZfda3d/Ps=;
        fh=L8jp5KII9BO+EuE1/Uny/8be6w87XhXr9oO98kXieYU=;
        b=hU3cStU0LRrc8LL/cnnFVSE8jTCnPftd38WBengqEKr7Z6dFoL0FtzNkTY38dhkLhC
         58fCXCJq2kYUl8dvIUUMYQAD6gLMAjMPTOTfPLPt7B6pw9fu251oRR+Pxy7a66nsYmgv
         I85cmYPOXooGfPFZdMwEUC01rNq1K2q0tRA9NRfbC1fkkMqBotjradu3lIVBZD3LAe9s
         Jy2X2d7omBECURutRGSu/l5ZJMlpMsP3ZJ42Z0SRUyObHf7GwiqLlgI2OSH+tOy9SlNk
         mSogNFJEH/R5xS/yyy+jm5Q/i2KmcZRWuB2O6ilg5l3s9SiVzlWsewUhyFJpZBGufziR
         cdAQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GSR/bPSZ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b6849f2605si1772906485a.644.2024.12.04.12.26.49
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 04 Dec 2024 12:26:49 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b="GSR/bPSZ";
       spf=pass (google.com: domain of qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-devel-bounces@nongnu.org>)
	id 1tIvwq-0007O5-IK; Wed, 04 Dec 2024 15:26:12 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvwp-0007Nf-4t
 for qemu-devel@nongnu.org; Wed, 04 Dec 2024 15:26:11 -0500
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tIvwm-0006yY-Hp
 for qemu-devel@nongnu.org; Wed, 04 Dec 2024 15:26:10 -0500
Received: by mail-wm1-x329.google.com with SMTP id
 5b1f17b1804b1-4349f160d62so1360425e9.2
 for <qemu-devel@nongnu.org>; Wed, 04 Dec 2024 12:26:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733343966; x=1733948766; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=DhO9ZHtI42fdFY6GyTi3t0JXDrc7gbNjrWZfda3d/Ps=;
 b=GSR/bPSZNeP62KvTHD2vgsBCCEel8fYhQ6WAbRB3jFqCQ7BJRvipPNgY1zPAIXVtqe
 Jj+bU6p1lIhOI+EfjsJ8tF0CgMzou/SFS+1+XqKNVAsfSI/6U9xx9jCRfokSefGoRDKT
 T2TKSX6TRTMWpt101CxWFk3I8qP6XGRqmXxm+gKxUiN6Bybxhw56+mKSeTQ3LiWn8o8C
 d7UDPFAm+SunXPGBevlCvgRANrLf4OaEvMsVAqbKyPmW8dc6vWSy8/4D5Pi2qfPTsaXq
 4IZPBtxZ7Vs/oYjpB9+/ezjB+V56Qss8GKFBP3qnKephmerclH0v4KEFw6OFzqn7LrRY
 r/Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733343966; x=1733948766;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DhO9ZHtI42fdFY6GyTi3t0JXDrc7gbNjrWZfda3d/Ps=;
 b=Hv2WPKabgIgTkxg4an9oPqs3yDE7UhkHSoysYm+Hkmh2Pc+VaLRYs3N2cM50Z7lJns
 4ps/RyCWo/OJoyDoPbl9I2nn4SlirXLn7m+N6hqBg+r3blA+u0Z1+cGi+DlSAJTB0uID
 BRDQ1IPWV7HviT4Jnb1SoOGPTT0kLUUUeCrH9J/ISd/efLNqMQXufdrGbDNeXSpn4M2n
 3JapabNcmTXje+UbpoSoBQ99qE4H6PA8r6/PyCt8QjZ72ckVgAdIBb5E4yX1A3tN5rCp
 K70VZJGbW6zBn8Z6a7EWxN7NVfaLl0vBfMm4U1gsdJIpWNM3lrdUYqoJWVBbzqfq0bqB
 P8sg==
X-Gm-Message-State: AOJu0YxiLhEdVXP7QckzkEBpCGsy+djDaaV0hADgpsqR1g5ZKuWyGPJh
 DVGFZE/gWwR5vho/tE1Q1ec1tq9BQqlJH8SsKKpwtlNcfdSeu8G+xJ52mSfipbNWfDXIZfhJpT2
 D
X-Gm-Gg: ASbGnct6fkI62YaxMmeFwDaiMKb8NbIGp9WKGGtS+BZ2TZptmReMC7qH3GPdL/ZUg+Q
 thnCDY7Srlgp0/IrsTbOH2GNZUyMXJgXX/Tta7w7cTu2yn/kcGaDtlJ4EDGXwSTUexvLGL0SgAu
 O7dhyuyFYGOjXkdI0VL52dfpI83E4K+Q/EwGAD0iGU0+cU3B7SIiyDjbWOuN+W4PjXM+GGYmxOA
 fJG6xGjNN05eNhqMGOP5Ulpxc7dzNGuONT/vR82ZK9r5C5dqKDVQdeuV56u7ccO14OAr2SdFwhy
 bt6zLYBB3jObEsiE2xn4npcR
X-Received: by 2002:a05:6000:4025:b0:385:f417:ee46 with SMTP id
 ffacd0b85a97d-385fd3c5666mr6848938f8f.2.1733343966453; 
 Wed, 04 Dec 2024 12:26:06 -0800 (PST)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-385e5b10478sm13671714f8f.73.2024.12.04.12.26.04
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 04 Dec 2024 12:26:05 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Daniel Henrique Barboza <dbarboza@ventanamicro.com>,
 "Michael S. Tsirkin" <mst@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>,
 Laurent Vivier <lvivier@redhat.com>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 Alistair Francis <alistair.francis@wdc.com>, Anton Johansson <anjo@rev.ng>,
 Zhao Liu <zhao1.liu@intel.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 David Hildenbrand <david@redhat.com>, qemu-s390x@nongnu.org,
 Max Filippov <jcmvbkbc@gmail.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Nicholas Piggin <npiggin@gmail.com>, qemu-arm@nongnu.org,
 Thomas Huth <thuth@redhat.com>, qemu-riscv@nongnu.org,
 Alistair Francis <alistair@alistair23.me>, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/20] target: Implement CPUClass::datapath_is_big_endian()
 handlers
Date: Wed,  4 Dec 2024 21:25:42 +0100
Message-ID: <20241204202602.58083-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::329;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x329.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=ham autolearn_force=no
X-Spam_action: no action
X-BeenThere: qemu-devel@nongnu.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: <qemu-devel.nongnu.org>
List-Unsubscribe: <https://lists.nongnu.org/mailman/options/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=unsubscribe>
List-Archive: <https://lists.nongnu.org/archive/html/qemu-devel>
List-Post: <mailto:qemu-devel@nongnu.org>
List-Help: <mailto:qemu-devel-request@nongnu.org?subject=help>
List-Subscribe: <https://lists.nongnu.org/mailman/listinfo/qemu-devel>,
 <mailto:qemu-devel-request@nongnu.org?subject=subscribe>
Errors-To: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-devel-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: iErGmSAEsWI8

The long term goal is to remove endianness knowledge from
QEMU system binaries, allowing them to run vCPU in any
endianness. For that target_words_bigendian(), TARGET_BIG_ENDIAN
and few other things (like MO_TE) must be removed.

Have each target implement a datapath_is_big_endian() handler
to express whether the CPU data is expected to be accessed in
big endian or not.

Few targets already provide a such functionality (ARM, PPC);
for some the data endianness is exposed via a CPU bit;
and for many the data endianness is fixed.

Use this handler in 3 places: disas/, the generic-loader
device and the VirtIO core layer.

Note, a similar CPUClass::codepath_is_big_endian() helper could
be useful for translator_ld/st_swap() API.

Philippe Mathieu-Daudé (20):
  exec/tswap: Rename target_words_bigendian -> qemu_binary_is_bigendian
  hw/core/cpu: Introduce CPUClass::datapath_is_big_endian() handler
  target/arm: Implement CPUClass::datapath_is_big_endian
  target/ppc: Register CPUClass::datapath_is_big_endian
  target/rx: Implement CPUClass::datapath_is_big_endian
  target/sparc: Implement CPUClass::datapath_is_big_endian
  target/riscv: Implement CPUClass::datapath_is_big_endian
  target/sh4: Expose CPUSH4State::little_endian property
  target/sh4: Implement CPUClass::datapath_is_big_endian
  target/microblaze: Implement CPUClass::datapath_is_big_endian
  target/mips: Implement CPUClass::datapath_is_big_endian
  target/xtensa: Implement xtensa_isa_is_big_endian()
  target/xtensa: Implement CPUClass::datapath_is_big_endian
  target: Implement CPUClass::datapath_is_big_endian (little-endian)
  target: Implement CPUClass::datapath_is_big_endian (big-endian)
  hw/core/cpu: Expose cpu_datapath_is_big_endian() method
  disas: Use cpu_datapath_is_big_endian()
  hw/core/generic-loader: Use cpu_datapath_is_big_endian()
  hw/virtio: Use cpu_datapath_is_big_endian()
  hw/core/cpu: Remove cpu_virtio_is_big_endian()

 include/exec/tswap.h             | 18 +++++++++---------
 include/hw/core/cpu.h            | 22 ++++++++++++----------
 include/hw/core/sysemu-cpu-ops.h |  8 --------
 include/hw/xtensa/xtensa-isa.h   |  1 +
 target/microblaze/cpu.h          |  2 ++
 target/sh4/cpu.h                 |  6 ++++++
 cpu-target.c                     |  2 +-
 disas/disas-common.c             |  3 +--
 hw/core/cpu-common.c             |  7 +++++++
 hw/core/cpu-sysemu.c             | 11 -----------
 hw/core/generic-loader.c         |  7 ++-----
 hw/display/vga.c                 |  4 ++--
 hw/virtio/virtio.c               |  4 ++--
 system/qtest.c                   |  2 +-
 target/alpha/cpu.c               |  6 ++++++
 target/arm/cpu.c                 |  4 ++--
 target/avr/cpu.c                 |  7 ++++++-
 target/hexagon/cpu.c             |  6 ++++++
 target/hppa/cpu.c                |  6 ++++++
 target/i386/cpu.c                |  6 ++++++
 target/loongarch/cpu.c           |  6 ++++++
 target/m68k/cpu.c                |  6 ++++++
 target/microblaze/cpu.c          | 11 +++++++++++
 target/mips/cpu.c                |  9 +++++++++
 target/openrisc/cpu.c            |  6 ++++++
 target/ppc/cpu_init.c            |  8 ++++----
 target/riscv/cpu.c               | 17 +++++++++++++++++
 target/rx/cpu.c                  | 10 ++++++++++
 target/s390x/cpu.c               |  6 ++++++
 target/sh4/cpu.c                 | 16 ++++++++++++++++
 target/sparc/cpu.c               | 15 +++++++++++++++
 target/tricore/cpu.c             |  6 ++++++
 target/xtensa/cpu.c              |  8 ++++++++
 target/xtensa/xtensa-isa.c       |  7 +++++++
 34 files changed, 205 insertions(+), 58 deletions(-)

-- 
2.45.2

