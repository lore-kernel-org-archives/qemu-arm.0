Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp1432863ejj;
        Tue, 26 Mar 2024 08:46:34 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCX/ep06rymdKO0JK7U/iBNgYr4kY37RA/w2ZH2OWzWxWjlYAYKk/UXO+ycfTVygp28/clz+nLw0w3pshQD/AlhGRZ6lxvdF
X-Google-Smtp-Source: AGHT+IECXKsO/MakUi380TnhFLan+Thv2LgKWFs53nbuOScB9L3ZEfNff8s6rmsQ3tllNjcFKesC
X-Received: by 2002:ac8:5846:0:b0:431:756c:37aa with SMTP id h6-20020ac85846000000b00431756c37aamr1659598qth.33.1711467994468;
        Tue, 26 Mar 2024 08:46:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711467994; cv=none;
        d=google.com; s=arc-20160816;
        b=zYcs/xwNi+ZaeID67zOEFIFe27x9D04pi4BNsFIGbcjljUqMry5XjvagyPN77M4gNF
         NgonuxOPtKah/qXJN0MWFU8UdfV35MOA2vLqsKgSoafzgW/9mjYlXfFul2i7FEr0TW7a
         9wNdyAgn2zcJBIBlI5lJtfY7j8yE2ll8VT22fg02BqDuJP+diQbWlowpPSQ/eeS2sx95
         hphtWwm8UbqCZMxODt+MoHCaXLRedzI8MFR8+dPmb6sksLNok54gpHwmgeh5wnd6nUB1
         Agj9pykjn+LbwNx4r7DGOJvBBBeYee5p165KJKTB03Hmt6zgW7/k8JU010W3HWfaDHEf
         RlLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=nd+vMuVqiQfFDX5tDq7mwgsep0f8/HZ19ER+KJLjK2g=;
        fh=Ct4hQfFcIb7hmG/H697AYDBgL2fIgZZokB/k4Sw3gpE=;
        b=KPUB7FQpa6iP76/3dXmfLECL6SFwPOfcRZQuySbLD0iJAyaqp/GHGragu14cOob7m3
         6YHPcrRpgmcJGYh/976GYgC/flhd2egDfnNK5anDd1C+j5q2/4/JQSjoFTqAL/Fud5GE
         6H50pdBpNSehOIXR8mLoip4xsYOcWIvXuxKWGQvjrSHnYu+8S/r6qmkci2VwnN3bMgfG
         0rMuVcZweMkRL3s5VPd6zK/5v0egaxFfneANep+0PC19vvgUt6cPXQAi1ylQvIf2zOc4
         v25ORjvu5cOT19JzsfyJJ4l3MpJsHCVy5VtPZrQpkKRZTtl587xuzx9Kocp8gyJi6nY7
         sH7A==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nYUTXbzf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id bv26-20020a05622a0a1a00b0042ef866aeaesi8106379qtb.794.2024.03.26.08.46.34
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 26 Mar 2024 08:46:34 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=nYUTXbzf;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1rp8zi-0003nM-SB; Tue, 26 Mar 2024 11:45:47 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp8zi-0003mv-0U
 for qemu-arm@nongnu.org; Tue, 26 Mar 2024 11:45:46 -0400
Received: from mail-wr1-x435.google.com ([2a00:1450:4864:20::435])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1rp8zg-0001CI-B5
 for qemu-arm@nongnu.org; Tue, 26 Mar 2024 11:45:45 -0400
