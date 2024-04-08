Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1300164ejh;
        Mon, 8 Apr 2024 07:17:57 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWPWqaS39tfWW0LdWwwzYTckX8U+5pc9MzHnj1DFEM84RAlePwsrp51B+DOFzPskGdmQSOpTiDdUTXp/0+maqFj5SSAdd7F
X-Google-Smtp-Source: AGHT+IGQLNAoVlADmYxIrEvI42ZrFqTt9NqAHpb7ugVlaYyePKpQoBN0czUvkjQc09wTntriy/3q
X-Received: by 2002:a05:6102:3f10:b0:478:248d:c6b8 with SMTP id k16-20020a0561023f1000b00478248dc6b8mr7503918vsv.29.1712585877286;
        Mon, 08 Apr 2024 07:17:57 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712585877; cv=none;
        d=google.com; s=arc-20160816;
        b=AzrPILz5wnZdM2c9WPsr+yulVp+HJMH1nfKgpSRGt57PJ3AeLqI/2XpSPgXJ7YoFME
         VK0rKuLdBb4PVPZaaio18RLuM4rhb2WeE6jsRfKB2Y4DnTpfaFQ7XXay8muQcWN15u2n
         8b/kwUyRPKE7AQdz6IY+Z4dGMk+yOoa18CeUz5IPNK2c2j+Bni1Mof1silSkB/DxdrNB
         TtkxqX8G7eNEDj7oEzupC8GnVx0FxMRjyBB0NFdJf1b85x2dtJA2o4QQmHVSDKGNbTtu
         3X5KPzt+pC/u3dHisg3RNkByERTXEUInX51mRlrBPhLXpcLeJepsfmyPlraLRUeKIAPg
         rbpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=tTrrjuqi39GdndcUSlrUx63rjA633KgDlIwvQVz3vGE=;
        fh=FJWalZsdUWu+tXHYFx1/x8vH4PHi3rDXJtsSpNoGsjA=;
        b=ABQPT2xO3z0Pywin2VyICcf4hEq3aDJeBt2pajgHqM/9gp+YBJf69AQh/z4hQ45RAY
         dQ1K9AAxMfEB3MBqLm4lcHiCyTpSO+uJBmF4irUowDi6scjYU8j7bU4b7Ssn0mve/4RF
         BIIS7Q3lmkKPFf9PSVJoZ/po6T42b9HnXbtosVmOUTvkPYeK2TcD8kOS/D6qkxTUow8u
         Gy1ilTMCzXGYOANiBfXxoQCo7UtbIqOnPNT0S5zlP4uO3H80Y0cMSGG0TpqHgByYEh59
         LZV5nrCyCQPm2yiqUdsTNcdCcVKmqpGqhLY2uQSsOZkoMljDUqbSbczsCQcY9EGXgByv
         nWQQ==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WGeTUGUh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id j26-20020a0561023e1a00b0047a0c92e0d0si141615vsv.823.2024.04.08.07.17.57
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Apr 2024 07:17:57 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=WGeTUGUh;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rtpoa-0001gZ-MN; Mon, 08 Apr 2024 10:17:41 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rtpoT-0001dY-UW
 for qemu-arm@nongnu.org; Mon, 08 Apr 2024 10:17:34 -0400
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rtpoO-0002vN-ML
 for qemu-arm@nongnu.org; Mon, 08 Apr 2024 10:17:33 -0400
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-516ab4b3251so4882382e87.0
 for <qemu-arm@nongnu.org>; Mon, 08 Apr 2024 07:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712585847; x=1713190647; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tTrrjuqi39GdndcUSlrUx63rjA633KgDlIwvQVz3vGE=;
 b=WGeTUGUhvODhtajlGZ76s226esBCCTVLBYhh2QyRMAII8mqMgBFstaBMn+HX9bN5kG
 W/SzLgdKVhvZ+itiIH2vLx7n7968KUqeykzrC4/mvLOTTendne7lB8Qy4841dIhUZGmp
 flSnvZ3qjnD+2/Pu4ibGwW91HaGakuQ9teA5/z2+rvHSj0tuXr77V81CF6Fwb4Xj57CN
 V1X3dHh3/IsoiiZuxKbkvMI9XuIYmEfteeOwTljzAbj0U+CTmOujsXE+qLw3MVCQBHaw
 7lM0LdZs8Zo2rKa1VXj9V+Lgt48b+Y+FVTZWn5y013EDcz9eswmMPvt46qVFWC6V4Epf
 4S8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712585847; x=1713190647;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tTrrjuqi39GdndcUSlrUx63rjA633KgDlIwvQVz3vGE=;
 b=vczPNoiev6FOtwt94XkHxQpggkaGEIuRbMz9uz0K5/emk+gacAjKzmXYGTbdAOpW0F
 k3js83av3axqAj19pEiJWj14uHRL2s6hJW+uMcKhiuBEXq2TF39gPTcRJQ2CAiYWNPsL
 NTp1V7zrSotJbDqyQrhR3RfdERCLnMC7rDwq1h17MnDzou3H+QYBlveHnH+SwZk/UlNd
 jmRv8CYpMD4tXhI12XcHzQNIlulPwysefkkphwnqi5ojcUYmZKtIVUFVZ3OQmjXIbBZo
 6bCLbSGT3jjmoe/tBtEF3hlqRrLkenqWe0eDrufZOGp8A52WRs5ewf6N1eSp5vEV+l+v
 A/2A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWGMykFOSJY0S8pSCeizpbxGI6Y/fzb23l+K2o8Z1umXJ9eys/+ShTiXO7MQFQwMw7LVE25xQDSWDTBkZw4VYeBMpyM
