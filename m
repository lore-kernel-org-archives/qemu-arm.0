Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp7533498njc;
        Tue, 12 Nov 2024 10:11:03 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWH701cNzRWifdSWb/gH5CtLVtSh0jygCuXtkJVp89P9hzZaXQkV7gwquU09FfXTjckTv3yuNFPExK/cA==@linaro.org
X-Google-Smtp-Source: AGHT+IH11yDN5pasY9KpnbLc4n8HGudr+3FQXNe5ole7A4/JyaRqBACRWipx2Z35heZeY9gOlH4y
X-Received: by 2002:a05:622a:5e8c:b0:461:59:23cc with SMTP id d75a77b69052e-4634022def9mr39949471cf.25.1731435063713;
        Tue, 12 Nov 2024 10:11:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731435063; cv=none;
        d=google.com; s=arc-20240605;
        b=DTqt885vgKGqq8nNamOXJi6hU5L0c4HwXxIYLcb3yRiHKYAUqaoI21sQIiTXqgbrrv
         b7jjUQypglIUOsF6aF1ih2OTEtbBa1k+5Xh+ieW88Tj2I2Om/n9NlIwQaUKUeqfnjopY
         RQkC6a7SEa1nUfZF1VRYeXlCUCb46qU9dMpmOYOGBLvOqQl/VaZepVXqoLHDr4XlxB4V
         LBLwNykj/flz+lxyKaxQ4DzH09YCi5nr3bzBEuAklSLyF/hmdFP3ExxMinsS6Fhr9AUi
         gc1L6lp33H9pZthArQgBPCtD9KopU5G6wd/mr59tYve00MUigx5WsWyzVpKdIUDGMutU
         Lbzw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=02nbOPquIFIJqwULBYnSGnknsi6UNk1AXrz3sdcihGw=;
        fh=RigQCvpHTY1ubFn5I2zYQBEq2Lf+JnYQA3MJ/db3pFE=;
        b=beembc0LXbIZz2i8c36TmPjC1BUvn3JSlk0Cqt8f5w0ejmwbZpyfRRZfib9ZbSm9f0
         IvAUKgUtpq0YhSozpJrtH71Gestugm5c/VSOaKUB8HYUqzjS3ppL6dUjQKiZrSMFakZe
         WYnh6AkoVDmy6NWdgWnhPig81lUQI9gJIIF6ZTBS3aY+aaxLJVQ+7O+pQL/NMP8J6pYM
         +gdCCgksSvQ2Pkkpt7WKtuPzxb5PfA8G1a5pS9bD3+iCQdcmU8FGu5MVMXRjd/b48S/z
         Uw/S0oe+JF3dWTDxtPY8pl8mFFujpRChG3CbFA5nDtLFNPhZZM0hyfQ/f1zBV06VZM3a
         WhtQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rarw7PSr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff6260cdsi146692961cf.488.2024.11.12.10.11.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 12 Nov 2024 10:11:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=rarw7PSr;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1tAvLs-0004u9-PI; Tue, 12 Nov 2024 13:10:56 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvLp-0004tb-FZ
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:10:53 -0500
Received: from mail-lf1-x131.google.com ([2a00:1450:4864:20::131])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1tAvLn-0001rF-PU
 for qemu-arm@nongnu.org; Tue, 12 Nov 2024 13:10:53 -0500
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-539e63c8678so6998786e87.0
 for <qemu-arm@nongnu.org>; Tue, 12 Nov 2024 10:10:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731435050; x=1732039850; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=02nbOPquIFIJqwULBYnSGnknsi6UNk1AXrz3sdcihGw=;
 b=rarw7PSrqk/FXhgqVnYkquTy6QhaKAyRQZxmWPh9HGLkixNfoKETP8fqmEiTW+HSfA
 l96GXsDRrDOsnzyB2+ldqvouTJVr7J/dk02HLkodUovIZsXp9pyIXbAVnjpf4tiB2fsU
 /cBYknTlMwr/mSp74+XTGCdk4kpCN/l8fk8MCMxJFPpS1NcU2xLwB9Uwvtv16cNTue5m
 v5QzhKUbMZclDD5C9fEvQueXuRswkxO7ShC3myJHr7JZ8FNI1roqpxqyhWcFrcw/fiTt
 EBe4q6+a5HvMI/SLPYJ43dc52quwD7neM6W26bHLPwIKV4J5OIiMvf0uMAyrBH7AAhHP
 erTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731435050; x=1732039850;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=02nbOPquIFIJqwULBYnSGnknsi6UNk1AXrz3sdcihGw=;
 b=G65s7zDTtScHfSaYs7kmDGtXTPSohmhGuLCzuCYrv9Ltdq+nlyx1nd+60XwqP1qs98
 LWhe6+wqe4r/yUhzc0HMxVmO1GPicqHYEii230uxAJUTO4aQ8TI5mgcyHwAkCubnbYBv
 UDeE6l0D2nC4+84K5I1BpXjj83Kfzhgqs43d40Su57yfwg2zXHf87+fIGu/lFurk/m12
 uK0ZrkxtimeztBSgXsXe1ZBFPV5UCUbneW951T61NkNhA+124Tkwoa8o9dd1g6KTAC8S
 pEn+NrsPFB+oG9SyGw+Ho9uabRow1vnZf2H0yuRx94Xdk3QjpWBw663IDPLCWdzXfzXw
 TTXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUq36gY8CbDolXI/khKmlsuLgBZNO3dY7+PamYMNF9H4rfB86kbY2BJbRbuiSUJ2V2W7BdTHM86TA==@nongnu.org
