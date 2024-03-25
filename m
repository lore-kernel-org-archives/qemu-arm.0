Received: by 2002:a17:906:f85:b0:a47:c39e:cbe with SMTP id q5csp775324ejj;
        Mon, 25 Mar 2024 08:29:32 -0700 (PDT)
X-Forwarded-Encrypted: i=2; AJvYcCXI35CwK6zUsl32Dymxrx3/0MXcryf9ebnRycCvbd3Mdvxm9Cy7JIGo7uDBNmCOm9msWAzstIDUSr0g5lT9itVqEUTEgrOf
X-Google-Smtp-Source: AGHT+IG9RfI/+t5a4l19XSokkxdMarTEdXfM50SdRChSlOAxd84tPwlOfsN/349dQ3kVrfBD4kLe
X-Received: by 2002:a05:6122:4d1a:b0:4d3:45a2:ae4f with SMTP id fi26-20020a0561224d1a00b004d345a2ae4fmr4864373vkb.14.1711380571967;
        Mon, 25 Mar 2024 08:29:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1711380571; cv=none;
        d=google.com; s=arc-20160816;
        b=soGaIwR5niRskquBYqRDiVyPj5FTCRv1pZLH+0iJdwMjMv5O64Ii3sQ2nlQrU2yVJc
         idPGbSYI/ftcZ5wF7a1vfbCK2ENQPWbJgPbZqH2hBzZek5+DmY97sux5zcR34/QFu868
         FgQ3evF145qj4ZZCjGkqpU/uN97nBRXySrLoEImSS0CieQF8hLFzEvto/v2jNzwv0TQA
         C02A4JZKZ2I8+XdfSP225Dj7ds5x3trSXTQ0BOXay74N5dEOZBEUlVjNL+ZkxSkLuOm+
         4oeK0yPMNfLIU+PbhJIhZTNk7lnQxPY2mikAF7ekkT2KpCJINklCiO7czIu9opCB3nq5
         g6/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20160816;
        h=sender:errors-to:list-subscribe:list-help:list-post:list-archive
         :list-unsubscribe:list-id:precedence:content-transfer-encoding
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:dkim-signature;
        bh=egg5Mtyn99cCwmy/P18xKwdXOjmaICInZ6LaE2Awphc=;
        fh=MCfJsNdvaHEMkygknGntpY09G2eWMyLylHmwHeXodmE=;
        b=O8cBaeXVrHp0Nf3dRG/LtapKLRFsk7F3YwR1zoutuASGc5S7vg192jLbExhdImmyk4
         ccd5HuhFq3GKDYRnyS4sBim7/KwbDKUVy9eLmm2kPbjBR9pfzyr4EQ2FP7MgDF9d57b0
         W89WEa7GhIMGJgf2j6NNTKyON5705Mnmf0ZyICz3KFDPOT/V6M2vdrNVERUJcQmliWHp
         OGAizUvKsJU0r+chKCo15QTBPHnxkmUSphQbIa42x0mbKkzeHTNas/Gr7Sz7zig3f8NE
         b5tCmNdJyJJDEx5wxsLn3c1ZAMIC3xkr+OjrYvVNDHfG1ES+xW0U+qM0hrtocg7esgwQ
         z0Mw==;
        dara=google.com
ARC-Authentication-Results: i=1; mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QAoft+Zp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Return-Path: <qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org>
Received: from lists.gnu.org (lists.gnu.org. [209.51.188.17])
        by mx.google.com with ESMTPS id u11-20020a0562141c0b00b00690b67ee92asi8107126qvc.460.2024.03.25.08.29.31
        for <alex.bennee@linaro.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 25 Mar 2024 08:29:31 -0700 (PDT)
Received-SPF: pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) client-ip=209.51.188.17;
Authentication-Results: mx.google.com;
       dkim=pass header.i=@linaro.org header.s=google header.b=QAoft+Zp;
       spf=pass (google.com: domain of qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org designates 209.51.188.17 as permitted sender) smtp.mailfrom="qemu-arm-bounces+alex.bennee=linaro.org@nongnu.org";
       dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from localhost ([::1] helo=lists1p.gnu.org)
	by lists.gnu.org with esmtp (Exim 4.90_1)
	(envelope-from <qemu-arm-bounces@nongnu.org>)
	id 1romFn-0002lR-IV; Mon, 25 Mar 2024 11:28:51 -0400
