Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp5008531njc;
        Fri, 8 Nov 2024 07:45:04 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCX/yGd7RUEE7uwOJ+TBFJi7Aj9Hew88JiswvTAmRTBsxg7hgrUW9M4gEieoIZ5VUQIGAoyTHwPCVzNGJw==@linaro.org
X-Google-Smtp-Source: AGHT+IEVFLKjsI+DXOlubwx8ThPxJlt1rkZNn9uywEWOnSmDxNZNzmUwAtrZjpqk2eejQszlEMgl
X-Received: by 2002:a05:620a:24d3:b0:7b1:547d:9ba8 with SMTP id af79cd13be357-7b331d8c12fmr385955085a.21.1731080703788;
        Fri, 08 Nov 2024 07:45:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1731080703; cv=none;
        d=google.com; s=arc-20240605;
        b=WbtdN9tSiDg55wkkpQ+7D45/AwpJNQuJCsi1vdh5epWJC/H4twoNW2Jk+b3ewMV0KR
         /F1IJ/u6Y2z2hwryNXFaV1VxZ2kTE0NWwbJgtzbvg2DsTlUeSg7RPYjTTNhPVAAl/INa
         iRBCI/iOjrpkJxMTJ0HGHSvGgvO9MbxRUqlcC65ncoslkGDFFPhV6AsAtvp64tOlhFy6
         DdIbAzBCs/J8vt0PSSzZIKJ9Ivy0EbFocnM3mW1JLd1lDvrWJKddEFi1tIggR4ocyTRH
         5X4GqxfKwpJ2lkGcv/gI5yDaf7151botjWy5O7w6WvGJ/ArBbGN9h+myfDYka8Ra/wJ5
         pArg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0DIqtFDNKbWcFtV6kDPh5+cEk8GapRiCMoHMQdui5B4=;
        fh=BaIoW0KApl0qyRWZzQWhKYdal7G3yPW7ZuWRep9bn1Y=;
        b=gJGg2MFCz/zi/VMCgSLSoJbsTCOQ+n/PtY9ARiH4sY/nbyEPjoGKD3cmeJeA+MVZtI
         S+RyD4Xwjm/Ok338QBuIBqoFrS765wtvYZFtUoDGFJrYy9LhrvTki9lbWj6wO0tQVYBf
         s4qAWdpOtg/qTNQovwAkHWAXVHiP9bFUqbHlp6kRmSSMrXxTiTQCzPuhsrzLOPWkfWfg
         xaHTH50Wh0hnmWi6rF5FcW8wRddhS1vChZ4kioDKnQmXz02n2IMGx1V/hX5X28ZD4nMo
         00HLzGPfxrVkhiyByuDX+DZE5WiaFfhC60yW6mAcDEtbzOvdsiuvqlwp9GB5xul0MNa7
         FHyA==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ITVL3nri;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id af79cd13be357-7b32ad366f0si427547785a.682.2024.11.08.07.45.03
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 08 Nov 2024 07:45:03 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=ITVL3nri;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t9RAP-00066B-Og; Fri, 08 Nov 2024 10:44:57 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t9R9u-0005VD-Cc
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 10:44:31 -0500
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t9R9s-0005fz-Tg
 for qemu-arm@nongnu.org; Fri, 08 Nov 2024 10:44:26 -0500
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-37d63a79bb6so1431943f8f.0
 for <qemu-arm@nongnu.org>; Fri, 08 Nov 2024 07:44:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731080663; x=1731685463; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0DIqtFDNKbWcFtV6kDPh5+cEk8GapRiCMoHMQdui5B4=;
 b=ITVL3nriTHO851mw8m2fAmwiEoAoda4MRgweOJZFPsNOfvukPF46Q/xSjCRZcBprI9
 BRl/o52GodZHZ0sK4Gad/D9W9NrCWwPMzVDMk2j9FFUdOQ5BIWQ25cTXAAznC8iBnOb3
 69RLApZtzggzYP1lh6zTDVA/VuWWdALjKvLYrmIpJswNaJIOnAjwR5Zw9Au9TlvZ9E7q
 0jcvFOFMP+0yoNUgvR1T0eh3u4s6JVrsiEz4JYaWNEMAcyc/7kDQrK9S5xt9VmEh521u
 5hbhP77PAdjOfx16nG6pYIash4tmqV+r1MLL0Rby8+coTqnA2BtnRexRsaUxXnJ+KX3O
 q8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731080663; x=1731685463;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0DIqtFDNKbWcFtV6kDPh5+cEk8GapRiCMoHMQdui5B4=;
 b=I88cu13FkZuhL/G+DXSb2aKgW48yljRHK6a1MrV/1wKor3ThKv7We+WoAeR9+d5BVW
 kaRe8BB2Ghc1mATstW/oQbsxW2zax2ShTqpEf88dVB8SrEpfnD8Hvq6STbtvzHm44lvI
 ZdYo63C1s/jGtWxsCYwzBSXV0N9rstBDVZUW5u36B7fy6924ONd2ZcUd9IJWxCRVg33u
 ux+PufAqINbwFwPQYf0NnhB1rN+MDsliaUX1UeXe+HKqokqiYlsqt21LY+AmB7cbe+15
 IF+eug21eoNi2flE0EsMWM1pt1ca6gHbYpfGZFH0hPULk99YZJjZ12poXNnEO9Cs1AP4
 Yecg==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+gyJVKrJgP3d4qQXOyX64wFiX5xkJ4n7tQYO3MkTEZ5JM4DBoogYocAPV2xevlsB0K/C8hAvFuQ==@nongnu.org
