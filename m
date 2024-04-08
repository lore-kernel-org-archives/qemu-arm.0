Received: by 2002:a17:906:1c8e:b0:a51:b7b1:b069 with SMTP id g14csp1173802ejh;
        Mon, 8 Apr 2024 03:27:53 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCWN/tflNWJjCBe97JPstKqpFBgv51td3dGu4W8q3cIQSKFwzZnwvL3yM1CR+9FqcDqvlBi+Xr37EZGrOCFwdhBwv3+1hRk1
X-Google-Smtp-Source: AGHT+IFDhnjPBz4XUTwlQ7eFrmGwTxZnGFWTtk7IUejL/0G/LR89+56PfWrZVLdSt8/e/PMJcT5W
X-Received: by 2002:a05:622a:2993:b0:434:b3f7:ed94 with SMTP id hd19-20020a05622a299300b00434b3f7ed94mr863964qtb.30.1712572073252;
        Mon, 08 Apr 2024 03:27:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1712572073; cv=none;
        d=google.com; s=arc-20160816;
        b=rUKYjUNtr5Q9bngWFQ9KDLohHis/QgvnqbpZFrgvKWjQWeRCNbeBDdUwYawjQ1lQKh
         b3XxKUOuiIb+rjb2MR1CA/fYo39dPDbR7wQ8K0Yk60cmRw4zW8IjfFskt1nlS/aP25pD
         U1J6eGJ3K7tUn/onDAKIX0agP4mAlD2rJD65mvgQYizBE2dgDhtB0wD/twpltNz16jaY
         aFRuOy/OeXrUWfmj61WZ7ClZziCtVrrBbbd428Ir+2sL5wkipwkxvv6i3muuBm6aaogL
         ta+/n37zVht5phNN9MM29llCqfPTdrqSqdQ3udMPzW+7UH465rF3MXue8pEvf++uqQTh
         zWRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:message-id:date:subject:cc:to:from:dkim-signature;
        bh=yxgeT6sGz2Hwa500oxeqpnpagOxlNk9XL0DEkKLleWU=;
        fh=phuGYVVzcgXBQBZqmCZV0QRby78FpmmZ8hn2Ai6iE4E=;
        b=JMFM006zcJPOsvhDndf1ihh2YAj1tMmiWKpsMPlMedftvG1Qfxz2RUUqWmGmypH7/3
         UwBRJU5BFNK5JQZNbXEj1tz6dqSiEuzPkHROV7gsVnn/pvha9hFM+HGbmCr186ZIFVH4
         +ZhmMi2s6NLOocTse76hKrKlIWE0oSW+e6W5SPGia9VHngH8OmVZsGyHqL5N59x+pIgb
         yeSCva8JLkXy/rHoVK0Lr9YFUixxbogin0PJdI0zpM1Fj1ScdKDZFtjbE9vfGqt+WKgj
         DbOE5qgIVdNT8B+nQy9H8g6aAvcL2p1+VXOHvSf80iLdgu+g0CdctKP5VhVRLz+yE/wa
         4BYA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ce+1WVXB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id a1-20020a05622a02c100b004346f3bd8d0si5333838qtx.94.2024.04.08.03.27.53
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 08 Apr 2024 03:27:53 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=Ce+1WVXB;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rtmDg-0005zM-IS; Mon, 08 Apr 2024 06:27:20 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rtmDd-0005ya-OM
 for qemu-arm@nongnu.org; Mon, 08 Apr 2024 06:27:17 -0400
Received: from mail-ed1-x529.google.com ([2a00:1450:4864:20::529])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rtmDb-0003uz-Sr
 for qemu-arm@nongnu.org; Mon, 08 Apr 2024 06:27:17 -0400
Received: by mail-ed1-x529.google.com with SMTP id
 4fb4d7f45d1cf-56e56ee8d5cso1217341a12.2
 for <qemu-arm@nongnu.org>; Mon, 08 Apr 2024 03:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712572034; x=1713176834; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yxgeT6sGz2Hwa500oxeqpnpagOxlNk9XL0DEkKLleWU=;
 b=Ce+1WVXBgYSiy/WyLZVwqB/cVQbmitH/1QEy15ux7qTj7TlxbP+WhY3LbRy0YgIIbd
 Y4UoCen+0CWKE+AwC63N6h3665Hu61YCkojw0H9kZPu+zELlRpfC5UNKYYVlV1W+gD1X
 ypchOhor7TJdAJ/u7O6G9lN+oQA2WbXePD5C7SRyA6Tskp5Gx5N4Xa3pJogOzBu/bmr7
 RKcG+a2ks1hs1jmTpCX9lXzmCPW8wv9R5NJbnfG7iPfqIjNTHwxpQrmIN+1QaQHRdUF2
 TwwvPtt2i5Q1YHs1j/hpXpW2GIDrAssvJQorPQ+p2rs+A05hcwhIC/ev9COQ6nOu0NES
 EV6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712572034; x=1713176834;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yxgeT6sGz2Hwa500oxeqpnpagOxlNk9XL0DEkKLleWU=;
 b=tHOxidH6aaA7TPr7WLUeF4V+wd6057cCO2H2Dxt2NX95A+3iREPYiSgo9dDU1fkji8
 dLAiCnPO4p8ix8zyIb18yyo316wOHuLE98ybHIC2eRrswlt5aywL+isPoOXWFlfq6ivG
 nD1xC3DpcZo5tf1YA+6ghKABImXnxdZ3SWw4mSJQbsADcIig2TkZQQ+6VSyY6wcSvIS3
 ZpCOCwvj6Q4qvoV09rOppXP/ucRlfdxySBYzghsFmyPWVPRX13MqcHqNRVQiOlyzJVS/
 q6pIBqFllbjkkiZC67kIRpCJ8CnvPGXeudyUsb2av15E8f9Rn7LDw6u2jIuMHFqAeQxU
 dH3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzPh5ElL43L13pJL70WOJuHv+Cggsmjp995cZVN8gMHCAsduo7Ckg7dpfVYdiOFyE9+94IecHLOdKV0qbxLmM4d0T4