Received: from eggs.gnu.org ([2001:470:142:3::10])
 by lists.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_256_GCM_SHA384:256)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1romFm-0002l5-RN
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 11:28:50 -0400
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
 by eggs.gnu.org with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
 (Exim 4.90_1) (envelope-from <philmd@linaro.org>) id 1romFl-0000Fp-Eb
 for qemu-arm@nongnu.org; Mon, 25 Mar 2024 11:28:50 -0400
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-414859830f2so10021805e9.0
 for <qemu-arm@nongnu.org>; Mon, 25 Mar 2024 08:28:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711380527; x=1711985327; darn=nongnu.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=egg5Mtyn99cCwmy/P18xKwdXOjmaICInZ6LaE2Awphc=;
 b=QAoft+ZpjFuEqdkyjeyCnyG/tB7/55Q5ZnGyqVwppwa2xdKm+ZDMzSxhIXs8t0o4SB
 yUmzcikKumFABwufuHZO/6db4qZNk7pD3rPHt0BA2AVDn+rqTewJ7Fh0dj3AQC488KhB
 aapV0dojbhBoXFZ6n9Y5GvlwR6SflnOmSOa5IF7iTsn6yk8704K9QwjrS3fTEQKXl1nm
 xrn/cBfMV7JALe7RtABz+s8ewZbLHVKd/5Evpk7gp72vxa8B61kqZJodjDX6U1d8iIZV
 eWSicqIk+1DJxVtzkMw5PGlqbz0BrspjgsRfdxm2sK+TCKaU9CD0UdGrED3Oo3WZA3Ow
 00Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711380527; x=1711985327;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=egg5Mtyn99cCwmy/P18xKwdXOjmaICInZ6LaE2Awphc=;
 b=sXsU++ejvs9LW2B+T681/o3BmFEXlHMRZKIOsKCivXqSmKV9rWNu1hkIu4W9z6nV9V
 qDVprraS2xDYMfzvYWrS13Vzjs2ti3Eg0VkIj/+hrB5HRUOAMGe+t5CYNIFCVeD8SrzL
 gYVni5tFVk1vkgzKOheK+KhzbYFqdDqA3RHZraNT5sq5Px2/e5VUGF0bvDVbJYteVbDK
 Omch7JdCXOY7iYSm6ss0c1t2P0kl81xuBhEIGWUFPg+lf+fPGpPRzWPwpcc+XQE2z8ih
 rujkqdK8nvYm9r2BY32HAwCMGjW7FHrmZEwfL8tfVVdXrVOJcMo5gBbTVwX+FaE0yayS
 nQhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW5hKCu/B/CHCs+1/h2WzR0lLABVmE6ZZ+RAjgC83BQ7ubngpqIYoLuP+IThBTZmhQ9heqBoEBVhI7SRAYLNgC3bd5d
X-Gm-Message-State: AOJu0Yytd2COBB+pbUs/PCC7dC9ztnTdM4O/Yi8m/+PC+8XLg/Igbe3v
 6gnA2gqukyJbEcZMypHSbdN6ELsqWXShAy4l6knAya0VHY4BwZgPGo+uyQtPnHA=
X-Received: by 2002:a05:600c:4f01:b0:414:8948:621c with SMTP id
 l1-20020a05600c4f0100b004148948621cmr2566601wmq.8.1711380527317; 
 Mon, 25 Mar 2024 08:28:47 -0700 (PDT)
Received: from m1x-phil.lan ([176.187.208.214])
 by smtp.gmail.com with ESMTPSA id
 j28-20020a05600c1c1c00b004146c769c79sm8799861wms.0.2024.03.25.08.28.46
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 25 Mar 2024 08:28:46 -0700 (PDT)
From: =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
To: qemu-devel@nongnu.org
Cc: =?UTF-8?q?In=C3=A8s=20Varhol?= <ines.varhol@telecom-paris.fr>,
 Alistair Francis <alistair@alistair23.me>, qemu-arm@nongnu.org,
 Arnaud Minier <arnaud.minier@telecom-paris.fr>,
 Damien Hedde <damien.hedde@dahe.fr>,
 Peter Maydell <peter.maydell@linaro.org>, Luc Michel <luc@lmichel.fr>,
 =?UTF-8?q?Philippe=20Mathieu-Daud=C3=A9?= <philmd@linaro.org>
Subject: [PATCH-for-9.0 v3 3/3] hw/misc/stm32l4x5_rcc: Propagate period when
 enabling a clock
Date: Mon, 25 Mar 2024 16:28:26 +0100
Message-ID: <20240325152827.73817-4-philmd@linaro.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20240325152827.73817-1-philmd@linaro.org>
References: <20240325152827.73817-1-philmd@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Received-SPF: pass client-ip=2a00:1450:4864:20::32f;
 envelope-from=philmd@linaro.org; helo=mail-wm1-x32f.google.com
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
X-TUID: 2Jh6fkzfRPZG

From: Arnaud Minier <arnaud.minier@telecom-paris.fr>

The "clock_set_mul_div" function doesn't propagate the clock period
to the children if it is changed (e.g. by enabling/disabling a clock
multiplexer).
This was overlooked during the implementation due to late changes.

This commit propagates the change if the multiplier or divider changes.

Fixes: ec7d83acbd ("hw/misc/stm32l4x5_rcc: Add an internal clock multiplexer object")
Signed-off-by: Arnaud Minier <arnaud.minier@telecom-paris.fr>
Signed-off-by: Inès Varhol <ines.varhol@telecom-paris.fr>
Message-ID: <20240317103918.44375-2-arnaud.minier@telecom-paris.fr>
[PMD: Check clock_set_mul_div() return value]
Signed-off-by: Philippe Mathieu-Daudé <philmd@linaro.org>
---
 hw/misc/stm32l4x5_rcc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/hw/misc/stm32l4x5_rcc.c b/hw/misc/stm32l4x5_rcc.c
index 49b90afdf0..ed2dbd9dc3 100644
--- a/hw/misc/stm32l4x5_rcc.c
+++ b/hw/misc/stm32l4x5_rcc.c
@@ -61,7 +61,7 @@ static void clock_mux_update(RccClockMuxState *mux, bool bypass_source)
         freq_multiplier = mux->divider;
     }
 
-    clock_set_mul_div(mux->out, freq_multiplier, mux->multiplier);
+    clk_changed |= clock_set_mul_div(mux->out, freq_multiplier, mux->multiplier);
     clk_changed |= clock_set(mux->out, clock_get(current_source));
     if (clk_changed) {
         clock_propagate(mux->out);
-- 
2.41.0