X-Gm-Message-State: AOJu0YyfDnXf3glujNR4zN2/tw8fFDkwjYNWmFEQhULqUR4w4npayd2L
 myU8gz0ErMrAkswckQ8gmKq5aszXfKsvUH/QWSXjaWoZyfDmKqMssOGSq6dSB+c=
X-Received: by 2002:a05:6000:21c8:b0:37d:5129:f45e with SMTP id
 ffacd0b85a97d-381f1721434mr2475433f8f.20.1731080663530; 
 Fri, 08 Nov 2024 07:44:23 -0800 (PST)
Received: from localhost.localdomain ([154.14.63.34])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432b05c0d33sm75414505e9.27.2024.11.08.07.44.21
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Fri, 08 Nov 2024 07:44:22 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org,
	Anton Johansson <anjo@rev.ng>
Cc: Jason Wang <jasowang@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Richard Henderson <richard.henderson@linaro.org>, devel@lists.libvirt.org,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>,
 Thomas Huth <thuth@redhat.com>, qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v3 13/17] target/microblaze: Introduce mo_endian() helper
Date: Fri,  8 Nov 2024 15:43:13 +0000
Message-ID: <20241108154317.12129-14-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241108154317.12129-1-philmd@linaro.org>
References: <20241108154317.12129-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::42c;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x42c.google.com
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
X-TUID: +kwGc7RT75x5

mo_endian() returns the target endianness, currently static.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Richard Henderson <richard.henderson@linaro.org>
---
 target/microblaze/translate.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/target/microblaze/translate.c b/target/microblaze/translate.c
index 86f3c19618..0b466db694 100644
--- a/target/microblaze/translate.c
+++ b/target/microblaze/translate.c
@@ -707,12 +707,17 @@ static void record_unaligned_ess(DisasContext *dc, int rd,
 }
 #endif
 
+static inline MemOp mo_endian(DisasContext *dc)
+{
+    return MO_TE;
+}
+
 static bool do_load(DisasContext *dc, int rd, TCGv addr, MemOp mop,
                     int mem_index, bool rev)
 {
     MemOp size = mop & MO_SIZE;
 
-    mop |= MO_TE;
+    mop |= mo_endian(dc);
 
     /*
      * When doing reverse accesses we need to do two things.
@@ -847,7 +852,8 @@ static bool trans_lwx(DisasContext *dc, arg_typea *arg)
     /* lwx does not throw unaligned access errors, so force alignment */
     tcg_gen_andi_tl(addr, addr, ~3);
 
-    tcg_gen_qemu_ld_i32(cpu_res_val, addr, dc->mem_index, MO_TE | MO_UL);
+    tcg_gen_qemu_ld_i32(cpu_res_val, addr, dc->mem_index,
+                        mo_endian(dc) | MO_UL);
     tcg_gen_mov_tl(cpu_res_addr, addr);
 
     if (arg->rd) {
@@ -864,7 +870,7 @@ static bool do_store(DisasContext *dc, int rd, TCGv addr, MemOp mop,
 {
     MemOp size = mop & MO_SIZE;
 
-    mop |= MO_TE;
+    mop |= mo_endian(dc);
 
     /*
      * When doing reverse accesses we need to do two things.
@@ -1018,7 +1024,7 @@ static bool trans_swx(DisasContext *dc, arg_typea *arg)
 
     tcg_gen_atomic_cmpxchg_i32(tval, cpu_res_addr, cpu_res_val,
                                reg_for_write(dc, arg->rd),
-                               dc->mem_index, MO_TE | MO_UL);
+                               dc->mem_index, mo_endian(dc) | MO_UL);
 
     tcg_gen_brcond_i32(TCG_COND_NE, cpu_res_val, tval, swx_fail);
 
-- 
2.45.2