X-Gm-Message-State: AOJu0Yx3YWw6hnG8rPC9xnrYmwIcvgMnrKpqrPGqJNVXl1oxu/2C6It1
 lNU8vrC7G/xqW6JZE3XICWsBeCn6p4yGXeXjAq/UTN3m9OwZKnav6kDyTCxw3a0=
X-Received: by 2002:a50:c358:0:b0:56e:6d9:7bd6 with SMTP id
 q24-20020a50c358000000b0056e06d97bd6mr7471031edb.34.1712572033967; 
 Mon, 08 Apr 2024 03:27:13 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.144.67])
 by smtp.gmail.com with ESMTPSA id
 u17-20020aa7d0d1000000b0056e4a626ff2sm2206884edo.10.2024.04.08.03.27.12
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 08 Apr 2024 03:27:13 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: Alexander Bulekov <alxndr@bu.edu>, qemu-arm@nongnu.org,
 Jason Wang <jasowang@redhat.com>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0?] hw/net/smc91c111: Fix out of bounds access in
 packets buffer
Date: Mon,  8 Apr 2024 12:27:11 +0200
Message-ID: <20240408102711.58485-1-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::529;
 envelope-from=philmd@linaro.org; helo=mail-ed1-x529.google.com
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
X-TUID: hyLv9UMtMc8c

While the Packet Number Register is 6-bit wide and could hold
up to 64 packets [*] our implementation is clamped at 4 packets.

Reproducer:

  $ cat << EOF | qemu-system-arm -display none \
                                 -machine mainstone,accel=qtest \
                                 -qtest stdio
  outl 0xcf8 0x80000010
  outl 0xcfc 0x10000300
  outl 0xcf8 0x80000004
  outl 0xcfc 0x07
  writel 0x1000030c 0x66027cd6
  writel 0x10000300 0x64af8eda
  readw 0x10000308
  EOF
  hw/net/smc91c111.c:607:24: runtime error:
  index 175 out of bounds for type 'uint8_t[4][2048]' (aka 'unsigned char[4][2048]')
  SUMMARY: UndefinedBehaviorSanitizer: undefined-behavior
  =================================================================
  ==397944==ERROR: AddressSanitizer: SEGV on unknown address 0x629000077db4
      (pc 0x56272aed3b8d bp 0x7ffd1471f290 sp 0x7ffd1471ea20 T0)
  ==397944==The signal is caused by a READ memory access.
      #0 0x56272aed3b8d in smc91c111_readb hw/net/smc91c111.c:607:24
      #1 0x56272aecfd61 in smc91c111_readfn hw/net/smc91c111.c:650:16
      #2 0x56272d4b228b in memory_region_read_accessor system/memory.c:445:11
      #3 0x56272d46fb85 in access_with_adjusted_size system/memory.c:573:18
      #4 0x56272d46c58e in memory_region_dispatch_read1 system/memory.c:1426:16
      #5 0x56272d46bcd7 in memory_region_dispatch_read system/memory.c:1459:9
      #6 0x56272d4e8e03 in flatview_read_continue_step system/physmem.c:2794:18
      #7 0x56272d4e871e in flatview_read_continue system/physmem.c:2835:19
      #8 0x56272d4e98b8 in flatview_read system/physmem.c:2865:12
      #9 0x56272d4e9388 in address_space_read_full system/physmem.c:2878:18
      #10 0x56272d6e7840 in address_space_read include/exec/memory.h:3026:18
      ...

Broken since model introduction in commit 80337b66a8.

[*] LAN91C111 DS00002276A.pdf, chapter 8.17, Packet Number Register

Reported-by: Will Lester
Resolves: https://gitlab.com/qemu-project/qemu/-/issues/2268
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/net/smc91c111.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/net/smc91c111.c b/hw/net/smc91c111.c
index 702d0e8e83..286298bf06 100644
--- a/hw/net/smc91c111.c
+++ b/hw/net/smc91c111.c
@@ -429,7 +429,7 @@ static void smc91c111_writeb(void *opaque, hwaddr offset,
             /* Ignore.  */
             return;
         case 2: /* Packet Number Register */
-            s->packet_num = value;
+            s->packet_num = value & (NUM_PACKETS - 1);
             return;
         case 3: case 4: case 5:
             /* Should be readonly, but linux writes to them anyway. Ignore.  */
-- 
2.41.0

