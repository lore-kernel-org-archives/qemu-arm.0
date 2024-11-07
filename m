Received: by 2002:a17:505:610b:b0:1be9:327d:8ee3 with SMTP id tt11csp3911051njc;
        Wed, 6 Nov 2024 17:25:29 -0800 (PST)
X-Forwarded-Encrypted: i=2; AJvYcCWFKEhl3Ng/XC9a9Zb/PzodSUjEDTLjFh5bwTNTn3YqybCHdwOnvCtK7F2MD6cp6wsYWJYkv3099TnUdg==@linaro.org
X-Google-Smtp-Source: AGHT+IHP9/RU8HteOCIf51owOlhRmGF1Pv/yCCSgX2Kc1/Lwux7rYZmdM17VCMCMMpM1pjfVktp5
X-Received: by 2002:a05:622a:1a93:b0:462:b7c9:10e with SMTP id d75a77b69052e-462fb6ac274mr24829071cf.13.1730942729220;
        Wed, 06 Nov 2024 17:25:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1730942729; cv=none;
        d=google.com; s=arc-20240605;
        b=hNKVcOY2GOCDskbOtTYAziVcww7UeosnS2HpFZkqmehl1WkFJZpjEI06ZGg/oXRB4f
         0KP2XKThN3NZiHZCizn4gHCQtnvtZqhRNFStMhUXMqE+qnuKCOZWKyjuDdD1r7mnCQdP
         c3x96rT15gl1trgy8VZo8MUUhDdUV/WyCGu+doQnw4uemqpCtLXPlDnMszAkZtaBAMhl
         dY3JLtYBNUtbl55MKvVm3g7iUWTfyTfHMLQZMbky5qBxpz2UQhK+6mPpekB4Grlg3itN
         lly+MaU5Nz3sxuo+yV2lSm+E66yzpe6dZTDqQIeYcP6lqZTKRIUL8MrOCWtejZZSSpGL
         MuHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=0DIqtFDNKbWcFtV6kDPh5+cEk8GapRiCMoHMQdui5B4=;
        fh=BYa/RnwOsP9V+Ylu7OWAPD4njRfTaBe7RB37AhbusBI=;
        b=bDZP5VBaICP4OvkAhrdEhqlhh9o0PmYVtdVE7Dgr6h2GJofi3bkogp32tso9fZvRSC
         sf0TibfU9JkmUcJWP+oM4F5Ln6gDVzoZPkUeb2p59JdAk3UbXRo3Pc93rBrbrs8IjN4f
         TgyEIF72kUzdTOjAP2JwuYpN6FtDLvkRZQIMmAJ+ANXX7bB5lD3bxHChz1Sj5ZmZrcFQ
         NuhQmy6uIFPHzP4WvpVYBuiF067LYT/byK2HooNjujSvzGz4jqr5eZoomGY7IgR1YbqY
         CIs1IjxCKdgPOt0UyO8wInq5WgAFQ1iL3SE57XrvcFpTGsgddroeMEIV7VDqhVEFulia
         yuDw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UD+kb1jF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id d75a77b69052e-462ff5c8a72si2721311cf.357.2024.11.06.17.25.29
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 06 Nov 2024 17:25:29 -0800 (PST)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=UD+kb1jF;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org;
       dara=neutral header.i=@linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1t8rFh-0006SL-75; Wed, 06 Nov 2024 20:24:01 -0500
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8rFS-00060F-8P
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 20:23:46 -0500
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1t8rFQ-0003CZ-6u
 for qemu-arm@nongnu.org; Wed, 06 Nov 2024 20:23:46 -0500