Received: by mail-wr1-x435.google.com with SMTP id
 ffacd0b85a97d-33ed5b6bf59so4067080f8f.0
 for <qemu-arm@nongnu.org>; Tue, 26 Mar 2024 08:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711467943; x=1712072743; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nd+vMuVqiQfFDX5tDq7mwgsep0f8/HZ19ER+KJLjK2g=;
 b=nYUTXbzftBbnz39vmhFeITOPBmZR3OBT8VW3eTXivuz31s4KXPXsKqf0tGrNzbeE7u
 xqZSCpoIuml6KAW2Qe9z5jNezhSwzAflLYtqv53IRMb4nyJRjyyrD4IoCnvI6PHe8GFP
 JSv9u9gefjLYkEeOBkViKGzmdCYxRPBO3SrtyGkaYJuAzs2pM2xps0edXOom9/sZVlmk
 AyO+boVKBYkcsBixmc9x3UR5BAidimx7AZnRGyG/zDe0yzYWdAqX3ckFnx04bjXEGNEo
 w819Sy7tnuJHhuoBZAX6WqHzIIi/qTXu2LXz+uoxRa7j0p/11/FPKrQefonOPUSxWq/r
 ZT/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711467943; x=1712072743;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nd+vMuVqiQfFDX5tDq7mwgsep0f8/HZ19ER+KJLjK2g=;
 b=vcjRYQXNL0acm/A+hrOz+F3KV/T6Pav6S1Jadq8rQgO0rs2rATZmv0x7JBQbKpgCwh
 jLrLIUtI5UCtWLZBuaivooN6oKdX+Ocr4dif+9U63kxd5JW08QmXujHyDJKISuxryXkt
 XJocU7OzrrgzqK/wiQo2ugvBKy8+bAR12iKTLK+OMYrqdDVrSIV4m7hVc75FzPBU/Cod
 TgE8N8BVriB5iQrmy39FRUnyFD+EWtWN2s/leNnPXrIHqgOzXmjk1JIinG9OI7P3Hhts
 l0PwdSDSGl2OSAheNJfv8jiNuG/rkIBI90f89MLaWPHt+ikGJVTxbmViLJ1KJ41MJUKd
 T3mg==
X-Gm-Message-State: AOJu0Yw7jNaI0hWsN1KC8q+zuztqNJyL32TbIbBiw3nKnG5o04+V/gOK
 YHLaZm0mBh7a6S8YJTaBUoGQejfKS+upTXG9QM/bEadysYdj2eWcMTajSbeI7bM=
X-Received: by 2002:a5d:4c4f:0:b0:341:8efd:e206 with SMTP id
 n15-20020a5d4c4f000000b003418efde206mr1223655wrt.38.1711467942916; 
 Tue, 26 Mar 2024 08:45:42 -0700 (PDT)
Received: from m1x-phil.lan ([176.176.155.229])
 by smtp.gmail.com with ESMTPSA id
 i5-20020a5d5585000000b0033ed7181fd1sm12471970wrv.62.2024.03.26.08.45.41
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Tue, 26 Mar 2024 08:45:42 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: qemu-arm@nongnu.org, qemu-ppc@nongnu.org,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>,
 Alistair Francis <alistair.francis@wdc.com>,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>
Subject: [PULL 06/13] hw/misc/stm32l4x5_rcc: Inline clock_update() in
 clock_mux_update()
Date: Tue, 26 Mar 2024 16:44:57 +0100
Message-ID: <20240326154505.8300-7-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240326154505.8300-1-philmd@linaro.org>
References: <20240326154505.8300-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::435;
 envelope-from=philmd@linaro.org; helo=mail-wr1-x435.google.com
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
X-TUID: /mVYpiEFXm+s

Trivial inlining in preliminary patch to make the next
one easier to review.

Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Message-Id: <20240325152827.73817-3-philmd@linaro.org>
---
 hw/misc/stm32l4x5_rcc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/hw/misc/stm32l4x5_rcc.c b/hw/misc/stm32l4x5_rcc.c
index bc2d63528b..49b90afdf0 100644
--- a/hw/misc/stm32l4x5_rcc.c
+++ b/hw/misc/stm32l4x5_rcc.c
@@ -48,6 +48,8 @@ static void clock_mux_update(RccClockMuxState *mux, bool bypass_source)
     uint64_t src_freq;
     Clock *current_source = mux->srcs[mux->src];
     uint32_t freq_multiplier = 0;
+    bool clk_changed = false;
+
     /*
      * To avoid rounding errors, we use the clock period instead of the
      * frequency.
@@ -60,7 +62,10 @@ static void clock_mux_update(RccClockMuxState *mux, bool bypass_source)
     }
 
     clock_set_mul_div(mux->out, freq_multiplier, mux->multiplier);
-    clock_update(mux->out, clock_get(current_source));
+    clk_changed |= clock_set(mux->out, clock_get(current_source));
+    if (clk_changed) {
+        clock_propagate(mux->out);
+    }
 
     src_freq = clock_get_hz(current_source);
     /* TODO: can we simply detect if the config changed so that we reduce log spam ? */
-- 
2.41.0