X-Gm-Message-State: AOJu0Yw2Dnm20MqkTaL9BtWQOoMz0LR4t4uJiAU3eI4S8UO802zoZpF+
 QGxtAIuEzGuX6hyXPKvns2HpYDUB85mJYuLaGT5zvM0c7/Rorix8sgqGF61JArk=
X-Received: by 2002:a05:6512:3d29:b0:539:8fcd:510 with SMTP id
 2adb3069b0e04-53d862d3b19mr8737610e87.20.1731435049416; 
 Tue, 12 Nov 2024 10:10:49 -0800 (PST)
Received: from localhost.localdomain
 (cnf78-h01-176-184-27-250.dsl.sta.abo.bbox.fr. [176.184.27.250])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b0562ccdsm214644345e9.23.2024.11.12.10.10.47
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 12 Nov 2024 10:10:48 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Richard Henderson <richard.henderson@linaro.org>,
 Peter Maydell <peter.maydell@linaro.org>, Anton Johansson <anjo@rev.ng>,
 Jason Wang <jasowang@redhat.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 Thomas Huth <thuth@redhat.com>, Alistair Francis <alistair@alistair23.me>,
 Paolo Bonzini <pbonzini@redhat.com>,
 Gustavo Romero <gustavo.romero@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH 00/20] hw/net/xilinx_ethlite: Map RAM buffers as RAM and
 remove tswap() calls
Date: Tue, 12 Nov 2024 19:10:24 +0100
Message-ID: <20241112181044.92193-1-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::131;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x131.google.com
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
Errors-To: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
Sender: qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org
X-TUID: ROfIGhbwhf7o

This is the result of a long discussion with Edgar (started few
years ago!) and Paolo:
https://lore.kernel.org/qemu-devel/34f6fe2f-06e0-4e2a-a361-2d662f6814b5@redhat.com/
After clarification from Richard on MMIO/RAM accesses, I figured
strengthening the model regions would make things obvious,
eventually allowing to remove the tswap() calls for good.

This costly series mostly plays around with MemoryRegions.

The model has a mix of RAM/MMIO in its address range. Currently
they are implemented as a MMIO array of u32. Since the core
memory layer swaps accesses for MMIO, the device implementation
has to swap them back.
In order to avoid that, we'll map the RAM regions as RAM MRs.
First we move each MMIO register to new MMIO regions (RX and TX).
Then what is left are the RAM buffers; we convert them to RAM MRs,
removing the need for tswap() at all.

Once reviewed, I'll respin my "hw/microblaze: Allow running
cross-endian vCPUs" series based on this.

Please review,

Phil.

Philippe Mathieu-Daudé (20):
  hw/microblaze: Restrict MemoryRegionOps are implemented as 32-bit
  hw/net/xilinx_ethlite: Convert some debug logs to trace events
  hw/net/xilinx_ethlite: Remove unuseful debug logs
  hw/net/xilinx_ethlite: Update QOM style
  hw/net/xilinx_ethlite: Correct maximum RX buffer size
  hw/net/xilinx_ethlite: Map MDIO registers (as unimplemented)
  hw/net/xilinx_ethlite: Rename rxbuf -> port_index
  hw/net/xilinx_ethlite: Add addr_to_port_index() helper
  hw/net/xilinx_ethlite: Introduce txbuf_ptr() helper
  hw/net/xilinx_ethlite: Introduce rxbuf_ptr() helper
  hw/net/xilinx_ethlite: Access RX_CTRL register for each port
  hw/net/xilinx_ethlite: Access TX_GIE register for each port
  hw/net/xilinx_ethlite: Access TX_LEN register for each port
  hw/net/xilinx_ethlite: Access TX_CTRL register for each port
  hw/net/xilinx_ethlite: Map RX_CTRL as MMIO
  hw/net/xilinx_ethlite: Map TX_LEN as MMIO
  hw/net/xilinx_ethlite: Map TX_GIE as MMIO
  hw/net/xilinx_ethlite: Map TX_CTRL as MMIO
  hw/net/xilinx_ethlite: Map the RAM buffer as RAM memory region
  hw/net/xilinx_ethlite: Rename 'mmio' MR as 'container'

 hw/char/xilinx_uartlite.c |   4 +
 hw/intc/xilinx_intc.c     |   4 +
 hw/net/xilinx_ethlite.c   | 357 ++++++++++++++++++++++++--------------
 hw/timer/xilinx_timer.c   |   4 +
 hw/net/trace-events       |   4 +
 5 files changed, 246 insertions(+), 127 deletions(-)

-- 
2.45.2