Received: by mail-wm1-x32b.google.com with SMTP id
 5b1f17b1804b1-43167ff0f91so3977785e9.1
 for <qemu-arm@nongnu.org>; Wed, 06 Nov 2024 17:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1730942622; x=1731547422; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0DIqtFDNKbWcFtV6kDPh5+cEk8GapRiCMoHMQdui5B4=;
 b=UD+kb1jFo2rYPBChAU716C1OJSU1iCMbZn4AxJF7S8p9pHZ+PWBcHJGyUK5RcqN7Jn
 zBSkOEf+4JsGgaP39lcG/Gsq4+8ZqTbee4SVM0WsBi7YD6GEC6C3NGNWfQ+TeuBiHKJr
 qfIAOQZquyXPeJNzpx4DPvWOn9FOG/EBcZuGFaNVV5j7R4dU7BcoqOFm9y1b4qyvHIng
 TJXd9C8QjEPVs8ZJXjIUUw0vl4XwbnrHGn6RX5vA2Oj7dPFN8n7ReerdshJQa2UVY69Q
 4sArj90fK9vJ+nZ478OKHcizZGV9RifjfCsJJpNjFMxcsXBVhNefFY3Evf9ra7UQg4RO
 aCDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730942622; x=1731547422;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0DIqtFDNKbWcFtV6kDPh5+cEk8GapRiCMoHMQdui5B4=;
 b=j/u2a/u7eoODvZGpjZB9YCu/SgRL42VmInkmCb64xd9kRcVPATkhnQjv5sUsnGiozX
 WwKOFws2ji0oBoI9FIFj61L/vOAVI6uURwxjTqxGOuqnWroBjnAXVqtmNAiy6n91+ykA
 9oWqCyBvRBSg8Z8qagOwGEOxk6CFW0Q1RrrBzJVZu03ABqXm1kZSywNehitcn52l1/rC
 /++vBEYOnNx4xnTgwy48R+LIg23+P6O2PNXeXwvUWS/dglhNLRLPlIovPX2f5EQPCb4X
 p8uPs1pp/PFTKdro0+TGRJTIU1kSK2gzOJXtCC+QUbhsBxzengyOhQSmBm05Y7W5dbOv
 4Jcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWe4149yCPHEGN7Lh9UkFIAZIHCScHCtrs+VaOUZTHokXdWNHjqOTJBJBQhrTzC6ec4kO63DfI08w==@nongnu.org
X-Gm-Message-State: AOJu0Yzqfoz8N8PgX7zth461vRBRu0h3iku5fr+KNFN/X24u3nCt3UEl
 4o77we3hbFCWdt5nsX5mrwN8ucft7BZwAJnl72t4Goe+AkbhWnNaXlv8JOtG1UA=
X-Received: by 2002:a05:600c:4e90:b0:431:7c78:b885 with SMTP id
 5b1f17b1804b1-432b14b8c40mr1462805e9.4.1730942621980; 
 Wed, 06 Nov 2024 17:23:41 -0800 (PST)
Received: from localhost.localdomain ([154.14.63.34])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-432aa6c1205sm43977185e9.26.2024.11.06.17.23.39
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Wed, 06 Nov 2024 17:23:41 -0800 (PST)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: Anton Johansson <anjo@rev.ng>,
	qemu-devel@nongnu.org
Cc: Paolo Bonzini <pbonzini@redhat.com>, Thomas Huth <thuth@redhat.com>,
 Jason Wang <jasowang@redhat.com>, devel@lists.libvirt.org,
 qemu-ppc@nongnu.org, Alistair Francis <alistair@alistair23.me>,
 =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@redhat.com>,
 "Edgar E. Iglesias" <edgar.iglesias@gmail.com>, qemu-arm@nongnu.org,
 Peter Maydell <peter.maydell@linaro.org>,
 Richard Henderson <richard.henderson@linaro.org>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH v2 12/16] target/microblaze: Introduce mo_endian() helper
Date: Thu,  7 Nov 2024 01:22:18 +0000
Message-ID: <20241107012223.94337-13-philmd@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20241107012223.94337-1-philmd@linaro.org>
References: <20241107012223.94337-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32b;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32b.google.com
X-Spam_score_int: -20
X-Spam_score: -2.1
X-Spam_bar: --
X-Spam_report: (-2.1 / 5.0 requ) BAYES_00=-1.9, DKIM_SIGNED=0.1,
 DKIM_VALID=-0.1, DKIM_VALID_AU=-0.1, DKIM_VALID_EF=-0.1,
 RCVD_IN_DNSWL_NONE=-0.0001, SPF_HELO_NONE=0.001,
 SPF_PASS=-0.001 autolearn=unavailable autolearn_force=no
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
X-TUID: 7DAoNrtTu1Cf

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