X-Gm-Message-State: AOJu0YzLeA/jqFMgb+PdXkW7n6beS9RjVMtqjS3DILwio3w4sc3+S5de
 qSsoNnTfNHsga1ESZh6EbBFdpByO4LZYE4dGnzmhLZSmnh/+b46nq0eEYaSFvco=
X-Received: by 2002:a05:6512:3c8e:b0:514:88df:88b9 with SMTP id
 h14-20020a0565123c8e00b0051488df88b9mr8747779lfv.45.1712585846534; 
 Mon, 08 Apr 2024 07:17:26 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.144.67])
 by smtp.gmail.com with ESMTPSA id
 ek15-20020a056402370f00b0056c3013485csm4115387edb.69.2024.04.08.07.17.25
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 08 Apr 2024 07:17:26 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Bin Meng <bin.meng@windriver.com>, qemu-arm@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alexander Bulekov <alxndr@bu.edu>, qemu-block@nongnu.org
Subject: [RFC PATCH-for-9.0? 1/2] hw/sd/sdcard: Avoid OOB in sd_read_byte()
 during unexpected CMD switch
Date: Mon,  8 Apr 2024 16:17:16 +0200
Message-ID: <20240408141717.66154-2-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240408141717.66154-1-philmd@linaro.org>
References: <20240408141717.66154-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::129;
 envelope-from=philmd@linaro.org; helo=mail-lf1-x129.google.com
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
X-TUID: 6jTOgIy9woju

For multi-bytes commands, our implementation uses the @data_start
and @data_offset fields to track byte access. We initialize the
command start/offset in buffer once. Malicious guest might abuse
by switching command while staying in the 'transfer' state, switching
command buffer size, and our implementation can access out of buffer
boundary. For example, CMD17 (READ_SINGLE_BLOCK) allows to read up to
512 bytes, and CMD13 (SEND_STATUS) up to 64 bytes. By switching from
CMD17 to CMD13 (see reproducer below), bytes [64-511] are out of the
'status' buffer.

Our implementation return R0 status code for unexpected commands.
Such in-transaction command switch is unexpected and returns R0.
This is a good place to reset the start/offset fields to avoid
malicious accesses.

Can be reproduced running:

  $ export UBSAN_OPTIONS=print_stacktrace=1:halt_on_error=1
  $ cat << EOF | qemu-system-i386 \
                     -display none -nographic \
                     -machine accel=qtest -m 512M \
                     -nodefaults \
                     -device sdhci-pci,sd-spec-version=3 \
                     -device sd-card,drive=mydrive \
                     -drive if=none,index=0,file=null-co://,format=raw,id=mydrive \
                     -qtest stdio -trace sd\* -trace -sdbus_read
  outl 0xcf8 0x80001010
  outl 0xcfc 0xe0000000
  outl 0xcf8 0x80001004
  outw 0xcfc 0x02
  write 0xe000002c 0x1 0x05
  write 0xe000000f 0x1 0x37
  write 0xe000000a 0x1 0x01
  write 0xe000000f 0x1 0x29
  write 0xe000000f 0x1 0x02
  write 0xe000000f 0x1 0x03
  write 0xe000000c 0x1 0x32
  write 0xe000000f 0x1 0x06
  write 0xe0000005 0x1 0x01
  write 0xe0000007 0x1 0x01
  write 0xe0000003 0x1 0x00
  write 0xe000000f 0x1 0x11
  write 0xe000002a 0x1 0x01
  write 0xe000002a 0x1 0x02
  write 0xe000000f 0x1 0x0d
  write 0xe000002a 0x1 0x01
  write 0xe000002a 0x1 0x02
  EOF
  hw/sd/sd.c:1984:15: runtime error: index 256 out of bounds for type 'uint8_t [64]'
  #0 sd_read_byte hw/sd/sd.c:1984:15
  #1 sdbus_read_data hw/sd/core.c:157:23
  #2 sdhci_read_block_from_card hw/sd/sdhci.c:423:9
  #3 sdhci_blkgap_write hw/sd/sdhci.c:1074:13
  #4 sdhci_write hw/sd/sdhci.c:1195:13
  #5 memory_region_write_accessor softmmu/memory.c:492:5
  #6 access_with_adjusted_size softmmu/memory.c:554:18
  #7 memory_region_dispatch_write softmmu/memory.c
  #8 flatview_write_continue softmmu/physmem.c:2778:23
  #9 flatview_write softmmu/physmem.c:2818:14
  #10 address_space_write softmmu/physmem.c:2910:18
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior hw/sd/sd.c:1984:15

Reported-by: Alexander Bulekov <alxndr@bu.edu>
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/487
Buglink: https://bugs.chromium.org/p/oss-fuzz/issues/detail?id=36240
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/sd/sd.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/hw/sd/sd.c b/hw/sd/sd.c
index 807b5d3de3..16d8d52a78 100644
--- a/hw/sd/sd.c
+++ b/hw/sd/sd.c
@@ -1826,6 +1826,12 @@ send_response:
         break;
 
     case sd_r0:
+        /*
+         * Invalid state transition, reset implementation
+         * fields to avoid OOB abuse.
+         */
+        sd->data_start = 0;
+        sd->data_offset = 0;
     case sd_illegal:
         rsplen = 0;
         break;
-- 
2.41.0

