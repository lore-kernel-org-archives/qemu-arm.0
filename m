Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CEFB3CCA476
	for <qemu-arm@archiver.kernel.org>; Fri, 10 Oct 2025 13:45:37 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1v7DOY-000275-V4; Fri, 10 Oct 2025 09:43:01 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DOS-00026J-Ky
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 09:42:50 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1v7DOC-0007gY-Gk
 for qemu-arm@nongnu.org; Fri, 10 Oct 2025 09:42:42 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3ecde0be34eso1652776f8f.1
 for <qemu-arm@nongnu.org>; Fri, 10 Oct 2025 06:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1760103748; x=1760708548; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wOPl/nrAi0ixH4lZrdaPSGiz7HUM8lbVEHaB1k/Dl1M=;
 b=eS/lSaRYaNKKaW8M/FhZGoZLyZJ8BSLKVtMsbzquuoJPqsGvW3BWjWTS1Bwrf7L2TR
 MxRlh8bL9KR1Q/WysY53OFLCf3iREKX/hoe5Gpbh4SjLU8FBsaACLA/v5OE7MSp3ZX5/
 q5/bfo5M57bnbq10WfStwRX2SPRJovXK4V2zANT0mfP69yIrHp+OMKkgqqPL9tEiYB7p
 TOREqCQ67PVkYcvWNhQxNDGGSEujc3+agErI39BdRf2aARNJ19j4mW9uREqPjn88qgEY
 DtOEOAgEQthJgkPKsIuGkq3S6FxfZKaq0wVsrRRwUYZ5etlMwY+wfNfrBGqPycMWP2EF
 5jqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760103748; x=1760708548;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wOPl/nrAi0ixH4lZrdaPSGiz7HUM8lbVEHaB1k/Dl1M=;
 b=s/d8ycyYU+KPA8vdBhNlrBEY5qaerAb6viqK25FvW9st+fcAnU38aB8v5JcPhonoVQ
 L+ML6Xz7TVRT5U+MfnK5tZ4ep0Y6y+OLRUUTXP2tPs9sJT31W201Sk8UZQcYhq9I81ns
 z0SqDE285gii9IbUcYEjMgiLnikz9uQDRi8boUWcEN/2rmWVM6oOceT9aJRm4ULnYOxS
 hkGRYyUR0Sq8Aa1xmW5RgWj5rsLfy1P4suFIgkgVMSyX30AlCUWpo32zdX8MQMYQXPI7
 DuyqD1ym1XugUeXIwbVDJb7wNImJtZDdnAyRq/c+HHlGa6l1cN6xkUJXmeiGPUw/p8u9
 C6Sg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcE408oRADQ1P687ke6YFLg4v6zdsclVVbWdjpz6DjQ4WbzFpeI4Uc+pugQUmfOlbIhCuc9yE/BQ==@nongnu.org
X-Gm-Message-State: AOJu0YxJm4RKiAEjr7KRawqXr6s2FeH+KSH46IcQzAWqU8+uiz+DaZ6p
 asxaEbu+5lVrWIveOY7w5hH+UPuLGBfUmXf+aR70yclQgtu8b1ZnvoDR878v9seZFvM=
X-Gm-Gg: ASbGnctiDwTlQQXhfS1vNe/M//8RZGKS1e/uifzfr4I7XQynSe7IuabfExtcZ/O1FdT
 Ird3Pxy235gjOcqmPPeybxxj/3MDhO0SpxphZga6L6GtVqbuJE4eobDIOSOVigKwRnFkQ0PnHsf
 j9XiKmXJDk6eekUqH4QZ1b54XqA8nERurorGpk00H6icJ7DSuWDe9MSJU8LPiAgIUl+FBu/OKgf
 iP036vrpvmnLNfXUU22Vwjn+RU9dzXTdr9ToWfvB96Oi+xC0FZnPGPu9qEG5ue9dUV2XIfzOES1
 Ce7vEk94VvwEURN6ML7SOCCghWnLLthAJ+8w0DolwE5hxMJTqMtM/IYzVQtNBgu0Em9HZ8035Un
 mobycc65ncWaTVG/eD4l3UOunyl+FcGQ9JfhTJExTqaPg1k1n2ykVTayO/ggL3qzdMVa1UeIa/Q
 koBXX3jiCUGQ/AjxVWuY8=
