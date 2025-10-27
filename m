Return-Path: <qemu-arm-bounces+qemu-arm=archiver.kernel.org@nongnu.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from lists.gnu.org (lists.gnu.org [209.51.188.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5984CCF9EA
	for <qemu-arm@archiver.kernel.org>; Mon, 27 Oct 2025 12:37:25 +0000 (UTC)
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1vDMTD-0005Ko-2b; Mon, 27 Oct 2025 08:37:07 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDMTA-00058P-QZ
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 08:37:04 -0400
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1vDMT2-0006Fc-Nz
 for qemu-arm@nongnu.org; Mon, 27 Oct 2025 08:37:03 -0400
Received: by mail-wr1-x429.google.com with SMTP id
 ffacd0b85a97d-3ece1102998so3276548f8f.2
 for <qemu-arm@nongnu.org>; Mon, 27 Oct 2025 05:36:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1761568606; x=1762173406; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZmMNH1Y87swIVdIWCYHcdCqVlv4sKMHJmPkKp3l+JAE=;
 b=MYWA72XzuC0eWBR05c7l7EbdvQMahrknaL3aQmMTGi2NH9U43GO6v3YH1bUNogU8c6
 gVmpPftc54ZX8KQiagVJBqlpZoLIuW7y67pc+feUKlOC1lQ+UW51YM5Yk6J6fH1u0EFC
 qVVlQtOmMhL7cRY5CJlS7Vbfo1FaaXySqCfcUrkxmKSdP65pNbIL+DNq+bfqyamq3KC7
 lYu/CsK8GqaQoS/yfQc2rMOR/MLkCemVF31D7k/jHg1lO4DLtJ/P64Ms1yBaB8GJwEAU
 Y4pOpgOpXQ95jS2QNPJmUvhQTS4FetzFLh4IfEvVIHuKzthikEUU/S5O8DGdFXXiDglP
 7VqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761568606; x=1762173406;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZmMNH1Y87swIVdIWCYHcdCqVlv4sKMHJmPkKp3l+JAE=;
 b=htrUQhbykue7kWahDKoQmSMABKvac2Rf1lqELfCIGdsaAtWl6RVlD+dskUNlTlVy1y
 43mXdmqKIx8JX9AJ7iFFQLVWGup8zD57p2sAoGzlQ+RwjcLDeUeVuXXtw0e15NIDImGu
 rs1FN7KGTvILj38Grj9+VKnPud2ELoqUNm8xkxtF86bcR5XyXPK8pWiu3ylsF24/uLi7
 kFttf5+Ri90cECE6fNNoa2NWHK5seFBx/OHuwc2WQMLAT32HSpLufYH0HIXsvh1YUFxd
 taQ5t9VJHi0Q8A1Y+QF52jNli0AYaPWqM6lHKGOr1iM93Tq3QhgtkF57swEEPrAsJwBp
 V7dg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUsxQ/l2uNr/SpeqBu89gUuAJTG/M503Id803HxoemjLQN1fX2loLt6hYJXzbKk6qKlTtEe6lv1LA==@nongnu.org
X-Gm-Message-State: AOJu0YyjMKjfUSsd4fxOAU7J0TFlactxqKZU+w6Z30w+9no7SLyrjQqi
 dEWkkFAMnm/+mIFPTDd+ELaIf6P4pIp8RRpyD1zxUpmayCs6sdp9lgEpCNLu7gugnqA=
X-Gm-Gg: ASbGncuiD09SXwsz6J9uqU4F82ptLlR7l8ggydUQH96700sbmJpYD26j7WeJxGdQRZ5
 YKxeDsQVTWXhQN1Jihn8ECxWDo6oe7r5y1Aam+cGHdQGdoJ/hcWtnHAfM95XrxpqMFICcGjbvO8
 /SI/2I0DNA4trtt7YpTf05QvZTvE5VrNVifZ7Ggtl5HThhbIPl3wV5Rhqbwps7E/qLmgGeJKZ8Z
 iBNfdjaNgn5MOm2IoKv5QAUkD/SEOF8jugTlWdkkqLfiqT/gRnYjxV5/XDUVLPkEUpLgqNGoNHi
 UrugQX/WUsxAjClzqKUuufnWFD3ZhIsAWiNJkP2AJUw+aBg8xyEUNTSx3TSsbQgxXCzs18UFc86
 /U9s/toWkrLFPD8m5QKGvqVEwfz8c2DKgKmcDo00LgfDG9hveq3p2qFqEd1daStaQl86mVINzHB
 P/+TggYFUpfNMojVI1TESwEypFpVplcscVyauFpPTa+3Vt+UsHYA==
X-Google-Smtp-Source: AGHT+IGdP4VevcIfO5jRH3vkn6QGYzrBMioVhxD4uFLisrsCOPgle1Zke5+VZ7/asnWDfOAoAFPImA==
X-Received: by 2002:a05:6000:2c09:b0:427:9a9:462b with SMTP id
 ffacd0b85a97d-4298a04e65emr10290870f8f.18.1761568606087; 
 Mon, 27 Oct 2025 05:36:46 -0700 (PDT)
Received: from localhost.localdomain (88-187-86-199.subs.proxad.net.
 [88.187.86.199]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-429952de971sm14053377f8f.39.2025.10.27.05.36.44
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 27 Oct 2025 05:36:45 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Joel Stanley <joel@jms.id.au>, qemu-arm@nongnu.org,
 =?UTF-8?q?C=C3=A9dric=20Le=20Goater?= <clg@kaod.org>,
 David Hildenbrand <david@redhat.com>, Gerd Hoffmann <kraxel@redhat.com>,
 Peter Maydell <peter.maydell@linaro.org>, Troy Lee <leetroy@gmail.com>,
 Paolo Bonzini <pbonzini@redhat.com>, Helge Deller <deller@gmx.de>,
 Mark Cave-Ayland <mark.cave-ayland@ilande.co.uk>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 Steven Lee <steven_lee@aspeedtech.com>,
 Andrew Jeffery <andrew@codeconstruct.com.au>, Peter Xu <peterx@redhat.com>,
 Artyom Tarasenko <atar4qemu@gmail.com>,
 Jamin Lin <jamin_lin@aspeedtech.com>
Subject: [PATCH 0/6] hw: Log unassigned MMIO accesses with unassigned_mem_ops
Date: Mon, 27 Oct 2025 13:36:37 +0100
Message-ID: <20251027123644.63487-1-philmd@linaro.org>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::429;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x429.google.com
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

Do not log unassigned MMIO accesses as I/O ones:
expose unassigned_mem_ops then use it instead of
unassigned_io_ops.

Philippe Mathieu-Daudé (6):
  system/memory: Expose unassigned_mem_ops symbol
  hw/display/vga: Log unassigned MMIO accesses with unassigned_mem_ops
  hw/pci-host/gpex: Log unassigned MMIO accesses with unassigned_mem_ops
  hw/pci-host/aspeed: Log unassigned MMIO accesses with
    unassigned_mem_ops
  hw/pci-host/astro: Log unassigned MMIO accesses with
    unassigned_mem_ops
  hw/sparc64/ebus: Log unassigned MMIO accesses with unassigned_mem_ops

 include/system/memory.h    | 2 ++
 system/memory-internal.h   | 2 --
 hw/display/bochs-display.c | 2 +-
 hw/display/vga-pci.c       | 4 ++--
 hw/pci-host/aspeed_pcie.c  | 2 +-
 hw/pci-host/astro.c        | 2 +-
 hw/pci-host/gpex.c         | 2 +-
 hw/sparc64/sun4u.c         | 2 +-
 8 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.51.0