X-Google-Smtp-Source: AGHT+IE9Xse/TMz9zXvsaEJIYNMbgxnXqwWpoHcfcvrcXhGLo97dN4HXchfSpA412NSEcUNe5pY/qA==
X-Received: by 2002:a05:6000:4027:b0:401:2cbf:ccad with SMTP id
 ffacd0b85a97d-425829e78e9mr11277587f8f.17.1760103748337; 
 Fri, 10 Oct 2025 06:42:28 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce5e83e1sm4395867f8f.51.2025.10.10.06.42.27
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 10 Oct 2025 06:42:27 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-ppc@nongnu.org, qemu-arm@nongnu.org, qemu-riscv@nongnu.org,
 qemu-s390x@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/16] overall: Replace HOST_BIG_ENDIAN #ifdef with runtime
 if() check
Date: Fri, 10 Oct 2025 15:42:09 +0200
Message-ID: <20251010134226.72221-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
X-Spam_score_int: 4
X-Spam_score: 0.4
X-Spam_bar: /
X-Spam_report: (0.4 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1, DKIM_VALID=-0.1,
 DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1, RCVD_IN_DNSWL_NONE=-0.0001,
 SPF_HELO_NONE=0.001, SUSPICIOUS_RECIPS=2.51,
 T_SPF_TEMPERROR=0.01 autolearn=no autolearn_force=no
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

Replace compile-time #ifdef with a runtime check to ensure all code
paths are built and tested. This reduces build-time configuration
complexity and improves maintainability.

No functional change intended.

Philippe Mathieu-Daudé (16):
  linux-user/arm: Checkpatch style cleanups
  linux-user/arm: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
  ui: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
  net: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
  disas: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
  hw/core/loader: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
  hw/display: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
  hw/virtio: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
  target/alpha: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
  target/arm: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
  target/mips: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
  target/ppc: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
  target/riscv: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
  target/s390x: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
  target/sparc: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check
  util/bitmap: Replace HOST_BIG_ENDIAN #ifdef with runtime if() check

 include/hw/virtio/virtio-access.h       |   6 +-
 include/hw/virtio/virtio-gpu-bswap.h    |   6 +-
 target/arm/cpu.h                        |   8 +-
 target/arm/tcg/translate-a64.h          |   5 +-
 disas/disas-host.c                      |   6 +-
 hw/core/loader.c                        |   5 +-
 hw/display/artist.c                     |  12 +-
 hw/display/vga.c                        |  20 +-
 hw/display/virtio-gpu-gl.c              |   8 +-
 hw/display/virtio-gpu-rutabaga.c        |   8 +-
 hw/virtio/vhost.c                       |   7 +-
 linux-user/arm/nwfpe/double_cpdo.c      |  12 +-
 linux-user/arm/nwfpe/fpa11_cpdt.c       |  77 +-
 net/net.c                               |  14 +-
 target/alpha/translate.c                |  11 +-
 target/arm/tcg/sve_helper.c             |  10 +-
 target/arm/tcg/translate-sve.c          |  22 +-
 target/arm/tcg/translate-vfp.c          |   8 +-
 target/arm/tcg/translate.c              |   6 +-
 target/mips/tcg/msa_helper.c            | 889 ++++++++++++------------
 target/ppc/arch_dump.c                  |   9 +-
 target/ppc/int_helper.c                 |  28 +-
 target/ppc/kvm.c                        |  25 +-
 target/riscv/vector_helper.c            |  32 +-
 target/s390x/tcg/translate.c            |   6 +-
 target/sparc/vis_helper.c               |  18 +-
 ui/vdagent.c                            |  16 +-
 ui/vnc.c                                |   6 +-
 util/bitmap.c                           |  19 +-
 target/ppc/translate/vmx-impl.c.inc     |  14 +-
 target/ppc/translate/vsx-impl.c.inc     |   6 +-
 target/riscv/insn_trans/trans_rvv.c.inc |  16 +-
 target/s390x/tcg/translate_vx.c.inc     |   6 +-
 tcg/ppc/tcg-target.c.inc                |  24 +-
 34 files changed, 656 insertions(+), 709 deletions(-)

-- 
2.51.0


